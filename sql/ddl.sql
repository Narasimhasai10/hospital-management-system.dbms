CREATE DATABASE IF NOT EXISTS hospital_db;

USE hospital_db;

SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
