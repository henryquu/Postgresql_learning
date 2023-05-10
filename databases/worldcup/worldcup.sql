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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (97, 2018, 'Final', 195, 196, 4, 2);
INSERT INTO public.games VALUES (98, 2018, 'Third Place', 197, 198, 2, 0);
INSERT INTO public.games VALUES (99, 2018, 'Semi-Final', 196, 198, 2, 1);
INSERT INTO public.games VALUES (100, 2018, 'Semi-Final', 195, 197, 1, 0);
INSERT INTO public.games VALUES (101, 2018, 'Quarter-Final', 196, 204, 3, 2);
INSERT INTO public.games VALUES (102, 2018, 'Quarter-Final', 198, 206, 2, 0);
INSERT INTO public.games VALUES (103, 2018, 'Quarter-Final', 197, 208, 2, 1);
INSERT INTO public.games VALUES (104, 2018, 'Quarter-Final', 195, 210, 2, 0);
INSERT INTO public.games VALUES (105, 2018, 'Eighth-Final', 198, 212, 2, 1);
INSERT INTO public.games VALUES (106, 2018, 'Eighth-Final', 206, 214, 1, 0);
INSERT INTO public.games VALUES (107, 2018, 'Eighth-Final', 197, 216, 3, 2);
INSERT INTO public.games VALUES (108, 2018, 'Eighth-Final', 208, 218, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Eighth-Final', 196, 220, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Eighth-Final', 204, 222, 2, 1);
INSERT INTO public.games VALUES (111, 2018, 'Eighth-Final', 210, 224, 2, 1);
INSERT INTO public.games VALUES (112, 2018, 'Eighth-Final', 195, 226, 4, 3);
INSERT INTO public.games VALUES (113, 2014, 'Final', 227, 226, 1, 0);
INSERT INTO public.games VALUES (114, 2014, 'Third Place', 229, 208, 3, 0);
INSERT INTO public.games VALUES (115, 2014, 'Semi-Final', 226, 229, 1, 0);
INSERT INTO public.games VALUES (116, 2014, 'Semi-Final', 227, 208, 7, 1);
INSERT INTO public.games VALUES (117, 2014, 'Quarter-Final', 229, 236, 1, 0);
INSERT INTO public.games VALUES (118, 2014, 'Quarter-Final', 226, 197, 1, 0);
INSERT INTO public.games VALUES (119, 2014, 'Quarter-Final', 208, 212, 2, 1);
INSERT INTO public.games VALUES (120, 2014, 'Quarter-Final', 227, 195, 1, 0);
INSERT INTO public.games VALUES (121, 2014, 'Eighth-Final', 208, 244, 2, 1);
INSERT INTO public.games VALUES (122, 2014, 'Eighth-Final', 212, 210, 2, 0);
INSERT INTO public.games VALUES (123, 2014, 'Eighth-Final', 195, 248, 2, 0);
INSERT INTO public.games VALUES (124, 2014, 'Eighth-Final', 227, 250, 2, 1);
INSERT INTO public.games VALUES (125, 2014, 'Eighth-Final', 229, 218, 2, 1);
INSERT INTO public.games VALUES (126, 2014, 'Eighth-Final', 236, 254, 2, 1);
INSERT INTO public.games VALUES (127, 2014, 'Eighth-Final', 226, 214, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Eighth-Final', 197, 258, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (195, 'France');
INSERT INTO public.teams VALUES (196, 'Croatia');
INSERT INTO public.teams VALUES (197, 'Belgium');
INSERT INTO public.teams VALUES (198, 'England');
INSERT INTO public.teams VALUES (204, 'Russia');
INSERT INTO public.teams VALUES (206, 'Sweden');
INSERT INTO public.teams VALUES (208, 'Brazil');
INSERT INTO public.teams VALUES (210, 'Uruguay');
INSERT INTO public.teams VALUES (212, 'Colombia');
INSERT INTO public.teams VALUES (214, 'Switzerland');
INSERT INTO public.teams VALUES (216, 'Japan');
INSERT INTO public.teams VALUES (218, 'Mexico');
INSERT INTO public.teams VALUES (220, 'Denmark');
INSERT INTO public.teams VALUES (222, 'Spain');
INSERT INTO public.teams VALUES (224, 'Portugal');
INSERT INTO public.teams VALUES (226, 'Argentina');
INSERT INTO public.teams VALUES (227, 'Germany');
INSERT INTO public.teams VALUES (229, 'Netherlands');
INSERT INTO public.teams VALUES (236, 'Costa Rica');
INSERT INTO public.teams VALUES (244, 'Chile');
INSERT INTO public.teams VALUES (248, 'Nigeria');
INSERT INTO public.teams VALUES (250, 'Algeria');
INSERT INTO public.teams VALUES (254, 'Greece');
INSERT INTO public.teams VALUES (258, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 128, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 258, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

