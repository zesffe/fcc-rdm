--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40) NOT NULL,
    home boolean,
    vast boolean,
    magallanic boolean
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
    name character varying(20) NOT NULL,
    planet_id integer,
    color character varying(10),
    rotates boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    population_b numeric,
    explored boolean NOT NULL,
    known boolean NOT NULL,
    star_id integer,
    countries integer
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
    name character varying(20) NOT NULL,
    galaxy_id integer,
    color character varying(10),
    visible boolean
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
-- Name: traveler; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.traveler (
    name character varying(20),
    traveler_id integer NOT NULL,
    cat boolean NOT NULL,
    lifetimes integer
);


ALTER TABLE public.traveler OWNER TO freecodecamp;

--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.traveler_traveler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.traveler_traveler_id_seq OWNER TO freecodecamp;

--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.traveler_traveler_id_seq OWNED BY public.traveler.traveler_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: traveler traveler_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler ALTER COLUMN traveler_id SET DEFAULT nextval('public.traveler_traveler_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Andromeda', false, true, false);
INSERT INTO public.galaxy VALUES (5, 'Hoag''s Object', false, true, false);
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', false, true, false);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, false);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', false, true, true);
INSERT INTO public.galaxy VALUES (4, 'Small Megellanic Cloud', false, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Euporie', 5, 'white', true);
INSERT INTO public.moon VALUES (12, 'Himalia', 5, 'white', true);
INSERT INTO public.moon VALUES (7, 'Titan', 6, 'orange', true);
INSERT INTO public.moon VALUES (8, 'Tethys', 6, 'gray', true);
INSERT INTO public.moon VALUES (9, 'Telesto', 6, 'gray', true);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 'blue', true);
INSERT INTO public.moon VALUES (6, 'Io', 5, 'yellow', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'brown', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'red', true);
INSERT INTO public.moon VALUES (10, 'Callisto', 5, 'brown', true);
INSERT INTO public.moon VALUES (11, 'Elara', 5, 'gray', true);
INSERT INTO public.moon VALUES (13, 'Kalyke', 5, 'red', true);
INSERT INTO public.moon VALUES (14, 'Thebe', 5, 'brown', true);
INSERT INTO public.moon VALUES (15, 'Erinome', 5, 'red', true);
INSERT INTO public.moon VALUES (16, 'Sponde', 5, 'red', true);
INSERT INTO public.moon VALUES (17, 'Cyllene', 5, 'red', true);
INSERT INTO public.moon VALUES (18, 'Mneme', 5, 'gray', true);
INSERT INTO public.moon VALUES (19, 'Chaldene', 5, 'red', true);
INSERT INTO public.moon VALUES (20, 'Sinope', 5, 'red', true);
INSERT INTO public.moon VALUES (21, 'Kore', 5, 'red', true);
INSERT INTO public.moon VALUES (22, 'Autonoe', 5, 'gray', true);
INSERT INTO public.moon VALUES (23, 'Thyone', 5, 'red', true);
INSERT INTO public.moon VALUES (24, 'Hegemone', 5, 'gray', true);
INSERT INTO public.moon VALUES (25, 'Praxidike', 5, 'gray', true);
INSERT INTO public.moon VALUES (1, 'One-sided Moon', 3, 'white', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Earth', 'My planet', 8.299, true, true, 1, 197);
INSERT INTO public.planet VALUES (4, 'Mars', 'Seems to have been once habitable', 0.000, true, true, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Massive and gassy', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Its rings might have been made from another planet', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Mercury', 'Close to the sun and hot', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Neptune', 'Cold and windy; the fist planet discovered by a calculation', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Venus', 'Moonless and spinning clockwise', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Uranus', 'Winter and summer each require 42 Earth-years', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', 'A dwarf planet; dwarf planets are planets', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Contains water; between Mars and Jupiter', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (13, 'Eris', 'The length of one year is around 550 Earth-years', 0.000, false, true, 1, NULL);
INSERT INTO public.planet VALUES (14, 'Makemake', 'Discovered during Earth-year #2005-AD', 0.000, false, true, 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Our Main Sun', 1, 'yellow', true);
INSERT INTO public.star VALUES (3, 'Polaris', 1, 'yellow', true);
INSERT INTO public.star VALUES (4, 'Little Goat', 1, 'yellow', true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'blue', true);
INSERT INTO public.star VALUES (8, 'Rigel', 1, 'blue', true);
INSERT INTO public.star VALUES (9, 'Mizar', 1, 'blue', true);


--
-- Data for Name: traveler; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.traveler VALUES ('Pixel', 2, true, 9);
INSERT INTO public.traveler VALUES ('Hugh', 3, true, 9);
INSERT INTO public.traveler VALUES ('T''ai', 4, true, 9);
INSERT INTO public.traveler VALUES ('Phoebe', 5, true, 9);
INSERT INTO public.traveler VALUES ('Leo', 6, true, 9);
INSERT INTO public.traveler VALUES ('Cole', 1, false, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: traveler_traveler_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.traveler_traveler_id_seq', 6, true);


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
-- Name: traveler traveler_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler
    ADD CONSTRAINT traveler_name_key UNIQUE (name);


--
-- Name: traveler traveler_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveler
    ADD CONSTRAINT traveler_pkey PRIMARY KEY (traveler_id);


--
-- Name: galaxy uniqueness; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uniqueness UNIQUE (name);


--
-- Name: moon uniqueness_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniqueness_moon UNIQUE (name);


--
-- Name: planet uniqueness_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqueness_planet UNIQUE (name);


--
-- Name: star uniqueness_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uniqueness_star UNIQUE (name);


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

