# Marketing Campaign Performance Dashboard (Excel)

An end-to-end Excel analytics project analyzing marketing campaign performance across channels, campaign types, customer segments, and time - built to demonstrate Power Query, PivotTables, PivotCharts, and interactive dashboard design

## Dataset

Source: [Marketing Campaign Performance Dataset](https://www.kaggle.com/datasets/manishabhatt22/marketing-campaign-performance-dataset)
(Kaggle, by Manisha Bhatt)

- Original size: ~200,000 rows
- Filtered down to ~50,000 rows (Jan-Apr 2021) using Power Query to keep the file responsive and easy to review manually
- Key Columns: Campaign_Type, Channel_Used, Customer_Segment, Target_Audience, Location, Conversion_Rate, Acquisition_Cost, ROI, Impressions, Clicks, Engagement_Score, Date

## Tools & Skills

- **Power Query**: importing, type conversion, date filtering
- **Formulas**: CTR, estimated conversions, cost-per-conversion (With IFERROR handling)
- **PivotTables**: multi-dimensional aggregation (Sum, Average) across 5+ dimensions
- **PivotCharts**: linked, interactive visualizations
- **Slicers & Timeline**: cross-filtering multiple PivotTables/charts simultaneously
- **Dashboard design**: KPI cards, custom number formatting, clean layout

## Key Finding: Data Validation Before Insight

Before building a "Which channel/segment performs best" narrative, I systematically tested ROI and Conversion Rate across five dimensions:

| Dimension | ROI Range | Conversion Rate Range |
|---|---|---|
| Campaign Type | 4.99 - 5.01 | 7.97% - 8.05% |
| Channel Used | 4.98 - 5.03 | 8.00% - 8.03% |
| Customer Segment | 4.98 - 5.02 | 8.00% - 8.03% |
| Location | 4.97 - 5.02 | 7.96% - 8.06% |
| Month (Jan-Mar) | 4.98 - 5.01 | 8.00% - 8.02% |

**All five dimensions showed essentially flat performance metrics** - meaning this dataset does not encode realistic behavioral differences between channels, segments, or time periods (likely random-noise generation around a fixed average).

Rather than force a misleading "Channel X wins" story onto data that doesn't support it, I shifted the dashboard's focus to **volume and spend distribution** - where real variance does exist (e.g. Acquisition Cost per channel ranges meaningfully, even though ROI doesn't).

## Dashboard Preview

![Dashboard Overview](image-1.png)

- **KPI Cards**: Total Impressions, Total Clicks, Total Acquisition Cost, Baseline Avg ROI
- **Volume Chart**: Impressions & Clicks by Channel
- **Spend Chart**: Average Acquisition Cost by Channel
- **Trend Chart**: Monthly Impressions & Clicks (Jan-Apr 2021; April reflects a partial month, hence the volume dip)
- **Slicers**: Channel_Used, Customer_Segment, and a Date Timeline - all cross-filter every chart simulataneously

## Folder Structure

\```
marketing-campaign-excel-analysis/
├── data/
│   └── raw_marketing_campaign_dataset.csv
├── excel/
│   └── filtered_marketing_campaign_performance.xlsx
├── screenshots/
│   ├── dashboard_filtered_example.png
│   └── dashboard_overview.png
└── README.md
\```