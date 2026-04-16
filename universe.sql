--
-- PostgreSQL database dump
--

\echo 'Creating database universe...'

-- Drop and recreate
DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

-- GALAXY
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    diameter_in_light_years NUMERIC(15,2),
    has_black_hole BOOLEAN NOT NULL,
    galaxy_type VARCHAR(50)
);

INSERT INTO galaxy (name, age_in_millions_of_years, diameter_in_light_years, has_black_hole, galaxy_type) VALUES
('Milky Way', 13600, 105700.00, true, 'Spiral'),
('Andromeda', 10000, 220000.00, true, 'Spiral'),
('Triangulum', 10000, 60000.00, false, 'Spiral'),
('Whirlpool', 400, 76900.00, true, 'Spiral'),
('Sombrero', 13250, 50000.00, true, 'Elliptical'),
('Cartwheel', 500, 150000.00, true, 'Lenticular');

-- STAR
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth_ly NUMERIC(15,2),
    is_main_sequence BOOLEAN NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

INSERT INTO star (name, age_in_millions_of_years, distance_from_earth_ly, is_main_sequence, galaxy_id) VALUES
('Sun', 4600, 0.00, true, 1),
('Sirius', 200, 8.60, true, 1),
('Betelgeuse', 8, 700.00, false, 1),
('Proxima Centauri', 4850, 4.24, true, 1),
('Vega', 455, 25.00, true, 1),
('Rigel', 8, 860.00, false, 1);

-- PLANET
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    orbital_period_in_days INT NOT NULL,
    distance_from_star_au NUMERIC(10,4),
    has_life BOOLEAN NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id)
);

INSERT INTO planet (name, orbital_period_in_days, distance_from_star_au, has_life, star_id) VALUES
('Mercury', 88, 0.3870, false, 1),
('Venus', 225, 0.7230, false, 1),
('Earth', 365, 1.0000, true, 1),
('Mars', 687, 1.5240, false, 1),
('Jupiter', 4333, 5.2040, false, 1),
('Saturn', 10759, 9.5820, false, 1),
('Uranus', 30687, 19.2010, false, 1),
('Neptune', 60190, 30.0500, false, 1),
('Proxima b', 11, 0.0485, false, 4),
('Proxima c', 1928, 1.4890, false, 4),
('Sirius Ab', 365, 1.0000, false, 2),
('Vega b', 400, 1.1000, false, 5);

-- MOON
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    orbital_period_in_days INT NOT NULL,
    radius_in_km NUMERIC(10,2),
    is_spherical BOOLEAN NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);

INSERT INTO moon (name, orbital_period_in_days, radius_in_km, is_spherical, planet_id) VALUES
('Moon', 27, 1737.10, true, 3),
('Phobos', 0, 11.27, false, 4),
('Deimos', 1, 6.20, false, 4),
('Io', 2, 1821.60, true, 5),
('Europa', 4, 1560.80, true, 5),
('Ganymede', 7, 2634.10, true, 5),
('Callisto', 17, 2410.30, true, 5),
('Titan', 16, 2574.70, true, 6),
('Enceladus', 1, 252.10, true, 6),
('Mimas', 1, 198.20, false, 6),
('Rhea', 5, 763.80, true, 6),
('Dione', 3, 561.40, true, 6),
('Tethys', 2, 531.10, true, 6),
('Titania', 9, 788.40, true, 7),
('Oberon', 13, 761.40, true, 7),
('Ariel', 3, 578.90, true, 7),
('Umbriel', 4, 584.70, true, 7),
('Triton', 6, 1353.40, true, 8),
('Nereid', 360, 170.00, false, 8),
('Proteus', 1, 210.00, false, 8);

-- ASTEROID BELT (5th table)
CREATE TABLE asteroid_belt (
    asteroid_belt_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    average_distance_au NUMERIC(10,4) NOT NULL,
    object_count INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id)
);

INSERT INTO asteroid_belt (name, average_distance_au, object_count, is_active, star_id) VALUES
('Main Belt', 2.7000, 1000000, true, 1),
('Kuiper Belt', 39.5000, 100000, true, 1),
('Oort Cloud', 50000.0000, 2000000, true, 1);
