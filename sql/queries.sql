USE hospital_db;


-- 5.1 DQL – Basic Retrieval Queries

-- 1. Display all active patients
SELECT patient_id, first_name, last_name, gender, blood_group, phone
FROM Patients
WHERE status = 'Active';


-- 2. Display doctors with more than 5 years of experience
SELECT doctor_id, first_name, last_name, specialization, experience_years
FROM Doctors
WHERE experience_years > 5;


-- 5.2 Join Operations

-- 3. Display doctors along with their department names
SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    dept.department_name
FROM Doctors d
JOIN Departments dept
ON d.department_id = dept.department_id;


-- 4. Display appointments with patient and doctor names
SELECT
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_date,
    a.status
FROM Appointments a
JOIN Patients p
ON a.patient_id = p.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;


-- 5.3 Aggregate Functions, GROUP BY and HAVING

-- 5. Count appointments for each doctor
SELECT
    doctor_id,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id;


-- 6. Display doctors having more than 5 appointments
SELECT
    doctor_id,
    COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id
HAVING COUNT(*) > 5;


-- 5.4 Nested and Correlated Subqueries

-- 7. Display doctors whose consultation fee is above average
SELECT doctor_id, first_name, last_name, consultation_fee
FROM Doctors
WHERE consultation_fee > (
    SELECT AVG(consultation_fee)
    FROM Doctors
);


-- 8. Display the most expensive medicine
SELECT medicine_id, medicine_name, unit_price
FROM Medicines
WHERE unit_price = (
    SELECT MAX(unit_price)
    FROM Medicines
);


-- 5.5 Views and Relational Set Operations

-- 9. Create a view for active patients
CREATE VIEW Active_Patients AS
SELECT patient_id, first_name, last_name, gender, blood_group
FROM Patients
WHERE status = 'Active';

-- Display the view
SELECT *
FROM Active_Patients;


-- 5.6 DCL and TCL Operations

-- 10. TCL example using a transaction
START TRANSACTION;

UPDATE Medicines
SET stock_quantity = stock_quantity - 1
WHERE medicine_id = 1;

COMMIT;