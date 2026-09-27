# Hospital Management System

SQL Database Project

## Overview

This project is a relational database for a hospital. It manages departments, doctors, patients, appointments, and billing. The database is built with MySQL and includes sample data plus a full set of practice queries.

## Database Details

- **Database name:** hospital_management_system
- **Tables:** 5
- **Total records:** about 485 rows

| Table         | Rows | Description                                      |
|---------------|------|--------------------------------------------------|
| departments   | 50   | Hospital departments                             |
| doctors       | 60   | Doctors linked to departments                    |
| patients      | 120  | Patient personal and registration details        |
| appointments  | 150  | Appointments between patients and doctors        |
| bills         | 105  | Billing records linked to appointments           |

## Table Relationships

- doctors.department_id → departments.department_id
- appointments.patient_id → patients.patient_id
- appointments.doctor_id → doctors.doctor_id
- bills.appointment_id → appointments.appointment_id
- bills.patient_id → patients.patient_id

## Project Files

| File                                      | Purpose                                          |
|-------------------------------------------|--------------------------------------------------|
| 01_Create_Database_and_Tables_MySQL.sql   | Creates the database and all tables              |
| insert_departments.sql                    | Inserts 50 departments                           |
| insert_doctors.sql                        | Inserts 60 doctors                               |
| insert_patients.sql                       | Inserts 120 patients                             |
| insert_appointments.sql                   | Inserts 150 appointments                         |
| insert_bills.sql                          | Inserts 105 bills                                |
| Hospital_Queries_MySQL.sql                | 60+ practice queries                             |
| Hospital_Management_System_Documentation.pdf | Project documentation                         |

## How to Set Up

1. Create the database:
   ```sql
   CREATE DATABASE hospital_management_system;
   USE hospital_management_system;
   ```

2. Run the table creation script:
   ```
   01_Create_Database_and_Tables_MySQL.sql
   ```

3. Load the data in this order:
   1. insert_departments.sql
   2. insert_doctors.sql
   3. insert_patients.sql
   4. insert_appointments.sql
   5. insert_bills.sql

4. (Optional) If you face foreign key errors while loading data, run:
   ```sql
   SET FOREIGN_KEY_CHECKS = 0;
   ```
   Load the data, then turn checks back on:
   ```sql
   SET FOREIGN_KEY_CHECKS = 1;
   ```

5. Run the practice queries from:
   ```
   Hospital_Queries_MySQL.sql
   ```

## Query Topics Covered

- SELECT, WHERE, ORDER BY, LIMIT, DISTINCT
- AND, OR, BETWEEN, LIKE, NOT LIKE, IN, NOT IN
- IS NULL, IS NOT NULL
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY and HAVING
- Date functions (YEAR, MONTH, QUARTER, WEEK)
- CASE statements
- INNER JOIN, LEFT JOIN, RIGHT JOIN
- Multiple table joins (3 and 4 tables)
- Nested queries (in SELECT, FROM, and WHERE)

## Notes

- Some columns are optional and may contain NULL values. This is normal.
- The is_active column in the doctors table uses 1 for active and 0 for inactive.
- Always load the insert files in the correct order because of foreign key relationships.

## Tools Used

- MySQL
- MySQL Workbench
