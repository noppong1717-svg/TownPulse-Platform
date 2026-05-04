-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2026 at 07:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `townpulse_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `keyAdmin` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `keyAdmin`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'P@ssw0rd', '123456', '2026-03-18 18:56:37', '2026-03-19 18:03:40');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location` varchar(1000) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `admin_pick_text` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `category` varchar(100) DEFAULT 'เทศกาลและงานวัด'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `start_date`, `end_date`, `location_name`, `location`, `description`, `image_url`, `is_verified`, `admin_pick_text`, `created_at`, `latitude`, `longitude`, `category`) VALUES
(1, 'งานวัดภูเขาทอง 2569', '2026-02-15', '2026-02-20', 'วัดสระเกศราชวรมหาวิหาร', 'https://www.google.com/maps/search/?api=1&query=13.7538,100.5066', 'กลับมาอีกครั้งกับงานวัดที่ยิ่งใหญ่ที่สุดในกรุงเทพฯ พร้อมของกินเพียบ', 'https://cms.dmpcdn.com/travel/2024/10/22/bf86a330-9050-11ef-9ac9-8bc58bd3f671_webp_original.webp', 0, NULL, '2026-03-15 16:48:31', '13.7538', '100.5066', 'เทศกาลและงานวัด'),
(2, 'ตลาดนัดคลองถม (Night Market)', '2025-12-31', '2026-12-30', 'ย่านคลองถม กรุงเทพฯ', 'https://www.google.com/maps/search/?api=1&query=13.7465,100.5061', 'สวรรค์ของนักช้อปปิ้งของมือสอง และสตรีทฟู้ดมากมาย', '/uploads/1773912987483.jpg', 0, NULL, '2026-03-15 16:48:31', '13.7465', '100.5061', 'ตลาดและช้อปปิ้ง'),
(3, 'เทศกาลดนตรีกลางคืน (Night Vibe Fest)', '2026-02-28', '2026-02-28', 'ลานคนเมือง', 'https://www.google.com/maps/search/?api=1&query=13.7525,100.5003', 'ปลดปล่อยความสนุกไปกับเสียงดนตรีจากศิลปินอินดี้ชั้นนำ', 'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?q=80&w=800&auto=format&fit=crop', 0, NULL, '2026-03-15 16:48:31', '13.7525', '100.5003', 'ดนตรีและคอนเสิร์ต'),
(4, 'เทศกาลอาหารไทย', '2026-03-09', '2026-03-09', 'ศูนย์สิริกิติ์', 'https://www.google.com/maps/search/?api=1&query=13.7265,100.5588', 'รวมร้านอาหารระดับมิชลินสตาร์และสตรีทฟู้ดชื่อดังจากทั่วประเทศไทยมาไว้ในที่เดียว', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuoIPoymJp8eXs1Tj3m9yjQlAkmtcu6rcTWw&s', 0, NULL, '2026-03-15 16:48:31', '13.7265', '100.5588', 'อาหารและเครื่องดื่ม'),
(5, 'นิทรรศการศิลปะดิจิทัล', '2026-04-30', '2026-05-29', 'BACC หอศิลป์ฯ', 'https://www.google.com/maps/search/?api=1&query=13.7466,100.5300', 'นิทรรศการศิลปะแบบ Immersive Art ที่จะพาคุณดำดิ่งไปในโลกแห่งแสงสี', 'https://cms.dmpcdn.com/ugcarticle/2020/06/05/29d051c0-4b83-11ec-9c8c-bd9feceed59a_original.jpeg', 0, NULL, '2026-03-15 16:48:31', '13.7466', '100.5300', 'ศิลปะและนิทรรศการ'),
(6, 'Cat Lover Fair 2026', '2026-03-27', '2026-03-29', 'อิมแพ็ค เมืองทองธานี', 'https://www.google.com/maps/search/?api=1&query=13.9113,100.5484', 'งานแฟร์สำหรับคนรักแมว พบกับสินค้าลดราคาอีกมากมาย', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2RTUW3ti0-HCU6yZljO-rLYJI3FqE5k00AA&s', 0, NULL, '2026-03-15 16:48:31', '13.9113', '100.5484', 'สัตว์เลี้ยง'),
(7, 'เวิร์กชอปปั้นเซรามิกมินิมอล', '2025-12-31', '2026-12-30', 'สตูดิโอ อารีย์', 'https://www.google.com/maps/search/?api=1&query=13.7797,100.5446', 'เรียนรู้พื้นฐานการปั้นเซรามิกด้วยมือแบบง่ายๆ ได้ผลงานกลับบ้าน 2 ชิ้น', 'https://cdn.zipeventapp.com/blog/2021/03/2021-03-19_09-22-18_screen-shot-2564-03-19-at-16.22.07-1030x533.png', 0, NULL, '2026-03-15 16:48:31', '13.7797', '100.5446', 'ศิลปะและนิทรรศการ'),
(8, 'วิ่งมาราธอน ซิตี้รัน', '2026-04-11', '2026-04-11', 'สวนลุมพินี', 'https://www.google.com/maps/search/?api=1&query=13.7314,100.5415', 'งานวิ่งมาราธอนใจกลางเมืองหลวง สัมผัสอากาศยามเช้าและวิวตึกระฟ้า', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm-cnxiMh94Yn8X8QV3ZW8r7HgxyHNQn-hSw&s', 0, NULL, '2026-03-15 16:48:31', '13.7314', '100.5415', 'กีฬาและเอาท์ดอร์'),
(9, 'อาสาปลูกป่าชายเลน บางปู', '2026-08-19', '2026-08-19', 'สถานตากอากาศบางปู', 'https://www.google.com/maps/search/?api=1&query=13.5186,100.6542', 'ร่วมเป็นส่วนหนึ่งในการอนุรักษ์ธรรมชาติ ปลูกต้นโกงกางและทำความสะอาดป่าชายเลน', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl61AcBZX8yNGCsspN1IDvi50rwB1PXR1P-w&s', 0, NULL, '2026-03-15 16:48:31', '13.5186', '100.6542', 'ท่องเที่ยวธรรมชาติ'),
(10, 'แคมป์ปิ้งดูดาว เขาใหญ่', '2026-12-04', '2026-12-06', 'อุทยานแห่งชาติเขาใหญ่', 'https://www.google.com/maps/search/?api=1&query=14.4392,101.3723', 'ทริปแคมป์ปิ้งหน้าหนาว นอนดูดาวท่ามกลางธรรมชาติที่สมบูรณ์ที่สุด', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsPNdzB_KsB-3pbcBDcWxMoMtuPY8up4gMKQ&s', 0, NULL, '2026-03-15 16:48:31', '14.4392', '101.3723', 'ท่องเที่ยวธรรมชาติ'),
(11, 'งานเซลล์แบรนด์เนมประจำปี', '2026-06-30', '2026-07-04', 'Siam Paragon', 'https://www.google.com/maps/search/?api=1&query=13.7468,100.5346', 'ลดล้างสต๊อกสินค้าแบรนด์เนมระดับไฮเอนด์สูงสุด 80%', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWMDRzM6eLuO03qaor2hw91K5Mcj0r2Ok1MA&s', 0, NULL, '2026-03-15 16:48:31', '13.7468', '100.5346', 'ตลาดและช้อปปิ้ง'),
(12, 'คอนเสิร์ตอินดี้ในสวน', '2026-04-04', '2026-04-04', 'สวนเบญจกิติ', 'https://www.google.com/maps/search/?api=1&query=13.7292,100.5594', 'ฟังเพลงอินดี้ฟังสบายท่ามกลางธรรมชาติในสวนสาธารณะใจกลางเมือง', 'https://images.lifestyleasia.com/wp-content/uploads/sites/8/2023/11/29021001/Untitled-design-90.png', 0, NULL, '2026-03-15 16:48:31', '13.7292', '100.5594', 'ดนตรีและคอนเสิร์ต'),
(62, 'ให้อาหารลิง', '2026-03-18', '2026-03-22', 'วัดเขาตะเกียบ', 'https://maps.app.goo.gl/j62qRPjbM77uV4Pz6', 'มาให้อาหารลิงโดยหลวงพ่อ', '/uploads/1773904570449.jpg', 0, NULL, '2026-03-19 07:16:10', NULL, NULL, 'ท่องเที่ยวธรรมชาติ'),
(63, 'Bangkok Street Food Festival', '2026-03-13', '2026-03-19', 'ลานคนเมือง เสาชิงช้า', 'https://maps.app.goo.gl/3q4WwL9V', 'รวมร้านสตรีทฟู้ดระดับมิชลินไกด์และร้านดังจากทั่วกรุงเทพฯ มาไว้ในที่เดียว', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOjAuH3oYoz5MVhPbJAZ8Xd15OpNa6ZnO_cA&s', 0, NULL, '2026-03-19 15:55:10', '13.7525', '100.5003', 'อาหารและเครื่องดื่ม'),
(64, 'เทศกาลขนมหวานนานาชาติ', '2026-06-30', '2026-07-04', 'Siam Paragon', 'https://maps.app.goo.gl/9xZz', 'สวรรค์ของคนรักของหวาน พบกับเบเกอรี่ ช็อกโกแลต และขนมไทยประยุกต์', 'https://www.siamparagon.co.th/_next/image?url=https%3A%2F%2Fd35olvpjiryw4j.cloudfront.net%2Fpublic%2Fmedia%2F645db860-785a-4b15-a80c-47988237b84c%2FS__28950591.jpg&w=3840&q=75', 0, NULL, '2026-03-19 15:55:10', '13.7468', '100.5346', 'อาหารและเครื่องดื่ม'),
(65, 'Chiang Mai Coffee Week', '2026-11-18', '2026-11-23', 'One Nimman เชียงใหม่', 'https://maps.app.goo.gl/nimman', 'เทศกาลกาแฟที่ใหญ่ที่สุดในภาคเหนือ รวมเมล็ดกาแฟสเปเชียลตี้และบาริสต้าชั้นนำ', 'https://cdnali.zipeventapp.com/images/events/8E61EFBD-08FD-4DC4-AC1E-9DA48A15074E/xl-95FC7387-B28F-4D9E-AFB7-41D3806A2EDE.jpg', 0, NULL, '2026-03-19 15:55:10', '18.8000', '98.9667', 'อาหารและเครื่องดื่ม'),
(66, 'Phuket Seafood Fiesta', '2026-04-09', '2026-04-14', 'หาดป่าตอง ภูเก็ต', 'https://maps.app.goo.gl/patong', 'เทศกาลอาหารทะเลสดๆ ส่งตรงจากชาวประมง พร้อมปาร์ตี้ริมหาด', 'https://absoluteresorts.wordpress.com/wp-content/uploads/2012/08/phuket-seafood-fiesta-brochure.jpg?w=640', 0, NULL, '2026-03-19 15:55:10', '7.8961', '98.2966', 'อาหารและเครื่องดื่ม'),
(67, 'อีสานแซ่บเฟสติวัล', '2026-09-04', '2026-09-09', 'บึงแก่นนคร ขอนแก่น', 'https://maps.app.goo.gl/kkc', 'รวมมิตรอาหารอีสานรสเด็ด ส้มตำ ไก่ย่าง หมอลำ ครบรส!', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3a2AkVUGg5gbtWaO9Qxfkt8eYx-u9SOAOmA&s', 0, NULL, '2026-03-19 15:55:10', '16.4172', '102.8275', 'อาหารและเครื่องดื่ม'),
(68, 'ตลาดนัดรถไฟ ศรีนครินทร์', '2025-12-31', '2026-12-30', 'ตลาดนัดรถไฟ ศรีนครินทร์', 'https://maps.app.goo.gl/train', 'ตลาดนัดกลางคืนสไตล์วินเทจ แหล่งรวมของสะสม เสื้อผ้า และสตรีทฟู้ด', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmRpZMbyp8V2D1ZZTBe6vrkW_dghAQ3SyiYQ&s', 0, NULL, '2026-03-19 15:55:10', '13.6933', '100.6501', 'ตลาดและช้อปปิ้ง'),
(69, 'ถนนคนเดินท่าแพ', '2025-12-31', '2026-12-30', 'ประตูท่าแพ เชียงใหม่', 'https://maps.app.goo.gl/thapae', 'เดินชิลช้อปปิ้งสินค้าพื้นเมือง งานคราฟต์ และของที่ระลึก', 'https://www.cmcity.go.th/data/content/2020/8198/cms/big/image_cms_fgnpsyz13468.jpg', 0, NULL, '2026-03-19 15:55:10', '18.7877', '98.9931', 'ตลาดและช้อปปิ้ง'),
(70, 'ตลาดนัดจตุจักร', '2025-12-31', '2026-12-30', 'ตลาดนัดจตุจักร', 'https://maps.app.goo.gl/jj', 'ตลาดนัดสุดสัปดาห์ที่ใหญ่ที่สุดในโลก มีทุกอย่างให้คุณเลือกสรร', 'https://image.bangkokbiznews.com/uploads/images/md/2025/02/Pj4G5tIwPi9QxlP6YMlS.webp', 0, NULL, '2026-03-19 15:55:10', '13.7999', '100.5550', 'ตลาดและช้อปปิ้ง'),
(71, 'Asiatique Night Market', '2025-12-31', '2026-12-30', 'เอเชียทีค เดอะ ริเวอร์ฟรอนท์', 'https://maps.app.goo.gl/asiatique', 'ช้อปปิ้งริมแม่น้ำเจ้าพระยา พร้อมนั่งชิงช้าสวรรค์ชมวิวเมือง', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0a/38/a4/11/inside-asiatique.jpg?w=900&h=500&s=1', 0, NULL, '2026-03-19 15:55:10', '13.7042', '100.5034', 'ตลาดและช้อปปิ้ง'),
(72, 'ตลาดน้ำดำเนินสะดวก', '2025-12-31', '2026-12-30', 'ตลาดน้ำดำเนินสะดวก ราชบุรี', 'https://maps.app.goo.gl/damnoen', 'สัมผัสวิถีชีวิตริมน้ำ ช้อปปิ้งผลไม้และอาหารจากเรือพาย', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQQQdgpOz5d1GLPMMJrrVQ4np37zyh_kyzVw&s', 0, NULL, '2026-03-19 15:55:10', '13.5194', '99.9597', 'ตลาดและช้อปปิ้ง'),
(73, 'T-Pop Concert Fest', '2026-10-14', '2026-10-15', 'ศูนย์การประชุมแห่งชาติสิริกิติ์', 'https://maps.app.goo.gl/qsncc', 'รวมศิลปิน T-Pop ระดับท็อปของเมืองไทย ร้องเต้นจัดเต็ม', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5N9obyhOzwk6j_cphVIro7_r1MigxYTW3qw&s', 0, NULL, '2026-03-19 15:55:10', '13.7265', '100.5588', 'ดนตรีและคอนเสิร์ต'),
(74, 'Hua Hin Jazz Festival', '2026-03-26', '2026-06-30', 'ชายหาดหัวหิน', 'https://maps.app.goo.gl/huahin', 'เทศกาลดนตรีแจ๊สริมชายหาดสุดโรแมนติก', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkeChDt0-mFerdyvuA-760ZqxUDbJ8sHgpOA&s', 0, NULL, '2026-03-19 15:55:10', '12.5684', '99.9577', 'ดนตรีและคอนเสิร์ต'),
(75, 'E-San Music Festival', '2026-11-27', '2026-11-28', 'เขื่อนอุบลรัตน์ ขอนแก่น', 'https://maps.app.goo.gl/esan', 'คอนเสิร์ตเรกเก้และอีสานอินดี้ริมเขื่อน', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTL7CIobNn3XOAw08bUulg3uYaF2NJ1HMX7yA&s', 0, NULL, '2026-03-19 15:55:10', '16.4167', '102.8333', 'ดนตรีและคอนเสิร์ต'),
(76, 'Very Festival', '2026-11-12', '2026-11-13', 'Show DC', 'https://maps.app.goo.gl/showdc', 'เทศกาลดนตรีอินดี้สากล รวมศิลปินต่างชาติสุดฮิต', 'https://miro.medium.com/v2/resize:fit:6258/1*fibDw6wyJQ67m6VEr_ttVQ.jpeg', 0, NULL, '2026-03-19 15:55:10', '13.7508', '100.5732', 'ดนตรีและคอนเสิร์ต'),
(77, 'Indie Camp Khao Yai', '2026-12-24', '2026-12-26', 'ลานกางเต็นท์ เขาใหญ่', 'https://maps.app.goo.gl/khaoyai', 'แคมป์ปิ้งฟังเพลงอินดี้รับลมหนาว ท่ามกลางธรรมชาติ', 'https://cms.dmpcdn.com/travel/2021/01/28/420aabb0-6122-11eb-9078-bf2e6d432158_original.jpg', 0, NULL, '2026-03-19 15:55:10', '14.4392', '101.3723', 'ดนตรีและคอนเสิร์ต'),
(78, 'นมัสการรอยพระพุทธบาท', '2026-02-14', '2026-04-14', 'เขาคิชฌกูฏ จันทบุรี', 'https://maps.app.goo.gl/chan', 'งานบุญยิ่งใหญ่ประจำปี เดินขึ้นเขาคิชฌกูฏเพื่อความเป็นสิริมงคล', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvmrgBrpXSB7XVT4IQ9DctfS5pcIfjOJiRSg&s', 0, NULL, '2026-03-19 15:55:10', '12.8394', '102.1384', 'เทศกาลและงานวัด'),
(79, 'ประเพณีบุญบั้งไฟ', '2026-05-09', '2026-05-11', 'สวนพญาแถน ยโสธร', 'https://maps.app.goo.gl/yasothon', 'ตื่นตากับขบวนแห่บั้งไฟสุดอลังการ ขอฝนตามประเพณีอีสาน', 'https://www.nuac.nu.ac.th/wp-content/uploads/2025/05/e49e01e4-650a-4a83-975a-a83575e3cd36.jpg', 0, NULL, '2026-03-19 15:55:10', '15.7926', '104.1486', 'เทศกาลและงานวัด'),
(80, 'งานประจำปีทุ่งศรีเมือง', '2026-11-30', '2026-12-09', 'ทุ่งศรีเมือง อุบลราชธานี', 'https://maps.app.goo.gl/ubon', 'งานเฉลิมฉลองประจำปี มีการออกร้านและเครื่องเล่นสวนสนุกมากมาย', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyVUZocAkGW2Vj_1IEOi_k5IyHqaDA9rRPAw&s', 0, NULL, '2026-03-19 15:55:10', '15.2287', '104.8569', 'เทศกาลและงานวัด'),
(81, 'เทศกาลแห่ดาวคริสต์มาส', '2026-12-22', '2026-12-24', 'ชุมชนท่าแร่ สกลนคร', 'https://maps.app.goo.gl/sakon', 'ชมขบวนรถแห่ดาวประดับไฟคริสต์มาสที่สวยที่สุดในไทย', 'https://cms.dmpcdn.com/travel/2021/10/27/bac87e80-3717-11ec-b3a7-619899234ae7_original.jpg', 0, NULL, '2026-03-19 15:55:10', '17.1664', '104.1486', 'เทศกาลและงานวัด'),
(82, 'งานนมัสการองค์พระสมุทรเจดีย์', '2026-10-24', '2026-11-04', 'ศาลากลาง สมุทรปราการ', 'https://maps.app.goo.gl/samut', 'งานวัดริมแม่น้ำเจ้าพระยา ไหว้พระสมุทรเจดีย์และชิมอาหารอร่อย', 'https://cms.dmpcdn.com/travel/2020/10/06/39a3fe70-07a1-11eb-88cb-8537bc42f554_original.JPG', 0, NULL, '2026-03-19 15:55:10', '13.5978', '100.5843', 'เทศกาลและงานวัด'),
(83, 'Bangkok Midnight Marathon', '2026-08-14', '2026-08-14', 'เสาชิงช้า กรุงเทพฯ', 'https://maps.app.goo.gl/run', 'งานวิ่งมาราธอนตอนเที่ยงคืน สัมผัสแสงสีเมืองหลวง', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxrPXj5HuauOEhCUBUmblAxBx4PnmsVxgH3Q&s', 0, NULL, '2026-03-19 15:55:10', '13.7525', '100.5003', 'กีฬาและเอาท์ดอร์'),
(84, 'Phuket Surf Contest', '2026-09-19', '2026-09-21', 'หาดกะตะ ภูเก็ต', 'https://maps.app.goo.gl/surf', 'การแข่งขันกระดานโต้คลื่นระดับประเทศ', 'https://www.mp-uni.com/th/wp-content/uploads/sites/7/2024/07/amazing-phuket-surf-festival-2024-karon-fin-fest-bottom.jpg', 0, NULL, '2026-03-19 15:55:10', '7.8189', '98.2974', 'กีฬาและเอาท์ดอร์'),
(85, 'Khao Yai Trail Run', '2026-11-07', '2026-11-07', 'อุทยานแห่งชาติเขาใหญ่', 'https://maps.app.goo.gl/trail', 'วิ่งเทรลลุยป่า สูดอากาศบริสุทธิ์ในอุทยานแห่งชาติ', 'https://storage.googleapis.com/s.cert.phuket.run/logo/khaoyai-run.jpg', 0, NULL, '2026-03-19 15:55:10', '14.4392', '101.3723', 'กีฬาและเอาท์ดอร์'),
(86, 'Pattaya Beach Volleyball', '2026-05-15', '2026-05-18', 'หาดพัทยา', 'https://maps.app.goo.gl/volley', 'การแข่งขันวอลเลย์บอลชายหาดนานาชาติ', 'https://images.unsplash.com/photo-1612872087720-bb876e2e67d1?q=80&w=500', 0, NULL, '2026-03-19 15:55:10', '12.9430', '100.8841', 'กีฬาและเอาท์ดอร์'),
(87, 'Chiang Mai Cycling Tour', '2026-12-11', '2026-12-11', 'ดอยสุเทพ เชียงใหม่', 'https://maps.app.goo.gl/bike', 'ปั่นจักรยานขึ้นดอยสุเทพ ท้าทายขีดจำกัดของตัวเอง', 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1200,h_630/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/fq4veb83rj3tjosnj9cr/ChiangMaiHalfDayBikeTourbyTrailhead-Klook.jpg', 0, NULL, '2026-03-19 15:55:10', '18.8049', '98.9218', 'กีฬาและเอาท์ดอร์'),
(88, 'BACC Art Exhibition', '2026-02-28', '2026-04-29', 'หอศิลป์กรุงเทพฯ (BACC)', 'https://maps.app.goo.gl/bacc', 'นิทรรศการศิลปะร่วมสมัยจากศิลปินหน้าใหม่มาแรง', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxFfFiAHKkYNG4P8cAdh0tKqZkdVElYIFBBg&s', 0, NULL, '2026-03-19 15:55:10', '13.7466', '100.5300', 'ศิลปะและนิทรรศการ'),
(89, 'Thailand Toy Expo', '2026-04-30', '2026-05-03', 'อิมแพ็ค เมืองทองธานี', 'https://maps.app.goo.gl/toy', 'มหกรรมของเล่นและอาร์ตทอยที่ใหญ่ที่สุดในไทย', 'https://cdn.zipeventapp.com/images/events/2C9C9DF5-4F95-460F-88A9-76360D501A85/F05D478E-8C5E-474F-B965-DDF9F6B6EDAD.jpg', 0, NULL, '2026-03-19 15:55:10', '13.9113', '100.5484', 'ศิลปะและนิทรรศการ'),
(90, 'MOCA Contemporary Showcase', '2026-07-14', '2026-08-14', 'MOCA Bangkok', 'https://maps.app.goo.gl/moca', 'จัดแสดงผลงานจิตรกรรมและประติมากรรมระดับชาติ', 'https://yourthaiguide.com/wp-content/uploads/2019/07/Your-Thai-Guide-MOCA-2.jpg', 0, NULL, '2026-03-19 15:55:10', '13.8525', '100.5606', 'ศิลปะและนิทรรศการ'),
(91, 'Bangkok Art Biennale', '2026-10-19', '2027-02-19', 'วัดอรุณราชวราราม', 'https://maps.app.goo.gl/watarun', 'เทศกาลศิลปะนานาชาติ จัดแสดงผลงานตามวัดและสถานที่สำคัญ', 'https://www.bacc.or.th/wp-content/uploads/2024/09/1.1-Thumbnail-Website.png', 0, NULL, '2026-03-19 15:55:10', '13.7437', '100.4889', 'ศิลปะและนิทรรศการ'),
(92, 'National Book Fair', '2026-03-24', '2026-04-04', 'ศูนย์การประชุมแห่งชาติสิริกิติ์', 'https://maps.app.goo.gl/book', 'งานสัปดาห์หนังสือแห่งชาติ พบปะนักเขียนและเลือกซื้อหนังสือลดราคา', 'https://cdnali.zipeventapp.com/images/events/B02458EA-842F-4F58-9C45-6EE62D808097/xl-661683E2-672F-4479-B55C-8B8246448E09.jpg', 0, NULL, '2026-03-19 15:55:10', '13.7265', '100.5588', 'ศิลปะและนิทรรศการ'),
(93, 'Pet Expo Thailand', '2026-05-20', '2026-05-24', 'อิมแพ็ค เมืองทองธานี', 'https://maps.app.goo.gl/petexpo', 'งานแฟร์สัตว์เลี้ยงที่รวบรวมสินค้าและบริการแบบครบวงจร', 'https://images.unsplash.com/photo-1450778869180-41d0601e046e?q=80&w=500', 0, NULL, '2026-03-19 15:55:10', '13.9113', '100.5484', 'สัตว์เลี้ยง'),
(94, 'Cat Wonderland', '2026-08-10', '2026-08-12', 'Central Westgate', 'https://maps.app.goo.gl/cat', 'ดินแดนสวรรค์ของทาสแมว มีคาเฟ่แมวและประกวดแมวสวยงาม', 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=500', 0, NULL, '2026-03-19 15:55:10', '13.8760', '100.4109', 'สัตว์เลี้ยง'),
(95, 'Dog Agility Show', '2026-09-17', '2026-09-19', 'Mega Bangna', 'https://maps.app.goo.gl/dog', 'ชมการแสดงความสามารถและแข่งขันข้ามสิ่งกีดขวางของน้องหมา', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSd2kJHxlDxrk8JjLtzTI6_j7OHBRFMyOrDrQ&s', 0, NULL, '2026-03-19 15:55:10', '13.6406', '100.6796', 'สัตว์เลี้ยง'),
(96, 'Exotic Pet Fair', '2026-06-04', '2026-06-06', 'Fashion Island', 'https://maps.app.goo.gl/exotic', 'จัดแสดงสัตว์แปลก สัตว์เลื้อยคลาน และสัตว์หายาก', 'https://www.fashionisland.co.th/wp-content/uploads/2024/06/The-Exotic-Animal-2024_Detail.jpg', 0, NULL, '2026-03-19 15:55:10', '13.8247', '100.6778', 'สัตว์เลี้ยง'),
(97, 'Pet Charity Walk', '2026-11-13', '2026-11-13', 'สวนลุมพินี', 'https://maps.app.goo.gl/walk', 'กิจกรรมพาสัตว์เลี้ยงเดินการกุศล นำรายได้ช่วยเหลือสัตว์จรจัด', 'https://medias.thansettakij.com/uploads/images/contents/w1024/2026/02/i9mdvt1InU73gkqDXJCq.webp?x-image-process=style/md-webp', 0, NULL, '2026-03-19 15:55:10', '13.7314', '100.5415', 'สัตว์เลี้ยง'),
(98, 'เทศกาลชมทุ่งดอกกระเจียว', '2026-06-30', '2026-08-30', 'อุทยานแห่งชาติไทรทอง ชัยภูมิ', 'https://maps.app.goo.gl/flower', 'ชมดอกกระเจียวบานสะพรั่งเต็มท้องทุ่งในช่วงหน้าฝน', 'https://www.makalius.co.th/wp-content/post-images/168703-post/-725.jpg', 0, NULL, '2026-03-19 15:55:10', '15.6323', '101.3923', 'ท่องเที่ยวธรรมชาติ'),
(99, 'ดูทะเลหมอก ภูทับเบิก', '2026-10-31', '2027-01-30', 'ภูทับเบิก เพชรบูรณ์', 'https://maps.app.goo.gl/fog', 'ตั้งแคมป์รับลมหนาว ชมพระอาทิตย์ขึ้นและทะเลหมอกสุดอลังการ', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtBcucbuJhPNRVr87G4MlVXpzpiW-NkUmEBQ&s', 0, NULL, '2026-03-19 15:55:10', '16.9011', '101.1042', 'ท่องเที่ยวธรรมชาติ'),
(100, 'เทศกาลชมซากุระเมืองไทย', '2026-01-14', '2026-02-14', 'ภูลมโล เลย', 'https://maps.app.goo.gl/sakura', 'ชมดอกนางพญาเสือโคร่งบานสะพรั่งกลายเป็นหุบเขาสีชมพู', 'https://cms.dmpcdn.com/travel/2025/01/22/64f21820-d89c-11ef-85ef-0be7fc0883d5_webp_original.webp', 0, NULL, '2026-03-19 15:55:10', '16.9856', '101.0772', 'ท่องเที่ยวธรรมชาติ'),
(101, 'ล่องแก่งลำน้ำเข็ก', '2026-07-31', '2026-10-30', 'ลำน้ำเข็ก พิษณุโลก', 'https://maps.app.goo.gl/river', 'ผจญภัยท้าทายสายน้ำ ล่องแก่งสุดมันส์ในช่วงฤดูน้ำหลาก', 'https://phitsanulok.prd.go.th/th/file/get/type/thumbnail/file/20210120fd456406745d816a45cae554c788e754155417.jpg', 0, NULL, '2026-03-19 15:55:10', '16.8732', '100.8267', 'ท่องเที่ยวธรรมชาติ'),
(102, 'ปีนเขาช้างเผือก', '2026-10-31', '2027-01-30', 'อุทยานแห่งชาติทองผาภูมิ กาญจนบุรี', 'https://maps.app.goo.gl/mountain', 'เดินป่าท้าทายสันคมมีด พิชิตยอดเขาช้างเผือก', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH4Dh3ZQLLEDsvvr7C6_xpwkAxYtMWOEX-TQ&s', 0, NULL, '2026-03-19 15:55:10', '14.6853', '98.4116', 'ท่องเที่ยวธรรมชาติ');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` varchar(50) DEFAULT 'alert',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `created_at`) VALUES
(1, 2, 'รีวิวของคุณถูกลบ 🚨', 'รีวิวของคุณในกิจกรรม \"งานวัดภูเขาทอง 2569\" ถูกลบโดยแอดมิน เนื่องจากอาจมีเนื้อหาที่ไม่เหมาะสมหรือผิดกฎการใช้งาน', 'warning', '2026-03-19 17:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_reported` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `event_id`, `user_id`, `rating`, `comment`, `created_at`, `is_reported`) VALUES
(1, 1, 1, 5, 'ดี', '2026-03-15 21:03:49', 0),
(2, 6, 1, 2, 'ไม่ค่อนดี', '2026-03-15 21:04:22', 0),
(3, 1, 1, 4, 'ดีมาก', '2026-03-15 21:04:46', 0),
(4, 7, 2, 5, 'ชอบมากกก', '2026-03-15 21:06:46', 0),
(6, 4, 2, 3, 'เฉยๆ โดนนุงกัดด้วย', '2026-03-15 21:35:49', 0),
(7, 2, 2, 5, 'ชอบมาก ไม่เคยไปแล้วร้อนขนาดนี้มาก่อน เริ่ด', '2026-03-15 21:42:00', 0),
(9, 3, 10, 5, 'ว้าวสนุกจัง', '2026-03-16 02:07:29', 0),
(10, 10, 2, 5, 'เริ่ด', '2026-03-16 02:43:20', 0),
(11, 10, 2, 5, 'เนิ่ด', '2026-03-16 02:45:14', 0),
(12, 10, 2, 3, 'เริ่ด', '2026-03-16 02:45:20', 0),
(13, 1, 12, 5, 'เริ่ด', '2026-03-16 02:46:53', 1),
(14, 2, 12, 5, 'อาจจะยัง', '2026-03-16 02:48:30', 0),
(15, 1, 13, 5, 'เริ่ดมาก เริ่ดอิอิ', '2026-03-16 02:57:43', 0),
(19, 1, 2, 3, 'คนเยอะมาก', '2026-03-19 17:36:36', 0),
(20, 1, 1, 1, 'งานเหี้ยๆ กาก', '2026-03-19 18:11:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_events`
--

CREATE TABLE `saved_events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saved_events`
--

INSERT INTO `saved_events` (`id`, `user_id`, `event_id`, `created_at`) VALUES
(3, 1, 1, '2026-03-15 16:52:00'),
(4, 1, 4, '2026-03-15 16:53:09'),
(5, 1, 5, '2026-03-15 16:53:12'),
(6, 1, 6, '2026-03-15 16:53:15'),
(7, 3, 1, '2026-03-15 17:03:20'),
(10, 5, 10, '2026-03-15 17:36:56'),
(11, 5, 2, '2026-03-15 17:37:18'),
(18, 2, 1, '2026-03-16 02:22:31'),
(20, 2, 10, '2026-03-16 02:43:05'),
(21, 12, 1, '2026-03-16 02:47:25'),
(23, 13, 1, '2026-03-16 02:56:56'),
(24, 12, 2, '2026-03-19 08:15:56'),
(26, 12, 62, '2026-03-19 08:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'peach', 'peach.suppanat@gmail.com', '123456', '2026-03-15 14:56:45'),
(2, 'Peach2', 'test@gmail.com', 'password', '2026-03-15 15:33:05'),
(3, 'Nat', 'nat@gmail.com', 'Password', '2026-03-15 15:48:36'),
(4, 'Win', 'win@gmail.com', '123456', '2026-03-15 15:50:06'),
(5, 'Teast2', 'test2@gmail.com', '123456', '2026-03-15 16:02:28'),
(7, 'siriprapa', 'yodyingworapantsiriprapa@gmail.com', 'Kusuaymak123', '2026-03-15 17:14:15'),
(8, 'pp', 'pp@gmail.com', '123456', '2026-03-15 21:54:03'),
(10, 'mawin', 'winners55558@gmail.coim', '12345', '2026-03-16 02:05:52'),
(11, 'Mawin', 'winsudlor@gmail.com', '123456', '2026-03-16 02:10:50'),
(12, 'เริ่ด', 'r@gmail.com', '123456', '2026-03-16 02:46:14'),
(13, 'mawin', 'sudlor@gmail.com', '123456', '2026-03-16 02:54:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_id` (`event_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `saved_events`
--
ALTER TABLE `saved_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `saved_events`
--
ALTER TABLE `saved_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved_events`
--
ALTER TABLE `saved_events`
  ADD CONSTRAINT `saved_events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `saved_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
