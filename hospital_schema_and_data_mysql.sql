-- Converted from SQLite to MySQL
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
START TRANSACTION;
DROP TABLE IF EXISTS `Admins`;
CREATE TABLE `Admins` (
    admin_id        INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(255),
    last_name       VARCHAR(255),
    username        VARCHAR(255) UNIQUE,
    password_hash   VARCHAR(255),
    email           VARCHAR(255),
    phone           VARCHAR(255),
    role            VARCHAR(255) CHECK(role IN ('SuperAdmin','Receptionist','Accountant','HR','Manager')),
    department_id   INT,
    status          VARCHAR(255) DEFAULT 'Active' CHECK(status IN ('Active','Inactive')),
    last_login      VARCHAR(255),
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES `Departments`(department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Admins` VALUES(1,'Radhika','Tara','radhikatara0','f375a538896767e752c75e0bc1028cbb59b1459bd7b2d9b5c220f00ef1a07057','radhika.tara0@cityhospital.com','+913482477109','SuperAdmin',NULL,'Active','2026-04-10 09:39:20','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(2,'Kashvi','Dutt','kashvidutt1','fd48ded432917e368ab7bfc10dd7bce1816b955f8dc0e821fd4969a039d37f43','kashvi.dutt1@cityhospital.com','+918613171274','HR',9,'Active','2026-06-19 17:43:08','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(3,'Laban','Sagar','labansagar2','7d9a2b8f9316a8ef1f50168684d861d8095e040bda2fc505e21188f02e3aa760','laban.sagar2@cityhospital.com','03782639821','Accountant',NULL,'Active','2026-01-15 21:05:14','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(4,'Lakshit','Sachdeva','lakshitsachdeva3','8f582f7927625174fec5e79f3764c1ae6b98546d0f20d9f300cf25a79d2942db','lakshit.sachdeva3@cityhospital.com','4044997278','HR',NULL,'Active','2026-05-30 17:21:33','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(5,'Wyatt','Pai','wyattpai4','994179063a51364c111145ecf9946dfdcd11042701305b72db3a431a1550c5b9','wyatt.pai4@cityhospital.com','6753396360','Receptionist',2,'Active','2026-08-06 06:45:56','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(6,'Nathan','Solanki','nathansolanki5','f152051026c302ee6f8f3af3284d8d046e04cbd88e624d57fcbe87d7968d2766','nathan.solanki5@cityhospital.com','06270289517','Receptionist',4,'Active','2026-04-14 04:21:53','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(7,'Chandresh','Vora','chandreshvora6','03f5003e1967ac582cbf5a35125116191106c601f5d93389ed9603c9cfb568e3','chandresh.vora6@cityhospital.com','+912621745961','Receptionist',7,'Active','2026-06-18 21:15:03','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(8,'Omya','Walla','omyawalla7','c45641253680ce050ab6a48cb7d990af651e6beb9aaeca7d05feaba61e8e3086','omya.walla7@cityhospital.com','07809134316','HR',NULL,'Active','2026-07-03 11:26:20','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(9,'Chandran','Chaudhry','chandranchaudhry8','e343e521c4f1b214cb0ca41b1ce810108d2763103607d4394a255d1d21c54912','chandran.chaudhry8@cityhospital.com','4005045562','HR',5,'Active','2026-04-28 11:30:41','2026-08-12 08:44:07');
INSERT INTO `Admins` VALUES(10,'Jason','Wali','jasonwali9','3aeba03c25b583f2f78931583766bcbf699a2156c5d198090ca261ae2632ac63','jason.wali9@cityhospital.com','2221969379','Receptionist',10,'Active','2026-01-26 02:40:02','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Admissions`;
CREATE TABLE `Admissions` (
    admission_id           INT AUTO_INCREMENT PRIMARY KEY,
    patient_id             INT,
    doctor_id              INT,
    room_id                INT,
    bed_number             VARCHAR(255),
    admission_date         VARCHAR(255),
    discharge_date         VARCHAR(255),
    reason_for_admission   VARCHAR(255),
    diagnosis              VARCHAR(255),
    treatment_summary      VARCHAR(255),
    admission_type         VARCHAR(255) CHECK(admission_type IN ('Emergency','Planned','Referral')),
    status                 VARCHAR(255) CHECK(status IN ('Admitted','Discharged','Transferred')),
    attendant_name         VARCHAR(255),
    attendant_phone        VARCHAR(255),
    created_by             INT,
    created_at             DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES `Patients`(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES `Doctors`(doctor_id),
    FOREIGN KEY (room_id) REFERENCES `Rooms`(room_id),
    FOREIGN KEY (created_by) REFERENCES `Admins`(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Admissions` VALUES(1,15,11,3,'B2','2025-03-11 13:55:57','2025-03-15 13:55:57','Observation','Post-operative recovery','Treated and discharged in stable condition','Planned','Discharged','George Narain','+919398343018',5,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(2,12,14,19,'B4','2025-12-17 02:46:05','2025-12-20 02:46:05','Observation','Post-operative recovery','Treated and discharged in stable condition','Emergency','Transferred','Gagan Vala','03759980562',3,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(3,95,14,17,'B2','2025-08-29 08:48:46','2025-09-02 08:48:46','Severe infection','Under evaluation','Treated and discharged in stable condition','Referral','Transferred','Kala Raju','00455478137',3,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(4,11,2,9,'B4','2025-01-07 19:42:52','2025-01-21 19:42:52','Observation','Stable, responding to treatment','Treated and discharged in stable condition','Planned','Transferred','Saanvi Mani','+916629912347',10,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(5,24,15,25,'B2','2025-10-14 14:29:10','2025-10-24 14:29:10','Surgery','Stable, responding to treatment','Treated and discharged in stable condition','Planned','Transferred','Dominic Prashad','+910646287923',9,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(6,45,21,4,'B4','2025-06-28 16:38:45','2025-07-10 16:38:45','Observation','Stable, responding to treatment','Treated and discharged in stable condition','Emergency','Discharged','Lakshmi Mann','7049478730',4,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(7,13,27,33,'B3','2026-01-06 22:18:38','2026-01-09 22:18:38','Severe infection','Post-operative recovery','Treated and discharged in stable condition','Planned','Transferred','Mitesh Lala','07146273014',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(8,55,13,12,'B3','2026-03-06 13:33:19','2026-03-13 13:33:19','Delivery','Under evaluation','Treated and discharged in stable condition','Referral','Discharged','Ekalinga Pathak','7964715890',10,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(9,93,4,18,'B2','2025-08-30 20:13:09','2025-09-06 20:13:09','Severe infection','Stable, responding to treatment','Treated and discharged in stable condition','Emergency','Transferred','Nicholas Bhardwaj','+915725204565',1,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(10,64,13,12,'B4','2026-06-14 19:26:30','2026-06-27 19:26:30','Observation','Post-operative recovery','Treated and discharged in stable condition','Referral','Discharged','Bimala Manne','1832192855',7,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(11,21,22,6,'B1','2025-08-09 09:15:30','2025-08-20 09:15:30','Delivery','Stable, responding to treatment','Treated and discharged in stable condition','Planned','Transferred','Anika Patil','+918952028457',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(12,72,26,28,'B2','2025-12-19 00:43:19','2025-12-25 00:43:19','Accident/Trauma','Stable, responding to treatment','Treated and discharged in stable condition','Referral','Discharged','Harini Gaba','+913283389888',5,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(13,87,16,30,'B3','2026-05-15 16:16:20','2026-05-22 16:16:20','Delivery','Stable, responding to treatment','Treated and discharged in stable condition','Emergency','Discharged','Omisha Sharma','+911207545279',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(14,79,27,35,'B3','2026-02-19 02:35:51',NULL,'Severe infection','Post-operative recovery',NULL,'Planned','Admitted','Orinder Modi','+911322342321',5,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(15,83,25,24,'B4','2025-10-05 16:11:53','2025-10-11 16:11:53','Delivery','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Isaac Brahmbhatt','+917603108907',3,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(16,33,24,16,'B1','2025-08-04 06:04:37','2025-08-06 06:04:37','Delivery','Stable, responding to treatment','Treated and discharged in stable condition','Emergency','Discharged','Zehaan Bassi','+914011939325',7,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(17,14,9,43,'B3','2025-06-09 03:04:10','2025-06-16 03:04:10','Severe infection','Under evaluation','Treated and discharged in stable condition','Referral','Transferred','Gautam Dhingra','4955289389',8,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(18,68,3,12,'B3','2025-01-30 01:16:47','2025-02-13 01:16:47','Delivery','Post-operative recovery','Treated and discharged in stable condition','Referral','Transferred','Hardik Atwal','3342801387',9,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(19,90,8,40,'B4','2025-07-01 21:30:41','2025-07-12 21:30:41','Accident/Trauma','Stable, responding to treatment','Treated and discharged in stable condition','Referral','Transferred','Qasim Sarraf','1256638361',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(20,30,28,36,'B2','2026-03-29 11:12:32','2026-04-03 11:12:32','Observation','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Jatin Shukla','+918275480157',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(21,69,15,21,'B4','2026-05-19 17:22:10','2026-06-01 17:22:10','Observation','Stable, responding to treatment','Treated and discharged in stable condition','Emergency','Discharged','Lekha Mander','09473864631',9,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(22,53,6,30,'B4','2026-03-24 14:22:20','2026-04-05 14:22:20','Delivery','Under evaluation','Treated and discharged in stable condition','Planned','Discharged','Jhalak Gola','+917167811266',7,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(23,98,24,20,'B3','2025-10-06 10:21:53','2025-10-15 10:21:53','Delivery','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Om Bhattacharyya','03539613674',3,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(24,82,5,24,'B2','2026-04-09 09:54:29','2026-04-17 09:54:29','Observation','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Mugdha Parekh','09678427114',9,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(25,14,1,3,'B1','2025-10-03 04:33:09','2025-10-15 04:33:09','Severe infection','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Widisha Kashyap','2010170269',8,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(26,54,14,18,'B1','2026-05-26 13:31:19','2026-06-08 13:31:19','Observation','Under evaluation','Treated and discharged in stable condition','Emergency','Discharged','Michael Mitter','9118773477',5,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(27,70,7,34,'B4','2025-07-05 06:59:51','2025-07-10 06:59:51','Surgery','Under evaluation','Treated and discharged in stable condition','Referral','Discharged','Hemal Zachariah','0061675677',7,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(28,95,8,36,'B2','2025-07-23 16:46:42','2025-07-25 16:46:42','Delivery','Post-operative recovery','Treated and discharged in stable condition','Referral','Transferred','Bachittar Goel','4276246719',6,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(29,94,23,11,'B4','2026-07-17 18:57:58',NULL,'Observation','Under evaluation',NULL,'Planned','Admitted','Upma Soni','2806479695',1,'2026-08-12 08:44:07');
INSERT INTO `Admissions` VALUES(30,31,4,19,'B3','2025-11-29 00:32:54',NULL,'Accident/Trauma','Under evaluation',NULL,'Planned','Admitted','Ekani Bhat','+919025590561',4,'2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Appointments`;
CREATE TABLE `Appointments` (
    appointment_id    INT AUTO_INCREMENT PRIMARY KEY,
    patient_id        INT,
    doctor_id         INT,
    department_id     INT,
    appointment_date  VARCHAR(255),
    appointment_time  VARCHAR(255),
    appointment_type  VARCHAR(255) CHECK(appointment_type IN ('New','Follow-up')),
    status            VARCHAR(255) CHECK(status IN ('Scheduled','Completed','Cancelled','No-show')),
    reason_for_visit  VARCHAR(255),
    symptoms          VARCHAR(255),
    diagnosis         VARCHAR(255),
    notes             VARCHAR(255),
    created_by        INT,
    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at        DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES `Patients`(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES `Doctors`(doctor_id),
    FOREIGN KEY (department_id) REFERENCES `Departments`(department_id),
    FOREIGN KEY (created_by) REFERENCES `Admins`(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Appointments` VALUES(1,52,5,5,'2025-06-25','16:30:00','New','Scheduled','Skin rash','Skin rash',NULL,'Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(2,76,14,4,'2026-02-10','13:30:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(3,82,22,2,'2025-07-18','14:30:00','New','Scheduled','Routine checkup','Routine checkup',NULL,'Patient advised rest',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(4,26,13,3,'2025-03-19','11:45:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,'Referred for lab tests',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(5,81,20,10,'2025-03-11','16:45:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(6,65,11,1,'2026-04-08','09:00:00','Follow-up','Scheduled','Abdominal pain','Abdominal pain',NULL,'Review in 2 weeks',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(7,77,22,2,'2026-07-22','09:45:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(8,20,28,8,'2025-04-16','14:00:00','New','No-show','Abdominal pain','Abdominal pain',NULL,NULL,4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(9,68,18,8,'2026-01-08','14:30:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Referred for lab tests',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(10,81,10,10,'2025-12-04','10:45:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(11,11,13,3,'2025-12-25','13:45:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment',NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(12,83,19,9,'2026-06-24','10:45:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment',NULL,6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(13,28,5,5,'2025-07-16','12:15:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment',NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(14,99,22,2,'2025-02-08','14:15:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(15,99,23,3,'2026-03-25','09:45:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(16,97,20,10,'2025-08-28','17:15:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Referred for lab tests',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(17,74,26,6,'2025-10-16','15:45:00','New','No-show','Abdominal pain','Abdominal pain',NULL,'Patient advised rest',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(18,7,13,3,'2026-07-22','10:00:00','Follow-up','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment',NULL,3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(19,66,15,5,'2025-04-04','12:45:00','Follow-up','Scheduled','Shortness of breath','Shortness of breath',NULL,NULL,7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(20,65,11,1,'2025-03-25','14:15:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Review in 2 weeks',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(21,18,6,6,'2025-05-23','16:45:00','New','Scheduled','Abdominal pain','Abdominal pain',NULL,NULL,1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(22,20,5,5,'2026-06-25','15:00:00','Follow-up','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Patient advised rest',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(23,31,2,2,'2026-04-14','10:00:00','Follow-up','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment',NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(24,92,10,10,'2025-01-02','14:15:00','Follow-up','Scheduled','Shortness of breath','Shortness of breath',NULL,'Patient advised rest',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(25,9,19,9,'2026-06-04','17:00:00','Follow-up','No-show','Routine checkup','Routine checkup',NULL,'Referred for lab tests',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(26,33,17,7,'2025-03-11','14:15:00','New','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(27,70,11,1,'2026-04-21','16:15:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment',NULL,8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(28,26,11,1,'2025-02-12','14:30:00','Follow-up','Scheduled','Headache and dizziness','Headache and dizziness',NULL,'Referred for lab tests',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(29,25,21,1,'2025-12-06','13:00:00','Follow-up','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment','Referred for lab tests',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(30,44,18,8,'2026-05-25','14:30:00','New','No-show','Abdominal pain','Abdominal pain',NULL,'Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(31,24,27,7,'2025-04-16','10:30:00','Follow-up','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Review in 2 weeks',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(32,55,30,10,'2025-12-26','16:00:00','Follow-up','Scheduled','Abdominal pain','Abdominal pain',NULL,'Referred for lab tests',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(33,86,1,1,'2026-06-10','11:00:00','New','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Referred for lab tests',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(34,31,3,3,'2026-01-06','15:00:00','New','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Referred for lab tests',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(35,98,16,6,'2026-06-27','14:45:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,'Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(36,95,2,2,'2026-02-01','17:00:00','Follow-up','Scheduled','Routine checkup','Routine checkup',NULL,'Review in 2 weeks',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(37,37,24,4,'2025-07-24','10:15:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Referred for lab tests',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(38,88,8,8,'2025-12-22','10:30:00','Follow-up','No-show','Skin rash','Skin rash',NULL,'Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(39,29,26,6,'2025-05-23','12:45:00','New','Scheduled','Headache and dizziness','Headache and dizziness',NULL,'Review in 2 weeks',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(40,60,20,10,'2025-05-13','10:00:00','Follow-up','Cancelled','Routine checkup','Routine checkup',NULL,'Referred for lab tests',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(41,99,19,9,'2025-03-17','11:30:00','New','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Referred for lab tests',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(42,17,19,9,'2025-07-06','11:45:00','New','Cancelled','Routine checkup','Routine checkup',NULL,NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(43,22,13,3,'2025-12-21','17:30:00','New','Scheduled','Headache and dizziness','Headache and dizziness',NULL,'Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(44,17,19,9,'2026-07-01','10:15:00','New','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Patient advised rest',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(45,73,20,10,'2025-03-25','09:30:00','New','Scheduled','Fever and body ache','Fever and body ache',NULL,'Referred for lab tests',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(46,81,11,1,'2026-05-10','12:45:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment','Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(47,57,1,1,'2025-07-28','14:15:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Review in 2 weeks',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(48,98,7,7,'2025-04-19','14:15:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment',NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(49,19,8,8,'2026-01-29','15:15:00','New','Scheduled','Joint pain','Joint pain',NULL,'Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(50,98,6,6,'2026-04-24','16:30:00','Follow-up','Scheduled','Routine checkup','Routine checkup',NULL,NULL,2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(51,59,27,7,'2025-12-28','09:00:00','Follow-up','No-show','Headache and dizziness','Headache and dizziness',NULL,'Referred for lab tests',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(52,69,18,8,'2026-03-18','11:30:00','Follow-up','Scheduled','Chest pain','Chest pain',NULL,'Referred for lab tests',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(53,7,11,1,'2026-01-07','17:30:00','New','Completed','Headache and dizziness','Headache and dizziness','Likely headache and dizziness, prescribed treatment','Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(54,36,28,8,'2025-05-02','11:00:00','Follow-up','Cancelled','Follow-up review','Follow-up review',NULL,'Review in 2 weeks',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(55,97,19,9,'2026-06-06','15:00:00','New','Scheduled','Follow-up review','Follow-up review',NULL,NULL,3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(56,67,16,6,'2026-06-12','11:30:00','Follow-up','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Patient advised rest',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(57,39,30,10,'2026-06-06','17:45:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Referred for lab tests',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(58,87,16,6,'2025-11-12','09:45:00','Follow-up','Scheduled','Shortness of breath','Shortness of breath',NULL,'Patient advised rest',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(59,22,20,10,'2026-01-25','11:15:00','New','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment',NULL,4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(60,41,11,1,'2025-07-28','15:45:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Patient advised rest',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(61,42,24,4,'2026-06-23','15:30:00','New','No-show','Abdominal pain','Abdominal pain',NULL,'Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(62,46,26,6,'2026-05-11','12:15:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(63,91,15,5,'2025-11-21','16:30:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Review in 2 weeks',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(64,70,30,10,'2025-12-20','11:30:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Review in 2 weeks',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(65,84,16,6,'2025-08-08','12:30:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Patient advised rest',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(66,76,30,10,'2026-06-28','12:15:00','New','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment',NULL,7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(67,61,26,6,'2025-01-06','17:15:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,'Referred for lab tests',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(68,42,14,4,'2025-04-02','12:00:00','New','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment','Referred for lab tests',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(69,64,11,1,'2025-02-08','09:30:00','New','Scheduled','Joint pain','Joint pain',NULL,'Review in 2 weeks',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(70,70,28,8,'2026-06-01','16:30:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment',NULL,6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(71,59,23,3,'2025-01-15','14:30:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(72,66,17,7,'2025-04-08','11:15:00','Follow-up','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(73,50,11,1,'2025-12-04','13:00:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(74,16,21,1,'2026-02-20','17:30:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Review in 2 weeks',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(75,29,10,10,'2025-06-06','16:30:00','Follow-up','No-show','Abdominal pain','Abdominal pain',NULL,'Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(76,88,4,4,'2026-06-23','16:30:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment',NULL,1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(77,26,29,9,'2025-06-18','14:45:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(78,66,8,8,'2026-04-10','11:45:00','Follow-up','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment',NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(79,40,28,8,'2025-09-18','09:15:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment',NULL,7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(80,9,26,6,'2025-03-12','16:00:00','Follow-up','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment','Referred for lab tests',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(81,94,23,3,'2026-01-19','15:45:00','Follow-up','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(82,84,9,9,'2025-07-02','17:45:00','New','Cancelled','Chest pain','Chest pain',NULL,'Patient advised rest',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(83,60,11,1,'2026-03-11','17:45:00','New','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Patient advised rest',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(84,36,6,6,'2025-02-02','15:00:00','New','Scheduled','Chest pain','Chest pain',NULL,'Patient advised rest',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(85,5,22,2,'2025-09-08','09:45:00','Follow-up','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment','Patient advised rest',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(86,18,4,4,'2025-08-28','14:30:00','New','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment','Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(87,53,9,9,'2026-07-25','11:45:00','Follow-up','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment',NULL,6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(88,41,27,7,'2025-06-02','13:45:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Referred for lab tests',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(89,91,14,4,'2025-03-01','17:45:00','Follow-up','Scheduled','Abdominal pain','Abdominal pain',NULL,'Patient advised rest',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(90,27,14,4,'2026-04-06','14:00:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment',NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(91,78,27,7,'2025-07-12','17:15:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Patient advised rest',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(92,28,5,5,'2026-05-06','12:15:00','Follow-up','No-show','Chest pain','Chest pain',NULL,'Patient advised rest',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(93,49,16,6,'2025-11-12','13:30:00','Follow-up','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(94,27,18,8,'2025-02-16','12:15:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Review in 2 weeks',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(95,93,30,10,'2025-07-20','14:15:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(96,88,29,9,'2026-05-18','16:15:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(97,24,19,9,'2025-03-02','17:00:00','New','Cancelled','Routine checkup','Routine checkup',NULL,NULL,1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(98,81,7,7,'2025-01-10','12:45:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment',NULL,10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(99,85,20,10,'2026-06-29','17:45:00','New','Completed','Fever and body ache','Fever and body ache','Likely fever and body ache, prescribed treatment',NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(100,37,25,5,'2025-07-03','10:00:00','New','Scheduled','Shortness of breath','Shortness of breath',NULL,'Patient advised rest',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(101,33,30,10,'2026-02-11','10:30:00','Follow-up','Cancelled','Joint pain','Joint pain',NULL,'Referred for lab tests',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(102,29,24,4,'2025-02-02','10:45:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(103,82,8,8,'2025-03-26','16:45:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(104,28,1,1,'2026-05-02','13:00:00','New','Cancelled','Follow-up review','Follow-up review',NULL,'Review in 2 weeks',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(105,5,30,10,'2025-01-17','12:15:00','Follow-up','Scheduled','Skin rash','Skin rash',NULL,NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(106,31,23,3,'2026-07-08','14:45:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment',NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(107,13,6,6,'2025-12-15','15:30:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(108,46,8,8,'2026-03-19','11:45:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(109,35,2,2,'2026-02-03','14:30:00','New','Scheduled','Persistent cough','Persistent cough',NULL,NULL,1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(110,47,15,5,'2025-05-16','10:15:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(111,53,29,9,'2025-12-29','17:00:00','Follow-up','Scheduled','Chest pain','Chest pain',NULL,'Referred for lab tests',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(112,50,15,5,'2025-09-06','17:15:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(113,35,15,5,'2025-06-21','15:30:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(114,33,12,2,'2025-07-20','16:00:00','New','No-show','Abdominal pain','Abdominal pain',NULL,'Review in 2 weeks',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(115,80,17,7,'2026-03-27','14:45:00','New','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Review in 2 weeks',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(116,26,30,10,'2026-02-12','14:30:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(117,51,17,7,'2025-07-24','17:15:00','New','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Referred for lab tests',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(118,89,18,8,'2026-05-27','11:30:00','New','Scheduled','Shortness of breath','Shortness of breath',NULL,'Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(119,10,17,7,'2026-05-06','15:45:00','New','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Review in 2 weeks',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(120,11,30,10,'2025-12-30','11:00:00','Follow-up','Scheduled','Headache and dizziness','Headache and dizziness',NULL,'Review in 2 weeks',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(121,13,2,2,'2026-06-16','17:15:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Review in 2 weeks',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(122,76,28,8,'2025-12-20','09:45:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Review in 2 weeks',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(123,94,2,2,'2025-12-18','16:15:00','Follow-up','Scheduled','Joint pain','Joint pain',NULL,'Review in 2 weeks',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(124,93,12,2,'2025-03-10','13:00:00','New','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment',NULL,6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(125,22,22,2,'2026-06-13','11:15:00','Follow-up','No-show','Headache and dizziness','Headache and dizziness',NULL,'Referred for lab tests',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(126,81,14,4,'2026-02-10','09:15:00','Follow-up','Scheduled','Shortness of breath','Shortness of breath',NULL,'Referred for lab tests',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(127,28,21,1,'2025-04-15','17:15:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(128,34,8,8,'2026-06-25','14:45:00','Follow-up','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment',NULL,6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(129,80,16,6,'2025-03-28','11:30:00','New','Scheduled','Joint pain','Joint pain',NULL,'Patient advised rest',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(130,48,2,2,'2026-02-02','15:15:00','Follow-up','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Referred for lab tests',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(131,69,28,8,'2026-07-23','11:45:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(132,80,16,6,'2025-01-10','16:15:00','New','Scheduled','Skin rash','Skin rash',NULL,'Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(133,64,29,9,'2026-03-02','16:45:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment',NULL,10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(134,38,1,1,'2026-07-05','13:15:00','Follow-up','Scheduled','Headache and dizziness','Headache and dizziness',NULL,'Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(135,74,9,9,'2026-01-11','17:00:00','Follow-up','Scheduled','Routine checkup','Routine checkup',NULL,'Patient advised rest',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(136,84,22,2,'2025-02-03','16:30:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment',NULL,8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(137,27,2,2,'2025-12-26','15:15:00','New','Cancelled','Follow-up review','Follow-up review',NULL,'Patient advised rest',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(138,45,21,1,'2026-07-06','11:30:00','Follow-up','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(139,87,25,5,'2026-02-26','09:30:00','New','Cancelled','Persistent cough','Persistent cough',NULL,'Patient advised rest',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(140,42,23,3,'2026-05-17','11:30:00','Follow-up','Cancelled','Shortness of breath','Shortness of breath',NULL,'Referred for lab tests',8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(141,99,22,2,'2025-10-12','14:45:00','Follow-up','Scheduled','Routine checkup','Routine checkup',NULL,'Review in 2 weeks',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(142,12,21,1,'2026-01-02','10:45:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Referred for lab tests',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(143,42,18,8,'2026-07-15','11:45:00','Follow-up','Cancelled','Skin rash','Skin rash',NULL,NULL,1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(144,59,22,2,'2026-03-28','16:00:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,'Patient advised rest',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(145,36,5,5,'2025-09-14','10:30:00','New','Scheduled','Skin rash','Skin rash',NULL,NULL,7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(146,90,25,5,'2025-04-04','10:00:00','New','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(147,29,23,3,'2025-01-10','09:30:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Referred for lab tests',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(148,30,8,8,'2025-04-16','14:30:00','Follow-up','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Patient advised rest',7,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(149,87,23,3,'2026-07-31','09:15:00','Follow-up','Scheduled','Routine checkup','Routine checkup',NULL,'Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(150,79,13,3,'2025-03-30','10:15:00','New','Completed','Headache and dizziness','Headache and dizziness','Likely headache and dizziness, prescribed treatment','Referred for lab tests',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(151,18,17,7,'2025-09-12','17:30:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(152,66,29,9,'2025-10-30','09:15:00','Follow-up','Scheduled','Shortness of breath','Shortness of breath',NULL,'Referred for lab tests',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(153,82,14,4,'2025-01-13','14:30:00','New','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Referred for lab tests',10,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(154,70,17,7,'2025-03-16','09:00:00','New','Completed','Abdominal pain','Abdominal pain','Likely abdominal pain, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(155,51,1,1,'2026-03-02','15:45:00','New','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Patient advised rest',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(156,11,12,2,'2025-06-09','17:30:00','Follow-up','Completed','Headache and dizziness','Headache and dizziness','Likely headache and dizziness, prescribed treatment',NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(157,31,27,7,'2026-03-21','10:45:00','New','Scheduled','Chest pain','Chest pain',NULL,'Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(158,91,2,2,'2025-06-17','16:30:00','Follow-up','Scheduled','Fever and body ache','Fever and body ache',NULL,'Patient advised rest',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(159,100,23,3,'2025-01-31','14:45:00','Follow-up','Cancelled','Chest pain','Chest pain',NULL,NULL,5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(160,10,30,10,'2026-01-04','09:45:00','New','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(161,74,5,5,'2025-08-22','17:00:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment',NULL,4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(162,47,11,1,'2025-07-03','09:45:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Review in 2 weeks',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(163,41,27,7,'2026-08-09','14:00:00','New','Completed','Chest pain','Chest pain','Likely chest pain, prescribed treatment','Patient advised rest',4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(164,52,9,9,'2025-10-17','13:30:00','New','Scheduled','Abdominal pain','Abdominal pain',NULL,'Referred for lab tests',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(165,38,6,6,'2025-09-06','16:30:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment','Patient advised rest',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(166,1,4,4,'2025-08-27','17:30:00','New','No-show','Fever and body ache','Fever and body ache',NULL,'Review in 2 weeks',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(167,94,27,7,'2026-06-27','12:45:00','Follow-up','Completed','Headache and dizziness','Headache and dizziness','Likely headache and dizziness, prescribed treatment',NULL,3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(168,6,5,5,'2026-02-27','14:45:00','New','No-show','Routine checkup','Routine checkup',NULL,NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(169,51,23,3,'2025-03-05','15:15:00','New','Scheduled','Follow-up review','Follow-up review',NULL,'Review in 2 weeks',5,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(170,90,16,6,'2025-11-22','16:30:00','New','Cancelled','Skin rash','Skin rash',NULL,NULL,4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(171,14,23,3,'2026-04-06','16:30:00','Follow-up','Scheduled','Persistent cough','Persistent cough',NULL,NULL,9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(172,58,6,6,'2025-05-03','10:15:00','Follow-up','Completed','Joint pain','Joint pain','Likely joint pain, prescribed treatment',NULL,4,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(173,12,6,6,'2026-02-10','17:00:00','Follow-up','Completed','Skin rash','Skin rash','Likely skin rash, prescribed treatment','Review in 2 weeks',3,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(174,58,11,1,'2025-09-13','10:45:00','New','Completed','Routine checkup','Routine checkup','Likely routine checkup, prescribed treatment','Patient advised rest',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(175,100,1,1,'2025-07-22','15:30:00','New','No-show','Persistent cough','Persistent cough',NULL,'Review in 2 weeks',2,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(176,26,1,1,'2025-05-12','10:30:00','New','Cancelled','Abdominal pain','Abdominal pain',NULL,NULL,8,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(177,74,1,1,'2026-05-24','09:45:00','Follow-up','Completed','Shortness of breath','Shortness of breath','Likely shortness of breath, prescribed treatment','Patient advised rest',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(178,36,4,4,'2025-02-05','12:30:00','Follow-up','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Referred for lab tests',9,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(179,12,8,8,'2026-03-06','12:15:00','New','Completed','Persistent cough','Persistent cough','Likely persistent cough, prescribed treatment','Referred for lab tests',6,'2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Appointments` VALUES(180,63,28,8,'2026-05-30','14:45:00','Follow-up','Completed','Follow-up review','Follow-up review','Likely follow-up review, prescribed treatment','Patient advised rest',1,'2026-08-12 08:44:07','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Departments`;
CREATE TABLE `Departments` (
    department_id     INT AUTO_INCREMENT PRIMARY KEY,
    department_name   VARCHAR(255) NOT NULL,
    description        VARCHAR(255),
    head_doctor_id     INT,
    floor_number       INT,
    phone_extension    VARCHAR(255),
    status             VARCHAR(255) DEFAULT 'Active' CHECK(status IN ('Active','Inactive')),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Departments` VALUES(1,'Cardiology','Heart and cardiovascular care',1,1,'1000','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(2,'Neurology','Brain, spine and nervous system care',2,1,'1001','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(3,'Orthopedics','Bone, joint and muscle care',3,3,'1002','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(4,'Pediatrics','Child healthcare',14,2,'1003','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(5,'Dermatology','Skin, hair and nail care',15,2,'1004','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(6,'ENT','Ear, nose and throat care',16,2,'1005','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(7,'General Medicine','General adult healthcare',7,1,'1006','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(8,'Gynecology & Obstetrics','Women''s health and maternity care',18,5,'1007','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(9,'Oncology','Cancer diagnosis and treatment',9,1,'1008','Active','2026-08-12 08:44:07');
INSERT INTO `Departments` VALUES(10,'Psychiatry','Mental health care',10,5,'1009','Active','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Doctors`;
CREATE TABLE `Doctors` (
    doctor_id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name         VARCHAR(255) NOT NULL,
    last_name          VARCHAR(255) NOT NULL,
    gender             VARCHAR(255) CHECK(gender IN ('M','F','Other')),
    dob                VARCHAR(255),
    phone              VARCHAR(255),
    email              VARCHAR(255) UNIQUE,
    address            VARCHAR(255),
    specialization     VARCHAR(255),
    qualification      VARCHAR(255),
    department_id      INT,
    experience_years   INT,
    consultation_fee   DECIMAL(10,2),
    joining_date       VARCHAR(255),
    status             VARCHAR(255) DEFAULT 'Active' CHECK(status IN ('Active','Inactive','On Leave')),
    license_number     VARCHAR(255) UNIQUE,
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES `Departments`(department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Doctors` VALUES(1,'Dayita','Bakshi','F','1966-06-05','4332181960','dr.dayita.bakshi0@cityhospital.com','389, Issac Nagar, Muzaffarnagar 940265','Interventional Cardiology','MBBS, MS',1,2,800.0,'2017-02-06','Active','MCI-100000','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(2,'Liam','Dugal','M','1989-06-12','+915116155940','dr.liam.dugal1@cityhospital.com','18, Pathak Road, Coimbatore-341316','Epileptology','MBBS, DNB',2,15,500.0,'2019-12-11','Active','MCI-100001','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(3,'Liam','Setty','M','1972-02-29','5255341928','dr.liam.setty2@cityhospital.com','64, Kanda Circle, Pimpri-Chinchwad-056413','Sports Medicine','MBBS, MD, DM',3,24,400.0,'2024-06-24','Active','MCI-100002','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(4,'Nisha','Kala','F','1969-08-02','7672423884','dr.nisha.kala3@cityhospital.com','H.No. 32, Tak Circle, Nashik-226916','Neonatology','MBBS, MD, DM',4,4,1500.0,'2023-07-10','Active','MCI-100003','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(5,'Sai','Sidhu','F','1966-12-13','4801845146','dr.sai.sidhu4@cityhospital.com','H.No. 482, Cherian Circle, Guna-252880','General Dermatology','MBBS, MD',5,25,600.0,'2025-04-21','Active','MCI-100004','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(6,'Ojasvi','Suresh','F','1981-03-23','+911543039117','dr.ojasvi.suresh5@cityhospital.com','782, Wable Road, Rajpur Sonarpur 465787','Head & Neck Surgery','MBBS, MD',6,20,300.0,'2019-04-25','Active','MCI-100005','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(7,'Dipta','Kota','F','1968-07-31','+911509839301','dr.dipta.kota6@cityhospital.com','H.No. 051, Khanna Circle, Shivpuri 829973','Internal Medicine','MBBS, MS, MCh',7,29,500.0,'2020-03-22','Active','MCI-100006','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(8,'Vritti','Ray','F','1972-04-18','+911165667010','dr.vritti.ray7@cityhospital.com','H.No. 333, Sen Circle, Bhusawal-473178','High-risk Obstetrics','MBBS, MD, DM',8,13,1000.0,'2022-12-20','On Leave','MCI-100007','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(9,'Chandran','Bedi','M','1972-09-04','8013267736','dr.chandran.bedi8@cityhospital.com','06, Sha Road, Bhusawal 234309','Medical Oncology','MBBS, MS, MCh',9,19,600.0,'2020-06-28','Active','MCI-100008','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(10,'Azaan','Murthy','M','1979-07-20','+910978820812','dr.azaan.murthy9@cityhospital.com','36/193, Baral, Gurgaon 435346','Child Psychiatry','MBBS, MD',10,28,1500.0,'2016-04-03','Active','MCI-100009','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(11,'Ekaja','Mital','F','1967-12-21','05107991183','dr.ekaja.mital10@cityhospital.com','H.No. 13, Mane Path, Bahraich 980841','Interventional Cardiology','MBBS, MS, MCh',1,8,600.0,'2022-01-21','Inactive','MCI-100010','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(12,'Ekani','Lalla','F','1971-05-30','+911824493534','dr.ekani.lalla11@cityhospital.com','H.No. 164, Aggarwal Nagar, Bikaner-278680','Stroke Medicine','MBBS, DNB',2,10,800.0,'2018-02-17','Active','MCI-100011','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(13,'Dayita','Borra','F','1982-12-01','2805982620','dr.dayita.borra12@cityhospital.com','H.No. 533, Pandya Zila, Udupi 322602','Joint Replacement','MBBS, DNB',3,13,600.0,'2019-12-02','Active','MCI-100012','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(14,'Ojas','Sabharwal','M','1969-12-02','3421607337','dr.ojas.sabharwal13@cityhospital.com','303, Narasimhan Marg, Coimbatore 586850','General Pediatrics','MBBS, MS, MCh',4,6,800.0,'2018-08-03','Active','MCI-100013','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(15,'Devika','Lal','F','1985-12-30','+919401965569','dr.devika.lal14@cityhospital.com','34/06, Venkatesh Nagar, Bharatpur 159514','General Dermatology','MBBS, MD',5,18,1000.0,'2020-08-21','Active','MCI-100014','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(16,'Yashica','More','F','1980-04-05','6564823662','dr.yashica.more15@cityhospital.com','04/43, Nagy Marg, Mango 387214','Rhinology','MBBS, MS',6,5,600.0,'2021-08-01','Active','MCI-100015','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(17,'Yasti','Nayak','F','1987-06-16','+913433200379','dr.yasti.nayak16@cityhospital.com','93, Talwar Marg, Latur 016328','General Physician','MBBS, MD',7,26,1500.0,'2019-01-03','Active','MCI-100016','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(18,'Vincent','Bedi','M','1971-11-10','3172788957','dr.vincent.bedi17@cityhospital.com','774, Malhotra Ganj, Mathura-714345','General Gynecology','MBBS, DNB',8,13,300.0,'2018-08-16','Active','MCI-100017','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(19,'Odika','Zachariah','F','1965-11-16','+912236231665','dr.odika.zachariah18@cityhospital.com','H.No. 366, Bahri, Morena-546688','Surgical Oncology','MBBS, MS',9,5,300.0,'2023-02-21','Active','MCI-100018','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(20,'Imaran','Sura','M','1968-11-04','+914670656272','dr.imaran.sura19@cityhospital.com','90/16, Shenoy Street, Dhanbad 653755','Child Psychiatry','MBBS, DNB',10,25,1500.0,'2025-11-25','Active','MCI-100019','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(21,'Sachi','Mall','F','1989-08-30','04170805310','dr.sachi.mall20@cityhospital.com','092, Date Ganj, Raipur 745299','General Cardiology','MBBS, DNB',1,7,600.0,'2020-12-11','On Leave','MCI-100020','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(22,'Dakshesh','Gade','M','1978-12-26','01904966319','dr.dakshesh.gade21@cityhospital.com','49/190, Walia Path, Uluberia-850671','Epileptology','MBBS, DNB',2,14,600.0,'2023-05-18','Active','MCI-100021','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(23,'Tarak','Pathak','M','1967-11-16','7262849877','dr.tarak.pathak22@cityhospital.com','H.No. 31, Seshadri Road, Madhyamgram-507527','Spine Surgery','MBBS, DNB',3,12,400.0,'2015-06-22','Active','MCI-100022','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(24,'Hitesh','Pant','M','1968-03-09','05494808313','dr.hitesh.pant23@cityhospital.com','37/77, Chander Nagar, Korba-349578','Neonatology','MBBS, MD',4,24,300.0,'2016-04-27','Inactive','MCI-100023','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(25,'Orinder','Sandal','M','1988-01-24','8557444313','dr.orinder.sandal24@cityhospital.com','82/337, Vohra Road, Salem 435240','General Dermatology','MBBS, MS, MCh',5,9,400.0,'2021-03-31','Active','MCI-100024','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(26,'Edhitha','Mahal','F','1975-11-26','+910842710947','dr.edhitha.mahal25@cityhospital.com','H.No. 20, Sridhar Road, Amritsar-719022','Rhinology','MBBS, MS',6,27,300.0,'2025-08-10','Active','MCI-100025','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(27,'Nidra','Chada','F','1980-11-22','+911869993867','dr.nidra.chada26@cityhospital.com','64/99, Chaudhary Nagar, Rajpur Sonarpur-123281','Diabetology','MBBS, MD',7,15,1000.0,'2024-03-21','Active','MCI-100026','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(28,'Farhan','Agate','M','1967-09-21','07974034471','dr.farhan.agate27@cityhospital.com','93/618, Dixit Ganj, Ajmer-024994','High-risk Obstetrics','MBBS, MS',8,14,400.0,'2022-08-11','Active','MCI-100027','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(29,'Urvashi','Dash','F','1971-04-16','04648877190','dr.urvashi.dash28@cityhospital.com','40/13, Bail, Gangtok-278742','Surgical Oncology','MBBS, MS, MCh',9,15,400.0,'2019-02-12','Inactive','MCI-100028','2026-08-12 08:44:07','2026-08-12 08:44:07');
INSERT INTO `Doctors` VALUES(30,'Tejas','Swamy','M','1984-11-17','+917565512567','dr.tejas.swamy29@cityhospital.com','07/15, Naik Road, Sambhal 876038','Child Psychiatry','MBBS, DNB',10,27,1500.0,'2017-03-13','Active','MCI-100029','2026-08-12 08:44:07','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Inquiries`;
CREATE TABLE `Inquiries` (
    inquiry_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(255),
    phone           VARCHAR(255),
    email           VARCHAR(255),
    inquiry_type    VARCHAR(255) CHECK(inquiry_type IN ('General','Appointment','Billing','Complaint','Other')),
    subject         VARCHAR(255),
    message         VARCHAR(255),
    department_id   INT,
    assigned_to     INT,
    status          VARCHAR(255) CHECK(status IN ('Open','In Progress','Resolved','Closed')),
    priority        VARCHAR(255) CHECK(priority IN ('Low','Medium','High')),
    response        VARCHAR(255),
    inquiry_date    VARCHAR(255),
    resolved_date   VARCHAR(255),
    FOREIGN KEY (department_id) REFERENCES `Departments`(department_id),
    FOREIGN KEY (assigned_to) REFERENCES `Admins`(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Inquiries` VALUES(1,'Daksha Brahmbhatt','+918113863383','ojasvicherian@example.net','Complaint','General information','Facere itaque pariatur sunt cumque debitis illo excepturi culpa voluptatum ipsam explicabo et voluptatibus eveniet.',4,6,'Open','High',NULL,'2025-10-15 02:07:59',NULL);
INSERT INTO `Inquiries` VALUES(2,'Nitara Sani','5939836845','zsem@example.org','Other','Appointment availability','Voluptatem nisi maxime voluptatibus error error dolore.',3,4,'Open','High',NULL,'2025-09-04 09:42:14',NULL);
INSERT INTO `Inquiries` VALUES(3,'Anthony Majumdar','8899210752','alkaperi@example.net','Appointment','General information','Doloremque repellat at id ullam quasi quam recusandae cupiditate repudiandae.',7,6,'Resolved','High','Reprehenderit atque odit alias repellat fugit quod ullam ex sunt ipsa ut blanditiis.','2025-06-27 06:24:41','2026-01-03 21:32:17');
INSERT INTO `Inquiries` VALUES(4,'Advay Raja','+914805892583','chandreshramaswamy@example.com','Appointment','General information','Nemo at inventore ratione corporis excepturi labore quia molestias ea id ipsa praesentium quis laboriosam dicta.',NULL,4,'Closed','Medium','Officiis deserunt nulla quasi doloribus asperiores quod eum unde at perferendis.','2026-08-05 20:31:13','2026-07-10 11:15:08');
INSERT INTO `Inquiries` VALUES(5,'Jasmit Pall','+915590425979','ridhibasu@example.org','Other','Billing clarification','Placeat culpa quas assumenda qui doloribus numquam corporis rerum enim.',NULL,1,'Open','High',NULL,'2025-02-27 08:28:10',NULL);
INSERT INTO `Inquiries` VALUES(6,'Indrajit Mody','07053833884','sdhaliwal@example.net','Billing','Billing clarification','Fugiat temporibus minima ducimus animi dicta possimus.',6,6,'Closed','Low','Amet omnis ab harum earum sequi optio sint accusantium.','2025-07-26 04:45:03','2025-01-23 05:22:40');
INSERT INTO `Inquiries` VALUES(7,'Vihaan Rai','1579812387','baralyug@example.net','General','Doctor availability','Ex hic culpa expedita explicabo numquam doloremque voluptatem magnam repellat numquam.',3,7,'Closed','High','Tempora repellendus adipisci mollitia eius corrupti tempore omnis assumenda fugit.','2026-06-23 13:17:06','2025-04-14 12:15:13');
INSERT INTO `Inquiries` VALUES(8,'Omisha Khosla','2649578232','lakshitmore@example.net','Complaint','Doctor availability','Tenetur inventore tenetur quo omnis natus culpa architecto minus quaerat delectus saepe corporis adipisci eum.',3,3,'Closed','High','Vero esse quia reprehenderit odio qui corrupti deleniti consectetur ad voluptates.','2026-03-24 23:16:29','2026-07-30 22:20:40');
INSERT INTO `Inquiries` VALUES(9,'Vihaan Kata','+910517289752','eswamy@example.org','Billing','Doctor availability','Deserunt adipisci quisquam accusamus earum impedit quia voluptates quidem.',4,3,'Closed','Low','Debitis veritatis ipsa nulla porro sint.','2025-06-29 13:46:35','2025-01-02 20:51:22');
INSERT INTO `Inquiries` VALUES(10,'Prisha Ravel','+919656999880','sethtanmayi@example.org','Appointment','General information','Maxime id quasi nam maiores occaecati aliquid enim id esse.',10,2,'Open','Medium',NULL,'2025-11-22 22:15:34',NULL);
INSERT INTO `Inquiries` VALUES(11,'Triya Ganesan','04908277181','krishnaramaswamy@example.com','Billing','Billing clarification','Iste debitis nihil quae dicta iste dolorum porro tenetur recusandae quaerat commodi.',NULL,2,'Closed','High','Provident odio assumenda provident quas voluptate nostrum.','2025-09-01 12:37:37','2025-12-10 16:15:40');
INSERT INTO `Inquiries` VALUES(12,'Kritika Rai','+912592222064','sanaya42@example.org','Billing','Appointment availability','Vero a quisquam accusamus libero libero rem non laudantium.',NULL,1,'In Progress','Low',NULL,'2025-03-11 12:45:38',NULL);
INSERT INTO `Inquiries` VALUES(13,'Vamakshi Setty','07199038498','chandrangoyal@example.org','Complaint','Doctor availability','Officiis alias sequi pariatur saepe error ullam aliquid.',7,9,'Closed','Medium','Voluptatibus cum eligendi optio praesentium nemo natus vitae quibusdam facere alias.','2026-02-28 17:57:09','2025-04-14 17:27:27');
INSERT INTO `Inquiries` VALUES(14,'Ekantika Pillay','01681472145','nvohra@example.net','Complaint','Appointment availability','Nostrum autem quas occaecati voluptates laborum porro ut voluptates enim.',10,1,'Closed','Medium','Sed ea nemo numquam unde nostrum libero quas libero repellat sunt doloremque enim.','2025-08-19 05:55:19','2025-01-21 11:36:14');
INSERT INTO `Inquiries` VALUES(15,'Aarav Dani','+917139660558','advayjaggi@example.net','Appointment','Appointment availability','Ducimus architecto error mollitia quisquam beatae ex id necessitatibus vero rerum.',2,9,'Open','Low',NULL,'2025-06-24 13:40:12',NULL);
INSERT INTO `Inquiries` VALUES(16,'Ganga Nigam','7702727857','hbhalla@example.com','Appointment','General information','Quam et modi dignissimos placeat reiciendis suscipit explicabo voluptas eligendi adipisci voluptates occaecati sapiente necessitatibus.',10,7,'Closed','Low','Deleniti blanditiis quos est similique quae earum assumenda soluta fuga.','2025-02-01 15:42:14','2025-02-24 03:41:12');
INSERT INTO `Inquiries` VALUES(17,'Tarak Vohra','02150317807','ranveeroak@example.com','Billing','Doctor availability','Est eveniet quo atque voluptatem maiores voluptatibus dignissimos alias harum sint blanditiis est aliquid sed.',4,5,'Resolved','Low','Ex suscipit aut quisquam quia ad quis.','2026-07-22 19:39:55','2025-04-09 01:48:25');
INSERT INTO `Inquiries` VALUES(18,'Ekani Iyer','+914485714224','aurorayoshita@example.org','Billing','Appointment availability','Molestiae molestias earum velit rem nemo cupiditate est tempora molestiae.',9,7,'Closed','Low','Consectetur iusto perferendis autem amet incidunt.','2025-06-07 01:59:04','2025-10-29 22:45:31');
INSERT INTO `Inquiries` VALUES(19,'Sanaya Parekh','05381792171','rmukherjee@example.net','Billing','Appointment availability','Iusto veniam corporis tempore ducimus facilis delectus totam ex similique eveniet laborum aperiam beatae.',4,8,'Open','Low',NULL,'2025-07-31 06:13:11',NULL);
INSERT INTO `Inquiries` VALUES(20,'Triya Garde','05992816158','mittaltriya@example.com','Other','Service feedback','Impedit nulla molestias voluptate fugit exercitationem repellendus nihil quos ipsa ratione molestias doloremque optio aspernatur ut.',7,3,'Resolved','Medium','Saepe beatae nisi eveniet atque ipsum est illo nisi placeat nisi reprehenderit eveniet.','2025-09-29 03:19:05','2026-01-26 13:26:58');
INSERT INTO `Inquiries` VALUES(21,'Gautam Kalla','+919022784699','nhayre@example.net','Billing','Billing clarification','Error recusandae perspiciatis ullam vel quaerat totam voluptatibus nesciunt nostrum magni sed.',NULL,5,'Open','High',NULL,'2026-03-27 16:55:56',NULL);
INSERT INTO `Inquiries` VALUES(22,'David Pingle','0085140369','tnadkarni@example.com','Billing','General information','Fugit molestias optio labore deleniti fugit unde saepe culpa voluptatum pariatur consequatur asperiores.',NULL,7,'Closed','High','Corporis suscipit omnis voluptate consequatur consequatur.','2025-04-10 03:07:13','2025-08-21 20:09:21');
INSERT INTO `Inquiries` VALUES(23,'Tamanna Sandal','2786876532','kamble@example.com','Other','Service feedback','Quae earum unde nemo alias alias laboriosam fuga neque vitae.',NULL,10,'Resolved','Low','Consequuntur quasi voluptates voluptates quod iure aspernatur.','2026-06-20 15:14:30','2026-05-03 10:52:51');
INSERT INTO `Inquiries` VALUES(24,'Yatan Sodhi','1894905807','evala@example.net','Other','General information','In vero reiciendis enim alias ullam quibusdam quas natus aperiam labore cumque.',NULL,10,'Closed','High','Omnis eos qui ad laborum consectetur.','2025-02-05 18:16:51','2025-05-31 04:22:45');
INSERT INTO `Inquiries` VALUES(25,'Arunima Krishnan','+919444019292','zpingle@example.org','Appointment','Billing clarification','Quos doloremque debitis minima alias voluptates voluptas nisi reprehenderit saepe quidem.',8,1,'In Progress','Medium',NULL,'2025-06-21 07:42:52',NULL);
INSERT INTO `Inquiries` VALUES(26,'Leela Khanna','7239504102','erastogi@example.com','Appointment','General information','Quia quibusdam minus fugit provident labore corporis sit accusamus unde ipsum perspiciatis vitae placeat.',NULL,5,'Closed','Medium','Atque minus explicabo sapiente nostrum officiis.','2025-07-26 22:50:11','2025-03-10 03:10:06');
INSERT INTO `Inquiries` VALUES(27,'Gautami Madan','01496739385','dhritianne@example.net','Complaint','Appointment availability','Rerum accusamus atque aut ipsum dolor eligendi.',7,10,'Resolved','High','Alias nulla animi nisi tempora dolor nobis commodi.','2025-10-10 18:55:16','2026-06-20 15:16:37');
INSERT INTO `Inquiries` VALUES(28,'Gabriel De','09212447174','qnaik@example.org','Other','Appointment availability','Eius aperiam harum voluptatum ducimus repellat debitis architecto.',NULL,2,'Open','High',NULL,'2026-08-04 21:24:21',NULL);
INSERT INTO `Inquiries` VALUES(29,'Maya Gokhale','7128639174','banerjeeelijah@example.org','Billing','Service feedback','Quas quod accusantium libero officiis a alias hic corrupti ex hic a provident quo laboriosam.',5,8,'Closed','High','Sapiente quos quos molestiae a veritatis repellendus laboriosam necessitatibus vel facere.','2025-12-19 14:57:36','2026-04-30 01:21:50');
INSERT INTO `Inquiries` VALUES(30,'Nandini Bhakta','1585174328','rajagopalanrayaan@example.com','Complaint','Doctor availability','Tempore occaecati facere assumenda odio quasi consequuntur deserunt quaerat nihil laudantium aperiam molestiae.',NULL,4,'Resolved','Low','Libero vitae repellat vitae accusamus excepturi excepturi quam illo.','2026-02-16 01:24:43','2026-05-02 09:46:43');
INSERT INTO `Inquiries` VALUES(31,'Tara Yadav','+919310270790','kalpitatwal@example.org','Billing','Service feedback','Amet esse recusandae itaque cupiditate nihil repellendus autem libero reiciendis dolore rem incidunt repellat voluptatem perspiciatis.',1,2,'Resolved','Low','Blanditiis placeat molestias eum vitae distinctio aliquid cupiditate aperiam earum.','2025-11-07 11:19:16','2025-05-18 10:56:24');
INSERT INTO `Inquiries` VALUES(32,'Om Pingle','2739021962','surfaris@example.org','Complaint','General information','Debitis at officiis suscipit impedit rem quo.',8,2,'Closed','Low','Dignissimos odit minima illum vel nostrum alias.','2025-11-25 09:48:33','2026-03-29 07:41:47');
INSERT INTO `Inquiries` VALUES(33,'Xalak Chakrabarti','4560833181','yashica37@example.net','General','General information','Eius deserunt recusandae placeat voluptas labore debitis pariatur aliquam officia.',7,3,'Closed','Low','Distinctio dolorum nulla suscipit iste autem amet modi culpa.','2026-06-13 13:36:49','2025-11-15 18:27:06');
INSERT INTO `Inquiries` VALUES(34,'Vedhika Varma','+911379956353','nandavedant@example.org','Appointment','Billing clarification','Qui sit fugiat dolore iusto laborum tempora corporis unde iste.',9,1,'Closed','Low','Fuga itaque deserunt facere earum excepturi adipisci necessitatibus eligendi beatae.','2025-01-30 06:19:32','2025-02-03 16:37:07');
INSERT INTO `Inquiries` VALUES(35,'Tara Sahota','+915349292983','sabharwalvrinda@example.org','Billing','Service feedback','Labore iure accusamus incidunt sit dolorum ipsa dolore unde veniam totam tempore in aliquid voluptatibus quasi.',NULL,9,'Resolved','Medium','Alias minus laboriosam reiciendis reprehenderit iste dolores nam accusamus quasi veniam consequatur.','2025-07-23 09:58:30','2025-05-07 01:06:45');
INSERT INTO `Inquiries` VALUES(36,'William Chana','+917427990772','ygoyal@example.com','Other','General information','Iure odio similique architecto tempora ex adipisci incidunt earum veniam molestiae recusandae ratione aspernatur sunt quasi.',8,6,'Resolved','Medium','Maiores tenetur facilis amet fugit iure.','2025-07-01 17:16:44','2025-06-17 09:25:03');
INSERT INTO `Inquiries` VALUES(37,'Jasmit Peri','+918183253817','umangnagi@example.com','Appointment','General information','Magnam in amet fuga iste magnam repudiandae iusto minus repudiandae tempore.',2,4,'In Progress','Low',NULL,'2026-01-31 01:48:27',NULL);
INSERT INTO `Inquiries` VALUES(38,'Jhalak Bhatti','+917116241124','divanwatika@example.org','General','Appointment availability','Maxime occaecati eos voluptas molestiae consequatur expedita ipsam officia eos.',4,8,'In Progress','Low',NULL,'2026-02-24 18:41:16',NULL);
INSERT INTO `Inquiries` VALUES(39,'Anthony Kata','5695579887','kmodi@example.org','Other','Doctor availability','Cupiditate ea laborum voluptas quo aliquid explicabo iste cumque unde quae.',10,5,'Closed','Medium','Delectus cupiditate provident temporibus recusandae cum blanditiis voluptatibus nemo.','2025-08-18 09:11:21','2026-01-21 12:41:46');
INSERT INTO `Inquiries` VALUES(40,'Abha Pingle','+913805525782','jairaj06@example.com','Complaint','General information','Veniam unde culpa voluptas molestias magni officia eos tempore.',4,2,'Resolved','Low','Pariatur reiciendis quas ullam excepturi beatae laboriosam aliquam perspiciatis blanditiis ad nulla dolore.','2026-06-18 22:42:17','2026-06-08 13:37:31');
DROP TABLE IF EXISTS `Invoices`;
CREATE TABLE `Invoices` (
    invoice_id              INT AUTO_INCREMENT PRIMARY KEY,
    patient_id              INT,
    appointment_id          INT,
    admission_id            INT,
    invoice_date            VARCHAR(255),
    consultation_charges    DECIMAL(10,2),
    room_charges            DECIMAL(10,2),
    lab_test_charges        DECIMAL(10,2),
    medicine_charges        DECIMAL(10,2),
    other_charges           DECIMAL(10,2),
    discount                DECIMAL(10,2),
    tax_amount              DECIMAL(10,2),
    total_amount            DECIMAL(10,2),
    paid_amount             DECIMAL(10,2),
    due_amount              DECIMAL(10,2),
    payment_mode            VARCHAR(255) CHECK(payment_mode IN ('Cash','Card','UPI','Insurance','Online')),
    payment_status          VARCHAR(255) CHECK(payment_status IN ('Paid','Partially Paid','Unpaid','Refunded')),
    generated_by            INT,
    created_at              DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES `Patients`(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES `Appointments`(appointment_id),
    FOREIGN KEY (admission_id) REFERENCES `Admissions`(admission_id),
    FOREIGN KEY (generated_by) REFERENCES `Admins`(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Invoices` VALUES(1,93,124,NULL,'2026-02-09 14:35:10',600.0,0.0,0.0,2049.08,198.18,0.0,142.36,2989.62,2989.62,0.0,'Online','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(2,53,111,NULL,'2026-02-18 04:28:10',400.0,0.0,0.0,287.66,487.6,58.76,55.83,1172.33,1172.33,0.0,'Card','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(3,11,11,NULL,'2026-02-14 12:57:54',500.0,0.0,0.0,2317.97,382.99,160.05,152.05,3192.96,2173.1,1019.86,'Insurance','Partially Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(4,59,51,NULL,'2025-09-14 17:48:58',600.0,0.0,0.0,1583.1,73.69,225.68,101.56,2132.67,2132.67,0.0,'Insurance','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(5,26,28,NULL,'2025-01-28 06:31:14',400.0,0.0,0.0,186.2,368.9,0.0,47.76,1002.86,1002.86,0.0,'Insurance','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(6,68,9,NULL,'2026-05-20 16:58:02',400.0,0.0,0.0,977.98,311.62,0.0,84.48,1774.08,908.27,865.81,'Card','Partially Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(7,51,169,NULL,'2025-02-02 15:40:14',600.0,0.0,0.0,1563.9,271.22,0.0,121.76,2556.88,2556.88,0.0,'Cash','Refunded',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(8,80,132,NULL,'2025-11-07 05:58:34',600.0,0.0,0.0,1383.41,17.99,0.0,100.07,2101.47,2101.47,0.0,'Insurance','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(9,66,152,NULL,'2026-08-09 17:06:20',1000.0,0.0,1739.6,2315.63,284.43,533.97,240.28,5045.97,3084.22,1961.75,'Insurance','Partially Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(10,97,16,NULL,'2025-12-28 10:21:21',800.0,0.0,0.0,261.64,131.7,119.33,53.7,1127.71,1127.71,0.0,'UPI','Paid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(11,13,121,NULL,'2026-01-25 03:32:39',300.0,0.0,774.33,1162.59,404.78,0.0,132.09,2773.79,1595.18,1178.61,'Insurance','Partially Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(12,24,31,NULL,'2025-11-16 21:34:24',600.0,0.0,0.0,1118.68,330.62,0.0,102.47,2151.77,2151.77,0.0,'Cash','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(13,84,65,NULL,'2026-03-09 20:40:55',300.0,0.0,0.0,1079.02,9.86,69.44,65.97,1385.41,1385.41,0.0,'Online','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(14,83,12,NULL,'2025-04-11 17:46:50',1000.0,0.0,2037.89,164.49,158.26,336.06,151.23,3175.81,3175.81,0.0,'Cash','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(15,74,17,NULL,'2026-03-23 07:20:44',800.0,0.0,3302.39,2035.42,83.31,311.06,295.5,6205.56,6205.56,0.0,'Insurance','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(16,66,78,NULL,'2026-02-16 08:13:27',800.0,0.0,0.0,720.83,132.58,82.67,78.54,1649.28,1649.28,0.0,'Online','Refunded',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(17,82,3,NULL,'2026-06-28 17:18:14',800.0,0.0,0.0,374.73,168.42,0.0,67.16,1410.31,1410.31,0.0,'Insurance','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(18,9,25,NULL,'2026-03-01 14:38:50',300.0,0.0,2710.69,975.36,402.06,438.81,197.47,4146.77,1609.0,2537.77,'UPI','Partially Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(19,55,32,NULL,'2026-06-13 06:47:30',1000.0,0.0,0.0,2313.98,90.3,0.0,170.21,3574.49,3574.49,0.0,'Online','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(20,51,155,NULL,'2025-03-03 19:00:54',1000.0,0.0,3770.98,877.01,318.96,596.7,268.51,5638.76,0.0,5638.76,'Card','Unpaid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(21,7,53,NULL,'2026-02-25 11:36:06',400.0,0.0,0.0,536.37,342.65,63.95,60.75,1275.82,0.0,1275.82,'Cash','Unpaid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(22,18,151,NULL,'2025-09-02 04:08:04',500.0,0.0,0.0,2488.76,323.02,165.59,157.31,3303.5,1128.73,2174.77,'Card','Partially Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(23,69,52,NULL,'2025-10-07 04:58:02',500.0,0.0,2017.39,1723.49,218.07,0.0,222.95,4681.9,4681.9,0.0,'Cash','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(24,98,48,NULL,'2026-05-13 00:43:29',500.0,0.0,0.0,2010.15,87.99,0.0,129.91,2728.05,2728.05,0.0,'Cash','Refunded',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(25,27,90,NULL,'2026-02-11 05:07:03',500.0,0.0,3508.54,2711.67,203.5,346.19,328.88,6906.4,5051.56,1854.84,'Card','Partially Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(26,20,8,NULL,'2025-04-03 08:40:05',800.0,0.0,0.0,2805.51,260.98,193.32,183.66,3856.83,3856.83,0.0,'Online','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(27,92,24,NULL,'2025-08-30 15:23:46',500.0,0.0,0.0,1054.93,292.16,184.71,83.12,1745.5,0.0,1745.5,'Card','Unpaid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(28,88,38,NULL,'2026-01-19 04:06:46',400.0,0.0,3888.72,1374.48,127.15,0.0,289.52,6079.87,6079.87,0.0,'UPI','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(29,66,72,NULL,'2026-01-12 11:13:12',1000.0,0.0,0.0,814.41,138.87,0.0,97.66,2050.94,2050.94,0.0,'Cash','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(30,87,149,NULL,'2026-01-29 11:15:36',1000.0,0.0,2750.23,2828.46,345.34,0.0,346.2,7270.23,7270.23,0.0,'UPI','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(31,11,156,NULL,'2025-09-19 10:57:18',400.0,0.0,0.0,2587.18,194.24,318.14,143.16,3006.44,0.0,3006.44,'Cash','Unpaid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(32,78,91,NULL,'2025-03-24 17:54:07',400.0,0.0,3688.8,1930.92,439.73,645.95,290.68,6104.18,2224.5,3879.68,'Insurance','Partially Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(33,17,42,NULL,'2025-09-25 18:26:06',500.0,0.0,0.0,2180.42,438.38,0.0,155.94,3274.74,0.0,3274.74,'Cash','Unpaid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(34,80,129,NULL,'2025-07-08 22:56:35',1000.0,0.0,0.0,2458.94,368.89,382.78,172.25,3617.3,2377.24,1240.06,'Insurance','Partially Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(35,46,62,NULL,'2025-05-14 21:37:38',400.0,0.0,2624.7,1009.79,41.12,0.0,203.78,4279.39,4279.39,0.0,'Insurance','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(36,48,130,NULL,'2026-03-01 13:23:02',1000.0,0.0,0.0,487.18,86.74,78.7,74.76,1569.98,501.13,1068.85,'Card','Partially Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(37,7,18,NULL,'2026-04-19 07:13:07',800.0,0.0,0.0,751.01,474.05,0.0,101.25,2126.31,0.0,2126.31,'UPI','Unpaid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(38,33,26,NULL,'2026-08-04 04:16:21',800.0,0.0,1886.94,854.46,44.53,179.3,170.33,3576.96,3576.96,0.0,'Cash','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(39,26,4,NULL,'2025-09-30 10:29:03',600.0,0.0,0.0,2499.05,247.07,0.0,167.31,3513.43,1104.36,2409.07,'Insurance','Partially Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(40,84,136,NULL,'2026-02-23 05:18:49',400.0,0.0,2520.31,2986.1,141.48,0.0,302.39,6350.28,6350.28,0.0,'Cash','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(41,67,56,NULL,'2026-04-15 03:07:17',400.0,0.0,0.0,1891.27,453.66,137.25,130.38,2738.06,2738.06,0.0,'Cash','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(42,98,50,NULL,'2025-09-20 02:39:35',500.0,0.0,3905.28,1252.91,106.11,576.43,259.39,5447.26,3495.3,1951.96,'Cash','Partially Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(43,50,73,NULL,'2026-06-01 22:33:39',500.0,0.0,3744.94,1465.7,177.15,0.0,294.39,6182.18,6182.18,0.0,'Insurance','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(44,17,44,NULL,'2025-09-24 06:11:04',1000.0,0.0,0.0,1175.61,484.03,0.0,132.98,2792.62,2792.62,0.0,'Online','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(45,76,2,NULL,'2025-04-30 11:24:20',600.0,0.0,0.0,482.57,158.66,124.12,55.86,1172.97,1172.97,0.0,'Cash','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(46,42,143,NULL,'2025-09-27 22:18:58',500.0,0.0,0.0,2268.69,463.12,161.59,153.51,3223.73,0.0,3223.73,'UPI','Unpaid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(47,97,55,NULL,'2026-03-27 01:56:15',400.0,0.0,1467.51,2984.24,381.84,0.0,261.68,5495.27,5495.27,0.0,'Card','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(48,36,145,NULL,'2026-05-22 01:29:06',400.0,0.0,432.69,854.65,352.98,204.03,91.81,1928.1,1928.1,0.0,'Insurance','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(49,76,122,NULL,'2025-04-06 07:25:03',800.0,0.0,0.0,1507.08,246.49,0.0,127.68,2681.25,2681.25,0.0,'UPI','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(50,27,94,NULL,'2025-01-05 19:09:05',1000.0,0.0,0.0,1575.34,136.4,0.0,135.59,2847.33,2847.33,0.0,'Online','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(51,31,157,NULL,'2025-01-27 10:21:01',300.0,0.0,0.0,813.86,249.06,0.0,68.15,1431.07,0.0,1431.07,'Cash','Unpaid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(52,35,113,NULL,'2025-10-03 21:38:03',300.0,0.0,3396.82,545.95,40.53,428.33,192.75,4047.72,4047.72,0.0,'Cash','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(53,26,176,NULL,'2025-02-19 23:26:03',1000.0,0.0,0.0,1904.86,226.55,0.0,156.57,3287.98,3287.98,0.0,'UPI','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(54,70,154,NULL,'2025-09-19 06:28:52',1000.0,0.0,0.0,305.1,475.95,178.11,80.15,1683.09,1683.09,0.0,'Card','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(55,13,107,NULL,'2026-05-18 15:44:30',400.0,0.0,902.88,2360.53,142.47,0.0,190.29,3996.17,3996.17,0.0,'UPI','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(56,81,46,NULL,'2026-05-03 09:46:30',1000.0,0.0,655.61,1165.62,99.94,292.12,131.45,2760.5,0.0,2760.5,'Online','Unpaid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(57,19,49,NULL,'2025-04-06 01:28:20',600.0,0.0,0.0,2451.88,306.93,335.88,151.15,3174.08,3174.08,0.0,'Online','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(58,38,134,NULL,'2026-06-24 22:55:17',1000.0,0.0,0.0,750.27,343.12,0.0,104.67,2198.06,0.0,2198.06,'Online','Unpaid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(59,34,128,NULL,'2025-09-12 19:02:42',600.0,0.0,592.98,2424.48,150.2,0.0,188.38,3956.04,1504.27,2451.77,'Insurance','Partially Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(60,76,66,NULL,'2026-02-27 03:26:24',800.0,0.0,0.0,321.94,22.55,0.0,57.22,1201.71,1201.71,0.0,'Insurance','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(61,44,30,NULL,'2026-04-19 06:32:14',500.0,0.0,0.0,839.09,40.88,0.0,69.0,1448.97,1448.97,0.0,'Card','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(62,10,160,NULL,'2025-09-29 12:25:39',600.0,0.0,3543.99,963.18,293.6,540.08,243.03,5103.72,2398.59,2705.13,'Card','Partially Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(63,99,15,NULL,'2025-01-06 14:22:44',1000.0,0.0,3934.09,852.02,336.7,612.28,275.53,5786.06,5786.06,0.0,'Cash','Paid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(64,81,98,NULL,'2026-01-05 14:22:53',600.0,0.0,2002.6,1274.77,328.86,420.62,189.28,3974.89,3974.89,0.0,'UPI','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(65,99,41,NULL,'2025-08-03 17:31:00',300.0,0.0,1005.97,2466.31,348.02,0.0,206.01,4326.31,0.0,4326.31,'Card','Unpaid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(66,14,171,NULL,'2026-04-20 05:23:40',1000.0,0.0,0.0,2588.75,269.29,0.0,192.9,4050.94,4050.94,0.0,'Insurance','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(67,41,60,NULL,'2026-04-06 21:18:26',400.0,0.0,3638.94,2242.47,222.63,650.4,292.68,6146.32,6146.32,0.0,'Card','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(68,89,118,NULL,'2026-05-23 21:04:06',600.0,0.0,488.41,122.84,315.2,152.65,68.69,1442.49,1442.49,0.0,'Online','Refunded',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(69,61,67,NULL,'2025-03-04 19:14:06',300.0,0.0,0.0,1513.74,243.05,205.68,92.56,1943.67,1943.67,0.0,'Cash','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(70,59,144,NULL,'2025-04-30 18:00:52',800.0,0.0,0.0,284.18,446.44,153.06,68.88,1446.44,0.0,1446.44,'Online','Unpaid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(71,70,64,NULL,'2026-03-25 08:27:02',600.0,0.0,0.0,160.34,144.01,0.0,45.22,949.57,949.57,0.0,'Online','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(72,51,117,NULL,'2025-10-28 14:12:46',1000.0,0.0,0.0,1083.54,301.05,238.46,107.31,2253.44,2253.44,0.0,'Insurance','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(73,57,47,NULL,'2025-07-24 05:41:28',400.0,0.0,0.0,1903.34,141.23,0.0,122.23,2566.8,712.18,1854.62,'Online','Partially Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(74,100,159,NULL,'2026-01-03 09:29:44',600.0,0.0,3789.3,1531.8,117.36,0.0,301.92,6340.38,6340.38,0.0,'UPI','Refunded',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(75,37,37,NULL,'2025-08-18 17:42:28',800.0,0.0,418.29,284.63,215.31,0.0,85.91,1804.14,1804.14,0.0,'UPI','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(76,58,172,NULL,'2026-06-12 22:00:05',300.0,0.0,0.0,2333.28,278.51,0.0,145.59,3057.38,0.0,3057.38,'Cash','Unpaid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(77,49,93,NULL,'2025-04-15 20:28:44',600.0,0.0,0.0,2417.06,481.32,0.0,174.92,3673.3,3673.3,0.0,'Cash','Refunded',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(78,65,6,NULL,'2026-05-26 03:36:54',1000.0,0.0,736.82,695.62,180.82,130.66,124.13,2606.73,1713.09,893.64,'Card','Partially Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(79,36,178,NULL,'2026-05-01 12:25:37',400.0,0.0,755.04,685.48,484.82,0.0,116.27,2441.61,2441.61,0.0,'UPI','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(80,30,148,NULL,'2026-06-27 15:21:15',500.0,0.0,1678.01,2289.05,180.32,0.0,232.37,4879.75,4879.75,0.0,'Card','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(81,47,110,NULL,'2026-03-30 05:18:02',600.0,0.0,0.0,2762.26,449.03,190.56,181.04,3801.77,0.0,3801.77,'Cash','Unpaid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(82,29,147,NULL,'2026-02-07 01:21:01',300.0,0.0,0.0,1081.08,200.83,0.0,79.1,1661.01,1661.01,0.0,'Card','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(83,87,139,NULL,'2026-07-21 11:04:48',1000.0,0.0,3926.17,2417.31,437.91,389.07,369.62,7761.94,7761.94,0.0,'UPI','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(84,31,106,NULL,'2025-07-30 19:49:18',500.0,0.0,3630.77,1870.16,73.43,607.44,273.35,5740.27,5740.27,0.0,'Online','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(85,22,59,NULL,'2025-03-28 01:20:45',1000.0,0.0,0.0,1101.23,405.92,250.72,112.82,2369.25,1726.2,643.05,'Online','Partially Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(86,26,77,NULL,'2026-06-08 20:05:23',1000.0,0.0,3038.19,465.42,495.96,249.98,237.48,4987.07,4987.07,0.0,'UPI','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(87,60,40,NULL,'2025-11-08 15:23:30',1000.0,0.0,892.1,180.88,398.3,123.56,117.39,2465.11,2465.11,0.0,'Online','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(88,41,88,NULL,'2025-05-08 16:20:16',500.0,0.0,0.0,853.29,253.75,0.0,80.35,1687.39,1687.39,0.0,'UPI','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(89,39,57,NULL,'2025-10-19 20:51:13',600.0,0.0,0.0,1083.04,118.05,0.0,90.05,1891.14,1891.14,0.0,'Card','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(90,25,29,NULL,'2026-01-05 16:32:27',400.0,0.0,0.0,405.16,258.23,0.0,53.17,1116.56,0.0,1116.56,'Cash','Unpaid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(91,59,71,NULL,'2026-04-02 02:50:33',600.0,0.0,0.0,337.65,31.1,0.0,48.44,1017.19,1017.19,0.0,'UPI','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(92,10,119,NULL,'2026-03-10 16:01:22',800.0,0.0,0.0,1604.94,197.39,130.12,123.61,2595.82,2595.82,0.0,'Insurance','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(93,82,153,NULL,'2026-06-10 19:15:55',400.0,0.0,0.0,1566.78,242.38,220.92,99.41,2087.65,2087.65,0.0,'Cash','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(94,94,123,NULL,'2025-05-02 21:54:12',300.0,0.0,0.0,2264.84,472.03,151.84,144.25,3029.28,0.0,3029.28,'Insurance','Unpaid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(95,41,163,NULL,'2025-11-07 10:42:12',800.0,0.0,1371.49,1616.05,58.87,192.32,182.7,3836.79,3836.79,0.0,'Insurance','Refunded',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(96,100,175,NULL,'2025-08-09 06:39:56',400.0,0.0,0.0,2373.0,210.88,149.19,141.73,2976.42,0.0,2976.42,'Insurance','Unpaid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(97,42,61,NULL,'2025-12-12 13:44:14',500.0,0.0,549.99,229.58,240.59,76.01,72.21,1516.36,1516.36,0.0,'Insurance','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(98,64,133,NULL,'2025-11-30 03:15:06',400.0,0.0,2167.63,1436.71,224.96,422.93,190.32,3996.69,3996.69,0.0,'Online','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(99,31,23,NULL,'2026-03-30 10:05:56',400.0,0.0,0.0,2710.71,169.5,0.0,164.01,3444.22,3444.22,0.0,'Cash','Refunded',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(100,99,141,NULL,'2025-05-07 23:26:39',800.0,0.0,0.0,1927.32,385.8,155.66,147.87,3105.33,3105.33,0.0,'Online','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(101,15,NULL,1,'2025-01-20 04:22:45',0.0,98525.05,3103.18,2876.15,260.88,10476.53,4714.44,99003.17,99003.17,0.0,'Online','Paid',3,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(102,12,NULL,2,'2026-07-01 22:05:41',0.0,20847.98,0.0,811.33,352.81,2201.21,990.55,20801.46,20801.46,0.0,'UPI','Paid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(103,95,NULL,3,'2025-04-04 04:10:26',0.0,8134.89,1557.84,623.47,12.03,516.41,490.59,10302.41,10302.41,0.0,'Cash','Paid',9,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(104,11,NULL,4,'2025-11-30 06:36:24',0.0,17222.31,3142.73,547.26,476.08,0.0,1069.42,22457.8,22457.8,0.0,'Cash','Paid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(105,24,NULL,5,'2025-09-03 21:44:10',0.0,8499.14,1827.44,1040.23,187.76,0.0,577.73,12132.3,12132.3,0.0,'Online','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(106,45,NULL,6,'2025-01-30 14:50:11',0.0,81600.85,3812.62,880.93,159.17,8645.36,3890.41,81698.62,81698.62,0.0,'Card','Paid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(107,13,NULL,7,'2026-04-02 03:03:18',0.0,29013.82,1211.37,1708.65,392.61,1616.32,1535.51,32245.64,32245.64,0.0,'Online','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(108,55,NULL,8,'2026-07-23 16:26:50',0.0,30797.59,0.0,2957.4,391.01,3414.6,1536.57,32267.97,32267.97,0.0,'Cash','Refunded',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(109,93,NULL,9,'2026-05-09 09:57:02',0.0,144750.45,0.0,938.82,486.04,0.0,7308.77,153484.08,153484.08,0.0,'Online','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(110,64,NULL,10,'2026-07-01 20:30:04',0.0,39792.43,0.0,2543.07,106.38,2122.09,2015.99,42335.78,42335.78,0.0,'Cash','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(111,21,NULL,11,'2025-11-22 12:28:29',0.0,32786.39,2982.77,2996.58,439.14,0.0,1960.24,41165.12,41165.12,0.0,'UPI','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(112,72,NULL,12,'2025-05-17 23:32:10',0.0,62644.44,1564.03,1433.42,299.76,0.0,3297.08,69238.73,0.0,69238.73,'Cash','Unpaid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(113,87,NULL,13,'2025-03-21 19:36:41',0.0,41008.52,1828.7,2696.28,351.65,4588.51,2064.83,43361.47,43361.47,0.0,'Cash','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(114,79,NULL,14,'2026-01-15 07:01:35',0.0,43858.0,3361.63,1138.1,88.59,0.0,2422.32,50868.64,50868.64,0.0,'Insurance','Paid',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(115,83,NULL,15,'2025-08-15 08:31:44',0.0,8835.26,2818.05,2156.67,95.76,695.29,660.52,13870.97,0.0,13870.97,'Insurance','Unpaid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(116,33,NULL,16,'2025-10-12 20:43:13',0.0,81533.11,1073.62,668.65,410.56,8368.59,3765.87,79083.22,79083.22,0.0,'Online','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(117,14,NULL,17,'2026-08-07 08:17:59',0.0,41158.98,2787.05,1848.62,87.76,0.0,2294.12,48176.53,13318.81,34857.72,'Online','Partially Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(118,68,NULL,18,'2025-02-23 11:45:36',0.0,95874.41,2573.49,2073.97,441.55,0.0,5048.17,106011.59,0.0,106011.59,'Insurance','Unpaid',7,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(119,90,NULL,19,'2026-03-07 19:23:04',0.0,85458.74,2133.63,1600.05,21.73,0.0,4460.71,93674.86,93674.86,0.0,'Insurance','Paid',6,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(120,30,NULL,20,'2026-03-10 02:42:37',0.0,8254.42,3556.36,2442.25,495.13,0.0,737.41,15485.57,15485.57,0.0,'Card','Refunded',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(121,69,NULL,21,'2025-09-11 03:55:34',0.0,11391.76,403.13,1352.65,12.01,657.98,625.08,13126.65,0.0,13126.65,'Insurance','Unpaid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(122,53,NULL,22,'2025-04-08 22:46:05',0.0,76433.92,0.0,1607.06,118.37,0.0,3907.97,82067.32,46921.16,35146.16,'Insurance','Partially Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(123,98,NULL,23,'2026-03-29 01:59:41',0.0,14656.1,1696.36,2681.24,346.68,0.0,969.02,20349.4,20349.4,0.0,'UPI','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(124,82,NULL,24,'2026-02-25 08:29:14',0.0,2388.17,2369.25,955.26,190.73,0.0,295.17,6198.58,6198.58,0.0,'Online','Paid',10,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(125,14,NULL,25,'2025-12-03 21:24:05',0.0,46780.44,3555.77,1895.77,169.81,0.0,2620.09,55021.88,55021.88,0.0,'Card','Paid',2,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(126,54,NULL,26,'2025-09-20 12:56:21',0.0,19069.73,2493.68,2538.26,452.18,0.0,1227.69,25781.54,25781.54,0.0,'Insurance','Paid',8,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(127,70,NULL,27,'2026-03-23 18:40:56',0.0,30009.71,0.0,499.25,22.04,0.0,1526.55,32057.55,32057.55,0.0,'UPI','Paid',5,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(128,95,NULL,28,'2026-06-15 21:21:05',0.0,26416.32,845.41,995.16,171.45,1421.42,1350.35,28357.27,28357.27,0.0,'Card','Refunded',1,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(129,94,NULL,29,'2025-07-26 02:29:25',0.0,113030.83,3477.2,1323.98,97.7,0.0,5896.49,123826.2,123826.2,0.0,'UPI','Paid',4,'2026-08-12 08:44:07');
INSERT INTO `Invoices` VALUES(130,31,NULL,30,'2026-03-05 11:57:52',0.0,87036.41,2519.12,1060.32,289.21,4545.25,4317.99,90677.8,90677.8,0.0,'Card','Paid',2,'2026-08-12 08:44:07');
DROP TABLE IF EXISTS `LabTests`;
CREATE TABLE `LabTests` (
    lab_test_id            INT AUTO_INCREMENT PRIMARY KEY,
    patient_id             INT,
    doctor_id              INT,
    test_name              VARCHAR(255),
    test_category          VARCHAR(255),
    test_date               VARCHAR(255),
    sample_collected_date  VARCHAR(255),
    result                 VARCHAR(255),
    normal_range           VARCHAR(255),
    report                 VARCHAR(255),
    report_generated_date  VARCHAR(255),
    report_format          VARCHAR(255) CHECK(report_format IN ('PDF','Image','DOCX')),
    report_verified_by     INT,
    is_report_ready        INT DEFAULT 0,
    status                 VARCHAR(255) CHECK(status IN ('Ordered','Sample Collected','In Progress','Completed','Cancelled')),
    test_cost              DECIMAL(10,2),
    technician_id          INT,
    remarks                VARCHAR(255),
    created_at             DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES `Patients`(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES `Doctors`(doctor_id),
    FOREIGN KEY (report_verified_by) REFERENCES `Admins`(admin_id),
    FOREIGN KEY (technician_id) REFERENCES `Admins`(admin_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `LabTests` VALUES(1,88,4,'CT Scan Abdomen','Imaging','2025-12-11','2025-12-11','Within normal limits','See reference chart','/reports/labtest_1_ct_scan_abdomen.pdf','2025-12-11','Image',6,1,'Completed',4000.0,5,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(2,20,17,'MRI Brain','Imaging','2025-02-28','2025-02-28','Within normal limits','See reference chart','/reports/labtest_2_mri_brain.pdf','2025-02-28','Image',10,1,'Completed',1200.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(3,38,9,'Liver Function Test','Blood','2026-02-19','2026-02-19','Within normal limits','See reference chart','/reports/labtest_3_liver_function_test.pdf','2026-02-19','PDF',1,1,'Completed',1800.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(4,88,18,'MRI Brain','Imaging','2026-05-03','2026-05-03','Within normal limits','See reference chart','/reports/labtest_4_mri_brain.pdf','2026-05-03','Image',6,1,'Completed',1800.0,5,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(5,13,16,'Urine Culture','Urine','2025-09-22','2025-09-22',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',2500.0,9,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(6,29,12,'X-Ray Chest','Imaging','2025-11-11','2025-11-11',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1200.0,6,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(7,60,28,'CT Scan Abdomen','Imaging','2025-02-24','2025-02-24',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',4000.0,10,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(8,25,17,'Liver Function Test','Blood','2026-01-26','2026-01-26',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',1800.0,5,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(9,18,7,'Blood Sugar (Fasting)','Blood','2026-08-07','2026-08-07','Within normal limits','See reference chart','/reports/labtest_9_blood_sugar_(fasting).pdf','2026-08-07','PDF',8,1,'Completed',500.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(10,43,21,'Liver Function Test','Blood','2025-11-17','2025-11-17',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Cancelled',2500.0,1,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(11,27,25,'Echocardiogram','Cardiac','2025-06-12','2025-06-12','Within normal limits','See reference chart','/reports/labtest_11_echocardiogram.pdf','2025-06-12','PDF',2,1,'Completed',500.0,10,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(12,55,16,'Echocardiogram','Cardiac','2025-02-08','2025-02-08','Within normal limits','See reference chart','/reports/labtest_12_echocardiogram.pdf','2025-02-08','PDF',6,1,'Completed',300.0,6,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(13,87,1,'Urine Routine','Urine','2025-09-12','2025-09-12','Within normal limits','See reference chart','/reports/labtest_13_urine_routine.pdf','2025-09-12','PDF',6,1,'Completed',800.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(14,76,10,'TMT Stress Test','Cardiac','2025-02-16','2025-02-16',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',800.0,5,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(15,88,5,'Ultrasound Abdomen','Imaging','2026-05-17','2026-05-17','Within normal limits','See reference chart','/reports/labtest_15_ultrasound_abdomen.pdf','2026-05-17','Image',4,1,'Completed',500.0,7,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(16,94,5,'Urine Routine','Urine','2025-01-23','2025-01-23',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1800.0,9,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(17,92,21,'Lipid Profile','Blood','2026-01-20','2026-01-20','Within normal limits','See reference chart','/reports/labtest_17_lipid_profile.pdf','2026-01-20','PDF',5,1,'Completed',4000.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(18,7,22,'Thyroid Profile','Blood','2025-01-21','2025-01-21',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',300.0,2,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(19,16,18,'Echocardiogram','Cardiac','2025-06-06','2025-06-06',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',500.0,1,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(20,13,22,'TMT Stress Test','Cardiac','2025-05-21','2025-05-21','Within normal limits','See reference chart','/reports/labtest_20_tmt_stress_test.pdf','2025-05-21','PDF',2,1,'Completed',1800.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(21,14,16,'X-Ray Chest','Imaging','2025-07-24','2025-07-24',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',4000.0,5,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(22,91,14,'Urine Culture','Urine','2025-02-10','2025-02-10',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1800.0,8,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(23,31,1,'Echocardiogram','Cardiac','2025-04-02',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',300.0,10,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(24,100,17,'Urine Routine','Urine','2025-04-14',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',800.0,4,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(25,60,2,'CT Scan Abdomen','Imaging','2025-06-28',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',4000.0,1,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(26,55,24,'CT Scan Abdomen','Imaging','2025-02-16','2025-02-16',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',300.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(27,57,20,'CT Scan Abdomen','Imaging','2025-04-06','2025-04-06',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',800.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(28,52,15,'Liver Function Test','Blood','2026-01-30','2026-01-30',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',2500.0,8,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(29,17,23,'Urine Routine','Urine','2025-06-13','2025-06-13','Mild abnormality noted','See reference chart','/reports/labtest_29_urine_routine.pdf','2025-06-13','PDF',10,1,'Completed',1200.0,10,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(30,100,12,'Urine Culture','Urine','2025-05-14','2025-05-14','Within normal limits','See reference chart','/reports/labtest_30_urine_culture.pdf','2025-05-14','PDF',8,1,'Completed',300.0,7,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(31,34,21,'Complete Blood Count (CBC)','Blood','2026-06-22','2026-06-22','Within normal limits','See reference chart','/reports/labtest_31_complete_blood_count_(cbc).pdf','2026-06-22','PDF',10,1,'Completed',2500.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(32,56,22,'X-Ray Chest','Imaging','2026-05-09','2026-05-09','Within normal limits','See reference chart','/reports/labtest_32_x-ray_chest.pdf','2026-05-09','Image',7,1,'Completed',500.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(33,83,30,'Complete Blood Count (CBC)','Blood','2026-04-26','2026-04-26',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',4000.0,8,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(34,42,8,'Liver Function Test','Blood','2025-10-12','2025-10-12','Mild abnormality noted','See reference chart','/reports/labtest_34_liver_function_test.pdf','2025-10-12','PDF',4,1,'Completed',1800.0,7,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(35,59,15,'Urine Routine','Urine','2026-04-04','2026-04-04','Mild abnormality noted','See reference chart','/reports/labtest_35_urine_routine.pdf','2026-04-04','PDF',8,1,'Completed',1200.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(36,84,1,'TMT Stress Test','Cardiac','2026-02-27','2026-02-27',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',300.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(37,78,20,'Complete Blood Count (CBC)','Blood','2026-06-05','2026-06-05','Within normal limits','See reference chart','/reports/labtest_37_complete_blood_count_(cbc).pdf','2026-06-05','PDF',8,1,'Completed',800.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(38,43,18,'Urine Culture','Urine','2026-04-30','2026-04-30','Within normal limits','See reference chart','/reports/labtest_38_urine_culture.pdf','2026-04-30','PDF',6,1,'Completed',2500.0,8,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(39,1,11,'Blood Sugar (Fasting)','Blood','2025-10-26','2025-10-26','Within normal limits','See reference chart','/reports/labtest_39_blood_sugar_(fasting).pdf','2025-10-26','PDF',6,1,'Completed',2500.0,2,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(40,18,27,'Urine Culture','Urine','2026-02-24','2026-02-24','Mild abnormality noted','See reference chart','/reports/labtest_40_urine_culture.pdf','2026-02-24','PDF',10,1,'Completed',500.0,4,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(41,59,27,'ECG','Cardiac','2025-12-13','2025-12-13','Mild abnormality noted','See reference chart','/reports/labtest_41_ecg.pdf','2025-12-13','PDF',7,1,'Completed',300.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(42,85,19,'Echocardiogram','Cardiac','2025-05-18','2025-05-18',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Cancelled',1200.0,1,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(43,56,27,'Thyroid Profile','Blood','2026-06-05','2026-06-05','Within normal limits','See reference chart','/reports/labtest_43_thyroid_profile.pdf','2026-06-05','PDF',3,1,'Completed',2500.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(44,50,22,'Urine Routine','Urine','2025-11-26','2025-11-26','Within normal limits','See reference chart','/reports/labtest_44_urine_routine.pdf','2025-11-26','PDF',7,1,'Completed',1200.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(45,44,10,'Ultrasound Abdomen','Imaging','2025-05-17','2025-05-17','Mild abnormality noted','See reference chart','/reports/labtest_45_ultrasound_abdomen.pdf','2025-05-17','Image',10,1,'Completed',2500.0,9,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(46,26,7,'MRI Brain','Imaging','2025-10-25','2025-10-25','Within normal limits','See reference chart','/reports/labtest_46_mri_brain.pdf','2025-10-25','Image',3,1,'Completed',2500.0,3,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(47,98,12,'X-Ray Chest','Imaging','2026-08-08','2026-08-08','Within normal limits','See reference chart','/reports/labtest_47_x-ray_chest.pdf','2026-08-08','Image',7,1,'Completed',2500.0,9,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(48,67,4,'ECG','Cardiac','2025-05-29',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',300.0,1,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(49,37,22,'MRI Brain','Imaging','2025-03-05','2025-03-05',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',2500.0,5,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(50,58,4,'Lipid Profile','Blood','2026-07-30','2026-07-30','Within normal limits','See reference chart','/reports/labtest_50_lipid_profile.pdf','2026-07-30','PDF',9,1,'Completed',1200.0,4,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(51,49,13,'X-Ray Chest','Imaging','2025-11-17','2025-11-17','Within normal limits','See reference chart','/reports/labtest_51_x-ray_chest.pdf','2025-11-17','Image',1,1,'Completed',300.0,5,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(52,82,23,'ECG','Cardiac','2026-01-12','2026-01-12','Within normal limits','See reference chart','/reports/labtest_52_ecg.pdf','2026-01-12','PDF',9,1,'Completed',2500.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(53,58,6,'Urine Culture','Urine','2025-03-18','2025-03-18',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Cancelled',500.0,3,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(54,6,14,'Liver Function Test','Blood','2025-09-28','2025-09-28',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',500.0,3,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(55,43,15,'X-Ray Chest','Imaging','2025-06-08','2025-06-08','Mild abnormality noted','See reference chart','/reports/labtest_55_x-ray_chest.pdf','2025-06-08','Image',6,1,'Completed',1800.0,1,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(56,74,18,'Ultrasound Abdomen','Imaging','2025-11-22','2025-11-22','Within normal limits','See reference chart','/reports/labtest_56_ultrasound_abdomen.pdf','2025-11-22','Image',3,1,'Completed',1800.0,2,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(57,70,18,'Urine Culture','Urine','2025-12-24','2025-12-24','Within normal limits','See reference chart','/reports/labtest_57_urine_culture.pdf','2025-12-24','PDF',4,1,'Completed',2500.0,6,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(58,28,25,'CT Scan Abdomen','Imaging','2026-05-02','2026-05-02','Within normal limits','See reference chart','/reports/labtest_58_ct_scan_abdomen.pdf','2026-05-02','Image',1,1,'Completed',300.0,6,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(59,6,22,'Urine Routine','Urine','2026-01-26','2026-01-26','Within normal limits','See reference chart','/reports/labtest_59_urine_routine.pdf','2026-01-26','PDF',2,1,'Completed',1200.0,5,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(60,67,27,'X-Ray Chest','Imaging','2026-06-11','2026-06-11','Within normal limits','See reference chart','/reports/labtest_60_x-ray_chest.pdf','2026-06-11','Image',8,1,'Completed',1200.0,1,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(61,66,3,'Urine Culture','Urine','2025-06-21','2025-06-21','Within normal limits','See reference chart','/reports/labtest_61_urine_culture.pdf','2025-06-21','PDF',9,1,'Completed',1800.0,1,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(62,88,14,'Urine Routine','Urine','2025-07-30','2025-07-30','Within normal limits','See reference chart','/reports/labtest_62_urine_routine.pdf','2025-07-30','PDF',7,1,'Completed',2500.0,2,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(63,92,11,'Liver Function Test','Blood','2025-03-17',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',300.0,3,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(64,30,30,'Thyroid Profile','Blood','2026-02-02','2026-02-02',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1200.0,7,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(65,50,22,'X-Ray Chest','Imaging','2025-01-07','2025-01-07',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',2500.0,10,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(66,46,30,'Complete Blood Count (CBC)','Blood','2025-10-24','2025-10-24','Within normal limits','See reference chart','/reports/labtest_66_complete_blood_count_(cbc).pdf','2025-10-24','PDF',5,1,'Completed',1800.0,2,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(67,51,27,'Echocardiogram','Cardiac','2026-05-01','2026-05-01','Mild abnormality noted','See reference chart','/reports/labtest_67_echocardiogram.pdf','2026-05-01','PDF',4,1,'Completed',500.0,7,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(68,39,22,'MRI Brain','Imaging','2026-01-18','2026-01-18','Within normal limits','See reference chart','/reports/labtest_68_mri_brain.pdf','2026-01-18','Image',1,1,'Completed',1800.0,9,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(69,1,19,'Complete Blood Count (CBC)','Blood','2026-07-05','2026-07-05','Within normal limits','See reference chart','/reports/labtest_69_complete_blood_count_(cbc).pdf','2026-07-05','PDF',2,1,'Completed',800.0,4,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(70,83,28,'Urine Culture','Urine','2025-06-14','2025-06-14','Mild abnormality noted','See reference chart','/reports/labtest_70_urine_culture.pdf','2025-06-14','PDF',10,1,'Completed',4000.0,5,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(71,86,26,'Blood Sugar (Fasting)','Blood','2025-02-25','2025-02-25','Within normal limits','See reference chart','/reports/labtest_71_blood_sugar_(fasting).pdf','2025-02-25','PDF',9,1,'Completed',1200.0,9,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(72,33,4,'X-Ray Chest','Imaging','2026-05-14','2026-05-14',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',800.0,6,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(73,37,20,'Urine Routine','Urine','2025-07-18',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',800.0,8,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(74,89,19,'CT Scan Abdomen','Imaging','2026-08-04','2026-08-04',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',800.0,6,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(75,41,8,'Urine Routine','Urine','2026-03-23','2026-03-23','Within normal limits','See reference chart','/reports/labtest_75_urine_routine.pdf','2026-03-23','PDF',6,1,'Completed',500.0,6,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(76,46,25,'Echocardiogram','Cardiac','2026-07-19','2026-07-19','Mild abnormality noted','See reference chart','/reports/labtest_76_echocardiogram.pdf','2026-07-19','PDF',10,1,'Completed',300.0,5,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(77,94,29,'Urine Culture','Urine','2025-03-19','2025-03-19','Within normal limits','See reference chart','/reports/labtest_77_urine_culture.pdf','2025-03-19','PDF',9,1,'Completed',2500.0,1,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(78,28,30,'TMT Stress Test','Cardiac','2025-09-24',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',1800.0,9,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(79,51,8,'Urine Culture','Urine','2025-10-25','2025-10-25','Mild abnormality noted','See reference chart','/reports/labtest_79_urine_culture.pdf','2025-10-25','PDF',9,1,'Completed',1800.0,2,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(80,85,8,'X-Ray Chest','Imaging','2025-06-19','2025-06-19','Within normal limits','See reference chart','/reports/labtest_80_x-ray_chest.pdf','2025-06-19','Image',3,1,'Completed',1200.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(81,46,2,'Urine Culture','Urine','2026-05-15','2026-05-15',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',500.0,2,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(82,6,22,'MRI Brain','Imaging','2026-01-05','2026-01-05',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1200.0,8,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(83,84,11,'Complete Blood Count (CBC)','Blood','2026-06-18','2026-06-18',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',2500.0,5,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(84,84,13,'Urine Culture','Urine','2025-03-21','2025-03-21','Within normal limits','See reference chart','/reports/labtest_84_urine_culture.pdf','2025-03-21','PDF',7,1,'Completed',500.0,9,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(85,63,26,'CT Scan Abdomen','Imaging','2025-01-07','2025-01-07','Within normal limits','See reference chart','/reports/labtest_85_ct_scan_abdomen.pdf','2025-01-07','Image',3,1,'Completed',1200.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(86,83,9,'Thyroid Profile','Blood','2025-07-11','2025-07-11',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',500.0,6,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(87,54,26,'Blood Sugar (Fasting)','Blood','2025-04-27','2025-04-27','Within normal limits','See reference chart','/reports/labtest_87_blood_sugar_(fasting).pdf','2025-04-27','PDF',8,1,'Completed',1200.0,4,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(88,3,8,'Urine Culture','Urine','2026-08-11',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',1800.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(89,19,2,'Thyroid Profile','Blood','2025-07-04','2025-07-04',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',1800.0,7,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(90,11,7,'Lipid Profile','Blood','2026-04-28','2026-04-28','Within normal limits','See reference chart','/reports/labtest_90_lipid_profile.pdf','2026-04-28','PDF',3,1,'Completed',500.0,7,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(91,80,22,'Urine Routine','Urine','2025-06-21','2025-06-21','Within normal limits','See reference chart','/reports/labtest_91_urine_routine.pdf','2025-06-21','PDF',6,1,'Completed',1200.0,10,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(92,49,13,'Blood Sugar (Fasting)','Blood','2025-01-17','2025-01-17',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',500.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(93,78,4,'ECG','Cardiac','2025-02-09','2025-02-09',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',4000.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(94,62,22,'Complete Blood Count (CBC)','Blood','2026-07-07','2026-07-07',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',4000.0,1,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(95,6,23,'Echocardiogram','Cardiac','2025-08-23','2025-08-23','Within normal limits','See reference chart','/reports/labtest_95_echocardiogram.pdf','2025-08-23','PDF',8,1,'Completed',4000.0,7,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(96,18,9,'Liver Function Test','Blood','2025-08-27','2025-08-27','Within normal limits','See reference chart','/reports/labtest_96_liver_function_test.pdf','2025-08-27','PDF',2,1,'Completed',800.0,10,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(97,25,1,'Echocardiogram','Cardiac','2025-01-08','2025-01-08','Within normal limits','See reference chart','/reports/labtest_97_echocardiogram.pdf','2025-01-08','PDF',2,1,'Completed',1800.0,1,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(98,53,12,'Urine Culture','Urine','2026-03-13','2026-03-13',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',2500.0,10,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(99,73,12,'Ultrasound Abdomen','Imaging','2026-02-11','2026-02-11','Within normal limits','See reference chart','/reports/labtest_99_ultrasound_abdomen.pdf','2026-02-11','Image',7,1,'Completed',1800.0,9,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(100,72,18,'Urine Culture','Urine','2025-11-11','2025-11-11','Within normal limits','See reference chart','/reports/labtest_100_urine_culture.pdf','2025-11-11','PDF',7,1,'Completed',2500.0,3,NULL,'2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(101,90,6,'Urine Culture','Urine','2026-06-05','2026-06-05',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Sample Collected',1200.0,6,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(102,50,21,'Blood Sugar (Fasting)','Blood','2025-04-04',NULL,NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'Ordered',4000.0,3,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(103,9,9,'ECG','Cardiac','2025-03-23','2025-03-23',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',1800.0,1,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(104,84,17,'TMT Stress Test','Cardiac','2025-02-28','2025-02-28',NULL,'See reference chart',NULL,NULL,NULL,NULL,0,'In Progress',4000.0,3,'Patient was fasting','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(105,26,28,'ECG','Cardiac','2026-06-15','2026-06-15','Within normal limits','See reference chart','/reports/labtest_105_ecg.pdf','2026-06-15','PDF',1,1,'Completed',4000.0,10,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(106,87,2,'Urine Routine','Urine','2025-01-01','2025-01-01','Within normal limits','See reference chart','/reports/labtest_106_urine_routine.pdf','2025-01-01','PDF',2,1,'Completed',800.0,7,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(107,76,7,'Echocardiogram','Cardiac','2025-03-12','2025-03-12','Within normal limits','See reference chart','/reports/labtest_107_echocardiogram.pdf','2025-03-12','PDF',9,1,'Completed',800.0,9,'Sample re-collected','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(108,36,8,'CT Scan Abdomen','Imaging','2025-07-19','2025-07-19','Within normal limits','See reference chart','/reports/labtest_108_ct_scan_abdomen.pdf','2025-07-19','Image',7,1,'Completed',1800.0,1,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(109,65,4,'Urine Culture','Urine','2026-05-31','2026-05-31','Within normal limits','See reference chart','/reports/labtest_109_urine_culture.pdf','2026-05-31','PDF',2,1,'Completed',4000.0,9,'Routine test, no issues','2026-08-12 08:44:07');
INSERT INTO `LabTests` VALUES(110,49,19,'Ultrasound Abdomen','Imaging','2025-09-07','2025-09-07','Within normal limits','See reference chart','/reports/labtest_110_ultrasound_abdomen.pdf','2025-09-07','Image',8,1,'Completed',2500.0,8,'Sample re-collected','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Medicines`;
CREATE TABLE `Medicines` (
    medicine_id       INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name     VARCHAR(255),
    generic_name      VARCHAR(255),
    category          VARCHAR(255),
    manufacturer      VARCHAR(255),
    batch_number      VARCHAR(255),
    unit              VARCHAR(255),
    stock_quantity    INT,
    reorder_level     INT,
    unit_price        DECIMAL(10,2),
    expiry_date       VARCHAR(255),
    manufacture_date  VARCHAR(255),
    supplier_id       INT,
    status            VARCHAR(255) CHECK(status IN ('In Stock','Low Stock','Out of Stock','Expired')),
    created_at        DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Medicines` VALUES(1,'Paracetamol 500mg','Paracetamol','Analgesic/Antipyretic','Pai-Parikh','BATCH1000','Gel',9,55,240.26,'2027-08-19','2024-09-02',3,'Low Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(2,'Amoxicillin 250mg','Amoxicillin','Antibiotic','Panchal-Bhalla','BATCH1001','Syrup',380,148,83.06,'2026-04-02','2023-04-04',10,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(3,'Azithromycin 500mg','Azithromycin','Antibiotic','Konda, Kota and Keer','BATCH1002','Tablet',346,147,34.59,'2027-10-03','2024-10-22',3,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(4,'Ibuprofen 400mg','Ibuprofen','NSAID','Muni, Chad and Bhatti','BATCH1003','Tablet',718,118,67.28,'2028-03-21','2023-08-27',6,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(5,'Cetirizine 10mg','Cetirizine','Antihistamine','Contractor-Nazareth','BATCH1004','Injection',571,150,403.74,'2027-10-23','2024-03-25',4,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(6,'Omeprazole 20mg','Omeprazole','Antacid','Bahri PLC','BATCH1005','Injection',21,138,363.58,'2027-01-22','2023-09-14',1,'Low Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(7,'Metformin 500mg','Metformin','Antidiabetic','Barad-Sharma','BATCH1006','Inhaler',496,140,150.88,'2027-03-25','2024-12-14',8,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(8,'Amlodipine 5mg','Amlodipine','Antihypertensive','Sami, Varma and Sama','BATCH1007','Inhaler',194,122,177.09,'2026-07-11','2025-01-19',8,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(9,'Atorvastatin 10mg','Atorvastatin','Statin','Bahri-Singh','BATCH1008','Inhaler',281,126,84.37,'2028-07-25','2024-06-27',3,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(10,'Salbutamol Inhaler','Salbutamol','Bronchodilator','Bains, Nadig and Purohit','BATCH1009','Injection',460,87,273.09,'2028-04-19','2024-04-09',1,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(11,'Pantoprazole 40mg','Pantoprazole','Antacid','Ramakrishnan, Naidu and Chaudhari','BATCH1010','Capsule',794,131,368.16,'2027-06-03','2025-06-23',1,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(12,'Cefixime 200mg','Cefixime','Antibiotic','Chaudhry-Jha','BATCH1011','Inhaler',634,96,123.2,'2028-03-05','2025-01-08',2,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(13,'Diclofenac Gel','Diclofenac','NSAID','Taneja-Thakkar','BATCH1012','Capsule',674,118,98.99,'2028-04-18','2024-11-30',8,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(14,'Losartan 50mg','Losartan','Antihypertensive','Nori, Ganesan and Mistry','BATCH1013','Inhaler',784,120,145.15,'2026-06-07','2024-02-24',6,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(15,'Insulin Glargine','Insulin','Antidiabetic','Sarin-Jaggi','BATCH1014','Gel',113,62,38.01,'2027-06-20','2025-05-05',3,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(16,'Vitamin D3 Sachet','Cholecalciferol','Supplement','Borra-Wason','BATCH1015','Tablet',182,54,245.26,'2026-07-26','2023-04-12',1,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(17,'Calcium + D3 Tablet','Calcium Carbonate','Supplement','Mani LLC','BATCH1016','Capsule',584,132,330.67,'2028-05-06','2024-06-22',10,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(18,'Ranitidine 150mg','Ranitidine','Antacid','Mishra PLC','BATCH1017','Tablet',718,125,186.35,'2026-09-20','2024-09-12',2,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(19,'Doxycycline 100mg','Doxycycline','Antibiotic','Kara-Chanda','BATCH1018','Capsule',13,76,464.56,'2027-11-03','2025-05-02',2,'Low Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(20,'Levothyroxine 50mcg','Levothyroxine','Thyroid Hormone','Chandran, Nayar and Mahajan','BATCH1019','Injection',479,131,281.22,'2026-03-04','2025-06-30',7,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(21,'Paracetamol 500mg (Batch 20)','Paracetamol','Analgesic/Antipyretic','Wali Group','BATCH1020','Gel',841,97,33.86,'2028-03-24','2024-09-23',5,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(22,'Amoxicillin 250mg (Batch 21)','Amoxicillin','Antibiotic','Kadakia-Palan','BATCH1021','Tablet',541,55,418.06,'2028-01-22','2023-03-21',4,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(23,'Azithromycin 500mg (Batch 22)','Azithromycin','Antibiotic','Mittal PLC','BATCH1022','Tablet',983,116,363.96,'2026-04-10','2024-06-28',7,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(24,'Ibuprofen 400mg (Batch 23)','Ibuprofen','NSAID','Sant-Zacharia','BATCH1023','Gel',194,74,128.14,'2027-06-23','2024-10-02',3,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(25,'Cetirizine 10mg (Batch 24)','Cetirizine','Antihistamine','Iyengar-Sachdeva','BATCH1024','Capsule',571,145,374.32,'2027-07-26','2025-02-23',10,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(26,'Omeprazole 20mg (Batch 25)','Omeprazole','Antacid','Krishnamurthy-Varma','BATCH1025','Gel',366,136,334.29,'2027-04-15','2025-06-23',2,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(27,'Metformin 500mg (Batch 26)','Metformin','Antidiabetic','Gole-Bahl','BATCH1026','Capsule',170,73,254.82,'2027-07-18','2024-11-04',3,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(28,'Amlodipine 5mg (Batch 27)','Amlodipine','Antihypertensive','Varty, Grover and Tata','BATCH1027','Injection',546,126,451.73,'2027-03-30','2024-07-17',6,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(29,'Atorvastatin 10mg (Batch 28)','Atorvastatin','Statin','Sibal LLC','BATCH1028','Gel',865,97,218.14,'2027-02-27','2025-01-13',6,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(30,'Salbutamol Inhaler (Batch 29)','Salbutamol','Bronchodilator','Walia, Saraf and Bhasin','BATCH1029','Inhaler',623,80,110.89,'2027-07-31','2025-02-23',9,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(31,'Pantoprazole 40mg (Batch 30)','Pantoprazole','Antacid','Iyer, Patla and Shere','BATCH1030','Injection',948,145,481.02,'2026-09-18','2024-04-03',7,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(32,'Cefixime 200mg (Batch 31)','Cefixime','Antibiotic','Khosla and Sons','BATCH1031','Injection',0,142,299.9,'2026-02-05','2024-06-14',3,'Out of Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(33,'Diclofenac Gel (Batch 32)','Diclofenac','NSAID','Mital, Saran and Roy','BATCH1032','Injection',911,88,492.28,'2026-01-07','2023-08-08',6,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(34,'Losartan 50mg (Batch 33)','Losartan','Antihypertensive','Bhatt-Jani','BATCH1033','Gel',22,148,412.06,'2028-04-21','2025-07-30',9,'Low Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(35,'Insulin Glargine (Batch 34)','Insulin','Antidiabetic','Loke-Mangat','BATCH1034','Inhaler',523,121,81.58,'2027-08-08','2023-02-08',8,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(36,'Vitamin D3 Sachet (Batch 35)','Cholecalciferol','Supplement','Dyal, Kunda and Keer','BATCH1035','Injection',364,69,186.71,'2026-05-22','2024-08-19',4,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(37,'Calcium + D3 Tablet (Batch 36)','Calcium Carbonate','Supplement','Khare-Comar','BATCH1036','Injection',238,82,50.49,'2028-04-10','2024-02-14',10,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(38,'Ranitidine 150mg (Batch 37)','Ranitidine','Antacid','Handa Inc','BATCH1037','Tablet',939,77,363.17,'2028-01-22','2025-03-22',8,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(39,'Doxycycline 100mg (Batch 38)','Doxycycline','Antibiotic','Mukherjee Group','BATCH1038','Gel',177,112,352.91,'2028-04-25','2025-04-19',2,'In Stock','2026-08-12 08:44:07');
INSERT INTO `Medicines` VALUES(40,'Levothyroxine 50mcg (Batch 39)','Levothyroxine','Thyroid Hormone','Sarin-Sami','BATCH1039','Tablet',609,132,366.74,'2026-11-04','2024-08-13',7,'In Stock','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Patients`;
CREATE TABLE `Patients` (
    patient_id             INT AUTO_INCREMENT PRIMARY KEY,
    first_name             VARCHAR(255) NOT NULL,
    last_name              VARCHAR(255) NOT NULL,
    gender                 VARCHAR(255) CHECK(gender IN ('M','F','Other')),
    dob                    VARCHAR(255),
    blood_group            VARCHAR(255),
    phone                  VARCHAR(255),
    email                  VARCHAR(255),
    address                VARCHAR(255),
    city                   VARCHAR(255),
    state                  VARCHAR(255),
    pincode                VARCHAR(255),
    emergency_contact_name  VARCHAR(255),
    emergency_contact_phone VARCHAR(255),
    allergies              VARCHAR(255),
    medical_history        VARCHAR(255),
    registration_date      VARCHAR(255),
    aadhar_or_id_number    VARCHAR(255),
    status                 VARCHAR(255) DEFAULT 'Active' CHECK(status IN ('Active','Inactive','Deceased')),
    created_at             DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Patients` VALUES(1,'Ekbal','Kata','M','1968-10-17','B+','04740748217','ekbal.kata0@example.com','64/743, Subramanian Marg, Patiala 959440','Guntur','Andhra Pradesh','545745','Anvi Anand','0974395339',NULL,NULL,'2024-01-27','273022703378','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(2,'Ladli','Devan','F','2017-05-30','A+','1047095214','ladli.devan1@example.com','328, Wali Path, Dehradun 745171','Nellore','Andhra Pradesh','587538','Upkaar Ranganathan','5160481754','None known','Asthma','2023-09-06','829851334750','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(3,'Rayaan','Prabhu','M','1955-05-11','A-','+913709859317','rayaan.prabhu2@example.com','H.No. 200, Tailor Road, Jalandhar 826758','Vijayawada','Andhra Pradesh','597310','Mohammed Sachdeva','1796405377','Dust',NULL,'2023-07-12','762635097563','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(4,'Kamya','Patil','F','2006-09-05','O+','+915850643171','kamya.patil3@example.com','H.No. 532, Jha, Begusarai-933529','Visakhapatnam','Andhra Pradesh','566244','Aradhana Dhillon','+918421020539','Penicillin','Hypertension','2022-04-15','796181120841','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(5,'Ojasvi','Babu','F','1945-04-27','O-','+914026811775','ojasvi.babu4@example.com','39/08, Shanker Road, Ghaziabad 661771','Peddapuram','Andhra Pradesh','517146','Ekanta Divan','+912499856984','Pollen','Hypertension','2022-11-27','588514866975','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(6,'Vasana','Tiwari','F','1945-11-13','A-','6118367365','vasana.tiwari5@example.com','15, Munshi Marg, Dindigul-711116','Guntur','Andhra Pradesh','509862','Kashish De','0988516560','Pollen',NULL,'2025-01-22','741535897688','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(7,'Mitali','Muni','F','1948-10-02','O+','01983273158','mitali.muni6@example.com','H.No. 93, Bal Marg, Bhopal 445502','Rajahmundry','Andhra Pradesh','547795','Nandini Boase','+910183667525','None known',NULL,'2024-01-03','848226581356','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(8,'Nachiket','Nair','M','2014-12-27','AB+','9102290147','nachiket.nair7@example.com','76/43, Comar Circle, Chinsurah-497840','Hyderabad','Telangana','581351','Megha Bhakta','+913432445107','Pollen',NULL,'2023-04-30','279807112340','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(9,'Tanveer','Gill','M','1947-03-24','B+','+916838851606','tanveer.gill8@example.com','H.No. 596, Ravel, Ramagundam 605297','Chennai','Tamil Nadu','596542','Gaurang Sarkar','+913696816453',NULL,'Type 2 Diabetes','2026-07-01','992215278349','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(10,'Ojas','Ganguly','M','1979-04-28','A+','+918188355231','ojas.ganguly9@example.com','292, Goel Zila, Madhyamgram-995527','Kakinada','Andhra Pradesh','561694','Upasna Sathe','4490581477',NULL,NULL,'2026-07-31','606455894514','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(11,'Anirudh','Bhandari','M','1947-02-15','B-','04119986798','anirudh.bhandari10@example.com','35/97, Dora Circle, Hospet 518203','Visakhapatnam','Andhra Pradesh','552227','Reva Viswanathan','9255466590',NULL,'Hypertension','2022-05-23','950261314384','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(12,'Oviya','Bhatti','F','1974-09-17','A+','01864492519','oviya.bhatti11@example.com','H.No. 62, Chad, Karaikudi-528168','Guntur','Andhra Pradesh','515118','Andrew Patil','02357332214',NULL,NULL,'2025-04-04','139794875013','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(13,'Daksha','Tripathi','F','2010-05-12','O-','8059296222','daksha.tripathi12@example.com','H.No. 653, Mane Chowk, Muzaffarpur-473597','Hyderabad','Telangana','557199','Baghyawati Raja','8623924075','Dust','Asthma','2022-08-25','308634857005','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(14,'Dalaja','Varty','F','1991-08-24','B-','+914124782613','dalaja.varty13@example.com','H.No. 606, Prakash Circle, Kharagpur-530515','Peddapuram','Andhra Pradesh','547739','Laksh Barad','07277901043','Penicillin',NULL,'2025-09-22','464731933573','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(15,'Falan','Wable','M','1990-07-01','O+','01434103697','falan.wable14@example.com','98, Varma Nagar, Asansol 609539','Vijayawada','Andhra Pradesh','587410','Rachit Chada','5188888067','Penicillin','Hypertension','2024-04-04','425117034534','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(16,'Anthony','Ram','M','2004-08-27','AB+','04051531952','anthony.ram15@example.com','52/77, Deshmukh Street, Berhampore 430305','Chennai','Tamil Nadu','588777','Yutika Rao','7403450541','Pollen',NULL,'2025-06-14','433156770265','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(17,'Qarin','Sarkar','M','1970-09-28','B-','07652775841','qarin.sarkar16@example.com','92, Memon Circle, Kota-544796','Vijayawada','Andhra Pradesh','556346','Sachi Panchal','00596401658','None known','Asthma','2025-05-27','454999257514','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(18,'Gauri','Balasubramanian','F','1990-11-11','AB-','+919702135569','gauri.balasubramanian17@example.com','75/571, Devan, Sikar 431027','Visakhapatnam','Andhra Pradesh','596463','Jacob Lala','07394731217',NULL,'None significant','2022-06-23','663859569104','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(19,'Harini','Saxena','F','2018-06-05','B-','+915518844225','harini.saxena18@example.com','237, Patel Nagar, Bhind-911467','Kakinada','Andhra Pradesh','588184','Nimrat Borah','+915177852892',NULL,NULL,'2026-07-10','259769046504','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(20,'Dhruv','Sant','M','1999-11-04','A-','0182422535','dhruv.sant19@example.com','H.No. 38, Dass Road, Srikakulam 829922','Bengaluru','Karnataka','559692','Benjamin Balakrishnan','+910943969078','Penicillin','None significant','2025-03-24','886814108140','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(21,'Mohini','Mittal','F','1966-11-21','B+','03647102767','mohini.mittal20@example.com','H.No. 92, Nagar Path, Silchar-588153','Chennai','Tamil Nadu','585990','Jason Loke','03210469632','Pollen',NULL,'2026-03-18','949804121401','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(22,'Omisha','Munshi','F','1960-10-12','AB-','+912787747016','omisha.munshi21@example.com','950, Manda Nagar, Kavali-480162','Visakhapatnam','Andhra Pradesh','506582','Jasmit Rau','00609835841','Dust',NULL,'2022-09-06','247989376703','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(23,'Sanya','Thaman','F','1999-12-19','AB+','08499121655','sanya.thaman22@example.com','986, Baria Circle, Agra 578729','Bengaluru','Karnataka','571810','Falak Nagar','+916949588879','Penicillin',NULL,'2026-03-04','623391135280','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(24,'Mason','Soman','M','2013-09-15','AB-','+915516940974','mason.soman23@example.com','72/89, Divan Marg, Patna-307562','Vijayawada','Andhra Pradesh','582149','Samar Roy','9702838578',NULL,'Hypertension','2024-06-19','882016836343','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(25,'Riya','Murthy','F','1973-09-07','A-','+917858549733','riya.murthy24@example.com','443, Nadig Chowk, Karnal 419866','Hyderabad','Telangana','518136','Madhav Mannan','+914157473384',NULL,NULL,'2024-02-24','270484216305','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(26,'Laban','Devan','M','1981-07-27','O-','+919933083301','laban.devan25@example.com','71/208, Ray Street, Morena-454019','Chennai','Tamil Nadu','571121','Baljiwan Gill','02067240049','Penicillin','Type 2 Diabetes','2022-05-08','527006264991','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(27,'Chatresh','Nayak','M','1979-02-16','AB-','07887287431','chatresh.nayak26@example.com','74/205, Hans Road, Phagwara 685161','Nellore','Andhra Pradesh','500772','Logan Sood','03046374549',NULL,'Hypertension','2026-03-24','563150927987','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(28,'Abdul','Lal','M','1964-09-08','O+','5301742684','abdul.lal27@example.com','H.No. 93, Deol Ganj, Jamnagar 956878','Bengaluru','Karnataka','557125','Yug Bumb','7851910883','Penicillin',NULL,'2024-03-07','835883073006','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(29,'Falguni','Gala','F','2020-05-28','AB-','08713971870','falguni.gala28@example.com','67/90, Shere Circle, Lucknow-403910','Rajahmundry','Andhra Pradesh','516728','Hemangini Bhatt','0170462265','Dust','Asthma','2022-02-25','533391959419','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(30,'Rayaan','Sen','M','2002-08-31','AB+','06182512868','rayaan.sen29@example.com','H.No. 047, Samra Circle, Berhampur-752431','Kakinada','Andhra Pradesh','517786','Oni Babu','+913119079030','None known','Type 2 Diabetes','2023-01-08','383683812395','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(31,'Sai','Sarna','M','1974-04-29','O-','+918302843959','sai.sarna30@example.com','H.No. 28, Sachdev Ganj, Panipat 892687','Bengaluru','Karnataka','599775','Hemangini Raj','5662462873','Penicillin','Hypertension','2026-03-21','376688514097','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(32,'Jeevika','Mital','F','2012-03-14','A+','2708668826','jeevika.mital31@example.com','517, Chanda Path, Faridabad-699013','Peddapuram','Andhra Pradesh','545870','Varenya Joshi','04033173936',NULL,'None significant','2022-05-21','145748937891','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(33,'Jagdish','Nagy','M','2020-04-16','A+','06785445877','jagdish.nagy32@example.com','H.No. 35, Sachdev Path, Phusro 204899','Visakhapatnam','Andhra Pradesh','581439','Chakrika Dua','+915369378547',NULL,NULL,'2022-09-16','836473336882','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(34,'Yatan','Sharma','M','2007-10-03','O+','+915228728080','yatan.sharma33@example.com','H.No. 623, Dora Zila, Bellary 509977','Bengaluru','Karnataka','548351','Abeer Wali','6008484086',NULL,'Asthma','2025-05-28','924477962743','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(35,'Gaurav','Chhabra','M','1954-09-13','A+','+918233984546','gaurav.chhabra34@example.com','79, Kara Ganj, Jodhpur 166687','Vijayawada','Andhra Pradesh','540888','Aditya Garg','+917659180339','Dust','None significant','2024-02-08','317819329568','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(36,'Wazir','Madan','M','2007-07-20','O+','+911489025039','wazir.madan35@example.com','H.No. 429, Ramachandran Ganj, Yamunanagar-185016','Kakinada','Andhra Pradesh','589687','Faqid Oak','9965047735','Dust',NULL,'2026-06-19','722700869939','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(37,'Riya','Sankaran','F','1983-06-08','O-','+919619431142','riya.sankaran36@example.com','65/511, Morar Nagar, Karimnagar-121267','Guntur','Andhra Pradesh','509038','Harshil Bal','+915819956046','Dust','None significant','2023-11-30','218069517293','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(38,'Sara','Chad','F','2008-06-16','B+','8398262244','sara.chad37@example.com','126, Sama Road, Karawal Nagar 543799','Bengaluru','Karnataka','557080','Tanvi Chhabra','+914065965756',NULL,'None significant','2024-12-04','817111249233','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(39,'Ekanta','Mital','F','1984-01-29','O+','09375265479','ekanta.mital38@example.com','46, Comar Path, Guntakal-807374','Bengaluru','Karnataka','542245','Nilima Tata','+914342661797','None known',NULL,'2022-06-27','368224152205','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(40,'Suhani','Warrior','F','1947-07-30','AB-','6805891135','suhani.warrior39@example.com','65/61, Chaudhari Nagar, Korba-756798','Hyderabad','Telangana','542600','Hemani Bakshi','01461125457',NULL,'Type 2 Diabetes','2023-03-11','977697289990','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(41,'Ishanvi','Verma','F','2007-11-28','O+','05717751401','ishanvi.verma40@example.com','12/382, Dutta Circle, Karaikudi 736226','Nellore','Andhra Pradesh','572848','Ayush Hora','09660334191',NULL,'Asthma','2023-01-27','362360709927','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(42,'Idika','Pau','F','2013-01-07','B-','03714785969','idika.pau41@example.com','H.No. 57, Gera, Srikakulam-251341','Guntur','Andhra Pradesh','590519','Kashvi Dhaliwal','6692966278','Penicillin','None significant','2025-12-28','591734333317','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(43,'Gabriel','Ganesan','M','1964-11-18','AB+','04225790507','gabriel.ganesan42@example.com','88, Rege Chowk, Vijayanagaram-721903','Vijayawada','Andhra Pradesh','590673','Bachittar Maharaj','+918427978819',NULL,'Hypertension','2025-09-21','506224688058','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(44,'Deepa','Loyal','F','2011-12-03','O-','5807836134','deepa.loyal43@example.com','H.No. 51, Dalal Chowk, Bhagalpur 962923','Chennai','Tamil Nadu','546112','Daniel Panchal','4982544948','Pollen','Type 2 Diabetes','2023-07-09','376194842663','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(45,'Champak','Deshmukh','M','1955-09-23','B+','00422325367','champak.deshmukh44@example.com','66/711, Varma Marg, Arrah-759017','Hyderabad','Telangana','525105','Dev Warrior','03637454589',NULL,'None significant','2024-09-18','895756506622','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(46,'Eiravati','Sundaram','F','2019-09-13','B-','00017012770','eiravati.sundaram45@example.com','24/241, Krishna Path, Serampore-064361','Kakinada','Andhra Pradesh','538829','Aarav Kala','01293870051',NULL,'Hypertension','2023-01-03','114183131325','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(47,'Siddharth','Deo','M','1949-01-31','A+','01361115542','siddharth.deo46@example.com','21/890, Gala, Etawah-269731','Vijayawada','Andhra Pradesh','572529','Logan Dasgupta','6565234138',NULL,'None significant','2022-09-16','640104129762','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(48,'Lucky','Bala','M','1970-07-06','AB-','4389836403','lucky.bala47@example.com','H.No. 379, Wable Zila, Karimnagar-269658','Nellore','Andhra Pradesh','562746','Urishilla Bora','+919104300684','Penicillin','Hypertension','2023-01-13','159981355675','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(49,'Yamini','Sagar','F','2018-10-04','A-','06188924141','yamini.sagar48@example.com','56/91, Sarkar Road, Howrah-161799','Kakinada','Andhra Pradesh','552521','Dayamai Gill','+910202758842','Penicillin',NULL,'2025-03-27','854322725516','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(50,'Quincy','Date','M','1972-04-05','A-','4105648149','quincy.date49@example.com','85, Tata Nagar, Arrah 419138','Nellore','Andhra Pradesh','532530','Chaitanya Arora','+910756220863',NULL,'Asthma','2026-04-15','767507384687','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(51,'Naveen','Kothari','M','1979-02-16','AB-','05419518023','naveen.kothari50@example.com','H.No. 744, Chadha Path, Bangalore 349493','Guntur','Andhra Pradesh','558028','Jyoti Tak','+918320603850',NULL,'Asthma','2024-05-28','724081856069','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(52,'Oliver','Agarwal','M','2001-02-12','B-','6413836702','oliver.agarwal51@example.com','H.No. 386, Shanker Path, Amaravati 826199','Visakhapatnam','Andhra Pradesh','534687','Radhika De','+914456557431','Pollen',NULL,'2022-11-18','290008774121','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(53,'Harrison','Deshpande','M','1981-08-26','AB-','1212775618','harrison.deshpande52@example.com','47, Dar Road, Sangli-Miraj & Kupwad 903521','Peddapuram','Andhra Pradesh','590357','Ishani Randhawa','0442067883','Dust','Type 2 Diabetes','2023-08-20','353543257595','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(54,'Charvi','Shere','F','1951-05-22','B-','+912100323651','charvi.shere53@example.com','H.No. 137, Chanda Street, Bhilai 702966','Bengaluru','Karnataka','534675','Ayushman Raja','6253244720','None known','None significant','2025-04-22','983308055200','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(55,'Krisha','Merchant','F','1993-11-09','B-','06870146263','krisha.merchant54@example.com','57, Sundaram Circle, Buxar-642059','Kakinada','Andhra Pradesh','584886','Ayushman Mand','+917859321334',NULL,'Hypertension','2022-10-19','164731212366','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(56,'Baghyawati','Kanda','F','2012-03-11','O+','6522395590','baghyawati.kanda55@example.com','37/84, Swaminathan Street, Mysore 393087','Nellore','Andhra Pradesh','557560','Garima Jaggi','+915250029218',NULL,'Type 2 Diabetes','2025-11-11','870105207685','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(57,'Rajata','Bora','F','1993-06-12','AB-','06915452267','rajata.bora56@example.com','89/539, Radhakrishnan Street, Durg 209690','Guntur','Andhra Pradesh','557377','Eesha Kant','9172513552',NULL,'Asthma','2022-03-23','576266444796','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(58,'Chanchal','Nayak','F','1953-03-12','B-','00433154100','chanchal.nayak57@example.com','62/676, Prashad Path, Nangloi Jat-271040','Peddapuram','Andhra Pradesh','588381','Advika Cheema','+915262181599','None known','Asthma','2025-04-17','125558432468','Deceased','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(59,'Warhi','Balasubramanian','F','1948-08-11','B+','02962015336','warhi.balasubramanian58@example.com','H.No. 31, Ramaswamy Nagar, Jamnagar 506149','Nellore','Andhra Pradesh','561669','Ryan Chatterjee','+913241714677','Dust','None significant','2024-06-24','408877180672','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(60,'Libni','Chand','F','1953-03-09','AB-','8625652704','libni.chand59@example.com','H.No. 34, Bhatia, Jalandhar-586938','Bengaluru','Karnataka','545607','Lila Virk','08793741608','Penicillin','Hypertension','2023-10-20','214547351220','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(61,'Yauvani','Din','F','2007-03-27','AB-','+917223320616','yauvani.din60@example.com','45/11, Ranganathan Marg, Bally-099861','Chennai','Tamil Nadu','537777','Mason Divan','9911914856','Pollen','Type 2 Diabetes','2026-07-25','704561743101','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(62,'Kevin','Rajagopal','M','1967-08-24','O-','7997024629','kevin.rajagopal61@example.com','53, Soman Nagar, Serampore-544471','Hyderabad','Telangana','515194','Krish Mital','7546913736','None known','Type 2 Diabetes','2024-11-19','821559449515','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(63,'Watika','Varty','F','1949-11-12','B-','00821486289','watika.varty62@example.com','303, Shan Nagar, Karimnagar 457861','Chennai','Tamil Nadu','567952','Wyatt Pradhan','09727985524',NULL,'Asthma','2026-03-30','789335778916','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(64,'Chakradev','Mane','M','1968-12-16','B+','+916029333346','chakradev.mane63@example.com','22, Anand, Nizamabad 466574','Visakhapatnam','Andhra Pradesh','537752','Unnati Mittal','8969108589','Penicillin','None significant','2024-09-19','130586292150','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(65,'Lohit','Misra','M','1972-11-17','A+','1715454443','lohit.misra64@example.com','H.No. 965, Bal Street, Sagar-666099','Rajahmundry','Andhra Pradesh','572384','Hemal Kapadia','8758428241','Penicillin',NULL,'2023-04-06','228475055567','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(66,'Warinder','Dave','M','1989-09-17','O+','4825135346','warinder.dave65@example.com','H.No. 94, Dalal Chowk, Meerut 738168','Rajahmundry','Andhra Pradesh','566698','Odika Bhagat','+912356972521','Pollen','Hypertension','2024-04-30','631866089440','Deceased','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(67,'Yagnesh','Natarajan','M','1994-06-16','B+','2500743292','yagnesh.natarajan66@example.com','966, Sanghvi Marg, Yamunanagar-083505','Bengaluru','Karnataka','550277','Andrew Agrawal','3354216894',NULL,'Asthma','2024-11-06','400947542743','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(68,'Geetika','Bhattacharyya','F','2015-09-02','O+','+914478985625','geetika.bhattacharyya67@example.com','260, Kapur Ganj, Rajpur Sonarpur-982150','Hyderabad','Telangana','500336','Aadhya Warrior','0901001676',NULL,'None significant','2023-09-04','747842026084','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(69,'Diya','Krishnan','F','1985-01-23','AB-','02304618499','diya.krishnan68@example.com','H.No. 891, Comar Road, Mehsana-934835','Rajahmundry','Andhra Pradesh','545236','Chakrika Dyal','+918737530011',NULL,'Asthma','2026-04-12','514650874781','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(70,'Xiti','Dixit','F','2007-07-30','B-','+918114374470','xiti.dixit69@example.com','H.No. 455, D’Alia Marg, Ranchi 225579','Visakhapatnam','Andhra Pradesh','574946','Girik Pradhan','02166746762','Penicillin',NULL,'2026-05-08','149008905874','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(71,'Dayita','Deo','F','1979-08-22','B+','0216979729','dayita.deo70@example.com','02/77, Sabharwal Zila, Ranchi-450899','Chennai','Tamil Nadu','564923','Hamsini Venkataraman','9163756289',NULL,NULL,'2024-10-25','752686223803','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(72,'Avi','Apte','M','1953-12-12','AB-','2877217535','avi.apte71@example.com','38/66, Brar Ganj, Raiganj 177517','Bengaluru','Karnataka','502011','Harshil Raval','00880199488','Pollen',NULL,'2024-04-19','821000167049','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(73,'Harshil','Shan','M','2015-02-12','O+','05037589975','harshil.shan72@example.com','H.No. 305, Manne Path, Aligarh-272614','Bengaluru','Karnataka','544375','Raghav Dara','03735160917','Dust','None significant','2024-03-25','188690373106','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(74,'Vasudha','Thaman','F','2001-03-26','AB-','+917080869782','vasudha.thaman73@example.com','H.No. 699, Thaman Path, Gurgaon-465472','Hyderabad','Telangana','570912','Nitara Vala','08583339452',NULL,'Asthma','2022-05-21','792498065181','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(75,'Hemal','Thakur','F','2011-12-31','A-','5158799684','hemal.thakur74@example.com','10/62, Bhalla Nagar, Shimoga-442043','Visakhapatnam','Andhra Pradesh','556881','Jagrati Sethi','+919838638406',NULL,'None significant','2025-12-12','211121881692','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(76,'Sara','Saha','F','1949-02-16','O-','5800439735','sara.saha75@example.com','H.No. 72, Grover Zila, Kottayam-606484','Peddapuram','Andhra Pradesh','507355','Naveen Kumer','+915720259094',NULL,'Hypertension','2024-02-07','260763575623','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(77,'Xalak','Parmar','F','2006-03-03','B+','+915832818268','xalak.parmar76@example.com','H.No. 33, Narula Path, Durg-987801','Nellore','Andhra Pradesh','522280','Sanaya Khosla','9930561648',NULL,NULL,'2025-06-02','520352055311','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(78,'Lohit','Bakshi','M','1997-04-26','B+','5887704358','lohit.bakshi77@example.com','880, Kade Zila, Khandwa 386120','Bengaluru','Karnataka','530433','Garima Barad','+911024819346','Penicillin','None significant','2023-06-05','381146714497','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(79,'Sara','Seshadri','F','2005-10-16','B+','6650618091','sara.seshadri78@example.com','H.No. 81, Mitra Road, Ichalkaranji 660728','Vijayawada','Andhra Pradesh','509681','Laban Raman','4245088210','Penicillin','Hypertension','2025-04-18','801364526954','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(80,'Aahana','Ramesh','F','2020-11-01','O+','8143536822','aahana.ramesh79@example.com','43/12, Bhagat, Jamalpur-414139','Bengaluru','Karnataka','526111','Ganga Parikh','+913149135775','Penicillin','Type 2 Diabetes','2022-08-07','517630618448','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(81,'Niharika','Dua','F','1946-12-20','AB+','9556205336','niharika.dua80@example.com','577, Parmer Chowk, Morbi 291428','Vijayawada','Andhra Pradesh','535976','Adya Bose','1080996930',NULL,'Asthma','2025-11-05','919386609179','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(82,'Leena','Zacharia','F','2014-08-06','B-','02563942788','leena.zacharia81@example.com','H.No. 80, Gandhi Ganj, Amroha 299275','Vijayawada','Andhra Pradesh','579569','Theodore Sura','+911453038567','None known','Hypertension','2023-03-25','308892683171','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(83,'Utkarsh','Batra','M','2001-04-17','A+','+915184498926','utkarsh.batra82@example.com','18/46, Varty Ganj, Nagercoil-779082','Kakinada','Andhra Pradesh','540492','Noah Karpe','+918432225913','None known','Type 2 Diabetes','2022-03-10','501921209060','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(84,'Sarthak','Narayanan','M','1974-04-24','AB+','1777392603','sarthak.narayanan83@example.com','92/28, Din Nagar, Rourkela 286990','Vijayawada','Andhra Pradesh','523021','Frederick Kalita','09772369292',NULL,NULL,'2026-05-30','503604474507','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(85,'Yashodhara','Lalla','F','1968-01-21','AB-','+915799136621','yashodhara.lalla84@example.com','86/29, Goel Zila, Srikakulam 881172','Rajahmundry','Andhra Pradesh','538684','Raagini Vig','05086376599','Pollen','Hypertension','2026-07-06','611595758355','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(86,'Chandran','Sandal','M','2022-03-03','AB+','+914731498643','chandran.sandal85@example.com','81/80, Jha Marg, Alappuzha 126944','Visakhapatnam','Andhra Pradesh','573048','Jasmit Majumdar','6368872588',NULL,NULL,'2026-06-08','114579586722','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(87,'Wyatt','Kulkarni','M','1978-01-25','O+','09562137213','wyatt.kulkarni86@example.com','90/26, Chand Nagar, Chittoor-114351','Bengaluru','Karnataka','576619','Leena Rattan','8490277038','Penicillin','None significant','2024-01-31','839199717879','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(88,'Luke','Hayer','M','1995-05-15','O-','+919883920530','luke.hayer87@example.com','H.No. 65, Ravi Marg, Kadapa-118489','Nellore','Andhra Pradesh','579964','Idika Malhotra','+919376904268',NULL,'None significant','2022-05-10','433723585310','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(89,'Chatresh','Bora','M','1949-01-25','A+','4518489476','chatresh.bora88@example.com','H.No. 77, Bala, Bhiwandi-163356','Rajahmundry','Andhra Pradesh','539893','Zaitra Wason','+914341651827','Penicillin',NULL,'2022-07-19','248337633154','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(90,'Nirja','Pandya','F','1982-08-08','B+','+919423733343','nirja.pandya89@example.com','952, Dar Zila, Kumbakonam-807595','Guntur','Andhra Pradesh','554379','Anvi Swaminathan','+918463920867','Pollen',NULL,'2024-09-29','549320804913','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(91,'Anamika','Thakkar','F','2006-12-06','O-','06271875003','anamika.thakkar90@example.com','H.No. 59, Grover Road, Patiala-795527','Peddapuram','Andhra Pradesh','528477','Shivansh Saini','5564729293','Penicillin','Type 2 Diabetes','2023-04-29','498811121833','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(92,'Daksha','Madan','F','2002-11-07','O-','+918663227026','daksha.madan91@example.com','88/574, Batta Road, Navi Mumbai-034717','Guntur','Andhra Pradesh','507936','Abha Patel','08845061593','Penicillin','Hypertension','2023-01-24','237302403040','Inactive','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(93,'Harita','Mane','F','2004-06-17','B-','05877169472','harita.mane92@example.com','99, Bora Marg, Nanded-355449','Kakinada','Andhra Pradesh','584109','Anika Saxena','09876220234','Pollen','Asthma','2022-02-13','963505659547','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(94,'Balveer','Kade','M','1963-05-31','A-','+916111780068','balveer.kade93@example.com','H.No. 92, Ramakrishnan Zila, Berhampur 472282','Nellore','Andhra Pradesh','572641','Bakhshi Parikh','07784872829',NULL,'Asthma','2023-03-19','461777974575','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(95,'Vedant','Saran','M','2022-01-05','B+','8457831745','vedant.saran94@example.com','400, Deshpande Circle, Baranagar-807740','Vijayawada','Andhra Pradesh','517038','Brinda Kashyap','+918536866326','Dust','Hypertension','2026-06-24','221008543719','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(96,'Ranbir','Kannan','M','1946-05-02','O-','01638944846','ranbir.kannan95@example.com','241, Sethi Chowk, Pallavaram-502080','Rajahmundry','Andhra Pradesh','531186','Harsh Manda','02703120735','Dust','Hypertension','2022-02-02','388511190574','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(97,'Ucchal','Muni','F','1955-03-14','A-','05705120461','ucchal.muni96@example.com','460, Kothari Zila, Mango-037183','Guntur','Andhra Pradesh','562422','Lopa Muni','02088147435','Penicillin','Hypertension','2024-11-17','218513893124','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(98,'Atharv','Kamdar','M','1948-11-21','O+','+913650249163','atharv.kamdar97@example.com','79/25, Kothari Zila, Panchkula 950052','Nellore','Andhra Pradesh','560036','Jeremiah Sura','+915857306524','Pollen',NULL,'2022-05-05','628274907582','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(99,'Anusha','Sundaram','F','1988-12-26','AB-','7848739285','anusha.sundaram98@example.com','H.No. 98, Biswas Street, Hospet 485708','Kakinada','Andhra Pradesh','509632','Qasim Bahl','5935186387',NULL,'Hypertension','2025-05-30','169356565695','Active','2026-08-12 08:44:07');
INSERT INTO `Patients` VALUES(100,'Ganga','Mandal','F','1998-08-06','O+','06511810220','ganga.mandal99@example.com','31, Rama Nagar, Hajipur-053910','Chennai','Tamil Nadu','559469','Vyanjana Buch','00586509480','Dust','Asthma','2024-05-31','972304329325','Active','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `PrescriptionDetails`;
CREATE TABLE `PrescriptionDetails` (
    prescription_detail_id  INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id         INT,
    medicine_id             INT,
    dosage                  VARCHAR(255),
    frequency               VARCHAR(255),
    duration                VARCHAR(255),
    instructions            VARCHAR(255),
    FOREIGN KEY (prescription_id) REFERENCES `Prescriptions`(prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES `Medicines`(medicine_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `PrescriptionDetails` VALUES(1,1,15,'1 puff','Once a day','1 month','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(2,2,33,'2 tablets','Twice a day','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(3,2,29,'1 puff','Once a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(4,2,19,'10ml','Twice a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(5,3,33,'10ml','Twice a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(6,3,36,'2 tablets','As needed','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(7,3,13,'1 puff','Twice a day','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(8,3,18,'10ml','Three times a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(9,4,23,'1 puff','Once a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(10,4,23,'1 puff','As needed','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(11,4,29,'1 tablet','Twice a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(12,5,19,'1 tablet','Three times a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(13,5,20,'10ml','As needed','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(14,6,36,'10ml','Twice a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(15,6,25,'1 puff','Once a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(16,6,4,'5ml','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(17,7,7,'1 tablet','Three times a day','1 month','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(18,7,15,'10ml','Once a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(19,7,39,'1 puff','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(20,8,22,'10ml','As needed','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(21,8,2,'5ml','Three times a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(22,8,16,'1 puff','Three times a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(23,9,26,'2 tablets','Once a day','1 month','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(24,9,34,'1 puff','Twice a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(25,9,37,'2 tablets','As needed','7 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(26,10,9,'5ml','Twice a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(27,10,37,'2 tablets','Three times a day','3 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(28,11,27,'10ml','Three times a day','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(29,11,10,'2 tablets','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(30,11,2,'1 puff','Three times a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(31,12,31,'2 tablets','As needed','1 month','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(32,13,3,'10ml','Once a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(33,13,15,'2 tablets','Twice a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(34,14,28,'10ml','Once a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(35,14,21,'10ml','Once a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(36,15,36,'10ml','Once a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(37,16,34,'2 tablets','As needed','1 month','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(38,17,26,'10ml','Three times a day','10 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(39,17,12,'10ml','Twice a day','10 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(40,18,29,'5ml','Once a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(41,19,22,'1 puff','Twice a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(42,19,12,'1 tablet','As needed','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(43,20,13,'1 tablet','Three times a day','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(44,20,32,'10ml','Once a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(45,21,16,'1 puff','Three times a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(46,22,3,'2 tablets','Once a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(47,22,39,'5ml','Three times a day','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(48,22,7,'10ml','Twice a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(49,23,38,'5ml','Once a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(50,23,21,'5ml','As needed','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(51,23,36,'1 tablet','Three times a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(52,23,8,'5ml','Three times a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(53,24,31,'1 puff','Three times a day','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(54,25,40,'1 puff','As needed','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(55,25,32,'2 tablets','Twice a day','1 month','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(56,26,14,'1 puff','As needed','10 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(57,27,17,'1 tablet','Three times a day','7 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(58,27,36,'5ml','Once a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(59,27,22,'10ml','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(60,28,10,'10ml','Three times a day','10 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(61,28,4,'1 puff','Three times a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(62,28,36,'1 puff','Once a day','5 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(63,28,22,'5ml','Once a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(64,29,12,'1 puff','Once a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(65,29,3,'5ml','As needed','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(66,29,16,'5ml','As needed','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(67,29,34,'5ml','Twice a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(68,30,33,'2 tablets','Twice a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(69,30,34,'5ml','Three times a day','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(70,30,34,'2 tablets','Twice a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(71,30,30,'10ml','Once a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(72,31,34,'5ml','Once a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(73,32,29,'1 tablet','Three times a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(74,32,18,'1 tablet','Once a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(75,32,33,'1 tablet','Twice a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(76,33,5,'5ml','Three times a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(77,33,4,'2 tablets','Once a day','10 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(78,34,40,'5ml','Three times a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(79,34,35,'1 tablet','As needed','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(80,34,6,'10ml','Once a day','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(81,34,30,'10ml','Twice a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(82,35,21,'10ml','As needed','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(83,35,31,'1 tablet','Three times a day','10 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(84,35,11,'5ml','Three times a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(85,36,36,'1 tablet','Three times a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(86,36,26,'1 puff','As needed','5 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(87,36,16,'1 puff','Twice a day','10 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(88,37,35,'2 tablets','Twice a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(89,37,37,'10ml','Once a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(90,37,30,'5ml','Once a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(91,38,21,'10ml','Once a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(92,38,9,'1 puff','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(93,38,29,'1 puff','Three times a day','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(94,38,37,'10ml','Twice a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(95,39,6,'1 puff','Once a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(96,39,26,'2 tablets','Three times a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(97,39,36,'1 tablet','Once a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(98,40,28,'1 puff','As needed','1 month','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(99,40,25,'10ml','As needed','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(100,41,27,'2 tablets','Three times a day','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(101,41,9,'1 tablet','Once a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(102,41,10,'10ml','As needed','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(103,42,40,'2 tablets','As needed','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(104,42,36,'10ml','As needed','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(105,42,12,'10ml','Once a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(106,42,16,'1 puff','Three times a day','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(107,43,38,'10ml','Once a day','5 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(108,44,16,'10ml','Once a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(109,45,30,'1 puff','As needed','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(110,45,27,'5ml','Three times a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(111,45,3,'1 puff','Three times a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(112,45,17,'1 tablet','As needed','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(113,46,32,'1 tablet','Twice a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(114,46,18,'5ml','Twice a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(115,46,18,'5ml','Once a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(116,47,17,'2 tablets','As needed','5 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(117,47,3,'5ml','Once a day','5 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(118,48,29,'2 tablets','Twice a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(119,48,4,'5ml','Once a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(120,49,25,'10ml','As needed','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(121,49,34,'10ml','Once a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(122,50,28,'1 puff','Three times a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(123,50,18,'1 tablet','Three times a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(124,50,26,'10ml','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(125,51,36,'1 tablet','Once a day','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(126,51,27,'1 tablet','Once a day','1 month','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(127,51,23,'2 tablets','Three times a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(128,52,39,'1 tablet','Once a day','3 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(129,52,9,'10ml','Twice a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(130,53,28,'5ml','Three times a day','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(131,53,18,'1 tablet','As needed','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(132,53,4,'5ml','Three times a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(133,54,35,'10ml','Twice a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(134,54,29,'5ml','Once a day','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(135,55,3,'10ml','Three times a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(136,56,31,'10ml','As needed','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(137,56,35,'2 tablets','Once a day','10 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(138,56,8,'1 puff','Three times a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(139,56,26,'1 tablet','Once a day','7 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(140,57,13,'2 tablets','Once a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(141,57,20,'10ml','Once a day','1 month','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(142,57,32,'1 tablet','As needed','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(143,58,5,'1 puff','Three times a day','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(144,58,29,'1 tablet','Once a day','7 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(145,58,22,'1 tablet','As needed','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(146,58,34,'10ml','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(147,59,31,'1 puff','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(148,60,38,'1 tablet','Once a day','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(149,60,39,'1 puff','Twice a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(150,61,21,'2 tablets','Once a day','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(151,61,22,'1 tablet','Once a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(152,62,9,'1 tablet','As needed','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(153,63,27,'10ml','Twice a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(154,63,18,'1 puff','As needed','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(155,63,12,'1 puff','Once a day','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(156,64,36,'2 tablets','Twice a day','3 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(157,65,14,'5ml','Once a day','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(158,65,10,'10ml','As needed','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(159,65,3,'1 tablet','Three times a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(160,65,28,'5ml','Three times a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(161,66,33,'1 tablet','Once a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(162,66,38,'1 puff','Three times a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(163,66,21,'2 tablets','Once a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(164,66,7,'2 tablets','As needed','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(165,67,10,'2 tablets','As needed','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(166,67,24,'2 tablets','As needed','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(167,67,23,'5ml','Twice a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(168,67,3,'1 puff','Once a day','7 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(169,68,19,'1 puff','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(170,68,11,'1 puff','Twice a day','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(171,69,1,'10ml','Twice a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(172,69,28,'1 puff','Twice a day','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(173,69,37,'1 tablet','As needed','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(174,70,7,'10ml','As needed','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(175,70,36,'1 tablet','As needed','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(176,70,23,'5ml','Twice a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(177,70,2,'10ml','Three times a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(178,71,12,'5ml','As needed','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(179,71,5,'10ml','Three times a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(180,71,19,'10ml','Three times a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(181,71,35,'1 puff','Twice a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(182,72,8,'10ml','Three times a day','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(183,73,9,'5ml','Twice a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(184,73,31,'1 puff','Twice a day','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(185,74,24,'5ml','As needed','10 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(186,75,29,'1 puff','Three times a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(187,75,13,'10ml','Once a day','3 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(188,75,12,'5ml','Once a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(189,76,19,'10ml','Twice a day','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(190,77,34,'5ml','As needed','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(191,77,21,'10ml','As needed','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(192,78,19,'1 tablet','Twice a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(193,78,30,'2 tablets','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(194,78,19,'2 tablets','Twice a day','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(195,79,24,'2 tablets','Twice a day','15 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(196,79,21,'5ml','Twice a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(197,79,35,'2 tablets','Three times a day','3 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(198,80,19,'10ml','Three times a day','15 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(199,80,37,'10ml','Three times a day','1 month','After food');
INSERT INTO `PrescriptionDetails` VALUES(200,80,31,'1 tablet','Twice a day','1 month',NULL);
INSERT INTO `PrescriptionDetails` VALUES(201,81,21,'1 tablet','Twice a day','15 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(202,82,6,'1 puff','As needed','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(203,82,21,'1 puff','Once a day','1 month','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(204,82,26,'2 tablets','As needed','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(205,82,24,'1 tablet','Three times a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(206,83,27,'10ml','Three times a day','5 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(207,83,27,'2 tablets','Once a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(208,83,20,'10ml','Three times a day','3 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(209,83,25,'1 tablet','Once a day','10 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(210,84,13,'2 tablets','As needed','7 days',NULL);
INSERT INTO `PrescriptionDetails` VALUES(211,84,32,'1 tablet','Three times a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(212,85,31,'1 tablet','Three times a day','10 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(213,85,32,'2 tablets','Once a day','3 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(214,85,32,'1 tablet','Three times a day','15 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(215,86,17,'2 tablets','Once a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(216,87,27,'5ml','Once a day','7 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(217,87,34,'1 tablet','Twice a day','1 month','Before food');
INSERT INTO `PrescriptionDetails` VALUES(218,87,7,'1 puff','Twice a day','15 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(219,88,7,'1 puff','Three times a day','5 days','After food');
INSERT INTO `PrescriptionDetails` VALUES(220,88,9,'1 puff','Three times a day','7 days','At bedtime');
INSERT INTO `PrescriptionDetails` VALUES(221,88,27,'5ml','Twice a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(222,89,27,'10ml','Once a day','3 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(223,90,39,'1 puff','Three times a day','5 days','With plenty of water');
INSERT INTO `PrescriptionDetails` VALUES(224,90,2,'1 tablet','Twice a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(225,90,15,'5ml','Twice a day','5 days','Before food');
INSERT INTO `PrescriptionDetails` VALUES(226,90,6,'10ml','Once a day','3 days','After food');
DROP TABLE IF EXISTS `Prescriptions`;
CREATE TABLE `Prescriptions` (
    prescription_id    INT AUTO_INCREMENT PRIMARY KEY,
    patient_id         INT,
    doctor_id          INT,
    appointment_id     INT,
    admission_id       INT,
    prescription_date  VARCHAR(255),
    diagnosis          VARCHAR(255),
    notes              VARCHAR(255),
    status             VARCHAR(255) CHECK(status IN ('Active','Completed','Cancelled')),
    created_at         DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES `Patients`(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES `Doctors`(doctor_id),
    FOREIGN KEY (appointment_id) REFERENCES `Appointments`(appointment_id),
    FOREIGN KEY (admission_id) REFERENCES `Admissions`(admission_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Prescriptions` VALUES(1,99,23,15,NULL,'2025-12-09','Type 2 Diabetes','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(2,74,9,135,NULL,'2025-02-12','Type 2 Diabetes','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(3,29,23,147,NULL,'2025-02-20','Post-operative care','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(4,58,6,172,NULL,'2026-02-28','Upper respiratory infection','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(5,20,5,22,NULL,'2025-04-26','Migraine',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(6,45,21,138,NULL,'2025-08-05','Hypertension','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(7,11,30,120,NULL,'2025-01-09','Viral fever','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(8,89,18,118,NULL,'2026-07-29','Migraine',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(9,94,23,NULL,29,'2025-01-31','Post-operative care','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(10,87,25,139,NULL,'2025-05-15','Hypertension','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(11,24,27,31,NULL,'2025-07-08','Type 2 Diabetes',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(12,82,14,153,NULL,'2025-08-26','Hypertension','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(13,37,25,100,NULL,'2026-05-19','Upper respiratory infection',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(14,83,25,NULL,15,'2026-05-17','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(15,11,13,11,NULL,'2025-09-09','Post-operative care','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(16,66,8,78,NULL,'2025-10-20','Upper respiratory infection',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(17,80,16,129,NULL,'2025-04-26','Hypertension','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(18,36,4,178,NULL,'2025-06-17','Migraine','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(19,69,28,131,NULL,'2025-06-13','Upper respiratory infection','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(20,80,17,115,NULL,'2025-10-23','Migraine',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(21,18,17,151,NULL,'2026-05-03','Upper respiratory infection','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(22,13,27,NULL,7,'2025-02-20','Hypertension',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(23,36,4,178,NULL,'2026-08-10','Acid reflux','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(24,12,8,179,NULL,'2025-08-03','Post-operative care',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(25,93,4,NULL,9,'2026-06-23','Post-operative care','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(26,15,11,NULL,1,'2025-05-02','Viral fever','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(27,59,22,144,NULL,'2025-08-06','Viral fever','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(28,53,9,87,NULL,'2026-05-06','Upper respiratory infection',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(29,21,22,NULL,11,'2026-01-20','Migraine','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(30,14,1,NULL,25,'2025-07-26','Viral fever','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(31,53,6,NULL,22,'2025-03-31','Type 2 Diabetes','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(32,36,28,54,NULL,'2025-11-25','Hypertension',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(33,70,28,70,NULL,'2025-05-25','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(34,99,22,14,NULL,'2025-03-30','Upper respiratory infection','Review after course completion','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(35,30,28,NULL,20,'2025-09-22','Type 2 Diabetes','Review after course completion','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(36,70,11,27,NULL,'2026-02-20','Acid reflux','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(37,36,28,54,NULL,'2026-03-18','Acid reflux','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(38,28,1,104,NULL,'2025-03-13','Post-operative care',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(39,58,11,174,NULL,'2025-11-08','Upper respiratory infection','Continue if symptoms persist','Cancelled','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(40,72,26,NULL,12,'2025-04-23','Acid reflux','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(41,73,20,45,NULL,'2026-05-02','Hypertension',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(42,13,6,107,NULL,'2026-04-12','Acid reflux','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(43,68,18,9,NULL,'2025-02-08','Post-operative care','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(44,14,1,NULL,25,'2025-10-14','Upper respiratory infection','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(45,64,13,NULL,10,'2025-02-24','Type 2 Diabetes','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(46,51,23,169,NULL,'2025-10-26','Acid reflux','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(47,66,29,152,NULL,'2025-06-04','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(48,24,15,NULL,5,'2026-05-23','Acid reflux','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(49,76,28,122,NULL,'2025-11-05','Upper respiratory infection','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(50,94,23,81,NULL,'2026-06-27','Migraine',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(51,14,9,NULL,17,'2025-12-12','Migraine','Continue if symptoms persist','Cancelled','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(52,100,23,159,NULL,'2025-04-05','Viral fever','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(53,11,30,120,NULL,'2025-03-19','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(54,69,18,52,NULL,'2026-02-07','Hypertension','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(55,84,16,65,NULL,'2026-04-02','Viral fever','Review after course completion','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(56,90,8,NULL,19,'2025-01-04','Post-operative care','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(57,21,22,NULL,11,'2025-03-24','Acid reflux','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(58,98,6,50,NULL,'2025-01-26','Migraine','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(59,66,15,19,NULL,'2025-02-07','Migraine',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(60,47,11,162,NULL,'2025-02-21','Type 2 Diabetes',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(61,58,11,174,NULL,'2026-02-16','Type 2 Diabetes',NULL,'Cancelled','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(62,45,21,NULL,6,'2026-01-14','Post-operative care',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(63,95,14,NULL,3,'2025-01-07','Viral fever',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(64,31,27,157,NULL,'2025-04-01','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(65,30,28,NULL,20,'2026-01-06','Acid reflux','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(66,99,22,14,NULL,'2026-07-05','Hypertension',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(67,95,14,NULL,3,'2026-04-28','Post-operative care','Review after course completion','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(68,11,30,120,NULL,'2026-04-15','Upper respiratory infection',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(69,33,24,NULL,16,'2025-08-10','Post-operative care','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(70,82,5,NULL,24,'2026-06-01','Viral fever','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(71,82,5,NULL,24,'2025-01-25','Upper respiratory infection','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(72,18,4,86,NULL,'2025-02-26','Post-operative care','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(73,27,18,94,NULL,'2025-06-29','Migraine','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(74,64,11,69,NULL,'2026-05-31','Migraine','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(75,55,30,32,NULL,'2026-04-27','Migraine','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(76,12,8,179,NULL,'2025-06-01','Upper respiratory infection',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(77,1,4,166,NULL,'2025-01-22','Type 2 Diabetes',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(78,40,28,79,NULL,'2025-06-25','Acid reflux','Review after course completion','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(79,44,18,30,NULL,'2025-02-12','Type 2 Diabetes','Continue if symptoms persist','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(80,34,8,128,NULL,'2025-05-29','Upper respiratory infection','Review after course completion','Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(81,77,22,7,NULL,'2026-02-16','Post-operative care',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(82,66,17,72,NULL,'2025-07-20','Viral fever',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(83,80,17,115,NULL,'2026-07-29','Viral fever',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(84,42,18,143,NULL,'2026-04-19','Migraine','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(85,10,17,119,NULL,'2025-08-18','Viral fever',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(86,61,26,67,NULL,'2026-05-03','Migraine',NULL,'Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(87,36,4,178,NULL,'2025-05-19','Type 2 Diabetes',NULL,'Active','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(88,70,7,NULL,27,'2025-11-05','Type 2 Diabetes','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(89,39,30,57,NULL,'2025-07-12','Acid reflux','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
INSERT INTO `Prescriptions` VALUES(90,33,24,NULL,16,'2025-12-23','Type 2 Diabetes','Continue if symptoms persist','Completed','2026-08-12 08:44:07');
DROP TABLE IF EXISTS `Rooms`;
CREATE TABLE `Rooms` (
    room_id         INT AUTO_INCREMENT PRIMARY KEY,
    room_number     VARCHAR(255),
    room_type       VARCHAR(255) CHECK(room_type IN ('General','Private','Semi-Private','ICU','Operation Theatre')),
    floor_number    INT,
    department_id   INT,
    bed_capacity    INT,
    beds_occupied   INT,
    daily_charge    DECIMAL(10,2),
    status          VARCHAR(255) CHECK(status IN ('Available','Occupied','Under Maintenance','Reserved')),
    created_at      DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES `Departments`(department_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `Rooms` VALUES(1,'101','Operation Theatre',4,1,1,0,15000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(2,'102','ICU',4,1,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(3,'103','Semi-Private',4,1,2,1,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(4,'104','ICU',3,1,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(5,'105','ICU',3,1,1,1,8000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(6,'201','Semi-Private',4,2,2,0,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(7,'202','General',1,2,4,0,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(8,'203','General',1,2,4,3,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(9,'204','Semi-Private',5,2,2,0,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(10,'205','General',5,2,4,4,1500.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(11,'301','Operation Theatre',1,3,1,1,15000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(12,'302','ICU',4,3,1,1,8000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(13,'303','General',5,3,4,2,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(14,'304','Semi-Private',1,3,2,1,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(15,'305','Operation Theatre',2,3,1,0,15000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(16,'401','ICU',1,4,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(17,'402','Semi-Private',3,4,2,2,3000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(18,'403','General',5,4,4,2,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(19,'404','Private',5,4,1,1,5000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(20,'405','Operation Theatre',5,4,1,0,15000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(21,'501','Semi-Private',2,5,2,0,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(22,'502','Semi-Private',3,5,2,2,3000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(23,'503','Semi-Private',1,5,2,1,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(24,'504','Private',5,5,1,0,5000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(25,'505','ICU',2,5,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(26,'601','General',5,6,4,0,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(27,'602','Private',4,6,1,1,5000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(28,'603','ICU',2,6,1,1,8000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(29,'604','Semi-Private',3,6,2,1,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(30,'605','Operation Theatre',1,6,1,0,15000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(31,'701','Private',5,7,1,0,5000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(32,'702','General',3,7,4,0,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(33,'703','ICU',4,7,1,1,8000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(34,'704','Operation Theatre',4,7,1,1,15000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(35,'705','Semi-Private',5,7,2,0,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(36,'801','General',4,8,4,2,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(37,'802','General',5,8,4,2,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(38,'803','ICU',1,8,1,1,8000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(39,'804','Private',5,8,1,1,5000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(40,'805','General',2,8,4,0,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(41,'901','Semi-Private',2,9,2,0,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(42,'902','Semi-Private',3,9,2,1,3000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(43,'903','General',4,9,4,0,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(44,'904','ICU',2,9,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(45,'905','ICU',5,9,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(46,'1001','Operation Theatre',1,10,1,1,15000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(47,'1002','ICU',4,10,1,0,8000.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(48,'1003','General',1,10,4,3,1500.0,'Available','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(49,'1004','Semi-Private',4,10,2,2,3000.0,'Occupied','2026-08-12 08:44:07');
INSERT INTO `Rooms` VALUES(50,'1005','Operation Theatre',4,10,1,1,15000.0,'Occupied','2026-08-12 08:44:07');
COMMIT;
SET FOREIGN_KEY_CHECKS = 1;
