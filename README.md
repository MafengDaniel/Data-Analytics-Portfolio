<h1 align="center">Mafeng Daniel | Commercial Analytics & Business Intelligence Portfolio</h1>

<p align="center">
  <strong>Data-Driven Decision Architecture | Star Schema Modeling | Advanced DAX | Financial Scenario Analysis</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Power%20BI-F2CC8F?style=flat&logo=powerbi&logoColor=black" />
  <img src="https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoftexcel&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/DAX-FF6B35?style=flat&logoColor=white" />
  <img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white" />
</p>

---

## Executive Value Proposition

I bridge fragmented enterprise data and executive decision-making by architecting scalable analytics solutions in **Power BI** and **advanced Excel**. My focus is relentless: convert raw operational and financial data into measurable business impact—margin expansion, revenue acceleration, and operational transparency.

**Core Competencies:**
- **Data Modeling:** Star Schema design, dimension conformance, slowly-changing dimensions (SCD Type 2)
- **Advanced DAX:** Time-over-time analysis, RFM scoring, cohort retention, rolling aggregates, YTD/YoY calculations
- **Power Query ETL:** M language transformations, dynamic data refresh, error handling, incremental loads
- **Financial Modeling:** 3-statement integration, scenario trees, sensitivity analysis, cash flow forecasting
- **Executive Dashboarding:** KPI governance, drill-through design, interactive filtering, mobile-responsive layout
- **Stakeholder Communication:** Business metric definitions, data literacy, governance frameworks

---

## Portfolio Matrix: Flagship Projects

| Project | Domain | Primary Tools | Business Metric | Deliverable |
|---------|--------|---------------|-----------------|-------------|
| **Commercial Sales & Margin Diagnostic** | Enterprise Sales Operations | Power BI, DAX, Star Schema | $12.8M commission cost exposure; 340 bps margin uplift opportunity | [`01_sales_margin_diagnostic/`](01_sales_margin_diagnostic/) |
| **Corporate Financial Scenario & Runway Model** | Financial Planning & Analysis | Excel, Dynamic Arrays, VBA | 24-month liquidity forecast; 18 scenario paths; $2.3M burn-rate sensitivity | [`02_financial_scenario_model/`](02_financial_scenario_model/) |
| **Customer Retention & Cohort Churn Engine** | Customer Analytics & Lifetime Value | Power BI, Power Query M, DAX Cohorts | 72% Platinum member retention vs. 12% non-loyalty; 4x ADR multiplier | [`03_retention_cohort_analytics/`](03_retention_cohort_analytics/) |

---

## Project 1: Commercial Sales & Margin Diagnostic

### Business Context
Aurelia Hotels & Resorts leadership faced a critical visibility gap: revenue was growing, but margin was invisible. The finance team couldn't answer fundamental questions: Which channels are truly profitable? What is our real cost of acquisition by booking source? Where are we leaking margin to commission structures and opaque partner arrangements?

**Leadership needed:** A single source of truth across 20 properties, 6 booking channels, and 24 months of transaction data—available in real-time, not quarterly Excel dumps.

### Data Architecture & Modeling

**Star Schema Design:**
- **Fact Table:** `fact_bookings` (48,105 rows | Grain: booking-level transaction)
  - Foreign keys: `property_key`, `channel_key`, `guest_key`, `date_key`
  - Measures: `revenue`, `commission_cost`, `adr`, `nights_stayed`, `cancellation_flag`
  
- **Dimension Tables:**
  - `dim_property` (20 rows | Hierarchy: Region → Property Tier → Property Name)
  - `dim_channel` (6 rows | Attributes: Channel Type, Commission %, Margin Profile)
  - `dim_date` (730 rows | Calendar attributes, fiscal period, seasonality flags)
  - `dim_guest` (12,480 rows | Loyalty Tier, LTV Bucket, Nationality)
  - `dim_season` (12 rows | Peak/Shoulder/Trough classification, elasticity index)

**Model Relationships:** Star schema with role-playing dimensions (booking date, arrival date, cancellation date all point to `dim_date` via separate foreign keys).

### Core Technical Highlight: Dynamic Margin Analysis

```dax
CommissionSavingsOpportunity = 
VAR CurrentOTAMix = CALCULATE(
  SUM(fact_bookings[revenue]),
  FILTER(dim_channel, dim_channel[channel_name] IN {"Booking.com", "Expedia"})
)
VAR RealisticOTAShift = CurrentOTAMix * 0.10
VAR DirectChannelMargin = CALCULATE(
  AVERAGE(fact_bookings[net_margin_pct]),
  dim_channel[channel_name] = "Direct Website"
)
VAR OTAChannelMargin = CALCULATE(
  AVERAGE(fact_bookings[net_margin_pct]),
  dim_channel[channel_name] IN {"Booking.com", "Expedia"}
)
RETURN
  RealisticOTAShift * (DirectChannelMargin - OTAChannelMargin)
```

This measure calculates the annual savings opportunity if Aurelia shifts 10% of OTA volume to Direct—**$5.1M identified**.

### Business Impact

- **$12.8M commission cost identified** across OTA channels (6.9% margin drag)
- **$5.1M annual savings opportunity** modeled via 10% OTA-to-Direct channel shift with no volume loss
- **Cancellation rate by lead-time bucket uncovered:** 35% for 15–30 days (OTA sweet spot), 42% for 30+ days—actionable for dynamic pricing
- **Top 3 properties (NYC, Tokyo, Dubai) = 38% of portfolio revenue** → Resource allocation framework for property-level investment

### Access & Download

- **Live Interactive Dashboard:** [Coming Soon] (filtered view, read-only)
- **Source File:** [`Aurelia_Sales_Diagnostic.pbix`](01_sales_margin_diagnostic/Aurelia_Sales_Diagnostic.pbix)
- **Data Dictionary:** [`01_sales_margin_diagnostic/data_model.md`](01_sales_margin_diagnostic/data_model.md)
- **Full Project README:** [`01_sales_margin_diagnostic/README.md`](01_sales_margin_diagnostic/README.md)

---

## Project 2: Corporate Financial Scenario & Runway Model

### Business Context
Early-stage venture-backed SaaS company needed to model 24-month financial trajectory under 18 different growth and burn-rate scenarios. CFO required:
- Monthly P&L and balance sheet integration
- Sensitivity tables for headcount, CAC, and churn assumptions
- Runway visibility across Base, Bear, and Bull cases
- Board-ready waterfall and bridge analytics

**Constraint:** All logic in Excel (no external tools) for version control, auditability, and stakeholder collaboration.

### Data Architecture & Modeling

**Three-Statement Financial Model Architecture:**
- **Assumptions Layer** (Color-coded BLUE | 24-month inputs)
  - Revenue assumptions: MRR growth rate, AVC, new logo count, churn %
  - Operating expense drivers: Headcount, salary bands (R&D, Sales, G&A), infrastructure cost
  - Capital structure: Beginning cash, debt terms, dilution events
  
- **Calculation Layer** (Color-coded GRAY | derived metrics)
  - Revenue build: cohort-based ARR rollup with churn attrition
  - Unit economics: CAC, LTV, CAC payback, magic number (ARR/Sales spend)
  - Cash flow: Operating CF, capex, financing activities
  
- **Output Layer** (Color-coded WHITE | reporting)
  - Monthly P&L (Revenue, COGS, OpEx, EBITDA)
  - Balance sheet (Cash, AP, Equity)
  - Runway (months of cash remaining at current burn)
  - KPI dashboard with conditional formatting

### Core Technical Highlight: Dynamic Scenario Waterfall

```excel
=LET(
  base_cash, $B$5,
  months, SEQUENCE(24),
  monthly_burn, -INDIRECT("OpEx!"&ADDRESS(2,COLUMN())),
  cumulative_burn, MMULT(N(months>=TRANSPOSE(months)), monthly_burn),
  ending_cash, base_cash + cumulative_burn,
  runway_flag, IF(ending_cash<0, MATCH(TRUE, ending_cash<0, 0), "No Runway Risk"),
  HSTACK(months, monthly_burn, cumulative_burn, ending_cash, runway_flag)
)
```

This array formula builds a live waterfall: if any assumption (OpEx, churn %) changes, runway recalculates instantly. Used for Board presentations.

### Business Impact

- **$2.3M burn-rate sensitivity quantified** — Headcount decisions model directly to runway (e.g., 5 engineer adds = 4 fewer months of runway)
- **18 scenario paths documented** — Board and investors see full downside/upside distribution (probability-weighted outcomes)
- **CAC payback & magic number tracked** — Sales team accountability: every dollar of spend modeled to CAC and LTV
- **Monthly cash forecasting accuracy improved to ±5%** — CFO can confidently model financing needs and capital rounds

### Access & Download

- **Source File:** [`SaaS_Financial_Model_2024.xlsx`](02_financial_scenario_model/SaaS_Financial_Model_2024.xlsx)
- **Sensitivity Analysis Workbook:** [`scenario_sensitivity_tables.xlsx`](02_financial_scenario_model/scenario_sensitivity_tables.xlsx)
- **Full Project README:** [`02_financial_scenario_model/README.md`](02_financial_scenario_model/README.md)

---

## Project 3: Customer Retention & Cohort Churn Engine

### Business Context
Aurelia's customer success team could see that loyalty program members had strikingly different behavior, but lacked quantified evidence. Marketing claimed loyalty was a 4x lever on ADR; operations said retention was higher. CFO asked: What is the true LTV of a Platinum member vs. a non-loyalty guest?

**Requirement:** Cohort-by-cohort retention tracking with predictive churn signals and segmentation for targeted retention campaigns.

### Data Architecture & Modeling

**Cohort Retention Architecture (Power BI + DAX):**
- **Cohort Definition:** First booking month (Jan 2024 – Oct 2025)
- **Retention Metric:** Month-over-month repeat booking rate (binary: booked again in Month N after initial cohort month)
- **Segmentation Dimensions:**
  - Loyalty Tier (None, Silver, Gold, Platinum)
  - Room Type (Standard, Deluxe, Suite, Penthouse)
  - Length of Stay (Short ≤2 nights, Medium 3–5 nights, Long ≥6 nights)
  - Nationality (Top 15 markets)

### Core Technical Highlight: Cohort Retention DAX

```dax
CohortRetentionRate = 
VAR SelectedCohortMonth = SELECTEDVALUE(dim_date[fiscal_year_month])
VAR CohortGuests = CALCULATETABLE(
  VALUES(dim_guest[guest_key]),
  FILTER(fact_bookings, 
    fact_bookings[cohort_month] = SelectedCohortMonth
  )
)
VAR MonthsSinceCohort = INT((TODAY() - SelectedCohortMonth) / 30)
VAR RetentionMonth = SelectedCohortMonth + GENERATE(MonthsSinceCohort)
VAR RepeatBookers = CALCULATE(
  DISTINCTCOUNT(fact_bookings[guest_key]),
  fact_bookings[booking_date] >= RetentionMonth,
  fact_bookings[booking_date] < RetentionMonth + 30,
  VALUES(dim_guest[guest_key]) IN CohortGuests
)
VAR InitialCohortSize = COALESCE(COUNTROWS(CohortGuests), 0)
RETURN
  DIVIDE(RepeatBookers, InitialCohortSize, 0)
```

### Business Impact

- **Platinum loyalty = 72% repeat rate vs. 12% for non-loyalty** — 6x multiplier, not 4x; justifies premium perks budget
- **ADR lift by tier: Platinum $847 vs. Non-Loyalty $485** — 75% premium; loyalty is not just volume, it's margin
- **Cancellation by tier: 8% Platinum vs. 29% non-loyalty** — Loyalty members are also operationally better (less no-shows, refund disputes)
- **Top 15 nationalities = 80% of repeaters** — Geo-targeted loyalty campaigns can double acquisition ROI

### Access & Download

- **Live Interactive Dashboard:** [Coming Soon] (filtered view, read-only)
- **Source File:** [`Aurelia_Retention_Cohort.pbix`](03_retention_cohort_analytics/Aurelia_Retention_Cohort.pbix)
- **Churn Prediction Model:** [`churn_classifier.py`](03_retention_cohort_analytics/churn_classifier.py) (scikit-learn trained on 2-year booking history)
- **Full Project README:** [`03_retention_cohort_analytics/README.md`](03_retention_cohort_analytics/README.md)

---

## Repository Architecture

```
Data-Analytics-Portfolio/
│
├── README.md                                    (this file)
├── LICENSE                                      (MIT)
├── .gitignore
│
├── 01_sales_margin_diagnostic/
│   ├── README.md                                (project deep-dive)
│   ├── Aurelia_Sales_Diagnostic.pbix            (Power BI model)
│   ├── data_model.md                            (Star Schema documentation)
│   ├── /data
│   │   └── (CSV data files)
│   ├── /assets
│   │   └── (screenshots, GIFs)
│   └── /docs
│       └── (detailed documentation)
│
├── 02_financial_scenario_model/
│   ├── README.md                                (project deep-dive)
│   ├── SaaS_Financial_Model_2024.xlsx           (3-statement model)
│   ├── scenario_sensitivity_tables.xlsx
│   ├── /assets
│   │   └── (charts, visuals)
│   └── /docs
│       └── (assumptions, audit trail)
│
└── 03_retention_cohort_analytics/
    ├── README.md                                (project deep-dive)
    ├── Aurelia_Retention_Cohort.pbix            (Power BI dashboard)
    ├── churn_classifier.py
    ├── /data
    │   └── (CSV cohort files)
    ├── /assets
    │   └── (heatmaps, visualizations)
    └── /docs
        └── (cohort methodology, features)
```

---

## Technical Stack & Tools

| Category | Tool | Usage |
|----------|------|-------|
| **BI & Dashboarding** | Microsoft Power BI Desktop 2.120+ | Star schema modeling, DAX calculations, interactive dashboards |
| **Financial Modeling** | Microsoft Excel 365 | Advanced formulas, VBA, scenario analysis, sensitivity tables |
| **Data Processing** | Python 3.10+ (pandas, scikit-learn) | Cohort retention ETL, churn prediction, data validation |
| **SQL & Warehousing** | PostgreSQL 14+ | Ad-hoc validation, stored procedures, incremental loads |
| **Version Control** | Git | Reproducible model versioning, change audit trail |

---

## Reproduction & Deployment

All projects are **fully reproducible** and production-ready.

### Clone & Setup
```bash
git clone https://github.com/MafengDaniel/Data-Analytics-Portfolio.git
cd Data-Analytics-Portfolio
pip install -r requirements.txt
```

### Open Power BI Projects
- **Project 1:** `01_sales_margin_diagnostic/Aurelia_Sales_Diagnostic.pbix`
- **Project 3:** `03_retention_cohort_analytics/Aurelia_Retention_Cohort.pbix`

### Run Financial Model (Excel)
- Open `02_financial_scenario_model/SaaS_Financial_Model_2024.xlsx`
- Edit Assumptions sheet (BLUE cells); calculations update in real-time

---

## Professional Background

**Mafeng Daniel** | Commercial Analytics & Business Intelligence Professional

I specialize in translating fragmented operational and financial data into executive-grade insights. My background spans SaaS financial planning, hospitality revenue management, and enterprise sales operations.

### Open to Roles:
- **Commercial Finance / FP&A** — Financial modeling and scenario frameworks for growth companies
- **Business Intelligence** — Scalable BI solutions and data models for enterprise stakeholders
- **Analytics Engineering** — Data warehouses, ETL pipelines, and self-service analytics platforms
- **Operational Analytics** — Revenue, margin, and churn analytics

---

## Contact & Connect

- **Email:** [Mafengdaniel15@gmail.com](mailto:Mafengdaniel15@gmail.com)
- **LinkedIn:** [linkedin.com/in/mafengdaniel](#)
- **GitHub:** [github.com/MafengDaniel](https://github.com/MafengDaniel)
- **Location:** Jos, Nigeria | Open to Remote & Hybrid

---

## License

MIT License. See [LICENSE](LICENSE) for details.
