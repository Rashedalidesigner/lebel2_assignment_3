Football Ticket Booking System (PostgreSQL Project)
📌 Project Overview

The Football Ticket Booking System is a relational database project designed using PostgreSQL. It manages users, football matches, and ticket bookings while demonstrating real-world database relationships and SQL query operations.

This project focuses on:

Database design (ERD concepts)
Primary Key & Foreign Key relationships
Data integrity using constraints
Advanced SQL queries (JOIN, Subquery, Aggregation, COALESCE, etc.)
🎯 Objectives
Design a normalized relational database
Implement 1-to-Many relationships between Users, Matches, and Bookings
Apply SQL constraints for data validation
Perform advanced SQL queries for real-world reporting
Demonstrate understanding of JOIN operations and subqueries
🗄️ Database Schema
1. Users Table

Stores information about football fans and ticket managers.

Field	Description
user_id	Unique ID for each user
full_name	Full name of user
email	Email address (unique)
role	User role (Ticket Manager / Football Fan)
phone_number	Contact number
2. Matches Table

Stores football match details.

Field	Description
match_id	Unique match ID
fixture	Teams playing (e.g., Real Madrid vs Barcelona)
tournament_category	League name
base_ticket_price	Starting ticket price
match_status	Availability status
3. Bookings Table

Stores ticket booking records.

Field	Description
booking_id	Unique booking ID
user_id	References Users table
match_id	References Matches table
seat_number	Assigned seat
payment_status	Payment state
total_cost	Final ticket price
🔗 Relationships
Users → Bookings (One-to-Many)
Matches → Bookings (One-to-Many)
Each booking connects one user with one match
🛠️ Technologies Used
PostgreSQL
SQL (DDL & DML)
Relational Database Design
📊 Key SQL Features Used

✔ CREATE DATABASE
✔ CREATE TABLE with constraints
✔ PRIMARY KEY & FOREIGN KEY
✔ CHECK constraints
✔ INSERT INTO (bulk data)
✔ INNER JOIN
✔ LEFT JOIN
✔ SUBQUERY
✔ COALESCE
✔ ILIKE (case-insensitive search)
✔ ORDER BY + LIMIT + OFFSET

📌 Example Queries
1. Champions League Available Matches
SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';
2. Search Users by Name Pattern
SELECT user_id, full_name, email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';
3. Handle NULL Payment Status
SELECT booking_id, user_id, match_id,
COALESCE(payment_status, 'Action Required') AS payment_status
FROM bookings;
4. Join Bookings with Users and Matches
SELECT
    b.booking_id,
    u.full_name,
    m.fixture,
    b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;
5. Users with Bookings (LEFT JOIN)
SELECT u.user_id, u.full_name, b.booking_id
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id;
6. Above Average Bookings
SELECT *
FROM bookings
WHERE total_cost > (
    SELECT AVG(total_cost) FROM bookings
);
7. Top Expensive Matches (Skip Highest)
SELECT *
FROM matches
ORDER BY base_ticket_price DESC
OFFSET 1
LIMIT 2;
🚀 Project Highlights
Real-world football ticket booking simulation
Strong relational database design
Practical SQL query implementation
Covers beginner to intermediate SQL concepts
📁 Project Structure
football-ticket-booking-system/
│
├── schema.sql
├── seed_data.sql
├── queries.sql
└── README.md
👨‍💻 Author

Rashed Ali
Database & Backend Development Practice Project

📌 Conclusion

This project demonstrates how a real-world ticket booking system can be built using relational database principles and SQL. It includes proper relationships, constraints, and analytical queries for reporting.
