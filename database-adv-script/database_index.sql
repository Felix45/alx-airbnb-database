-- Property table
CREATE INDEX property_host_id_index ON Property (host_id);

-- Review table
CREATE INDEX review_property_id_index ON Review (property_id);
CREATE INDEX review_user_id_index ON Review (user_id);

-- Message table
CREATE INDEX message_sender_id_index ON Message (sender_id);
CREATE INDEX message_recipient_id_index ON Message (recipient_id);

-- Payment table
CREATE INDEX payment_booking_id_index ON Payment (booking_id);
CREATE INDEX payment_payment_method_index ON Payment (payment_method);

-- Booking table
CREATE INDEX booking_property_id_index ON Booking (property_id);
CREATE INDEX booking_user_id_index ON Booking (user_id);

EXPLAIN ANALYZE SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings, RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank 
FROM Property p 
LEFT JOIN Booking b ON p.property_id = b.property_id 
GROUP BY p.property_id, p.name 
ORDER BY booking_rank;

-- ALTER TABLE `Property` ADD INDEX `property_host_id_index` (`host_id`);

-- ALTER TABLE `Review` ADD INDEX `review_property_id_index` (`property_id`);
-- ALTER TABLE `Review` ADD INDEX `review_user_id_index` (`user_id`);

-- ALTER TABLE `Message` ADD INDEX `message_sender_id_index` (`sender_id`);
-- ALTER TABLE `Message` ADD INDEX `message_recipient_id_index` (`recipient_id`);

-- ALTER TABLE `Payment` ADD INDEX `payment_booking_id_index` (`booking_id`);
-- ALTER TABLE `Payment` ADD INDEX `payment_payment_method_index` (`payment_method`);

-- ALTER TABLE `Booking` ADD INDEX `booking_property_id_index` (`property_id`);
-- ALTER TABLE `Booking` ADD INDEX `booking_user_id_index` (`user_id`);