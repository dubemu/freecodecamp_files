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
    distance numeric(10,2),
    is_habitable boolean,
    name character varying(20) NOT NULL,
    founder text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    distance numeric(10,2),
    is_habitable boolean,
    name character varying(20) NOT NULL,
    founder text,
    integer1 integer,
    integer2 integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon2; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon2 (
    moon2_id integer NOT NULL,
    planet_id integer,
    distance numeric(10,2),
    is_habitable boolean,
    name character varying(20) NOT NULL,
    founder text
);


ALTER TABLE public.moon2 OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    distance numeric(10,2),
    is_habitable boolean,
    name character varying(20) NOT NULL,
    founder text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    distance numeric(10,2),
    is_habitable boolean,
    name character varying(20) NOT NULL,
    founder text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 100.00, true, 'galaxy_1', 'mike');
INSERT INTO public.galaxy VALUES (2, 200.00, true, 'galaxy_2', 'emma');
INSERT INTO public.galaxy VALUES (3, 150.00, false, 'galaxy_3', 'alex');
INSERT INTO public.galaxy VALUES (4, 300.00, true, 'galaxy_4', 'sara');
INSERT INTO public.galaxy VALUES (5, 250.00, false, 'galaxy_5', 'jack');
INSERT INTO public.galaxy VALUES (6, 400.00, true, 'galaxy_6', 'matt');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (13, 13, 5.50, true, 'moon_1', 'John', NULL, NULL);
INSERT INTO public.moon VALUES (14, 13, 7.20, false, 'moon_2', 'Alice', NULL, NULL);
INSERT INTO public.moon VALUES (15, 13, 9.80, true, 'moon_3', 'Michael', NULL, NULL);
INSERT INTO public.moon VALUES (16, 21, 11.40, false, 'moon_4', 'Emily', NULL, NULL);
INSERT INTO public.moon VALUES (17, 21, 13.90, true, 'moon_5', 'James', NULL, NULL);
INSERT INTO public.moon VALUES (18, 21, 15.30, false, 'moon_6', 'Sophia', NULL, NULL);
INSERT INTO public.moon VALUES (19, 14, 17.60, true, 'moon_7', 'William', NULL, NULL);
INSERT INTO public.moon VALUES (20, 14, 19.20, false, 'moon_8', 'Olivia', NULL, NULL);
INSERT INTO public.moon VALUES (21, 14, 21.80, true, 'moon_9', 'Daniel', NULL, NULL);
INSERT INTO public.moon VALUES (22, 15, 23.10, false, 'moon_10', 'Ava', NULL, NULL);
INSERT INTO public.moon VALUES (23, 16, 25.70, true, 'moon_11', 'Benjamin', NULL, NULL);
INSERT INTO public.moon VALUES (24, 17, 27.50, false, 'moon_12', 'Charlotte', NULL, NULL);
INSERT INTO public.moon VALUES (25, 13, 5.50, true, 'moon_21', 'John', NULL, NULL);
INSERT INTO public.moon VALUES (26, 13, 7.20, false, 'moon_22', 'Alice', NULL, NULL);
INSERT INTO public.moon VALUES (27, 13, 9.80, true, 'moon_23', 'Michael', NULL, NULL);
INSERT INTO public.moon VALUES (28, 21, 11.40, false, 'moon_24', 'Emily', NULL, NULL);
INSERT INTO public.moon VALUES (29, 21, 13.90, true, 'moon_25', 'James', NULL, NULL);
INSERT INTO public.moon VALUES (30, 21, 15.30, false, 'moon_26', 'Sophia', NULL, NULL);
INSERT INTO public.moon VALUES (31, 14, 17.60, true, 'moon_27', 'William', NULL, NULL);
INSERT INTO public.moon VALUES (32, 14, 19.20, false, 'moon_28', 'Olivia', NULL, NULL);
INSERT INTO public.moon VALUES (33, 14, 21.80, true, 'moon_29', 'Daniel', NULL, NULL);
INSERT INTO public.moon VALUES (34, 15, 23.10, false, 'moon_210', 'Ava', NULL, NULL);
INSERT INTO public.moon VALUES (35, 16, 25.70, true, 'moon_211', 'Benjamin', NULL, NULL);
INSERT INTO public.moon VALUES (36, 17, 27.50, false, 'moon_212', 'Charlotte', NULL, NULL);


--
-- Data for Name: moon2; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon2 VALUES (13, 13, 5.50, true, 'moon_1', 'John');
INSERT INTO public.moon2 VALUES (14, 13, 7.20, false, 'moon_2', 'Alice');
INSERT INTO public.moon2 VALUES (15, 13, 9.80, true, 'moon_3', 'Michael');
INSERT INTO public.moon2 VALUES (16, 21, 11.40, false, 'moon_4', 'Emily');
INSERT INTO public.moon2 VALUES (17, 21, 13.90, true, 'moon_5', 'James');
INSERT INTO public.moon2 VALUES (18, 21, 15.30, false, 'moon_6', 'Sophia');
INSERT INTO public.moon2 VALUES (19, 14, 17.60, true, 'moon_7', 'William');
INSERT INTO public.moon2 VALUES (20, 14, 19.20, false, 'moon_8', 'Olivia');
INSERT INTO public.moon2 VALUES (21, 14, 21.80, true, 'moon_9', 'Daniel');
INSERT INTO public.moon2 VALUES (22, 15, 23.10, false, 'moon_10', 'Ava');
INSERT INTO public.moon2 VALUES (23, 16, 25.70, true, 'moon_11', 'Benjamin');
INSERT INTO public.moon2 VALUES (24, 17, 27.50, false, 'moon_12', 'Charlotte');
INSERT INTO public.moon2 VALUES (25, 13, 5.50, true, 'moon_21', 'John');
INSERT INTO public.moon2 VALUES (26, 13, 7.20, false, 'moon_22', 'Alice');
INSERT INTO public.moon2 VALUES (27, 13, 9.80, true, 'moon_23', 'Michael');
INSERT INTO public.moon2 VALUES (28, 21, 11.40, false, 'moon_24', 'Emily');
INSERT INTO public.moon2 VALUES (29, 21, 13.90, true, 'moon_25', 'James');
INSERT INTO public.moon2 VALUES (30, 21, 15.30, false, 'moon_26', 'Sophia');
INSERT INTO public.moon2 VALUES (31, 14, 17.60, true, 'moon_27', 'William');
INSERT INTO public.moon2 VALUES (32, 14, 19.20, false, 'moon_28', 'Olivia');
INSERT INTO public.moon2 VALUES (33, 14, 21.80, true, 'moon_29', 'Daniel');
INSERT INTO public.moon2 VALUES (34, 15, 23.10, false, 'moon_210', 'Ava');
INSERT INTO public.moon2 VALUES (35, 16, 25.70, true, 'moon_211', 'Benjamin');
INSERT INTO public.moon2 VALUES (36, 17, 27.50, false, 'moon_212', 'Charlotte');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 1, 20.50, true, 'planet_1', 'John');
INSERT INTO public.planet VALUES (14, 1, 40.20, false, 'planet_2', 'Alice');
INSERT INTO public.planet VALUES (15, 1, 60.80, true, 'planet_3', 'Michael');
INSERT INTO public.planet VALUES (16, 2, 80.40, false, 'planet_4', 'Emily');
INSERT INTO public.planet VALUES (17, 2, 100.90, true, 'planet_5', 'James');
INSERT INTO public.planet VALUES (18, 2, 120.30, false, 'planet_6', 'Sophia');
INSERT INTO public.planet VALUES (19, 3, 140.60, true, 'planet_7', 'William');
INSERT INTO public.planet VALUES (20, 3, 160.20, false, 'planet_8', 'Olivia');
INSERT INTO public.planet VALUES (21, 3, 180.80, true, 'planet_9', 'Daniel');
INSERT INTO public.planet VALUES (22, 4, 200.10, false, 'planet_10', 'Ava');
INSERT INTO public.planet VALUES (23, 4, 220.70, true, 'planet_11', 'Benjamin');
INSERT INTO public.planet VALUES (24, 4, 240.50, false, 'planet_12', 'Charlotte');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 50.50, true, 'star_1', 'John');
INSERT INTO public.star VALUES (2, 1, 70.20, false, 'star_2', 'Alice');
INSERT INTO public.star VALUES (3, 1, 90.80, true, 'star_3', 'Michael');
INSERT INTO public.star VALUES (4, 2, 110.40, false, 'star_4', 'Emily');
INSERT INTO public.star VALUES (5, 2, 130.90, true, 'star_5', 'James');
INSERT INTO public.star VALUES (6, 2, 150.30, false, 'star_6', 'Sophia');
INSERT INTO public.star VALUES (7, 3, 170.60, true, 'star_7', 'William');
INSERT INTO public.star VALUES (8, 3, 190.20, false, 'star_8', 'Olivia');
INSERT INTO public.star VALUES (9, 3, 210.80, true, 'star_9', 'Daniel');
INSERT INTO public.star VALUES (10, 4, 230.10, false, 'star_10', 'Ava');
INSERT INTO public.star VALUES (11, 4, 250.70, true, 'star_11', 'Benjamin');
INSERT INTO public.star VALUES (12, 5, 270.50, false, 'star_12', 'Charlotte');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 36, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 1, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


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
-- Name: moon2 moon2_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon2
    ADD CONSTRAINT moon2_name_key UNIQUE (name);


--
-- Name: moon2 moon2_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon2
    ADD CONSTRAINT moon2_pkey PRIMARY KEY (moon2_id);


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

