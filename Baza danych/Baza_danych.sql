--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-21 20:16:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 220 (class 1259 OID 32783)
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."character" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    gender character(1) NOT NULL,
    dob date NOT NULL,
    money integer NOT NULL,
    bank integer NOT NULL,
    job character varying(50) NOT NULL,
    created_ad timestamp with time zone NOT NULL,
    kraj_pochodzenia character varying(50) NOT NULL
);


ALTER TABLE public."character" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 32782)
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.character_id_seq OWNER TO postgres;

--
-- TOC entry 4914 (class 0 OID 0)
-- Dependencies: 219
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_id_seq OWNED BY public."character".id;


--
-- TOC entry 228 (class 1259 OID 32876)
-- Name: faction_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faction_members (
    id integer NOT NULL,
    faction_id integer NOT NULL,
    ranks character varying(50) NOT NULL
);


ALTER TABLE public.faction_members OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 32875)
-- Name: faction_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faction_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faction_members_id_seq OWNER TO postgres;

--
-- TOC entry 4915 (class 0 OID 0)
-- Dependencies: 227
-- Name: faction_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faction_members_id_seq OWNED BY public.faction_members.id;


--
-- TOC entry 225 (class 1259 OID 32837)
-- Name: factions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.factions (
    id integer NOT NULL,
    name_org_gng character varying(50) NOT NULL,
    type_org_gng boolean NOT NULL,
    funds integer NOT NULL,
    created_at date NOT NULL
);


ALTER TABLE public.factions OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 32836)
-- Name: factions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.factions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.factions_id_seq OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 224
-- Name: factions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.factions_id_seq OWNED BY public.factions.id;


--
-- TOC entry 223 (class 1259 OID 32827)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    character_id integer NOT NULL,
    item_name character varying(50) NOT NULL,
    item_count integer NOT NULL,
    container real NOT NULL,
    container_id integer,
    id integer NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32843)
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inventory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventory_id_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 226
-- Name: inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inventory_id_seq OWNED BY public.inventory.id;


--
-- TOC entry 230 (class 1259 OID 32888)
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    actions text,
    created_at date NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32887)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_id_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 229
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 218 (class 1259 OID 32775)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    identifier character varying(50) NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(50),
    last_login timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32774)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 222 (class 1259 OID 32816)
-- Name: vehicles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    character_id integer NOT NULL,
    plate character varying(7) NOT NULL,
    model character varying(20) NOT NULL,
    garage character varying(20) NOT NULL,
    fuel real NOT NULL,
    engine_health real NOT NULL,
    body_health real NOT NULL,
    owned_at date NOT NULL
);


ALTER TABLE public.vehicles OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32815)
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicles_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 221
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- TOC entry 4726 (class 2604 OID 32786)
-- Name: character id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character" ALTER COLUMN id SET DEFAULT nextval('public.character_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 32879)
-- Name: faction_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faction_members ALTER COLUMN id SET DEFAULT nextval('public.faction_members_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 32840)
-- Name: factions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factions ALTER COLUMN id SET DEFAULT nextval('public.factions_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 32844)
-- Name: inventory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory ALTER COLUMN id SET DEFAULT nextval('public.inventory_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 32891)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 4725 (class 2604 OID 32778)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 32819)
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- TOC entry 4898 (class 0 OID 32783)
-- Dependencies: 220
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."character" (id, user_id, firstname, lastname, gender, dob, money, bank, job, created_ad, kraj_pochodzenia) FROM stdin;
1	1	Mark	Smith	M	1990-05-10	500	2000	policjant	2025-01-01 12:30:00+01	USA
2	1	Mike	Johnson	M	1985-08-15	300	1000	mechanik	2025-01-02 10:00:00+01	Kanada
3	2	John	Doe	M	1995-04-20	700	3000	lekarz	2025-01-03 09:00:00+01	Wielka Brytania
\.


--
-- TOC entry 4906 (class 0 OID 32876)
-- Dependencies: 228
-- Data for Name: faction_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faction_members (id, faction_id, ranks) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 32837)
-- Dependencies: 225
-- Data for Name: factions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.factions (id, name_org_gng, type_org_gng, funds, created_at) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 32827)
-- Dependencies: 223
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventory (character_id, item_name, item_count, container, container_id, id) FROM stdin;
\.


--
-- TOC entry 4908 (class 0 OID 32888)
-- Dependencies: 230
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (id, actions, created_at) FROM stdin;
\.


--
-- TOC entry 4896 (class 0 OID 32775)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, identifier, username, email, last_login, created_at) FROM stdin;
1	steam:11000010101	JohnDoe	john@interia.eu	2025-01-10 14:20:00+01	2025-01-01 12:00:00+01
2	steam:11000010102	MarkSmith	jane@gmail.com	2025-01-09 18:45:00+01	2025-01-02 13:00:00+01
\.


--
-- TOC entry 4900 (class 0 OID 32816)
-- Dependencies: 222
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicles (id, character_id, plate, model, garage, fuel, engine_health, body_health, owned_at) FROM stdin;
1	1	ABC123	sultan	Centrum	80	950	900	2025-01-05
2	1	XYZ987	elegy	Centrum	100	1000	1000	2025-01-06
3	3	JKL456	buffalo	Warsztat	60	850	800	2025-01-07
\.


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 219
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_id_seq', 3, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 227
-- Name: faction_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faction_members_id_seq', 1, false);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 224
-- Name: factions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.factions_id_seq', 1, false);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 226
-- Name: inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inventory_id_seq', 1, false);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 229
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 221
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicles_id_seq', 3, true);


--
-- TOC entry 4735 (class 2606 OID 32788)
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 32881)
-- Name: faction_members faction_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faction_members
    ADD CONSTRAINT faction_members_pkey PRIMARY KEY (id);


--
-- TOC entry 4741 (class 2606 OID 32842)
-- Name: factions factions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.factions
    ADD CONSTRAINT factions_pkey PRIMARY KEY (id);


--
-- TOC entry 4739 (class 2606 OID 32846)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 32895)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 32780)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 32821)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- TOC entry 4746 (class 2606 OID 32789)
-- Name: character character_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4749 (class 2606 OID 32882)
-- Name: faction_members faction_members_faction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faction_members
    ADD CONSTRAINT faction_members_faction_id_fkey FOREIGN KEY (faction_id) REFERENCES public.factions(id);


--
-- TOC entry 4748 (class 2606 OID 32830)
-- Name: inventory inventory_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);


--
-- TOC entry 4747 (class 2606 OID 32822)
-- Name: vehicles vehicles_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_character_id_fkey FOREIGN KEY (character_id) REFERENCES public."character"(id);


-- Completed on 2025-01-21 20:16:27

--
-- PostgreSQL database dump complete
--

