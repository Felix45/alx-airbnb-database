SELECT * FROM Property p 
WHERE p.property_id IN ( SELECT property_id FROM Review GROUP BY property_id HAVING AVG(rating) >= 4.0);

SELECT * FROM Users u 
WHERE u.user_id IN (SELECT b.user_id FROM Booking b GROUP BY b.user_id HAVING COUNT(b.booking_id) > 3);