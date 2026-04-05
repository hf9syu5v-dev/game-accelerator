import { useState, useEffect } from 'react';
import { invoke } from '@tauri-apps/api/core';
import './App.css';

export default function App() {
  const [status, setStatus] = useState<'disconnected' | 'connecting' | 'connected'>('disconnected');
  
  // 核心新增：使用惰性初始化从 localStorage 读取本地保存的数据
  const [server, setServer] = useState(() => localStorage.getItem('proxy_server') || '');
  const [port, setPort] = useState(() => localStorage.getItem('proxy_port') || '443');
  const [password, setPassword] = useState(() => localStorage.getItem('proxy_password') || '');
  
  const [upMbps, setUpMbps] = useState('100');
  const [downMbps, setDownMbps] = useState('100');
  const [errorMsg, setErrorMsg] = useState('');

  // 核心新增：当 server, port, password 发生变化时，自动保存到 localStorage
  useEffect(() => {
    localStorage.setItem('proxy_server', server);
    localStorage.setItem('proxy_port', port);
    localStorage.setItem('proxy_password', password);
  }, [server, port, password]);

  const handleToggleConnect = async () => {
    setErrorMsg('');
    
    if (status === 'connected') {
      try {
        await invoke('stop_proxy');
        setStatus('disconnected');
      } catch (err) {
        setErrorMsg(String(err));
      }
      return;
    }

    if (!server) {
      setErrorMsg('请输入服务器地址');
      return;
    }
    if (!password) {
      setErrorMsg('请输入认证密码');
      return;
    }

    setStatus('connecting');
    
    try {
      const configPayload = {
        server: server,
        port: parseInt(port, 10),
        password: password,
        up_mbps: parseInt(upMbps, 10),
        down_mbps: parseInt(downMbps, 10)
      };

      const response = await invoke('start_proxy', { config: configPayload });
      console.log("Rust response:", response);
      setStatus('connected');
    } catch (err) {
      console.error("Rust error:", err);
      setErrorMsg(String(err));
      setStatus('disconnected');
    }
  };

  return (
    <div style={{ minHeight: '100vh', backgroundColor: '#0a0a0a', color: '#eaeaea', display: 'flex', alignItems: 'center', justifyContent: 'center', padding: '1rem', fontFamily: 'sans-serif' }}>
      <div style={{ width: '100%', maxWidth: '400px', backgroundColor: '#111', border: '1px solid #333', borderRadius: '1rem', overflow: 'hidden' }}>
        
        <div style={{ padding: '1.5rem', borderBottom: '1px solid #333', display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.75rem' }}>
            <div>
              <h1 style={{ margin: 0, fontSize: '1.125rem', fontWeight: 'bold' }}>Sing-box Accelerator</h1>
              <p style={{ margin: 0, fontSize: '0.75rem', color: '#888' }}>v1.0.0-beta | Hysteria2</p>
            </div>
          </div>
          <div style={{ fontSize: '0.75rem', padding: '0.25rem 0.75rem', borderRadius: '999px', border: '1px solid #333', display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
            {status === 'connected' ? '🟢 已连接' : status === 'connecting' ? '🟡 连接中...' : '🔴 未连接'}
          </div>
        </div>

        <div style={{ padding: '1.5rem', display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          <div>
            <label style={{ display: 'block', fontSize: '0.75rem', color: '#888', marginBottom: '0.25rem' }}>服务器地址</label>
            <input type="text" value={server} onChange={e => setServer(e.target.value)} disabled={status !== 'disconnected'} style={{ width: '100%', padding: '0.5rem', backgroundColor: '#050505', border: '1px solid #333', borderRadius: '0.5rem', color: '#fff' }} />
          </div>
          <div>
            <label style={{ display: 'block', fontSize: '0.75rem', color: '#888', marginBottom: '0.25rem' }}>端口</label>
            <input type="number" value={port} onChange={e => setPort(e.target.value)} disabled={status !== 'disconnected'} style={{ width: '100%', padding: '0.5rem', backgroundColor: '#050505', border: '1px solid #333', borderRadius: '0.5rem', color: '#fff' }} />
          </div>
          <div>
            <label style={{ display: 'block', fontSize: '0.75rem', color: '#888', marginBottom: '0.25rem' }}>认证密码</label>
            <input type="password" value={password} onChange={e => setPassword(e.target.value)} disabled={status !== 'disconnected'} style={{ width: '100%', padding: '0.5rem', backgroundColor: '#050505', border: '1px solid #333', borderRadius: '0.5rem', color: '#fff' }} />
          </div>
          
          {errorMsg && (
            <div style={{ color: '#f87171', fontSize: '0.75rem', padding: '0.75rem', backgroundColor: 'rgba(248, 113, 113, 0.1)', border: '1px solid rgba(248, 113, 113, 0.2)', borderRadius: '0.5rem' }}>
              {errorMsg}
            </div>
          )}
        </div>

        <div style={{ padding: '1.5rem', borderTop: '1px solid #333' }}>
          <button 
            onClick={handleToggleConnect} 
            disabled={status === 'connecting'}
            style={{ width: '100%', padding: '0.75rem', borderRadius: '0.5rem', border: 'none', fontWeight: 'bold', cursor: status === 'connecting' ? 'not-allowed' : 'pointer', backgroundColor: status === 'connected' ? '#ef4444' : '#4f46e5', color: '#fff' }}
          >
            {status === 'connected' ? '断开连接' : status === 'connecting' ? '正在建立隧道...' : '启动加速 (TUN 模式)'}
          </button>
        </div>
      </div>
    </div>
  );
}