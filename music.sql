-- from the terminal run:
-- psql < music.sql
DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music
CREATE TABLE songs(
  id serial PRIMARY KEY,
  title text NOT NULL,
  duration_in_seconds integer NOT NULL,
  release_date date NOT NULL,
  album int preferences albums ON DELETE CASCADE
);

CREATE TABLE albums(
  id serial PRIMARY KEY,
  title text NOT NULL release_date date
);

CREATE TABLE artists(
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE producers(
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE artist_song(
  id serial PRIMARY KEY,
  artist_id int REFERENCES artists ON DELETE CASCADE,
  song_id int REFERENCES songs ON DELETE CASCADE
);

CREATE TABLE producer_song(
  id serial PRIMARY KEY,
  producer_id int REFERENCES producers ON DELETE CASCADE,
  song_id int REFERENCES songs ON DELETE CASCADE
);

-- INSERT INTO songs(title, duration_in_seconds, release_date, artists, album, producers)
--   VALUES ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
-- ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
-- ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
-- ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
-- ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
-- ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
-- ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
-- ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
-- ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
-- ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');
