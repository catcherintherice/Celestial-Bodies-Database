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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20),
    mean_distance_from_sun_au numeric(4,3) NOT NULL,
    date_discovered date NOT NULL,
    name_origin text NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    hubble_classification character varying(20),
    redshift numeric(7,6),
    radial_velocity_km_per_s integer NOT NULL,
    distance_from_earth_ly text NOT NULL
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
    name character varying(20),
    planet character varying(20) NOT NULL,
    planet_id integer,
    diameter_km real NOT NULL
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
    name character varying(20),
    star character varying(20) NOT NULL,
    star_id integer,
    has_moons boolean NOT NULL
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
    name character varying(30),
    system character varying(30),
    color character varying(20) NOT NULL,
    is_binary_star boolean,
    effective_temperature_k integer NOT NULL,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '1 Ceres', 2.766, '1801-01-01', 'Ceres, the Roman goddess of agriculture');
INSERT INTO public.asteroid VALUES (2, '2 Pallas', 2.773, '1802-03-28', 'Pallas, an epithet of the Greek goddess Athena');
INSERT INTO public.asteroid VALUES (3, '704 Interamnia', 3.062, '1910-10-02', 'the Latin name for Teramo, Italy, where Vincenzo Cerulli, the asteroid discoverer, worked');
INSERT INTO public.asteroid VALUES (4, '52 Europa', 3.095, '1858-02-04', 'Europa, one of Zeus''s conquests in Greek mythology');
INSERT INTO public.asteroid VALUES (5, '15 Eunomia', 2.643, '1851-07-29', 'Eunomia, one of the Horae (Hours), a personification of order and law in Greek mythology');
INSERT INTO public.asteroid VALUES (6, '31 Euphrosyne', 3.149, '1854-09-01', 'Euphrosyne, one of the Charites in Greek mythology');
INSERT INTO public.asteroid VALUES (7, '624 Hektor', 5.235, '1907-02-10', 'Trojan prince Hector, from Greek mythology');
INSERT INTO public.asteroid VALUES (8, '3 Juno', 2.672, '1804-09-01', 'mythological Juno, the highest Roman goddess');
INSERT INTO public.asteroid VALUES (9, '107 Camilla', 3.476, '1868-11-17', 'Camilla, Queen of the Volsci in Roman mythology');
INSERT INTO public.asteroid VALUES (10, '19 Fortuna', 2.442, '1852-08-22', 'Fortuna, the Roman goddess of luck');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral', -0.001004, -300, '2,557,066');
INSERT INTO public.galaxy VALUES (2, 'Bear paw', 'barred spiral', 0.001491, 447, '39,582,338');
INSERT INTO public.galaxy VALUES (3, 'Black eye', 'spiral', 0.001361, 408, '17,674,414');
INSERT INTO public.galaxy VALUES (4, 'Bode''s', 'spiral', -0.000113, -42, '11,986,247');
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'lenticular', 0.029764, 8790, '500,000,000');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'irregular', 0.000677, 219, '12,508,097');
INSERT INTO public.galaxy VALUES (7, 'Coma Pinwheel', 'spiral', 0.008029, 2404, '49,000,000');
INSERT INTO public.galaxy VALUES (8, 'Condor', 'barred spiral', 0.015194, 4614, '212,000,000');
INSERT INTO public.galaxy VALUES (9, 'Eye of Sauron', 'spiral', 0.003262, 956, '52,000,000');
INSERT INTO public.galaxy VALUES (10, 'Fireworks', 'spiral', 0.000133, 48, '22,000,000');
INSERT INTO public.galaxy VALUES (11, 'Malin 1', 'spiral', 0.082702, 24750, '1,190,000,000');
INSERT INTO public.galaxy VALUES (12, 'Messier 49', 'elliptical', 0.003326, 997, '52,380,714');
INSERT INTO public.galaxy VALUES (13, 'Caldwell 52', 'elliptical', 0.004044, 1210, '39,680,185');
INSERT INTO public.galaxy VALUES (14, 'Hercules A', 'elliptical', 0.154900, 42878, '2,100,000,000');
INSERT INTO public.galaxy VALUES (15, 'Maffei 1', 'elliptical', 0.000020, 6, '10,942,546');
INSERT INTO public.galaxy VALUES (16, 'Centaurus A', 'elliptical', 0.001830, 547, '10,000,000');
INSERT INTO public.galaxy VALUES (17, 'NeVe 1', 'elliptical', 0.028460, 8531, '411,000,000');
INSERT INTO public.galaxy VALUES (18, 'NGC 2787', 'lenticular', 0.002320, 695, '72,876,381');
INSERT INTO public.galaxy VALUES (19, 'NGC 3115', 'lenticular', 0.002222, 665, '33,525,614');
INSERT INTO public.galaxy VALUES (20, 'Milky Way', 'barred spiral', 0.000000, 552, '0');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 'Earth', 3, 3475);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Mars', 4, 12.6);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars', 4, 22.2);
INSERT INTO public.moon VALUES (4, 'Metis', 'Jupiter', 5, 43);
INSERT INTO public.moon VALUES (5, 'Adrastea', 'Jupiter', 5, 16.4);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'Jupiter', 5, 167);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Jupiter', 5, 5268.2);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Jupiter', 5, 4820.6);
INSERT INTO public.moon VALUES (9, 'Mimas', 'Saturn', 6, 396.4);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Saturn', 6, 504.2);
INSERT INTO public.moon VALUES (11, 'Tethys', 'Saturn', 6, 1062.2);
INSERT INTO public.moon VALUES (12, 'Daphnis', 'Saturn', 6, 7.8);
INSERT INTO public.moon VALUES (13, 'Atlas', 'Saturn', 6, 29.8);
INSERT INTO public.moon VALUES (14, 'Juliet', 'Uranus', 7, 94);
INSERT INTO public.moon VALUES (15, 'Portia', 'Uranus', 7, 135);
INSERT INTO public.moon VALUES (16, 'Rosalind', 'Uranus', 7, 72);
INSERT INTO public.moon VALUES (17, 'Cupid', 'Uranus', 7, 18);
INSERT INTO public.moon VALUES (18, 'Belinda', 'Uranus', 7, 90);
INSERT INTO public.moon VALUES (19, 'Hippocamp', 'Neptune', 8, 34.8);
INSERT INTO public.moon VALUES (20, 'Proteus', 'Neptune', 8, 420);
INSERT INTO public.moon VALUES (21, 'Triton', 'Neptune', 8, 2705.2);
INSERT INTO public.moon VALUES (22, 'Nereid', 'Neptune', 8, 357);
INSERT INTO public.moon VALUES (23, 'Halimede', 'Neptune', 8, 62);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The Sun', 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 'The Sun', 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The Sun', 1, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Proxima Centauri', 2, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 'Proxima Centauri', 2, true);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri d', 'Proxima Centauri', 2, false);
INSERT INTO public.planet VALUES (12, 'Barnard''s Star b', 'Barnard''s Star', 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'The Sun', 'Solar System', 'white', false, 5777, 20);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Alpha Centauri', 'red', true, 3040, 20);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 'Alpha Centauri', 'yellow', true, 5533, 20);
INSERT INTO public.star VALUES (4, 'Toliman', 'Alpha Centauri', 'orange to red', true, 3500, 20);
INSERT INTO public.star VALUES (5, 'Barnard''s Star', 'Ophiuchus', 'red', NULL, 3223, 20);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 'Luhman 16', 'brown', true, 1350, 20);
INSERT INTO public.star VALUES (7, 'Luhman 16 B', 'Luhman 16', 'brown', true, 1210, 20);
INSERT INTO public.star VALUES (8, 'GX Andromedae', 'Groombridge 34', 'red', true, 3601, 20);
INSERT INTO public.star VALUES (9, 'GQ Andromedae', 'Groombridge 34', 'red', true, 3304, 20);
INSERT INTO public.star VALUES (10, 'Sirius A', 'Alpha Canis Majoris', 'blue - white', true, 9940, 20);
INSERT INTO public.star VALUES (11, 'Sirius B', 'Alpha Canis Majoris', 'white', true, 25000, 20);
INSERT INTO public.star VALUES (12, 'Canopus', 'Carina', 'yellow to white', false, 7400, 20);
INSERT INTO public.star VALUES (13, 'Betelgeuse', 'Orion', 'red', false, 3600, 20);
INSERT INTO public.star VALUES (14, 'Tabby''s Star', 'Cygnus', 'yellow to white', true, 6000, 20);
INSERT INTO public.star VALUES (15, 'Pistol Star', 'Sagittarius', 'blue', NULL, 11800, 20);
INSERT INTO public.star VALUES (16, 'Altair', 'Aquila', 'blue - white', false, 7990, 20);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 20, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

