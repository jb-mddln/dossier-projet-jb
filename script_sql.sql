-- PostgreSQL pgAdmin4
CREATE DATABASE "bads_club" ENCODING "UTF8";

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE roles (
   role_id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE sports (
   sport_id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE sports_courts (
   court_id SERIAL PRIMARY KEY,
   name VARCHAR(50) NOT NULL UNIQUE,
   sport_id INTEGER NOT NULL,
   CONSTRAINT fk_sport FOREIGN KEY (sport_id) REFERENCES sports(sport_id)
);

CREATE TABLE days_of_week (
   day_id SERIAL PRIMARY KEY,
   day VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE practice_levels (
   practice_level_id SERIAL PRIMARY KEY,
   level VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE reservation_status (
   status_id SERIAL PRIMARY KEY,
   name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE sports_court_availabilities (
   sport_availability_id SERIAL PRIMARY KEY,
   start_time TIME NOT NULL,
   end_time TIME NOT NULL,
   day_id INTEGER NOT NULL,
   court_id INTEGER NOT NULL,
   CONSTRAINT fk_day FOREIGN KEY (day_id) REFERENCES days_of_week(day_id),
   CONSTRAINT fk_court FOREIGN KEY (court_id) REFERENCES sports_courts(court_id)
);

CREATE TABLE users (
   user_uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
   last_name VARCHAR(50) NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   email VARCHAR(100) NOT NULL UNIQUE,
   password VARCHAR(255) NOT NULL,
   membership_start DATE DEFAULT NULL,
   membership_end DATE DEFAULT NULL,
   created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   role_id INTEGER NOT NULL,
   CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

CREATE TABLE users_addresses (
   address_id SERIAL PRIMARY KEY,
   address VARCHAR(255) NOT NULL,
   city VARCHAR(255) NOT NULL,
   country VARCHAR(255) NOT NULL,
   zipcode VARCHAR(20) NOT NULL,
   user_uuid UUID NOT NULL,
   CONSTRAINT fk_user_address FOREIGN KEY(user_uuid) REFERENCES users(user_uuid)
);

CREATE TABLE users_availabilities (
   user_availability_id SERIAL PRIMARY KEY,
   start_time TIME NOT NULL,
   end_time TIME NOT NULL,
   user_uuid UUID NOT NULL,
   day_id INTEGER NOT NULL,
   CONSTRAINT fk_user_availability FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
   CONSTRAINT fk_day_availability FOREIGN KEY (day_id) REFERENCES days_of_week(day_id)
);

CREATE TABLE users_reservations (
   user_reservation_id SERIAL PRIMARY KEY,
   reservation_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   user_uuid UUID NOT NULL,
   court_id INTEGER NOT NULL,
   status_id INTEGER NOT NULL,
   CONSTRAINT fk_user_reservation FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
   CONSTRAINT fk_court_reservation FOREIGN KEY (court_id) REFERENCES sports_courts(court_id),
   CONSTRAINT fk_status_reservation FOREIGN KEY (status_id) REFERENCES reservation_status(status_id)
);

CREATE TABLE users_ratings (
   rated_by_user_id UUID NOT NULL,
   rated_user_id UUID NOT NULL,
   rating INTEGER NOT NULL,
   comment TEXT DEFAULT NULL,
   rating_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (rated_by_user_id, rated_user_id),
   CONSTRAINT fk_rated_by_user FOREIGN KEY (rated_by_user_id) REFERENCES users(user_uuid),
   CONSTRAINT fk_rated_user FOREIGN KEY (rated_user_id) REFERENCES users(user_uuid)
);

CREATE TABLE users_bans (
   banned_by_user_id UUID NOT NULL,
   banned_user_id UUID NOT NULL,
   reason TEXT DEFAULT NULL,
   banned_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (banned_by_user_id, banned_user_id),
   CONSTRAINT fk_banned_by_user FOREIGN KEY (banned_by_user_id) REFERENCES users(user_uuid),
   CONSTRAINT fk_banned_user FOREIGN KEY (banned_user_id) REFERENCES users(user_uuid)
);

CREATE TABLE users_sports (
   user_uuid UUID NOT NULL,
   sport_id INTEGER NOT NULL,
   practice_level_id INTEGER NOT NULL,
   PRIMARY KEY(user_uuid, sport_id, practice_level_id),
   CONSTRAINT fk_user_sport FOREIGN KEY(user_uuid) REFERENCES users(user_uuid),
   CONSTRAINT fk_sport_user FOREIGN KEY (sport_id) REFERENCES sports(sport_id),
   CONSTRAINT fk_practice_level_user FOREIGN KEY (practice_level_id) REFERENCES practice_levels(practice_level_id)
);
