CREATE INDEX IF NOT EXISTS idx_product_price ON product(price);

CREATE INDEX IF NOT EXISTS idx_product_name ON product(name);

CREATE INDEX IF NOT EXISTS idx_product_cat_price ON product(category_id, price);

EXPLAIN QUERY PLAN
SELECT * FROM product WHERE price > 100;

DROP INDEX IF EXISTS idx_product_name;

CREATE UNIQUE INDEX IF NOT EXISTS idx_product_name_unique ON product(name);

CREATE INDEX IF NOT EXISTS idx_product_name_category ON product(name, category_id);

SELECT * FROM product WHERE price > 100;

CREATE INDEX IF NOT EXISTS idx_product_name ON product(name);

SELECT * FROM product WHERE price > 100;

CREATE INDEX IF NOT EXISTS idx_product_lower_name ON product(LOWER(name));

EXPLAIN QUERY PLAN
SELECT * FROM product WHERE LOWER(name) = 'хлеб';

EXPLAIN QUERY PLAN
SELECT * FROM product WHERE price > 100;
