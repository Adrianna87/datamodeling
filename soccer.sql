DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team_name TEXT NOT NULL,
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  first_day INTEGER NOT NULL,
  last_day INTEGER NOT NULL
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  home_team INTEGER REFERENCES teams (id),
  away_team INTEGER REFERENCES teams (id),
  season_id INTEGER REFERENCES seasons (id),
  ref_id INTEGER REFERENCES referees (id),
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams (id),
  match_id INTEGER REFERENCES matches (id),
  results TEXT NOT NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players (id)
  match_id INTEGER REFERENCES matches (id)
)