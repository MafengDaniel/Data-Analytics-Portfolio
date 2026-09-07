<h1 align="center">Aurelia Hotels & Resorts: Data Analytics Portfolio</h1>
<h3 align="center">A production-grade analytics case study in Excel, SQL, and Python</h3>

<p align="center">
<img src="https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoftexcel&logoColor=white" />
<img src="https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white" />
<img src="https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/Streamlit-FF4B4B?style=flat&logo=streamlit&logoColor=white" />
<img src="https://img.shields.io/badge/Hospitality-4A90E2?style=flat&logoColor=white" />
</p>

<p align="center">
<a href="#contact">LinkedIn</a> | <a href="#contact">Email</a> | <a href="https://github.com/MafengDaniel">GitHub</a>
</p>

---

## Executive Summary

This portfolio demonstrates end-to-end analytics in a luxury hospitality context. Using a synthetic dataset of 48,105 bookings across 20 properties ($185.6M revenue, 24 months), I built three distinct analytical tools to answer progressively complex business questions: revenue performance and scenario planning (Excel), dimensional data warehouse and predictive SQL analysis (PostgreSQL), and machine learning with interactive dashboarding (Python/Streamlit).

Each project uses a different tool for a reason. Excel handles stakeholder-friendly modeling and what-if analysis. SQL powers dimensional queries and window function analytics. Python delivers machine learning and interactive exploration. Together, they demonstrate the full toolkit of a modern data analyst or BI engineer.

The portfolio is deliberately built on synthetic but realistic hospitality data. The generator produces booking patterns, channel distributions, and cancellation behaviors that mirror industry benchmarks. This allows reproducible analysis without PII concerns, and makes the work immediately portable to real datasets.

---

## Tech Stack

| Category | Tools |
|----------|-------|
| **Modeling & Reporting** | Microsoft Excel 2016+ |
| **Data Warehousing** | PostgreSQL 14+, ANSI SQL |
| **Analysis & ML** | Python 3.10+, pandas, scikit-learn |
| **Dashboarding** | Streamlit, Plotly |
| **Data Generation** | Python (synthetic, reproducible) |
| **Version Control** | Git |

---

## Portfolio Overview

| Project | Tool | Purpose | Location |
|---------|------|---------|----------|
| **Revenue Audit Workbook** | Excel | Institutional-grade reporting with 8 KPI sheets and what-if scenarios | `01_excel_revenue_audit/` |
| **SQL Data Warehouse** | PostgreSQL | Star schema with 25 analytical queries, window functions, RFM scoring | `04_sql_data_warehouse/` |
| **Cancellation ML & Dashboard** | Python/Streamlit | Gradient boosting classifier, feature importance, cohort retention analysis | `03_python_cancellation_ml/` |

---

## Project 1: Excel Revenue Audit Workbook

**Business Problem:** Aurelia's leadership needed a single source of truth for revenue performance across 20 properties, 6 booking channels, and 24 months of data. The analysis had to expose revenue leakage drivers, quantify the cost of cancellations, and model financial impact of strategic changes (e.g., shifting OTA volume to direct bookings).

**Methodology:** Built an institutional 8-sheet workbook following Wall Street design standards (Deep Navy #0F172A, Segoe UI, semantic color coding). Sheets include executive KPI dashboard, channel mix breakdown, cancellation deep dive, property-level performance, guest loyalty analysis, four quantified what-if scenarios, raw data with AutoFilter, and property reference tables.

**Key Findings:**

- Total revenue analyzed: $185.6M across 48,105 bookings
- Cancellation rate: 23.8% (industry benchmark is 20-25%), costing $7.4M in lost revenue
- Online Travel Agencies (OTAs) drive 48% of revenue but consume $12.8M in commissions (6.9% margin drag)
- Shifting 10% of OTA volume to Direct Website channel = $5.1M annual commission savings (scenario modeled and highlighted)
- Top 3 properties (New York, Tokyo, Dubai) account for 38% of portfolio revenue
- Platinum loyalty members generate 4x higher ADR and show 72% repeat booking rate vs. non-members

**What It Demonstrates:** Excel as a strategic tool, not just reporting. Conditional formatting heat maps, formula architecture (input cells vs. calculation layers vs. external references, each color-coded), 8 KPI cards with sparklines, dynamic scenarios that flow through to P&L impact.

*See full workbook and methodology in [`01_excel_revenue_audit/README.md`](01_excel_revenue_audit/README.md)*

---

## Project 4: SQL Data Warehouse

**Business Problem:** Stakeholders needed ad-hoc analytical queries without touching Excel. The data warehouse had to support executive dashboards, marketing attribution, customer lifetime value analysis, and forecasting inputs. Queries often involved time-series aggregations, window functions, and customer segmentation across multiple dimensions.

**Methodology:** Designed a star schema in PostgreSQL with 1 fact table (fact_bookings, 48,105 rows) and 5 dimensions: dim_date (calendar with season/weekend flags), dim_property (20 properties across 4 continents), dim_guest (customer attributes), dim_channel (6 booking sources), and dim_room (4 room types). Indexed on booking date and property ID for performance. Built 25 analytical queries covering revenue trends, channel economics, cancellation drivers, customer segmentation, and retention cohorts.

**Query Highlights:**

- Monthly revenue trend with YoY growth (LAG window function)
- Channel mix and commission cost analysis, ranked by ROI
- Cancellation rate by lead-time bucket (15-30 days: 35%, 30+ days: 42%)
- RFM customer scoring using NTILE window function and CTEs
- Cohort retention heatmap (month of first booking vs. repeat rate)
- 7-day rolling average and 12-month trailing aggregations
- Channel attribution with ROW_NUMBER for first-touch analysis
- Commission savings opportunity sizing (what-if queries mirroring Excel scenarios)

**What It Demonstrates:** SQL as the backbone of analytics. Window functions, CTEs, dimensional modeling, index strategy, and the ability to move fast on analytical requests. Queries are reproducible, version-controlled, and serve as living documentation of business logic.

*Full schema and all 25 queries in [`04_sql_data_warehouse/schema.sql`](04_sql_data_warehouse/schema.sql)*

---

## Project 3: Python Cancellation ML & Streamlit Dashboard

**Business Problem:** Cancellation patterns weren't random. Leadership wanted to predict which bookings would cancel early enough to take action (e.g., proactive outreach, pricing adjustments). Additionally, they needed to understand which features drove cancellation so product and marketing teams could address root causes.

**Methodology:** Built an end-to-end pipeline using pandas for feature engineering and scikit-learn for model training. Features included lead time, channel, length of stay, loyalty tier, property tier, guest nationality, and seasonal flags. Trained a gradient boosting classifier with train/test split on historical bookings. Built an interactive Streamlit dashboard with 4 tabs: executive overview with KPI cards, monthly cancellation trends by channel and lead time, feature importance ranking, and guest segmentation via RFM quartiles with monthly cohort retention heatmap.

**Dashboard Features:**

- **Overview tab:** Revenue, bookings, cancellation rate, and average ADR as KPI cards with trends
- **Cancellation Analysis:** Stacked horizontal bar charts showing cancellation rate by channel (Booking.com leads at 28%), lead time bucket (30+ days: 42% cancellation), and loyalty tier (non-loyalty: 29%, Platinum: 8%)
- **Feature Importance:** Ranked list of predictive signals (lead time, channel, loyalty status, length of stay)
- **Guest Segmentation:** RFM distribution across 16 quartile segments with monthly cohort retention heatmap showing repeat booking trends

Design follows Aurelia brand standards (Navy + Gold + Cream palette). All charts are interactive (Plotly), filterable, and sortable.

**What It Demonstrates:** Python for production ML. Feature engineering decisions, train/test discipline, model interpretation (not just accuracy), and the ability to translate model outputs into business actions via interactive dashboarding.

*Code in [`03_python_cancellation_ml/`](03_python_cancellation_ml/)*

---

## Data Architecture

```
generate_data.py (synthetic, realistic hospitality patterns)
       |
       v
fact_bookings.csv (48,105 rows, 24 months)
dim_property.csv (20 properties)
       |
       +----> 01_excel_revenue_audit/
       |      Aurelia_Revenue_Audit.xlsx
       |      (8-sheet workbook, scenario modeling)
       |
       +----> 04_sql_data_warehouse/
       |      schema.sql
       |      (star schema, 25 queries)
       |
       +----> 03_python_cancellation_ml/
              pipeline.py (feature engineering, training)
              app.py (Streamlit dashboard)
```

---

## Dataset Summary

**Properties:** 20 luxury hotels across 6 regions (North America, Europe, Asia Pacific, Middle East, Africa, South America)

**Tiers:** Luxury, Premium, Select, Comfort

**Scope:** January 2024 to October 2025 (24 months)

| Metric | Value |
|--------|-------|
| Total Bookings | 48,105 |
| Total Revenue | $185.6M |
| Booking Channels | 6 (Direct Website, Booking.com, Expedia, Travel Agent, Walk-in, Corporate) |
| Average Daily Rate (ADR) | $593.94 |
| Average Length of Stay | 3.2 nights |
| Cancellation Rate | 23.8% |
| Loyalty Tiers | 4 (None, Silver, Gold, Platinum) |
| Room Types | 4 (Standard, Deluxe, Suite, Penthouse) |
| Guest Nationalities Tracked | 15 top markets (80% of bookings) |
| Average Guest Review Score | 8.4/10 |

---

## Key Insights Across Portfolio

1. **OTAs drive revenue but destroy margin.** OTAs account for 48% of revenue ($88.5M) but cost $12.8M in commissions. Shifting 10% of OTA volume to Direct Website saves $5.1M annually and improves guest relationship data.

2. **Cancellation is a lead-time problem.** Last-minute bookings (0-7 days) cancel at 8%. Medium lead-time bookings (15-30 days, primarily OTA) cancel at 35%. Very long lead-time bookings (30+ days) cancel at 42%.

3. **Loyalty is a 4x multiplier.** Platinum members generate $847 ADR vs. $485 non-members. They cancel at 8% vs. 29% for non-loyalty. Repeat booking rate is 72% for Platinum vs. 12% for non-loyalty.

4. **Top 3 properties are the portfolio engine.** Aurelia New York, Tokyo, and Dubai account for $70.3M (38%) of total revenue despite representing just 15% of property count.

5. **Top 15 nationalities represent 80% of demand.** USA (22% of bookings), China (10%), and UK (10%) lead. Regional pricing and marketing strategy could capture incremental volume from emerging markets.

---

## How to Reproduce

All analysis is built on synthetic data and fully reproducible.

1. **Clone and install dependencies:**
   ```bash
   git clone https://github.com/MafengDaniel/Data-Analytics-Portfolio.git
   cd hospitality-portfolio
   pip install -r requirements.txt
   ```

2. **Regenerate synthetic data (optional):**
   ```bash
   python generate_data.py
   ```
   This creates fresh `fact_bookings.csv` and `dim_property.csv` with the same structure and patterns.

3. **Build Excel workbook:**
   ```bash
   python 01_excel_revenue_audit/build_excel.py
   ```
   Opens `Aurelia_Revenue_Audit.xlsx` ready for review.

4. **Load SQL schema:**
   ```bash
   psql -U postgres -d hospitality_portfolio -f 04_sql_data_warehouse/schema.sql
   ```
   Creates all tables, dimensions, fact tables, and indexes. Loads CSV data into PostgreSQL.

5. **Train ML model and start dashboard:**
   ```bash
   python 03_python_cancellation_ml/pipeline.py
   streamlit run 03_python_cancellation_ml/app.py
   ```
   Dashboard runs on `http://localhost:8501`.

---

## Project Structure

```
hospitality-portfolio/
├── README.md                               (this file)
├── .gitignore
├── generate_data.py                        (synthetic data generator)
├── fact_bookings.csv                       (48,105 booking records)
├── dim_property.csv                        (20 property dimensions)
│
├── 01_excel_revenue_audit/
│   ├── README.md
│   ├── Aurelia_Revenue_Audit.xlsx          (8-sheet workbook)
│   └── build_excel.py                      (workbook builder)
│
├── 03_python_cancellation_ml/
│   ├── pipeline.py                         (feature engineering, model training)
│   └── app.py                              (Streamlit interactive dashboard)
│
└── 04_sql_data_warehouse/
    └── schema.sql                          (star schema, 25 queries, indexes)
```

---

## Datasets

All data is **synthetic** and generated by `generate_data.py`. The generator creates realistic hospitality booking patterns including:

- Seasonal demand variation (summer peaks, winter troughs)
- Channel-specific booking behavior (OTA books further in advance, higher cancellation)
- Loyalty tier effects (premium members book more frequently, cancel less often)
- Geographic distribution (top properties in NYC, Tokyo, Dubai)
- Price elasticity by room type and season

The data is production-like (no PII, no real business data) and reproducible. To extend or customize the generator, modify `generate_data.py` directly. The schema and analysis pipeline automatically adapt to new data distributions.

---

## License

MIT License. See LICENSE file for details.

---

## Contact & About

**Mafeng Daniel** | Data Analyst | Open to Data Analyst, BI, and Analytics Engineering roles

- Email: Mafengdaniel15@gmail.com
- LinkedIn: [Your Profile](#)
- GitHub: [MafengDaniel](https://github.com/MafengDaniel)
- Location: Jos, Nigeria

Always interested in discussing a challenging data problem or analytics infrastructure question.
