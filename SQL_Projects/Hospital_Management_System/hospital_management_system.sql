CREATE DATABASE IF NOT EXISTS hospital_management_system;
USE hospital_management_system;

-- Hospital Management System
-- Core schema for departments, doctors, patients, appointments, and bills.

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100),
    phone_extension VARCHAR(20),
    annual_budget DECIMAL(12,2),
    created_at DATE
);

CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    department_id INT,
    hire_date DATE,
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    is_active TINYINT DEFAULT 1,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(200),
    blood_type VARCHAR(5),
    registration_date DATE,
    emergency_contact VARCHAR(100)
);

CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATE,
    appointment_time VARCHAR(10),
    status VARCHAR(20) DEFAULT 'Scheduled',
    reason VARCHAR(200),
    notes TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    patient_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    bill_date DATE,
    due_date DATE,
    status VARCHAR(20) DEFAULT 'Pending',
    payment_method VARCHAR(30),
    paid_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- Basic exploration
SELECT * FROM patients;

SELECT first_name, last_name, specialization
FROM doctors
ORDER BY last_name, first_name;

SELECT patient_id, first_name, last_name, gender
FROM patients
WHERE gender = 'Female';

SELECT doctor_id, first_name, last_name, salary
FROM doctors
WHERE salary > 180000
ORDER BY salary DESC;

-- Summary metrics
SELECT
    COUNT(*) AS total_bills,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_bill,
    MIN(amount) AS lowest_bill,
    MAX(amount) AS highest_bill
FROM bills;

SELECT
    COUNT(*) AS total_doctors,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary,
    AVG(salary) AS average_salary,
    SUM(salary) AS total_payroll
FROM doctors;

-- Appointment volume by month
SELECT
    YEAR(appointment_date) AS appointment_year,
    MONTH(appointment_date) AS appointment_month,
    COUNT(*) AS appointment_count
FROM appointments
GROUP BY YEAR(appointment_date), MONTH(appointment_date)
ORDER BY appointment_year, appointment_month;

-- Departments and doctor counts
SELECT
    dept.department_name,
    COUNT(doc.doctor_id) AS doctor_count
FROM departments AS dept
LEFT JOIN doctors AS doc
    ON dept.department_id = doc.department_id
GROUP BY dept.department_id, dept.department_name
ORDER BY doctor_count DESC;

-- Revenue by billing status
SELECT
    status,
    COUNT(*) AS bill_count,
    SUM(amount) AS total_amount,
    AVG(amount) AS average_amount
FROM bills
GROUP BY status
ORDER BY total_amount DESC;

-- Doctors with appointment volume and department
SELECT
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    dept.department_name,
    COUNT(a.appointment_id) AS total_appointments,
    SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed_appointments,
    CASE
        WHEN COUNT(a.appointment_id) >= 5 THEN 'High Volume'
        WHEN COUNT(a.appointment_id) >= 3 THEN 'Medium Volume'
        ELSE 'Low Volume'
    END AS volume_category
FROM doctors AS d
JOIN appointments AS a ON d.doctor_id = a.doctor_id
JOIN departments AS dept ON d.department_id = dept.department_id
WHERE a.appointment_date >= '2023-01-01'
GROUP BY d.doctor_id, d.first_name, d.last_name, d.specialization,
         dept.department_name
HAVING COUNT(a.appointment_id) >= 2
ORDER BY total_appointments DESC
LIMIT 10;

-- Full appointment and billing report
SELECT
    a.appointment_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    dept.department_name,
    a.appointment_date,
    a.status AS appointment_status,
    b.amount,
    b.status AS bill_status
FROM appointments AS a
JOIN patients AS p ON a.patient_id = p.patient_id
JOIN doctors AS d ON a.doctor_id = d.doctor_id
JOIN departments AS dept ON d.department_id = dept.department_id
LEFT JOIN bills AS b ON a.appointment_id = b.appointment_id
WHERE a.status = 'Completed'
ORDER BY a.appointment_date DESC;

-- Patients whose bills exceed the average bill amount
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    b.amount,
    b.bill_date
FROM patients AS p
JOIN bills AS b ON p.patient_id = b.patient_id
WHERE b.amount > (SELECT AVG(amount) FROM bills)
ORDER BY b.amount DESC;

-- Top patients by total billed amount
SELECT
    p.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    SUM(b.amount) AS total_billed,
    COUNT(b.bill_id) AS number_of_bills
FROM patients AS p
JOIN bills AS b ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY total_billed DESC
LIMIT 5;
