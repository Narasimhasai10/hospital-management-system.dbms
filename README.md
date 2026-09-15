# 🏥 Hospital Management System

A relational database project designed to manage and organize hospital operations through a centralized MySQL database. The system maintains patient, doctor, department, appointment, admission, room, medicine, prescription, laboratory, billing, administrative, and inquiry records.

## 📌 Project Overview

The Hospital Management System replaces fragmented and manual record-keeping with a structured relational database. It provides centralized access to important hospital information while maintaining accuracy, consistency, and referential integrity.

The database is designed using primary keys, foreign keys, validation constraints, and normalized tables to reduce data redundancy and improve data management.

## ✨ Key Features

- 👨‍⚕️ Doctor Management
- 🧑‍🤝‍🧑 Patient Registration and Management
- 🏥 Department Management
- 📅 Appointment Scheduling
- 🛏️ Room and Admission Management
- 💊 Medicine Inventory Management
- 📋 Prescription Management
- 🧪 Laboratory Test Management
- 💰 Invoice and Billing Management
- 👨‍💼 Administrator Management
- 📩 Patient and Visitor Inquiry Management
- 🔗 Referential Integrity using Foreign Keys
- ✅ Data Validation using Constraints
- 📊 SQL Queries for Reports and Analysis

## 🗃️ Database Structure

The system contains 13 core relational tables:

| Table | Description |
|---|---|
| `PATIENTS` | Stores patient personal and medical information |
| `DOCTORS` | Stores doctor profiles and specialization details |
| `DEPARTMENTS` | Stores hospital department information |
| `ADMINS` | Stores administrative staff accounts |
| `APPOINTMENTS` | Manages scheduled patient appointments |
| `ROOMS` | Stores room, ward and bed information |
| `ADMISSIONS` | Manages inpatient admissions |
| `MEDICINES` | Maintains medicine inventory |
| `PRESCRIPTIONS` | Stores patient prescriptions |
| `PRESCRIPTIONDETAILS` | Stores medicines included in prescriptions |
| `LABTESTS` | Manages laboratory tests and reports |
| `INVOICES` | Stores patient billing information |
| `INQUIRIES` | Manages patient and visitor inquiries |

## 🛠️ Technologies Used

| Component | Technology |
|---|---|
| Database | MySQL 8.0 |
| Query Language | SQL |
| Database Tool | MySQL Command Line Client / MySQL Workbench |
| Version Control | Git & GitHub |
| Operating System | Windows |

## 🔑 Database Design

The database follows a relational design using:

- **Primary Keys (PK)** for unique record identification
- **Foreign Keys (FK)** for relationships between tables
- **NOT NULL** constraints for mandatory data
- **UNIQUE** constraints for preventing duplicate values
- **CHECK** constraints for valid data ranges
- **DEFAULT** values for automatic field values
- **3NF normalization** to reduce redundancy and anomalies

## 🔗 Major Relationships

- One Department → Many Doctors
- One Patient → Many Appointments
- One Doctor → Many Appointments
- One Patient → Many Admissions
- One Room → Many Admissions over time
- One Patient → Many Prescriptions
- One Prescription → Many Prescription Details
- One Medicine → Many Prescription Details
- One Patient → Many Laboratory Tests
- One Patient → Many Invoices

## 📊 SQL Operations

The project demonstrates different SQL operations including:

- DDL – Database and table creation
- DML – Insert, update and delete operations
- SELECT queries
- Filtering and sorting
- Aggregate functions
- GROUP BY and HAVING
- INNER JOIN
- LEFT JOIN
- Subqueries
- Multi-table queries
- Analytical queries
- Billing and hospital reports

## 🔍 Sample Queries

### View Patients

```sql
SELECT *
FROM Patients
LIMIT 10;
