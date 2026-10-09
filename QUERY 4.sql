-- insurance with th most number of patients and highest total billing 

SELECT `Insurance Provider`,
       COUNT(*) AS number_of_patients,
       SUM(`Billing Amount`) AS total_billing
FROM healthcare_cleaned
GROUP BY `Insurance Provider`
ORDER BY total_billing DESC;

-- Cigna has the most number of patients whilst medicare has the highest total billing

