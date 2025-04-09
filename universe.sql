--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    is_geologically_active boolean,
    description text,
    is_spherical boolean DEFAULT true
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    observed_body_type text NOT NULL,
    observed_body_name character varying(100) NOT NULL,
    year integer,
    successful boolean
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_types text,
    age_in_millions_of_years integer,
    has_life boolean,
    is_spherical boolean DEFAULT true,
    radius integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    is_spherical boolean,
    has_planets boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0.00, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10100, 25000000.00, 'Nearest spiral galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3000000.00, 'Part of local group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 13000, 53000000.00, 'Supermassive black hole in center');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 13000, 163000.00, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral', 9000, 29000000.00, 'Unusual bulge and dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1,'Moon', 1, 3474, FALSE, 'Earth’s only natural satellite', TRUE,0);
INSERT INTO public.moon VALUES (2,'Phobos', 2, 22, FALSE, 'One of Mars’ moons', FALSE,0);
INSERT INTO public.moon VALUES (3,'Deimos', 2, 12, FALSE, 'Small moon of Mars', FALSE,0);
INSERT INTO public.moon VALUES (4,'Europa', 3, 3121, TRUE, 'Icy moon of Jupiter', TRUE,0);
INSERT INTO public.moon VALUES (5,'Ganymede', 3, 5268, TRUE, 'Largest moon in the solar system', TRUE,0);
INSERT INTO public.moon VALUES (6,'Callisto', 3, 4821, FALSE, 'Heavily cratered moon', TRUE,0),
INSERT INTO public.moon VALUES (7,'Io', 3, 3643, TRUE, 'Volcanically active', TRUE,0),
INSERT INTO public.moon VALUES (8,'Triton', 4, 2707, FALSE, 'Retrograde orbit moon', TRUE,0),
INSERT INTO public.moon VALUES (9,'Charon', 5, 1212, FALSE, 'Pluto’s largest moon', TRUE,0),
INSERT INTO public.moon VALUES (10,'Amalthea', 3, 250, FALSE, 'Jupiter inner moon', FALSE,0),
INSERT INTO public.moon VALUES (11,'Himalia', 3, 170, FALSE, 'Irregular moon of Jupiter', FALSE,0),
INSERT INTO public.moon VALUES (12,'Miranda', 6, 471, TRUE, 'Moon with extreme terrain', TRUE,0),
INSERT INTO public.moon VALUES (13,'Oberon', 6, 1522, FALSE, 'Second largest Uranian moon', TRUE,0),
INSERT INTO public.moon VALUES (14,'Titan', 3, 5150, TRUE, 'Moon with thick atmosphere', TRUE,0),
INSERT INTO public.moon VALUES (15,'Enceladus', 3, 504, TRUE, 'Icy geysers', TRUE,0),
INSERT INTO public.moon VALUES (16,'Rhea', 3, 1527, FALSE, 'Second largest moon of Saturn', TRUE,0),
INSERT INTO public.moon VALUES (17,'Iapetus', 3, 1469, FALSE, 'Two-tone coloration', TRUE,0),
INSERT INTO public.moon VALUES (18,'Dione', 3, 1123, FALSE, 'Saturn’s icy moon', TRUE,0),
INSERT INTO public.moon VALUES (19,'Mimas', 3, 396, FALSE, 'Crater resembles Death Star', TRUE,0),
INSERT INTO public.moon VALUES (20,'Hyperion', 3, 270, FALSE, 'Oddly shaped moon', FALSE,0);



--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Apollo 11 Mission', 'moon', 'Moon', 1969, true);
INSERT INTO public.observation VALUES (2, 'HUbble TRAPPIST Study', 'planet', 'TRAPPIST-1e', 2017, true);
INSERT INTO public.observation VALUES (3, 'Voyager 1 Flyby', 'moon', 'Ganymede', 1979, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 4500, true, true, 6371);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 4500, false, true, 3390);
INSERT INTO public.planet VALUES (3, 'Juptier', 1, 'Gas Giant', 4500, false, true, 69911);
INSERT INTO public.planet VALUES (4, 'Proxima b', 2, 'Terrestrial', 4800, false, true, 7160);
INSERT INTO public.planet VALUES (5, 'Aplha Cen Bb', 3, 'Terrestrial', 3000, false, true, 9100);
INSERT INTO public.planet VALUES (6, 'Vega I', 6, 'Gas Giant', 600, false, true, 95000);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 3, 'Terrestrial', 4000, false, true, 7000);
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 4, 'Gas Giant', 600, false, true, 95000);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1e', 2, 'Terrestrial', 500, false, true, 5820);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1f', 2, 'Terrestrial', 500, false, true, 5820);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1g', 2, 'Terrestrial', 500, false, true, 5820);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1h', 2, 'Terrestrial', 500, false, true, 5820);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 1.00, NULL, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4500, 0.12, true, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 5000, 1.10, true, true);
INSERT INTO public.star VALUES (4, 'Sirius A', 1, 200, 2.02, true, false);
INSERT INTO public.star VALUES (5, 'Betelgeus', 1, 10000, 20.00, false, false);
INSERT INTO public.star VALUES (6, 'Vega', 2, 455, 2.10, true, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observation observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_name_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

