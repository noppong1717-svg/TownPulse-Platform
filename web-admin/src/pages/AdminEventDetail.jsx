import React, { useState, useEffect } from 'react';
import { useParams, Link, useNavigate } from 'react-router-dom';

function AdminEventDetail() {
  const { id } = useParams();
  const navigate = useNavigate();
  const [event, setEvent] = useState(null);
  const [reviews, setReviews] = useState([]);

  useEffect(() => {
    fetch(`http://localhost:3000/api/events/${id}`)
      .then(res => res.json())
      .then(data => { if (data.status === 'success') setEvent(data.data); });

    fetch(`http://localhost:3000/events/${id}/reviews`)
      .then(res => res.json())
      .then(data => { if (data.status === 'success') setReviews(data.reviews); });
  }, [id]);

  const handleDeleteReview = async (reviewId) => {
    if (!window.confirm('คุณแน่ใจหรือไม่ที่จะลบรีวิวนี้ออกจากระบบ?')) return;
    try {
      // 📍 เรียกใช้ API ตัวใหม่ที่ส่งแจ้งเตือนด้วย
      const res = await fetch(`http://localhost:3000/api/admin/reviews/${reviewId}`, { method: 'DELETE' });
      if (res.ok) {
        setReviews(reviews.filter(r => r.id !== reviewId));
        alert('ลบรีวิวสำเร็จ');
      }
    } catch (err) { alert('เกิดข้อผิดพลาดในการลบรีวิว'); }
  };

  const handleUnreport = async (reviewId) => {
    if (!window.confirm('ยืนยันการยกเลิกรายงาน (รีวิวนี้ถือว่าปกติ)?')) return;
    try {
      const res = await fetch(`http://localhost:3000/api/admin/reviews/${reviewId}/unreport`, { method: 'PUT' });
      if (res.ok) {
        setReviews(reviews.map(r => r.id === reviewId ? { ...r, is_reported: 0 } : r));
        alert('ยกเลิกรายงานสำเร็จ');
      }
    } catch (err) { alert('เกิดข้อผิดพลาดในการทำรายการ'); }
  };

  if (!event) return (
    <div style={{ backgroundColor: '#c3cfdb', minHeight: '100vh', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
      <h2 style={{ color: '#0F172A', fontFamily: "'Prompt', sans-serif" }}>กำลังโหลดข้อมูล...</h2>
    </div>
  );

  const imageUrl = event.image_url?.startsWith('http') ? event.image_url : `http://localhost:3000${event.image_url}`;

  return (
    <div style={{ backgroundColor: '#d7dce2', minHeight: '100vh', padding: '40px 20px', fontFamily: "'Prompt', sans-serif" }}>
      <div style={{ maxWidth: '800px', margin: '0 auto' }}>
        
        {/* 🌟 ปุ่มกลับ Dashboard */}
        <button onClick={() => navigate('/dashboard')} style={backBtnStyle}>
          ← กลับไป Dashboard
        </button>
        
        {/* 🌟 การ์ดรายละเอียดกิจกรรม */}
        <div style={{ backgroundColor: '#FFF', borderRadius: '24px', padding: '30px', boxShadow: '0 4px 20px rgba(15,23,42,0.05)', marginTop: '20px' }}>
          <img 
            src={imageUrl} 
            alt={event.title} 
            style={{ width: '100%', height: '350px', objectFit: 'cover', borderRadius: '16px' }} 
            onError={(e) => { e.target.src = 'https://via.placeholder.com/800x350?text=No+Image'; }}
          />
          
          <h1 style={{ color: '#0F172A', marginTop: '25px', fontSize: '28px', marginBottom: '10px' }}>{event.title}</h1>
          <p style={{ color: '#FF385C', fontWeight: 'bold', fontSize: '16px', margin: '0 0 15px 0' }}> {event.location_name}</p>
          
          <div style={{ backgroundColor: '#F1F5F9', padding: '15px', borderRadius: '12px', marginBottom: '20px' }}>
            <p style={{ color: '#475569', lineHeight: '1.6', margin: 0 }}><strong>รายละเอียด:</strong> {event.description}</p>
          </div>
          
          <Link to={`/edit-event/${event.id}`}>
            <button style={{ 
              backgroundColor: '#F59E0B', color: '#FFF', padding: '14px 24px', borderRadius: '12px', 
              border: 'none', fontWeight: 'bold', cursor: 'pointer', fontSize: '15px',
              boxShadow: '0 4px 10px rgba(245,158,11,0.2)' 
            }}>
               แก้ไขโพสต์ (ข้อมูลกิจกรรม)
            </button>
          </Link>
        </div>

        {/*  ส่วนของรีวิวผู้ใช้งาน */}
        <div style={{ marginTop: '40px' }}>
          <h2 style={{ color: '#0F172A', borderBottom: '2px solid #E2E8F0', paddingBottom: '10px', marginBottom: '20px' }}>
            รีวิวจากผู้ใช้งาน ({reviews.length})
          </h2>
          
          {reviews.length === 0 ? (
            <div style={{ textAlign: 'center', padding: '40px', backgroundColor: '#FFF', borderRadius: '16px', border: '1px dashed #CBD5E1' }}>
              <p style={{ color: '#64748B', margin: 0 }}>ยังไม่มีรีวิวสำหรับกิจกรรมนี้</p>
            </div>
          ) : (
            reviews.map(rev => (
              <div key={rev.id} style={{ 
                //  ถ้ารีวิวโดนรายงาน (is_reported = 1) ให้พื้นหลังเป็นสีแดงอ่อนๆ กรอบสีแดง
                backgroundColor: rev.is_reported === 1 ? '#FEF2F2' : '#FFF', 
                border: rev.is_reported === 1 ? '1px solid #FECACA' : '1px solid #E2E8F0',
                padding: '20px', borderRadius: '16px', marginBottom: '15px',
                display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start',
                boxShadow: '0 2px 10px rgba(15,23,42,0.03)'
              }}>
                <div style={{ flex: 1 }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: '10px', marginBottom: '8px' }}>
                    <div style={{ width: '36px', height: '36px', borderRadius: '18px', backgroundColor: '#1E1B4B', display: 'flex', justifyContent: 'center', alignItems: 'center', color: '#FFF', fontWeight: 'bold' }}>
                      {rev.username ? rev.username.charAt(0).toUpperCase() : 'U'}
                    </div>
                    <strong style={{ color: '#0F172A', fontSize: '16px' }}>{rev.username}</strong>
                    <span style={{ color: '#D97706', fontWeight: 'bold', fontSize: '14px', backgroundColor: '#FEF3C7', padding: '4px 8px', borderRadius: '8px' }}>
                      ⭐ {rev.rating}
                    </span>
                    
                    {/*  ป้ายแจ้งเตือนถูกรายงาน */}
                    {rev.is_reported === 1 && (
                      <span style={{ color: '#EF4444', fontSize: '12px', backgroundColor: '#FEE2E2', padding: '4px 10px', borderRadius: '12px', fontWeight: 'bold' }}>
                        ⚠️ ถูกรายงาน
                      </span>
                    )}
                  </div>
                  <p style={{ margin: '0', color: '#475569', lineHeight: '1.6', fontSize: '14px', paddingLeft: '46px' }}>{rev.comment}</p>
                </div>
                
                {/*  กลุ่มปุ่มจัดการรีวิว */}
                <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginLeft: '20px' }}>
                  {rev.is_reported === 1 && (
                    <button onClick={() => handleUnreport(rev.id)} style={{ padding: '10px 15px', backgroundColor: '#10B981', color: 'white', border: 'none', borderRadius: '10px', cursor: 'pointer', fontWeight: 'bold', fontSize: '13px', boxShadow: '0 2px 6px rgba(16,185,129,0.2)' }}>
                       ยกเลิกรายงาน
                    </button>
                  )}
                  <button onClick={() => handleDeleteReview(rev.id)} style={{ padding: '10px 15px', backgroundColor: '#EF4444', color: 'white', border: 'none', borderRadius: '10px', cursor: 'pointer', fontWeight: 'bold', fontSize: '13px', boxShadow: '0 2px 6px rgba(239,68,68,0.2)' }}>
                     ลบรีวิว
                  </button>
                </div>
              </div>
            ))
          )}
        </div>
      </div>
    </div>
  );
}

const backBtnStyle = { 
  padding: '10px 20px', borderRadius: '20px', border: '1px solid #E2E8F0', 
  backgroundColor: '#FFF', color: '#0F172A', cursor: 'pointer', 
  fontFamily: "'Prompt', sans-serif", fontWeight: 'bold', boxShadow: '0 2px 5px rgba(0,0,0,0.05)' 
};

export default AdminEventDetail;