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
	PRIMARY KEY("id")
);
INSERT INTO "category" VALUES (1,'Еда');
INSERT INTO "category" VALUES (2,'Быт');
INSERT INTO "category" VALUES (3,'Напитки');
INSERT INTO "product" VALUES (1,'Хлеб',40.0,1);
INSERT INTO "product" VALUES (2,'Мыло',80.0,2);
INSERT INTO "product" VALUES (3,'Молоко',60.0,1);
INSERT INTO "product" VALUES (4,'Сыр',200.0,NULL);
COMMIT;
