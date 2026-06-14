-- create database

create database football_ticket_booking_system;

-- create users table
create table if not exists users(
  user_id int primary key,
  full_name varchar(50) not null,
  email varchar(100) unique not null,
  role varchar(30) not null check( role in('Ticket Manager', 'Football Fan')) ,
  phone_number varchar(15)
);


-- create matches table
create table if not exists matches(
  match_id int primary key,
  fixture varchar(150) not null,
  tournament_category varchar(150) not null,
  base_ticket_price decimal(10,2) check(base_ticket_price >= 10) not null,
  match_status varchar(30) check(match_status in('Available', 'Selling Fast', 'Sold Out', 'Postponed')) not null
);


-- create bookings table
create table if not exists bookings(
  booking_id int primary key,
  user_id int references users(user_id) not null,
  match_id int references matches(match_id) not null,
  seat_number varchar(30) not null,
  payment_status varchar(30) check(payment_status in('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
  total_cost decimal(10,2) check(total_cost >= 0)
);



-- insert data
INSERT INTO users (
  user_id,
  full_name,
  email,
  role,
  phone_number
) VALUES (1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL),
(5, 'Nusrat Jahan', 'nusrat@mail.com', 'Football Fan', '+8801744444444'),
(6, 'Rakib Hasan', 'rakib@mail.com', 'Football Fan', '+8801755555555'),
(7, 'Farhan Ahmed', 'farhan@mail.com', 'Football Fan', '+8801766666666'),
(8, 'Mehedi Islam', 'mehedi@mail.com', 'Football Fan', '+8801777777777'),
(9, 'Shakil Khan', 'shakil@mail.com', 'Football Fan', '+8801788888888'),
(10, 'Mim Akter', 'mim@mail.com', 'Football Fan', '+8801799999999'),
(11, 'Arif Hossain', 'arif@mail.com', 'Ticket Manager', '+8801811111111'),
(12, 'Sadia Afrin', 'sadia@mail.com', 'Football Fan', '+8801822222222'),
(13, 'Rifat Karim', 'rifat@mail.com', 'Football Fan', NULL),
(14, 'Nabila Noor', 'nabila@mail.com', 'Football Fan', '+8801833333333'),
(15, 'Sojib Uddin', 'sojib@mail.com', 'Football Fan', '+8801844444444'),
(16, 'Tania Akter', 'tania@mail.com', 'Football Fan', '+8801855555555'),
(17, 'Mahmudul Hasan', 'mahmudul@mail.com', 'Football Fan', '+8801866666666'),
(18, 'Nayeem Islam', 'nayeem@mail.com', 'Ticket Manager', '+8801877777777'),
(19, 'Anika Sultana', 'anika@mail.com', 'Football Fan', NULL);


-- insert data
INSERT INTO matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available'),
(106, 'Arsenal vs Chelsea', 'Premier League', 110.00, 'Available'),
(107, 'Manchester United vs Tottenham', 'Premier League', 115.00, 'Selling Fast'),
(108, 'Borussia Dortmund vs RB Leipzig', 'Bundesliga', 95.00, 'Available'),
(109, 'Atletico Madrid vs Sevilla', 'La Liga', 85.00, 'Available'),
(110, 'Napoli vs Lazio', 'Serie A', 88.00, 'Available'),
(111, 'Ajax vs PSV Eindhoven', 'Eredivisie', 75.00, 'Available'),
(112, 'Benfica vs Porto', 'Primeira Liga', 82.00, 'Selling Fast'),
(113, 'Galatasaray vs Fenerbahce', 'Super Lig', 70.00, 'Sold Out'),
(114, 'Al Nassr vs Al Hilal', 'Saudi Pro League', 140.00, 'Selling Fast'),
(115, 'Flamengo vs Palmeiras', 'Brasileirao', 65.00, 'Available');



-- insert data
INSERT INTO bookings (
    booking_id,
    user_id,
    match_id,
    seat_number,
    payment_status,
    total_cost
) VALUES
(506, 4, 103, 'D-10', 'Confirmed', 130.00),
(507, 5, 104, 'E-05', null, 90.00),
(508, 6, 105, 'F-08', 'Pending', 80.00),
(509, 7, 106, 'A-01', 'Confirmed', 110.00),
(510, 8, 107, 'B-15', 'Cancelled', 115.00),
(511, 9, 108, 'C-07', 'Confirmed', 95.00),
(512, 10, 109, 'D-12', 'Refunded', 85.00),
(513, 11, 110, 'E-18', null, 88.00),
(514, 12, 111, 'F-02', 'Pending', 75.00),
(515, 13, 112, 'A-20', 'Confirmed', 82.00),
(516, 14, 113, 'B-09', 'Cancelled', 70.00),
(517, 1, 114, 'C-14', 'Confirmed', 140.00),
(518, 2, 115, 'D-06', 'Confirmed', 65.00),
(519, 3, 106, 'E-11', null, 110.00),
(520, 4, 107, 'F-16', 'Confirmed', 115.00),
(521, 5, 108, 'A-22', 'Refunded', 95.00),
(522, 6, 109, 'B-03', 'Confirmed', 85.00),
(523, 7, 110, 'C-19', 'Confirmed', 88.00),
(524, 8, 111, 'D-04', 'Pending', 75.00),
(525, 9, 112, 'E-21', 'Confirmed', 82.00);

-- query 1
select match_id,fixture,base_ticket_price from matches where tournament_category='Champions League' and match_status='Available';

-- query 2
select user_id ,full_name,email from users where full_name ilike 'Tanvir%' or full_name ilike '%Haque%';

-- query 3
select booking_id,user_id,match_id,coalesce(payment_status,'Action Required') as payment_status from bookings;

-- query 4
select booking_id,full_name,fixture,total_cost from bookings as b inner join users as u on b.user_id = u.user_id inner join matches as m on b.match_id=m.match_id;

-- query 5
select users.user_id,full_name,booking_id from users left join bookings on bookings.user_id=users.user_id;

-- query 6
select * from bookings where total_cost>(select avg(total_cost) from bookings );

-- query 7
select match_id, fixture,base_ticket_price from matches order by base_ticket_price desc offset 1 limit 2;