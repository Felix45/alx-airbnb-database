SELECT u.user_id, u.first_name, u.last_name, u.email, COUNT(u.user_id) AS bookings 
FROM Users u INNER JOIN Booking b 
ON b.user_id = u.user_id 
GROUP BY u.user_id;

SELECT 
    property_id, name, total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_row_number
FROM (
    SELECT p.property_id, p.name, COUNT(b.booking_id) AS total_bookings
    FROM Property p LEFT JOIN 
        Booking b ON p.property_id = b.property_id
    GROUP BY 
        p.property_id, p.name
) AS property_booking_counts
ORDER BY booking_rank;
