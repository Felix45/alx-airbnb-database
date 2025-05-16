SELECT b.booking_id, l.payment_id, u.first_name, u.last_name, u.email, p.name 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Payment l ON l.booking_id = b.booking_id
INNER JOIN Property p ON p.property_id = b.property_id;