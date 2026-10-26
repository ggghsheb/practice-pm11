BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "category" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "client" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "order_item" (
	"order_id"	INTEGER,
	"product_id"	INTEGER,
	"quantity"	INTEGER,
	PRIMARY KEY("order_id","product_id"),
	FOREIGN KEY("order_id") REFERENCES "orders_mn"("id"),
	FOREIGN KEY("product_id") REFERENCES "product_mn"("id")
);
CREATE TABLE IF NOT EXISTS "order_product" (
	"order_id"	INTEGER,
	"product_id"	INTEGER,
	"quantity"	INTEGER,
	FOREIGN KEY("order_id") REFERENCES "orders_mn"("id"),
	FOREIGN KEY("product_id") REFERENCES "product_mn"("id")
);
CREATE TABLE IF NOT EXISTS "orders" (
	"id"	INTEGER,
	"client_id"	INTEGER,
	"amount"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("client_id") REFERENCES "client"("id") ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "orders_mn" (
	"id"	INTEGER,
	"order_date"	TEXT,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"category_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "category"("id") ON DELETE SET NULL
);
CREATE TABLE IF NOT EXISTS "product_mn" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	PRIMARY KEY("id")
);
INSERT INTO "category" VALUES (2,'Напитки');
INSERT INTO "client" VALUES (1,'Иванов');
INSERT INTO "client" VALUES (2,'Петров');
INSERT INTO "order_item" VALUES (1,101,2);
INSERT INTO "order_item" VALUES (1,102,3);
INSERT INTO "order_item" VALUES (2,101,1);
INSERT INTO "order_product" VALUES (1,101,2);
INSERT INTO "order_product" VALUES (1,102,1);
INSERT INTO "order_product" VALUES (2,101,3);
INSERT INTO "orders" VALUES (1,1,100.0);
INSERT INTO "orders" VALUES (2,1,200.0);
INSERT INTO "orders" VALUES (3,2,150.0);
INSERT INTO "orders_mn" VALUES (1,'2026-10-20');
INSERT INTO "orders_mn" VALUES (2,'2026-10-21');
INSERT INTO "product" VALUES (1,'Пломбир',NULL);
INSERT INTO "product" VALUES (2,'Сок',2);
INSERT INTO "product_mn" VALUES (101,'Пломбир');
INSERT INTO "product_mn" VALUES (102,'Эскимо');
COMMIT;
