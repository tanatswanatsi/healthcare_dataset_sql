-- WHICH CONDITIONS COST THE HEALTH SYSTEM THE MOST OVERALL

SELECT `Medical Condition`,
       COUNT(*) AS number_of_patients,
       SUM(`Billing Amount`) AS total_billing,
       AVG(`Billing Amount`) AS avg_billing_per_patient
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY total_billing DESC; 

-- Findings: Diabetes has the highest total billing overall of $ 215,08 Million.
-- It is driven by being the second highest patient volume and third highest avarage billing per patient.