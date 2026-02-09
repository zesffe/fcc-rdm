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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (44, 'f16', 2, 1);
INSERT INTO public.users VALUES (45, 'f17', 1, 1);
INSERT INTO public.users VALUES (24, 'f', 1, 2);
INSERT INTO public.users VALUES (47, 'user_1770596979986', 2, 6);
INSERT INTO public.users VALUES (26, 'user_1770595096255', 2, 0);
INSERT INTO public.users VALUES (46, 'user_1770596979987', 5, 6);
INSERT INTO public.users VALUES (25, 'user_1770595096256', 5, 0);
INSERT INTO public.users VALUES (28, 'user_1770595217985', 2, 0);
INSERT INTO public.users VALUES (27, 'user_1770595217986', 5, 0);
INSERT INTO public.users VALUES (29, 'f2', 1, 0);
INSERT INTO public.users VALUES (30, 'f3', 1, 0);
INSERT INTO public.users VALUES (31, 'F4', 0, 0);
INSERT INTO public.users VALUES (32, 'f5', 1, 0);
INSERT INTO public.users VALUES (33, 'f6', 1, 0);
INSERT INTO public.users VALUES (34, 'f7', 1, 0);
INSERT INTO public.users VALUES (35, 'f8', 0, 0);
INSERT INTO public.users VALUES (36, 'f9', 1, 0);
INSERT INTO public.users VALUES (37, 'f11', 1, 0);
INSERT INTO public.users VALUES (38, 'f12', 1, 0);
INSERT INTO public.users VALUES (40, 'user_1770596485146', 2, 0);
INSERT INTO public.users VALUES (39, 'user_1770596485147', 5, 0);
INSERT INTO public.users VALUES (41, 'f13', 1, 0);
INSERT INTO public.users VALUES (42, 'f14', 1, 1);
INSERT INTO public.users VALUES (23, 'cole', 4, 1);
INSERT INTO public.users VALUES (43, 'f15', 1, 1);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 47, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

