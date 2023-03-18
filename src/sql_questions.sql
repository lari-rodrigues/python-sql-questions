-- Query stores that sold the most bread products
WITH sales as(
    SELECT s.id, s.name, sa.date, SUM(quantity) qty
      FROM stores s
     INNER JOIN sales sa ON sa.store_id = s.id
     INNER JOIN products p ON sa.product_id = p.id
     WHERE p.name = "BREAD"
     GROUP BY s.id, s.name, sa.date
     ORDER BY qty DESC
)
SELECT TOP 1 s.id, s.name from sales;

-- Query stores and diff sales between one day and previous one
WITH sales as (
    SELECT s.id, 
           s.name, 
           sa.date, 
           SUM(quantity) qty
    FROM stores s
   INNER JOIN sales sa ON sa.store_id = s.id
   GROUP BY s.id, s.name, sa.date
),previous_day_comp as (
SELECT id, 
        name, 
        date, 
        qty, 
        LAG(qty, 1) OVER (PARTITION BY id ORDER BY date) previous_day_qty
   FROM sales
) 
SELECT id, 
       name, 
       date,
       qty, 
       previous_day_qty, 
       qty - previous_day_qty as diff
  FROM previous_day_comp;