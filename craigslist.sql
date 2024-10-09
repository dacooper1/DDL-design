-- ### **Part Two: Craigslist**
-- Design a schema for Craigslist! Your schema should keep track of the following
-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to
DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist
CREATE TABLE regions(
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE categories(
    id serial PRIMARY KEY,
    name text
);

CREATE TABLE users(
    id serial PRIMARY KEY,
    username text,
    pref_region int REFERENCES regions ON DELETE CASCADE
);

CREATE TABLE posts(
    id serial PRIMARY KEY,
    title text,
    content text,
    location text,
    user_id int REFERENCES users ON DELETE CASCADE,
    region_id int REFERENCES regions ON DELETE CASCADE,
    category_id int REFERENCES categories ON DELETE CASCADE
);

INSERT INTO regions(name)
    VALUES ('GTA'),
('NYC'),
('LA');

INSERT INTO categories(name)
    VALUES ('soccer'),
('skincare'),
('cycling');

INSERT INTO users(username, pref_region)
    VALUES ('dcoop', 1),
('indya', 3),
('nelly', 2);

INSERT INTO posts(title, content, location, user_id, region_id, category_id)
    VALUES ('road bike', 'selling a Triban RC500 for $800', 'toronto', 1, 1, 3),
('messi jersey', 'selling signed Messi jersery, message for price', 'rochester', 3, 2, 1),
('korean sunscreen', 'unopened and unused', 'SOHO', 3, 3, 2);

