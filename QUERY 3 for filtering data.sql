-- TOP 2  MOST COSTLY MEDICAL CONDITIONS TO TREAT OVERALL

SELECT `Medical Condition`,
       COUNT(*) AS number_of_patients,
       SUM(`Billing Amount`) AS total_billing
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY total_billing DESC
LIMIT 5;

-- Most costly medical conditions in their order diabetes and arthritis. i also wanted to see what makes them more costly than the rest which is their billing total and number of patients. 

