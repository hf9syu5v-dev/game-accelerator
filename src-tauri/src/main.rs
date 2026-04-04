#![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::env;
use std::fs;
use std::path::PathBuf;
use std::process::{Child, Command};
use std::sync::Mutex;
use tauri::State;

#[derive(Deserialize, Serialize, Debug)]
struct ProxyConfig {
    server: String,
    port: u16,
    password: String,
    up_mbps: u32,
    down_mbps: u32,
}

struct AppState {
    singbox_process: Mutex<Option<Child>>,
}

fn get_base_dir() -> PathBuf {
    env::current_dir().unwrap_or_else(|_| PathBuf::from("."))
}

#[tauri::command]
fn start_proxy(config: ProxyConfig, state: State<'_, AppState>) -> Result<String, String> {
    let mut process_guard = state.singbox_process.lock().unwrap();

    if let Some(mut child) = process_guard.take() {
        let _ = child.kill();
        let _ = child.wait();
    }

    let base_dir = get_base_dir();
    
    let template_path = base_dir.join("singbox-schema-template.json");
    let template_str = fs::read_to_string(&template_path)
        .map_err(|e| format!("无法读取模板文件 ({:?}): {}", template_path, e))?;

    let mut json_data: Value = serde_json::from_str(&template_str)
        .map_err(|e| format!("JSON 解析失败: {}", e))?;

    if let Some(outbounds) = json_data.get_mut("outbounds").and_then(|v| v.as_array_mut()) {
        if let Some(hysteria_outbound) = outbounds.iter_mut().find(|o| o["type"] == "hysteria2") {
            hysteria_outbound["server"] = Value::String(config.server);
            hysteria_outbound["server_port"] = Value::Number(config.port.into());
            hysteria_outbound["password"] = Value::String(config.password);
            hysteria_outbound["up_mbps"] = Value::Number(config.up_mbps.into());
            hysteria_outbound["down_mbps"] = Value::Number(config.down_mbps.into());
        }
    }

    // 核心修复：将运行配置写入 Windows 系统临时目录，彻底避开 Tauri 的热更新监控
    let run_config_path = env::temp_dir().join("singbox_config_run.json");
    let run_config_str = serde_json::to_string_pretty(&json_data)
        .map_err(|e| format!("生成运行配置失败: {}", e))?;
    
    fs::write(&run_config_path, run_config_str)
        .map_err(|e| format!("写入运行配置失败 ({:?}): {}", run_config_path, e))?;

    let exe_path = base_dir.join("sing-box.exe");
    let child = Command::new(&exe_path)
        .arg("run")
        .arg("-c")
        .arg(&run_config_path)
        .spawn()
        .map_err(|e| format!("启动 sing-box 失败 ({:?}): {}", exe_path, e))?;

    *process_guard = Some(child);
    Ok("代理已成功启动".to_string())
}

#[tauri::command]
fn stop_proxy(state: State<'_, AppState>) -> Result<String, String> {
    let mut process_guard = state.singbox_process.lock().unwrap();
    if let Some(mut child) = process_guard.take() {
        let _ = child.kill();
        let _ = child.wait();
        Ok("代理已停止".to_string())
    } else {
        Ok("没有正在运行的代理".to_string())
    }
}

fn main() {
    tauri::Builder::default()
        .manage(AppState {
            singbox_process: Mutex::new(None),
        })
        .invoke_handler(tauri::generate_handler![start_proxy, stop_proxy])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}