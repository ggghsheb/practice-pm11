CREATE TABLE tmp_product (
    name TEXT,
    price TEXT,
    category_id TEXT
);

INSERT INTO product (name, price, category_id)
SELECT
    TRIM(name),
    CAST(price AS REAL),
    CAST(category_id AS INTEGER)
FROM tmp_product;

SELECT * FROM product;

DROP TABLE tmp_product;

CREATE TABLE tmp_dirty (
    name TEXT,
    price TEXT,
    category_id TEXT
);

INSERT INTO product (name, price, category_id)
SELECT
    LOWER(TRIM(name)),
    CAST(price AS REAL),
    CAST(category_id AS INTEGER)
FROM dirty_products;

SELECT * FROM product;

SELECT * FROM tmp_product10;

SELECT COUNT(*) FROM tmp_product10;

SELECT * FROM tmp_dates;

UPDATE tmp_dates
SET date_text =
    SUBSTR(date_text, 7, 4) || '-' ||
    SUBSTR(date_text, 4, 2) || '-' ||
    SUBSTR(date_text, 1, 2);

SELECT * FROM tmp_dates;
