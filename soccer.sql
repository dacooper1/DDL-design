-- ### **Part Three: Soccer League**
-- Design a schema for a simple sports league. Your schema should keep track of
-- - All of the teams in the league
-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league (This doesn’t have to be its own table if the data can be captured somehow).
DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer
CREATE TABLE teams(
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE players(
    id serial PRIMARY KEY,
    name text,
    DOB date
);

CREATE TABLE referees(
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE seasons(
    id serial PRIMARY KEY,
    start DATE,
    end date
);

CREATE TABLE matches(
    id serial PRIMARY KEY,
    home_id int REFERENCES teams ON DELETE CASCADE,
    away_id int REFERENCES teams ON DELETE CASCADE,
    ref_id int REFERENCES referees ON DELETE CASCADE,
    location text,
    date date,
    start TIME,
    season_id int REFERENCES seasons ON DELETE CASCADE
);

CREATE TABLE lineup(
    id serial PRIMARY KEY,
    player_id int REFERENCES players ON DELETE CASCADE,
    team_id int REFERENCES teams ON DELETE CASCADE,
    match_id int REFERENCES matches ON DELETE CASCADE,
);

CREATE TABLE goals(
    id serial PRIMARY KEY,
    player_id int REFERENCES players ON DELETE CASCADE,
    match_id int REFERENCES matches ON DELETE CASCADE
);

CREATE TABLE results(
    id serial PRIMARY KEY,
    team_id int REFERENCES teams ON DELETE CASCADE,
    match_id int REFERENCES matches ON DELETE CASCADE,
    results text
);

