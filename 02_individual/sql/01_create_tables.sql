BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS Apartments (
    apartment_id INTEGER PRIMARY KEY,
    house_id INTEGER NOT NULL,
    number TEXT NOT NULL,
    area REAL NOT NULL CHECK (area > 0),
    FOREIGN KEY (house_id) REFERENCES Houses(house_id),
    UNIQUE (house_id, number)
);
CREATE TABLE IF NOT EXISTS Charges (
    charge_id INTEGER PRIMARY KEY,
    apartment_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    period TEXT NOT NULL,
    amount REAL NOT NULL CHECK (amount >= 0),
    FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    UNIQUE (apartment_id, service_id, period)
);
CREATE TABLE IF NOT EXISTS Houses (
    house_id INTEGER PRIMARY KEY,
    address TEXT NOT NULL UNIQUE,
    floors INTEGER NOT NULL CHECK (floors > 0)
);
CREATE TABLE IF NOT EXISTS Payments (
    payment_id INTEGER PRIMARY KEY,
    charge_id INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    amount REAL NOT NULL CHECK (amount > 0),
    FOREIGN KEY (charge_id) REFERENCES Charges(charge_id)
);
CREATE TABLE IF NOT EXISTS "PaymentsS" (
	"payment_id"	INTEGER,
	"charge_id"	INTEGER,
	"payment_date"	TEXT,
	"amount"	INTEGER
);
CREATE TABLE IF NOT EXISTS Residences (
    residence_id INTEGER PRIMARY KEY,
    resident_id INTEGER NOT NULL,
    apartment_id INTEGER NOT NULL,
    move_in_date TEXT NOT NULL,
    FOREIGN KEY (resident_id) REFERENCES Residents(resident_id),
    FOREIGN KEY (apartment_id) REFERENCES Apartments(apartment_id)
);
CREATE TABLE IF NOT EXISTS Residents (
    resident_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    phone TEXT
);
CREATE TABLE IF NOT EXISTS Services (
    service_id INTEGER PRIMARY KEY,
    service_name TEXT NOT NULL UNIQUE,
    unit TEXT NOT NULL
);
INSERT INTO "Apartments" VALUES (1,1,'12',45.5);
INSERT INTO "Apartments" VALUES (2,1,'15',52.0);
INSERT INTO "Apartments" VALUES (3,1,'21',38.7);
INSERT INTO "Apartments" VALUES (4,2,'8',38.2);
INSERT INTO "Apartments" VALUES (5,2,'14',61.3);
INSERT INTO "Apartments" VALUES (6,3,'34',74.8);
INSERT INTO "Apartments" VALUES (7,3,'41',56.4);
INSERT INTO "Charges" VALUES (1,1,1,'2026-09',500.0);
INSERT INTO "Charges" VALUES (2,1,2,'2026-09',1200.0);
INSERT INTO "Charges" VALUES (3,1,3,'2026-09',650.0);
INSERT INTO "Charges" VALUES (4,2,1,'2026-09',450.0);
INSERT INTO "Charges" VALUES (5,2,4,'2026-09',720.0);
INSERT INTO "Charges" VALUES (6,3,3,'2026-09',550.0);
INSERT INTO "Charges" VALUES (7,4,1,'2026-09',400.0);
INSERT INTO "Charges" VALUES (8,4,2,'2026-09',980.0);
INSERT INTO "Charges" VALUES (9,5,3,'2026-09',800.0);
INSERT INTO "Charges" VALUES (10,6,4,'2026-09',1100.0);
INSERT INTO "Charges" VALUES (11,6,5,'2026-09',350.0);
INSERT INTO "Charges" VALUES (12,7,1,'2026-09',600.0);
INSERT INTO "Charges" VALUES (13,7,2,'2026-09',1450.0);
INSERT INTO "Charges" VALUES (14,2,3,'2026-08',650.0);
INSERT INTO "Houses" VALUES (1,'ул. Лесная, 10',9);
INSERT INTO "Houses" VALUES (2,'ул. Садовая, 5',5);
INSERT INTO "Houses" VALUES (3,'ул. Центральная, 20',12);
INSERT INTO "PaymentsS" VALUES (1,1,'2026-09-10',500);
INSERT INTO "PaymentsS" VALUES (2,2,'2026-09-15',600);
INSERT INTO "PaymentsS" VALUES (3,3,'2026-09-12',650);
INSERT INTO "PaymentsS" VALUES (4,4,'2026-09-18',450);
INSERT INTO "PaymentsS" VALUES (5,5,'2026-09-20',720);
INSERT INTO "PaymentsS" VALUES (6,7,'2026-09-22',200);
INSERT INTO "PaymentsS" VALUES (7,8,'2026-09-25',980);
INSERT INTO "PaymentsS" VALUES (8,9,'2026-09-27',800);
INSERT INTO "PaymentsS" VALUES (9,10,'2026-09-28',1100);
INSERT INTO "PaymentsS" VALUES (10,12,'2026-09-29',300);
INSERT INTO "PaymentsS" VALUES (11,13,'2026-09-30',500);
INSERT INTO "PaymentsS" VALUES (12,14,'2026-08-15',650);
INSERT INTO "Residences" VALUES (1,1,1,'2023-04-15');
INSERT INTO "Residences" VALUES (2,2,2,'2022-09-01');
INSERT INTO "Residences" VALUES (3,3,3,'2024-01-10');
INSERT INTO "Residences" VALUES (4,4,4,'2021-06-20');
INSERT INTO "Residences" VALUES (5,5,5,'2020-11-05');
INSERT INTO "Residences" VALUES (6,6,6,'2023-08-12');
INSERT INTO "Residents" VALUES (1,'Иванов Иван Иванович','9001112233');
INSERT INTO "Residents" VALUES (2,'Петрова Анна Сергеевна','9002223344');
INSERT INTO "Residents" VALUES (3,'Сидоров Павел Олегович','9003334455');
INSERT INTO "Residents" VALUES (4,'Кузнецова Мария Андреевна','9004445566');
INSERT INTO "Residents" VALUES (5,'Смирнов Алексей Викторович','9005556677');
INSERT INTO "Residents" VALUES (6,'Орлова Елена Дмитриевна','9006667788');
INSERT INTO "Services" VALUES (1,'Холодная вода','м3');
INSERT INTO "Services" VALUES (2,'Отопление','м2');
INSERT INTO "Services" VALUES (3,'Содержание жилья','м2');
INSERT INTO "Services" VALUES (4,'Электроэнергия','кВт*ч');
INSERT INTO "Services" VALUES (5,'Вывоз мусора','чел.');
COMMIT;
