-- 1. create a new tableas ( do not filter raw data)

CREATE TABLE healthcare_staging
LIKE healthcare_dataset;

-- 2. insert data to the new table

INSERT healthcare_staging
SELECT *
FROM healthcare_dataset;

-- verification that data was insert to new table

SELECT *
FROM healthcare_staging;

-- 3. check for duplicates in the table

SELECT Name , Age , Gender , 'Date of Admission' , Doctor , Hospital , COUNT(*)
FROM healthcare_staging
group by Name , Age , Gender , 'Date of Admission' , Doctor , Hospital
having count(*) > 1;

-- 4. remove duplicate (mysql does not delete directly from cte so a new table need to be created
 
 create table healthcare_staging_two as
 select * ,
 row_number() over (
 partition by name , age , gender , 'date_of_admission' , doctor , hospital 
 ) as row_num
 from healthcare_staging;
 
 -- remove safe mode to be able to delete rows
 
 set sql_safe_updates = 0;
 
 -- 5. delete duplicate rows
 
 delete from healthcare_staging_two
 where row_num > 1;
 
 -- check if rows still exist
 
 select *
 from healthcare_staging_two
 order by name asc ;
 
 -- 6. standardise names
 
 update healthcare_staging_two
 set name = CASE
  WHEN (LENGTH(name) - LENGTH(REPLACE(name, CHAR(32), ''))) = 1 THEN
    CONCAT(
      UPPER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), 1), 1, 1)),
      LOWER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), 1), 2)),
      CHAR(32),
      UPPER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), -1), 1, 1)),
      LOWER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), -1), 2))
    )
  WHEN (LENGTH(name) - LENGTH(REPLACE(name, CHAR(32), ''))) = 2 THEN
    CONCAT(
      UPPER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), 1), 1, 1)),
      LOWER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), 1), 2)),
      CHAR(32),
      UPPER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(name, CHAR(32), 2), CHAR(32), -1), 1, 1)),
      LOWER(SUBSTRING(SUBSTRING_INDEX(SUBSTRING_INDEX(name, CHAR(32), 2), CHAR(32), -1), 2)),
      CHAR(32),
      UPPER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), -1), 1, 1)),
      LOWER(SUBSTRING(SUBSTRING_INDEX(name, CHAR(32), -1), 2))
    )
  ELSE name
END;

-- check changes on the table

select *
from healthcare_staging_two;
 
 -- 7. make billing amount to the nearest two decimal place
 
 alter table healthcare_staging_two
 modify column `Billing Amount`decimal(10,2);
 
 -- check if changes are correct
 
 select *
 from healthcare_staging_two;
 
 -- 8. change column name
 
 alter table healthcare_staging_two
 rename column name to `Patient Name`;
 
 -- check if name has been changed
 select *
 from healthcare_staging_two;
 
 -- 9. delete row name row_num
 
 alter table healthcare_staging_two
 drop column row_num; 
 
 -- check if row is deleted
 
 select* 
 from healthcare_staging_two;
  
  -- 10. CHECK FOR DUPLICATES 
  
 select `Patient Name` , Gender , `Blood Type` , `Medical Condition` , `Date of Admission` , Doctor , Hospital , count( * ) as count
 from healthcare_staging_two
 group by `Patient Name` , Gender , `Blood Type` ,  `Medical Condition` , `Date of Admission` ,  Doctor  ,Hospital 
 having count( * ) > 1; 
 
 -- 11. create new table table to check for any remaining duplicates ( noted that some duplicates exist same same records but different age)
 
 CREATE TABLE healthcare_cleaned AS
 SELECT * ,
 ROW_NUMBER() OVER (
 PARTITION BY `Patient Name` , Gender , `Medical Condition` , `Date of Admission` , Doctor , Hospital
 ORDER BY Age ASC
 ) AS row_num 
 from healthcare_staging_two;
 
 -- open new table to see duplicates
 
 select * 
 from healthcare_cleaned;
 
 -- 12. delete duplicates
 
 delete from healthcare_cleaned
 where row_num > 1;
 
 set sql_safe_updates = 0; -- to remove safe updates
 
 select *
 from healthcare_cleaned;
 
-- 13. deleting column row_num

 alter table healthcare_cleaned
 drop column row_num;
 
 -- checking if column was deleted
 select * 
 from healthcare_cleaned;
 
 -- 14. drop excess tables not including the final table and original table/ table with raw data
 
 drop table healthcare_staging;
 
 drop table healthcare_staging_two;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 




