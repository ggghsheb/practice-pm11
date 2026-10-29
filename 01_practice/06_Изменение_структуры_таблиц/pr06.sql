ALTER TABLE product
ADD COLUMN description TEXT;

ALTER TABLE product
RENAME COLUMN name TO title;

ALTER TABLE product
DROP COLUMN description;

ALTER TABLE category
RENAME TO categories;

CREATE TABLE new_product (
    id INTEGER PRIMARY KEY,
    title TEXT,
    price TEXT,
    created TEXT DEFAULT (date('now'))
);

INSERT INTO new_product (id, title, price)
SELECT id, title, price
FROM product;

DROP TABLE product;

ALTER TABLE new_product
RENAME TO product;

CREATE TABLE new_product (
    id INTEGER PRIMARY KEY,
    title TEXT,
    price REAL CHECK (price > 0),
    created TEXT DEFAULT (date('now'))
);

INSERT INTO new_product (id, title, price, created)
SELECT id, title, price, created
FROM product;

DROP TABLE product;

ALTER TABLE new_product
RENAME TO product;

CREATE TABLE new_product (
    id INTEGER PRIMARY KEY,
    title TEXT,
    price REAL,
    created TEXT DEFAULT (date('now'))
);

INSERT INTO new_product (id, title, price, created)
SELECT id, title, CAST(price AS REAL), created
FROM product;

DROP TABLE product;

ALTER TABLE new_product
RENAME TO product;

INSERT INTO product (title, price)
VALUES ('Проверка', -10);
