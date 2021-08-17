DROP DATABASE IF EXISTS craigs_list;

CREATE DATABASE craigs_list;

\c craigs_list

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region_name TEXT NOT NULL,
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  region INTEGER REFERENCES regions(id),
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category_name TEXT NOT NULL,
);

CREATE TABLE post
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post_description TEXT NOT NULL,
  username_id INTEGER REFERENCES users (id),
  place TEXT NOT NULL,
  region_id INTEGER REFERENCES regions (id),
  category INTEGER REFERENCES categories (id)
)