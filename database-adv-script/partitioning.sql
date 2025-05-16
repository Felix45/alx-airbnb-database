ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create the new partitioned Booking table
CREATE TABLE Booking (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example: yearly partitions)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: (Optional) Create default partition for outliers
CREATE TABLE Booking_default PARTITION OF Booking
    DEFAULT;

-- Step 5: Copy data from old table into new partitioned table
INSERT INTO Booking (id, user_id, property_id, start_date, end_date, status, created_at, updated_at)
SELECT id, user_id, property_id, start_date, end_date, status, created_at, updated_at
FROM Booking_old;

-- Step 7: Add indexes to partitions if needed
CREATE INDEX idx_booking_2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking_2023_property_id ON Booking_2023(property_id);

CREATE INDEX idx_booking_2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking_2024_property_id ON Booking_2024(property_id);

CREATE INDEX idx_booking_2025_user_id ON Booking_2025(user_id);
CREATE INDEX idx_booking_2025_property_id ON Booking_2025(property_id);
