-- create database

create database football_ticket_booking_system;

create table if not exists users(
  user_id int primary key,
  full_name varchar(50) not null,
  email varchar(100) unique not null,
  role varchar(30) not null check( role in('Ticket Manager', 'Football Fan')) ,
  phone_number varchar(15)
);

create table if not exists matches(
  match_id int primary key,
  fixture varchar(150) not null,
  tournament_category varchar(150) not null,
  base_ticket_price decimal(10,2) check(base_ticket_price >= 10) not null,
  match_status varchar(30) check(match_status in('Available', 'Selling Fast', 'Sold Out', 'Postponed')) not null
);

create table if not exists bookings(
  booking_id int primary key,
  user_id int references users(user_id) not null,
  match_id int references matches(match_id) not null,
  seat_number varchar(30) not null,
  payment_status varchar(30) check(payment_status in('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
  total_cost decimal(10,2) check(total_cost >= 0)
);