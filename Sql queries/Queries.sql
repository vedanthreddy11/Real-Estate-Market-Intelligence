#1. AVERAGE  PRICE  BY  PROPERTY  TYPE AND  YEAR BUILT ?
select Property_Type,year_built,avg(price) as Avg_price
from book1
group by property_type,Year_Built;


#2.TOP  5  MOST  EXPENSIVE  PROPERTIES  BY  LOCATION ?
select property_type,location,price from book1
order by price desc
limit 5;


#3.MOST  EXPENSIVE  PROPERTY  IN  EACH  LOCATION ?
SELECT property_type, location, year_built, price
FROM (SELECT *,ROW_NUMBER() OVER (PARTITION BY location ORDER BY price DESC) AS rn
    FROM book1) as b
WHERE rn = 1;


#4.YEARLY  TREND  OF  AVERAGE  PRICES ?
SELECT year_built, AVG(price) AS avg_price
FROM book1
GROUP BY Year_Built
ORDER BY Year_Built asc;


#5.DISTRIBUTION  OF  PROPERTIES  BY  BUILY  YEAR  RANGE
SELECT 
  CASE 
    WHEN Year_Built < 1980 THEN 'Before 1980'
    ELSE 'After 2000'
    END AS year_group,
    COUNT(*) AS total_properties
 FROM book1
GROUP BY year_group
ORDER BY year_group asc ;


#6.AVERAGE  PRICE  BY  SQUARE FEET  BY  LOCATION ?
SELECT location, AVG(price/square_feet) AS avg_price_per_sqft
FROM book1
GROUP BY location
order by avg_price_per_sqft desc ;


#7.TOP  10  PROPWRTIES  WITH  AVG  PRICE COST ?
SELECT property_type, location, price, square_feet, 
avg(price/square_feet) AS price_per_sqft
FROM book1
group by property_type, location, price, square_feet
ORDER BY price_per_sqft DESC
LIMIT 10;







