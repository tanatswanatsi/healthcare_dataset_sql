-- WHICH CONDITIONS ARE EXPENSIVE PER PATIENT REGARDLESS  OF VOLUME AVG COST PER CONDITION

SELECT `Medical Condition`,
       AVG(`Billing Amount`) AS avg_billing_per_patient
FROM healthcare_cleaned
GROUP BY `Medical Condition`
ORDER BY avg_billing_per_patient DESC;

-- Findings: obesity has the highest average billing per patient.