

-- Task 2
SELECT
    CAST(SUM(`Revenue_generated`)
    AS DECIMAL(8,2))Revenue
FROM supply_chain
;

-- Task 3
SELECT
      `Product_Type`, CAST(SUM(`Revenue_generated`)
      AS DECIMAL(8,2))Revenue
FROM supply_chain
GROUP BY `Product_Type`
ORDER BY Revenue
DESC;

-- Task 4
SELECT
      location,
      CAST(SUM(`Revenue_generated`)
      AS DECIMAL(8,2))Revenue
FROM supply_chain
GROUP BY location
ORDER BY Revenue
DESC;








;