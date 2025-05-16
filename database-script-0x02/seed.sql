-- INSERTING USERS
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(1, 'Alice', 'Smith', 'alice1@example.com', 'hash1', '555-0001', 'host', '2021-01-01 10:00:00'),
(2, 'Bob', 'Jones', 'bob2@example.com', 'hash2', '555-0002', 'guest', '2021-01-02 11:00:00'),
(3, 'Charlie', 'Brown', 'charlie3@example.com', 'hash3', '555-0003', 'admin', '2021-01-03 12:00:00'),
(4, 'Zara', 'Knight', 'zara100@example.com', 'hash100', '555-0100', 'guest', '2021-04-10 09:00:00');

-- INSERTING LOCATIONS
INSERT INTO Location (location_id, city, state, country) VALUES
(1, 'New York', 'NY', 'USA'),
(2, 'Los Angeles', 'CA', 'USA'),
(3, 'Chicago', 'IL', 'USA'),
(4, 'Houston', 'TX', 'USA'),
(5, 'Phoenix', 'AZ'),
(6, 'Miami', 'FL', 'USA');

-- INSERTING PROPERTIES
INSERT INTO Property (property_id, host_id, name, description, location, price_pernight, created_at, updated_at) VALUES
(1, 1, 'Modern Loft', 1, 1, 120.00, '2022-01-01 12:00:00', '2022-01-05 14:00:00'),
(2, 5, 'Beach House', 2, 2, 300.00, '2022-01-02 15:00:00', '2022-01-06 16:00:00'),
(3, 3, 'Mountain Cabin', 3, 3, 200.00, '2022-01-03 18:00:00', '2022-01-07 19:00:00'),
(4, 4, 'Luxury Villa', 4, 4, 500.00, '2022-01-04 20:00:00', '2022-01-08 21:00:00'),
(5, 2, 'Downtown Apartment', 5, 5, 150.00, '2022-01-05 22:00:00', '2022-01-09 23:00:00');

-- INSERTING REVIEWS
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 2, 5, 'Amazing stay! Highly recommend.', '2022-02-01 10:00:00'),
(2, 2, 4, 4, 'Great view, a bit pricey.', '2022-02-02 11:00:00'),
(3, 3, 3, 3, 'Nice place but noisy at night.', '2022-02-03 12:00:00'),
(3, 5, 1, 4, 'Solid experience, would book again.', '2022-04-15 09:30:00');


INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(1, 2, 1, 'Hi, is your property available next weekend?', '2022-03-01 08:30:00'),
(2, 1, 2, 'Yes, it is! Feel free to book.', '2022-03-01 08:35:00'),
(3, 4, 3, 'Do you offer late check-out?', '2022-03-02 09:00:00'),
(4, 1, 4, 'Yes, until noon.', '2022-03-02 09:05:00'),
(5, 3, 2, 'Can you recommend a good restaurant nearby?', '2022-03-03 10:00:00'),
(6, 3, 1, 'Sure! Try the Italian place on Main St.', '2022-03-03 10:05:00');

-- INSERTING BOOKINGS
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(1, 5, 4, '2023-06-01', '2023-06-04', 450.00, 'confirmed', '2023-05-20 10:00:00'),
(2, 2, 3, '2023-07-10', '2023-07-12', 300.00, 'pending', '2023-06-25 14:30:00'),
(3, 3, 2, '2023-08-01', '2023-08-05', 600.00, 'canceled', '2023-07-10 09:45:00'),
(4, 5, 1, '2023-09-15', '2023-09-17', 250.00, 'confirmed', '2023-09-01 13:20:00'),
(5, 4, 4, '2023-10-01', '2023-10-04', 480.00, 'confirmed', '2023-09-15 10:15:00');
