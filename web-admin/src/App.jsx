import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';

import Login from './pages/Login';
import Dashboard from './pages/Dashboard';
import AddEvent from './pages/AddEvent'; 
// 📍 1. นำเข้า 2 หน้าใหม่ที่เรากำลังจะสร้าง
import AdminEventDetail from './pages/AdminEventDetail';
import EditEvent from './pages/EditEvent';

function App() {
  const isAuthenticated = !!localStorage.getItem('adminData');

  return (
    <Router>
      <Routes>
        <Route path="/" element={<Navigate to="/login" replace />} />
        <Route path="/login" element={<Login />} />

        {/* --- โซนต้องล็อกอิน --- */}
        <Route path="/dashboard" element={isAuthenticated ? <Dashboard /> : <Navigate to="/login" replace />} />
        <Route path="/add-event" element={isAuthenticated ? <AddEvent /> : <Navigate to="/login" replace />} />
        
        {/* 📍 2. เพิ่ม Route สำหรับหน้ารายละเอียด และ หน้าแก้ไข */}
        <Route path="/event-detail/:id" element={isAuthenticated ? <AdminEventDetail /> : <Navigate to="/login" replace />} />
        <Route path="/edit-event/:id" element={isAuthenticated ? <EditEvent /> : <Navigate to="/login" replace />} />

        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </Router>
  );
}

export default App;