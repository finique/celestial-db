--
-- PostgreSQL database dump
--

\restrict XIgmTxW44pf5ffffpit3zVHW9DHLm0hFmNWWG8JtCLrmU2BljH32XaZ8jbbZI44

-- Dumped from database version 15.17 (Homebrew)
-- Dumped by pg_dump version 15.17 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\unrestrict XIgmTxW44pf5ffffpit3zVHW9DHLm0hFmNWWG8JtCLrmU2BljH32XaZ8jbbZI44
\connect universe
\restrict XIgmTxW44pf5ffffpit3zVHW9DHLm0hFmNWWG8JtCLrmU2BljH32XaZ8jbbZI44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    name character varying(100) NOT NULL,
    average_distance_in_au numeric(10,4) NOT NULL,
    object_count integer NOT NULL,
    is_active boolean NOT NULL,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO postgres;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO postgres;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter_in_light_years integer NOT NULL,
    has_black_hole boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_in_days integer NOT NULL,
    radius_in_km numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_in_days integer NOT NULL,
    distance_from_star_in_au numeric(10,4) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth_ly integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    description text,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asteroid_belt VALUES (1, 'Main Belt', 2.7000, 1000000, true, 'Located between Mars and Jupiter', 1);
INSERT INTO public.asteroid_belt VALUES (2, 'Kuiper Belt', 39.5000, 100000, true, 'Beyond Neptune, icy bodies', 1);
INSERT INTO public.asteroid_belt VALUES (3, 'Oort Cloud', 50000.0000, 2000000, true, 'Distant shell of icy planetesimals', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 105700, true, 'Our home galaxy, a barred spiral galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000, true, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 10000, 60000, false, 'Third largest in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 400, 76900, true, 'Classic spiral galaxy with companion');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 13250, 50000, true, 'Known for its bright nucleus');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 500, 150000, true, 'Rare cartwheel shape from collision');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 27, 1737.10, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0, 11.27, false, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1, 6.20, false, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 2, 1821.60, true, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 1560.80, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7, 2634.10, true, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 17, 2410.30, true, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 2574.70, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1, 252.10, true, true, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', 1, 198.20, false, false, 6);
INSERT INTO public.moon VALUES (11, 'Rhea', 5, 763.80, true, false, 6);
INSERT INTO public.moon VALUES (12, 'Dione', 3, 561.40, true, false, 6);
INSERT INTO public.moon VALUES (13, 'Tethys', 2, 531.10, true, false, 6);
INSERT INTO public.moon VALUES (14, 'Titania', 9, 788.40, true, false, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 13, 761.40, true, false, 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 3, 578.90, true, false, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 4, 584.70, true, false, 7);
INSERT INTO public.moon VALUES (18, 'Triton', 6, 1353.40, true, true, 8);
INSERT INTO public.moon VALUES (19, 'Nereid', 360, 170.00, false, false, 8);
INSERT INTO public.moon VALUES (20, 'Proteus', 1, 210.00, false, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 88, 0.3870, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 225, 0.7230, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 365, 1.0000, true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 687, 1.5240, false, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4333, 5.2040, false, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 10759, 9.5820, false, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 30687, 19.2010, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 60190, 30.0500, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 11, 0.0485, false, true, 4);
INSERT INTO public.planet VALUES (10, 'Proxima c', 1928, 1.4890, false, true, 4);
INSERT INTO public.planet VALUES (11, 'Sirius Ab', 365, 1.0000, false, true, 2);
INSERT INTO public.planet VALUES (12, 'Vega b', 400, 1.1000, false, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 0, true, 'Our star at the center of the solar system', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 200, 8, true, 'Brightest star in the night sky', 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 700, false, 'Red supergiant in Orion', 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4850, 4, true, 'Closest star to the Sun', 1);
INSERT INTO public.star VALUES (5, 'Vega', 455, 25, true, 'Bright star in Lyra constellation', 1);
INSERT INTO public.star VALUES (6, 'Rigel', 8, 860, false, 'Blue supergiant in Orion', 1);


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid_belt asteroid_belt_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;


--
-- PostgreSQL database dump complete
--

\unrestrict XIgmTxW44pf5ffffpit3zVHW9DHLm0hFmNWWG8JtCLrmU2BljH32XaZ8jbbZI44

