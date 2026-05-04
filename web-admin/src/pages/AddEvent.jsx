import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const CATEGORIES = [
  'อาหารและเครื่องดื่ม', 'ตลาดและช้อปปิ้ง', 'ดนตรีและคอนเสิร์ต', 
  'เทศกาลและงานวัด', 'กีฬาและเอาท์ดอร์', 'ศิลปะและนิทรรศการ', 
  'สัตว์เลี้ยง', 'ท่องเที่ยวธรรมชาติ'
];

function AddEvent() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    title: '', location_name: '', location: '', description: '', 
    start_date: '', end_date: '', imageUrlInput: '', 
    latitude: '', longitude: '', category: 'เทศกาลและงานวัด'
  });
  const [imageFile, setImageFile] = useState(null);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData();
    Object.keys(formData).forEach(key => data.append(key, formData[key]));
    if (imageFile) data.append('image', imageFile);

    try {
      const response = await fetch('http://localhost:3000/api/admin/events', {
        method: 'POST', body: data,
      });
      if (response.ok) {
        alert('เพิ่มกิจกรรมสำเร็จ!');
        navigate('/dashboard');
      } else {
        const resData = await response.json();
        alert('เกิดข้อผิดพลาด: ' + resData.message);
      }
    } catch (error) {
      alert('เกิดข้อผิดพลาดในการเชื่อมต่อเซิร์ฟเวอร์');
    }
  };

  return (
    <div style={{ backgroundColor: '#a9aaaff8', minHeight: '100vh', padding: '40px 20px', fontFamily: "'Prompt', sans-serif" }}>
      <div style={{ maxWidth: '700px', margin: '0 auto', backgroundColor: '#FFF', padding: '30px', borderRadius: '24px', boxShadow: '0 4px 20px rgba(15,23,42,0.05)' }}>
        
        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '25px', paddingBottom: '15px', borderBottom: '1px solid #bebebe' }}>
          <button onClick={() => navigate(-1)} style={backBtnStyle}>← กลับ</button>
          <h2 style={{ margin: '0 0 0 15px', color: '#0F172A', fontSize: '22px' }}>  เพิ่มกิจกรรมใหม่</h2>
        </div>

        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
          
          <div><label style={labelStyle}>ชื่อกิจกรรม</label><input type="text" placeholder="เช่น งานวัดภูเขาทอง" onChange={e => setFormData({...formData, title: e.target.value})} required style={{ ...inputStyle, backgroundColor: '#e7eaeee8' }}/></div>
          <div><label style={labelStyle}>ชื่อสถานที่จัดงาน</label><input type="text" placeholder="เช่น วัดสระเกศ" onChange={e => setFormData({...formData, location_name: e.target.value})} required style={{ ...inputStyle, backgroundColor: '#e7eaeee8' }}/></div>
          <div><label style={labelStyle}>ลิงก์ Google Maps สำหรับนำทาง</label><input type="text" placeholder="https://maps.app.goo.gl/..." onChange={e => setFormData({...formData, location: e.target.value})} required style={{ ...inputStyle, backgroundColor: '#e7eaeee8' }}/></div>
          
          {/* หมวดหมู่กิจกรรม */}
          <div style={{ backgroundColor: '#e3e8ecc7', padding: '20px', borderRadius: '16px', border: '1px solid #E2E8F0' }}>
            <label style={{ ...labelStyle, marginBottom: '12px' }}># หมวดหมู่กิจกรรม</label>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
              {CATEGORIES.map(cat => (
                <button type="button" key={cat} onClick={() => setFormData({...formData, category: cat})}
                  style={{
                    padding: '8px 16px', borderRadius: '20px', cursor: 'pointer', fontFamily: "'Prompt', sans-serif", fontSize: '13px',
                    border: formData.category === cat ? '1px solid #FF385C' : '1px solid #E2E8F0',
                    backgroundColor: formData.category === cat ? '#FF385C' : '#FFF',
                    color: formData.category === cat ? '#FFF' : '#64748B',
                    fontWeight: formData.category === cat ? 'bold' : 'normal', transition: '0.2s'
                  }}
                >
                  {cat}
                </button>
              ))}
            </div>
          </div>
          
          <div style={{ display: 'flex', gap: '15px' }}>
             <div style={{ flex: 1 }}>
               <label style={labelStyle}>วันที่เริ่ม</label>
               <input 
                 type="date" 
                 value={formData.start_date} 
                 onClick={(e) => e.target.showPicker && e.target.showPicker()} 
                 onChange={e => setFormData({...formData, start_date: e.target.value})} 
                 style={{...inputStyle, cursor: 'pointer'}}
               />
             </div>
             <div style={{ flex: 1 }}>
               <label style={labelStyle}>วันที่สิ้นสุด</label>
               <input 
                 type="date" 
                 value={formData.end_date} 
                 onClick={(e) => e.target.showPicker && e.target.showPicker()} 
                 onChange={e => setFormData({...formData, end_date: e.target.value})} 
                 style={{...inputStyle, cursor: 'pointer'}}
               />
             </div>
          </div>

          <div style={{ display: 'flex', gap: '15px' }}>
             <div style={{ flex: 1 }}><label style={labelStyle}>ละติจูด (Latitude)</label><input type="text" placeholder="เช่น 13.7538" onChange={e => setFormData({...formData, latitude: e.target.value})} style={inputStyle}/></div>
             <div style={{ flex: 1 }}><label style={labelStyle}>ลองจิจูด (Longitude)</label><input type="text" placeholder="เช่น 100.5066" onChange={e => setFormData({...formData, longitude: e.target.value})} style={inputStyle}/></div>
          </div>

          <div><label style={labelStyle}>รายละเอียดกิจกรรม</label><textarea placeholder="พิมพ์รายละเอียดงาน..." rows="4" onChange={e => setFormData({...formData, description: e.target.value})} required style={{...inputStyle, resize: 'vertical'}}></textarea></div>
          
          <div style={{ backgroundColor: '#F8FAFC', padding: '20px', borderRadius: '16px', border: '1px solid #E2E8F0' }}>
            <label style={labelStyle}>รูปภาพกิจกรรม</label>
            <input type="file" accept="image/*" onChange={e => { setImageFile(e.target.files[0]); setFormData({...formData, imageUrlInput: ''}); }} style={{ marginBottom: '15px', width: '100%', fontFamily: "'Prompt', sans-serif" }} />
            <input type="text" placeholder="หรือ วางลิงก์รูปภาพ (URL)" value={formData.imageUrlInput} onChange={e => { setFormData({...formData, imageUrlInput: e.target.value}); setImageFile(null); }} style={inputStyle}/>
          </div>

          <button type="submit" style={{ marginTop: '10px', padding: '16px', backgroundColor: '#10B981', color: 'white', border: 'none', borderRadius: '12px', cursor: 'pointer', fontWeight: 'bold', fontSize: '16px', boxShadow: '0 4px 10px rgba(16,185,129,0.2)' }}>
            บันทึกกิจกรรมใหม่
          </button>
        </form>
      </div>
    </div>
  );
}

const labelStyle = { display: 'block', marginBottom: '8px', color: '#475569', fontWeight: 'bold', fontSize: '14px' };
const inputStyle = { width: '100%', padding: '14px', borderRadius: '12px', border: '1px solid #E2E8F0', backgroundColor: '#F8FAFC', color: '#0F172A', boxSizing: 'border-box', fontFamily: "'Prompt', sans-serif", fontSize: '14px', outline: 'none' };
const backBtnStyle = { padding: '8px 15px', borderRadius: '20px', border: '1px solid #E2E8F0', backgroundColor: '#FFF', color: '#0F172A', cursor: 'pointer', fontFamily: "'Prompt', sans-serif", fontWeight: 'bold' };

export default AddEvent;