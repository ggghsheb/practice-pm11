SELECT COUNT(*)
FROM product;

SELECT AVG(price)
FROM product;

SELECT category_id, COUNT(*)
FROM product
GROUP BY category_id;

SELECT category_id, SUM(price)
FROM product
GROUP BY category_id;

SELECT category_id, COUNT(*)
FROM product
GROUP BY category_id
HAVING COUNT(*) > 2;

SELECT MAX(price), MIN(price)
FROM product;

SELECT category_id, AVG(price)
FROM product
GROUP BY category_id
HAVING AVG(price) > 100;

SELECT id, name, price
FROM product
WHERE price > (
    SELECT AVG(price)
    FROM product
);

SELECT
    category_id,
    COUNT(*) AS total,
    AVG(price) AS average_price,
    MAX(price) AS max_price
FROM product
GROUP BY category_id
ORDER BY AVG(price) ASC;

SELECT COUNT(DISTINCT category_id)
FROM product;

SELECT name, COUNT(*)
FROM product
GROUP BY category_id;

SELECT category_id, COUNT(*)
FROM product
GROUP BY category_id
HAVING COUNT(*) > 1;
