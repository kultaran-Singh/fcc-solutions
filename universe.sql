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
-- Name: blackholes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackholes (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    blackholes_id integer NOT NULL
);


ALTER TABLE public.blackholes OWNER TO freecodecamp;

--
-- Name: blackholes_blackholes_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackholes_blackholes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackholes_blackholes_id_seq OWNER TO freecodecamp;

--
-- Name: blackholes_blackholes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackholes_blackholes_id_seq OWNED BY public.blackholes.blackholes_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    num_of_stars_in_billions integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_us_in_lightyears numeric(5,2),
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
    name character varying(30) NOT NULL,
    habitable boolean NOT NULL,
    description text,
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
    name character varying(30) NOT NULL,
    moon_id integer,
    star_id integer NOT NULL,
    habitable boolean NOT NULL,
    description text
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
    galaxy_id integer NOT NULL,
    num_of_planets integer NOT NULL,
    description text
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
-- Name: blackholes blackholes_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes ALTER COLUMN blackholes_id SET DEFAULT nextval('public.blackholes_blackholes_id_seq'::regclass);


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
-- Data for Name: blackholes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackholes VALUES ('Sagittarius A*', 1, 1);
INSERT INTO public.blackholes VALUES ('M31*', 2, 2);
INSERT INTO public.blackholes VALUES ('Cygnus X-1', 1, 3);
INSERT INTO public.blackholes VALUES ('Gaia BH1', 1, 4);
INSERT INTO public.blackholes VALUES ('V616 Monocerotis', 1, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 100, 'Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 1000, 'Andromeda', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 160, 'Whirlpool', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 350, 'Sombrero', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 700, 'Black Eye', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 1500, 'Centaurus A', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 'The Earths only natural satellite and the fifth-largest moon in the solar system', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'The larger and closer of the two natural satellites of Mars orbiting very low', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'The smaller and outermost of the two natural satellites of Mars resembling an asteroid', 2);
INSERT INTO public.moon VALUES (4, 'Io', false, 'The most geologically active object in the Solar System covered in active volcanoes', 5);
INSERT INTO public.moon VALUES (5, 'Europa', false, 'Features a smooth ice crust with a subsurface ocean that may harbor life', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 'The largest moon in the Solar System even larger than the planet Mercury', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 'The most heavily cratered object in the solar system composed of ice and rock', 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', false, 'The reddest object in the solar system orbiting very close to its host planet', 5);
INSERT INTO public.moon VALUES (9, 'Himalia', false, 'The largest of the irregular satellites discovered in 1904', 5);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 'Known for the giant Herschel crater giving it a Death Star appearance', 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', false, 'An icy moon with cryovolcanoes that spray water ice into space', 6);
INSERT INTO public.moon VALUES (12, 'Titan', false, 'The only moon with a thick atmosphere and liquid methane lakes on its surface', 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', false, 'Famous for its two-toned coloration and a massive equatorial mountain ridge', 6);
INSERT INTO public.moon VALUES (14, 'Rhea', false, 'The second-largest moon of its host composed mostly of water ice', 6);
INSERT INTO public.moon VALUES (15, 'Dione', false, 'A moon with bright ice cliffs and a heavily cratered trailing hemisphere', 6);
INSERT INTO public.moon VALUES (16, 'Miranda', false, 'Features a bizarre patchwork landscape of canyons and giant cliffs', 7);
INSERT INTO public.moon VALUES (17, 'Ariel', false, 'The brightest moon of its system covered in complex tectonic faults', 7);
INSERT INTO public.moon VALUES (18, 'Umbriel', false, 'The darkest of the major moons in its system heavily cratered', 7);
INSERT INTO public.moon VALUES (19, 'Titania', false, 'The largest moon of its host planet featuring vast fault valleys', 7);
INSERT INTO public.moon VALUES (20, 'Triton', false, 'A massive moon with a retrograde orbit and active nitrogen geysers', 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', NULL, 1, true, 'The third planet from the Sun and the only known planet to support life.');
INSERT INTO public.planet VALUES (2, 'Mars', NULL, 1, false, 'Known as the Red Planet, it features a thin atmosphere and the solar systems largest volcano.');
INSERT INTO public.planet VALUES (3, 'Mercury', NULL, 1, false, 'The smallest planet in our solar system and the closest to the Sun.');
INSERT INTO public.planet VALUES (4, 'Venus', NULL, 1, false, 'Earths twin in size, with a runaway greenhouse effect making it the hottest planet.');
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, 1, false, 'The largest planet in our solar system, a gas giant with a Great Red Spot.');
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, 1, false, 'A gas giant known for its extensive and bright planetary ring system.');
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 1, false, 'An ice giant that rotates on its side, appearing to roll around the Sun.');
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, 1, false, 'The most distant major planet, known for its deep blue color and supersonic winds.');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', NULL, 2, false, 'An Earth-sized exoplanet orbiting within the habitable zone of its star.');
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', NULL, 3, false, 'A potentially rocky planet in the habitable zone of its ultra-cool dwarf star.');
INSERT INTO public.planet VALUES (11, 'Kepler-90i', NULL, 4, false, 'A hot, rocky planet that orbits its star every 14.4 days, discovered using machine learning.');
INSERT INTO public.planet VALUES (12, '51 Pegasi b', NULL, 5, false, 'A gas giant known as a Hot Jupiter, the first exoplanet found orbiting a sun-like star.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 1, 8, 'The central star of our solar system and the primary source of energy for life on Earth');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3, 'The closest known star to the Sun, hosting at least one planet in the habitable zone');
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 7, 'An ultra-cool dwarf star famous for hosting seven Earth-sized temperate planets');
INSERT INTO public.star VALUES (4, 'Kepler-90', 1, 8, 'Notable for having the same number of known planets as our own solar system');
INSERT INTO public.star VALUES (5, '51 Pegasi', 1, 1, 'The first Sun-like star found to host an exoplanet, a "Hot Jupiter"');
INSERT INTO public.star VALUES (6, 'Kepler-11', 1, 6, 'A sun-like star with a tightly packed system of at least six planets larger than Earth');


--
-- Name: blackholes_blackholes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackholes_blackholes_id_seq', 5, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackholes blackholes_blackholes_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes
    ADD CONSTRAINT blackholes_blackholes_id_key UNIQUE (blackholes_id);


--
-- Name: blackholes blackholes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes
    ADD CONSTRAINT blackholes_pkey PRIMARY KEY (blackholes_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: blackholes blackholes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackholes
    ADD CONSTRAINT blackholes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


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

