import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function Login() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [keyAdmin, setKeyAdmin] = useState('');
  const navigate = useNavigate();

  const handleLogin = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch('http://localhost:3000/api/admin/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password, keyAdmin }),
      });
      const data = await response.json();
      if (data.success) {
        localStorage.setItem('adminData', JSON.stringify(data.data));
        navigate('/dashboard');
      } else {
        alert(data.message);
      }
    } catch (error) {
      alert('เกิดข้อผิดพลาดในการเชื่อมต่อเซิร์ฟเวอร์');
    }
  };

  return (
    <div style={{ 
      backgroundColor: '#eeeeeeb9', minHeight: '100vh', display: 'flex', 
      justifyContent: 'center', alignItems: 'center', fontFamily: "'Prompt', sans-serif" 
    }}>
      <div style={{ 
        backgroundColor: '#FFF', padding: '40px', borderRadius: '24px', 
        boxShadow: '0 10px 25px rgba(15,23,42,0.05)', width: '100%', maxWidth: '400px' 
      }}>
        <div style={{ textAlign: 'center', marginBottom: '30px' }}>
          <h2 style={{ color: '#0F172A', margin: 0, fontSize: '28px', fontWeight: 'bold' }}>
            TownPulse <span style={{ color: '#FF385C' }}>Admin</span>
          </h2>
          <p style={{ color: '#64748B', marginTop: '5px', fontSize: '14px' }}>เข้าสู่ระบบจัดการข้อมูลหลังบ้าน</p>
        </div>

        <form onSubmit={handleLogin} style={{ display: 'flex', flexDirection: 'column', gap: '15px' }}>
          <div>
            <label style={labelStyle}>ชื่อผู้ใช้ (Username)</label>
            <input type="text" placeholder="กรอกชื่อผู้ใช้" value={username} onChange={(e) => setUsername(e.target.value)} required style={inputStyle} />
          </div>
          <div>
            <label style={labelStyle}>รหัสผ่าน (Password)</label>
            <input type="password" placeholder="กรอกรหัสผ่าน" value={password} onChange={(e) => setPassword(e.target.value)} required style={inputStyle} />
          </div>
          <div>
            <label style={labelStyle}>คีย์ความปลอดภัย (Admin Key)</label>
            <input type="password" placeholder="กรอกคีย์ยืนยันตัวตน" value={keyAdmin} onChange={(e) => setKeyAdmin(e.target.value)} required style={inputStyle} />
          </div>
          
          <button type="submit" style={{ 
            marginTop: '10px', padding: '15px', backgroundColor: '#1E1B4B', 
            color: 'white', border: 'none', borderRadius: '12px', cursor: 'pointer', 
            fontWeight: 'bold', fontSize: '16px', transition: '0.2s', boxShadow: '0 4px 10px rgba(30,27,75,0.2)'
          }}>
            เข้าสู่ระบบ
          </button>
        </form>
      </div>
    </div>
  );
}

const labelStyle = { display: 'block', marginBottom: '8px', color: '#475569', fontWeight: 'bold', fontSize: '14px' };
const inputStyle = { width: '100%', padding: '14px', borderRadius: '12px', border: '1px solid #E2E8F0', backgroundColor: '#F8FAFC', color: '#0F172A', boxSizing: 'border-box', fontFamily: "'Prompt', sans-serif", fontSize: '14px', outline: 'none' };

export default Login;