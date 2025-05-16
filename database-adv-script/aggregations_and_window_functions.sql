SELECT u.user_id, u.first_name, u.last_name, u.email, COUNT(u.user_id) AS bookings 
FROM Users u INNER JOIN Booking b 
ON b.user_id = u.user_id 
GROUP BY u.user_id;


SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings, RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank 
FROM Property p LEFT JOIN Booking b 
ON p.property_id = b.property_id 
GROUP BY p.property_id, p.name 
ORDER BY booking_rank;
