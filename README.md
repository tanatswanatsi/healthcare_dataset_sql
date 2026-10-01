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
- `QUERY 1 for filtering data.sql` — [Most costly medical condition : Identified which medical conditions have the highest total billing amounts to understand which conditions drive the most cost for the healthcare system]
- `QUERY 2 for filtering data.sql` — [Most expensive condition per patient : Identified which conditions have the highest AVG cost per patient]
- `QUERY 3 for filtering data.sql` — [Top 5 most costly conditions to treat : I dentified the top 5 with which ones have the highest billing amount]

Each query has a matching result screenshot (`QUERY 1 table.jpeg`, `QUERY 2 table.jpeg`, `QUERY 3 table.jpeg`).

## Key Findings
- [Findings from QUERY 1 : Diabetes has the highest total billing overall of $ 215,08 Million.]
- [Finding from Query 2 :Obesity has the highest average billing per patient. ]
- [Finding from Query 3 : Most costly medical conditions in their order diabetes , arthritis , obesity , asthma and hypertension]

## Tools Used
MySQL Workbench
