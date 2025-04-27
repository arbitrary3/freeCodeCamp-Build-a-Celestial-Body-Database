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
-- Name: extra; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.extra (
    c1 text,
    c2 boolean,
    c3 numeric(10,2) NOT NULL,
    extra_id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.extra OWNER TO freecodecamp;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.extra_extra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extra_extra_id_seq OWNER TO freecodecamp;

--
-- Name: extra_extra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.extra_extra_id_seq OWNED BY public.extra.extra_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    has_supermassive_black_hole boolean,
    number_of_stars integer,
    dominant_element character varying(30)
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
    type character varying(30) NOT NULL,
    is_geologically_active boolean NOT NULL,
    diameter_km integer NOT NULL,
    orbital_distance_km numeric(10,2) NOT NULL,
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
    name character varying(30),
    type character varying(30),
    has_atmosphere boolean NOT NULL,
    number_of_moons integer NOT NULL,
    orbital_distance_au numeric(10,1) NOT NULL,
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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    is_binary_system boolean NOT NULL,
    temperature_kelvin integer NOT NULL,
    mass_in_solar_masses_in_e12 numeric(10,1),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: extra extra_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra ALTER COLUMN extra_id SET DEFAULT nextval('public.extra_extra_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: extra; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.extra VALUES ('A', true, 10.23, 1, NULL);
INSERT INTO public.extra VALUES ('A', true, 10.23, 2, NULL);
INSERT INTO public.extra VALUES ('A', true, 10.23, 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxy', true, 250, 'Hydrogen');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxy', true, 1000, 'Hydrogen');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Galaxy', false, 40, 'Hydrogen');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Galaxy', true, 100, 'Helium');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy', true, 800, 'Hydrogen');
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Galaxy', false, 10, 'Hydrogen');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Natural Satellite', false, 3474, 384400.00, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Natural Satellite', false, 22, 9377.00, 2);
INSERT INTO public.moon VALUES (3, 'Deimo', 'Natural Satellite', false, 12, 23460.00, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Volcanic Moon', true, 3643, 421700.00, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 'Ice Moon', true, 3122, 671000.00, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Galilean Moon', false, 5268, 1070400.00, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Galielean Moon', false, 4820, 1883000.00, 3);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Inner Moon', false, 250, 181400.00, 3);
INSERT INTO public.moon VALUES (9, 'Titan', 'Gas Giant Moon', true, 5150, 420000.00, 4);
INSERT INTO public.moon VALUES (10, 'Kepler-22b I', 'Exomoons', false, 1500, 200000.00, 5);
INSERT INTO public.moon VALUES (11, 'Kepler-22b II', 'Exomoons', false, 1500, 200000.00, 5);
INSERT INTO public.moon VALUES (12, 'Proxima b I', 'Natural Satellite', false, 800, 60000.00, 6);
INSERT INTO public.moon VALUES (13, 'Phobos', 'Natural Satellite', false, 22, 9377.00, 2);
INSERT INTO public.moon VALUES (14, 'Deimo', 'Natural Satellite', false, 12, 23460.00, 2);
INSERT INTO public.moon VALUES (15, 'Io', 'Volcanic Moon', true, 3643, 421700.00, 3);
INSERT INTO public.moon VALUES (16, 'Europa', 'Ice Moon', true, 3122, 671000.00, 3);
INSERT INTO public.moon VALUES (17, 'Ganymede', 'Galilean Moon', false, 5268, 1070400.00, 3);
INSERT INTO public.moon VALUES (18, 'Callisto', 'Galielean Moon', false, 4820, 1883000.00, 3);
INSERT INTO public.moon VALUES (19, 'Amalthea', 'Inner Moon', false, 250, 181400.00, 3);
INSERT INTO public.moon VALUES (20, 'Amalthea', 'Inner Moon', false, 250, 181400.00, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestial Planet', true, 1, 1.0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial Planet', true, 2, 1.5, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', true, 92, 5.2, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial Planet', true, 0, 0.7, 1);
INSERT INTO public.planet VALUES (5, 'Kepler-22b', 'Exoplanet', true, 0, 0.9, 2);
INSERT INTO public.planet VALUES (6, 'Proxima b', 'Exoplanet', true, 0, 0.1, 5);
INSERT INTO public.planet VALUES (7, 'Sirius Ab', 'Exoplanet', true, 0, 2.6, 2);
INSERT INTO public.planet VALUES (8, 'Rigel I', 'Gas Giant', false, 3, 0.4, 4);
INSERT INTO public.planet VALUES (9, 'Betelgeuse I', 'Gas Giant', false, 1, 1.3, 3);
INSERT INTO public.planet VALUES (10, 'Vega II', 'Terrestrial Planets', true, 2, 2.1, 6);
INSERT INTO public.planet VALUES (11, 'Sun Minor', 'Dwarf Planet', true, 1, 0.9, 1);
INSERT INTO public.planet VALUES (12, 'Earth', 'Terrestial Planet', true, 1, 1.0, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type Main Sequence Star', false, 5778, 1.0, 1);
INSERT INTO public.star VALUES (2, 'Sirius A', 'A-type Main Sequence', true, 9940, 2.1, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red Supergiant', false, 3500, 20.0, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue Supergiant', false, 11000, 17.0, 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', true, 3042, 0.1, 2);
INSERT INTO public.star VALUES (6, 'Vega', 'A-type Main Sequence Star', false, 9602, 2.1, 2);


--
-- Name: extra_extra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.extra_extra_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 7, true);


--
-- Name: extra extra_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_id_unique UNIQUE (extra_id);


--
-- Name: extra extra_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extra
    ADD CONSTRAINT extra_pkey PRIMARY KEY (extra_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

