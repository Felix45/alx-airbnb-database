SELECT * FROM Booking b INNER JOIN Users u ON u.user_id = b.user_id;

SELECT * FROM Property p LEFT JOIN Review r ON p.property_id = r.property_id ORDER BY p.property_id;

SELECT * FROM Users u LEFT JOIN Booking b ON u.user_id = b.user_id
UNION
SELECT * FROM Users u RIGHT JOIN Booking b ON u.user_id = b.user_id;

SELECT * 
FROM Users u 
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;

SELECT * FROM Property p WHERE p.property_id IN ( SELECT property_id FROM Review GROUP BY property_id HAVING AVG(rating) >= 4.0);

SELECT * FROM Users u WHERE u.user_id IN (SELECT b.user_id FROM Booking b GROUP BY b.user_id HAVING COUNT(b.booking_id) > 3);