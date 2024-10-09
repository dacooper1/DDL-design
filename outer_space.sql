-- from the terminal run:
-- psql < outer_space.sql
DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space
CREATE TABLE galaxies(
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE planets(
  id serial PRIMARY KEY,
  name text NOT NULL,
  orbital_period_in_years float NOT NULL,
  orbits_around text NOT NULL,
  galaxy int REFERENCES galaxies ON DELETE NULL,
);

CREATE TABLE planets_moons(
  id serial PRIMARY KEY,
  planet_id int REFERENCES planets ON DELETE CASCADE,
  moons_id int REFERENCES moons ON DELETE CASCADE
);

-- INSERT INTO planets(name, orbital_period_in_years, orbits_around, galaxy, moons)
--   VALUES ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
-- ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
-- ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
-- ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
-- ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
-- ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');
