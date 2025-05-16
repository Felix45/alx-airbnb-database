SELECT b.booking_id, l.payment_id, u.first_name, u.last_name, u.email, p.name 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Payment l ON l.booking_id = b.booking_id
INNER JOIN Property p ON p.property_id = b.property_id;

EXPLAIN SELECT b.booking_id, l.payment_id, u.first_name, u.last_name, u.email, p.name 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Payment l ON l.booking_id = b.booking_id
INNER JOIN Property p ON p.property_id = b.property_id;

SELECT 
  b.booking_id, l.payment_id, 
  u.first_name, u.last_name, 
  u.email, p.name 
FROM 
  Booking b, Users u, Payment l, Property p
WHERE 
  b.user_id = u.user_id
  AND l.booking_id = b.booking_id
  AND p.property_id = b.property_id;

EXPLAIN ANALYZE SELECT 
  b.booking_id, l.payment_id, 
  u.first_name, u.last_name, 
  u.email, p.name 
FROM 
  Booking b, Users u, Payment l, Property p
WHERE 
  b.user_id = u.user_id
  AND l.booking_id = b.booking_id
  AND p.property_id = b.property_id;

