# healthcare_dataset_sql
SQL project cleaning and analyzing a real-world healthcare dataset covering patient admissions , billing and medical conditions using MySQL.


## Dataset
- `healthcare_dataset_rawdata.csv` — original, unprocessed dataset
- `healthcare_dataset_cleaned.csv` — final cleaned dataset after processing
- Fields: name, age, gender, blood type, medical condition, date of admission, doctor, hospital, insurance provider, billing amount, room number, admission type, discharge date, medication, test results
  
## Process

### 1. Data Cleaning (`QUERY for cleaning healthcare_data.sql`)
- Removed duplicate records
- Standardized name formatting (title case)
- Converted billing amount to DECIMAL(10,2)
- Fixed date formatting
- Handled missing/blank values

### 2. Exploratory Analysis
GOAL : To identify which medical conditions place the greatest financial burden on the healthcare system/ insurance companies , helping decision makers understand where additional funding , resources , or cost control may be needed most.
-
- QUERY 1 for filtering data.sql` — [Most costly medical condition : Identified which medical conditions have the highest total billing amounts to understand which conditions drive the most cost for the healthcare system.]
- `QUERY 2 for filtering data.sql` — [Most expensive condition per patient : Identified which conditions have the highest AVG cost per patient]
- `QUERY 3 for filtering data.sql` — [Top 2 most costly conditions to treat : Identified the top 2 with which ones have the highest billing amount]

Each query has a matching result screenshot (`QUERY 1 table.jpeg`, `QUERY 2 table.jpeg`, `QUERY 3 table.jpeg`).

## Recommendations
- **Target cost-control efforts on high-spend conditions:** Since [Cancer/whichever condition had the highest total billing] accounted for the largest share of total billing, hospitals and insurers should prioritize care management programs for this condition to control costs without compromising care quality.
- **Review payer contracts with the most-used insurance provider:** Since [top insurance provider] both has the most patients and the highest total billing, this payer relationship should be reviewed regularly to ensure billing terms remain favorable as volume grows.
- **Investigate hospital-level efficiency variance:** Hospitals with notably longer average length of stay for the same condition should be reviewed for potential inefficiencies in discharge planning or treatment protocols.
- **Standardize data entry practices:** The presence of duplicate records and inconsistent formatting (casing, spacing) in the raw data suggests a need for stronger data validation at the point of entry to reduce downstream cleaning effort.

## Key Findings
- [Findings from QUERY 1 : Diabetes has the highest total billing overall of $ 215,08 Million.]
- [Finding from Query 2 :Obesity has the highest average billing per patient. ]
- [Finding from Query 3 : Most costly medical conditions in their order diabetes and arthritis as they have high billing totals and more number of patients.]

## Tools Used
MySQL Workbench
