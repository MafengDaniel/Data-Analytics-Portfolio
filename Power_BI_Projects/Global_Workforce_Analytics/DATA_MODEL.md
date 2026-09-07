# Data Model Documentation

## Star Schema Architecture

### Fact Table: Fact_Employment
Captures granular compensation lines, annual work cycles, work setting tags, and data completion flags.

**Key Columns:**
- Employee ID (FK to Dim_Staff)
- Company ID (FK to Dim_Companies)
- Salary
- Work Year
- Work Setting (Remote, Hybrid, On-Site)
- Department
- Experience Level
- Bonus %
- Data Completion Flag
- High Performer Flag

### Dimension Tables

#### Dim_Staff
Maintains normalized employee attributes and role taxonomy.

**Key Columns:**
- Employee ID (PK)
- Employee Name
- Department
- Experience Level (Entry, Mid, Senior, Executive)
- Job Title
- Hire Date

#### Dim_Companies
Maintains normalized corporate entity and organizational attributes.

**Key Columns:**
- Company ID (PK)
- Company Name
- Industry Sector
- Operating Region
- Headquarters Location
- Company Size Category

## Relationship Cardinality

- Fact_Employment (Many) → Dim_Staff (One) - Single-direction cross-filtering
- Fact_Employment (Many) → Dim_Companies (One) - Single-direction cross-filtering

## HRIS Data Quality Monitoring

- Missing Salary Count: Tracks records with null salary values
- % Complete Data: Subsidiary-level data completeness percentage
- Data Quality Flags: Identifies reporting compliance issues
