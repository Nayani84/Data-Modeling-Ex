-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE seats
(
  id SERIAL PRIMARY KEY,
  seat_number TEXT NOT NULL
);

CREATE TABLE passengers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE departures
(
  id SERIAL PRIMARY KEY,
  departure_time TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL
);

CREATE TABLE arrivals
(
  id SERIAL PRIMARY KEY,
  arrival_time TIMESTAMP NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers,
  airline_id INTEGER REFERENCES airlines,
  seat_id INTEGER REFERENCES seats,
  departure_id INTEGER REFERENCES departures,
  arrival_id INTEGER REFERENCES arrivals
);



INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');


INSERT INTO seats
  (seat_number)
VALUES 
  ('33B'),
  ('8A'),
  ('12F'),
  ('20A'),
  ('23D'),
  ('18C'),
  ('9E'),
  ('1A'),
  ('32B'),
  ('10D');
  
  
INSERT INTO passengers
  (first_name , last_name)
VALUES 
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');


INSERT INTO departures
  (departure_time , from_city , from_country)
VALUES
  ('2018-04-08 09:00:00' , 'Washington DC', 'United States'),
  ('2018-12-19 12:45:00' , 'Tokyo', 'Japan'),
  ('2018-01-02 07:00:00' , 'Los Angeles', 'United States'),
  ('2018-04-15 16:50:00' , 'Seattle', 'United States'),
  ('2018-08-01 18:30:00' , 'Paris', 'France'),
  ('2018-10-31 01:15:00' , 'Dubai', 'UAE'),
  ('2019-02-06 06:00:00' , 'New York', 'United States'),
  ('2018-12-22 14:42:00' , 'Cedar Rapids', 'United States'),
  ('2019-02-06 16:28:00' , 'Charlotte', 'United States'),
  ('2019-01-20 19:30:00' , 'Sao Paolo', 'Brazil');


INSERT INTO arrivals
  (arrival_time , to_city ,  to_country)
VALUES
  ('2018-04-08 12:00:00' , 'Seattle', 'United States'),
  ('2018-12-19 16:15:00' , 'London', 'United Kingdom'),
  ('2018-01-02 08:03:00' , 'Las Vegas', 'United States'),
  ('2018-04-15 21:00:00' , 'Mexico City', 'Mexico'),
  ('2018-08-01 21:50:00' , 'Casablanca', 'Morocco'),
  ('2018-10-31 12:55:00' , 'Beijing', 'China'),
  ('2019-02-06 07:47:00' ,'Charlotte', 'United States'),
  ('2018-12-22 15:56:00' , 'Chicago', 'United States'),
  ('2019-02-06 19:18:00' , 'New Orleans', 'United States'),
  ('2019-01-20 22:45:00' , 'Santiago', 'Chile');


INSERT INTO tickets
  (passenger_id , airline_id , seat_id , departure_id , arrival_id)
VALUES
  (1 , 1 , 1 , 1 , 1),
  (2 , 2 , 2 , 2 , 2),
  (3 , 3 , 3 , 3 , 3),
  (1 , 3 , 4 , 4 , 4),
  (4 , 4 , 5 , 5 , 5),
  (2 , 5 , 6 , 6 , 6),
  (5 , 1 , 7 , 7 , 7),
  (6 , 6 , 8 , 8 , 8),
  (5 , 6 , 9 , 9 , 9),
  (7 , 7 , 10 , 10 , 10);