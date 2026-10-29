SELECT * FROM Houses;

SELECT number, area
FROM Apartments
WHERE area > 40;

SELECT service_name, unit
FROM Services
ORDER BY service_name;

SELECT *
FROM Charges
WHERE period = '2026-09';

SELECT *
FROM Payments
WHERE amount > 500
ORDER BY amount DESC;

SELECT COUNT(*) AS houses_count
FROM Houses;

SELECT SUM(amount) AS total_charges
FROM Charges
WHERE period = '2026-09';

SELECT h.address, COUNT(a.apartment_id) AS apartment_count
FROM Houses h
LEFT JOIN Apartments a ON h.house_id = a.house_id
GROUP BY h.house_id, h.address;

SELECT a.number, a.area, h.address
FROM Apartments a
JOIN Houses h ON a.house_id = h.house_id;

SELECT a.number, s.service_name, c.period, c.amount
FROM Charges c
JOIN Apartments a ON c.apartment_id = a.apartment_id
JOIN Services s ON c.service_id = s.service_id;

SELECT r.full_name, p.payment_date, p.amount
FROM Payments p
JOIN Charges c ON p.charge_id = c.charge_id
JOIN Residences rs ON c.apartment_id = rs.apartment_id
JOIN Residents r ON rs.resident_id = r.resident_id;

SELECT charge_id, apartment_id, amount
FROM Charges
WHERE amount > (
    SELECT AVG(amount)
    FROM Charges
);

SELECT a.number, h.address, c.period, c.amount
FROM Charges c
JOIN Apartments a ON c.apartment_id = a.apartment_id
JOIN Houses h ON a.house_id = h.house_id
WHERE c.amount > (
    SELECT COALESCE(SUM(p.amount), 0)
    FROM Payments p
    WHERE p.charge_id = c.charge_id
);

SELECT s.service_name, SUM(c.amount) AS total_amount
FROM Services s
JOIN Charges c ON s.service_id = c.service_id
GROUP BY s.service_id, s.service_name
HAVING SUM(c.amount) > 1000;