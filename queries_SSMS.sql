
-- 1. Average price for each rating
SELECT rating, ROUND(AVG(price), 2) AS avg_price
FROM books
GROUP BY rating
ORDER BY rating;

-- 2. The 5 most expensive books rated 4 or 5
SELECT TOP 5 title, price, rating
FROM books
WHERE rating >= 4
ORDER BY price DESC;

-- 3. Out-of-stock books per rating
SELECT rating,
       SUM(CASE WHEN in_stock = 'FALSE' THEN 1 ELSE 0 END) AS out_of_stock
FROM books
GROUP BY rating
ORDER BY rating;