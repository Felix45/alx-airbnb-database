
# Database Normalization to 3NF

This document explains the normalization process applied to the Airbnb project database schema to ensure it conforms to the Third Normal Form (3NF).

---

## First Normal Form (1NF)

- All tables have atomic columns (no repeating groups found).
- Each column contains unique, indivisible values.
- Example Fix: Ensured that no fields (e.g., `location`) store multiple values like "City, State, Country" in a single column.

---

## Second Normal Form (2NF)

- All non-key attributes are fully functionally dependent on the primary key.
- There are no partial dependencies.
- Example: Each column in `Booking`, such as `total_price`, depends on the full key (`booking_id`), not part of it.

---

## Third Normal Form (3NF)

- All non-key attributes are non-transitively dependent on the primary key.
- Removed transitive dependencies where applicable.

### Changes Made:
1. **User Table**:
    - Fixed ENUM definition:
      ```sql
      `role` ENUM('host', 'guest', 'admin') NOT NULL
      ```

2. **Property Table**:
    - Renamed `price pernight` to `price_per_night` for consistency.
    - Extracted `location` into a separate `Location` table to avoid repetition.

3. **Payment Table** (assumed details):
    - Extracted repeated payment method details into a `PaymentMethod` table:
      ```sql
      CREATE TABLE PaymentMethod (
          method_id BIGINT AUTO_INCREMENT PRIMARY KEY,
          method_name VARCHAR(100)
      );
      ```

    - Replaced method string in `Payment` with foreign key `method_id`.

---

By applying these normalization principles, the schema is now compliant with 3NF, ensuring data integrity and minimizing redundancy.
