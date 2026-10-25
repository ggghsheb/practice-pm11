BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "category" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"price"	REAL CHECK("price" > 0),
	"category_id"	INTEGER,
	"created"	TEXT DEFAULT (date('now')),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("category_id") REFERENCES "category"("id")
);
CREATE TABLE IF NOT EXISTS "product_supplier" (
	"product_id"	INTEGER,
	"supplier_id"	INTEGER,
	UNIQUE("product_id","supplier_id"),
	FOREIGN KEY("product_id") REFERENCES "product"("id"),
	FOREIGN KEY("supplier_id") REFERENCES "supplier"("id")
);
CREATE TABLE IF NOT EXISTS "supplier" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL,
	"phone"	TEXT UNIQUE,
	"email"	TEXT UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "category" VALUES (1,'Еда');
INSERT INTO "category" VALUES (2,'Быт');
INSERT INTO "product" VALUES (1,'Хлеб',40.0,1,'2026-10-25');
INSERT INTO "product" VALUES (2,'Мыло',80.0,2,'2026-10-25');
COMMIT;
