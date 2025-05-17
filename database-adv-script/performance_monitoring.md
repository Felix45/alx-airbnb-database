## Database Performance Monitoring
Use `EXPLAIN ANALYZE` to monitor the performance of a few of your frequently used queries to identify bottlenecks and implement changes.

## Query 

```SQL
EXPLAIN SELECT b.booking_id, l.payment_id, u.first_name, u.last_name, u.email, p.name 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Payment l ON l.booking_id = b.booking_id
INNER JOIN Property p ON p.property_id = b.property_id;
```

## Bottlenecks
**Performance issues:**

| Issue           | What to Look For                                            | Fix                                              |
| --------------- | ----------------------------------------------------------- | ------------------------------------------------ |
| Full Table Scan | `Seq Scan` in PostgreSQL or high duration in `SHOW PROFILE` | Add indexes                                      |
| Expensive Joins | `Nested Loop` with large row counts                         | Use `Hash Join` via indexing or reduce data size |
| Missing Index   | On `JOIN` or `WHERE` columns                                | Create appropriate indexes                       |

### Optimize with Indexes

```SQL
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
```

### Check Performance
```SQL
EXPLAIN ANALYZE SELECT b.booking_id, l.payment_id, u.first_name, u.last_name, u.email, p.name 
FROM Booking b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Payment l ON l.booking_id = b.booking_id
INNER JOIN Property p ON p.property_id = b.property_id;
```

**Comparing current execution with the previous one**

- Query execution time before and after

- Whether sequential scans changed to index scans

- Whether joins are now more efficient (e.g., hash joins)

## Improvements
| Metric                 | Before Optimization | After Optimization     |
| ---------------------- | ------------------- | ---------------------- |
| Execution Time         | e.g., 120ms         | e.g., 3ms             |
| Join Strategy          | Nested Loop         | Hash Join / Index Join |
| Scans Used             | Seq Scan            | Index Scan             |
