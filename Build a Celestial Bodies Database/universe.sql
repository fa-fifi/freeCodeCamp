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
-- Name: continent; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.continent (
    continent_id integer NOT NULL,
    name character varying(15),
    description text NOT NULL
);


ALTER TABLE public.continent OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.continent_continent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.continent_continent_id_seq OWNER TO freecodecamp;

--
-- Name: continent_continent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.continent_continent_id_seq OWNED BY public.continent.continent_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter numeric(5,2),
    quantity integer,
    size integer,
    description text,
    is_spherical boolean,
    has_living_things boolean
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
    diameter numeric(5,2),
    quantity integer,
    size integer,
    description text,
    is_spherical boolean,
    has_living_things boolean,
    planet_id integer
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
    diameter numeric(5,2),
    quantity integer,
    size integer,
    description text,
    is_spherical boolean,
    has_living_things boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    diameter numeric(5,2),
    quantity integer,
    size integer,
    description text,
    is_spherical boolean,
    has_living_things boolean,
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
-- Name: continent continent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent ALTER COLUMN continent_id SET DEFAULT nextval('public.continent_continent_id_seq'::regclass);


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
-- Data for Name: continent; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.continent VALUES (1, 'Asia', 'The biggest one.');
INSERT INTO public.continent VALUES (2, 'Europe', 'The stupidest one.');
INSERT INTO public.continent VALUES (3, 'Africa', 'The black one.');
INSERT INTO public.continent VALUES (4, 'Antartica', 'The cold one.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 0.00, 0, 0, 'A galaxy.', true, false);
INSERT INTO public.galaxy VALUES (2, 'galaxy 1', 0.00, 0, 0, 'A galaxy.', true, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 0.00, 0, 0, 'A galaxy.', true, false);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', 0.00, 0, 0, 'A galaxy.', true, false);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', 0.00, 0, 0, 'A galaxy.', true, false);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', 0.00, 0, 0, 'A galaxy.', true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'bulan', 0.00, 0, 0, 'A moon.', true, false, 1);
INSERT INTO public.moon VALUES (3, 'moon 1', 0.00, 0, 0, 'A moon.', true, false, 1);
INSERT INTO public.moon VALUES (4, 'moon 2', 0.00, 0, 0, 'A moon.', true, false, 3);
INSERT INTO public.moon VALUES (5, 'moon 3', 0.00, 0, 0, 'A moon.', true, false, 4);
INSERT INTO public.moon VALUES (6, 'moon 4', 0.00, 0, 0, 'A moon.', true, false, 5);
INSERT INTO public.moon VALUES (7, 'moon 5', 0.00, 0, 0, 'A moon.', true, false, 6);
INSERT INTO public.moon VALUES (8, 'moon 6', 0.00, 0, 0, 'A moon.', true, false, 7);
INSERT INTO public.moon VALUES (9, 'moon 7', 0.00, 0, 0, 'A moon.', true, false, 8);
INSERT INTO public.moon VALUES (10, 'moon 8', 0.00, 0, 0, 'A moon.', true, false, 9);
INSERT INTO public.moon VALUES (12, 'moon 9', 0.00, 0, 0, 'A moon.', true, false, 11);
INSERT INTO public.moon VALUES (13, 'moon 10', 0.00, 0, 0, 'A moon.', true, false, 12);
INSERT INTO public.moon VALUES (14, 'moon 11', 0.00, 0, 0, 'A moon.', true, false, 13);
INSERT INTO public.moon VALUES (15, 'moon 12', 0.00, 0, 0, 'A moon.', true, false, 14);
INSERT INTO public.moon VALUES (16, 'moon 13', 0.00, 0, 0, 'A moon.', true, false, 3);
INSERT INTO public.moon VALUES (17, 'moon 14', 0.00, 0, 0, 'A moon.', true, false, 4);
INSERT INTO public.moon VALUES (18, 'moon 15', 0.00, 0, 0, 'A moon.', true, false, 5);
INSERT INTO public.moon VALUES (19, 'moon 16', 0.00, 0, 0, 'A moon.', true, false, 6);
INSERT INTO public.moon VALUES (20, 'moon 17', 0.00, 0, 0, 'A moon.', true, false, 7);
INSERT INTO public.moon VALUES (21, 'moon 18', 0.00, 0, 0, 'A moon.', true, false, 8);
INSERT INTO public.moon VALUES (22, 'moon 19', 0.00, 0, 0, 'A moon.', true, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'venus', 0.00, 0, 0, 'A planet.', true, false, 2);
INSERT INTO public.planet VALUES (3, 'planet 1', 0.00, 0, 0, 'A planet.', true, false, 2);
INSERT INTO public.planet VALUES (4, 'planet 3', 0.00, 0, 0, 'A planet.', true, false, 3);
INSERT INTO public.planet VALUES (5, 'planet 4', 0.00, 0, 0, 'A planet.', true, false, 4);
INSERT INTO public.planet VALUES (6, 'planet 5', 0.00, 0, 0, 'A planet.', true, false, 5);
INSERT INTO public.planet VALUES (7, 'planet 6', 0.00, 0, 0, 'A planet.', true, false, 6);
INSERT INTO public.planet VALUES (8, 'planet 7', 0.00, 0, 0, 'A planet.', true, false, 7);
INSERT INTO public.planet VALUES (9, 'planet 8', 0.00, 0, 0, 'A planet.', true, false, 8);
INSERT INTO public.planet VALUES (11, 'planet 9', 0.00, 0, 0, 'A planet.', true, false, 8);
INSERT INTO public.planet VALUES (12, 'planet 10', 0.00, 0, 0, 'A planet.', true, false, 7);
INSERT INTO public.planet VALUES (13, 'planet 11', 0.00, 0, 0, 'A planet.', true, false, 6);
INSERT INTO public.planet VALUES (14, 'planet 12', 0.00, 0, 0, 'A planet.', true, false, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'jupiter', 0.00, 0, 0, 'A star.', true, false, 1);
INSERT INTO public.star VALUES (3, 'star 1', 0.00, 0, 0, 'A star.', true, false, 1);
INSERT INTO public.star VALUES (4, 'star 2', 0.00, 0, 0, 'A star.', true, false, 2);
INSERT INTO public.star VALUES (5, 'star 3', 0.00, 0, 0, 'A star.', true, false, 3);
INSERT INTO public.star VALUES (6, 'star 4', 0.00, 0, 0, 'A star.', true, false, 4);
INSERT INTO public.star VALUES (7, 'star 5', 0.00, 0, 0, 'A star.', true, false, 5);
INSERT INTO public.star VALUES (8, 'star 6', 0.00, 0, 0, 'A star.', true, false, 6);


--
-- Name: continent_continent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.continent_continent_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: continent continent_continent_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_continent_id_key UNIQUE (continent_id);


--
-- Name: continent continent_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.continent
    ADD CONSTRAINT continent_pkey PRIMARY KEY (continent_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


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

