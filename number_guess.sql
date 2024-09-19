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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    uid integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_uid_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_uid_seq OWNER TO freecodecamp;

--
-- Name: players_uid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_uid_seq OWNED BY public.players.uid;


--
-- Name: players uid; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN uid SET DEFAULT nextval('public.players_uid_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (4, 'joshua', 4, 7);
INSERT INTO public.players VALUES (6, 'user_1726777448949', 2, 0);
INSERT INTO public.players VALUES (5, 'user_1726777448950', 5, 0);
INSERT INTO public.players VALUES (8, 'user_1726777505581', 2, 0);
INSERT INTO public.players VALUES (7, 'user_1726777505582', 5, 0);
INSERT INTO public.players VALUES (10, 'user_1726777580346', 2, 0);
INSERT INTO public.players VALUES (9, 'user_1726777580347', 5, 0);
INSERT INTO public.players VALUES (12, 'user_1726777660995', 2, 0);
INSERT INTO public.players VALUES (11, 'user_1726777660996', 5, 0);
INSERT INTO public.players VALUES (14, 'user_1726777662713', 2, 0);
INSERT INTO public.players VALUES (13, 'user_1726777662714', 5, 0);
INSERT INTO public.players VALUES (16, 'user_1726777664372', 2, 0);
INSERT INTO public.players VALUES (15, 'user_1726777664373', 5, 0);
INSERT INTO public.players VALUES (18, 'user_1726777678652', 2, 0);
INSERT INTO public.players VALUES (17, 'user_1726777678653', 5, 0);
INSERT INTO public.players VALUES (20, 'user_1726777685815', 2, 0);
INSERT INTO public.players VALUES (19, 'user_1726777685816', 5, 0);


--
-- Name: players_uid_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_uid_seq', 20, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (uid);


--
-- Name: players players_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

