--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: uint2; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.uint2 AS integer
	CONSTRAINT uint2_check CHECK (((VALUE >= 0) AND (VALUE < 65536)));


ALTER DOMAIN public.uint2 OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gorm_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gorm_model (
    create_at timestamp without time zone,
    update_at timestamp without time zone,
    delete_at timestamp without time zone
);


ALTER TABLE public.gorm_model OWNER TO postgres;

--
-- Name: order_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_contacts (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    phone2 character varying(255),
    order_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.order_contacts OWNER TO postgres;

--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    pnr character varying(255),
    booking_code character varying(255),
    fare integer,
    agent_fare integer,
    baggage character varying(255),
    insurance integer,
    agent_insurance integer,
    order_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_passengers (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    ktp character varying(255),
    birth_date date,
    parent public.uint2,
    order_id public.uint2,
    user_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.order_passengers OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    type integer,
    invoice_id character varying(255),
    tickets character varying(255),
    contact_id integer,
    payment_method_id integer,
    expired_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    canceled_at timestamp without time zone,
    total_fare integer,
    discount integer,
    service_fee integer,
    final_fare integer,
    user_id integer
)
INHERITS (public.gorm_model);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: passengers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passengers (
    id integer NOT NULL,
    title character varying(255),
    name character varying(255),
    type character varying(255),
    id_number character varying(255),
    birth_date date,
    passport_id integer NOT NULL,
    user_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.passengers OWNER TO postgres;

--
-- Name: passports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passports (
    id integer NOT NULL,
    no character varying(255),
    nationally character varying(255),
    issuing_country character varying(255),
    expiry character varying(255),
    passenger_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.passports OWNER TO postgres;

--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_methods (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    account_number character varying(255),
    acount_owner character varying(255),
    type character varying(255)
)
INHERITS (public.gorm_model);


ALTER TABLE public.payment_methods OWNER TO postgres;

--
-- Name: schema_migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migration (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migration OWNER TO postgres;

--
-- Name: trips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trips (
    id integer NOT NULL,
    transport_name character varying(255) NOT NULL,
    trip_number character varying(255) NOT NULL,
    "from" character varying(255) NOT NULL,
    "to" character varying(255) NOT NULL,
    depart_time timestamp without time zone NOT NULL,
    arrival_time timestamp without time zone NOT NULL,
    has_meal boolean,
    order_item_id public.uint2
)
INHERITS (public.gorm_model);


ALTER TABLE public.trips OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    name character varying(255),
    role character varying(255),
    confirm_token character varying(255),
    confirmed boolean
)
INHERITS (public.gorm_model);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: order_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_contacts
    ADD CONSTRAINT order_contacts_pkey PRIMARY KEY (id);


--
-- Name: order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_passengers
    ADD CONSTRAINT order_passengers_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: passengers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);


--
-- Name: passports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passports
    ADD CONSTRAINT passports_pkey PRIMARY KEY (id);


--
-- Name: payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: trips_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: version_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX version_idx ON public.schema_migration USING btree (version);


--
-- Name: contact_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT contact_id_fk FOREIGN KEY (contact_id) REFERENCES public.order_contacts(id);


--
-- Name: orderid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT orderid_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orderid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_passengers
    ADD CONSTRAINT orderid_fk FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orderitemid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT orderitemid_fk FOREIGN KEY (order_item_id) REFERENCES public.order_items(id);


--
-- Name: passenger_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passports
    ADD CONSTRAINT passenger_id_fk FOREIGN KEY (passenger_id) REFERENCES public.passengers(id);


--
-- Name: payment_method_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT payment_method_fk FOREIGN KEY (payment_method_id) REFERENCES public.payment_methods(id);


--
-- Name: user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: userid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT userid_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

