--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: orders; Type: TABLE; Schema: public; Owner: alexcode
--

CREATE TABLE public.orders (
    order_number integer NOT NULL,
    order_total_cost_ht numeric(10,2) NOT NULL,
    order_total_quantity integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    deliver_at timestamp without time zone,
    user_uuid uuid NOT NULL
);


ALTER TABLE public.orders OWNER TO alexcode;

--
-- Name: orders_order_number_seq; Type: SEQUENCE; Schema: public; Owner: alexcode
--

CREATE SEQUENCE public.orders_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_number_seq OWNER TO alexcode;

--
-- Name: orders_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexcode
--

ALTER SEQUENCE public.orders_order_number_seq OWNED BY public.orders.order_number;


--
-- Name: productbelongorder; Type: TABLE; Schema: public; Owner: alexcode
--

CREATE TABLE public.productbelongorder (
    product_uuid uuid NOT NULL,
    order_number integer NOT NULL
);


ALTER TABLE public.productbelongorder OWNER TO alexcode;

--
-- Name: productbelongorder_order_number_seq; Type: SEQUENCE; Schema: public; Owner: alexcode
--

CREATE SEQUENCE public.productbelongorder_order_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productbelongorder_order_number_seq OWNER TO alexcode;

--
-- Name: productbelongorder_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: alexcode
--

ALTER SEQUENCE public.productbelongorder_order_number_seq OWNED BY public.productbelongorder.order_number;


--
-- Name: products; Type: TABLE; Schema: public; Owner: alexcode
--

CREATE TABLE public.products (
    product_uuid uuid NOT NULL,
    product_name character varying(50) NOT NULL,
    product_description text,
    product_price numeric(10,2) NOT NULL,
    product_quantity smallint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    update_at timestamp without time zone
);


ALTER TABLE public.products OWNER TO alexcode;

--
-- Name: users; Type: TABLE; Schema: public; Owner: alexcode
--

CREATE TABLE public.users (
    user_uuid uuid NOT NULL,
    user_pseudo character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    user_password character varying(20) NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO alexcode;

--
-- Name: orders order_number; Type: DEFAULT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_number SET DEFAULT nextval('public.orders_order_number_seq'::regclass);


--
-- Name: productbelongorder order_number; Type: DEFAULT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.productbelongorder ALTER COLUMN order_number SET DEFAULT nextval('public.productbelongorder_order_number_seq'::regclass);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: alexcode
--

COPY public.orders (order_number, order_total_cost_ht, order_total_quantity, created_at, deliver_at, user_uuid) FROM stdin;
\.


--
-- Data for Name: productbelongorder; Type: TABLE DATA; Schema: public; Owner: alexcode
--

COPY public.productbelongorder (product_uuid, order_number) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: alexcode
--

COPY public.products (product_uuid, product_name, product_description, product_price, product_quantity, created_at, update_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: alexcode
--

COPY public.users (user_uuid, user_pseudo, username, user_password, created_at) FROM stdin;
87ae58fb-cb2f-40c5-afeb-86bae05b56d8	Sarette	scornelis0	dA9_gCBAP77M@f	2023-02-03 00:00:00
2aa0f9c5-d41d-49ac-b3a8-cebd52e28296	Ancell	aduerden1	hP6_'({7M	2022-12-02 00:00:00
4be96656-b302-43f5-84e4-2526d5bf5562	Ron	rgotcliffe2	mL9\\LGfYe`	2023-05-18 00:00:00
807c1444-1b49-4d35-8fa7-459c331c7350	Stacey	sstott3	yH9.fl's|HU`,3w	2023-08-23 00:00:00
98533ad3-6307-4e15-b177-b8b9cfa7a80d	Danica	dhyam4	kK0#{|Ul9|	2023-07-10 00:00:00
3cd6663f-30d9-48ef-aabb-c7f19dbace0f	Flinn	fmaginn5	dK2>#@c.yEg	2023-07-29 00:00:00
feaf31ee-e065-42fe-9877-e512b9d9bdaa	Josie	jroussel6	gK7_.~PA&	2023-08-02 00:00:00
d27963e4-e7d6-4263-94c8-c31f6afaf145	Amabel	akearn7	pW8`Iv`H`fcXh	2023-01-30 00:00:00
5d70244d-3775-45a4-952b-69b352989966	Cati	cmcquin8	mK9#d2%ZQ	2023-08-18 00:00:00
7659bfaa-4c49-4e3f-8dab-82d4c55bc220	Pansie	pyarker9	aC7<i?V2e_>v	2022-12-28 00:00:00
874c7f28-b56c-4ad0-a26f-da777e461541	Ingemar	iwaylena	zF5(e*GqOZ	2023-10-24 00:00:00
7e3fd07e-b43b-414d-9522-01e18ecb723f	Blithe	bduganb	qF4#MCol{e	2023-06-21 00:00:00
97d22829-7b0d-469d-b0dc-ab89bec74642	Clementius	claviellec	lZ6#qnE$M#Xo(H	2022-12-22 00:00:00
6f92a500-a401-4a03-97c0-67ea793a6f4e	Pepito	phullind	vQ8<v>@1asO}!D	2022-12-07 00:00:00
590ebc34-6838-4d0b-bcb2-4521b5d3f95f	Jess	jnelmese	iL7|u1Ck8Cyh@ZqX	2023-03-02 00:00:00
3b2dc3ad-2c89-41e6-a148-8dbc7c647035	Zena	zsavaryf	fI0%<nAg	2023-11-06 00:00:00
15a2045b-aa69-40d9-930f-0a3cf1f754ec	Abraham	alazenbyg	gE0.OwG9	2023-02-19 00:00:00
\.


--
-- Name: orders_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: alexcode
--

SELECT pg_catalog.setval('public.orders_order_number_seq', 1, false);


--
-- Name: productbelongorder_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: alexcode
--

SELECT pg_catalog.setval('public.productbelongorder_order_number_seq', 1, false);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_number);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_uuid);


--
-- Name: products products_product_name_key; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_name_key UNIQUE (product_name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_uuid);


--
-- Name: users users_user_pseudo_key; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_pseudo_key UNIQUE (user_pseudo);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: productbelongorder fk_orders; Type: FK CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.productbelongorder
    ADD CONSTRAINT fk_orders FOREIGN KEY (order_number) REFERENCES public.orders(order_number);


--
-- Name: productbelongorder fk_products; Type: FK CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.productbelongorder
    ADD CONSTRAINT fk_products FOREIGN KEY (product_uuid) REFERENCES public.products(product_uuid);


--
-- Name: orders fk_users; Type: FK CONSTRAINT; Schema: public; Owner: alexcode
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_users FOREIGN KEY (user_uuid) REFERENCES public.users(user_uuid);


--
-- PostgreSQL database dump complete
--

