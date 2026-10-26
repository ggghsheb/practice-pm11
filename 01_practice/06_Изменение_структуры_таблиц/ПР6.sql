BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categories" (
	"id"	INTEGER,
	"name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER,
	"title"	TEXT,
	"price"	REAL CHECK("price" > 0),
	"created"	TEXT DEFAULT (date('now')),
	PRIMARY KEY("id")
);
INSERT INTO "categories" VALUES (1,'Еда');
INSERT INTO "categories" VALUES (2,'Быт');
INSERT INTO "product" VALUES (1,'Хлеб',40.0,'2026-10-26');
INSERT INTO "product" VALUES (2,'Мыло',80.0,'2026-10-26');
COMMIT;
