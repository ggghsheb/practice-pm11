DROP TABLE IF EXISTS product;

CREATE TABLE product (
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    price REAL CHECK (price >= 0) DEFAULT 0,
    category_id INTEGER,
    discount REAL DEFAULT 0
);

INSERT INTO product (id, name, price, category_id, discount)
VALUES
    (1, 'Хлеб', 40.0, 1, 0),
    (2, 'Мыло', 80.0, 2, 0),
    (3, 'Молоко', 60.0, 1, 0),
    (4, 'Сыр', 200.0, NULL, 0);

SELECT name,
       CASE
           WHEN price > 100 THEN 'дорого'
           ELSE 'дёшево'
       END AS price_category
FROM product;

SELECT name, COALESCE(category_id, 0) AS cat
FROM product;

SELECT name, 1000 / NULLIF(price, 0) AS ratio
FROM product;

SELECT name, price,
       CASE
           WHEN price < 50 THEN 'дёшево'
           WHEN price <= 100 THEN 'средне'
           ELSE 'дорого'
       END AS price_category
FROM product;

SELECT name,
       COALESCE(price, 0) + COALESCE(discount, 0) AS total
FROM product;

SELECT *
FROM product
ORDER BY CASE
    WHEN price > 100 THEN 1
    WHEN price >= 50 THEN 2
    ELSE 3
END;

SELECT name,
       CASE WHEN price > 100 THEN 'дорого' END
FROM product;

SELECT COALESCE(NULL, NULL, 5);

UPDATE product
SET price = CASE
    WHEN price < 0 THEN 0
    ELSE price
END;
