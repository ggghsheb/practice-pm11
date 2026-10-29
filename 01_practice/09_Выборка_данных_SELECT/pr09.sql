SELECT * FROM product;

SELECT * FROM product
WHERE price > 100;

SELECT * FROM product
WHERE price BETWEEN 50 AND 200;

SELECT * FROM product
WHERE name LIKE 'Х%';

SELECT * FROM product
WHERE category_id IS NULL;

SELECT * FROM product
ORDER BY price DESC;

SELECT * FROM product
LIMIT 3;

SELECT * FROM product
WHERE CAST(price AS TEXT) LIKE '%0%';

SELECT * FROM product
WHERE name LIKE '%о%';

SELECT * FROM product
WHERE price > (
    SELECT AVG(price)
    FROM product
)
AND category_id IS NOT NULL
ORDER BY price DESC
LIMIT 5;

SELECT * FROM product
WHERE name LIKE 'М%'
ORDER BY price
LIMIT 2;

SELECT * FROM product
WHERE LOWER(name) LIKE 'м%';

SELECT * FROM product
WHERE price > 100 OR price < 50 AND category_id = 1;
