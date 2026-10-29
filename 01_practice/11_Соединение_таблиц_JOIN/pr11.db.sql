BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "category" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER,
	"name"	TEXT,
	"price"	REAL CHECK("price" >= 0),
	"category_id"	INTEGER,
	"supplier_id"	INTEGER,
	PRIMARY KEY("id")
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
INSERT INTO "category" VALUES (3,'Напитки');
INSERT INTO "product" VALUES (1,'Хлеб',40.0,1,1);
INSERT INTO "product" VALUES (2,'Мыло',80.0,2,2);
INSERT INTO "product" VALUES (3,'Молоко',60.0,1,3);
INSERT INTO "product" VALUES (4,'Сыр',200.0,NULL,3);
INSERT INTO "supplier" VALUES (1,'Хлебозавод',NULL,NULL);
INSERT INTO "supplier" VALUES (2,'БытХим',NULL,NULL);
INSERT INTO "supplier" VALUES (3,'Молочный завод',NULL,NULL);
COMMIT;
