DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passesngers (id),
  flight_id INTEGER REFERENCES flights (id)
);

CREATE TABLE cities
(
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  city_country TEXT NOT NULL,
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
);

CREATE TABLE flights
(
  id SERIAL PRIMARY KEY,
  departure_time TEXT NOT NULL,
  arrival_time TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines (id),
  departure_city INTEGER REFERENCES cities (id),
  arrival_city INTEGER REFERENCES cities (id),
)

CREATE TABLE passesngers
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  flight_id INTEGER REFERENCES flights (id)
);