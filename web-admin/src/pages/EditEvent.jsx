import React, { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router-dom';

const CATEGORIES = [
  'อาหารและเครื่องดื่ม', 'ตลาดและช้อปปิ้ง', 'ดนตรีและคอนเสิร์ต', 
  'เทศกาลและงานวัด', 'กีฬาและเอาท์ดอร์', 'ศิลปะและนิทรรศการ', 
  'สัตว์เลี้ยง', 'ท่องเที่ยวธรรมชาติ'
];

function EditEvent() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    title: '', location_name: '', location: '', description: '', 
    start_date: '', end_date: '', imageUrlInput: '', 
    latitude: '', longitude: '', category: 'เทศกาลและงานวัด'
  });
  const [imageFile, setImageFile] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:3000/api/events/${id}`)
      .then(res => res.json())
      .then(data => {
        if (data.status === 'success') {
          const ev = data.data;
          setFormData({
            title: ev.title || '', location_name: ev.location_name || '', location: ev.location || '',
            description: ev.description || '', start_date: ev.start_date ? ev.start_date.split('T')[0] : '',
            end_date: ev.end_date ? ev.end_date.split('T')[0] : '', imageUrlInput: ev.image_url || '',
            latitude: ev.latitude || '', longitude: ev.longitude || '', category: ev.category || 'เทศกาลและงานวัด'
          });
        }
      });
  }, [id]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = new FormData();
    Object.keys(formData).forEach(key => data.append(key, formData[key]));
    if (imageFile) data.append('image', imageFile);

    try {
      const response = await fetch(`http://localhost:3000/api/admin/events/${id}`, { method: 'PUT', body: data });
      if (response.ok) {
        alert('อัปเดตกิจกรรมสำเร็จ!');
        navigate(`/event-detail/${id}`);
      }
    } catch (error) { alert('เกิดข้อผิดพลาดในการเชื่อมต่อ'); }
  };

  return (
    <div style={{ backgroundColor: '#F8FAFC', minHeight: '100vh', padding: '40px 20px', fontFamily: "'Prompt', sans-serif" }}>
      <div style={{ maxWidth: '700px', margin: '0 auto', backgroundColor: '#FFF', padding: '30px', borderRadius: '24px', boxShadow: '0 4px 20px rgba(15,23,42,0.05)' }}>
        
        <div style={{ display: 'flex', alignItems: 'center', marginBottom: '25px', paddingBottom: '15px', borderBottom: '1px solid #F1F5F9' }}>
          <button onClick={() => navigate(-1)} style={backBtnStyle}>← กลับ</button>
          <h2 style={{ margin: '0 0 0 15px', color: '#0F172A', fontSize: '22px' }}>✏️ แก้ไขกิจกรรม</h2>
        </div>

        <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '20px' }}>
          
          <div><label style={labelStyle}>ชื่อกิจกรรม</label><input type="text" value={formData.title} onChange={e => setFormData({...formData, title: e.target.value})} style={inputStyle}/></div>
          <div><label style={labelStyle}>ชื่อสถานที่จัดงาน</label><input type="text" value={formData.location_name} onChange={e => setFormData({...formData, location_name: e.target.value})} style={inputStyle}/></div>
          <div><label style={labelStyle}>ลิงก์ Google Maps สำหรับนำทาง</label><input type="text" value={formData.location} onChange={e => setFormData({...formData, location: e.target.value})} style={inputStyle}/></div>
          
          <div style={{ backgroundColor: '#F8FAFC', padding: '20px', borderRadius: '16px', border: '1px solid #E2E8F0' }}>
            <label style={{ ...labelStyle, marginBottom: '12px' }}>📌 หมวดหมู่กิจกรรม</label>
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
              {CATEGORIES.map(cat => (
                <button type="button" key={cat} onClick={() => setFormData({...formData, category: cat})}
                  style={{
                    padding: '8px 16px', borderRadius: '20px', cursor: 'pointer', fontFamily: "'Prompt', sans-serif", fontSize: '13px',
                    border: formData.category === cat ? '1px solid #FF385C' : '1px solid #E2E8F0',
                    backgroundColor: formData.category === cat ? '#FF385C' : '#FFF',
                    color: formData.category === cat ? '#FFF' : '#64748B', fontWeight: formData.category === cat ? 'bold' : 'normal', transition: '0.2s'
                  }}
                >
                  {cat}
                </button>
              ))}
            </div>
          </div>

          <div style={{ display: 'flex', gap: '15px' }}>
             <div style={{ flex: 1 }}><label style={labelStyle}>วันที่เริ่ม</label><input type="date" value={formData.start_date} onChange={e => setFormData({...formData, start_date: e.target.value})} style={inputStyle}/></div>
             <div style={{ flex: 1 }}><label style={labelStyle}>วันที่สิ้นสุด</label><input type="date" value={formData.end_date} onChange={e => setFormData({...formData, end_date: e.target.value})} style={inputStyle}/></div>
          </div>

          <div style={{ display: 'flex', gap: '15px' }}>
             <div style={{ flex: 1 }}><label style={labelStyle}>ละติจูด (Latitude)</label><input type="text" value={formData.latitude} onChange={e => setFormData({...formData, latitude: e.target.value})} style={inputStyle}/></div>
             <div style={{ flex: 1 }}><label style={labelStyle}>ลองจิจูด (Longitude)</label><input type="text" value={formData.longitude} onChange={e => setFormData({...formData, longitude: e.target.value})} style={inputStyle}/></div>
          </div>

          <div><label style={labelStyle}>รายละเอียดกิจกรรม</label><textarea rows="5" value={formData.description} onChange={e => setFormData({...formData, description: e.target.value})} style={{...inputStyle, resize: 'vertical'}}></textarea></div>
          
          <div style={{ backgroundColor: '#F8FAFC', padding: '20px', borderRadius: '16px', border: '1px solid #E2E8F0' }}>
            <label style={labelStyle}>รูปภาพกิจกรรม (อัปโหลดใหม่ หรือ ใช้ลิงก์เดิม)</label>
            <input type="file" accept="image/*" onChange={e => { setImageFile(e.target.files[0]); setFormData({...formData, imageUrlInput: ''}); }} style={{ marginBottom: '15px', width: '100%', fontFamily: "'Prompt', sans-serif" }} />
            <input type="text" placeholder="ลิงก์รูปภาพ หรือ พาธรูปภาพเดิม" value={formData.imageUrlInput} onChange={e => { setFormData({...formData, imageUrlInput: e.target.value}); setImageFile(null); }} style={inputStyle}/>
          </div>

          <div style={{ display: 'flex', gap: '15px', marginTop: '10px' }}>
            <button type="submit" style={{ flex: 1, padding: '16px', backgroundColor: '#F59E0B', color: 'white', border: 'none', borderRadius: '12px', cursor: 'pointer', fontWeight: 'bold', fontSize: '16px', boxShadow: '0 4px 10px rgba(245,158,11,0.2)' }}>
              บันทึกการแก้ไข
            </button>
            <button type="button" onClick={() => navigate(-1)} style={{ flex: 1, padding: '16px', backgroundColor: '#EF4444', color: 'white', border: 'none', borderRadius: '12px', cursor: 'pointer', fontWeight: 'bold', fontSize: '16px', boxShadow: '0 4px 10px rgba(239,68,68,0.2)' }}>
              ยกเลิก
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}

const labelStyle = { display: 'block', marginBottom: '8px', color: '#475569', fontWeight: 'bold', fontSize: '14px' };
const inputStyle = { width: '100%', padding: '14px', borderRadius: '12px', border: '1px solid #E2E8F0', backgroundColor: '#F8FAFC', color: '#0F172A', boxSizing: 'border-box', fontFamily: "'Prompt', sans-serif", fontSize: '14px', outline: 'none' };
const backBtnStyle = { padding: '8px 15px', borderRadius: '20px', border: '1px solid #E2E8F0', backgroundColor: '#FFF', color: '#0F172A', cursor: 'pointer', fontFamily: "'Prompt', sans-serif", fontWeight: 'bold' };

export default EditEvent;