# Data Analytics Portfolio — Repository Architecture

## Recommended Folder Structure

```
Data-Analytics-Portfolio/
├── README.md                          # Main portfolio landing page
├── PORTFOLIO_STRUCTURE.md             # This file
├── LICENSE
├── .gitignore
│
├── projects/                          # All active projects
│   ├── project-01-customer-churn/
│   │   ├── README.md                  # Project-specific documentation
│   │   ├── data/
│   │   │   ├── raw/                   # Original data sources
│   │   │   └── processed/             # Cleaned/transformed data
│   │   ├── notebooks/
│   │   │   └── analysis.ipynb
│   │   ├── scripts/
│   │   │   ├── data_cleaning.py
│   │   │   └── analysis_functions.py
│   │   ├── visualizations/            # Final dashboards, charts (PNG/HTML)
│   │   ├── reports/                   # Executive summaries, findings
│   │   └── requirements.txt
│   │
│   ├── project-02-revenue-forecasting/
│   │   └── [Same structure as above]
│   │
│   └── project-03-market-analysis/
│       └── [Same structure as above]
│
├── assets/                            # Shared portfolio assets
│   ├── images/                        # Portfolio header, badges, diagrams
│   ├── templates/                     # Reusable templates and examples
│   └── data/                          # Public datasets for reference
│
├── archive/                           # Previous or practice projects (optional)
│   └── [Older projects for reference]
│
└── docs/                              # Optional: supplementary documentation
    ├── CONTRIBUTING.md
    └── METHODOLOGY.md
```

## Naming Conventions

**Repositories:**
- Use descriptive, hyphen-separated lowercase names
- Example: `project-01-customer-churn`, not `Project1` or `proj_churn`

**Files:**
- Python scripts: `snake_case.py`
- Notebooks: `YYYY-MM-DD_descriptive_name.ipynb`
- Data files: `raw_data_[source].csv` or `processed_[version].parquet`

**Branches:**
- `main` — production-ready portfolio content
- `dev` — active development
- Feature branches: `feature/add-dashboard`, `fix/data-quality`

## Key Guidelines

### What Belongs Where

**Root README.md**
- High-level portfolio narrative
- Featured projects (3–5)
- Skills summary
- Professional presence links

**Project-Level README.md**
- Detailed project documentation
- Methodology and approach
- How to reproduce results
- Technical deep-dive

**Data Folder Structure**
- `raw/` — Never modified, single source of truth
- `processed/` — All transformations documented with version numbers
- Use `.gitignore` to exclude large files (>100MB) or sensitive data

**Visualizations & Reports**
- Export final dashboards as `.png`, `.pdf`, or interactive `.html`
- Always include alt-text descriptions for accessibility
- Store in `visualizations/` or project-specific folder

### .gitignore Best Practices

```
# Data (store separately or use Git LFS for large files)
*.csv
*.xlsx
*.parquet
data/raw/
data/processed/

# Jupyter & IDEs
*.ipynb_checkpoints
.DS_Store
.vscode/
.idea/

# Python
__pycache__/
*.pyc
venv/
env/

# Secrets
.env
secrets.yaml

# Large files (unless using Git LFS)
*.pkl
*.h5
```

### README Quality Checklist

- [ ] Business problem stated in first paragraph
- [ ] Data source and size clearly documented
- [ ] Methodology visual or step-by-step walkthrough
- [ ] 2–3 key insights highlighted with evidence
- [ ] All visualizations have titles and axis labels
- [ ] Technical stack listed with versions
- [ ] Reproduction steps are complete and tested
- [ ] Limitations acknowledged honestly
- [ ] Next steps or recommendations included

## Pinning Strategy

Pin your **3 strongest projects** to your main portfolio repository:
1. Highest business impact or clearest storytelling
2. Most technically sophisticated
3. Best-executed analysis with polished visualizations

Order them by relevance to your target role (e.g., if targeting a product analytics role, pin your product analysis project first).

## Repository Naming Examples

✅ **Good:**
- `Data-Analytics-Portfolio` (main)
- `customer-churn-analysis`
- `revenue-forecasting-model`
- `market-segmentation-study`

❌ **Avoid:**
- `Data-Project`
- `Analysis-1`
- `project_ABC`
- `Portfolio-FINAL`
