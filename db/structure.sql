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
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bicycles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bicycles (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: bicycles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bicycles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bicycles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bicycles_id_seq OWNED BY public.bicycles.id;


--
-- Name: rims; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rims (
    id bigint NOT NULL,
    wheel_id bigint NOT NULL,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: rims_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.rims_id_seq OWNED BY public.rims.id;


--
-- Name: saddles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.saddles (
    id bigint NOT NULL,
    bicycle_id bigint NOT NULL,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: saddles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.saddles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: saddles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.saddles_id_seq OWNED BY public.saddles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: wheels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wheels (
    id bigint NOT NULL,
    bicycle_id bigint NOT NULL,
    size integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: wheels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wheels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wheels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wheels_id_seq OWNED BY public.wheels.id;


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: bicycles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycles ALTER COLUMN id SET DEFAULT nextval('public.bicycles_id_seq'::regclass);


--
-- Name: rims id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rims ALTER COLUMN id SET DEFAULT nextval('public.rims_id_seq'::regclass);


--
-- Name: saddles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saddles ALTER COLUMN id SET DEFAULT nextval('public.saddles_id_seq'::regclass);


--
-- Name: wheels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wheels ALTER COLUMN id SET DEFAULT nextval('public.wheels_id_seq'::regclass);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bicycles bicycles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bicycles
    ADD CONSTRAINT bicycles_pkey PRIMARY KEY (id);


--
-- Name: rims rims_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rims
    ADD CONSTRAINT rims_pkey PRIMARY KEY (id);


--
-- Name: saddles saddles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.saddles
    ADD CONSTRAINT saddles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: wheels wheels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wheels
    ADD CONSTRAINT wheels_pkey PRIMARY KEY (id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_rims_on_wheel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_rims_on_wheel_id ON public.rims USING btree (wheel_id);


--
-- Name: index_saddles_on_bicycle_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_saddles_on_bicycle_id ON public.saddles USING btree (bicycle_id);


--
-- Name: index_wheels_on_bicycle_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wheels_on_bicycle_id ON public.wheels USING btree (bicycle_id);


--
-- Name: index_wheels_on_size; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wheels_on_size ON public.wheels USING btree (size);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20210523185044'),
('20210523220397'),
('20210523220400'),
('20210523220405'),
('20210523220419');


