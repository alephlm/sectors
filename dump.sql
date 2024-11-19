--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0

-- Started on 2024-11-07 16:53:53 EET

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
-- TOC entry 217 (class 1259 OID 16385)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id bigint NOT NULL,
    agree_to_terms boolean NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16390)
-- Name: employee_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_sectors (
    employee_id bigint NOT NULL,
    sector_id bigint NOT NULL
);


ALTER TABLE public.employee_sectors OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16400)
-- Name: employee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employee_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16395)
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sector (
    id bigint NOT NULL,
    description character varying(255)
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 16385)
-- Dependencies: 217
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (id, agree_to_terms, name) FROM stdin;
1	t	Test User
\.


--
-- TOC entry 3372 (class 0 OID 16390)
-- Dependencies: 218
-- Data for Name: employee_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_sectors (employee_id, sector_id) FROM stdin;
1	1
1	18
1	342
\.


--
-- TOC entry 3373 (class 0 OID 16395)
-- Dependencies: 219
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sector (id, description) FROM stdin;
1	Manufacturing
19	Construction materials
18	Electronics and Optics
6	Food and Beverage
342	Bakery & confectionery products
43	Beverages
42	Fish & fish products 
40	Meat & meat products
39	Milk & dairy products 
437	Other
378	Sweets & snack food
13	Furniture
389	Bathroom/sauna 
385	Bedroom
390	Children’s room 
98	Kitchen 
101	Living room 
392	Office
394	Other (Furniture)
341	Outdoor 
99	Project furniture
12	Machinery
94	Machinery components
91	Machinery equipment/tools
224	Manufacture of machinery 
97	Maritime
271	Aluminium and steel workboats 
269	Boat/Yacht building
230	Ship repair and conversion
93	Metal structures
508	Other
227	Repair and maintenance service
11	Metalworking
67	Construction of metal structures
263	Houses and buildings
267	Metal products
542	Metal works
75	CNC-machining
62	Forgings, Fasteners 
69	Gas, Plasma, Laser cutting
66	MIG, TIG, Aluminum welding
9	Plastic and Rubber
54	Packaging
556	Plastic goods
559	Plastic processing technology
55	Blowing
57	Moulding
53	Plastics welding and processing
560	Plastic profiles
5	Printing 
148	Advertising
150	Book/Periodicals printing
145	Labelling and packaging printing
7	Textile and Clothing
44	Clothing
45	Textile
8	Wood
337	Other (Wood)
51	Wooden building materials
47	Wooden houses
3	Other
37	Creative industries
29	Energy technology
33	Environment
2	Service
25	Business services
35	Engineering
28	Information Technology and Telecommunications
581	Data processing, Web portals, E-marketing
576	Programming, Consultancy
121	Software, Hardware
122	Telecommunications
22	Tourism
141	Translation services
21	Transport and Logistics
111	Air
114	Rail
112	Road
113	Water
\.


--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 220
-- Name: employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_seq', 1, true);


--
-- TOC entry 3219 (class 2606 OID 16389)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 16394)
-- Name: employee_sectors employee_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_sectors
    ADD CONSTRAINT employee_sectors_pkey PRIMARY KEY (employee_id, sector_id);


--
-- TOC entry 3223 (class 2606 OID 16399)
-- Name: sector sector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- TOC entry 3224 (class 2606 OID 16406)
-- Name: employee_sectors fk6q28h6313ancnuju77yhcrs9p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_sectors
    ADD CONSTRAINT fk6q28h6313ancnuju77yhcrs9p FOREIGN KEY (employee_id) REFERENCES public.employee(id);


--
-- TOC entry 3225 (class 2606 OID 16401)
-- Name: employee_sectors fk7saxhnu54xfefv1yiw88myp5a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_sectors
    ADD CONSTRAINT fk7saxhnu54xfefv1yiw88myp5a FOREIGN KEY (sector_id) REFERENCES public.sector(id);


-- Completed on 2024-11-07 16:53:53 EET

--
-- PostgreSQL database dump complete
--

