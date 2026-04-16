DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;
\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    diameter_in_light_years INT NOT NULL,
    has_black_hole BOOLEAN NOT NULL,
    description TEXT
);

INSERT INTO galaxy (name, age_in_millions_of_years, diameter_in_light_years, has_black_hole, description) VALUES
('Milky Way', 13600, 105700, true, 'Our home galaxy, a barred spiral galaxy'),
('Andromeda', 10000, 220000, true, 'Nearest major galaxy to the Milky Way'),
('Triangulum', 10000, 60000, false, 'Third largest in the Local Group'),
('Whirlpool', 400, 76900, true, 'Classic spiral galaxy with companion'),
('Sombrero', 13250, 50000, true, 'Known for its bright nucleus'),
('Cartwheel', 500, 150000, true, 'Rare cartwheel shape from collision');

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    distance_from_earth_ly INT NOT NULL,
    is_main_sequence BOOLEAN NOT NULL,
    description TEXT,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

INSERT INTO star (name, age_in_millions_of_years, distance_from_earth_ly, is_main_sequence, description, galaxy_id) VALUES
('Sun', 4600, 0, true, 'Our star at the center of the solar system', 1),
('Sirius', 200, 8, true, 'Brightest star in the night sky', 1),
('Betelgeuse', 8, 700, false, 'Red supergiant in Orion', 1),
('Proxima Centauri', 4850, 4, true, 'Closest star to the Sun', 1),
('Vega', 455, 25, true, 'Bright star in Lyra constellation', 1),
('Rigel', 8, 860, false, 'Blue supergiant in Orion', 1);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    orbital_period_in_days INT NOT NULL,
    distance_from_star_in_au NUMERIC(10,4) NOT NULL,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id)
);

INSERT INTO planet (name, orbital_period_in_days, distance_from_star_in_au, has_life, is_spherical, star_id) VALUES
('Mercury', 88, 0.3870, false, true, 1),
('Venus', 225, 0.7230, false, true, 1),
('Earth', 365, 1.0000, true, true, 1),
('Mars', 687, 1.5240, false, true, 1),
('Jupiter', 4333, 5.2040, false, true, 1),
('Saturn', 10759, 9.5820, false, true, 1),
('Uranus', 30687, 19.2010, false, true, 1),
('Neptune', 60190, 30.0500, false, true, 1),
('Proxima b', 11, 0.0485, false, true, 4),
('Proxima c', 1928, 1.4890, false, true, 4),
('Sirius Ab', 365, 1.0000, false, true, 2),
('Vega b', 400, 1.1000, false, true, 5);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    orbital_period_in_days INT NOT NULL,
    radius_in_km NUMERIC(10,2) NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    has_atmosphere BOOLEAN NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id)
);

INSERT INTO moon (name, orbital_period_in_days, radius_in_km, is_spherical, has_atmosphere, planet_id) VALUES
('Moon', 27, 1737.10, true, false, 3),
('Phobos', 0, 11.27, false, false, 4),
('Deimos', 1, 6.20, false, false, 4),
('Io', 2, 1821.60, true, true, 5),
('Europa', 4, 1560.80, true, false, 5),
('Ganymede', 7, 2634.10, true, false, 5),
('Callisto', 17, 2410.30, true, false, 5),
('Titan', 16, 2574.70, true, true, 6),
('Enceladus', 1, 252.10, true, true, 6),
('Mimas', 1, 198.20, false, false, 6),
('Rhea', 5, 763.80, true, false, 6),
('Dione', 3, 561.40, true, false, 6),
('Tethys', 2, 531.10, true, false, 6),
('Titania', 9, 788.40, true, false, 7),
('Oberon', 13, 761.40, true, false, 7),
('Ariel', 3, 578.90, true, false, 7),
('Umbriel', 4, 584.70, true, false, 7),
('Triton', 6, 1353.40, true, true, 8),
('Nereid', 360, 170.00, false, false, 8),
('Proteus', 1, 210.00, false, false, 8);

CREATE TABLE asteroid_belt (
    asteroid_belt_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    average_distance_in_au NUMERIC(10,4) NOT NULL,
    object_count INT NOT NULL,
    is_active BOOLEAN NOT NULL,
    description TEXT,
    star_id INT NOT NULL REFERENCES star(star_id)
);

INSERT INTO asteroid_belt (name, average_distance_in_au, object_count, is_active, description, star_id) VALUES
('Main Belt', 2.7000, 1000000, true, 'Located between Mars and Jupiter', 1),
('Kuiper Belt', 39.5000, 100000, true, 'Beyond Neptune, icy bodies', 1),
('Oort Cloud', 50000.0000, 2000000, true, 'Distant shell of icy planetesimals', 1);
