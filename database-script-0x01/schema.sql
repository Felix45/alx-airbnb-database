CREATE TABLE `User`(
    `user_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `phone_number` VARCHAR(255) NOT NULL,
    `role` ENUM('host', 'guest', 'admin') NOT NULL,
    `created_at` TIMESTAMP NOT NULL
);

ALTER TABLE
    `User` ADD UNIQUE `user_email_unique`(`email`);

CREATE TABLE `Property`(
    `property_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `host_id` BIGINT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `location` BIGINT NOT NULL,
    `price_pernight` DECIMAL(8, 2) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL
);

ALTER TABLE
    `Property` ADD INDEX `property_host_id_index`(`host_id`);

ALTER TABLE
    `Property` ADD INDEX `property_location_index`(`location`);

CREATE TABLE `Booking`(
    `booking_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `property_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `total_price` DECIMAL(8, 2) NOT NULL,
    `status` ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE
    `Booking` ADD INDEX `booking_property_id_index`(`property_id`);

ALTER TABLE
    `Booking` ADD INDEX `booking_user_id_index`(`user_id`);

CREATE TABLE `Payment`(
    `payment_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `booking_id` BIGINT NOT NULL,
    `amount` DECIMAL(8, 2) NOT NULL,
    `payment_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `payment_method` ENUM('credit_card', 'paypal', 'stripe') NOT NULL
);

ALTER TABLE
    `Payment` ADD INDEX `payment_booking_id_index`(`booking_id`);

ALTER TABLE
    `Payment` ADD INDEX `payment_payment_method_index`(`payment_method`);

CREATE TABLE `Review`(
    `review_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `property_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL,
    `rating` BIGINT NOT NULL COMMENT 'rating >= 1 AND rating <= 5',
    `comment` TEXT NOT NULL,
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE
    `Review` ADD INDEX `review_property_id_index`(`property_id`);

ALTER TABLE
    `Review` ADD INDEX `review_user_id_index`(`user_id`);

CREATE TABLE `Message`(
    `message_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `sender_id` BIGINT NOT NULL,
    `recipient_id` BIGINT NOT NULL,
    `message_body` TEXT NOT NULL,
    `sent_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE
    `Message` ADD INDEX `message_sender_id_index`(`sender_id`);

ALTER TABLE
    `Message` ADD INDEX `message_recipient_id_index`(`recipient_id`);

CREATE TABLE `Location`(
    `location_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `city` VARCHAR(255) NOT NULL,
    `state` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL
);

CREATE TABLE `PaymentMethod`(
    `method_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `method_name` VARCHAR(255) NOT NULL
);

ALTER TABLE
    `Payment` ADD CONSTRAINT `payment_payment_method_foreign` FOREIGN KEY(`payment_method`) REFERENCES `PaymentMethod`(`method_id`);

ALTER TABLE
    `Review` ADD CONSTRAINT `review_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`user_id`);

ALTER TABLE
    `Booking` ADD CONSTRAINT `booking_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `User`(`user_id`);

ALTER TABLE
    `Booking` ADD CONSTRAINT `booking_property_id_foreign` FOREIGN KEY(`property_id`) REFERENCES `Property`(`property_id`);

ALTER TABLE
    `Message` ADD CONSTRAINT `message_sender_id_foreign` FOREIGN KEY(`sender_id`) REFERENCES `User`(`user_id`);

ALTER TABLE
    `Review` ADD CONSTRAINT `review_property_id_foreign` FOREIGN KEY(`property_id`) REFERENCES `Property`(`property_id`);

ALTER TABLE
    `Message` ADD CONSTRAINT `message_recipient_id_foreign` FOREIGN KEY(`recipient_id`) REFERENCES `User`(`user_id`);

ALTER TABLE
    `Payment` ADD CONSTRAINT `payment_booking_id_foreign` FOREIGN KEY(`booking_id`) REFERENCES `Booking`(`booking_id`);

ALTER TABLE
    `Property` ADD CONSTRAINT `property_host_id_foreign` FOREIGN KEY(`host_id`) REFERENCES `User`(`user_id`);

ALTER TABLE
    `Property` ADD CONSTRAINT `property_location_foreign` FOREIGN KEY(`location`) REFERENCES `Location`(`location_id`);