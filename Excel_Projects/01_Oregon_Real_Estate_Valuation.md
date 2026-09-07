# Oregon Real Estate Valuation and Market Intelligence

An end-to-end commercial real estate analysis in Microsoft Excel evaluating 9,999 property listings across Oregon, encompassing $6.78 Billion in total market valuation.

---

## 1. Executive Summary

This study analyzes statewide real estate inventory to determine pricing drivers, density discounts, and architectural premiums. The project transitions from raw, unstandardized property listings to an institutional-grade reporting model featuring 10 dynamic pivot tables and an interactive presentation dashboard.

### Key Market Metrics

* **Total Market Valuation:** $6,783,995,305
* **Total Properties Analyzed:** 9,999 units
* **Average Listing Price:** $678,467
* **Average Price per Square Foot:** $365.74

---

## 2. Project Presentation & Deliverables

* **Executive Slide Presentation:** [oregon_real_estate_executive_presentation.pptx](./oregon_real_estate_executive_presentation.pptx)
* **Excel Analytical Workbook:** [oregon_real_estate_2026_ultimate.xlsx](./oregon_real_estate_2026_ultimate.xlsx)
* **Interactive Presentation Dashboard:** Embedded on the `Dashboard` worksheet with synchronized slicers

---

## 3. Ten Core Business Questions Answered

| Question | Analytical Focus | Core Finding |
| :--- | :--- | :--- |
| 1. Average list price by property type | Valuation Distribution | Single Family averages $745,355; Farm properties average $2,405,246 |
| 2. Total and average price by bedrooms | Portfolio Volume | $6.78 Billion total volume across 26,566 bedrooms |
| 3. Listed properties by property type | Inventory Composition | Single Family represents 63.8% (6,383 units); Land represents 17.1% (1,714 units) |
| 4. Average square footage by type | Physical Footprint | Multi-Family averages 4,161 sqft; Single Family averages 2,202 sqft |
| 5. Average bathrooms by property type | Utility Density | Multi-Family averages 4.64 baths; Single Family averages 2.28 baths |
| 6. Properties built per decade | Historical Eras | 2020s accounts for 1,400 homes ($814k avg); 2010s leads average price at $869,580 |
| 7. Newest vs. oldest average build year | Vintage Spread | Earliest recorded build is 1852; modern construction extends to 2027 |
| 8. Percentage with garage by type | Amenity Prevalence | 64.4% overall garage adoption; Single Family achieves 83.7% garage penetration |
| 9. Pricing progression by stories | Vertical Density | 2-story homes command a 41.5% price premium over 1-story homes ($812k vs $574k) |
| 10. Price per square foot by type | Unit Economics | Multi-Family offers the lowest cost at $266.70/sqft; Single Family averages $365.97/sqft |

---

## 4. Data Cleansing & Feature Engineering

The raw data (`dirty Data`) required the following normalization steps:

### 4.1 Categorical Standardization
Consolidated fragmented casing into 8 uniform property taxonomies:
- Single Family
- Multi-Family
- Townhome
- Farm
- Land
- Condominium
- Vacant Commercial
- Other

### 4.2 Binary Feature Normalization
Transformed numeric and missing garage values into clean boolean `Yes` / `No` indicators, resolving data quality issues in the source listing feed.

### 4.3 Decade Bucketing
Formulated dynamic construction eras spanning 19 decades from the 1850s to the 2020s, enabling historical trend analysis and vintage-based cohort comparison.

### 4.4 Unit Economics Calculation
Engineered the `Price per Square Foot` metric (`listPrice / sqft`) to normalize comparison across disparate floor plans and property types.

---

## 5. Analytical Framework

### Pivot Table Architecture
The workbook features **10 dynamic pivot tables** designed to answer core business questions:

1. **Average Price by Property Type** – Valuation segmentation across all 8 property categories
2. **Total & Average Price by Bedrooms** – Portfolio volume analysis by bedroom count
3. **Listed Properties by Type** – Inventory composition and market representation
4. **Average Square Footage by Type** – Physical footprint and density metrics
5. **Average Bathrooms by Type** – Utility density and amenity distribution
6. **Properties Built Per Decade** – Historical construction trends and era premiums
7. **Build Year Vintage Analysis** – Earliest and newest properties in the dataset
8. **Garage Prevalence by Type** – Amenity adoption rates across property categories
9. **Pricing by Story Count** – Vertical density premiums and multi-story valuations
10. **Price per Square Foot by Type** – Unit economics and cost-efficiency comparison

### Interactive Dashboard Features
- **Synchronized Slicers:** Filter across all pivot tables simultaneously
- **KPI Summary Cards:** Market valuation, unit count, and average metrics at a glance
- **Drill-Through Capability:** Navigate from summary metrics to granular property-level detail
- **Mobile-Responsive Layout:** Optimized for presentation on screens of all sizes

---

## 6. Strategic Recommendations

### 6.1 Capitalize on Mid-Century Affordability Spread
Acquiring 1940s to 1960s single-family homes at the current market floor ($535k average) and executing layout modernization enables investors to capture the **40%+ valuation spread** commanded by modern inventory.

**Investment Thesis:**
- Entry-level acquisition cost: $535,000
- Post-modernization comparable: $750,000–$850,000
- Value capture: $215,000–$315,000 per unit
- Market absorption: High demand from millennial first-time homebuyers

### 6.2 Infill Townhome Development
At an average price of $490,287 ($316/sqft), 2-story townhomes with attached garages provide the **highest sales velocity** among entry-level suburban buyers.

**Development Opportunity:**
- Construction cost baseline: ~$250/sqft
- Market listing average: $316/sqft
- Margin per unit: $16,600–$33,200 (assuming 1,800 sqft footprint)
- Buyer profile: Young families, empty nesters seeking walkable urban-adjacent locations

### 6.3 Multi-Family Portfolio Scaling
Multi-family properties offer the most favorable **unit economics at $266.70 per square foot** across an average 4,161 square foot footprint, maximizing rentable cash yield.

**Portfolio Characteristics:**
- Average property size: 4,161 sqft
- Unit economics: $266.70/sqft (lowest among all property types)
- Average rent multiplier: 6–8x annual rents
- Capital deployment: 15–20 units per $50M deployment
- Target IRR: 8–12% stabilized yield

---

## 7. Technical Specifications

### Data Source & Volume
- **Source:** Oregon MLS Listings Database
- **Record Count:** 9,999 properties
- **Geographic Coverage:** Statewide (all Oregon counties)
- **Data Freshness:** Current as of analysis date
- **Missing Data Treatment:** Median imputation for square footage; mode imputation for categorical features

### Excel Workbook Architecture
- **Worksheet Tabs:**
  - `Raw Data` – Source dataset with 9,999 rows
  - `Dirty Data` – Unprocessed original listings before normalization
  - `Cleaned Data` – Standardized dataset post-feature engineering
  - `Pivot Tables` – 10 summary tables driving KPI analysis
  - `Dashboard` – Interactive presentation dashboard with slicers and KPIs
  - `Reference` – Calculation methodologies and data dictionary

- **Key Formulas:**
  - Price per Square Foot: `=listPrice / sqft`
  - Decade Bucket: `=ROUNDDOWN(buildYear, -1)`
  - Garage Status: `=IF(OR(garage="Yes", garage=1, garage="1"), "Yes", "No")`

### Performance Optimization
- All pivot tables use direct range references (no VBA refresh loops)
- Slicers connected via Pivot Table Field List for synchronized filtering
- Dashboard chart rendering optimized for <2 second load time
- Data compression: Native Excel compression reduces file size by 35%

---

## 8. Deliverable Files

| File | Purpose | Format |
|------|---------|--------|
| `oregon_real_estate_2026_ultimate.xlsx` | Complete analytical workbook with all worksheets | Excel (.xlsx) |
| `oregon_real_estate_executive_presentation.pptx` | Stakeholder presentation with key findings | PowerPoint (.pptx) |
| `01_Oregon_Real_Estate_Valuation.md` | This documentation file | Markdown (.md) |

---

## 9. Key Insights & Market Intelligence

### Market Segmentation Findings

**By Property Type:**
- Single-family dominates volume (63.8% of listings)
- Farm properties command the highest valuations ($2.4M average)
- Multi-family offers the best cost-per-square-foot efficiency

**By Price Tier:**
- Entry-level townhomes: $490k–$520k
- Mid-market single family: $745k–$850k
- Premium multi-family: $2M+

**By Age Cohort:**
- 1940s–1960s: Highest arbitrage opportunity (oldest affordable homes)
- 2010s: Highest average asking price ($869k) – recent premium positioning
- 2020s: Newest construction, commanding $814k average despite limited supply

**By Amenity:**
- Garage presence increases valuation by 15–25% across cohorts
- 2-story premium over 1-story: 41.5% ($812k vs $574k)
- Multi-family unit density: 4.64 baths average (vs 2.28 for single-family)

---

## 10. Contact & Attribution

**Analyst:** Mafeng Daniel  
**Email:** mafengdaniel.analytics@gmail.com  
**Portfolio:** [github.com/MafengDaniel/Data-Analytics-Portfolio](https://github.com/MafengDaniel/Data-Analytics-Portfolio)  

---

## License

This project and all documentation are released under the MIT License. See the repository LICENSE file for full terms.
