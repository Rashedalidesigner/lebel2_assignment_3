# ⚽ Football Ticket Booking System (SQL Database Project);


### Submission Links

ERD public :https://drive.google.com/file/d/1P45Hc0jZLYdV8bEhvJlfOcHhBvOmziVV/view?usp=sharing


github public : https://github.com/Rashedalidesigner/lebel2_assignment_3/

interview Video link :

## 📌 Overview

This project is a relational database system designed for managing a Football Ticket Booking System. It includes users, matches, and bookings with properly defined relationships using SQL.

The system demonstrates database design, relational integrity, and advanced SQL operations.

---

## 🎯 Objectives

- Design a complete relational database (ERD structure)
- Understand One-to-Many and Many-to-One relationships
- Apply Primary Key and Foreign Key constraints
- Write advanced SQL queries
- Handle NULL values and data validation
- Use JOINs, subqueries, and aggregations

---

## 🗄️ Database Schema

### 1️⃣ Users Table

Stores information about system users.

- user_id → Unique identifier (Primary Key)  
- full_name → Full name of user  
- email → Unique email address  
- role → Ticket Manager or Football Fan  
- phone_number → Contact number  

---

### 2️⃣ Matches Table

Stores football match details.

- match_id → Unique match ID (Primary Key)  
- fixture → Teams playing  
- tournament_category → League or tournament name  
- base_ticket_price → Starting ticket price  
- match_status → Availability status  

---

### 3️⃣ Bookings Table

Stores ticket booking transactions.

- booking_id → Unique booking ID (Primary Key)  
- user_id → References Users table (Foreign Key)  
- match_id → References Matches table (Foreign Key)  
- seat_number → Seat allocation (e.g., A-12)  
- payment_status → Payment state (Pending, Confirmed, Cancelled, Refunded)  
- total_cost → Final ticket cost  

---

## 🔗 Relationships

- One User → Many Bookings  
- One Match → Many Bookings  
- Each booking links one user with one match  

---

## 🧠 SQL Concepts Used

- CREATE DATABASE & TABLE  
- PRIMARY KEY & FOREIGN KEY  
- CHECK constraints  
- INSERT INTO operations  
- INNER JOIN and LEFT JOIN  
- Subqueries  
- GROUP BY and HAVING  
- COALESCE for NULL handling  
- ORDER BY, LIMIT, OFFSET  

---

## 📊 Example Queries

### 🔹 Filter Champions League Matches
```sql
SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';


🔹 Search Users by Name Pattern
SELECT user_id, full_name, email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';


🔹 Handle NULL Payment Status
SELECT booking_id, user_id, match_id,
COALESCE(payment_status, 'Action Required') AS payment_status
FROM bookings;


🔹 Join Users, Bookings, and Matches
SELECT b.booking_id, u.full_name, m.fixture, b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;


🔹 Above Average Bookings
SELECT *
FROM bookings
WHERE total_cost > (SELECT AVG(total_cost) FROM bookings);


🔹 Top 2 Expensive Matches (Skip Highest)
SELECT match_id, fixture, base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
OFFSET 1 LIMIT 2;


🎤 Viva Topics Covered
Foreign Key role and integrity
Primary Key constraints
WHERE vs HAVING difference
LEFT JOIN behavior
Subquery vs JOIN usage


🚀 Conclusion
This project demonstrates how a real-world football ticket booking system works using relational database design and SQL queries. It ensures data consistency, relationships, and efficient querying.