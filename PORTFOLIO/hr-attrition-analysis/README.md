# HR Employee Attrition Dashboard (Excel)

An end-to-end Excel analytics project analyzing employee attrition drivers and modeling the financial cost of turnover - built to demonstrate Power Query, PivotTables, PivotCharts, What-If Analysis (Goal Seek, Data Tables, Scenario Manage), and interactive dashboard design.

## Dataset

Source: [IBM HR Analytics Employee Attrition & Performance](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) (Kaggle)

- 1,470 employee records, 35 columns
- Fictional dataset created by IBM data scientists, but modeled with realistic, non-random relationships - unlike a prior project of mine using a synthetic marketing dataset, this data shows genuine, explainable correlations
- Removed constant/no-value columns (EmployeeCount, Over18, StandardHours)
- Decoded numeric satisfaction/education scales into readable labels via Power Query (e.g. JobSatisfaction 1-4 → Low/Medium/High/Very High)
- Added banded columns (Income_Band, Tenure_Band) for grouped analysis

## Tools & Skills

- **Power Query**:import, type correction, conditional column logic for decoding and banding
- **PivotTables**: single and nested multi-dimensional analysis across 7+ dimensions
- **PivotCharts**: linked, interactive visualizations with custom formatting
- **What-If Analysis**:
    - **Goal Seek** - solved for the attrition rate needed to hit a target cost
    - **Data Table** - sensitivity analysis showing cost across a range of attrition rates
    - **Scenario Manager** - saved and compared 3 named business scenarios
- **Slicers**: cross-filtering multiple PivotTables/charts simultaneously
- **Dashboard design**: KPI cards, callout insights, custom number formatting

## Key Findings

### 1. OverTime is the single strongest predictor of attrition Employees working overtime attrit at **31%**, roughly 3x the rate of those who don't (**10%**).

### 2. OverTime and low income compound rather than simply add 

This is the project's central finding. Breaking OverTime down by income level reveals:

| OverTime | Income Band | Attrition Rate |
|---|---|---|
| No | Low (<3K) | 17% |
| No | Very High (10K+) | 7% |
| **Yes** | **Low (<3K)** | **56%** |
| Yes | Very High (10K+) | 14% |

Low-income employees working overtime attrit at **56%** - nearly 4x the company average, and roughly 4x the rate of high-income overtime workers. This 114-person group represents under 8% of headcount but accounts for an estimated **~10% of total attrition cost**.

### 3. Cost modelling and scenario planning
Using a simple replacement-cost model (headcount × attrition rate × ~50% of annual salary):

- **Total estimated annual attrition cost (company-wide):** ~$9.25M
- **Cost attributable to the high-risk group alone:** ~$917K
- **Goal Seek:** reducing the high-risk group's attrition rate to 31% (from 56%) would cut their cost to $500K - an estimated **$417K/year in savings**
- **Scenario Manager** compared 3 states (Current 56%, Moderate Improvement 40%, Goal Seek Target 31%) to show cost impact at each intervention level

### 4. Further validation: Department vs. Job Level
Sales showed elevated attrition (21%) and entry-level employees showed elevated attrition (26%) as separate single-variable findings. Cross-tabulating the two confirmed these are **Independent effects, not overlapping signals** - Sales attrition remains meaningfully higher than R&D at every job level (e.g. 42% vs 23% at entry level, 15% vs 6% at senior level), ruling out the possibility that Sales' high attrition was simply an artifact of employing more junior staff.

## Dashboard Preview

![Dashboard Overview](image.png)

- **KPI Cards**: Total Employees, Overall Attrition Rate, Total Estimated Cost, High-Risk Group Cost, Goal Seek Target Savings
- **Charts**: Attrition by OverTime, Attrition by Income, OverTime × Job Satisfaction (nested), Cost Sensitivity by Attrition Rate
- **Slicers**: Department, OverTime, Income_Band - all cross-filter every chart

## Folder Structure

\```
hr-attrition-excel-analysis/
├── data/
│   └── raw_hr_attrition_data.csv
├── excel/
│   └── HR_Attrition_Dashboard.xlsx
├── screenshots/
│   ├── dashboard_overview.png
└── README.md
\```