--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    number_stars integer,
    number_planets integer,
    number_moons integer
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
    name character varying(30) NOT NULL,
    planet_id integer,
    has_water boolean,
    moon_size integer
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
    name character varying(30) NOT NULL,
    distance_from_star_ltyars numeric(6,2),
    has_moon boolean,
    star_id integer
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
-- Name: relations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.relations (
    relations_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    comment text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.relations OWNER TO freecodecamp;

--
-- Name: relations_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relations_id_seq OWNER TO freecodecamp;

--
-- Name: relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.relations_id_seq OWNED BY public.relations.relations_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_planets integer,
    has_planets boolean,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: relations relations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relations ALTER COLUMN relations_id SET DEFAULT nextval('public.relations_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis Major', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Maffei I', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Maffei II', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Milk Way', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon1', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Moon2', 2, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Moon3', 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Moon4', 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Moon5', 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Moon6', 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Moon7', 7, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Moon8', 8, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Moon9', 9, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Moon10', 10, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Moon11', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Moon12', 2, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Moon13', 3, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Moon14', 4, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Moon15', 4, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Moon16', 3, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Moon17', 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Moon18', 9, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Moon19', 7, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Moon20', 12, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, NULL, 7);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, NULL, 7);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, NULL, 7);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, 7);
INSERT INTO public.planet VALUES (5, 'Jupter', NULL, NULL, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, 7);
INSERT INTO public.planet VALUES (9, 'Pluto', NULL, NULL, 7);
INSERT INTO public.planet VALUES (10, 'Joseph', NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Peter', NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Carlos', NULL, NULL, 2);
INSERT INTO public.planet VALUES (13, 'Mary', NULL, NULL, 3);
INSERT INTO public.planet VALUES (14, 'CCCs', NULL, NULL, 4);
INSERT INTO public.planet VALUES (15, 'Dogus', NULL, NULL, 3);
INSERT INTO public.planet VALUES (16, 'Catus', NULL, NULL, 2);
INSERT INTO public.planet VALUES (17, 'Juanus', NULL, NULL, 1);
INSERT INTO public.planet VALUES (18, 'Nibiru', NULL, NULL, 4);


--
-- Data for Name: relations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.relations VALUES (1, NULL, NULL, NULL, NULL, NULL, 'rel1');
INSERT INTO public.relations VALUES (2, NULL, NULL, NULL, NULL, NULL, 'rel2');
INSERT INTO public.relations VALUES (3, NULL, NULL, NULL, NULL, NULL, 'rel3');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Acamar', NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Agena', NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Albireo', NULL, NULL, 4);
INSERT INTO public.star VALUES (4, 'Adhara', NULL, NULL, 3);
INSERT INTO public.star VALUES (5, 'Denebola', NULL, NULL, 7);
INSERT INTO public.star VALUES (6, 'Diphda', NULL, NULL, 2);
INSERT INTO public.star VALUES (7, 'Sun', NULL, NULL, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.relations_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: relations relations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_name_key UNIQUE (name);


--
-- Name: relations relations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.relations
    ADD CONSTRAINT relations_pkey PRIMARY KEY (relations_id);


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
-- Name: star star_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--