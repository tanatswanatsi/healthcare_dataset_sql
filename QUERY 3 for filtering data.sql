-- TOP 5  MOST COSTLY MEDICAL CONDITIONS TO TREAT OVERALL

SELECT `Medical Condition`,
       COUNT(*) AS number_of_patients,
       SUM(`Billing Amount`) AS total_billing
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY total_billing DESC
LIMIT 5;

