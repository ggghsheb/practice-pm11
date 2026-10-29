-- Индекс для поиска жильцов по записям о проживании
CREATE INDEX IF NOT EXISTS idx_residences_resident_id
ON Residences(resident_id);

-- Индекс для поиска платежей по начислениям
CREATE INDEX IF NOT EXISTS idx_payments_charge_id
ON Payments(charge_id);