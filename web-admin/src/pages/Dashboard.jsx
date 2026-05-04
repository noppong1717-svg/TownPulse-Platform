import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';

function Dashboard() {
  const [events, setEvents] = useState([]);

  useEffect(() => {
    fetch('http://localhost:3000/api/events')
      .then(res => res.json())
      .then(data => {
        if (data.status === 'success') {
          setEvents(data.data);
        }
      });
  }, []);

  return (
    // 🌟 เปลี่ยนพื้นหลังเป็นสีสว่าง (#F8FAFC) แบบเดียวกับแอปมือถือ
    <div style={{ backgroundColor: '#a9aaaff8', minHeight: '100vh', padding: '20px', fontFamily: "'Prompt', sans-serif" }}>
      
      {/* 🌟 ปรับ Header ใหม่ให้ดูเป็นกล่องสีขาวโค้งมน */}
      <div style={{ 
        display: 'flex', justifyContent: 'space-between', alignItems: 'center', 
        marginBottom: '25px', backgroundColor: '#FFF', padding: '20px 25px', 
        borderRadius: '16px', boxShadow: '0 2px 10px rgba(15,23,42,0.05)' 
      }}>
        <h2 style={{ margin: 0, color: '#0F172A', fontSize: '24px', fontWeight: 'bold' }}>
          สำรวจกิจกรรม <span style={{ color: '#FF385C' }}>🧭</span>
        </h2>
        <Link to="/add-event">
          {/* 🌟 ปุ่มเพิ่มกิจกรรมใช้สีแดงชมพู (#FF385C) แบบแอปมือถือ */}
          <button style={{ 
            padding: '12px 20px', backgroundColor: '#FF385C', color: 'white', 
            border: 'none', borderRadius: '12px', cursor: 'pointer', 
            fontWeight: 'bold', fontSize: '15px', boxShadow: '0 4px 10px rgba(255,56,92,0.3)' 
          }}>
            + เพิ่มกิจกรรมใหม่
          </button>
        </Link>
      </div>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '20px' }}>
        {events.map(event => {
          
          const imageUrl = event.image_url?.startsWith('http') 
            ? event.image_url 
            : `http://localhost:3000${event.image_url}`;

          // จัดรูปแบบวันที่ให้สวยงามแบบในแอป
          const startDate = event.start_date ? new Date(event.start_date).toLocaleDateString('th-TH', { month: 'short', day: 'numeric', year: 'numeric' }) : '-';

          return (
            <Link to={`/event-detail/${event.id}`} key={event.id} style={{ textDecoration: 'none' }}>
              
              {/* 🌟 ปรับดีไซน์การ์ดให้พื้นขาว มุมโค้ง (16px) และมีเงาสวยงาม */}
              <div style={{ 
                backgroundColor: '#FFF', borderRadius: '16px', overflow: 'hidden', 
                boxShadow: '0 4px 12px rgba(15,23,42,0.08)', position: 'relative',
                transition: 'transform 0.2s', color: '#0F172A'
              }}
              onMouseEnter={(e) => e.currentTarget.style.transform = 'translateY(-5px)'}
              onMouseLeave={(e) => e.currentTarget.style.transform = 'translateY(0)'}
              >
                
                {/* 🚨 แจ้งเตือนจุดสีแดง (ฟีเจอร์เดิม ทำงานเหมือนเดิมเป๊ะ) */}
                {event.reported_count > 0 && (
                  <div style={{
                    position: 'absolute', top: '12px', right: '12px',
                    backgroundColor: '#EF4444', color: 'white',
                    width: '30px', height: '30px', borderRadius: '50%',
                    display: 'flex', justifyContent: 'center', alignItems: 'center',
                    fontWeight: 'bold', fontSize: '14px',
                    boxShadow: '0px 2px 8px rgba(239,68,68,0.5)', zIndex: 10,
                    border: '2px solid #FFF'
                  }}>
                    {event.reported_count}
                  </div>
                )}

                <img 
                  src={imageUrl} 
                  alt={event.title} 
                  style={{ width: '100%', height: '170px', objectFit: 'cover' }} 
                  onError={(e) => { e.target.src = 'https://via.placeholder.com/300x170?text=No+Image'; }}
                />
                
                <div style={{ padding: '16px' }}>
                  {/* 🌟 หมวดหมู่สีแดงตัวเล็กด้านบน */}
                  <div style={{ marginBottom: '8px' }}>
                    <span style={{ color: '#FF385C', fontSize: '11px', fontWeight: 'bold' }}>
                      {event.category || 'เทศกาลและงานวัด'}
                    </span>
                  </div>
                  
                  {/* 🌟 ชื่อกิจกรรมตัวหนาสีเข้ม */}
                  <h4 style={{ 
                    margin: '0 0 12px 0', color: '#0F172A', fontSize: '17px', 
                    lineHeight: '1.4', overflow: 'hidden', textOverflow: 'ellipsis', 
                    display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical' 
                  }}>
                    {event.title}
                  </h4>
                  
                  {/* 🌟 แถบวันที่และสถานที่ด้านล่าง */}
                  <div style={{ display: 'flex', flexDirection: 'column', gap: '8px' }}>
                    <div style={{ display: 'flex', alignItems: 'center', color: '#64748B', fontSize: '13px' }}>
                      <span style={{ marginRight: '8px', fontSize: '14px' }}>📅</span> {startDate}
                    </div>
                    <div style={{ display: 'flex', alignItems: 'center', color: '#475569', fontSize: '13px' }}>
                      <span style={{ color: '#FF385C', marginRight: '8px', fontSize: '14px' }}>📍</span> 
                      <span style={{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', width: '90%' }}>
                        {event.location_name}
                      </span>
                    </div>
                  </div>
                </div>

              </div>
            </Link>
          );
        })}
      </div>
    </div>
  );
}

export default Dashboard;