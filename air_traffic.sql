-- from the terminal run:
-- psql < air_traffic.sql
DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic
CREATE TABLE tickets(
  id serial PRIMARY KEY,
  first_name text NOT NULL,
  last_name text NOT NULL,
  seat text NOT NULL,
  departure timestamp NOT NULL,
  arrival timestamp NOT NULL,
  airline text NOT NULL,
  from_city text NOT NULL,
  from_country text NOT NULL,
  to_city text NOT NULL,
  to_country text NOT NULL
);

CREATE TABLE passenger(
  id serial PRIMARY KEY,
  first text NOT NULL,
  last text NOT NULL
);

CREATE TABLE plane(
  id serial PRIMARY KEY,
  airline text NOT NULL,
  departure timestamp NOT NULL,
  arrival timestamp NOT NULL,
  seat text NOT NULL
);

CREATE TABLE cities(
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE countries(
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE routes(
  id serial PRIMARY KEY,
  from_city int REFERENCES cities ON DELETE CASCADE from_country int REFERENCES country ON DELETE CASCADE to_city int REFERENCES cities ON DELETE CASCADE to_country int REFERENCES country ON DELETE CASCADE
);

INSERT INTO tickets(first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
  VALUES ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

