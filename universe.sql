
codeally@5e83987785e6:~/project$ more universe.sql
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
    diameter_in_thousand_light_years numeric(5,2),
    i_live_here boolean,
    type character varying(40)
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
    planet_id integer NOT NULL,
    diameter_in_km integer,
    surface_temp_k integer
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
    number_of_moons integer,
    greek_god text,
    has_water boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    number_of_planets integer,
    galaxy_id integer NOT NULL,
    diameter_in_thousand_km integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_sign; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_sign (
    name character varying(30) NOT NULL,
    symbol character varying(30),
    star_sign_id integer NOT NULL,
    planet_id integer
);


ALTER TABLE public.star_sign OWNER TO freecodecamp;

--
-- Name: star_sign_star_sign_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_sign_star_sign_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_sign_star_sign_id_seq OWNER TO freecodecamp;

--
-- Name: star_sign_star_sign_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_sign_star_sign_id_seq OWNED BY public.star_sign.star_sign_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_sign star_sign_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_sign ALTER COLUMN star_sign_id SET DEFAULT nextval('public.star_sign_star_sign_id_seq'::reg
class);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 105.70, true, 'Spiral');
INSERT INTO public.galaxy VALUES (1, 'Andromeda', 220.00, false, 'Supergiant Elliptical');
INSERT INTO public.galaxy VALUES (4, 'Backward', 122.73, false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 53.80, false, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 144.30, false, 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Virgo A', 120.00, false, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 15, 3474, 400);
INSERT INTO public.moon VALUES (2, 'Phobos', 16, 23, 233);
INSERT INTO public.moon VALUES (3, 'Deimos', 16, 12, 233);
INSERT INTO public.moon VALUES (4, 'Io', 17, 3660, 110);
INSERT INTO public.moon VALUES (5, 'Europa', 17, 3120, 110);
INSERT INTO public.moon VALUES (6, 'Ganymede', 17, 5263, 90);
INSERT INTO public.moon VALUES (7, 'Callisto', 17, 4820, 251);
INSERT INTO public.moon VALUES (8, 'Mimas', 18, 396, 92);
INSERT INTO public.moon VALUES (9, 'Enceladus', 18, 504, 80);
INSERT INTO public.moon VALUES (10, 'Tethys', 18, 1062, 86);
INSERT INTO public.moon VALUES (11, 'Dione', 18, 1123, 87);
INSERT INTO public.moon VALUES (12, 'Rhea', 18, 1527, 99);
INSERT INTO public.moon VALUES (13, 'Titan', 18, 5149, 93);
INSERT INTO public.moon VALUES (14, 'Iapetus', 18, 1470, 130);
INSERT INTO public.moon VALUES (15, 'Miranda', 19, 480, 60);
INSERT INTO public.moon VALUES (16, 'Ariel', 19, 1162, 60);
INSERT INTO public.moon VALUES (17, 'Umbriel', 19, 1168, 75);
INSERT INTO public.moon VALUES (18, 'Titania', 19, 1576, 70);
INSERT INTO public.moon VALUES (19, 'Oberon', 19, 1522, 75);
INSERT INTO public.moon VALUES (20, 'Triton', 20, 2706, 38);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Mercury', 0, 'Hermes', true, 3);
INSERT INTO public.planet VALUES (14, 'Venus', 0, 'Aphrodite', false, 3);
INSERT INTO public.planet VALUES (15, 'Earth', 1, 'Gaia', true, 3);
INSERT INTO public.planet VALUES (16, 'Mars', 2, 'Ares', true, 3);
INSERT INTO public.planet VALUES (17, 'Jupiter', 80, 'Zeus', true, 3);
INSERT INTO public.planet VALUES (18, 'Saturn', 83, 'Cronus', true, 3);
INSERT INTO public.planet VALUES (19, 'Uranus', 27, 'Caelus', true, 3);
INSERT INTO public.planet VALUES (20, 'Neptune', 14, 'Poseidon', true, 3);
INSERT INTO public.planet VALUES (21, 'TRAPPIST-1b', NULL, NULL, true, 5);
INSERT INTO public.planet VALUES (22, 'TRAPPIST-1c', NULL, NULL, true, 5);
INSERT INTO public.planet VALUES (23, 'TRAPPIST-1d', NULL, NULL, true, 5);
INSERT INTO public.planet VALUES (24, 'TRAPPIST-1e', NULL, NULL, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '70 Virginis', 1, 2, 2643);
INSERT INTO public.star VALUES (2, '61 Virginis', 3, 2, 1373);
INSERT INTO public.star VALUES (3, 'Sol', 8, 3, 1393);
INSERT INTO public.star VALUES (4, 'Barnards Star', 0, 3, 274);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 7, 3, 168);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 3, 3, 215);


--
-- Data for Name: star_sign; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_sign VALUES ('Virgo', 'Maiden', 1, NULL);
INSERT INTO public.star_sign VALUES ('Libra', 'Scales', 2, NULL);
INSERT INTO public.star_sign VALUES ('Aries', 'Ram', 3, NULL);
INSERT INTO public.star_sign VALUES ('Sagittarius', 'Archer', 4, NULL);
INSERT INTO public.star_sign VALUES ('Capricorn', 'Ram', 5, NULL);
INSERT INTO public.star_sign VALUES ('Aquarius', 'Water Bearer', 6, NULL);
INSERT INTO public.star_sign VALUES ('Pisces', 'Fish', 7, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_sign_star_sign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_sign_star_sign_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star_sign ruled_star_signs_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_sign
    ADD CONSTRAINT ruled_star_signs_name_key UNIQUE (name);


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
-- Name: star_sign star_sign_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_sign
    ADD CONSTRAINT star_sign_pkey PRIMARY KEY (star_sign_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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