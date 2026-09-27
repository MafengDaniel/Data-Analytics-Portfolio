# Hospital Management System SQL Database Project

A production-grade relational database demonstrating normalized schema design, data integrity, and comprehensive SQL query patterns for a healthcare operations domain.

---

## Project Overview

This portfolio project showcases expertise in **relational database architecture**, **SQL fundamentals to advanced techniques**, and **healthcare data modeling**. The system manages five normalized entities: departments, physicians, patient records, appointment scheduling, and financial billing — totaling **485+ operational records** with full referential integrity.

**Use Case:** A hospital operations team needs to schedule appointments, track doctor assignments, manage patient demographics, and reconcile billing records across multiple departments.

---

## Database Architecture

### Schema Snapshot

| Table | Records | Purpose |
|-------|---------|---------|
| `departments` | 50 | Hospital organizational units with annual budgets |
| `doctors` | 60 | Physician records including specialty, department, salary, and active status |
| `patients` | 120 | Patient demographics, contact information, and registration metadata |
| `appointments` | 150 | Appointment transactions linking patients, doctors, dates, and status |
| `bills` | 105 | Financial records tracking appointment-level billing and payment status |

### Relational Model & Foreign Keys

```
departments ←─────────────────── doctors
                                    ↑
                                    │
            ┌───────────────────────┴────────────────────┐
            │                                            │
        appointments                                   bills
            ↑                                            ↑
            │                                            │
        patients ───────────────────────────────── bills
```

**Key Relationships:**
- `doctors.department_id` → `departments.department_id` (Many-to-One)
- `appointments.doctor_id` → `doctors.doctor_id` (Many-to-One)
- `appointments.patient_id` → `patients.patient_id` (Many-to-One)
- `bills.appointment_id` → `appointments.appointment_id` (Many-to-One)
- `bills.patient_id` → `patients.patient_id` (Many-to-One)

---

## Getting Started

### Prerequisites
- MySQL 5.7+ or MySQL 8.0+
- MySQL Workbench (recommended) or command-line client

### Setup Instructions

1. **Create the database:**
   ```sql
   CREATE DATABASE hospital_management_system;
   USE hospital_management_system;
   ```

2. **Initialize the schema:**
   ```
   Run: 01_Create_Database_and_Tables_MySQL.sql
   ```

3. **Populate sample data** (in order to respect foreign key constraints):
   ```
   1. insert_departments.sql
   2. insert_doctors.sql
   3. insert_patients.sql
   4. insert_appointments.sql
   5. insert_bills.sql
   ```

4. **(Optional) Disable foreign key checks if encountering constraint errors:**
   ```sql
   SET FOREIGN_KEY_CHECKS = 0;
   -- Load data here
   SET FOREIGN_KEY_CHECKS = 1;
   ```

5. **Run practice queries:**
   ```
   Hospital_Queries_MySQL.sql
   ```

---

## Project Deliverables

| File | Description |
|------|-------------|
| `01_Create_Database_and_Tables_MySQL.sql` | Database and table creation with primary/foreign keys and constraints |
| `insert_departments.sql` | 50 department records |
| `insert_doctors.sql` | 60 physician records |
| `insert_patients.sql` | 120 patient records |
| `insert_appointments.sql` | 150 appointment records |
| `insert_bills.sql` | 105 billing records |
| `Hospital_Queries_MySQL.sql` | **60+ production-ready queries** |
| `Hospital_Management_System_Documentation.pdf` | Complete technical documentation |

---

## SQL Competencies Demonstrated

### Core Operations
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`, `DISTINCT`
- Boolean logic: `AND`, `OR`, `IN`, `NOT IN`, `BETWEEN`, `LIKE`, `NOT LIKE`
- Null handling: `IS NULL`, `IS NOT NULL`

### Aggregation & Grouping
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY` and `HAVING` clauses
- Rollup analysis and subtotals

### Advanced Joins & Queries
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`
- Multi-table joins (3+ tables)
- Nested queries in `SELECT`, `FROM`, and `WHERE` clauses
- Subqueries for filtering and aggregation

### Domain-Specific Functions
- Date manipulation: `YEAR()`, `MONTH()`, `QUARTER()`, `WEEK()`, `DATEDIFF()`
- Conditional logic: `CASE` expressions
- String functions for pattern matching and formatting

### Real-World Scenarios
- Revenue reporting by department and doctor
- Patient appointment history and attendance tracking
- Outstanding billing and payment reconciliation
- Doctor utilization and availability analysis
- Department budget variance analysis

---

## Sample Queries (Highlights)

**Revenue by Doctor:**
```sql
SELECT d.name, COUNT(a.appointment_id) AS total_appointments, SUM(b.amount) AS total_revenue
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
LEFT JOIN bills b ON a.appointment_id = b.appointment_id
GROUP BY d.doctor_id
ORDER BY total_revenue DESC;
```

**Unpaid Bills Report:**
```sql
SELECT p.name, d.name, a.appointment_date, b.amount, b.payment_status
FROM bills b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN patients p ON b.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE b.payment_status = 'Unpaid'
ORDER BY a.appointment_date DESC;
```

**Active Doctors by Department:**
```sql
SELECT d.department_id, COUNT(doc.doctor_id) AS active_doctors
FROM departments d
LEFT JOIN doctors doc ON d.department_id = doc.department_id AND doc.is_active = 1
GROUP BY d.department_id
ORDER BY active_doctors DESC;
```

---

## Design Highlights

✅ **Normalized Schema**  Third Normal Form (3NF) eliminates redundancy and maintains data consistency  
✅ **Referential Integrity**  Foreign key constraints enforce entity relationships  
✅ **Scalable Structure** Extensible to add new dimensions (e.g., medical procedures, departments, billing codes)  
✅ **Sample Data Quality**  Realistic healthcare data across 485+ records  
✅ **Production Query Library**  60+ queries covering operational, analytical, and financial reporting needs  

---

## Key Insights & Potential Extensions

- **Performance Optimization:** Add indexes on frequently queried columns (`doctor_id`, `patient_id`, `appointment_date`)
- **Time-Series Analysis:** Extend queries to analyze appointment volume trends and seasonal demand
- **Compliance & Auditing:** Add audit tables to track billing changes and data modifications
- **Reporting Layer:** Transition to a data warehouse schema (star schema) for executive dashboards

---

## Technical Stack

- **Database Engine:** MySQL 5.7+ / 8.0+
- **Development Tool:** MySQL Workbench
- **Modeling Approach:** Entity-Relationship (ER) Diagram, Third Normal Form (3NF)
- **Query Patterns:** ANSI SQL standard with MySQL-specific optimizations

---

## Notes & Caveats

- **NULL Handling:** Some optional columns intentionally contain `NULL` values to demonstrate null-handling queries
- **Active Status Encoding:** The `doctors.is_active` column uses `1` (active) and `0` (inactive) binary encoding
- **Data Load Order:** Always load insert scripts in the specified sequence due to foreign key dependencies
- **Sample Size:** Database contains 485 records suitable for learning; production systems would scale to millions

---

## Author's Notes

This project serves as a portfolio demonstration of **SQL fundamentals and advanced querying**, **relational database design principles**, and **healthcare domain knowledge**. It is production-ready as an educational reference and can be extended with additional features (auditing, procedures, permissions, etc.) for real-world deployments.

For questions or clarifications, review `Hospital_Management_System_Documentation.pdf`.
