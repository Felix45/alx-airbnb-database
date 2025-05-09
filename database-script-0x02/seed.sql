
-- Seed data for User
INSERT INTO User (first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('Alice', 'Johnson', 'alice@example.com', 'hash1', '1234567890', 'host', NOW()),
('Bob', 'Smith', 'bob@example.com', 'hash2', '0987654321', 'guest', NOW()),
('Carol', 'White', 'carol@example.com', 'hash3', '5555555555', 'admin', NOW());

-- Seed data for Location
INSERT INTO Location (city, state, country) VALUES
('Nairobi', 'Nairobi County', 'Kenya'),
('New York', 'NY', 'USA'),
('Paris', 'Île-de-France', 'France');

-- Seed data for Property
INSERT INTO Property (host_id, name, description, location_id, price_per_night, created_at, updated_at) VALUES
(1, 'Cozy Apartment', 'A small cozy apartment in the city center.', 1, 45.00, NOW(), NOW()),
(1, 'Luxury Villa', 'Spacious villa with a pool and sea view.', 2, 200.00, NOW(), NOW());

-- Seed data for Booking
INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(1, 2, '2025-06-01', '2025-06-05', 180.00, 'confirmed', NOW()),
(2, 2, '2025-07-10', '2025-07-15', 1000.00, 'pending', NOW());

-- Seed data for PaymentMethod
INSERT INTO PaymentMethod (method_name) VALUES
('Credit Card'),
('PayPal');

-- Seed data for Payment
INSERT INTO Payment (booking_id, method_id, amount, paid_at) VALUES
(1, 1, 180.00, NOW()),
(2, 2, 1000.00, NOW());

-- Seed data for Review
INSERT INTO Review (user_id, property_id, rating, comment, created_at) VALUES
(2, 1, 5, 'Amazing experience, would stay again!', NOW()),
(2, 2, 4, 'Very comfortable and clean.', NOW());

-- Seed data for Message
INSERT INTO Message (sender_id, recipient_id, message_body, sent_at) VALUES
(2, 1, 'Hi, I have a question about your listing.', NOW()),
(1, 2, 'Sure, feel free to ask!', NOW());
