--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE app;
ALTER ROLE app WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:GMxI4ElFs+eXXFAjM+W1qQ==$Nv5h0pstgifbPvgDbCExhUGJuBNyH3kuYOssHFsWiNU=:ze78gQuc73SL1u0rbKB5pK+5FmSIWH/RbUlSHiRK6QI=';
CREATE ROLE homepage;
ALTER ROLE homepage WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ltEKEv+5LUdm347a9kuJ6w==$GYl6pPSRDirMK5Zqtdox+NY39fQ6/0894Q/X4JP35L8=:VhGHT4/aN98r8e+1omoro6IYLFk5HNPTgxdAy2D6TNI=';
COMMENT ON ROLE homepage IS 'www-beg user';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:nEITxndJGr1XyzLuEQhasA==$4Y/ePBgjqLOBK8+T9tsWAMzdGqOOdtma7XkRIZ7bXI0=:/1WciJtqOla1UfJ3jy9r7t+SyW5UDxr55rzACrk50+0=';
CREATE ROLE self_service;
ALTER ROLE self_service WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:JOF7Y9ADNe1Ua3OCIwieuw==$hJaGvynNfiT3qtzyFHiMsDce3DXk7Qo/uxqxM54BOqE=:Et49jnQ3mf+IxZL2vjLZkvr5OsLd74Se0d2ANLWmfss=';
COMMENT ON ROLE self_service IS 'self-service user';
CREATE ROLE streaming_replica;
ALTER ROLE streaming_replica WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
COMMENT ON ROLE streaming_replica IS 'Special user for streaming replication created by CloudNativePG';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "app" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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

--
-- Name: app; Type: DATABASE; Schema: -; Owner: app
--

CREATE DATABASE app WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE app OWNER TO app;

\connect app

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

--
-- PostgreSQL database dump complete
--

--
-- Database "homepage" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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

--
-- Name: homepage; Type: DATABASE; Schema: -; Owner: app
--

CREATE DATABASE homepage WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE homepage OWNER TO app;

\connect homepage

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

--
-- Name: plant_json; Type: TYPE; Schema: public; Owner: homepage
--

CREATE TYPE public.plant_json AS (
	plant_name character varying,
	operational boolean,
	capacity integer,
	production integer,
	"timestamp" bigint
);


ALTER TYPE public.plant_json OWNER TO homepage;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO homepage;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO homepage;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO homepage;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO homepage;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO homepage;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO homepage;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO homepage;

--
-- Name: power_generation; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.power_generation (
    id bigint NOT NULL,
    plant_name character varying,
    operational boolean,
    capacity integer,
    production integer,
    "timestamp" bigint
);


ALTER TABLE public.power_generation OWNER TO homepage;

--
-- Name: current_power_generation; Type: VIEW; Schema: public; Owner: homepage
--

CREATE VIEW public.current_power_generation AS
 SELECT DISTINCT ON (plant_name) id,
    plant_name,
    operational,
    capacity,
    production,
    "timestamp"
   FROM public.power_generation
  ORDER BY plant_name, "timestamp" DESC;


ALTER VIEW public.current_power_generation OWNER TO homepage;

--
-- Name: occams_cms_categories; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_categories (
    id bigint NOT NULL,
    site_id integer NOT NULL,
    label character varying NOT NULL,
    categorized_type character varying NOT NULL
);


ALTER TABLE public.occams_cms_categories OWNER TO homepage;

--
-- Name: occams_cms_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_categories_id_seq OWNER TO homepage;

--
-- Name: occams_cms_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_categories_id_seq OWNED BY public.occams_cms_categories.id;


--
-- Name: occams_cms_categorizations; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_categorizations (
    id bigint NOT NULL,
    category_id integer NOT NULL,
    categorized_type character varying NOT NULL,
    categorized_id integer NOT NULL
);


ALTER TABLE public.occams_cms_categorizations OWNER TO homepage;

--
-- Name: occams_cms_categorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_categorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_categorizations_id_seq OWNER TO homepage;

--
-- Name: occams_cms_categorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_categorizations_id_seq OWNED BY public.occams_cms_categorizations.id;


--
-- Name: occams_cms_files; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_files (
    id bigint NOT NULL,
    site_id integer NOT NULL,
    label character varying DEFAULT ''::character varying NOT NULL,
    description text,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_files OWNER TO homepage;

--
-- Name: occams_cms_files_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_files_id_seq OWNER TO homepage;

--
-- Name: occams_cms_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_files_id_seq OWNED BY public.occams_cms_files.id;


--
-- Name: occams_cms_fragments; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_fragments (
    id bigint NOT NULL,
    record_type character varying,
    record_id bigint,
    identifier character varying NOT NULL,
    tag character varying DEFAULT 'text'::character varying NOT NULL,
    content text,
    "boolean" boolean DEFAULT false NOT NULL,
    datetime timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_fragments OWNER TO homepage;

--
-- Name: occams_cms_fragments_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_fragments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_fragments_id_seq OWNER TO homepage;

--
-- Name: occams_cms_fragments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_fragments_id_seq OWNED BY public.occams_cms_fragments.id;


--
-- Name: occams_cms_layouts; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_layouts (
    id bigint NOT NULL,
    site_id integer NOT NULL,
    parent_id integer,
    app_layout character varying,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    content text,
    css text,
    js text,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_layouts OWNER TO homepage;

--
-- Name: occams_cms_layouts_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_layouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_layouts_id_seq OWNER TO homepage;

--
-- Name: occams_cms_layouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_layouts_id_seq OWNED BY public.occams_cms_layouts.id;


--
-- Name: occams_cms_pages; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_pages (
    id bigint NOT NULL,
    site_id integer NOT NULL,
    layout_id integer,
    parent_id integer,
    target_page_id integer,
    label character varying NOT NULL,
    slug character varying,
    full_path character varying NOT NULL,
    content_cache text,
    "position" integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_pages OWNER TO homepage;

--
-- Name: occams_cms_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_pages_id_seq OWNER TO homepage;

--
-- Name: occams_cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_pages_id_seq OWNED BY public.occams_cms_pages.id;


--
-- Name: occams_cms_revisions; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_revisions (
    id bigint NOT NULL,
    record_type character varying NOT NULL,
    record_id integer NOT NULL,
    data text,
    created_at timestamp without time zone
);


ALTER TABLE public.occams_cms_revisions OWNER TO homepage;

--
-- Name: occams_cms_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_revisions_id_seq OWNER TO homepage;

--
-- Name: occams_cms_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_revisions_id_seq OWNED BY public.occams_cms_revisions.id;


--
-- Name: occams_cms_sites; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_sites (
    id bigint NOT NULL,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    hostname character varying NOT NULL,
    path character varying,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_sites OWNER TO homepage;

--
-- Name: occams_cms_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_sites_id_seq OWNER TO homepage;

--
-- Name: occams_cms_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_sites_id_seq OWNED BY public.occams_cms_sites.id;


--
-- Name: occams_cms_snippets; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_snippets (
    id bigint NOT NULL,
    site_id integer NOT NULL,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    markdown boolean,
    content text,
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_snippets OWNER TO homepage;

--
-- Name: occams_cms_snippets_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_snippets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_snippets_id_seq OWNER TO homepage;

--
-- Name: occams_cms_snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_snippets_id_seq OWNED BY public.occams_cms_snippets.id;


--
-- Name: occams_cms_translations; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.occams_cms_translations (
    id bigint NOT NULL,
    locale character varying NOT NULL,
    page_id integer NOT NULL,
    layout_id integer,
    label character varying NOT NULL,
    content_cache text,
    is_published boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.occams_cms_translations OWNER TO homepage;

--
-- Name: occams_cms_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.occams_cms_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.occams_cms_translations_id_seq OWNER TO homepage;

--
-- Name: occams_cms_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.occams_cms_translations_id_seq OWNED BY public.occams_cms_translations.id;


--
-- Name: power_generation_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.power_generation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.power_generation_id_seq OWNER TO homepage;

--
-- Name: power_generation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.power_generation_id_seq OWNED BY public.power_generation.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    title character varying,
    description text,
    cost integer,
    begin_at timestamp(6) without time zone,
    end_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.projects OWNER TO homepage;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO homepage;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO homepage;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: homepage
--

CREATE TABLE public.subscriptions (
    id bigint NOT NULL,
    email character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.subscriptions OWNER TO homepage;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: homepage
--

CREATE SEQUENCE public.subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscriptions_id_seq OWNER TO homepage;

--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: homepage
--

ALTER SEQUENCE public.subscriptions_id_seq OWNED BY public.subscriptions.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: occams_cms_categories id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_categories ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_categories_id_seq'::regclass);


--
-- Name: occams_cms_categorizations id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_categorizations ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_categorizations_id_seq'::regclass);


--
-- Name: occams_cms_files id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_files ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_files_id_seq'::regclass);


--
-- Name: occams_cms_fragments id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_fragments ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_fragments_id_seq'::regclass);


--
-- Name: occams_cms_layouts id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_layouts ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_layouts_id_seq'::regclass);


--
-- Name: occams_cms_pages id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_pages ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_pages_id_seq'::regclass);


--
-- Name: occams_cms_revisions id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_revisions ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_revisions_id_seq'::regclass);


--
-- Name: occams_cms_sites id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_sites ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_sites_id_seq'::regclass);


--
-- Name: occams_cms_snippets id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_snippets ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_snippets_id_seq'::regclass);


--
-- Name: occams_cms_translations id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_translations ALTER COLUMN id SET DEFAULT nextval('public.occams_cms_translations_id_seq'::regclass);


--
-- Name: power_generation id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.power_generation ALTER COLUMN id SET DEFAULT nextval('public.power_generation_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: subscriptions id; Type: DEFAULT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.subscriptions ALTER COLUMN id SET DEFAULT nextval('public.subscriptions_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2025-05-01 11:23:35.248421	2025-05-01 11:23:35.248425
\.


--
-- Data for Name: occams_cms_categories; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_categories (id, site_id, label, categorized_type) FROM stdin;
\.


--
-- Data for Name: occams_cms_categorizations; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_categorizations (id, category_id, categorized_type, categorized_id) FROM stdin;
\.


--
-- Data for Name: occams_cms_files; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_files (id, site_id, label, description, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: occams_cms_fragments; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_fragments (id, record_type, record_id, identifier, tag, content, "boolean", datetime, created_at, updated_at) FROM stdin;
1	Occams::Cms::Page	1	title	text	--- Berylian Energy Group\n	f	\N	2025-05-01 11:23:38.656499	2025-05-01 11:23:38.656499
2	Occams::Cms::Page	2	title	text	--- 'Completed Projects\n\n  '\n	f	\N	2025-05-01 11:23:38.686874	2025-05-01 11:23:38.686874
3	Occams::Cms::Page	2	content	wysiwyg	--- |-\n  <h1>Our infrastructure projects</h1>\n  <%= render "projects/index", projects: ::Project.all %>\n	f	\N	2025-05-01 11:23:38.68791	2025-05-01 11:23:38.68791
\.


--
-- Data for Name: occams_cms_layouts; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_layouts (id, site_id, parent_id, app_layout, label, identifier, content, css, js, "position", created_at, updated_at) FROM stdin;
1	1	\N	application	Main	main	<!DOCTYPE html>\n<html lang="en">\n\t<head>\n  \t<meta charset="utf-8">\n  \t<meta content="width=device-width, initial-scale=1.0" name="viewport">\n\t  <title>{{ cms:text title }}</title>\n  \t{{ cms:partial "main/head" }}\n  </head>\n<body>\n\t{{ cms:partial "main/header" }}\n  {{ cms:wysiwyg content }}\n  {{ cms:partial "main/footer" }}\n</body>\n</html>\n	/**\n* Template Name: Green\n* Updated: Sep 18 2023 with Bootstrap v5.3.2\n* Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/\n* Author: BootstrapMade.com\n* License: https://bootstrapmade.com/license/\n*/\n\n/*--------------------------------------------------------------\n# General\n--------------------------------------------------------------*/\nbody {\n  font-family: "Open Sans", sans-serif;\n  color: #444444;\n}\n\na {\n  text-decoration: none;\n  color: #5cb874;\n}\n\na:hover {\n  color: #80c792;\n  text-decoration: none;\n}\n\nh1,\nh2,\nh3,\nh4,\nh5,\nh6 {\n  font-family: "Raleway", sans-serif;\n}\n\n/*--------------------------------------------------------------\n# Back to top button\n--------------------------------------------------------------*/\n.back-to-top {\n  position: fixed;\n  visibility: hidden;\n  opacity: 0;\n  right: 15px;\n  bottom: 15px;\n  z-index: 996;\n  background: #5cb874;\n  width: 40px;\n  height: 40px;\n  border-radius: 4px;\n  transition: all 0.4s;\n}\n\n.back-to-top i {\n  font-size: 24px;\n  color: #fff;\n  line-height: 0;\n}\n\n.back-to-top:hover {\n  background: #78c48c;\n  color: #fff;\n}\n\n.back-to-top.active {\n  visibility: visible;\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Top Bar\n--------------------------------------------------------------*/\n#topbar {\n  background: #fbfbfb;\n  font-size: 15px;\n  height: 40px;\n  padding: 0;\n}\n\n#topbar .contact-info a {\n  line-height: 0;\n  color: #444444;\n  transition: 0.3s;\n}\n\n#topbar .contact-info a:hover {\n  color: #5cb874;\n}\n\n#topbar .contact-info i {\n  color: #5cb874;\n  line-height: 0;\n  margin-right: 5px;\n}\n\n#topbar .contact-info .phone-icon {\n  margin-left: 15px;\n}\n\n#topbar .social-links a {\n  color: #6f6f6f;\n  padding: 4px 12px;\n  display: inline-block;\n  line-height: 1px;\n  transition: 0.3s;\n}\n\n#topbar .social-links a:hover {\n  color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Header\n--------------------------------------------------------------*/\n#header {\n  background: #fff;\n  transition: all 0.5s;\n  z-index: 997;\n  height: 70px;\n}\n\n#header.header-scrolled {\n  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);\n}\n\n#header .logo {\n  font-size: 30px;\n  margin: 0;\n  padding: 0;\n  line-height: 1;\n  font-weight: 700;\n  letter-spacing: 1px;\n  text-transform: uppercase;\n}\n\n#header .logo a {\n  color: #5cb874;\n}\n\n#header .logo img {\n  max-height: 40px;\n}\n\n.scrolled-offset {\n  margin-top: 70px;\n}\n\n/*--------------------------------------------------------------\n# Navigation Menu\n--------------------------------------------------------------*/\n/**\n* Desktop Navigation\n*/\n.navbar {\n  padding: 0;\n}\n\n.navbar ul {\n  margin: 0;\n  padding: 0;\n  display: flex;\n  list-style: none;\n  align-items: center;\n}\n\n.navbar li {\n  position: relative;\n}\n\n.navbar a,\n.navbar a:focus {\n  display: flex;\n  align-items: center;\n  justify-content: space-between;\n  padding: 10px 0 10px 30px;\n  font-size: 15px;\n  color: #222222;\n  white-space: nowrap;\n  transition: 0.3s;\n}\n\n.navbar a i,\n.navbar a:focus i {\n  font-size: 12px;\n  line-height: 0;\n  margin-left: 5px;\n}\n\n.navbar a:hover,\n.navbar .active,\n.navbar .active:focus,\n.navbar li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .getstarted,\n.navbar .getstarted:focus {\n  color: #5cb874;\n  padding: 8px 25px;\n  margin-left: 30px;\n  border-radius: 4px;\n  border: 2px solid #5cb874;\n  transition: 0.3s;\n  font-size: 14px;\n}\n\n.navbar .getstarted:hover,\n.navbar .getstarted:focus:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.navbar .dropdown ul {\n  display: block;\n  position: absolute;\n  left: 14px;\n  top: calc(100% + 30px);\n  margin: 0;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 0;\n  visibility: hidden;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n  transition: 0.3s;\n}\n\n.navbar .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar .dropdown ul a {\n  padding: 10px 20px;\n  text-transform: none;\n}\n\n.navbar .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar .dropdown ul a:hover,\n.navbar .dropdown ul .active:hover,\n.navbar .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .dropdown:hover>ul {\n  opacity: 1;\n  top: 100%;\n  visibility: visible;\n}\n\n.navbar .dropdown .dropdown ul {\n  top: 0;\n  left: calc(100% - 30px);\n  visibility: hidden;\n}\n\n.navbar .dropdown .dropdown:hover>ul {\n  opacity: 1;\n  top: 0;\n  left: 100%;\n  visibility: visible;\n}\n\n@media (max-width: 1366px) {\n  .navbar .dropdown .dropdown ul {\n    left: -90%;\n  }\n\n  .navbar .dropdown .dropdown:hover>ul {\n    left: -100%;\n  }\n}\n\n/**\n* Mobile Navigation\n*/\n.mobile-nav-toggle {\n  color: #222222;\n  font-size: 28px;\n  cursor: pointer;\n  display: none;\n  line-height: 0;\n  transition: 0.5s;\n}\n\n.mobile-nav-toggle.bi-x {\n  color: #fff;\n}\n\n@media (max-width: 991px) {\n  .mobile-nav-toggle {\n    display: block;\n  }\n\n  .navbar ul {\n    display: none;\n  }\n}\n\n.navbar-mobile {\n  position: fixed;\n  overflow: hidden;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n  background: rgba(9, 9, 9, 0.9);\n  transition: 0.3s;\n  z-index: 999;\n}\n\n.navbar-mobile .mobile-nav-toggle {\n  position: absolute;\n  top: 15px;\n  right: 15px;\n}\n\n.navbar-mobile ul {\n  display: block;\n  position: absolute;\n  top: 55px;\n  right: 15px;\n  bottom: 15px;\n  left: 15px;\n  padding: 10px 0;\n  background-color: #fff;\n  overflow-y: auto;\n  transition: 0.3s;\n}\n\n.navbar-mobile a,\n.navbar-mobile a:focus {\n  padding: 10px 20px;\n  font-size: 15px;\n  color: #222222;\n}\n\n.navbar-mobile a:hover,\n.navbar-mobile .active,\n.navbar-mobile li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .getstarted,\n.navbar-mobile .getstarted:focus {\n  margin: 15px;\n}\n\n.navbar-mobile .dropdown ul {\n  position: static;\n  display: none;\n  margin: 10px 20px;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 1;\n  visibility: visible;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n}\n\n.navbar-mobile .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar-mobile .dropdown ul a {\n  padding: 10px 20px;\n}\n\n.navbar-mobile .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar-mobile .dropdown ul a:hover,\n.navbar-mobile .dropdown ul .active:hover,\n.navbar-mobile .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .dropdown>.dropdown-active {\n  display: block;\n}\n\n/*--------------------------------------------------------------\n# Hero Section\n--------------------------------------------------------------*/\n#hero {\n  width: 100%;\n  height: 70vh;\n  background-color: rgba(9, 9, 9, 0.8);\n  overflow: hidden;\n  position: relative;\n}\n\n#hero .carousel,\n#hero .carousel-inner,\n#hero .carousel-item,\n#hero .carousel-item::before {\n  background-size: cover;\n  background-position: center;\n  background-repeat: no-repeat;\n  position: absolute;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n}\n\n#hero .carousel-item::before {\n  content: "";\n  background-color: rgba(45, 103, 60, 0.8);\n}\n\n#hero .carousel-container {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  position: absolute;\n  bottom: 0;\n  top: 0;\n  left: 50px;\n  right: 50px;\n}\n\n#hero .container {\n  text-align: center;\n}\n\n#hero h2 {\n  color: #fff;\n  margin-bottom: 20px;\n  font-size: 48px;\n  font-weight: 700;\n}\n\n#hero p {\n  animation-delay: 0.4s;\n  margin: 0 auto 30px auto;\n  color: #fff;\n}\n\n#hero .carousel-inner .carousel-item {\n  transition-property: opacity;\n  background-position: center top;\n}\n\n#hero .carousel-inner .carousel-item,\n#hero .carousel-inner .active.carousel-item-start,\n#hero .carousel-inner .active.carousel-item-end {\n  opacity: 0;\n}\n\n#hero .carousel-inner .active,\n#hero .carousel-inner .carousel-item-next.carousel-item-start,\n#hero .carousel-inner .carousel-item-prev.carousel-item-end {\n  opacity: 1;\n  transition: 0.5s;\n}\n\n#hero .carousel-control-next-icon,\n#hero .carousel-control-prev-icon {\n  background: none;\n  font-size: 30px;\n  line-height: 0;\n  width: auto;\n  height: auto;\n  background: rgba(255, 255, 255, 0.2);\n  border-radius: 50px;\n  transition: 0.3s;\n  color: rgba(255, 255, 255, 0.5);\n  width: 54px;\n  height: 54px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n}\n\n#hero .carousel-control-next-icon:hover,\n#hero .carousel-control-prev-icon:hover {\n  background: rgba(255, 255, 255, 0.3);\n  color: rgba(255, 255, 255, 0.8);\n}\n\n#hero .carousel-indicators li {\n  list-style-type: none;\n  cursor: pointer;\n  background: #fff;\n  overflow: hidden;\n  border: 0;\n  width: 12px;\n  height: 12px;\n  border-radius: 50px;\n  opacity: 0.6;\n  transition: 0.3s;\n}\n\n#hero .carousel-indicators li.active {\n  opacity: 1;\n  background: #5cb874;\n}\n\n#hero .btn-get-started {\n  font-family: "Raleway", sans-serif;\n  font-weight: 500;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 14px 32px;\n  border-radius: 4px;\n  transition: 0.5s;\n  line-height: 1;\n  color: #fff;\n  animation-delay: 0.8s;\n  background: #5cb874;\n}\n\n#hero .btn-get-started:hover {\n  background: #6ec083;\n}\n\n@media (max-width: 992px) {\n  #hero {\n    height: 100vh;\n  }\n\n  #hero .carousel-container {\n    top: 66px;\n  }\n}\n\n@media (max-width: 768px) {\n  #hero h2 {\n    font-size: 28px;\n  }\n}\n\n@media (min-width: 1024px) {\n\n  #hero .carousel-control-prev,\n  #hero .carousel-control-next {\n    width: 5%;\n  }\n}\n\n@media (max-height: 500px) {\n  #hero {\n    height: 120vh;\n  }\n}\n\n/*--------------------------------------------------------------\n# Sections General\n--------------------------------------------------------------*/\nsection {\n  padding: 60px 0;\n}\n\n.section-bg {\n  background-color: #f8fcf9;\n}\n\n.section-title {\n  text-align: center;\n  padding-bottom: 30px;\n}\n\n.section-title h2 {\n  font-size: 32px;\n  font-weight: bold;\n  text-transform: uppercase;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  position: relative;\n}\n\n.section-title h2::before {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 120px;\n  height: 1px;\n  background: #ddd;\n  bottom: 1px;\n  left: calc(50% - 60px);\n}\n\n.section-title h2::after {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 40px;\n  height: 3px;\n  background: #5cb874;\n  bottom: 0;\n  left: calc(50% - 20px);\n}\n\n.section-title p {\n  margin-bottom: 0;\n  font-size: 14px;\n  color: #919191;\n}\n\n/*--------------------------------------------------------------\n# Featured Services\n--------------------------------------------------------------*/\n.featured-services {\n  padding: 20px 0;\n}\n\n.featured-services .icon-box {\n  padding: 20px;\n}\n\n.featured-services .icon-box-bg {\n  background-image: linear-gradient(0deg, #222222 0%, #2f2f2f 50%, #222222 100%);\n}\n\n.featured-services .icon {\n  margin-bottom: 15px;\n}\n\n.featured-services .icon i {\n  color: #5cb874;\n  font-size: 42px;\n}\n\n.featured-services .title {\n  font-weight: 700;\n  margin-bottom: 15px;\n  font-size: 18px;\n}\n\n.featured-services .title a {\n  color: #222222;\n  transition: 0.3s;\n}\n\n.featured-services .icon-box:hover .title a {\n  color: #5cb874;\n}\n\n.featured-services .description {\n  line-height: 24px;\n  font-size: 14px;\n}\n\n/*--------------------------------------------------------------\n# About Us\n--------------------------------------------------------------*/\n.about .content h3 {\n  font-weight: 700;\n  font-size: 28px;\n}\n\n.about .content ul {\n  list-style: none;\n  padding: 0;\n}\n\n.about .content ul li {\n  padding-bottom: 10px;\n}\n\n.about .content ul i {\n  font-size: 20px;\n  padding-right: 4px;\n  color: #5cb874;\n}\n\n.about .content p:last-child {\n  margin-bottom: 0;\n}\n\n/*--------------------------------------------------------------\n# Why Us\n--------------------------------------------------------------*/\n.why-us {\n  padding: 0;\n}\n\n.why-us .row {\n  overflow: hidden;\n}\n\n.why-us .content-item {\n  padding: 40px;\n  border-left: 1px solid #eee;\n  border-bottom: 1px solid #eee;\n  margin: -1px;\n}\n\n.why-us .content-item span {\n  display: block;\n  font-size: 24px;\n  font-weight: 400;\n  color: #6ec083;\n}\n\n.why-us .content-item h4 {\n  font-size: 26px;\n  font-weight: 300;\n  padding: 0;\n  margin: 20px 0;\n}\n\n.why-us .content-item p {\n  color: #aaaaaa;\n  font-size: 15px;\n  margin: 0;\n  padding: 0;\n}\n\n@media (max-width: 768px) {\n  .why-us .content-item {\n    padding: 40px 0;\n  }\n}\n\n/*--------------------------------------------------------------\n# Our Clients\n--------------------------------------------------------------*/\n.clients .swiper-slide img {\n  opacity: 0.5;\n  transition: 0.3s;\n}\n\n.clients .swiper-slide img:hover {\n  opacity: 1;\n}\n\n.clients .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Services\n--------------------------------------------------------------*/\n.services .icon-box {\n  text-align: center;\n  padding: 70px 20px 80px 20px;\n  transition: all ease-in-out 0.3s;\n  background: #fff;\n  box-shadow: 0px 5px 90px 0px rgba(110, 123, 131, 0.1);\n}\n\n.services .icon-box .icon {\n  margin: 0 auto;\n  width: 100px;\n  height: 100px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n  transition: ease-in-out 0.3s;\n  position: relative;\n}\n\n.services .icon-box .icon i {\n  font-size: 36px;\n  transition: 0.5s;\n  position: relative;\n}\n\n.services .icon-box .icon svg {\n  position: absolute;\n  top: 0;\n  left: 0;\n}\n\n.services .icon-box .icon svg path {\n  transition: 0.5s;\n  fill: #f5f5f5;\n}\n\n.services .icon-box h4 {\n  font-weight: 600;\n  margin: 10px 0 15px 0;\n  font-size: 22px;\n}\n\n.services .icon-box h4 a {\n  color: #222222;\n  transition: ease-in-out 0.3s;\n}\n\n.services .icon-box p {\n  line-height: 24px;\n  font-size: 14px;\n  margin-bottom: 0;\n}\n\n.services .icon-box:hover {\n  border-color: #fff;\n  box-shadow: 0px 0 35px 0 rgba(0, 0, 0, 0.08);\n}\n\n.services .iconbox-blue i {\n  color: #47aeff;\n}\n\n.services .iconbox-blue:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-blue:hover .icon path {\n  fill: #47aeff;\n}\n\n.services .iconbox-orange i {\n  color: #ffa76e;\n}\n\n.services .iconbox-orange:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-orange:hover .icon path {\n  fill: #ffa76e;\n}\n\n.services .iconbox-pink i {\n  color: #e80368;\n}\n\n.services .iconbox-pink:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-pink:hover .icon path {\n  fill: #e80368;\n}\n\n.services .iconbox-yellow i {\n  color: #ffbb2c;\n}\n\n.services .iconbox-yellow:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-yellow:hover .icon path {\n  fill: #ffbb2c;\n}\n\n.services .iconbox-red i {\n  color: #ff5828;\n}\n\n.services .iconbox-red:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-red:hover .icon path {\n  fill: #ff5828;\n}\n\n.services .iconbox-teal i {\n  color: #11dbcf;\n}\n\n.services .iconbox-teal:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-teal:hover .icon path {\n  fill: #11dbcf;\n}\n\n/*--------------------------------------------------------------\n# Cta\n--------------------------------------------------------------*/\n.cta {\n  background: #5cb874;\n  padding: 80px 0;\n}\n\n.cta h3 {\n  color: #fff;\n  font-size: 28px;\n  font-weight: 700;\n}\n\n.cta p {\n  color: #fff;\n}\n\n.cta .cta-btn {\n  font-family: "Raleway", sans-serif;\n  font-weight: 600;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 10px 30px;\n  border-radius: 2px;\n  transition: 0.5s;\n  margin: 10px;\n  border: 2px solid #fff;\n  color: #fff;\n  border-radius: 4px;\n}\n\n.cta .cta-btn:hover {\n  background: #fff;\n  color: #5cb874;\n}\n\n@media (max-width: 1024px) {\n  .cta {\n    background-attachment: scroll;\n  }\n}\n\n@media (min-width: 769px) {\n  .cta .cta-btn-container {\n    display: flex;\n    align-items: center;\n    justify-content: flex-end;\n  }\n}\n\n/*--------------------------------------------------------------\n# Portfolio\n--------------------------------------------------------------*/\n.portfolio .portfolio-item {\n  margin-bottom: 30px;\n}\n\n.portfolio #portfolio-flters {\n  padding: 0;\n  margin: 0 auto 20px auto;\n  list-style: none;\n  text-align: center;\n}\n\n.portfolio #portfolio-flters li {\n  cursor: pointer;\n  display: inline-block;\n  padding: 8px 15px 10px 15px;\n  font-size: 14px;\n  font-weight: 600;\n  line-height: 1;\n  text-transform: uppercase;\n  color: #444444;\n  margin-bottom: 5px;\n  transition: all 0.3s ease-in-out;\n  border-radius: 3px;\n}\n\n.portfolio #portfolio-flters li:hover,\n.portfolio #portfolio-flters li.filter-active {\n  color: #fff;\n  background: #5cb874;\n}\n\n.portfolio #portfolio-flters li:last-child {\n  margin-right: 0;\n}\n\n.portfolio .portfolio-wrap {\n  transition: 0.3s;\n  position: relative;\n  overflow: hidden;\n  z-index: 1;\n  background: rgba(34, 34, 34, 0.6);\n}\n\n.portfolio .portfolio-wrap::before {\n  content: "";\n  background: rgba(34, 34, 34, 0.6);\n  position: absolute;\n  left: 0;\n  right: 0;\n  top: 0;\n  bottom: 0;\n  transition: all ease-in-out 0.3s;\n  z-index: 2;\n  opacity: 0;\n}\n\n.portfolio .portfolio-wrap img {\n  transition: all ease-in-out 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-info {\n  opacity: 0;\n  position: absolute;\n  top: 0;\n  left: 0;\n  right: 0;\n  bottom: 0;\n  z-index: 3;\n  transition: all ease-in-out 0.3s;\n  display: flex;\n  flex-direction: column;\n  justify-content: flex-end;\n  align-items: flex-start;\n  padding: 20px;\n}\n\n.portfolio .portfolio-wrap .portfolio-info h4 {\n  font-size: 20px;\n  color: #fff;\n  font-weight: 600;\n}\n\n.portfolio .portfolio-wrap .portfolio-info p {\n  color: rgba(255, 255, 255, 0.7);\n  font-size: 14px;\n  text-transform: uppercase;\n  padding: 0;\n  margin: 0;\n  font-style: italic;\n}\n\n.portfolio .portfolio-wrap .portfolio-links {\n  text-align: center;\n  z-index: 4;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a {\n  color: #fff;\n  margin: 0 5px 0 0;\n  font-size: 28px;\n  display: inline-block;\n  transition: 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a:hover {\n  color: #6ec083;\n}\n\n.portfolio .portfolio-wrap:hover::before {\n  opacity: 1;\n}\n\n.portfolio .portfolio-wrap:hover img {\n  transform: scale(1.2);\n}\n\n.portfolio .portfolio-wrap:hover .portfolio-info {\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Portfolio Details\n--------------------------------------------------------------*/\n.portfolio-details {\n  padding-top: 40px;\n}\n\n.portfolio-details .portfolio-details-slider img {\n  width: 100%;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n.portfolio-details .portfolio-info {\n  padding: 30px;\n  box-shadow: 0px 0 30px rgba(34, 34, 34, 0.08);\n}\n\n.portfolio-details .portfolio-info h3 {\n  font-size: 22px;\n  font-weight: 700;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  border-bottom: 1px solid #eee;\n}\n\n.portfolio-details .portfolio-info ul {\n  list-style: none;\n  padding: 0;\n  font-size: 15px;\n}\n\n.portfolio-details .portfolio-info ul li+li {\n  margin-top: 10px;\n}\n\n.portfolio-details .portfolio-description {\n  padding-top: 30px;\n}\n\n.portfolio-details .portfolio-description h2 {\n  font-size: 26px;\n  font-weight: 700;\n  margin-bottom: 20px;\n}\n\n.portfolio-details .portfolio-description p {\n  padding: 0;\n}\n\n/*--------------------------------------------------------------\n# Team\n--------------------------------------------------------------*/\n.team .member {\n  text-align: center;\n  margin-bottom: 20px;\n  box-shadow: 0px 0px 12px 0px rgba(34, 34, 34, 0.07);\n  padding: 30px 20px;\n  background: #fff;\n}\n\n.team .member img {\n  max-width: 60%;\n  border-radius: 50%;\n  margin: 0 0 30px 0;\n}\n\n.team .member h4 {\n  font-weight: 700;\n  margin-bottom: 2px;\n  font-size: 18px;\n}\n\n.team .member span {\n  font-style: italic;\n  display: block;\n  font-size: 13px;\n}\n\n.team .member p {\n  padding-top: 10px;\n  font-size: 14px;\n  font-style: italic;\n  color: #aaaaaa;\n}\n\n.team .member .social {\n  margin-top: 15px;\n}\n\n.team .member .social a {\n  color: #919191;\n  transition: 0.3s;\n}\n\n.team .member .social a:hover {\n  color: #5cb874;\n}\n\n.team .member .social i {\n  font-size: 18px;\n  margin: 0 2px;\n}\n\n/*--------------------------------------------------------------\n# Contact\n--------------------------------------------------------------*/\n.contact .info {\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  width: 100%;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .info i {\n  font-size: 20px;\n  color: #5cb874;\n  float: left;\n  width: 44px;\n  height: 44px;\n  background: #eaf6ed;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  border-radius: 50px;\n  transition: all 0.3s ease-in-out;\n}\n\n.contact .info h4 {\n  padding: 0 0 0 60px;\n  font-size: 20px;\n  font-weight: 600;\n  margin-bottom: 5px;\n  color: #222222;\n}\n\n.contact .info p {\n  padding: 0 0 10px 60px;\n  margin-bottom: 20px;\n  font-size: 14px;\n  color: #555555;\n}\n\n.contact .info .social-links {\n  padding-left: 60px;\n}\n\n.contact .info .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #333;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n  margin-right: 10px;\n}\n\n.contact .info .social-links a:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.contact .info .email:hover i,\n.contact .info .address:hover i,\n.contact .info .phone:hover i {\n  background: #5cb874;\n  color: #fff;\n}\n.contact .email-form {\n  width: 100%;\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .email-form .form-group {\n  padding-bottom: 8px;\n}\n\n.contact .email-form .error-message {\n  display: none;\n  color: #fff;\n  background: #ed3c0d;\n  text-align: left;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .error-message br+br {\n  margin-top: 25px;\n}\n\n.contact .email-form .sent-message {\n  display: none;\n  color: #fff;\n  background: #18d26e;\n  text-align: center;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .loading {\n  display: none;\n  background: #fff;\n  text-align: center;\n  padding: 15px;\n}\n\n.contact .email-form .loading:before {\n  content: "";\n  display: inline-block;\n  border-radius: 50%;\n  width: 24px;\n  height: 24px;\n  margin: 0 10px -6px 0;\n  border: 3px solid #18d26e;\n  border-top-color: #eee;\n  animation: animate-loading 1s linear infinite;\n}\n\n.contact .email-form input,\n.contact .email-form textarea {\n  border-radius: 0;\n  box-shadow: none;\n  font-size: 14px;\n  border-radius: 4px;\n}\n\n.contact .email-form input:focus,\n.contact .email-form textarea:focus {\n  border-color: #5cb874;\n}\n\n.contact .email-form input {\n  height: 44px;\n}\n\n.contact .email-form textarea {\n  padding: 10px 12px;\n}\n\n.contact .email-form button[type=submit] {\n  background: #5cb874;\n  border: 0;\n  padding: 10px 24px;\n  color: #fff;\n  transition: 0.4s;\n  border-radius: 4px;\n}\n\n.contact .email-form button[type=submit]:hover {\n  background: #6ec083;\n}\n\n@keyframes animate-loading {\n  0% {\n    transform: rotate(0deg);\n  }\n\n  100% {\n    transform: rotate(360deg);\n  }\n}\n\n/*--------------------------------------------------------------\n# Breadcrumbs\n--------------------------------------------------------------*/\n.breadcrumbs {\n  padding: 15px 0;\n  background: #fbfbfb;\n  min-height: 40px;\n}\n\n@media (max-width: 992px) {\n  .breadcrumbs {\n    margin-top: 66px;\n  }\n}\n\n.breadcrumbs h2 {\n  font-size: 28px;\n  font-weight: 300;\n}\n\n.breadcrumbs ol {\n  display: flex;\n  flex-wrap: wrap;\n  list-style: none;\n  padding: 0;\n  margin: 0;\n  font-size: 14px;\n}\n\n.breadcrumbs ol li+li {\n  padding-left: 10px;\n}\n\n.breadcrumbs ol li+li::before {\n  display: inline-block;\n  padding-right: 10px;\n  color: #3c3c3c;\n  content: "/";\n}\n\n@media (max-width: 768px) {\n  .breadcrumbs .d-flex {\n    display: block !important;\n  }\n\n  .breadcrumbs ol {\n    display: block;\n  }\n\n  .breadcrumbs ol li {\n    display: inline-block;\n  }\n}\n\n/*--------------------------------------------------------------\n# Footer\n--------------------------------------------------------------*/\n#footer {\n  background: #090909;\n  color: #fff;\n  font-size: 14px;\n  text-align: center;\n  padding: 30px 0;\n}\n\n#footer h3 {\n  font-size: 36px;\n  font-weight: 700;\n  color: #fff;\n  position: relative;\n  font-family: "Poppins", sans-serif;\n  padding: 0;\n  margin: 0 0 15px 0;\n}\n\n#footer p {\n  font-size: 15;\n  font-style: italic;\n  padding: 0;\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links {\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #5cb874;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  margin-right: 4px;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n}\n\n#footer .social-links a:hover {\n  background: #449d5b;\n  color: #fff;\n  text-decoration: none;\n}\n\n#footer .copyright {\n  margin: 0 0 5px 0;\n}\n\n#footer .credits {\n  font-size: 13px;\n}	\n	0	2025-05-01 11:23:38.54979	2025-05-01 11:23:38.54979
2	1	1	application	Frontpage	frontpage	{{ cms:snippet hero }}\n<main id="main">\n  {{ cms:snippet services }} \n  {{ cms:snippet aboutus }}\n  {{ cms:snippet whyus }}\n  {{ cms:snippet clients }}\n  {{ cms:snippet services }}\n\t{{ cms:snippet team }}\n  {{ cms:snippet contact }}\n</main><!-- End #main -->\n	/**\n* Template Name: Green\n* Updated: Sep 18 2023 with Bootstrap v5.3.2\n* Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/\n* Author: BootstrapMade.com\n* License: https://bootstrapmade.com/license/\n*/\n\n/*--------------------------------------------------------------\n# General\n--------------------------------------------------------------*/\nbody {\n  font-family: "Open Sans", sans-serif;\n  color: #444444;\n}\n\na {\n  text-decoration: none;\n  color: #5cb874;\n}\n\na:hover {\n  color: #80c792;\n  text-decoration: none;\n}\n\nh1,\nh2,\nh3,\nh4,\nh5,\nh6 {\n  font-family: "Raleway", sans-serif;\n}\n\n/*--------------------------------------------------------------\n# Back to top button\n--------------------------------------------------------------*/\n.back-to-top {\n  position: fixed;\n  visibility: hidden;\n  opacity: 0;\n  right: 15px;\n  bottom: 15px;\n  z-index: 996;\n  background: #5cb874;\n  width: 40px;\n  height: 40px;\n  border-radius: 4px;\n  transition: all 0.4s;\n}\n\n.back-to-top i {\n  font-size: 24px;\n  color: #fff;\n  line-height: 0;\n}\n\n.back-to-top:hover {\n  background: #78c48c;\n  color: #fff;\n}\n\n.back-to-top.active {\n  visibility: visible;\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Top Bar\n--------------------------------------------------------------*/\n#topbar {\n  background: #fbfbfb;\n  font-size: 15px;\n  height: 40px;\n  padding: 0;\n}\n\n#topbar .contact-info a {\n  line-height: 0;\n  color: #444444;\n  transition: 0.3s;\n}\n\n#topbar .contact-info a:hover {\n  color: #5cb874;\n}\n\n#topbar .contact-info i {\n  color: #5cb874;\n  line-height: 0;\n  margin-right: 5px;\n}\n\n#topbar .contact-info .phone-icon {\n  margin-left: 15px;\n}\n\n#topbar .social-links a {\n  color: #6f6f6f;\n  padding: 4px 12px;\n  display: inline-block;\n  line-height: 1px;\n  transition: 0.3s;\n}\n\n#topbar .social-links a:hover {\n  color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Header\n--------------------------------------------------------------*/\n#header {\n  background: #fff;\n  transition: all 0.5s;\n  z-index: 997;\n  height: 70px;\n}\n\n#header.header-scrolled {\n  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);\n}\n\n#header .logo {\n  font-size: 30px;\n  margin: 0;\n  padding: 0;\n  line-height: 1;\n  font-weight: 700;\n  letter-spacing: 1px;\n  text-transform: uppercase;\n}\n\n#header .logo a {\n  color: #5cb874;\n}\n\n#header .logo img {\n  max-height: 40px;\n}\n\n.scrolled-offset {\n  margin-top: 70px;\n}\n\n/*--------------------------------------------------------------\n# Navigation Menu\n--------------------------------------------------------------*/\n/**\n* Desktop Navigation\n*/\n.navbar {\n  padding: 0;\n}\n\n.navbar ul {\n  margin: 0;\n  padding: 0;\n  display: flex;\n  list-style: none;\n  align-items: center;\n}\n\n.navbar li {\n  position: relative;\n}\n\n.navbar a,\n.navbar a:focus {\n  display: flex;\n  align-items: center;\n  justify-content: space-between;\n  padding: 10px 0 10px 30px;\n  font-size: 15px;\n  color: #222222;\n  white-space: nowrap;\n  transition: 0.3s;\n}\n\n.navbar a i,\n.navbar a:focus i {\n  font-size: 12px;\n  line-height: 0;\n  margin-left: 5px;\n}\n\n.navbar a:hover,\n.navbar .active,\n.navbar .active:focus,\n.navbar li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .getstarted,\n.navbar .getstarted:focus {\n  color: #5cb874;\n  padding: 8px 25px;\n  margin-left: 30px;\n  border-radius: 4px;\n  border: 2px solid #5cb874;\n  transition: 0.3s;\n  font-size: 14px;\n}\n\n.navbar .getstarted:hover,\n.navbar .getstarted:focus:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.navbar .dropdown ul {\n  display: block;\n  position: absolute;\n  left: 14px;\n  top: calc(100% + 30px);\n  margin: 0;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 0;\n  visibility: hidden;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n  transition: 0.3s;\n}\n\n.navbar .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar .dropdown ul a {\n  padding: 10px 20px;\n  text-transform: none;\n}\n\n.navbar .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar .dropdown ul a:hover,\n.navbar .dropdown ul .active:hover,\n.navbar .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .dropdown:hover>ul {\n  opacity: 1;\n  top: 100%;\n  visibility: visible;\n}\n\n.navbar .dropdown .dropdown ul {\n  top: 0;\n  left: calc(100% - 30px);\n  visibility: hidden;\n}\n\n.navbar .dropdown .dropdown:hover>ul {\n  opacity: 1;\n  top: 0;\n  left: 100%;\n  visibility: visible;\n}\n\n@media (max-width: 1366px) {\n  .navbar .dropdown .dropdown ul {\n    left: -90%;\n  }\n\n  .navbar .dropdown .dropdown:hover>ul {\n    left: -100%;\n  }\n}\n\n/**\n* Mobile Navigation\n*/\n.mobile-nav-toggle {\n  color: #222222;\n  font-size: 28px;\n  cursor: pointer;\n  display: none;\n  line-height: 0;\n  transition: 0.5s;\n}\n\n.mobile-nav-toggle.bi-x {\n  color: #fff;\n}\n\n@media (max-width: 991px) {\n  .mobile-nav-toggle {\n    display: block;\n  }\n\n  .navbar ul {\n    display: none;\n  }\n}\n\n.navbar-mobile {\n  position: fixed;\n  overflow: hidden;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n  background: rgba(9, 9, 9, 0.9);\n  transition: 0.3s;\n  z-index: 999;\n}\n\n.navbar-mobile .mobile-nav-toggle {\n  position: absolute;\n  top: 15px;\n  right: 15px;\n}\n\n.navbar-mobile ul {\n  display: block;\n  position: absolute;\n  top: 55px;\n  right: 15px;\n  bottom: 15px;\n  left: 15px;\n  padding: 10px 0;\n  background-color: #fff;\n  overflow-y: auto;\n  transition: 0.3s;\n}\n\n.navbar-mobile a,\n.navbar-mobile a:focus {\n  padding: 10px 20px;\n  font-size: 15px;\n  color: #222222;\n}\n\n.navbar-mobile a:hover,\n.navbar-mobile .active,\n.navbar-mobile li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .getstarted,\n.navbar-mobile .getstarted:focus {\n  margin: 15px;\n}\n\n.navbar-mobile .dropdown ul {\n  position: static;\n  display: none;\n  margin: 10px 20px;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 1;\n  visibility: visible;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n}\n\n.navbar-mobile .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar-mobile .dropdown ul a {\n  padding: 10px 20px;\n}\n\n.navbar-mobile .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar-mobile .dropdown ul a:hover,\n.navbar-mobile .dropdown ul .active:hover,\n.navbar-mobile .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .dropdown>.dropdown-active {\n  display: block;\n}\n\n/*--------------------------------------------------------------\n# Hero Section\n--------------------------------------------------------------*/\n#hero {\n  width: 100%;\n  height: 70vh;\n  background-color: rgba(9, 9, 9, 0.8);\n  overflow: hidden;\n  position: relative;\n}\n\n#hero .carousel,\n#hero .carousel-inner,\n#hero .carousel-item,\n#hero .carousel-item::before {\n  background-size: cover;\n  background-position: center;\n  background-repeat: no-repeat;\n  position: absolute;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n}\n\n#hero .carousel-item::before {\n  content: "";\n  background-color: rgba(45, 103, 60, 0.8);\n}\n\n#hero .carousel-container {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  position: absolute;\n  bottom: 0;\n  top: 0;\n  left: 50px;\n  right: 50px;\n}\n\n#hero .container {\n  text-align: center;\n}\n\n#hero h2 {\n  color: #fff;\n  margin-bottom: 20px;\n  font-size: 48px;\n  font-weight: 700;\n}\n\n#hero p {\n  animation-delay: 0.4s;\n  margin: 0 auto 30px auto;\n  color: #fff;\n}\n\n#hero .carousel-inner .carousel-item {\n  transition-property: opacity;\n  background-position: center top;\n}\n\n#hero .carousel-inner .carousel-item,\n#hero .carousel-inner .active.carousel-item-start,\n#hero .carousel-inner .active.carousel-item-end {\n  opacity: 0;\n}\n\n#hero .carousel-inner .active,\n#hero .carousel-inner .carousel-item-next.carousel-item-start,\n#hero .carousel-inner .carousel-item-prev.carousel-item-end {\n  opacity: 1;\n  transition: 0.5s;\n}\n\n#hero .carousel-control-next-icon,\n#hero .carousel-control-prev-icon {\n  background: none;\n  font-size: 30px;\n  line-height: 0;\n  width: auto;\n  height: auto;\n  background: rgba(255, 255, 255, 0.2);\n  border-radius: 50px;\n  transition: 0.3s;\n  color: rgba(255, 255, 255, 0.5);\n  width: 54px;\n  height: 54px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n}\n\n#hero .carousel-control-next-icon:hover,\n#hero .carousel-control-prev-icon:hover {\n  background: rgba(255, 255, 255, 0.3);\n  color: rgba(255, 255, 255, 0.8);\n}\n\n#hero .carousel-indicators li {\n  list-style-type: none;\n  cursor: pointer;\n  background: #fff;\n  overflow: hidden;\n  border: 0;\n  width: 12px;\n  height: 12px;\n  border-radius: 50px;\n  opacity: 0.6;\n  transition: 0.3s;\n}\n\n#hero .carousel-indicators li.active {\n  opacity: 1;\n  background: #5cb874;\n}\n\n#hero .btn-get-started {\n  font-family: "Raleway", sans-serif;\n  font-weight: 500;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 14px 32px;\n  border-radius: 4px;\n  transition: 0.5s;\n  line-height: 1;\n  color: #fff;\n  animation-delay: 0.8s;\n  background: #5cb874;\n}\n\n#hero .btn-get-started:hover {\n  background: #6ec083;\n}\n\n@media (max-width: 992px) {\n  #hero {\n    height: 100vh;\n  }\n\n  #hero .carousel-container {\n    top: 66px;\n  }\n}\n\n@media (max-width: 768px) {\n  #hero h2 {\n    font-size: 28px;\n  }\n}\n\n@media (min-width: 1024px) {\n\n  #hero .carousel-control-prev,\n  #hero .carousel-control-next {\n    width: 5%;\n  }\n}\n\n@media (max-height: 500px) {\n  #hero {\n    height: 120vh;\n  }\n}\n\n/*--------------------------------------------------------------\n# Sections General\n--------------------------------------------------------------*/\nsection {\n  padding: 60px 0;\n}\n\n.section-bg {\n  background-color: #f8fcf9;\n}\n\n.section-title {\n  text-align: center;\n  padding-bottom: 30px;\n}\n\n.section-title h2 {\n  font-size: 32px;\n  font-weight: bold;\n  text-transform: uppercase;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  position: relative;\n}\n\n.section-title h2::before {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 120px;\n  height: 1px;\n  background: #ddd;\n  bottom: 1px;\n  left: calc(50% - 60px);\n}\n\n.section-title h2::after {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 40px;\n  height: 3px;\n  background: #5cb874;\n  bottom: 0;\n  left: calc(50% - 20px);\n}\n\n.section-title p {\n  margin-bottom: 0;\n  font-size: 14px;\n  color: #919191;\n}\n\n/*--------------------------------------------------------------\n# Featured Services\n--------------------------------------------------------------*/\n.featured-services {\n  padding: 20px 0;\n}\n\n.featured-services .icon-box {\n  padding: 20px;\n}\n\n.featured-services .icon-box-bg {\n  background-image: linear-gradient(0deg, #222222 0%, #2f2f2f 50%, #222222 100%);\n}\n\n.featured-services .icon {\n  margin-bottom: 15px;\n}\n\n.featured-services .icon i {\n  color: #5cb874;\n  font-size: 42px;\n}\n\n.featured-services .title {\n  font-weight: 700;\n  margin-bottom: 15px;\n  font-size: 18px;\n}\n\n.featured-services .title a {\n  color: #222222;\n  transition: 0.3s;\n}\n\n.featured-services .icon-box:hover .title a {\n  color: #5cb874;\n}\n\n.featured-services .description {\n  line-height: 24px;\n  font-size: 14px;\n}\n\n/*--------------------------------------------------------------\n# About Us\n--------------------------------------------------------------*/\n.about .content h3 {\n  font-weight: 700;\n  font-size: 28px;\n}\n\n.about .content ul {\n  list-style: none;\n  padding: 0;\n}\n\n.about .content ul li {\n  padding-bottom: 10px;\n}\n\n.about .content ul i {\n  font-size: 20px;\n  padding-right: 4px;\n  color: #5cb874;\n}\n\n.about .content p:last-child {\n  margin-bottom: 0;\n}\n\n/*--------------------------------------------------------------\n# Why Us\n--------------------------------------------------------------*/\n.why-us {\n  padding: 0;\n}\n\n.why-us .row {\n  overflow: hidden;\n}\n\n.why-us .content-item {\n  padding: 40px;\n  border-left: 1px solid #eee;\n  border-bottom: 1px solid #eee;\n  margin: -1px;\n}\n\n.why-us .content-item span {\n  display: block;\n  font-size: 24px;\n  font-weight: 400;\n  color: #6ec083;\n}\n\n.why-us .content-item h4 {\n  font-size: 26px;\n  font-weight: 300;\n  padding: 0;\n  margin: 20px 0;\n}\n\n.why-us .content-item p {\n  color: #aaaaaa;\n  font-size: 15px;\n  margin: 0;\n  padding: 0;\n}\n\n@media (max-width: 768px) {\n  .why-us .content-item {\n    padding: 40px 0;\n  }\n}\n\n/*--------------------------------------------------------------\n# Our Clients\n--------------------------------------------------------------*/\n.clients .swiper-slide img {\n  opacity: 0.5;\n  transition: 0.3s;\n}\n\n.clients .swiper-slide img:hover {\n  opacity: 1;\n}\n\n.clients .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Services\n--------------------------------------------------------------*/\n.services .icon-box {\n  text-align: center;\n  padding: 70px 20px 80px 20px;\n  transition: all ease-in-out 0.3s;\n  background: #fff;\n  box-shadow: 0px 5px 90px 0px rgba(110, 123, 131, 0.1);\n}\n\n.services .icon-box .icon {\n  margin: 0 auto;\n  width: 100px;\n  height: 100px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n  transition: ease-in-out 0.3s;\n  position: relative;\n}\n\n.services .icon-box .icon i {\n  font-size: 36px;\n  transition: 0.5s;\n  position: relative;\n}\n\n.services .icon-box .icon svg {\n  position: absolute;\n  top: 0;\n  left: 0;\n}\n\n.services .icon-box .icon svg path {\n  transition: 0.5s;\n  fill: #f5f5f5;\n}\n\n.services .icon-box h4 {\n  font-weight: 600;\n  margin: 10px 0 15px 0;\n  font-size: 22px;\n}\n\n.services .icon-box h4 a {\n  color: #222222;\n  transition: ease-in-out 0.3s;\n}\n\n.services .icon-box p {\n  line-height: 24px;\n  font-size: 14px;\n  margin-bottom: 0;\n}\n\n.services .icon-box:hover {\n  border-color: #fff;\n  box-shadow: 0px 0 35px 0 rgba(0, 0, 0, 0.08);\n}\n\n.services .iconbox-blue i {\n  color: #47aeff;\n}\n\n.services .iconbox-blue:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-blue:hover .icon path {\n  fill: #47aeff;\n}\n\n.services .iconbox-orange i {\n  color: #ffa76e;\n}\n\n.services .iconbox-orange:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-orange:hover .icon path {\n  fill: #ffa76e;\n}\n\n.services .iconbox-pink i {\n  color: #e80368;\n}\n\n.services .iconbox-pink:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-pink:hover .icon path {\n  fill: #e80368;\n}\n\n.services .iconbox-yellow i {\n  color: #ffbb2c;\n}\n\n.services .iconbox-yellow:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-yellow:hover .icon path {\n  fill: #ffbb2c;\n}\n\n.services .iconbox-red i {\n  color: #ff5828;\n}\n\n.services .iconbox-red:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-red:hover .icon path {\n  fill: #ff5828;\n}\n\n.services .iconbox-teal i {\n  color: #11dbcf;\n}\n\n.services .iconbox-teal:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-teal:hover .icon path {\n  fill: #11dbcf;\n}\n\n/*--------------------------------------------------------------\n# Cta\n--------------------------------------------------------------*/\n.cta {\n  background: #5cb874;\n  padding: 80px 0;\n}\n\n.cta h3 {\n  color: #fff;\n  font-size: 28px;\n  font-weight: 700;\n}\n\n.cta p {\n  color: #fff;\n}\n\n.cta .cta-btn {\n  font-family: "Raleway", sans-serif;\n  font-weight: 600;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 10px 30px;\n  border-radius: 2px;\n  transition: 0.5s;\n  margin: 10px;\n  border: 2px solid #fff;\n  color: #fff;\n  border-radius: 4px;\n}\n\n.cta .cta-btn:hover {\n  background: #fff;\n  color: #5cb874;\n}\n\n@media (max-width: 1024px) {\n  .cta {\n    background-attachment: scroll;\n  }\n}\n\n@media (min-width: 769px) {\n  .cta .cta-btn-container {\n    display: flex;\n    align-items: center;\n    justify-content: flex-end;\n  }\n}\n\n/*--------------------------------------------------------------\n# Portfolio\n--------------------------------------------------------------*/\n.portfolio .portfolio-item {\n  margin-bottom: 30px;\n}\n\n.portfolio #portfolio-flters {\n  padding: 0;\n  margin: 0 auto 20px auto;\n  list-style: none;\n  text-align: center;\n}\n\n.portfolio #portfolio-flters li {\n  cursor: pointer;\n  display: inline-block;\n  padding: 8px 15px 10px 15px;\n  font-size: 14px;\n  font-weight: 600;\n  line-height: 1;\n  text-transform: uppercase;\n  color: #444444;\n  margin-bottom: 5px;\n  transition: all 0.3s ease-in-out;\n  border-radius: 3px;\n}\n\n.portfolio #portfolio-flters li:hover,\n.portfolio #portfolio-flters li.filter-active {\n  color: #fff;\n  background: #5cb874;\n}\n\n.portfolio #portfolio-flters li:last-child {\n  margin-right: 0;\n}\n\n.portfolio .portfolio-wrap {\n  transition: 0.3s;\n  position: relative;\n  overflow: hidden;\n  z-index: 1;\n  background: rgba(34, 34, 34, 0.6);\n}\n\n.portfolio .portfolio-wrap::before {\n  content: "";\n  background: rgba(34, 34, 34, 0.6);\n  position: absolute;\n  left: 0;\n  right: 0;\n  top: 0;\n  bottom: 0;\n  transition: all ease-in-out 0.3s;\n  z-index: 2;\n  opacity: 0;\n}\n\n.portfolio .portfolio-wrap img {\n  transition: all ease-in-out 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-info {\n  opacity: 0;\n  position: absolute;\n  top: 0;\n  left: 0;\n  right: 0;\n  bottom: 0;\n  z-index: 3;\n  transition: all ease-in-out 0.3s;\n  display: flex;\n  flex-direction: column;\n  justify-content: flex-end;\n  align-items: flex-start;\n  padding: 20px;\n}\n\n.portfolio .portfolio-wrap .portfolio-info h4 {\n  font-size: 20px;\n  color: #fff;\n  font-weight: 600;\n}\n\n.portfolio .portfolio-wrap .portfolio-info p {\n  color: rgba(255, 255, 255, 0.7);\n  font-size: 14px;\n  text-transform: uppercase;\n  padding: 0;\n  margin: 0;\n  font-style: italic;\n}\n\n.portfolio .portfolio-wrap .portfolio-links {\n  text-align: center;\n  z-index: 4;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a {\n  color: #fff;\n  margin: 0 5px 0 0;\n  font-size: 28px;\n  display: inline-block;\n  transition: 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a:hover {\n  color: #6ec083;\n}\n\n.portfolio .portfolio-wrap:hover::before {\n  opacity: 1;\n}\n\n.portfolio .portfolio-wrap:hover img {\n  transform: scale(1.2);\n}\n\n.portfolio .portfolio-wrap:hover .portfolio-info {\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Portfolio Details\n--------------------------------------------------------------*/\n.portfolio-details {\n  padding-top: 40px;\n}\n\n.portfolio-details .portfolio-details-slider img {\n  width: 100%;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n.portfolio-details .portfolio-info {\n  padding: 30px;\n  box-shadow: 0px 0 30px rgba(34, 34, 34, 0.08);\n}\n\n.portfolio-details .portfolio-info h3 {\n  font-size: 22px;\n  font-weight: 700;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  border-bottom: 1px solid #eee;\n}\n\n.portfolio-details .portfolio-info ul {\n  list-style: none;\n  padding: 0;\n  font-size: 15px;\n}\n\n.portfolio-details .portfolio-info ul li+li {\n  margin-top: 10px;\n}\n\n.portfolio-details .portfolio-description {\n  padding-top: 30px;\n}\n\n.portfolio-details .portfolio-description h2 {\n  font-size: 26px;\n  font-weight: 700;\n  margin-bottom: 20px;\n}\n\n.portfolio-details .portfolio-description p {\n  padding: 0;\n}\n\n/*--------------------------------------------------------------\n# Team\n--------------------------------------------------------------*/\n.team .member {\n  text-align: center;\n  margin-bottom: 20px;\n  box-shadow: 0px 0px 12px 0px rgba(34, 34, 34, 0.07);\n  padding: 30px 20px;\n  background: #fff;\n}\n\n.team .member img {\n  max-width: 60%;\n  border-radius: 50%;\n  margin: 0 0 30px 0;\n}\n\n.team .member h4 {\n  font-weight: 700;\n  margin-bottom: 2px;\n  font-size: 18px;\n}\n\n.team .member span {\n  font-style: italic;\n  display: block;\n  font-size: 13px;\n}\n\n.team .member p {\n  padding-top: 10px;\n  font-size: 14px;\n  font-style: italic;\n  color: #aaaaaa;\n}\n\n.team .member .social {\n  margin-top: 15px;\n}\n\n.team .member .social a {\n  color: #919191;\n  transition: 0.3s;\n}\n\n.team .member .social a:hover {\n  color: #5cb874;\n}\n\n.team .member .social i {\n  font-size: 18px;\n  margin: 0 2px;\n}\n\n/*--------------------------------------------------------------\n# Contact\n--------------------------------------------------------------*/\n.contact .info {\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  width: 100%;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .info i {\n  font-size: 20px;\n  color: #5cb874;\n  float: left;\n  width: 44px;\n  height: 44px;\n  background: #eaf6ed;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  border-radius: 50px;\n  transition: all 0.3s ease-in-out;\n}\n\n.contact .info h4 {\n  padding: 0 0 0 60px;\n  font-size: 20px;\n  font-weight: 600;\n  margin-bottom: 5px;\n  color: #222222;\n}\n\n.contact .info p {\n  padding: 0 0 10px 60px;\n  margin-bottom: 20px;\n  font-size: 14px;\n  color: #555555;\n}\n\n.contact .info .social-links {\n  padding-left: 60px;\n}\n\n.contact .info .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #333;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n  margin-right: 10px;\n}\n\n.contact .info .social-links a:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.contact .info .email:hover i,\n.contact .info .address:hover i,\n.contact .info .phone:hover i {\n  background: #5cb874;\n  color: #fff;\n}\n.contact .email-form {\n  width: 100%;\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .email-form .form-group {\n  padding-bottom: 8px;\n}\n\n.contact .email-form .error-message {\n  display: none;\n  color: #fff;\n  background: #ed3c0d;\n  text-align: left;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .error-message br+br {\n  margin-top: 25px;\n}\n\n.contact .email-form .sent-message {\n  display: none;\n  color: #fff;\n  background: #18d26e;\n  text-align: center;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .loading {\n  display: none;\n  background: #fff;\n  text-align: center;\n  padding: 15px;\n}\n\n.contact .email-form .loading:before {\n  content: "";\n  display: inline-block;\n  border-radius: 50%;\n  width: 24px;\n  height: 24px;\n  margin: 0 10px -6px 0;\n  border: 3px solid #18d26e;\n  border-top-color: #eee;\n  animation: animate-loading 1s linear infinite;\n}\n\n.contact .email-form input,\n.contact .email-form textarea {\n  border-radius: 0;\n  box-shadow: none;\n  font-size: 14px;\n  border-radius: 4px;\n}\n\n.contact .email-form input:focus,\n.contact .email-form textarea:focus {\n  border-color: #5cb874;\n}\n\n.contact .email-form input {\n  height: 44px;\n}\n\n.contact .email-form textarea {\n  padding: 10px 12px;\n}\n\n.contact .email-form button[type=submit] {\n  background: #5cb874;\n  border: 0;\n  padding: 10px 24px;\n  color: #fff;\n  transition: 0.4s;\n  border-radius: 4px;\n}\n\n.contact .email-form button[type=submit]:hover {\n  background: #6ec083;\n}\n\n@keyframes animate-loading {\n  0% {\n    transform: rotate(0deg);\n  }\n\n  100% {\n    transform: rotate(360deg);\n  }\n}\n\n/*--------------------------------------------------------------\n# Breadcrumbs\n--------------------------------------------------------------*/\n.breadcrumbs {\n  padding: 15px 0;\n  background: #fbfbfb;\n  min-height: 40px;\n}\n\n@media (max-width: 992px) {\n  .breadcrumbs {\n    margin-top: 66px;\n  }\n}\n\n.breadcrumbs h2 {\n  font-size: 28px;\n  font-weight: 300;\n}\n\n.breadcrumbs ol {\n  display: flex;\n  flex-wrap: wrap;\n  list-style: none;\n  padding: 0;\n  margin: 0;\n  font-size: 14px;\n}\n\n.breadcrumbs ol li+li {\n  padding-left: 10px;\n}\n\n.breadcrumbs ol li+li::before {\n  display: inline-block;\n  padding-right: 10px;\n  color: #3c3c3c;\n  content: "/";\n}\n\n@media (max-width: 768px) {\n  .breadcrumbs .d-flex {\n    display: block !important;\n  }\n\n  .breadcrumbs ol {\n    display: block;\n  }\n\n  .breadcrumbs ol li {\n    display: inline-block;\n  }\n}\n\n/*--------------------------------------------------------------\n# Footer\n--------------------------------------------------------------*/\n#footer {\n  background: #090909;\n  color: #fff;\n  font-size: 14px;\n  text-align: center;\n  padding: 30px 0;\n}\n\n#footer h3 {\n  font-size: 36px;\n  font-weight: 700;\n  color: #fff;\n  position: relative;\n  font-family: "Poppins", sans-serif;\n  padding: 0;\n  margin: 0 0 15px 0;\n}\n\n#footer p {\n  font-size: 15;\n  font-style: italic;\n  padding: 0;\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links {\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #5cb874;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  margin-right: 4px;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n}\n\n#footer .social-links a:hover {\n  background: #449d5b;\n  color: #fff;\n  text-decoration: none;\n}\n\n#footer .copyright {\n  margin: 0 0 5px 0;\n}\n\n#footer .credits {\n  font-size: 13px;\n}	/**\n* Template Name: Green\n* Updated: Sep 18 2023 with Bootstrap v5.3.2\n* Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/\n* Author: BootstrapMade.com\n* License: https://bootstrapmade.com/license/\n*/\n(function() {\n  "use strict";\n\n  /**\n   * Easy selector helper function\n   */\n  const select = (el, all = false) => {\n    el = el.trim()\n    if (all) {\n      return [...document.querySelectorAll(el)]\n    } else {\n      return document.querySelector(el)\n    }\n  }\n\n  /**\n   * Easy event listener function\n   */\n  const on = (type, el, listener, all = false) => {\n    let selectEl = select(el, all)\n    if (selectEl) {\n      if (all) {\n        selectEl.forEach(e => e.addEventListener(type, listener))\n      } else {\n        selectEl.addEventListener(type, listener)\n      }\n    }\n  }\n\n  /**\n   * Easy on scroll event listener \n   */\n  const onscroll = (el, listener) => {\n    el.addEventListener('scroll', listener)\n  }\n\n  /**\n   * Navbar links active state on scroll\n   */\n  let navbarlinks = select('#navbar .scrollto', true)\n  const navbarlinksActive = () => {\n    let position = window.scrollY + 200\n    navbarlinks.forEach(navbarlink => {\n      if (!navbarlink.hash) return\n      let section = select(navbarlink.hash)\n      if (!section) return\n      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {\n        navbarlink.classList.add('active')\n      } else {\n        navbarlink.classList.remove('active')\n      }\n    })\n  }\n  window.addEventListener('load', navbarlinksActive)\n  onscroll(document, navbarlinksActive)\n\n  /**\n   * Scrolls to an element with header offset\n   */\n  const scrollto = (el) => {\n    let header = select('#header')\n    let offset = header.offsetHeight\n\n    if (!header.classList.contains('header-scrolled')) {\n      offset -= 16\n    }\n\n    let elementPos = select(el).offsetTop\n    window.scrollTo({\n      top: elementPos - offset,\n      behavior: 'smooth'\n    })\n  }\n\n  /**\n   * Header fixed top on scroll\n   */\n  let selectHeader = select('#header')\n  if (selectHeader) {\n    let headerOffset = selectHeader.offsetTop\n    let nextElement = selectHeader.nextElementSibling\n    const headerFixed = () => {\n      if ((headerOffset - window.scrollY) <= 0) {\n        selectHeader.classList.add('fixed-top')\n        nextElement.classList.add('scrolled-offset')\n      } else {\n        selectHeader.classList.remove('fixed-top')\n        nextElement.classList.remove('scrolled-offset')\n      }\n    }\n    window.addEventListener('load', headerFixed)\n    onscroll(document, headerFixed)\n  }\n\n  /**\n   * Back to top button\n   */\n  let backtotop = select('.back-to-top')\n  if (backtotop) {\n    const toggleBacktotop = () => {\n      if (window.scrollY > 100) {\n        backtotop.classList.add('active')\n      } else {\n        backtotop.classList.remove('active')\n      }\n    }\n    window.addEventListener('load', toggleBacktotop)\n    onscroll(document, toggleBacktotop)\n  }\n\n  /**\n   * Mobile nav toggle\n   */\n  on('click', '.mobile-nav-toggle', function(e) {\n    select('#navbar').classList.toggle('navbar-mobile')\n    this.classList.toggle('bi-list')\n    this.classList.toggle('bi-x')\n  })\n\n  /**\n   * Mobile nav dropdowns activate\n   */\n  on('click', '.navbar .dropdown > a', function(e) {\n    if (select('#navbar').classList.contains('navbar-mobile')) {\n      e.preventDefault()\n      this.nextElementSibling.classList.toggle('dropdown-active')\n    }\n  }, true)\n\n  /**\n   * Scrool with ofset on links with a class name .scrollto\n   */\n  on('click', '.scrollto', function(e) {\n    if (select(this.hash)) {\n      e.preventDefault()\n\n      let navbar = select('#navbar')\n      if (navbar.classList.contains('navbar-mobile')) {\n        navbar.classList.remove('navbar-mobile')\n        let navbarToggle = select('.mobile-nav-toggle')\n        navbarToggle.classList.toggle('bi-list')\n        navbarToggle.classList.toggle('bi-x')\n      }\n      scrollto(this.hash)\n    }\n  }, true)\n\n  /**\n   * Scroll with ofset on page load with hash links in the url\n   */\n  window.addEventListener('load', () => {\n    if (window.location.hash) {\n      if (select(window.location.hash)) {\n        scrollto(window.location.hash)\n      }\n    }\n  });\n\n  /**\n   * Hero carousel indicators\n   */\n  let heroCarouselIndicators = select("#hero-carousel-indicators")\n  let heroCarouselItems = select('#heroCarousel .carousel-item', true)\n\n  heroCarouselItems.forEach((item, index) => {\n    (index === 0) ?\n    heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "' class='active'></li>":\n      heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "'></li>"\n  });\n\n  /**\n   * Clients Slider\n   */\n  new Swiper('.clients-slider', {\n    speed: 400,\n    loop: true,\n    autoplay: {\n      delay: 5000,\n      disableOnInteraction: false\n    },\n    slidesPerView: 'auto',\n    pagination: {\n      el: '.swiper-pagination',\n      type: 'bullets',\n      clickable: true\n    },\n    breakpoints: {\n      320: {\n        slidesPerView: 2,\n        spaceBetween: 40\n      },\n      480: {\n        slidesPerView: 3,\n        spaceBetween: 60\n      },\n      640: {\n        slidesPerView: 4,\n        spaceBetween: 80\n      },\n      992: {\n        slidesPerView: 6,\n        spaceBetween: 120\n      }\n    }\n  });\n\n  /**\n   * Porfolio isotope and filter\n   */\n  window.addEventListener('load', () => {\n    let portfolioContainer = select('.portfolio-container');\n    if (portfolioContainer) {\n      let portfolioIsotope = new Isotope(portfolioContainer, {\n        itemSelector: '.portfolio-item'\n      });\n\n      let portfolioFilters = select('#portfolio-flters li', true);\n\n      on('click', '#portfolio-flters li', function(e) {\n        e.preventDefault();\n        portfolioFilters.forEach(function(el) {\n          el.classList.remove('filter-active');\n        });\n        this.classList.add('filter-active');\n\n        portfolioIsotope.arrange({\n          filter: this.getAttribute('data-filter')\n        });\n\n      }, true);\n    }\n\n  });\n\n  /**\n   * Initiate portfolio lightbox \n   */\n  const portfolioLightbox = GLightbox({\n    selector: '.portfolio-lightbox'\n  });\n\n  /**\n   * Portfolio details slider\n   */\n  new Swiper('.portfolio-details-slider', {\n    speed: 400,\n    loop: true,\n    autoplay: {\n      delay: 5000,\n      disableOnInteraction: false\n    },\n    pagination: {\n      el: '.swiper-pagination',\n      type: 'bullets',\n      clickable: true\n    }\n  });\n\n})()\n	0	2025-05-01 11:23:38.598328	2025-05-01 11:23:38.598328
3	1	1	application	Inner	inner	<main id="main">\n    <section class="inner-page">\n      <div class="container">{{ cms:wysiwyg content }}\n      </div>\n    </section>\n\n  </main><!-- End #main -->\n	/**\n* Template Name: Green\n* Updated: Sep 18 2023 with Bootstrap v5.3.2\n* Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/\n* Author: BootstrapMade.com\n* License: https://bootstrapmade.com/license/\n*/\n\n/*--------------------------------------------------------------\n# General\n--------------------------------------------------------------*/\nbody {\n  font-family: "Open Sans", sans-serif;\n  color: #444444;\n}\n\na {\n  text-decoration: none;\n  color: #5cb874;\n}\n\na:hover {\n  color: #80c792;\n  text-decoration: none;\n}\n\nh1,\nh2,\nh3,\nh4,\nh5,\nh6 {\n  font-family: "Raleway", sans-serif;\n}\n\n/*--------------------------------------------------------------\n# Back to top button\n--------------------------------------------------------------*/\n.back-to-top {\n  position: fixed;\n  visibility: hidden;\n  opacity: 0;\n  right: 15px;\n  bottom: 15px;\n  z-index: 996;\n  background: #5cb874;\n  width: 40px;\n  height: 40px;\n  border-radius: 4px;\n  transition: all 0.4s;\n}\n\n.back-to-top i {\n  font-size: 24px;\n  color: #fff;\n  line-height: 0;\n}\n\n.back-to-top:hover {\n  background: #78c48c;\n  color: #fff;\n}\n\n.back-to-top.active {\n  visibility: visible;\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Top Bar\n--------------------------------------------------------------*/\n#topbar {\n  background: #fbfbfb;\n  font-size: 15px;\n  height: 40px;\n  padding: 0;\n}\n\n#topbar .contact-info a {\n  line-height: 0;\n  color: #444444;\n  transition: 0.3s;\n}\n\n#topbar .contact-info a:hover {\n  color: #5cb874;\n}\n\n#topbar .contact-info i {\n  color: #5cb874;\n  line-height: 0;\n  margin-right: 5px;\n}\n\n#topbar .contact-info .phone-icon {\n  margin-left: 15px;\n}\n\n#topbar .social-links a {\n  color: #6f6f6f;\n  padding: 4px 12px;\n  display: inline-block;\n  line-height: 1px;\n  transition: 0.3s;\n}\n\n#topbar .social-links a:hover {\n  color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Header\n--------------------------------------------------------------*/\n#header {\n  background: #fff;\n  transition: all 0.5s;\n  z-index: 997;\n  height: 70px;\n}\n\n#header.header-scrolled {\n  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);\n}\n\n#header .logo {\n  font-size: 30px;\n  margin: 0;\n  padding: 0;\n  line-height: 1;\n  font-weight: 700;\n  letter-spacing: 1px;\n  text-transform: uppercase;\n}\n\n#header .logo a {\n  color: #5cb874;\n}\n\n#header .logo img {\n  max-height: 40px;\n}\n\n.scrolled-offset {\n  margin-top: 70px;\n}\n\n/*--------------------------------------------------------------\n# Navigation Menu\n--------------------------------------------------------------*/\n/**\n* Desktop Navigation\n*/\n.navbar {\n  padding: 0;\n}\n\n.navbar ul {\n  margin: 0;\n  padding: 0;\n  display: flex;\n  list-style: none;\n  align-items: center;\n}\n\n.navbar li {\n  position: relative;\n}\n\n.navbar a,\n.navbar a:focus {\n  display: flex;\n  align-items: center;\n  justify-content: space-between;\n  padding: 10px 0 10px 30px;\n  font-size: 15px;\n  color: #222222;\n  white-space: nowrap;\n  transition: 0.3s;\n}\n\n.navbar a i,\n.navbar a:focus i {\n  font-size: 12px;\n  line-height: 0;\n  margin-left: 5px;\n}\n\n.navbar a:hover,\n.navbar .active,\n.navbar .active:focus,\n.navbar li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .getstarted,\n.navbar .getstarted:focus {\n  color: #5cb874;\n  padding: 8px 25px;\n  margin-left: 30px;\n  border-radius: 4px;\n  border: 2px solid #5cb874;\n  transition: 0.3s;\n  font-size: 14px;\n}\n\n.navbar .getstarted:hover,\n.navbar .getstarted:focus:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.navbar .dropdown ul {\n  display: block;\n  position: absolute;\n  left: 14px;\n  top: calc(100% + 30px);\n  margin: 0;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 0;\n  visibility: hidden;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n  transition: 0.3s;\n}\n\n.navbar .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar .dropdown ul a {\n  padding: 10px 20px;\n  text-transform: none;\n}\n\n.navbar .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar .dropdown ul a:hover,\n.navbar .dropdown ul .active:hover,\n.navbar .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar .dropdown:hover>ul {\n  opacity: 1;\n  top: 100%;\n  visibility: visible;\n}\n\n.navbar .dropdown .dropdown ul {\n  top: 0;\n  left: calc(100% - 30px);\n  visibility: hidden;\n}\n\n.navbar .dropdown .dropdown:hover>ul {\n  opacity: 1;\n  top: 0;\n  left: 100%;\n  visibility: visible;\n}\n\n@media (max-width: 1366px) {\n  .navbar .dropdown .dropdown ul {\n    left: -90%;\n  }\n\n  .navbar .dropdown .dropdown:hover>ul {\n    left: -100%;\n  }\n}\n\n/**\n* Mobile Navigation\n*/\n.mobile-nav-toggle {\n  color: #222222;\n  font-size: 28px;\n  cursor: pointer;\n  display: none;\n  line-height: 0;\n  transition: 0.5s;\n}\n\n.mobile-nav-toggle.bi-x {\n  color: #fff;\n}\n\n@media (max-width: 991px) {\n  .mobile-nav-toggle {\n    display: block;\n  }\n\n  .navbar ul {\n    display: none;\n  }\n}\n\n.navbar-mobile {\n  position: fixed;\n  overflow: hidden;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n  background: rgba(9, 9, 9, 0.9);\n  transition: 0.3s;\n  z-index: 999;\n}\n\n.navbar-mobile .mobile-nav-toggle {\n  position: absolute;\n  top: 15px;\n  right: 15px;\n}\n\n.navbar-mobile ul {\n  display: block;\n  position: absolute;\n  top: 55px;\n  right: 15px;\n  bottom: 15px;\n  left: 15px;\n  padding: 10px 0;\n  background-color: #fff;\n  overflow-y: auto;\n  transition: 0.3s;\n}\n\n.navbar-mobile a,\n.navbar-mobile a:focus {\n  padding: 10px 20px;\n  font-size: 15px;\n  color: #222222;\n}\n\n.navbar-mobile a:hover,\n.navbar-mobile .active,\n.navbar-mobile li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .getstarted,\n.navbar-mobile .getstarted:focus {\n  margin: 15px;\n}\n\n.navbar-mobile .dropdown ul {\n  position: static;\n  display: none;\n  margin: 10px 20px;\n  padding: 10px 0;\n  z-index: 99;\n  opacity: 1;\n  visibility: visible;\n  background: #fff;\n  box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);\n}\n\n.navbar-mobile .dropdown ul li {\n  min-width: 200px;\n}\n\n.navbar-mobile .dropdown ul a {\n  padding: 10px 20px;\n}\n\n.navbar-mobile .dropdown ul a i {\n  font-size: 12px;\n}\n\n.navbar-mobile .dropdown ul a:hover,\n.navbar-mobile .dropdown ul .active:hover,\n.navbar-mobile .dropdown ul li:hover>a {\n  color: #5cb874;\n}\n\n.navbar-mobile .dropdown>.dropdown-active {\n  display: block;\n}\n\n/*--------------------------------------------------------------\n# Hero Section\n--------------------------------------------------------------*/\n#hero {\n  width: 100%;\n  height: 70vh;\n  background-color: rgba(9, 9, 9, 0.8);\n  overflow: hidden;\n  position: relative;\n}\n\n#hero .carousel,\n#hero .carousel-inner,\n#hero .carousel-item,\n#hero .carousel-item::before {\n  background-size: cover;\n  background-position: center;\n  background-repeat: no-repeat;\n  position: absolute;\n  top: 0;\n  right: 0;\n  left: 0;\n  bottom: 0;\n}\n\n#hero .carousel-item::before {\n  content: "";\n  background-color: rgba(45, 103, 60, 0.8);\n}\n\n#hero .carousel-container {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  position: absolute;\n  bottom: 0;\n  top: 0;\n  left: 50px;\n  right: 50px;\n}\n\n#hero .container {\n  text-align: center;\n}\n\n#hero h2 {\n  color: #fff;\n  margin-bottom: 20px;\n  font-size: 48px;\n  font-weight: 700;\n}\n\n#hero p {\n  animation-delay: 0.4s;\n  margin: 0 auto 30px auto;\n  color: #fff;\n}\n\n#hero .carousel-inner .carousel-item {\n  transition-property: opacity;\n  background-position: center top;\n}\n\n#hero .carousel-inner .carousel-item,\n#hero .carousel-inner .active.carousel-item-start,\n#hero .carousel-inner .active.carousel-item-end {\n  opacity: 0;\n}\n\n#hero .carousel-inner .active,\n#hero .carousel-inner .carousel-item-next.carousel-item-start,\n#hero .carousel-inner .carousel-item-prev.carousel-item-end {\n  opacity: 1;\n  transition: 0.5s;\n}\n\n#hero .carousel-control-next-icon,\n#hero .carousel-control-prev-icon {\n  background: none;\n  font-size: 30px;\n  line-height: 0;\n  width: auto;\n  height: auto;\n  background: rgba(255, 255, 255, 0.2);\n  border-radius: 50px;\n  transition: 0.3s;\n  color: rgba(255, 255, 255, 0.5);\n  width: 54px;\n  height: 54px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n}\n\n#hero .carousel-control-next-icon:hover,\n#hero .carousel-control-prev-icon:hover {\n  background: rgba(255, 255, 255, 0.3);\n  color: rgba(255, 255, 255, 0.8);\n}\n\n#hero .carousel-indicators li {\n  list-style-type: none;\n  cursor: pointer;\n  background: #fff;\n  overflow: hidden;\n  border: 0;\n  width: 12px;\n  height: 12px;\n  border-radius: 50px;\n  opacity: 0.6;\n  transition: 0.3s;\n}\n\n#hero .carousel-indicators li.active {\n  opacity: 1;\n  background: #5cb874;\n}\n\n#hero .btn-get-started {\n  font-family: "Raleway", sans-serif;\n  font-weight: 500;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 14px 32px;\n  border-radius: 4px;\n  transition: 0.5s;\n  line-height: 1;\n  color: #fff;\n  animation-delay: 0.8s;\n  background: #5cb874;\n}\n\n#hero .btn-get-started:hover {\n  background: #6ec083;\n}\n\n@media (max-width: 992px) {\n  #hero {\n    height: 100vh;\n  }\n\n  #hero .carousel-container {\n    top: 66px;\n  }\n}\n\n@media (max-width: 768px) {\n  #hero h2 {\n    font-size: 28px;\n  }\n}\n\n@media (min-width: 1024px) {\n\n  #hero .carousel-control-prev,\n  #hero .carousel-control-next {\n    width: 5%;\n  }\n}\n\n@media (max-height: 500px) {\n  #hero {\n    height: 120vh;\n  }\n}\n\n/*--------------------------------------------------------------\n# Sections General\n--------------------------------------------------------------*/\nsection {\n  padding: 60px 0;\n}\n\n.section-bg {\n  background-color: #f8fcf9;\n}\n\n.section-title {\n  text-align: center;\n  padding-bottom: 30px;\n}\n\n.section-title h2 {\n  font-size: 32px;\n  font-weight: bold;\n  text-transform: uppercase;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  position: relative;\n}\n\n.section-title h2::before {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 120px;\n  height: 1px;\n  background: #ddd;\n  bottom: 1px;\n  left: calc(50% - 60px);\n}\n\n.section-title h2::after {\n  content: "";\n  position: absolute;\n  display: block;\n  width: 40px;\n  height: 3px;\n  background: #5cb874;\n  bottom: 0;\n  left: calc(50% - 20px);\n}\n\n.section-title p {\n  margin-bottom: 0;\n  font-size: 14px;\n  color: #919191;\n}\n\n/*--------------------------------------------------------------\n# Featured Services\n--------------------------------------------------------------*/\n.featured-services {\n  padding: 20px 0;\n}\n\n.featured-services .icon-box {\n  padding: 20px;\n}\n\n.featured-services .icon-box-bg {\n  background-image: linear-gradient(0deg, #222222 0%, #2f2f2f 50%, #222222 100%);\n}\n\n.featured-services .icon {\n  margin-bottom: 15px;\n}\n\n.featured-services .icon i {\n  color: #5cb874;\n  font-size: 42px;\n}\n\n.featured-services .title {\n  font-weight: 700;\n  margin-bottom: 15px;\n  font-size: 18px;\n}\n\n.featured-services .title a {\n  color: #222222;\n  transition: 0.3s;\n}\n\n.featured-services .icon-box:hover .title a {\n  color: #5cb874;\n}\n\n.featured-services .description {\n  line-height: 24px;\n  font-size: 14px;\n}\n\n/*--------------------------------------------------------------\n# About Us\n--------------------------------------------------------------*/\n.about .content h3 {\n  font-weight: 700;\n  font-size: 28px;\n}\n\n.about .content ul {\n  list-style: none;\n  padding: 0;\n}\n\n.about .content ul li {\n  padding-bottom: 10px;\n}\n\n.about .content ul i {\n  font-size: 20px;\n  padding-right: 4px;\n  color: #5cb874;\n}\n\n.about .content p:last-child {\n  margin-bottom: 0;\n}\n\n/*--------------------------------------------------------------\n# Why Us\n--------------------------------------------------------------*/\n.why-us {\n  padding: 0;\n}\n\n.why-us .row {\n  overflow: hidden;\n}\n\n.why-us .content-item {\n  padding: 40px;\n  border-left: 1px solid #eee;\n  border-bottom: 1px solid #eee;\n  margin: -1px;\n}\n\n.why-us .content-item span {\n  display: block;\n  font-size: 24px;\n  font-weight: 400;\n  color: #6ec083;\n}\n\n.why-us .content-item h4 {\n  font-size: 26px;\n  font-weight: 300;\n  padding: 0;\n  margin: 20px 0;\n}\n\n.why-us .content-item p {\n  color: #aaaaaa;\n  font-size: 15px;\n  margin: 0;\n  padding: 0;\n}\n\n@media (max-width: 768px) {\n  .why-us .content-item {\n    padding: 40px 0;\n  }\n}\n\n/*--------------------------------------------------------------\n# Our Clients\n--------------------------------------------------------------*/\n.clients .swiper-slide img {\n  opacity: 0.5;\n  transition: 0.3s;\n}\n\n.clients .swiper-slide img:hover {\n  opacity: 1;\n}\n\n.clients .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.clients .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n/*--------------------------------------------------------------\n# Services\n--------------------------------------------------------------*/\n.services .icon-box {\n  text-align: center;\n  padding: 70px 20px 80px 20px;\n  transition: all ease-in-out 0.3s;\n  background: #fff;\n  box-shadow: 0px 5px 90px 0px rgba(110, 123, 131, 0.1);\n}\n\n.services .icon-box .icon {\n  margin: 0 auto;\n  width: 100px;\n  height: 100px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n  transition: ease-in-out 0.3s;\n  position: relative;\n}\n\n.services .icon-box .icon i {\n  font-size: 36px;\n  transition: 0.5s;\n  position: relative;\n}\n\n.services .icon-box .icon svg {\n  position: absolute;\n  top: 0;\n  left: 0;\n}\n\n.services .icon-box .icon svg path {\n  transition: 0.5s;\n  fill: #f5f5f5;\n}\n\n.services .icon-box h4 {\n  font-weight: 600;\n  margin: 10px 0 15px 0;\n  font-size: 22px;\n}\n\n.services .icon-box h4 a {\n  color: #222222;\n  transition: ease-in-out 0.3s;\n}\n\n.services .icon-box p {\n  line-height: 24px;\n  font-size: 14px;\n  margin-bottom: 0;\n}\n\n.services .icon-box:hover {\n  border-color: #fff;\n  box-shadow: 0px 0 35px 0 rgba(0, 0, 0, 0.08);\n}\n\n.services .iconbox-blue i {\n  color: #47aeff;\n}\n\n.services .iconbox-blue:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-blue:hover .icon path {\n  fill: #47aeff;\n}\n\n.services .iconbox-orange i {\n  color: #ffa76e;\n}\n\n.services .iconbox-orange:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-orange:hover .icon path {\n  fill: #ffa76e;\n}\n\n.services .iconbox-pink i {\n  color: #e80368;\n}\n\n.services .iconbox-pink:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-pink:hover .icon path {\n  fill: #e80368;\n}\n\n.services .iconbox-yellow i {\n  color: #ffbb2c;\n}\n\n.services .iconbox-yellow:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-yellow:hover .icon path {\n  fill: #ffbb2c;\n}\n\n.services .iconbox-red i {\n  color: #ff5828;\n}\n\n.services .iconbox-red:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-red:hover .icon path {\n  fill: #ff5828;\n}\n\n.services .iconbox-teal i {\n  color: #11dbcf;\n}\n\n.services .iconbox-teal:hover .icon i {\n  color: #fff;\n}\n\n.services .iconbox-teal:hover .icon path {\n  fill: #11dbcf;\n}\n\n/*--------------------------------------------------------------\n# Cta\n--------------------------------------------------------------*/\n.cta {\n  background: #5cb874;\n  padding: 80px 0;\n}\n\n.cta h3 {\n  color: #fff;\n  font-size: 28px;\n  font-weight: 700;\n}\n\n.cta p {\n  color: #fff;\n}\n\n.cta .cta-btn {\n  font-family: "Raleway", sans-serif;\n  font-weight: 600;\n  font-size: 14px;\n  letter-spacing: 1px;\n  display: inline-block;\n  padding: 10px 30px;\n  border-radius: 2px;\n  transition: 0.5s;\n  margin: 10px;\n  border: 2px solid #fff;\n  color: #fff;\n  border-radius: 4px;\n}\n\n.cta .cta-btn:hover {\n  background: #fff;\n  color: #5cb874;\n}\n\n@media (max-width: 1024px) {\n  .cta {\n    background-attachment: scroll;\n  }\n}\n\n@media (min-width: 769px) {\n  .cta .cta-btn-container {\n    display: flex;\n    align-items: center;\n    justify-content: flex-end;\n  }\n}\n\n/*--------------------------------------------------------------\n# Portfolio\n--------------------------------------------------------------*/\n.portfolio .portfolio-item {\n  margin-bottom: 30px;\n}\n\n.portfolio #portfolio-flters {\n  padding: 0;\n  margin: 0 auto 20px auto;\n  list-style: none;\n  text-align: center;\n}\n\n.portfolio #portfolio-flters li {\n  cursor: pointer;\n  display: inline-block;\n  padding: 8px 15px 10px 15px;\n  font-size: 14px;\n  font-weight: 600;\n  line-height: 1;\n  text-transform: uppercase;\n  color: #444444;\n  margin-bottom: 5px;\n  transition: all 0.3s ease-in-out;\n  border-radius: 3px;\n}\n\n.portfolio #portfolio-flters li:hover,\n.portfolio #portfolio-flters li.filter-active {\n  color: #fff;\n  background: #5cb874;\n}\n\n.portfolio #portfolio-flters li:last-child {\n  margin-right: 0;\n}\n\n.portfolio .portfolio-wrap {\n  transition: 0.3s;\n  position: relative;\n  overflow: hidden;\n  z-index: 1;\n  background: rgba(34, 34, 34, 0.6);\n}\n\n.portfolio .portfolio-wrap::before {\n  content: "";\n  background: rgba(34, 34, 34, 0.6);\n  position: absolute;\n  left: 0;\n  right: 0;\n  top: 0;\n  bottom: 0;\n  transition: all ease-in-out 0.3s;\n  z-index: 2;\n  opacity: 0;\n}\n\n.portfolio .portfolio-wrap img {\n  transition: all ease-in-out 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-info {\n  opacity: 0;\n  position: absolute;\n  top: 0;\n  left: 0;\n  right: 0;\n  bottom: 0;\n  z-index: 3;\n  transition: all ease-in-out 0.3s;\n  display: flex;\n  flex-direction: column;\n  justify-content: flex-end;\n  align-items: flex-start;\n  padding: 20px;\n}\n\n.portfolio .portfolio-wrap .portfolio-info h4 {\n  font-size: 20px;\n  color: #fff;\n  font-weight: 600;\n}\n\n.portfolio .portfolio-wrap .portfolio-info p {\n  color: rgba(255, 255, 255, 0.7);\n  font-size: 14px;\n  text-transform: uppercase;\n  padding: 0;\n  margin: 0;\n  font-style: italic;\n}\n\n.portfolio .portfolio-wrap .portfolio-links {\n  text-align: center;\n  z-index: 4;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a {\n  color: #fff;\n  margin: 0 5px 0 0;\n  font-size: 28px;\n  display: inline-block;\n  transition: 0.3s;\n}\n\n.portfolio .portfolio-wrap .portfolio-links a:hover {\n  color: #6ec083;\n}\n\n.portfolio .portfolio-wrap:hover::before {\n  opacity: 1;\n}\n\n.portfolio .portfolio-wrap:hover img {\n  transform: scale(1.2);\n}\n\n.portfolio .portfolio-wrap:hover .portfolio-info {\n  opacity: 1;\n}\n\n/*--------------------------------------------------------------\n# Portfolio Details\n--------------------------------------------------------------*/\n.portfolio-details {\n  padding-top: 40px;\n}\n\n.portfolio-details .portfolio-details-slider img {\n  width: 100%;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination {\n  margin-top: 20px;\n  position: relative;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet {\n  width: 12px;\n  height: 12px;\n  background-color: #fff;\n  opacity: 1;\n  border: 1px solid #5cb874;\n}\n\n.portfolio-details .portfolio-details-slider .swiper-pagination .swiper-pagination-bullet-active {\n  background-color: #5cb874;\n}\n\n.portfolio-details .portfolio-info {\n  padding: 30px;\n  box-shadow: 0px 0 30px rgba(34, 34, 34, 0.08);\n}\n\n.portfolio-details .portfolio-info h3 {\n  font-size: 22px;\n  font-weight: 700;\n  margin-bottom: 20px;\n  padding-bottom: 20px;\n  border-bottom: 1px solid #eee;\n}\n\n.portfolio-details .portfolio-info ul {\n  list-style: none;\n  padding: 0;\n  font-size: 15px;\n}\n\n.portfolio-details .portfolio-info ul li+li {\n  margin-top: 10px;\n}\n\n.portfolio-details .portfolio-description {\n  padding-top: 30px;\n}\n\n.portfolio-details .portfolio-description h2 {\n  font-size: 26px;\n  font-weight: 700;\n  margin-bottom: 20px;\n}\n\n.portfolio-details .portfolio-description p {\n  padding: 0;\n}\n\n/*--------------------------------------------------------------\n# Team\n--------------------------------------------------------------*/\n.team .member {\n  text-align: center;\n  margin-bottom: 20px;\n  box-shadow: 0px 0px 12px 0px rgba(34, 34, 34, 0.07);\n  padding: 30px 20px;\n  background: #fff;\n}\n\n.team .member img {\n  max-width: 60%;\n  border-radius: 50%;\n  margin: 0 0 30px 0;\n}\n\n.team .member h4 {\n  font-weight: 700;\n  margin-bottom: 2px;\n  font-size: 18px;\n}\n\n.team .member span {\n  font-style: italic;\n  display: block;\n  font-size: 13px;\n}\n\n.team .member p {\n  padding-top: 10px;\n  font-size: 14px;\n  font-style: italic;\n  color: #aaaaaa;\n}\n\n.team .member .social {\n  margin-top: 15px;\n}\n\n.team .member .social a {\n  color: #919191;\n  transition: 0.3s;\n}\n\n.team .member .social a:hover {\n  color: #5cb874;\n}\n\n.team .member .social i {\n  font-size: 18px;\n  margin: 0 2px;\n}\n\n/*--------------------------------------------------------------\n# Contact\n--------------------------------------------------------------*/\n.contact .info {\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  width: 100%;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .info i {\n  font-size: 20px;\n  color: #5cb874;\n  float: left;\n  width: 44px;\n  height: 44px;\n  background: #eaf6ed;\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  border-radius: 50px;\n  transition: all 0.3s ease-in-out;\n}\n\n.contact .info h4 {\n  padding: 0 0 0 60px;\n  font-size: 20px;\n  font-weight: 600;\n  margin-bottom: 5px;\n  color: #222222;\n}\n\n.contact .info p {\n  padding: 0 0 10px 60px;\n  margin-bottom: 20px;\n  font-size: 14px;\n  color: #555555;\n}\n\n.contact .info .social-links {\n  padding-left: 60px;\n}\n\n.contact .info .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #333;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n  margin-right: 10px;\n}\n\n.contact .info .social-links a:hover {\n  background: #5cb874;\n  color: #fff;\n}\n\n.contact .info .email:hover i,\n.contact .info .address:hover i,\n.contact .info .phone:hover i {\n  background: #5cb874;\n  color: #fff;\n}\n.contact .email-form {\n  width: 100%;\n  border-top: 3px solid #5cb874;\n  border-bottom: 3px solid #5cb874;\n  padding: 30px;\n  background: #fff;\n  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);\n}\n\n.contact .email-form .form-group {\n  padding-bottom: 8px;\n}\n\n.contact .email-form .error-message {\n  display: none;\n  color: #fff;\n  background: #ed3c0d;\n  text-align: left;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .error-message br+br {\n  margin-top: 25px;\n}\n\n.contact .email-form .sent-message {\n  display: none;\n  color: #fff;\n  background: #18d26e;\n  text-align: center;\n  padding: 15px;\n  font-weight: 600;\n}\n\n.contact .email-form .loading {\n  display: none;\n  background: #fff;\n  text-align: center;\n  padding: 15px;\n}\n\n.contact .email-form .loading:before {\n  content: "";\n  display: inline-block;\n  border-radius: 50%;\n  width: 24px;\n  height: 24px;\n  margin: 0 10px -6px 0;\n  border: 3px solid #18d26e;\n  border-top-color: #eee;\n  animation: animate-loading 1s linear infinite;\n}\n\n.contact .email-form input,\n.contact .email-form textarea {\n  border-radius: 0;\n  box-shadow: none;\n  font-size: 14px;\n  border-radius: 4px;\n}\n\n.contact .email-form input:focus,\n.contact .email-form textarea:focus {\n  border-color: #5cb874;\n}\n\n.contact .email-form input {\n  height: 44px;\n}\n\n.contact .email-form textarea {\n  padding: 10px 12px;\n}\n\n.contact .email-form button[type=submit] {\n  background: #5cb874;\n  border: 0;\n  padding: 10px 24px;\n  color: #fff;\n  transition: 0.4s;\n  border-radius: 4px;\n}\n\n.contact .email-form button[type=submit]:hover {\n  background: #6ec083;\n}\n\n@keyframes animate-loading {\n  0% {\n    transform: rotate(0deg);\n  }\n\n  100% {\n    transform: rotate(360deg);\n  }\n}\n\n/*--------------------------------------------------------------\n# Breadcrumbs\n--------------------------------------------------------------*/\n.breadcrumbs {\n  padding: 15px 0;\n  background: #fbfbfb;\n  min-height: 40px;\n}\n\n@media (max-width: 992px) {\n  .breadcrumbs {\n    margin-top: 66px;\n  }\n}\n\n.breadcrumbs h2 {\n  font-size: 28px;\n  font-weight: 300;\n}\n\n.breadcrumbs ol {\n  display: flex;\n  flex-wrap: wrap;\n  list-style: none;\n  padding: 0;\n  margin: 0;\n  font-size: 14px;\n}\n\n.breadcrumbs ol li+li {\n  padding-left: 10px;\n}\n\n.breadcrumbs ol li+li::before {\n  display: inline-block;\n  padding-right: 10px;\n  color: #3c3c3c;\n  content: "/";\n}\n\n@media (max-width: 768px) {\n  .breadcrumbs .d-flex {\n    display: block !important;\n  }\n\n  .breadcrumbs ol {\n    display: block;\n  }\n\n  .breadcrumbs ol li {\n    display: inline-block;\n  }\n}\n\n/*--------------------------------------------------------------\n# Footer\n--------------------------------------------------------------*/\n#footer {\n  background: #090909;\n  color: #fff;\n  font-size: 14px;\n  text-align: center;\n  padding: 30px 0;\n}\n\n#footer h3 {\n  font-size: 36px;\n  font-weight: 700;\n  color: #fff;\n  position: relative;\n  font-family: "Poppins", sans-serif;\n  padding: 0;\n  margin: 0 0 15px 0;\n}\n\n#footer p {\n  font-size: 15;\n  font-style: italic;\n  padding: 0;\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links {\n  margin: 0 0 40px 0;\n}\n\n#footer .social-links a {\n  font-size: 18px;\n  display: inline-block;\n  background: #5cb874;\n  color: #fff;\n  line-height: 1;\n  padding: 8px 0;\n  margin-right: 4px;\n  border-radius: 50%;\n  text-align: center;\n  width: 36px;\n  height: 36px;\n  transition: 0.3s;\n}\n\n#footer .social-links a:hover {\n  background: #449d5b;\n  color: #fff;\n  text-decoration: none;\n}\n\n#footer .copyright {\n  margin: 0 0 5px 0;\n}\n\n#footer .credits {\n  font-size: 13px;\n}	/**\n* Template Name: Green\n* Updated: Sep 18 2023 with Bootstrap v5.3.2\n* Template URL: https://bootstrapmade.com/green-free-one-page-bootstrap-template/\n* Author: BootstrapMade.com\n* License: https://bootstrapmade.com/license/\n*/\n(function() {\n  "use strict";\n\n  /**\n   * Easy selector helper function\n   */\n  const select = (el, all = false) => {\n    el = el.trim()\n    if (all) {\n      return [...document.querySelectorAll(el)]\n    } else {\n      return document.querySelector(el)\n    }\n  }\n\n  /**\n   * Easy event listener function\n   */\n  const on = (type, el, listener, all = false) => {\n    let selectEl = select(el, all)\n    if (selectEl) {\n      if (all) {\n        selectEl.forEach(e => e.addEventListener(type, listener))\n      } else {\n        selectEl.addEventListener(type, listener)\n      }\n    }\n  }\n\n  /**\n   * Easy on scroll event listener \n   */\n  const onscroll = (el, listener) => {\n    el.addEventListener('scroll', listener)\n  }\n\n  /**\n   * Navbar links active state on scroll\n   */\n  let navbarlinks = select('#navbar .scrollto', true)\n  const navbarlinksActive = () => {\n    let position = window.scrollY + 200\n    navbarlinks.forEach(navbarlink => {\n      if (!navbarlink.hash) return\n      let section = select(navbarlink.hash)\n      if (!section) return\n      if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {\n        navbarlink.classList.add('active')\n      } else {\n        navbarlink.classList.remove('active')\n      }\n    })\n  }\n  window.addEventListener('load', navbarlinksActive)\n  onscroll(document, navbarlinksActive)\n\n  /**\n   * Scrolls to an element with header offset\n   */\n  const scrollto = (el) => {\n    let header = select('#header')\n    let offset = header.offsetHeight\n\n    if (!header.classList.contains('header-scrolled')) {\n      offset -= 16\n    }\n\n    let elementPos = select(el).offsetTop\n    window.scrollTo({\n      top: elementPos - offset,\n      behavior: 'smooth'\n    })\n  }\n\n  /**\n   * Header fixed top on scroll\n   */\n  let selectHeader = select('#header')\n  if (selectHeader) {\n    let headerOffset = selectHeader.offsetTop\n    let nextElement = selectHeader.nextElementSibling\n    const headerFixed = () => {\n      if ((headerOffset - window.scrollY) <= 0) {\n        selectHeader.classList.add('fixed-top')\n        nextElement.classList.add('scrolled-offset')\n      } else {\n        selectHeader.classList.remove('fixed-top')\n        nextElement.classList.remove('scrolled-offset')\n      }\n    }\n    window.addEventListener('load', headerFixed)\n    onscroll(document, headerFixed)\n  }\n\n  /**\n   * Back to top button\n   */\n  let backtotop = select('.back-to-top')\n  if (backtotop) {\n    const toggleBacktotop = () => {\n      if (window.scrollY > 100) {\n        backtotop.classList.add('active')\n      } else {\n        backtotop.classList.remove('active')\n      }\n    }\n    window.addEventListener('load', toggleBacktotop)\n    onscroll(document, toggleBacktotop)\n  }\n\n  /**\n   * Mobile nav toggle\n   */\n  on('click', '.mobile-nav-toggle', function(e) {\n    select('#navbar').classList.toggle('navbar-mobile')\n    this.classList.toggle('bi-list')\n    this.classList.toggle('bi-x')\n  })\n\n  /**\n   * Mobile nav dropdowns activate\n   */\n  on('click', '.navbar .dropdown > a', function(e) {\n    if (select('#navbar').classList.contains('navbar-mobile')) {\n      e.preventDefault()\n      this.nextElementSibling.classList.toggle('dropdown-active')\n    }\n  }, true)\n\n  /**\n   * Scrool with ofset on links with a class name .scrollto\n   */\n  on('click', '.scrollto', function(e) {\n    if (select(this.hash)) {\n      e.preventDefault()\n\n      let navbar = select('#navbar')\n      if (navbar.classList.contains('navbar-mobile')) {\n        navbar.classList.remove('navbar-mobile')\n        let navbarToggle = select('.mobile-nav-toggle')\n        navbarToggle.classList.toggle('bi-list')\n        navbarToggle.classList.toggle('bi-x')\n      }\n      scrollto(this.hash)\n    }\n  }, true)\n\n  /**\n   * Scroll with ofset on page load with hash links in the url\n   */\n  window.addEventListener('load', () => {\n    if (window.location.hash) {\n      if (select(window.location.hash)) {\n        scrollto(window.location.hash)\n      }\n    }\n  });\n\n  /**\n   * Hero carousel indicators\n   */\n  let heroCarouselIndicators = select("#hero-carousel-indicators")\n  let heroCarouselItems = select('#heroCarousel .carousel-item', true)\n\n  heroCarouselItems.forEach((item, index) => {\n    (index === 0) ?\n    heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "' class='active'></li>":\n      heroCarouselIndicators.innerHTML += "<li data-bs-target='#heroCarousel' data-bs-slide-to='" + index + "'></li>"\n  });\n\n  /**\n   * Clients Slider\n   */\n  new Swiper('.clients-slider', {\n    speed: 400,\n    loop: true,\n    autoplay: {\n      delay: 5000,\n      disableOnInteraction: false\n    },\n    slidesPerView: 'auto',\n    pagination: {\n      el: '.swiper-pagination',\n      type: 'bullets',\n      clickable: true\n    },\n    breakpoints: {\n      320: {\n        slidesPerView: 2,\n        spaceBetween: 40\n      },\n      480: {\n        slidesPerView: 3,\n        spaceBetween: 60\n      },\n      640: {\n        slidesPerView: 4,\n        spaceBetween: 80\n      },\n      992: {\n        slidesPerView: 6,\n        spaceBetween: 120\n      }\n    }\n  });\n\n  /**\n   * Porfolio isotope and filter\n   */\n  window.addEventListener('load', () => {\n    let portfolioContainer = select('.portfolio-container');\n    if (portfolioContainer) {\n      let portfolioIsotope = new Isotope(portfolioContainer, {\n        itemSelector: '.portfolio-item'\n      });\n\n      let portfolioFilters = select('#portfolio-flters li', true);\n\n      on('click', '#portfolio-flters li', function(e) {\n        e.preventDefault();\n        portfolioFilters.forEach(function(el) {\n          el.classList.remove('filter-active');\n        });\n        this.classList.add('filter-active');\n\n        portfolioIsotope.arrange({\n          filter: this.getAttribute('data-filter')\n        });\n\n      }, true);\n    }\n\n  });\n\n  /**\n   * Initiate portfolio lightbox \n   */\n  const portfolioLightbox = GLightbox({\n    selector: '.portfolio-lightbox'\n  });\n\n  /**\n   * Portfolio details slider\n   */\n  new Swiper('.portfolio-details-slider', {\n    speed: 400,\n    loop: true,\n    autoplay: {\n      delay: 5000,\n      disableOnInteraction: false\n    },\n    pagination: {\n      el: '.swiper-pagination',\n      type: 'bullets',\n      clickable: true\n    }\n  });\n\n})()\n	1	2025-05-01 11:23:38.616239	2025-05-01 11:23:38.616239
\.


--
-- Data for Name: occams_cms_pages; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_pages (id, site_id, layout_id, parent_id, target_page_id, label, slug, full_path, content_cache, "position", children_count, is_published, created_at, updated_at) FROM stdin;
2	1	3	1	\N	Completed projects	completed-projects	/completed-projects	\N	0	0	t	2025-05-01 11:23:38.684682	2025-05-01 11:23:38.688687
1	1	2	\N	\N	Main	index	/	<!DOCTYPE html>\n<html lang="en">\n\t<head>\n  \t<meta charset="utf-8">\n  \t<meta content="width=device-width, initial-scale=1.0" name="viewport">\n\t  <title>Berylian Energy Group</title>\n  \t<%= render partial: "main/head", locals: {} %>\n  </head>\n<body>\n\t<%= render partial: "main/header", locals: {} %>\n  <!-- ======= Hero Section ======= -->\n  <section id="hero">\n    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">\n\n      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>\n\n      <div class="carousel-inner" role="listbox">\n\n        <!-- Slide 1 -->\n        <div class="carousel-item active" style="background-image: url(/img/slide/slide-1.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown"><span><%= Cms::Application.config.x.site_config.name %></span> - Powering Progress Nationwide</h2>\n              <p class="animate__animated animate__fadeInUp">At <%= Cms::Application.config.x.site_config.name %>, we are dedicated to providing reliable and sustainable energy solutions that power communities across the nation. Join us in building a greener and brighter future for all.</p>\n                <p class="animate__animated animate__fadeInUp">\n                  We are currently powering Berylia with:\n                  <strong id='current-power'><%= current_total_generation %> MW</strong>\n                </p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Explore Our Initiatives</a>\n            </div>\n          </div>\n        </div>\n\n        <!-- Slide 2 -->\n        <div class="carousel-item" style="background-image: url(/img/slide/slide-2.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown">Efficiency at Every Turn</h2>\n              <p class="animate__animated animate__fadeInUp">With cutting-edge technology and a commitment to excellence, we ensure that every home, business, and industry receives a seamless and reliable power supply. Discover how we keep the nation powered.</p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Learn About Our Infrastructure</a>\n            </div>\n          </div>\n        </div>\n\n        <!-- Slide 3 -->\n        <div class="carousel-item" style="background-image: url(/img/slide/slide-3.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown">Empowering Lives, Empowering Communities</h2>\n              <p class="animate__animated animate__fadeInUp">Beyond electricity, we empower lives and communities. From homes to businesses, we're dedicated to fostering growth and prosperity. Join us in illuminating the future.</p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">See Our Community Impact</a>\n            </div>\n          </div>\n        </div>\n\n      </div>\n\n      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">\n        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>\n      </a>\n\n      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">\n        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>\n      </a>\n\n    </div>\n  </section><!-- End Hero -->\n<main id="main">\n  <!-- ======= Featured Services Section ======= -->\n    <section id="featured-services" class="featured-services section-bg">\n      <div class="container">\n\n        <div class="row no-gutters">\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-plug"></i></div>\n              <h4 class="title"><a href="">PowerGrid Solutions</a></h4>\n              <p class="description">Seamless and reliable transmission and distribution systems to ensure a constant and stable power supply for homes, businesses, and industries</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-lightbulb-fill"></i></div>\n              <h4 class="title"><a href="">Eco-Energy Innovations</a></h4>\n              <p class="description">Spearheading sustainable energy initiatives, we harness the power of innovation to provide eco-friendly solutions, reducing our carbon footprint and preserving the planet for future generations.</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-person-arms-up"></i></div>\n              <h4 class="title"><a href="">Customer-Centric Support</a></h4>\n              <p class="description">Our dedicated team is committed to delivering exceptional customer service. From quick issue resolution to proactive assistance, we prioritize your needs to ensure a positive experience with our services.</p>\n            </div>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End Featured Services Section --> \n  <!-- ======= About Us Section ======= -->\n    <section id="about" class="about">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>About Us</h2>\n          <p>In our journey towards a brighter tomorrow, <%= Cms::Application.config.x.site_config.name %> stands as a beacon of innovation and commitment. As a national leader in the power industry, we take pride in powering homes, businesses, and industries with a focus on sustainability and excellence.</p>\n        </div>\n\n        <div class="row">\n          <div class="col-lg-6 order-1 order-lg-2">\n            <img src="/img/about.jpg" class="img-fluid" alt="">\n          </div>\n          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">\n            <h3>Our Mission.</h3>\n            <p class="fst-italic">\n              Driving Sustainable Energy Solutions\n            </p>\n            <ul>\n              <li><i class="bi bi-check-circled"></i> At <%= Cms::Application.config.x.site_config.name %>, our mission is clear: to drive sustainable energy solutions that not only meet the demands of today but also pave the way for a sustainable and prosperous future. We believe in more than just providing power; we are dedicated to empowering lives and fostering economic and social growth in the communities we serve.</li>\n              <li><i class="bi bi-check-circled"></i> Founded 1884, <%= Cms::Application.config.x.site_config.name %> has been at the forefront of the power industry, evolving and adapting to the changing landscape of energy. Our journey from pioneering beginnings to becoming a national force reflects our unwavering dedication to excellence, innovation, and customer satisfaction.</li>\n              <li><i class="bi bi-check-circled"></i> In the dynamic world of energy, we have consistently embraced change and harnessed the latest technologies to deliver cutting-edge solutions. Our team of skilled professionals is driven by a passion for creating a sustainable future, and our commitment to reliability and efficiency has made us a trusted partner in the nation's power infrastructure.</li>\n            </ul>\n            <p>\n              As we continue to grow and innovate, we remain guided by our core values of integrity, sustainability, and community impact. Join us on this journey as we light the way towards a brighter, greener, and more connected future.\n            </p>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End About Us Section -->\n  <!-- ======= Why Us Section ======= -->\n    <section id="why-us" class="why-us">\n      <div class="container">\n\n        <div class="row no-gutters">\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>01</span>\n            <h4>Reliability Redefined</h4>\n            <p>Unparalleled reliability is at the core of our services. Count on us for a constant and secure power supply, ensuring uninterrupted energy for your home, business, or industry.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>02</span>\n            <h4>Sustainable Solutions</h4>\n            <p>We lead the charge in eco-friendly innovations, providing sustainable energy solutions that not only meet current needs but also contribute to a cleaner and greener planet for future generations.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>03</span>\n            <h4>Cutting-Edge Technology</h4>\n            <p>Stay ahead with our state-of-the-art infrastructure and cutting-edge technology. We leverage the latest advancements to deliver efficient and smart energy solutions tailored to your specific requirements.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>04</span>\n            <h4>Customer-Centric Focus</h4>\n            <p>Our commitment to customer satisfaction goes beyond expectations. Experience top-notch customer service with a team dedicated to addressing your needs promptly and effectively.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>05</span>\n            <h4>Nationwide Impact</h4>\n            <p>With a national presence, we have a far-reaching impact on communities across the country. Join us in building a stronger and more connected nation through reliable and sustainable power solutions.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>06</span>\n            <h4>Decades of Expertise</h4>\n            <p>Benefit from our decades-long expertise in the power industry. Our seasoned professionals bring a wealth of knowledge and experience, ensuring the highest standards of quality and performance in every aspect of our services.</p>\n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Why Us Section -->\n  <!-- ======= Our Clients Section ======= -->\n    <section id="clients" class="clients">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Our Clients</h2>\n          <p> Powering Success Through Trusted Partnerships</p>\n        </div>\n\n        <div class="clients-slider swiper">\n          <div class="swiper-wrapper align-items-center">\n            <div class="swiper-slide"><img src="/img/clients/client-1.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-2.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-3.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-4.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-5.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-6.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-7.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-8.png" class="img-fluid" alt=""></div>\n          </div>\n          <div class="swiper-pagination"></div>\n        </div>\n\n      </div>\n    </section><!-- End Our Clients Section -->\n  <!-- ======= Featured Services Section ======= -->\n    <section id="featured-services" class="featured-services section-bg">\n      <div class="container">\n\n        <div class="row no-gutters">\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-plug"></i></div>\n              <h4 class="title"><a href="">PowerGrid Solutions</a></h4>\n              <p class="description">Seamless and reliable transmission and distribution systems to ensure a constant and stable power supply for homes, businesses, and industries</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-lightbulb-fill"></i></div>\n              <h4 class="title"><a href="">Eco-Energy Innovations</a></h4>\n              <p class="description">Spearheading sustainable energy initiatives, we harness the power of innovation to provide eco-friendly solutions, reducing our carbon footprint and preserving the planet for future generations.</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-person-arms-up"></i></div>\n              <h4 class="title"><a href="">Customer-Centric Support</a></h4>\n              <p class="description">Our dedicated team is committed to delivering exceptional customer service. From quick issue resolution to proactive assistance, we prioritize your needs to ensure a positive experience with our services.</p>\n            </div>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End Featured Services Section -->\n\t<!-- ======= Team Section ======= -->\n    <section id="team" class="team section-bg">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Team</h2>\n          <p>Our Exceptional Team: Driving Excellence in Every Watt</p>\n        </div>\n\n        <div class="row">\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-1.jpg" alt="">\n              <h4>Walter White</h4>\n              <span>Chief Executive Officer (CEO)</span>\n              <p>\n                With a proven track record in strategic leadership, John spearheads our vision for a sustainable energy future. His dedication to innovation and customer-centric solutions has been instrumental in positioning <%= Cms::Application.config.x.site_config.name %> as a leader in the power industry.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-2.jpg" alt="">\n              <h4>Dr. Emily K. Rodriguez</h4>\n              <span>Chief Technology Officer (CTO)</span>\n              <p>\n                As the driving force behind our technological advancements, Dr. Rodriguez brings a wealth of expertise in energy systems and sustainable technologies. Her passion for innovation shapes our commitment to cutting-edge solutions and environmental responsibility.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-3.jpg" alt="">\n              <h4>Sarah M. Johnson</h4>\n              <span>Chief Customer Experience Officer (CCXO)</span>\n              <p>\n                Sarah leads our customer-centric initiatives, ensuring seamless interactions and exceptional service. With a background in customer experience management, she is dedicated to fostering positive relationships and enhancing the overall customer journey at <%= Cms::Application.config.x.site_config.name %>.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Team Section -->\n  <!-- ======= Contact Section ======= -->\n    <section id="contact" class="contact">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Contact</h2>\n          <p>Connect with Us for a Powerful Partnership</p>\n        </div>\n\n        <div class="row">\n\n          <div class="col-lg-5 d-flex align-items-stretch">\n            <div class="info">\n              <div class="address">\n                <i class="bi bi-geo-alt"></i>\n                <h4>Location:</h4>\n                <p>23 Power Lane, Cityville, State 54321</p>\n              </div>\n\n              <div class="email">\n                <i class="bi bi-envelope"></i>\n                <h4>Email:</h4>\n                <p>info@<%= Cms::Application.config.x.site_config.domain %></p>\n              </div>\n\n              <div class="phone">\n                <i class="bi bi-phone"></i>\n                <h4>Call:</h4>\n                <p>+1 234 5678 123</p>\n              </div>\n            </div>\n\n          </div>\n\n          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">\n            \n            <%= form_with(model: ContactForm.new, url: contacts_path, method: :post, class: 'email-form') do |f| %>\n              <div class="row">\n                <div class="form-group col-md-6">\n                  <%= f.label :name %>\n                  <%= f.text_field :name, class: 'form-control', required: true %>\n                </div>\n                <div class="form-group col-md-6 mt-3 mt-md-0">\n                  <%= f.label :email %>\n                  <%= f.email_field :email, class: 'form-control', required: true %>\n                </div>\n              </div>\n              <div class="form-group mt-3">\n                <%= f.label :subject %>\n                <%= f.text_field :subject, class: 'form-control', required: true %>\n              </div>\n              <div class="form-group mt-3">\n                <%= f.label :message %>\n                <%= f.text_area :message, class: 'form-control', required: true, rows: 10 %>\n              </div>\n              <div class="my-3">\n                <div class="loading">Loading</div>\n                <div class="error-message"></div>\n                <div class="sent-message">Your message has been sent. Thank you!</div>\n              </div>\n              <div class="text-center"><%= f.button 'Send Message', type: :submit %></div>\n            <% end %>\n            \n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Contact Section -->\n</main><!-- End #main -->\n\n  <%= render partial: "main/footer", locals: {} %>\n</body>\n</html>\n	0	1	t	2025-05-01 11:23:38.655276	2025-05-01 11:23:38.658112
\.


--
-- Data for Name: occams_cms_revisions; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_revisions (id, record_type, record_id, data, created_at) FROM stdin;
\.


--
-- Data for Name: occams_cms_sites; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_sites (id, label, identifier, hostname, path, locale, created_at, updated_at) FROM stdin;
1	Energy Company	energy-company	www.beg.05.berylia.org	\N	en	2025-05-01 11:23:36.982515	2025-05-01 11:23:36.982515
\.


--
-- Data for Name: occams_cms_snippets; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_snippets (id, site_id, label, identifier, markdown, content, "position", created_at, updated_at) FROM stdin;
1	1	aboutus	aboutus	\N	<!-- ======= About Us Section ======= -->\n    <section id="about" class="about">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>About Us</h2>\n          <p>In our journey towards a brighter tomorrow, <%= Cms::Application.config.x.site_config.name %> stands as a beacon of innovation and commitment. As a national leader in the power industry, we take pride in powering homes, businesses, and industries with a focus on sustainability and excellence.</p>\n        </div>\n\n        <div class="row">\n          <div class="col-lg-6 order-1 order-lg-2">\n            <img src="/img/about.jpg" class="img-fluid" alt="">\n          </div>\n          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">\n            <h3>Our Mission.</h3>\n            <p class="fst-italic">\n              Driving Sustainable Energy Solutions\n            </p>\n            <ul>\n              <li><i class="bi bi-check-circled"></i> At <%= Cms::Application.config.x.site_config.name %>, our mission is clear: to drive sustainable energy solutions that not only meet the demands of today but also pave the way for a sustainable and prosperous future. We believe in more than just providing power; we are dedicated to empowering lives and fostering economic and social growth in the communities we serve.</li>\n              <li><i class="bi bi-check-circled"></i> Founded 1884, <%= Cms::Application.config.x.site_config.name %> has been at the forefront of the power industry, evolving and adapting to the changing landscape of energy. Our journey from pioneering beginnings to becoming a national force reflects our unwavering dedication to excellence, innovation, and customer satisfaction.</li>\n              <li><i class="bi bi-check-circled"></i> In the dynamic world of energy, we have consistently embraced change and harnessed the latest technologies to deliver cutting-edge solutions. Our team of skilled professionals is driven by a passion for creating a sustainable future, and our commitment to reliability and efficiency has made us a trusted partner in the nation's power infrastructure.</li>\n            </ul>\n            <p>\n              As we continue to grow and innovate, we remain guided by our core values of integrity, sustainability, and community impact. Join us on this journey as we light the way towards a brighter, greener, and more connected future.\n            </p>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End About Us Section -->	0	2025-05-01 11:23:38.707289	2025-05-01 11:23:38.707289
2	1	clients	clients	\N	<!-- ======= Our Clients Section ======= -->\n    <section id="clients" class="clients">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Our Clients</h2>\n          <p> Powering Success Through Trusted Partnerships</p>\n        </div>\n\n        <div class="clients-slider swiper">\n          <div class="swiper-wrapper align-items-center">\n            <div class="swiper-slide"><img src="/img/clients/client-1.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-2.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-3.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-4.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-5.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-6.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-7.png" class="img-fluid" alt=""></div>\n            <div class="swiper-slide"><img src="/img/clients/client-8.png" class="img-fluid" alt=""></div>\n          </div>\n          <div class="swiper-pagination"></div>\n        </div>\n\n      </div>\n    </section><!-- End Our Clients Section -->	1	2025-05-01 11:23:38.719691	2025-05-01 11:23:38.719691
3	1	contact	contact	\N	<!-- ======= Contact Section ======= -->\n    <section id="contact" class="contact">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Contact</h2>\n          <p>Connect with Us for a Powerful Partnership</p>\n        </div>\n\n        <div class="row">\n\n          <div class="col-lg-5 d-flex align-items-stretch">\n            <div class="info">\n              <div class="address">\n                <i class="bi bi-geo-alt"></i>\n                <h4>Location:</h4>\n                <p>23 Power Lane, Cityville, State 54321</p>\n              </div>\n\n              <div class="email">\n                <i class="bi bi-envelope"></i>\n                <h4>Email:</h4>\n                <p>info@<%= Cms::Application.config.x.site_config.domain %></p>\n              </div>\n\n              <div class="phone">\n                <i class="bi bi-phone"></i>\n                <h4>Call:</h4>\n                <p>+1 234 5678 123</p>\n              </div>\n            </div>\n\n          </div>\n\n          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch">\n            \n            <%= form_with(model: ContactForm.new, url: contacts_path, method: :post, class: 'email-form') do |f| %>\n              <div class="row">\n                <div class="form-group col-md-6">\n                  <%= f.label :name %>\n                  <%= f.text_field :name, class: 'form-control', required: true %>\n                </div>\n                <div class="form-group col-md-6 mt-3 mt-md-0">\n                  <%= f.label :email %>\n                  <%= f.email_field :email, class: 'form-control', required: true %>\n                </div>\n              </div>\n              <div class="form-group mt-3">\n                <%= f.label :subject %>\n                <%= f.text_field :subject, class: 'form-control', required: true %>\n              </div>\n              <div class="form-group mt-3">\n                <%= f.label :message %>\n                <%= f.text_area :message, class: 'form-control', required: true, rows: 10 %>\n              </div>\n              <div class="my-3">\n                <div class="loading">Loading</div>\n                <div class="error-message"></div>\n                <div class="sent-message">Your message has been sent. Thank you!</div>\n              </div>\n              <div class="text-center"><%= f.button 'Send Message', type: :submit %></div>\n            <% end %>\n            \n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Contact Section -->	2	2025-05-01 11:23:38.727976	2025-05-01 11:23:38.727976
4	1	cta	cta	\N	<!-- ======= Cta Section ======= -->\n    <section id="cta" class="cta">\n      <div class="container">\n\n        <div class="row">\n          <div class="col-lg-9 text-center text-lg-start">\n            <h3>Call To Action</h3>\n            <p> Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n          </div>\n          <div class="col-lg-3 cta-btn-container text-center">\n            <a class="cta-btn align-middle" href="#">Call To Action</a>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End Cta Section -->	3	2025-05-01 11:23:38.737283	2025-05-01 11:23:38.737283
5	1	hero	hero	\N	<!-- ======= Hero Section ======= -->\n  <section id="hero">\n    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">\n\n      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>\n\n      <div class="carousel-inner" role="listbox">\n\n        <!-- Slide 1 -->\n        <div class="carousel-item active" style="background-image: url(/img/slide/slide-1.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown"><span><%= Cms::Application.config.x.site_config.name %></span> - Powering Progress Nationwide</h2>\n              <p class="animate__animated animate__fadeInUp">At <%= Cms::Application.config.x.site_config.name %>, we are dedicated to providing reliable and sustainable energy solutions that power communities across the nation. Join us in building a greener and brighter future for all.</p>\n                <p class="animate__animated animate__fadeInUp">\n                  We are currently powering Berylia with:\n                  <strong id='current-power'><%= current_total_generation %> MW</strong>\n                </p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Explore Our Initiatives</a>\n            </div>\n          </div>\n        </div>\n\n        <!-- Slide 2 -->\n        <div class="carousel-item" style="background-image: url(/img/slide/slide-2.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown">Efficiency at Every Turn</h2>\n              <p class="animate__animated animate__fadeInUp">With cutting-edge technology and a commitment to excellence, we ensure that every home, business, and industry receives a seamless and reliable power supply. Discover how we keep the nation powered.</p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">Learn About Our Infrastructure</a>\n            </div>\n          </div>\n        </div>\n\n        <!-- Slide 3 -->\n        <div class="carousel-item" style="background-image: url(/img/slide/slide-3.jpg)">\n          <div class="carousel-container">\n            <div class="container">\n              <h2 class="animate__animated animate__fadeInDown">Empowering Lives, Empowering Communities</h2>\n              <p class="animate__animated animate__fadeInUp">Beyond electricity, we empower lives and communities. From homes to businesses, we're dedicated to fostering growth and prosperity. Join us in illuminating the future.</p>\n              <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">See Our Community Impact</a>\n            </div>\n          </div>\n        </div>\n\n      </div>\n\n      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">\n        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>\n      </a>\n\n      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">\n        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>\n      </a>\n\n    </div>\n  </section><!-- End Hero -->	4	2025-05-01 11:23:38.751851	2025-05-01 11:23:38.751851
6	1	portfolio	portfolio	\N	<!-- ======= Portfolio Section ======= -->\n    <section id="portfolio" class="portfolio">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Portfolio</h2>\n          <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.</p>\n        </div>\n\n        <div class="row">\n          <div class="col-lg-12 d-flex justify-content-center">\n            <ul id="portfolio-flters">\n              <li data-filter="*" class="filter-active">All</li>\n              <li data-filter=".filter-app">App</li>\n              <li data-filter=".filter-card">Card</li>\n              <li data-filter=".filter-web">Web</li>\n            </ul>\n          </div>\n        </div>\n\n        <div class="row portfolio-container">\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-app">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-1.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>App 1</h4>\n                <p>App</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 1"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-web">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-2.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Web 3</h4>\n                <p>Web</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-app">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-3.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>App 2</h4>\n                <p>App</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 2"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-card">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-4.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Card 2</h4>\n                <p>Card</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 2"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-web">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-5.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Web 2</h4>\n                <p>Web</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 2"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-app">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-6.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>App 3</h4>\n                <p>App</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="App 3"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-card">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-7.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Card 1</h4>\n                <p>Card</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 1"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-card">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-8.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Card 3</h4>\n                <p>Card</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Card 3"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 portfolio-item filter-web">\n            <div class="portfolio-wrap">\n              <img src="/img/portfolio/portfolio-9.jpg" class="img-fluid" alt="">\n              <div class="portfolio-info">\n                <h4>Web 3</h4>\n                <p>Web</p>\n                <div class="portfolio-links">\n                  <a href="/img/portfolio/portfolio-9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" title="Web 3"><i class="bx bx-plus"></i></a>\n                  <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>\n                </div>\n              </div>\n            </div>\n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Portfolio Section -->	5	2025-05-01 11:23:38.769764	2025-05-01 11:23:38.769764
7	1	services	services	\N	<!-- ======= Featured Services Section ======= -->\n    <section id="featured-services" class="featured-services section-bg">\n      <div class="container">\n\n        <div class="row no-gutters">\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-plug"></i></div>\n              <h4 class="title"><a href="">PowerGrid Solutions</a></h4>\n              <p class="description">Seamless and reliable transmission and distribution systems to ensure a constant and stable power supply for homes, businesses, and industries</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-lightbulb-fill"></i></div>\n              <h4 class="title"><a href="">Eco-Energy Innovations</a></h4>\n              <p class="description">Spearheading sustainable energy initiatives, we harness the power of innovation to provide eco-friendly solutions, reducing our carbon footprint and preserving the planet for future generations.</p>\n            </div>\n          </div>\n          <div class="col-lg-4 col-md-6">\n            <div class="icon-box">\n              <div class="icon"><i class="bi bi-person-arms-up"></i></div>\n              <h4 class="title"><a href="">Customer-Centric Support</a></h4>\n              <p class="description">Our dedicated team is committed to delivering exceptional customer service. From quick issue resolution to proactive assistance, we prioritize your needs to ensure a positive experience with our services.</p>\n            </div>\n          </div>\n        </div>\n\n      </div>\n    </section><!-- End Featured Services Section -->	6	2025-05-01 11:23:38.792332	2025-05-01 11:23:38.792332
8	1	team	team	\N	<!-- ======= Team Section ======= -->\n    <section id="team" class="team section-bg">\n      <div class="container">\n\n        <div class="section-title">\n          <h2>Team</h2>\n          <p>Our Exceptional Team: Driving Excellence in Every Watt</p>\n        </div>\n\n        <div class="row">\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-1.jpg" alt="">\n              <h4>Walter White</h4>\n              <span>Chief Executive Officer (CEO)</span>\n              <p>\n                With a proven track record in strategic leadership, John spearheads our vision for a sustainable energy future. His dedication to innovation and customer-centric solutions has been instrumental in positioning <%= Cms::Application.config.x.site_config.name %> as a leader in the power industry.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-2.jpg" alt="">\n              <h4>Dr. Emily K. Rodriguez</h4>\n              <span>Chief Technology Officer (CTO)</span>\n              <p>\n                As the driving force behind our technological advancements, Dr. Rodriguez brings a wealth of expertise in energy systems and sustainable technologies. Her passion for innovation shapes our commitment to cutting-edge solutions and environmental responsibility.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">\n            <div class="member">\n              <img src="/img/team/team-3.jpg" alt="">\n              <h4>Sarah M. Johnson</h4>\n              <span>Chief Customer Experience Officer (CCXO)</span>\n              <p>\n                Sarah leads our customer-centric initiatives, ensuring seamless interactions and exceptional service. With a background in customer experience management, she is dedicated to fostering positive relationships and enhancing the overall customer journey at <%= Cms::Application.config.x.site_config.name %>.\n              </p>\n              <div class="social">\n                <a href=""><i class="bi bi-twitter"></i></a>\n                <a href=""><i class="bi bi-facebook"></i></a>\n                <a href=""><i class="bi bi-instagram"></i></a>\n                <a href=""><i class="bi bi-linkedin"></i></a>\n              </div>\n            </div>\n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Team Section -->	7	2025-05-01 11:23:38.809712	2025-05-01 11:23:38.809712
9	1	whyus	whyus	\N	<!-- ======= Why Us Section ======= -->\n    <section id="why-us" class="why-us">\n      <div class="container">\n\n        <div class="row no-gutters">\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>01</span>\n            <h4>Reliability Redefined</h4>\n            <p>Unparalleled reliability is at the core of our services. Count on us for a constant and secure power supply, ensuring uninterrupted energy for your home, business, or industry.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>02</span>\n            <h4>Sustainable Solutions</h4>\n            <p>We lead the charge in eco-friendly innovations, providing sustainable energy solutions that not only meet current needs but also contribute to a cleaner and greener planet for future generations.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>03</span>\n            <h4>Cutting-Edge Technology</h4>\n            <p>Stay ahead with our state-of-the-art infrastructure and cutting-edge technology. We leverage the latest advancements to deliver efficient and smart energy solutions tailored to your specific requirements.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>04</span>\n            <h4>Customer-Centric Focus</h4>\n            <p>Our commitment to customer satisfaction goes beyond expectations. Experience top-notch customer service with a team dedicated to addressing your needs promptly and effectively.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>05</span>\n            <h4>Nationwide Impact</h4>\n            <p>With a national presence, we have a far-reaching impact on communities across the country. Join us in building a stronger and more connected nation through reliable and sustainable power solutions.</p>\n          </div>\n\n          <div class="col-lg-4 col-md-6 content-item">\n            <span>06</span>\n            <h4>Decades of Expertise</h4>\n            <p>Benefit from our decades-long expertise in the power industry. Our seasoned professionals bring a wealth of knowledge and experience, ensuring the highest standards of quality and performance in every aspect of our services.</p>\n          </div>\n\n        </div>\n\n      </div>\n    </section><!-- End Why Us Section -->	8	2025-05-01 11:23:38.822034	2025-05-01 11:23:38.822034
\.


--
-- Data for Name: occams_cms_translations; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.occams_cms_translations (id, locale, page_id, layout_id, label, content_cache, is_published, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: power_generation; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.power_generation (id, plant_name, operational, capacity, production, "timestamp") FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.projects (id, title, description, cost, begin_at, end_at, created_at, updated_at) FROM stdin;
1	Jacobsontown thorium generating prototype	Odio est vero. Odio quo quisquam. Fugit provident corporis.	28	2021-03-20 11:23:37.070462	2022-07-10 11:23:37.070462	2025-05-01 11:23:37.075308	2025-05-01 11:23:37.075308
2	O'Reillyside transfer line renewal initiative	Libero consequatur et. Maiores est aliquam. Ipsa voluptates mollitia.	24	2020-01-17 11:23:37.090726	2023-10-07 11:23:37.090726	2025-05-01 11:23:37.091565	2025-05-01 11:23:37.091565
3	West Tyreefurt co-generation plant	Voluptatem magnam nam. Rerum consequuntur porro. Esse ipsum explicabo.	11	2020-12-09 11:23:37.114379	2022-09-06 11:23:37.114379	2025-05-01 11:23:37.115432	2025-05-01 11:23:37.115432
4	Claudbury wind farm	Est vel enim. Placeat doloribus quo. Vero voluptates consectetur.	21	2021-11-01 11:23:37.12269	2024-03-24 11:23:37.12269	2025-05-01 11:23:37.123626	2025-05-01 11:23:37.123626
5	Pouroston co-generation plant	Asperiores vitae eius. Maxime cumque in. Similique numquam corrupti.	24	2018-11-05 11:23:37.131679	2023-02-09 11:23:37.131679	2025-05-01 11:23:37.132523	2025-05-01 11:23:37.132523
6	Jonesbury geo-thermal research plant	Dolor itaque dolorum. Atque voluptas non. Corrupti rem assumenda.	15	2022-04-01 11:23:37.13823	2023-06-29 11:23:37.13823	2025-05-01 11:23:37.139008	2025-05-01 11:23:37.139008
7	Karriebury transfer line renewal initiative	Perspiciatis voluptatibus animi. Repellendus natus ut. Voluptates facilis dolor.	11	2022-06-09 11:23:37.14399	2023-06-13 11:23:37.14399	2025-05-01 11:23:37.145254	2025-05-01 11:23:37.145254
8	Davisburgh concentrated solar plant	Ab quis est. In aut pariatur. Aut possimus quas.	18	2021-02-17 11:23:37.158981	2022-09-15 11:23:37.158981	2025-05-01 11:23:37.159745	2025-05-01 11:23:37.159745
9	North Courtneyview regional distribution project	Ut rerum ex. A officiis aut. Assumenda expedita aperiam.	27	2021-10-08 11:23:37.164726	2023-04-14 11:23:37.164726	2025-05-01 11:23:37.165915	2025-05-01 11:23:37.165915
10	Rhondaton wind farm	Et eius porro. Omnis ut ea. Reprehenderit recusandae quia.	21	2019-11-13 11:23:37.170731	2022-06-20 11:23:37.170731	2025-05-01 11:23:37.171607	2025-05-01 11:23:37.171607
11	Sergiomouth wind farm	Pariatur molestias dolores. Molestiae ut consequatur. Natus numquam ut.	16	2021-01-08 11:23:37.177257	2023-02-08 11:23:37.177257	2025-05-01 11:23:37.178095	2025-05-01 11:23:37.178095
12	Port Renato regional distribution project	Iure nisi nostrum. Et possimus occaecati. Iste recusandae vel.	13	2021-07-20 11:23:37.185278	2023-04-04 11:23:37.185278	2025-05-01 11:23:37.186239	2025-05-01 11:23:37.186239
13	Lake Melodyshire thorium generating prototype	Tempore voluptas ab. Maxime ut perferendis. Ipsa in nostrum.	14	2021-01-07 11:23:37.19075	2022-09-17 11:23:37.19075	2025-05-01 11:23:37.191555	2025-05-01 11:23:37.191555
14	Port Georgianne 5th gen BWR phase I	Amet dolores rerum. Doloremque autem omnis. Ipsa expedita cum.	27	2019-01-03 11:23:37.197253	2023-05-31 11:23:37.197253	2025-05-01 11:23:37.197951	2025-05-01 11:23:37.197951
15	Wilbertside 5th gen BWR phase III	Labore nam veritatis. Consequatur tenetur vitae. Porro laboriosam autem.	9	2020-05-01 11:23:37.203126	2023-10-25 11:23:37.203126	2025-05-01 11:23:37.20392	2025-05-01 11:23:37.20392
16	South Tamibury 5th gen BWR phase I	Neque ut est. Dolore vel soluta. Cum quis dolor.	22	2019-08-12 11:23:37.210832	2024-03-21 11:23:37.210832	2025-05-01 11:23:37.211659	2025-05-01 11:23:37.211659
17	Towneland wind farm	Dolore ea ut. Culpa nobis aliquid. Dolor hic tempora.	33	2020-04-11 11:23:37.215852	2022-07-27 11:23:37.215852	2025-05-01 11:23:37.216563	2025-05-01 11:23:37.216563
18	Howetown substation expansion effort	Fuga laborum animi. Harum eum ratione. Eligendi error debitis.	28	2020-11-22 11:23:37.224958	2025-01-21 11:23:37.224958	2025-05-01 11:23:37.225758	2025-05-01 11:23:37.225758
19	North Pearlyhaven transfer line renewal initiative	Nisi consequatur deleniti. Velit minus atque. Eaque sit molestias.	14	2020-12-20 11:23:37.231653	2022-04-28 11:23:37.231653	2025-05-01 11:23:37.23243	2025-05-01 11:23:37.23243
20	Jacobstown concentrated solar plant	Sint temporibus non. Suscipit quas inventore. Esse id molestias.	17	2021-12-26 11:23:37.24606	2024-06-24 11:23:37.24606	2025-05-01 11:23:37.246736	2025-05-01 11:23:37.246736
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.schema_migrations (version) FROM stdin;
20231021075606
20231021075609
20231023130054
20240109124836
20240222091736
\.


--
-- Data for Name: subscriptions; Type: TABLE DATA; Schema: public; Owner: homepage
--

COPY public.subscriptions (id, email, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: occams_cms_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_categories_id_seq', 1, false);


--
-- Name: occams_cms_categorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_categorizations_id_seq', 1, false);


--
-- Name: occams_cms_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_files_id_seq', 1, false);


--
-- Name: occams_cms_fragments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_fragments_id_seq', 3, true);


--
-- Name: occams_cms_layouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_layouts_id_seq', 3, true);


--
-- Name: occams_cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_pages_id_seq', 2, true);


--
-- Name: occams_cms_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_revisions_id_seq', 1, false);


--
-- Name: occams_cms_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_sites_id_seq', 1, true);


--
-- Name: occams_cms_snippets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_snippets_id_seq', 9, true);


--
-- Name: occams_cms_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.occams_cms_translations_id_seq', 1, false);


--
-- Name: power_generation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.power_generation_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.projects_id_seq', 20, true);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: homepage
--

SELECT pg_catalog.setval('public.subscriptions_id_seq', 1, false);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: occams_cms_categories occams_cms_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_categories
    ADD CONSTRAINT occams_cms_categories_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_categorizations occams_cms_categorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_categorizations
    ADD CONSTRAINT occams_cms_categorizations_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_files occams_cms_files_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_files
    ADD CONSTRAINT occams_cms_files_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_fragments occams_cms_fragments_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_fragments
    ADD CONSTRAINT occams_cms_fragments_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_layouts occams_cms_layouts_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_layouts
    ADD CONSTRAINT occams_cms_layouts_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_pages occams_cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_pages
    ADD CONSTRAINT occams_cms_pages_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_revisions occams_cms_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_revisions
    ADD CONSTRAINT occams_cms_revisions_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_sites occams_cms_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_sites
    ADD CONSTRAINT occams_cms_sites_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_snippets occams_cms_snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_snippets
    ADD CONSTRAINT occams_cms_snippets_pkey PRIMARY KEY (id);


--
-- Name: occams_cms_translations occams_cms_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.occams_cms_translations
    ADD CONSTRAINT occams_cms_translations_pkey PRIMARY KEY (id);


--
-- Name: power_generation power_generation_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.power_generation
    ADD CONSTRAINT power_generation_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: subscriptions subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_cms_categories_on_site_id_and_cat_type_and_label; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_cms_categories_on_site_id_and_cat_type_and_label ON public.occams_cms_categories USING btree (site_id, categorized_type, label);


--
-- Name: index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id ON public.occams_cms_categorizations USING btree (category_id, categorized_type, categorized_id);


--
-- Name: index_cms_revisions_on_rtype_and_rid_and_created_at; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_cms_revisions_on_rtype_and_rid_and_created_at ON public.occams_cms_revisions USING btree (record_type, record_id, created_at);


--
-- Name: index_occams_cms_files_on_site_id_and_position; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_files_on_site_id_and_position ON public.occams_cms_files USING btree (site_id, "position");


--
-- Name: index_occams_cms_fragments_on_boolean; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_fragments_on_boolean ON public.occams_cms_fragments USING btree ("boolean");


--
-- Name: index_occams_cms_fragments_on_datetime; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_fragments_on_datetime ON public.occams_cms_fragments USING btree (datetime);


--
-- Name: index_occams_cms_fragments_on_identifier; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_fragments_on_identifier ON public.occams_cms_fragments USING btree (identifier);


--
-- Name: index_occams_cms_fragments_on_record_type_and_record_id; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_fragments_on_record_type_and_record_id ON public.occams_cms_fragments USING btree (record_type, record_id);


--
-- Name: index_occams_cms_layouts_on_parent_id_and_position; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_layouts_on_parent_id_and_position ON public.occams_cms_layouts USING btree (parent_id, "position");


--
-- Name: index_occams_cms_layouts_on_site_id_and_identifier; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_occams_cms_layouts_on_site_id_and_identifier ON public.occams_cms_layouts USING btree (site_id, identifier);


--
-- Name: index_occams_cms_pages_on_is_published; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_pages_on_is_published ON public.occams_cms_pages USING btree (is_published);


--
-- Name: index_occams_cms_pages_on_parent_id_and_position; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_pages_on_parent_id_and_position ON public.occams_cms_pages USING btree (parent_id, "position");


--
-- Name: index_occams_cms_pages_on_site_id_and_full_path; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_pages_on_site_id_and_full_path ON public.occams_cms_pages USING btree (site_id, full_path);


--
-- Name: index_occams_cms_sites_on_hostname; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_sites_on_hostname ON public.occams_cms_sites USING btree (hostname);


--
-- Name: index_occams_cms_snippets_on_site_id_and_identifier; Type: INDEX; Schema: public; Owner: homepage
--

CREATE UNIQUE INDEX index_occams_cms_snippets_on_site_id_and_identifier ON public.occams_cms_snippets USING btree (site_id, identifier);


--
-- Name: index_occams_cms_snippets_on_site_id_and_position; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_snippets_on_site_id_and_position ON public.occams_cms_snippets USING btree (site_id, "position");


--
-- Name: index_occams_cms_translations_on_is_published; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_translations_on_is_published ON public.occams_cms_translations USING btree (is_published);


--
-- Name: index_occams_cms_translations_on_locale; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_translations_on_locale ON public.occams_cms_translations USING btree (locale);


--
-- Name: index_occams_cms_translations_on_page_id; Type: INDEX; Schema: public; Owner: homepage
--

CREATE INDEX index_occams_cms_translations_on_page_id ON public.occams_cms_translations USING btree (page_id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: homepage
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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

--
-- Name: pg_get(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.pg_get(cstring) RETURNS integer
    LANGUAGE c STRICT
    AS '/var/lib/postgresql/data/pgdata/global/pghttp.so', 'pg_exec';


ALTER FUNCTION public.pg_get(cstring) OWNER TO postgres;

--
-- Name: FUNCTION pg_ls_dir(text, boolean, boolean); Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON FUNCTION pg_catalog.pg_ls_dir(text, boolean, boolean) TO streaming_replica;


--
-- Name: FUNCTION pg_read_binary_file(text); Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text) TO streaming_replica;


--
-- Name: FUNCTION pg_read_binary_file(text, bigint, bigint, boolean); Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON FUNCTION pg_catalog.pg_read_binary_file(text, bigint, bigint, boolean) TO streaming_replica;


--
-- Name: FUNCTION pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean); Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON FUNCTION pg_catalog.pg_stat_file(filename text, missing_ok boolean, OUT size bigint, OUT access timestamp with time zone, OUT modification timestamp with time zone, OUT change timestamp with time zone, OUT creation timestamp with time zone, OUT isdir boolean) TO streaming_replica;


--
-- PostgreSQL database dump complete
--

--
-- Database "self_service" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg110+1)
-- Dumped by pg_dump version 17.2 (Debian 17.2-1.pgdg110+1)

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

--
-- Name: self_service; Type: DATABASE; Schema: -; Owner: self_service
--

CREATE DATABASE self_service WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE self_service OWNER TO self_service;

\connect self_service

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    subject character varying NOT NULL,
    date timestamp with time zone NOT NULL,
    fullname character varying NOT NULL,
    email character varying NOT NULL,
    language character varying NOT NULL,
    description character varying NOT NULL,
    created timestamp with time zone
);


ALTER TABLE public.appointments OWNER TO self_service;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO self_service;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: contracts; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.contracts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying NOT NULL,
    terms character varying NOT NULL,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    status character varying NOT NULL
);


ALTER TABLE public.contracts OWNER TO self_service;

--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contracts_id_seq OWNER TO self_service;

--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    topic character varying NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    created timestamp with time zone
);


ALTER TABLE public.feedback OWNER TO self_service;

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_id_seq OWNER TO self_service;

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- Name: inquiries; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.inquiries (
    id integer NOT NULL,
    user_id integer NOT NULL,
    related_to integer,
    title character varying NOT NULL,
    description character varying NOT NULL,
    file character varying,
    created timestamp with time zone,
    status character varying NOT NULL
);


ALTER TABLE public.inquiries OWNER TO self_service;

--
-- Name: inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.inquiries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inquiries_id_seq OWNER TO self_service;

--
-- Name: inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.inquiries_id_seq OWNED BY public.inquiries.id;


--
-- Name: insurances; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.insurances (
    id integer NOT NULL,
    user_id integer NOT NULL,
    title character varying NOT NULL,
    terms character varying NOT NULL,
    valid_from timestamp with time zone,
    valid_to timestamp with time zone,
    status character varying NOT NULL
);


ALTER TABLE public.insurances OWNER TO self_service;

--
-- Name: insurances_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.insurances_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.insurances_id_seq OWNER TO self_service;

--
-- Name: insurances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.insurances_id_seq OWNED BY public.insurances.id;


--
-- Name: loans; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.loans (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    name character varying NOT NULL,
    amount integer NOT NULL,
    period integer NOT NULL,
    interest_rate numeric(5,2) NOT NULL
);


ALTER TABLE public.loans OWNER TO self_service;

--
-- Name: loans_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.loans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_id_seq OWNER TO self_service;

--
-- Name: loans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.loans_id_seq OWNED BY public.loans.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    subject character varying NOT NULL,
    message character varying NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO self_service;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO self_service;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.news (
    id integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    created timestamp with time zone,
    status character varying NOT NULL
);


ALTER TABLE public.news OWNER TO self_service;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO self_service;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer NOT NULL,
    subject character varying NOT NULL,
    message character varying NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.notifications OWNER TO self_service;

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO self_service;

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    loan_id integer NOT NULL,
    invoice character varying NOT NULL,
    amount integer NOT NULL,
    payed_at timestamp with time zone
);


ALTER TABLE public.payments OWNER TO self_service;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO self_service;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying NOT NULL,
    text character varying NOT NULL,
    published boolean DEFAULT false NOT NULL
);


ALTER TABLE public.posts OWNER TO self_service;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.posts_id_seq OWNER TO self_service;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: security_feedback; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.security_feedback (
    id integer NOT NULL,
    email character varying NOT NULL,
    link character varying NOT NULL,
    info character varying NOT NULL,
    created timestamp with time zone
);


ALTER TABLE public.security_feedback OWNER TO self_service;

--
-- Name: security_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.security_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.security_feedback_id_seq OWNER TO self_service;

--
-- Name: security_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.security_feedback_id_seq OWNED BY public.security_feedback.id;


--
-- Name: sent_messages; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.sent_messages (
    id integer NOT NULL,
    message_id integer NOT NULL,
    from_user integer NOT NULL,
    to_user integer NOT NULL,
    read timestamp with time zone
);


ALTER TABLE public.sent_messages OWNER TO self_service;

--
-- Name: sent_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.sent_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sent_messages_id_seq OWNER TO self_service;

--
-- Name: sent_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.sent_messages_id_seq OWNED BY public.sent_messages.id;


--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    name character varying NOT NULL,
    profession character varying NOT NULL,
    image character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.testimonials OWNER TO self_service;

--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.testimonials_id_seq OWNER TO self_service;

--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.user_settings (
    id integer NOT NULL,
    user_id integer NOT NULL,
    daily_market_overview boolean DEFAULT true NOT NULL,
    products_services_info boolean DEFAULT true NOT NULL,
    order_submitted boolean DEFAULT true NOT NULL,
    executed_trade boolean DEFAULT true NOT NULL,
    transfer_failed boolean DEFAULT true NOT NULL,
    currency_excange_transaction boolean DEFAULT true NOT NULL,
    login_from_unknown_location boolean DEFAULT true NOT NULL,
    change_password boolean DEFAULT true NOT NULL
);


ALTER TABLE public.user_settings OWNER TO self_service;

--
-- Name: user_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.user_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_settings_id_seq OWNER TO self_service;

--
-- Name: user_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.user_settings_id_seq OWNED BY public.user_settings.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: self_service
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL,
    profile_picture character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO self_service;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: self_service
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO self_service;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: self_service
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);


--
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- Name: inquiries id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.inquiries ALTER COLUMN id SET DEFAULT nextval('public.inquiries_id_seq'::regclass);


--
-- Name: insurances id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.insurances ALTER COLUMN id SET DEFAULT nextval('public.insurances_id_seq'::regclass);


--
-- Name: loans id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.loans ALTER COLUMN id SET DEFAULT nextval('public.loans_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: security_feedback id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.security_feedback ALTER COLUMN id SET DEFAULT nextval('public.security_feedback_id_seq'::regclass);


--
-- Name: sent_messages id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.sent_messages ALTER COLUMN id SET DEFAULT nextval('public.sent_messages_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: user_settings id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.user_settings ALTER COLUMN id SET DEFAULT nextval('public.user_settings_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.appointments (id, subject, date, fullname, email, language, description, created) FROM stdin;
\.


--
-- Data for Name: contracts; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.contracts (id, user_id, title, terms, valid_from, valid_to, status) FROM stdin;
1	1	Contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
2	2	Contract #02	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
3	3	Contract #03	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
4	4	Contract #04	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
5	5	Contract #05	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
6	6	Contract #06	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
7	7	Contract #07	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
8	8	Contract #08	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
9	9	Contract #09	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
10	10	Contract #10	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
11	11	Contract #11	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
12	12	Contract #12	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
13	13	Contract #13	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
14	14	Contract #14	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
15	15	Contract #15	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
16	16	Contract #16	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
17	17	Contract #17	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
18	18	Contract #18	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
19	19	Contract #19	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
20	20	Contract #20	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
21	21	Contract #21	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
22	22	Contract #22	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
23	23	Contract #23	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
24	24	Contract #24	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
25	25	Contract #25	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
26	26	Contract #26	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
27	27	Contract #27	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
28	28	Contract #28	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
29	29	Contract #29	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
30	30	Contract #30	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
31	31	Contract #31	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
32	32	Contract #32	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
33	33	Contract #33	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
34	34	Contract #34	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
35	35	Contract #35	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
36	36	Contract #36	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
37	37	Contract #37	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
38	38	Contract #38	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
39	39	Contract #39	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
40	40	Contract #40	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
41	41	Contract #41	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
42	42	Contract #42	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
43	43	Contract #43	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
44	44	Contract #44	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
45	45	Contract #45	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
46	46	Contract #46	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
47	47	Contract #47	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
48	48	Contract #48	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
49	49	Contract #49	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
50	50	Contract #50	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
51	51	Contract #51	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
52	52	Contract #52	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
53	53	Contract #53	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
54	54	Contract #54	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
55	55	Contract #55	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
56	56	Contract #56	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
57	57	Contract #57	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
58	58	Contract #58	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
59	59	Contract #59	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
60	60	Contract #60	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
61	61	Contract #61	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
62	62	Contract #62	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
63	63	Contract #63	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
64	64	Contract #64	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
65	65	Contract #65	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
66	66	Contract #66	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
67	67	Contract #67	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
68	68	Contract #68	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
69	69	Contract #69	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
70	70	Contract #70	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
71	71	Contract #71	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
72	72	Contract #72	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
73	73	Contract #73	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
74	74	Contract #74	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
75	75	Contract #75	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
76	76	Contract #76	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
77	77	Contract #77	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
78	78	Contract #78	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
79	79	Contract #79	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
80	80	Contract #80	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
81	81	Contract #81	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
82	82	Contract #82	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
83	83	Contract #83	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
84	84	Contract #84	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
85	85	Contract #85	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
86	86	Contract #86	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
87	87	Contract #87	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
88	88	Contract #88	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
89	89	Contract #89	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
90	90	Contract #90	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
91	91	Contract #91	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
92	92	Contract #92	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
93	93	Contract #93	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
94	94	Contract #94	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
95	95	Contract #95	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
96	96	Contract #96	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
97	97	Contract #97	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
98	98	Contract #98	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
99	99	Contract #99	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
100	100	Contract #100	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
101	101	Contract #101	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
102	102	Contract #102	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
103	103	Contract #103	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
104	104	Contract #104	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
105	105	Contract #105	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
106	106	Contract #106	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
107	107	Contract #107	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
108	108	Contract #108	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
109	109	Contract #109	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
110	110	Contract #110	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
111	111	Contract #111	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
112	112	Contract #112	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
113	113	Contract #113	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
114	114	Contract #114	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
115	115	Contract #115	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
116	116	Contract #116	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
117	117	Contract #117	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
118	118	Contract #118	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
119	119	Contract #119	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
120	120	Contract #120	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
121	121	Contract #121	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
122	122	Contract #122	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
123	123	Contract #123	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
124	124	Contract #124	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
125	125	Contract #125	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
126	126	Contract #126	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
127	127	Contract #127	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
128	128	Contract #128	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
129	129	Contract #129	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
130	130	Contract #130	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
131	131	Contract #131	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
132	132	Contract #132	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
133	133	Contract #133	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
134	134	Contract #134	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
135	135	Contract #135	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
136	136	Contract #136	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
137	137	Contract #137	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
138	138	Contract #138	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
139	139	Contract #139	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
140	140	Contract #140	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
141	141	Contract #141	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
142	142	Contract #142	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
143	143	Contract #143	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
144	144	Contract #144	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
145	145	Contract #145	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
146	146	Contract #146	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
147	147	Contract #147	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
148	148	Contract #148	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
\.


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.feedback (id, topic, title, description, name, email, created) FROM stdin;
1	Service quality	Thank you!	This is the best company ever!	Jessica Lovebird	lovebird@mail.berylia.org	2005-01-06 22:00:00+00
2	top	kj	kjhkjh	kjhkjh	kjhkjh@ks.com	2025-05-06 06:20:11.412925+00
3	top	zd	ddsfd	Test	test@test.com	2025-05-06 06:20:55.009246+00
\.


--
-- Data for Name: inquiries; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.inquiries (id, user_id, related_to, title, description, file, created, status) FROM stdin;
1	1	1	Inquiry #01	Please sign insurance contract and send it at insurance@self-service.beg.05.berylia.org	\N	2005-01-06 22:00:00+00	Completed
2	4	2	Inquiry #01	Please sign insurance contract and send it at insurance@self-service.beg.05.berylia.org	\N	2005-01-06 22:00:00+00	Completed
3	5	3	Inquiry #01	Please sign insurance contract and send it at insurance@self-service.beg.05.berylia.org	\N	2005-01-06 22:00:00+00	Completed
\.


--
-- Data for Name: insurances; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.insurances (id, user_id, title, terms, valid_from, valid_to, status) FROM stdin;
1	1	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
2	2	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
3	3	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
4	4	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
5	5	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
6	6	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
7	7	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
8	8	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
9	9	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
10	10	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
11	11	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
12	12	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
13	13	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
14	14	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
15	15	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
16	16	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
17	17	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
18	18	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
19	19	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
20	20	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
21	21	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
22	22	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
23	23	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
24	24	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
25	25	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
26	26	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
27	27	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
28	28	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
29	29	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
30	30	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
31	31	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
32	32	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
33	33	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
34	34	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
35	35	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
36	36	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
37	37	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
38	38	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
39	39	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
40	40	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
41	41	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
42	42	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
43	43	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
44	44	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
45	45	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
46	46	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
47	47	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
48	48	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
49	49	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
50	50	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
51	51	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
52	52	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
53	53	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
54	54	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
55	55	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
56	56	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
57	57	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
58	58	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
59	59	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
60	60	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
61	61	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
62	62	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
63	63	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
64	64	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
65	65	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
66	66	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
67	67	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
68	68	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
69	69	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
70	70	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
71	71	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
72	72	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
73	73	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
74	74	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
75	75	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
76	76	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
77	77	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
78	78	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
79	79	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
80	80	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
81	81	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
82	82	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
83	83	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
84	84	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
85	85	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
86	86	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
87	87	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
88	88	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
89	89	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
90	90	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
91	91	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
92	92	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
93	93	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
94	94	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
95	95	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
96	96	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
97	97	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
98	98	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
99	99	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
100	100	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
101	101	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
102	102	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
103	103	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
104	104	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
105	105	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
106	106	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
107	107	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
108	108	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
109	109	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
110	110	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
111	111	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
112	112	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
113	113	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
114	114	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
115	115	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
116	116	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
117	117	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
118	118	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
119	119	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
120	120	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
121	121	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
122	122	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
123	123	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
124	124	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
125	125	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
126	126	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
127	127	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
128	128	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
129	129	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
130	130	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
131	131	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
132	132	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
133	133	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
134	134	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
135	135	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
136	136	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
137	137	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
138	138	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
139	139	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
140	140	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
141	141	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
142	142	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
143	143	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
144	144	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
145	145	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
146	146	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
147	147	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
148	148	Insurance contract #01	Terms on conditions as per publised at 2000-01-01.	2002-01-06 22:00:00+00	2032-01-06 22:00:00+00	Active
\.


--
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.loans (id, contract_id, name, amount, period, interest_rate) FROM stdin;
1	1	LOAN-#0101	100000	360	10.50
2	2	LOAN-#0102	200000	360	11.00
3	3	LOAN-#0103	300000	360	11.50
4	4	LOAN-#0104	400000	360	12.00
5	5	LOAN-#0105	500000	360	12.50
6	6	LOAN-#0106	600000	360	13.00
7	7	LOAN-#0107	700000	360	13.50
8	8	LOAN-#0108	800000	360	14.00
9	9	LOAN-#0109	900000	360	14.50
10	10	LOAN-#0110	1000000	360	15.00
11	11	LOAN-#0111	1100000	360	15.50
12	12	LOAN-#0112	1200000	360	16.00
13	13	LOAN-#0113	1300000	360	16.50
14	14	LOAN-#0114	1400000	360	17.00
15	15	LOAN-#0115	1500000	360	17.50
16	16	LOAN-#0116	1600000	360	18.00
17	17	LOAN-#0117	1700000	360	18.50
18	18	LOAN-#0118	1800000	360	19.00
19	19	LOAN-#0119	1900000	360	19.50
20	20	LOAN-#0120	2000000	360	20.00
21	21	LOAN-#0121	2100000	360	20.50
22	22	LOAN-#0122	2200000	360	21.00
23	23	LOAN-#0123	2300000	360	21.50
24	24	LOAN-#0124	2400000	360	22.00
25	25	LOAN-#0125	2500000	360	22.50
26	26	LOAN-#0126	2600000	360	23.00
27	27	LOAN-#0127	2700000	360	23.50
28	28	LOAN-#0128	2800000	360	24.00
29	29	LOAN-#0129	2900000	360	24.50
30	30	LOAN-#0130	3000000	360	25.00
31	31	LOAN-#0131	3100000	360	25.50
32	32	LOAN-#0132	3200000	360	26.00
33	33	LOAN-#0133	3300000	360	26.50
34	34	LOAN-#0134	3400000	360	27.00
35	35	LOAN-#0135	3500000	360	27.50
36	36	LOAN-#0136	3600000	360	28.00
37	37	LOAN-#0137	3700000	360	28.50
38	38	LOAN-#0138	3800000	360	29.00
39	39	LOAN-#0139	3900000	360	29.50
40	40	LOAN-#0140	4000000	360	30.00
41	41	LOAN-#0141	4100000	360	30.50
42	42	LOAN-#0142	4200000	360	31.00
43	43	LOAN-#0143	4300000	360	31.50
44	44	LOAN-#0144	4400000	360	32.00
45	45	LOAN-#0145	4500000	360	32.50
46	46	LOAN-#0146	4600000	360	33.00
47	47	LOAN-#0147	4700000	360	33.50
48	48	LOAN-#0148	4800000	360	34.00
49	49	LOAN-#0149	4900000	360	34.50
50	50	LOAN-#0150	5000000	360	35.00
51	51	LOAN-#0151	5100000	360	35.50
52	52	LOAN-#0152	5200000	360	36.00
53	53	LOAN-#0153	5300000	360	36.50
54	54	LOAN-#0154	5400000	360	37.00
55	55	LOAN-#0155	5500000	360	37.50
56	56	LOAN-#0156	5600000	360	38.00
57	57	LOAN-#0157	5700000	360	38.50
58	58	LOAN-#0158	5800000	360	39.00
59	59	LOAN-#0159	5900000	360	39.50
60	60	LOAN-#0160	6000000	360	40.00
61	61	LOAN-#0161	6100000	360	40.50
62	62	LOAN-#0162	6200000	360	41.00
63	63	LOAN-#0163	6300000	360	41.50
64	64	LOAN-#0164	6400000	360	42.00
65	65	LOAN-#0165	6500000	360	42.50
66	66	LOAN-#0166	6600000	360	43.00
67	67	LOAN-#0167	6700000	360	43.50
68	68	LOAN-#0168	6800000	360	44.00
69	69	LOAN-#0169	6900000	360	44.50
70	70	LOAN-#0170	7000000	360	45.00
71	71	LOAN-#0171	7100000	360	45.50
72	72	LOAN-#0172	7200000	360	46.00
73	73	LOAN-#0173	7300000	360	46.50
74	74	LOAN-#0174	7400000	360	47.00
75	75	LOAN-#0175	7500000	360	47.50
76	76	LOAN-#0176	7600000	360	48.00
77	77	LOAN-#0177	7700000	360	48.50
78	78	LOAN-#0178	7800000	360	49.00
79	79	LOAN-#0179	7900000	360	49.50
80	80	LOAN-#0180	8000000	360	50.00
81	81	LOAN-#0181	8100000	360	50.50
82	82	LOAN-#0182	8200000	360	51.00
83	83	LOAN-#0183	8300000	360	51.50
84	84	LOAN-#0184	8400000	360	52.00
85	85	LOAN-#0185	8500000	360	52.50
86	86	LOAN-#0186	8600000	360	53.00
87	87	LOAN-#0187	8700000	360	53.50
88	88	LOAN-#0188	8800000	360	54.00
89	89	LOAN-#0189	8900000	360	54.50
90	90	LOAN-#0190	9000000	360	55.00
91	91	LOAN-#0191	9100000	360	55.50
92	92	LOAN-#0192	9200000	360	56.00
93	93	LOAN-#0193	9300000	360	56.50
94	94	LOAN-#0194	9400000	360	57.00
95	95	LOAN-#0195	9500000	360	57.50
96	96	LOAN-#0196	9600000	360	58.00
97	97	LOAN-#0197	9700000	360	58.50
98	98	LOAN-#0198	9800000	360	59.00
99	99	LOAN-#0199	9900000	360	59.50
100	100	LOAN-#0200	10000000	360	60.00
101	101	LOAN-#0201	10100000	360	60.50
102	102	LOAN-#0202	10200000	360	61.00
103	103	LOAN-#0203	10300000	360	61.50
104	104	LOAN-#0204	10400000	360	62.00
105	105	LOAN-#0205	10500000	360	62.50
106	106	LOAN-#0206	10600000	360	63.00
107	107	LOAN-#0207	10700000	360	63.50
108	108	LOAN-#0208	10800000	360	64.00
109	109	LOAN-#0209	10900000	360	64.50
110	110	LOAN-#0210	11000000	360	65.00
111	111	LOAN-#0211	11100000	360	65.50
112	112	LOAN-#0212	11200000	360	66.00
113	113	LOAN-#0213	11300000	360	66.50
114	114	LOAN-#0214	11400000	360	67.00
115	115	LOAN-#0215	11500000	360	67.50
116	116	LOAN-#0216	11600000	360	68.00
117	117	LOAN-#0217	11700000	360	68.50
118	118	LOAN-#0218	11800000	360	69.00
119	119	LOAN-#0219	11900000	360	69.50
120	120	LOAN-#0220	12000000	360	70.00
121	121	LOAN-#0221	12100000	360	70.50
122	122	LOAN-#0222	12200000	360	71.00
123	123	LOAN-#0223	12300000	360	71.50
124	124	LOAN-#0224	12400000	360	72.00
125	125	LOAN-#0225	12500000	360	72.50
126	126	LOAN-#0226	12600000	360	73.00
127	127	LOAN-#0227	12700000	360	73.50
128	128	LOAN-#0228	12800000	360	74.00
129	129	LOAN-#0229	12900000	360	74.50
130	130	LOAN-#0230	13000000	360	75.00
131	131	LOAN-#0231	13100000	360	75.50
132	132	LOAN-#0232	13200000	360	76.00
133	133	LOAN-#0233	13300000	360	76.50
134	134	LOAN-#0234	13400000	360	77.00
135	135	LOAN-#0235	13500000	360	77.50
136	136	LOAN-#0236	13600000	360	78.00
137	137	LOAN-#0237	13700000	360	78.50
138	138	LOAN-#0238	13800000	360	79.00
139	139	LOAN-#0239	13900000	360	79.50
140	140	LOAN-#0240	14000000	360	80.00
141	141	LOAN-#0241	14100000	360	80.50
142	142	LOAN-#0242	14200000	360	81.00
143	143	LOAN-#0243	14300000	360	81.50
144	144	LOAN-#0244	14400000	360	82.00
145	145	LOAN-#0245	14500000	360	82.50
146	146	LOAN-#0246	14600000	360	83.00
147	147	LOAN-#0247	14700000	360	83.50
148	148	LOAN-#0248	14800000	360	84.00
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.messages (id, subject, message, created) FROM stdin;
1	test1	message1	2023-01-01 12:00:00+00
2	test2	message2	2023-01-01 12:01:00+00
3	test3	message3	2023-01-01 12:02:00+00
4	test4	message4	2023-01-01 12:03:00+00
5	test5	message5	2023-01-01 12:04:00+00
6	test6	message6	2023-01-01 12:05:00+00
7	test7	message7	2023-01-01 12:06:00+00
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.news (id, title, description, created, status) FROM stdin;
1	A result of the investment boom: the number of clients has exceeded 50,000	The BEG is one of the most popular choices among Berylians. This week, the number of clients already exceeded 50,000; 40,000 of them have joined in the last three years.	2005-01-06 22:00:00+00	published
2	Bring your pet to work day	We have several pets working in our office as a "stress level managers". Please bring snacks for dogs and toys for cats!	2019-03-31 22:00:00+00	published
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.notifications (id, user_id, subject, message, created) FROM stdin;
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.payments (id, loan_id, invoice, amount, payed_at) FROM stdin;
1	1	INV-0001	500	2015-01-10 00:00:00+00
2	1	INV-0002	500	2015-02-10 00:00:00+00
3	1	INV-0003	500	2015-03-10 00:00:00+00
4	1	INV-0004	500	2015-04-10 00:00:00+00
5	2	INV-0001	500	2015-01-10 00:00:00+00
6	2	INV-0002	500	2015-02-10 00:00:00+00
7	2	INV-0003	500	2015-03-10 00:00:00+00
8	2	INV-0004	500	2015-04-10 00:00:00+00
9	3	INV-0001	500	2015-01-10 00:00:00+00
10	3	INV-0002	500	2015-02-10 00:00:00+00
11	3	INV-0003	500	2015-03-10 00:00:00+00
12	3	INV-0004	500	2015-04-10 00:00:00+00
13	4	INV-0001	500	2015-01-10 00:00:00+00
14	4	INV-0002	500	2015-02-10 00:00:00+00
15	4	INV-0003	500	2015-03-10 00:00:00+00
16	4	INV-0004	500	2015-04-10 00:00:00+00
17	5	INV-0001	500	2015-01-10 00:00:00+00
18	5	INV-0002	500	2015-02-10 00:00:00+00
19	5	INV-0003	500	2015-03-10 00:00:00+00
20	5	INV-0004	500	2015-04-10 00:00:00+00
21	6	INV-0001	500	2015-01-10 00:00:00+00
22	6	INV-0002	500	2015-02-10 00:00:00+00
23	6	INV-0003	500	2015-03-10 00:00:00+00
24	6	INV-0004	500	2015-04-10 00:00:00+00
25	7	INV-0001	500	2015-01-10 00:00:00+00
26	7	INV-0002	500	2015-02-10 00:00:00+00
27	7	INV-0003	500	2015-03-10 00:00:00+00
28	7	INV-0004	500	2015-04-10 00:00:00+00
29	8	INV-0001	500	2015-01-10 00:00:00+00
30	8	INV-0002	500	2015-02-10 00:00:00+00
31	8	INV-0003	500	2015-03-10 00:00:00+00
32	8	INV-0004	500	2015-04-10 00:00:00+00
33	9	INV-0001	500	2015-01-10 00:00:00+00
34	9	INV-0002	500	2015-02-10 00:00:00+00
35	9	INV-0003	500	2015-03-10 00:00:00+00
36	9	INV-0004	500	2015-04-10 00:00:00+00
37	10	INV-0001	500	2015-01-10 00:00:00+00
38	10	INV-0002	500	2015-02-10 00:00:00+00
39	10	INV-0003	500	2015-03-10 00:00:00+00
40	10	INV-0004	500	2015-04-10 00:00:00+00
41	11	INV-0001	500	2015-01-10 00:00:00+00
42	11	INV-0002	500	2015-02-10 00:00:00+00
43	11	INV-0003	500	2015-03-10 00:00:00+00
44	11	INV-0004	500	2015-04-10 00:00:00+00
45	12	INV-0001	500	2015-01-10 00:00:00+00
46	12	INV-0002	500	2015-02-10 00:00:00+00
47	12	INV-0003	500	2015-03-10 00:00:00+00
48	12	INV-0004	500	2015-04-10 00:00:00+00
49	13	INV-0001	500	2015-01-10 00:00:00+00
50	13	INV-0002	500	2015-02-10 00:00:00+00
51	13	INV-0003	500	2015-03-10 00:00:00+00
52	13	INV-0004	500	2015-04-10 00:00:00+00
53	14	INV-0001	500	2015-01-10 00:00:00+00
54	14	INV-0002	500	2015-02-10 00:00:00+00
55	14	INV-0003	500	2015-03-10 00:00:00+00
56	14	INV-0004	500	2015-04-10 00:00:00+00
57	15	INV-0001	500	2015-01-10 00:00:00+00
58	15	INV-0002	500	2015-02-10 00:00:00+00
59	15	INV-0003	500	2015-03-10 00:00:00+00
60	15	INV-0004	500	2015-04-10 00:00:00+00
61	16	INV-0001	500	2015-01-10 00:00:00+00
62	16	INV-0002	500	2015-02-10 00:00:00+00
63	16	INV-0003	500	2015-03-10 00:00:00+00
64	16	INV-0004	500	2015-04-10 00:00:00+00
65	17	INV-0001	500	2015-01-10 00:00:00+00
66	17	INV-0002	500	2015-02-10 00:00:00+00
67	17	INV-0003	500	2015-03-10 00:00:00+00
68	17	INV-0004	500	2015-04-10 00:00:00+00
69	18	INV-0001	500	2015-01-10 00:00:00+00
70	18	INV-0002	500	2015-02-10 00:00:00+00
71	18	INV-0003	500	2015-03-10 00:00:00+00
72	18	INV-0004	500	2015-04-10 00:00:00+00
73	19	INV-0001	500	2015-01-10 00:00:00+00
74	19	INV-0002	500	2015-02-10 00:00:00+00
75	19	INV-0003	500	2015-03-10 00:00:00+00
76	19	INV-0004	500	2015-04-10 00:00:00+00
77	20	INV-0001	500	2015-01-10 00:00:00+00
78	20	INV-0002	500	2015-02-10 00:00:00+00
79	20	INV-0003	500	2015-03-10 00:00:00+00
80	20	INV-0004	500	2015-04-10 00:00:00+00
81	21	INV-0001	500	2015-01-10 00:00:00+00
82	21	INV-0002	500	2015-02-10 00:00:00+00
83	21	INV-0003	500	2015-03-10 00:00:00+00
84	21	INV-0004	500	2015-04-10 00:00:00+00
85	22	INV-0001	500	2015-01-10 00:00:00+00
86	22	INV-0002	500	2015-02-10 00:00:00+00
87	22	INV-0003	500	2015-03-10 00:00:00+00
88	22	INV-0004	500	2015-04-10 00:00:00+00
89	23	INV-0001	500	2015-01-10 00:00:00+00
90	23	INV-0002	500	2015-02-10 00:00:00+00
91	23	INV-0003	500	2015-03-10 00:00:00+00
92	23	INV-0004	500	2015-04-10 00:00:00+00
93	24	INV-0001	500	2015-01-10 00:00:00+00
94	24	INV-0002	500	2015-02-10 00:00:00+00
95	24	INV-0003	500	2015-03-10 00:00:00+00
96	24	INV-0004	500	2015-04-10 00:00:00+00
97	25	INV-0001	500	2015-01-10 00:00:00+00
98	25	INV-0002	500	2015-02-10 00:00:00+00
99	25	INV-0003	500	2015-03-10 00:00:00+00
100	25	INV-0004	500	2015-04-10 00:00:00+00
101	26	INV-0001	500	2015-01-10 00:00:00+00
102	26	INV-0002	500	2015-02-10 00:00:00+00
103	26	INV-0003	500	2015-03-10 00:00:00+00
104	26	INV-0004	500	2015-04-10 00:00:00+00
105	27	INV-0001	500	2015-01-10 00:00:00+00
106	27	INV-0002	500	2015-02-10 00:00:00+00
107	27	INV-0003	500	2015-03-10 00:00:00+00
108	27	INV-0004	500	2015-04-10 00:00:00+00
109	28	INV-0001	500	2015-01-10 00:00:00+00
110	28	INV-0002	500	2015-02-10 00:00:00+00
111	28	INV-0003	500	2015-03-10 00:00:00+00
112	28	INV-0004	500	2015-04-10 00:00:00+00
113	29	INV-0001	500	2015-01-10 00:00:00+00
114	29	INV-0002	500	2015-02-10 00:00:00+00
115	29	INV-0003	500	2015-03-10 00:00:00+00
116	29	INV-0004	500	2015-04-10 00:00:00+00
117	30	INV-0001	500	2015-01-10 00:00:00+00
118	30	INV-0002	500	2015-02-10 00:00:00+00
119	30	INV-0003	500	2015-03-10 00:00:00+00
120	30	INV-0004	500	2015-04-10 00:00:00+00
121	31	INV-0001	500	2015-01-10 00:00:00+00
122	31	INV-0002	500	2015-02-10 00:00:00+00
123	31	INV-0003	500	2015-03-10 00:00:00+00
124	31	INV-0004	500	2015-04-10 00:00:00+00
125	32	INV-0001	500	2015-01-10 00:00:00+00
126	32	INV-0002	500	2015-02-10 00:00:00+00
127	32	INV-0003	500	2015-03-10 00:00:00+00
128	32	INV-0004	500	2015-04-10 00:00:00+00
129	33	INV-0001	500	2015-01-10 00:00:00+00
130	33	INV-0002	500	2015-02-10 00:00:00+00
131	33	INV-0003	500	2015-03-10 00:00:00+00
132	33	INV-0004	500	2015-04-10 00:00:00+00
133	34	INV-0001	500	2015-01-10 00:00:00+00
134	34	INV-0002	500	2015-02-10 00:00:00+00
135	34	INV-0003	500	2015-03-10 00:00:00+00
136	34	INV-0004	500	2015-04-10 00:00:00+00
137	35	INV-0001	500	2015-01-10 00:00:00+00
138	35	INV-0002	500	2015-02-10 00:00:00+00
139	35	INV-0003	500	2015-03-10 00:00:00+00
140	35	INV-0004	500	2015-04-10 00:00:00+00
141	36	INV-0001	500	2015-01-10 00:00:00+00
142	36	INV-0002	500	2015-02-10 00:00:00+00
143	36	INV-0003	500	2015-03-10 00:00:00+00
144	36	INV-0004	500	2015-04-10 00:00:00+00
145	37	INV-0001	500	2015-01-10 00:00:00+00
146	37	INV-0002	500	2015-02-10 00:00:00+00
147	37	INV-0003	500	2015-03-10 00:00:00+00
148	37	INV-0004	500	2015-04-10 00:00:00+00
149	38	INV-0001	500	2015-01-10 00:00:00+00
150	38	INV-0002	500	2015-02-10 00:00:00+00
151	38	INV-0003	500	2015-03-10 00:00:00+00
152	38	INV-0004	500	2015-04-10 00:00:00+00
153	39	INV-0001	500	2015-01-10 00:00:00+00
154	39	INV-0002	500	2015-02-10 00:00:00+00
155	39	INV-0003	500	2015-03-10 00:00:00+00
156	39	INV-0004	500	2015-04-10 00:00:00+00
157	40	INV-0001	500	2015-01-10 00:00:00+00
158	40	INV-0002	500	2015-02-10 00:00:00+00
159	40	INV-0003	500	2015-03-10 00:00:00+00
160	40	INV-0004	500	2015-04-10 00:00:00+00
161	41	INV-0001	500	2015-01-10 00:00:00+00
162	41	INV-0002	500	2015-02-10 00:00:00+00
163	41	INV-0003	500	2015-03-10 00:00:00+00
164	41	INV-0004	500	2015-04-10 00:00:00+00
165	42	INV-0001	500	2015-01-10 00:00:00+00
166	42	INV-0002	500	2015-02-10 00:00:00+00
167	42	INV-0003	500	2015-03-10 00:00:00+00
168	42	INV-0004	500	2015-04-10 00:00:00+00
169	43	INV-0001	500	2015-01-10 00:00:00+00
170	43	INV-0002	500	2015-02-10 00:00:00+00
171	43	INV-0003	500	2015-03-10 00:00:00+00
172	43	INV-0004	500	2015-04-10 00:00:00+00
173	44	INV-0001	500	2015-01-10 00:00:00+00
174	44	INV-0002	500	2015-02-10 00:00:00+00
175	44	INV-0003	500	2015-03-10 00:00:00+00
176	44	INV-0004	500	2015-04-10 00:00:00+00
177	45	INV-0001	500	2015-01-10 00:00:00+00
178	45	INV-0002	500	2015-02-10 00:00:00+00
179	45	INV-0003	500	2015-03-10 00:00:00+00
180	45	INV-0004	500	2015-04-10 00:00:00+00
181	46	INV-0001	500	2015-01-10 00:00:00+00
182	46	INV-0002	500	2015-02-10 00:00:00+00
183	46	INV-0003	500	2015-03-10 00:00:00+00
184	46	INV-0004	500	2015-04-10 00:00:00+00
185	47	INV-0001	500	2015-01-10 00:00:00+00
186	47	INV-0002	500	2015-02-10 00:00:00+00
187	47	INV-0003	500	2015-03-10 00:00:00+00
188	47	INV-0004	500	2015-04-10 00:00:00+00
189	48	INV-0001	500	2015-01-10 00:00:00+00
190	48	INV-0002	500	2015-02-10 00:00:00+00
191	48	INV-0003	500	2015-03-10 00:00:00+00
192	48	INV-0004	500	2015-04-10 00:00:00+00
193	49	INV-0001	500	2015-01-10 00:00:00+00
194	49	INV-0002	500	2015-02-10 00:00:00+00
195	49	INV-0003	500	2015-03-10 00:00:00+00
196	49	INV-0004	500	2015-04-10 00:00:00+00
197	50	INV-0001	500	2015-01-10 00:00:00+00
198	50	INV-0002	500	2015-02-10 00:00:00+00
199	50	INV-0003	500	2015-03-10 00:00:00+00
200	50	INV-0004	500	2015-04-10 00:00:00+00
201	51	INV-0001	500	2015-01-10 00:00:00+00
202	51	INV-0002	500	2015-02-10 00:00:00+00
203	51	INV-0003	500	2015-03-10 00:00:00+00
204	51	INV-0004	500	2015-04-10 00:00:00+00
205	52	INV-0001	500	2015-01-10 00:00:00+00
206	52	INV-0002	500	2015-02-10 00:00:00+00
207	52	INV-0003	500	2015-03-10 00:00:00+00
208	52	INV-0004	500	2015-04-10 00:00:00+00
209	53	INV-0001	500	2015-01-10 00:00:00+00
210	53	INV-0002	500	2015-02-10 00:00:00+00
211	53	INV-0003	500	2015-03-10 00:00:00+00
212	53	INV-0004	500	2015-04-10 00:00:00+00
213	54	INV-0001	500	2015-01-10 00:00:00+00
214	54	INV-0002	500	2015-02-10 00:00:00+00
215	54	INV-0003	500	2015-03-10 00:00:00+00
216	54	INV-0004	500	2015-04-10 00:00:00+00
217	55	INV-0001	500	2015-01-10 00:00:00+00
218	55	INV-0002	500	2015-02-10 00:00:00+00
219	55	INV-0003	500	2015-03-10 00:00:00+00
220	55	INV-0004	500	2015-04-10 00:00:00+00
221	56	INV-0001	500	2015-01-10 00:00:00+00
222	56	INV-0002	500	2015-02-10 00:00:00+00
223	56	INV-0003	500	2015-03-10 00:00:00+00
224	56	INV-0004	500	2015-04-10 00:00:00+00
225	57	INV-0001	500	2015-01-10 00:00:00+00
226	57	INV-0002	500	2015-02-10 00:00:00+00
227	57	INV-0003	500	2015-03-10 00:00:00+00
228	57	INV-0004	500	2015-04-10 00:00:00+00
229	58	INV-0001	500	2015-01-10 00:00:00+00
230	58	INV-0002	500	2015-02-10 00:00:00+00
231	58	INV-0003	500	2015-03-10 00:00:00+00
232	58	INV-0004	500	2015-04-10 00:00:00+00
233	59	INV-0001	500	2015-01-10 00:00:00+00
234	59	INV-0002	500	2015-02-10 00:00:00+00
235	59	INV-0003	500	2015-03-10 00:00:00+00
236	59	INV-0004	500	2015-04-10 00:00:00+00
237	60	INV-0001	500	2015-01-10 00:00:00+00
238	60	INV-0002	500	2015-02-10 00:00:00+00
239	60	INV-0003	500	2015-03-10 00:00:00+00
240	60	INV-0004	500	2015-04-10 00:00:00+00
241	61	INV-0001	500	2015-01-10 00:00:00+00
242	61	INV-0002	500	2015-02-10 00:00:00+00
243	61	INV-0003	500	2015-03-10 00:00:00+00
244	61	INV-0004	500	2015-04-10 00:00:00+00
245	62	INV-0001	500	2015-01-10 00:00:00+00
246	62	INV-0002	500	2015-02-10 00:00:00+00
247	62	INV-0003	500	2015-03-10 00:00:00+00
248	62	INV-0004	500	2015-04-10 00:00:00+00
249	63	INV-0001	500	2015-01-10 00:00:00+00
250	63	INV-0002	500	2015-02-10 00:00:00+00
251	63	INV-0003	500	2015-03-10 00:00:00+00
252	63	INV-0004	500	2015-04-10 00:00:00+00
253	64	INV-0001	500	2015-01-10 00:00:00+00
254	64	INV-0002	500	2015-02-10 00:00:00+00
255	64	INV-0003	500	2015-03-10 00:00:00+00
256	64	INV-0004	500	2015-04-10 00:00:00+00
257	65	INV-0001	500	2015-01-10 00:00:00+00
258	65	INV-0002	500	2015-02-10 00:00:00+00
259	65	INV-0003	500	2015-03-10 00:00:00+00
260	65	INV-0004	500	2015-04-10 00:00:00+00
261	66	INV-0001	500	2015-01-10 00:00:00+00
262	66	INV-0002	500	2015-02-10 00:00:00+00
263	66	INV-0003	500	2015-03-10 00:00:00+00
264	66	INV-0004	500	2015-04-10 00:00:00+00
265	67	INV-0001	500	2015-01-10 00:00:00+00
266	67	INV-0002	500	2015-02-10 00:00:00+00
267	67	INV-0003	500	2015-03-10 00:00:00+00
268	67	INV-0004	500	2015-04-10 00:00:00+00
269	68	INV-0001	500	2015-01-10 00:00:00+00
270	68	INV-0002	500	2015-02-10 00:00:00+00
271	68	INV-0003	500	2015-03-10 00:00:00+00
272	68	INV-0004	500	2015-04-10 00:00:00+00
273	69	INV-0001	500	2015-01-10 00:00:00+00
274	69	INV-0002	500	2015-02-10 00:00:00+00
275	69	INV-0003	500	2015-03-10 00:00:00+00
276	69	INV-0004	500	2015-04-10 00:00:00+00
277	70	INV-0001	500	2015-01-10 00:00:00+00
278	70	INV-0002	500	2015-02-10 00:00:00+00
279	70	INV-0003	500	2015-03-10 00:00:00+00
280	70	INV-0004	500	2015-04-10 00:00:00+00
281	71	INV-0001	500	2015-01-10 00:00:00+00
282	71	INV-0002	500	2015-02-10 00:00:00+00
283	71	INV-0003	500	2015-03-10 00:00:00+00
284	71	INV-0004	500	2015-04-10 00:00:00+00
285	72	INV-0001	500	2015-01-10 00:00:00+00
286	72	INV-0002	500	2015-02-10 00:00:00+00
287	72	INV-0003	500	2015-03-10 00:00:00+00
288	72	INV-0004	500	2015-04-10 00:00:00+00
289	73	INV-0001	500	2015-01-10 00:00:00+00
290	73	INV-0002	500	2015-02-10 00:00:00+00
291	73	INV-0003	500	2015-03-10 00:00:00+00
292	73	INV-0004	500	2015-04-10 00:00:00+00
293	74	INV-0001	500	2015-01-10 00:00:00+00
294	74	INV-0002	500	2015-02-10 00:00:00+00
295	74	INV-0003	500	2015-03-10 00:00:00+00
296	74	INV-0004	500	2015-04-10 00:00:00+00
297	75	INV-0001	500	2015-01-10 00:00:00+00
298	75	INV-0002	500	2015-02-10 00:00:00+00
299	75	INV-0003	500	2015-03-10 00:00:00+00
300	75	INV-0004	500	2015-04-10 00:00:00+00
301	76	INV-0001	500	2015-01-10 00:00:00+00
302	76	INV-0002	500	2015-02-10 00:00:00+00
303	76	INV-0003	500	2015-03-10 00:00:00+00
304	76	INV-0004	500	2015-04-10 00:00:00+00
305	77	INV-0001	500	2015-01-10 00:00:00+00
306	77	INV-0002	500	2015-02-10 00:00:00+00
307	77	INV-0003	500	2015-03-10 00:00:00+00
308	77	INV-0004	500	2015-04-10 00:00:00+00
309	78	INV-0001	500	2015-01-10 00:00:00+00
310	78	INV-0002	500	2015-02-10 00:00:00+00
311	78	INV-0003	500	2015-03-10 00:00:00+00
312	78	INV-0004	500	2015-04-10 00:00:00+00
313	79	INV-0001	500	2015-01-10 00:00:00+00
314	79	INV-0002	500	2015-02-10 00:00:00+00
315	79	INV-0003	500	2015-03-10 00:00:00+00
316	79	INV-0004	500	2015-04-10 00:00:00+00
317	80	INV-0001	500	2015-01-10 00:00:00+00
318	80	INV-0002	500	2015-02-10 00:00:00+00
319	80	INV-0003	500	2015-03-10 00:00:00+00
320	80	INV-0004	500	2015-04-10 00:00:00+00
321	81	INV-0001	500	2015-01-10 00:00:00+00
322	81	INV-0002	500	2015-02-10 00:00:00+00
323	81	INV-0003	500	2015-03-10 00:00:00+00
324	81	INV-0004	500	2015-04-10 00:00:00+00
325	82	INV-0001	500	2015-01-10 00:00:00+00
326	82	INV-0002	500	2015-02-10 00:00:00+00
327	82	INV-0003	500	2015-03-10 00:00:00+00
328	82	INV-0004	500	2015-04-10 00:00:00+00
329	83	INV-0001	500	2015-01-10 00:00:00+00
330	83	INV-0002	500	2015-02-10 00:00:00+00
331	83	INV-0003	500	2015-03-10 00:00:00+00
332	83	INV-0004	500	2015-04-10 00:00:00+00
333	84	INV-0001	500	2015-01-10 00:00:00+00
334	84	INV-0002	500	2015-02-10 00:00:00+00
335	84	INV-0003	500	2015-03-10 00:00:00+00
336	84	INV-0004	500	2015-04-10 00:00:00+00
337	85	INV-0001	500	2015-01-10 00:00:00+00
338	85	INV-0002	500	2015-02-10 00:00:00+00
339	85	INV-0003	500	2015-03-10 00:00:00+00
340	85	INV-0004	500	2015-04-10 00:00:00+00
341	86	INV-0001	500	2015-01-10 00:00:00+00
342	86	INV-0002	500	2015-02-10 00:00:00+00
343	86	INV-0003	500	2015-03-10 00:00:00+00
344	86	INV-0004	500	2015-04-10 00:00:00+00
345	87	INV-0001	500	2015-01-10 00:00:00+00
346	87	INV-0002	500	2015-02-10 00:00:00+00
347	87	INV-0003	500	2015-03-10 00:00:00+00
348	87	INV-0004	500	2015-04-10 00:00:00+00
349	88	INV-0001	500	2015-01-10 00:00:00+00
350	88	INV-0002	500	2015-02-10 00:00:00+00
351	88	INV-0003	500	2015-03-10 00:00:00+00
352	88	INV-0004	500	2015-04-10 00:00:00+00
353	89	INV-0001	500	2015-01-10 00:00:00+00
354	89	INV-0002	500	2015-02-10 00:00:00+00
355	89	INV-0003	500	2015-03-10 00:00:00+00
356	89	INV-0004	500	2015-04-10 00:00:00+00
357	90	INV-0001	500	2015-01-10 00:00:00+00
358	90	INV-0002	500	2015-02-10 00:00:00+00
359	90	INV-0003	500	2015-03-10 00:00:00+00
360	90	INV-0004	500	2015-04-10 00:00:00+00
361	91	INV-0001	500	2015-01-10 00:00:00+00
362	91	INV-0002	500	2015-02-10 00:00:00+00
363	91	INV-0003	500	2015-03-10 00:00:00+00
364	91	INV-0004	500	2015-04-10 00:00:00+00
365	92	INV-0001	500	2015-01-10 00:00:00+00
366	92	INV-0002	500	2015-02-10 00:00:00+00
367	92	INV-0003	500	2015-03-10 00:00:00+00
368	92	INV-0004	500	2015-04-10 00:00:00+00
369	93	INV-0001	500	2015-01-10 00:00:00+00
370	93	INV-0002	500	2015-02-10 00:00:00+00
371	93	INV-0003	500	2015-03-10 00:00:00+00
372	93	INV-0004	500	2015-04-10 00:00:00+00
373	94	INV-0001	500	2015-01-10 00:00:00+00
374	94	INV-0002	500	2015-02-10 00:00:00+00
375	94	INV-0003	500	2015-03-10 00:00:00+00
376	94	INV-0004	500	2015-04-10 00:00:00+00
377	95	INV-0001	500	2015-01-10 00:00:00+00
378	95	INV-0002	500	2015-02-10 00:00:00+00
379	95	INV-0003	500	2015-03-10 00:00:00+00
380	95	INV-0004	500	2015-04-10 00:00:00+00
381	96	INV-0001	500	2015-01-10 00:00:00+00
382	96	INV-0002	500	2015-02-10 00:00:00+00
383	96	INV-0003	500	2015-03-10 00:00:00+00
384	96	INV-0004	500	2015-04-10 00:00:00+00
385	97	INV-0001	500	2015-01-10 00:00:00+00
386	97	INV-0002	500	2015-02-10 00:00:00+00
387	97	INV-0003	500	2015-03-10 00:00:00+00
388	97	INV-0004	500	2015-04-10 00:00:00+00
389	98	INV-0001	500	2015-01-10 00:00:00+00
390	98	INV-0002	500	2015-02-10 00:00:00+00
391	98	INV-0003	500	2015-03-10 00:00:00+00
392	98	INV-0004	500	2015-04-10 00:00:00+00
393	99	INV-0001	500	2015-01-10 00:00:00+00
394	99	INV-0002	500	2015-02-10 00:00:00+00
395	99	INV-0003	500	2015-03-10 00:00:00+00
396	99	INV-0004	500	2015-04-10 00:00:00+00
397	100	INV-0001	500	2015-01-10 00:00:00+00
398	100	INV-0002	500	2015-02-10 00:00:00+00
399	100	INV-0003	500	2015-03-10 00:00:00+00
400	100	INV-0004	500	2015-04-10 00:00:00+00
401	101	INV-0001	500	2015-01-10 00:00:00+00
402	101	INV-0002	500	2015-02-10 00:00:00+00
403	101	INV-0003	500	2015-03-10 00:00:00+00
404	101	INV-0004	500	2015-04-10 00:00:00+00
405	102	INV-0001	500	2015-01-10 00:00:00+00
406	102	INV-0002	500	2015-02-10 00:00:00+00
407	102	INV-0003	500	2015-03-10 00:00:00+00
408	102	INV-0004	500	2015-04-10 00:00:00+00
409	103	INV-0001	500	2015-01-10 00:00:00+00
410	103	INV-0002	500	2015-02-10 00:00:00+00
411	103	INV-0003	500	2015-03-10 00:00:00+00
412	103	INV-0004	500	2015-04-10 00:00:00+00
413	104	INV-0001	500	2015-01-10 00:00:00+00
414	104	INV-0002	500	2015-02-10 00:00:00+00
415	104	INV-0003	500	2015-03-10 00:00:00+00
416	104	INV-0004	500	2015-04-10 00:00:00+00
417	105	INV-0001	500	2015-01-10 00:00:00+00
418	105	INV-0002	500	2015-02-10 00:00:00+00
419	105	INV-0003	500	2015-03-10 00:00:00+00
420	105	INV-0004	500	2015-04-10 00:00:00+00
421	106	INV-0001	500	2015-01-10 00:00:00+00
422	106	INV-0002	500	2015-02-10 00:00:00+00
423	106	INV-0003	500	2015-03-10 00:00:00+00
424	106	INV-0004	500	2015-04-10 00:00:00+00
425	107	INV-0001	500	2015-01-10 00:00:00+00
426	107	INV-0002	500	2015-02-10 00:00:00+00
427	107	INV-0003	500	2015-03-10 00:00:00+00
428	107	INV-0004	500	2015-04-10 00:00:00+00
429	108	INV-0001	500	2015-01-10 00:00:00+00
430	108	INV-0002	500	2015-02-10 00:00:00+00
431	108	INV-0003	500	2015-03-10 00:00:00+00
432	108	INV-0004	500	2015-04-10 00:00:00+00
433	109	INV-0001	500	2015-01-10 00:00:00+00
434	109	INV-0002	500	2015-02-10 00:00:00+00
435	109	INV-0003	500	2015-03-10 00:00:00+00
436	109	INV-0004	500	2015-04-10 00:00:00+00
437	110	INV-0001	500	2015-01-10 00:00:00+00
438	110	INV-0002	500	2015-02-10 00:00:00+00
439	110	INV-0003	500	2015-03-10 00:00:00+00
440	110	INV-0004	500	2015-04-10 00:00:00+00
441	111	INV-0001	500	2015-01-10 00:00:00+00
442	111	INV-0002	500	2015-02-10 00:00:00+00
443	111	INV-0003	500	2015-03-10 00:00:00+00
444	111	INV-0004	500	2015-04-10 00:00:00+00
445	112	INV-0001	500	2015-01-10 00:00:00+00
446	112	INV-0002	500	2015-02-10 00:00:00+00
447	112	INV-0003	500	2015-03-10 00:00:00+00
448	112	INV-0004	500	2015-04-10 00:00:00+00
449	113	INV-0001	500	2015-01-10 00:00:00+00
450	113	INV-0002	500	2015-02-10 00:00:00+00
451	113	INV-0003	500	2015-03-10 00:00:00+00
452	113	INV-0004	500	2015-04-10 00:00:00+00
453	114	INV-0001	500	2015-01-10 00:00:00+00
454	114	INV-0002	500	2015-02-10 00:00:00+00
455	114	INV-0003	500	2015-03-10 00:00:00+00
456	114	INV-0004	500	2015-04-10 00:00:00+00
457	115	INV-0001	500	2015-01-10 00:00:00+00
458	115	INV-0002	500	2015-02-10 00:00:00+00
459	115	INV-0003	500	2015-03-10 00:00:00+00
460	115	INV-0004	500	2015-04-10 00:00:00+00
461	116	INV-0001	500	2015-01-10 00:00:00+00
462	116	INV-0002	500	2015-02-10 00:00:00+00
463	116	INV-0003	500	2015-03-10 00:00:00+00
464	116	INV-0004	500	2015-04-10 00:00:00+00
465	117	INV-0001	500	2015-01-10 00:00:00+00
466	117	INV-0002	500	2015-02-10 00:00:00+00
467	117	INV-0003	500	2015-03-10 00:00:00+00
468	117	INV-0004	500	2015-04-10 00:00:00+00
469	118	INV-0001	500	2015-01-10 00:00:00+00
470	118	INV-0002	500	2015-02-10 00:00:00+00
471	118	INV-0003	500	2015-03-10 00:00:00+00
472	118	INV-0004	500	2015-04-10 00:00:00+00
473	119	INV-0001	500	2015-01-10 00:00:00+00
474	119	INV-0002	500	2015-02-10 00:00:00+00
475	119	INV-0003	500	2015-03-10 00:00:00+00
476	119	INV-0004	500	2015-04-10 00:00:00+00
477	120	INV-0001	500	2015-01-10 00:00:00+00
478	120	INV-0002	500	2015-02-10 00:00:00+00
479	120	INV-0003	500	2015-03-10 00:00:00+00
480	120	INV-0004	500	2015-04-10 00:00:00+00
481	121	INV-0001	500	2015-01-10 00:00:00+00
482	121	INV-0002	500	2015-02-10 00:00:00+00
483	121	INV-0003	500	2015-03-10 00:00:00+00
484	121	INV-0004	500	2015-04-10 00:00:00+00
485	122	INV-0001	500	2015-01-10 00:00:00+00
486	122	INV-0002	500	2015-02-10 00:00:00+00
487	122	INV-0003	500	2015-03-10 00:00:00+00
488	122	INV-0004	500	2015-04-10 00:00:00+00
489	123	INV-0001	500	2015-01-10 00:00:00+00
490	123	INV-0002	500	2015-02-10 00:00:00+00
491	123	INV-0003	500	2015-03-10 00:00:00+00
492	123	INV-0004	500	2015-04-10 00:00:00+00
493	124	INV-0001	500	2015-01-10 00:00:00+00
494	124	INV-0002	500	2015-02-10 00:00:00+00
495	124	INV-0003	500	2015-03-10 00:00:00+00
496	124	INV-0004	500	2015-04-10 00:00:00+00
497	125	INV-0001	500	2015-01-10 00:00:00+00
498	125	INV-0002	500	2015-02-10 00:00:00+00
499	125	INV-0003	500	2015-03-10 00:00:00+00
500	125	INV-0004	500	2015-04-10 00:00:00+00
501	126	INV-0001	500	2015-01-10 00:00:00+00
502	126	INV-0002	500	2015-02-10 00:00:00+00
503	126	INV-0003	500	2015-03-10 00:00:00+00
504	126	INV-0004	500	2015-04-10 00:00:00+00
505	127	INV-0001	500	2015-01-10 00:00:00+00
506	127	INV-0002	500	2015-02-10 00:00:00+00
507	127	INV-0003	500	2015-03-10 00:00:00+00
508	127	INV-0004	500	2015-04-10 00:00:00+00
509	128	INV-0001	500	2015-01-10 00:00:00+00
510	128	INV-0002	500	2015-02-10 00:00:00+00
511	128	INV-0003	500	2015-03-10 00:00:00+00
512	128	INV-0004	500	2015-04-10 00:00:00+00
513	129	INV-0001	500	2015-01-10 00:00:00+00
514	129	INV-0002	500	2015-02-10 00:00:00+00
515	129	INV-0003	500	2015-03-10 00:00:00+00
516	129	INV-0004	500	2015-04-10 00:00:00+00
517	130	INV-0001	500	2015-01-10 00:00:00+00
518	130	INV-0002	500	2015-02-10 00:00:00+00
519	130	INV-0003	500	2015-03-10 00:00:00+00
520	130	INV-0004	500	2015-04-10 00:00:00+00
521	131	INV-0001	500	2015-01-10 00:00:00+00
522	131	INV-0002	500	2015-02-10 00:00:00+00
523	131	INV-0003	500	2015-03-10 00:00:00+00
524	131	INV-0004	500	2015-04-10 00:00:00+00
525	132	INV-0001	500	2015-01-10 00:00:00+00
526	132	INV-0002	500	2015-02-10 00:00:00+00
527	132	INV-0003	500	2015-03-10 00:00:00+00
528	132	INV-0004	500	2015-04-10 00:00:00+00
529	133	INV-0001	500	2015-01-10 00:00:00+00
530	133	INV-0002	500	2015-02-10 00:00:00+00
531	133	INV-0003	500	2015-03-10 00:00:00+00
532	133	INV-0004	500	2015-04-10 00:00:00+00
533	134	INV-0001	500	2015-01-10 00:00:00+00
534	134	INV-0002	500	2015-02-10 00:00:00+00
535	134	INV-0003	500	2015-03-10 00:00:00+00
536	134	INV-0004	500	2015-04-10 00:00:00+00
537	135	INV-0001	500	2015-01-10 00:00:00+00
538	135	INV-0002	500	2015-02-10 00:00:00+00
539	135	INV-0003	500	2015-03-10 00:00:00+00
540	135	INV-0004	500	2015-04-10 00:00:00+00
541	136	INV-0001	500	2015-01-10 00:00:00+00
542	136	INV-0002	500	2015-02-10 00:00:00+00
543	136	INV-0003	500	2015-03-10 00:00:00+00
544	136	INV-0004	500	2015-04-10 00:00:00+00
545	137	INV-0001	500	2015-01-10 00:00:00+00
546	137	INV-0002	500	2015-02-10 00:00:00+00
547	137	INV-0003	500	2015-03-10 00:00:00+00
548	137	INV-0004	500	2015-04-10 00:00:00+00
549	138	INV-0001	500	2015-01-10 00:00:00+00
550	138	INV-0002	500	2015-02-10 00:00:00+00
551	138	INV-0003	500	2015-03-10 00:00:00+00
552	138	INV-0004	500	2015-04-10 00:00:00+00
553	139	INV-0001	500	2015-01-10 00:00:00+00
554	139	INV-0002	500	2015-02-10 00:00:00+00
555	139	INV-0003	500	2015-03-10 00:00:00+00
556	139	INV-0004	500	2015-04-10 00:00:00+00
557	140	INV-0001	500	2015-01-10 00:00:00+00
558	140	INV-0002	500	2015-02-10 00:00:00+00
559	140	INV-0003	500	2015-03-10 00:00:00+00
560	140	INV-0004	500	2015-04-10 00:00:00+00
561	141	INV-0001	500	2015-01-10 00:00:00+00
562	141	INV-0002	500	2015-02-10 00:00:00+00
563	141	INV-0003	500	2015-03-10 00:00:00+00
564	141	INV-0004	500	2015-04-10 00:00:00+00
565	142	INV-0001	500	2015-01-10 00:00:00+00
566	142	INV-0002	500	2015-02-10 00:00:00+00
567	142	INV-0003	500	2015-03-10 00:00:00+00
568	142	INV-0004	500	2015-04-10 00:00:00+00
569	143	INV-0001	500	2015-01-10 00:00:00+00
570	143	INV-0002	500	2015-02-10 00:00:00+00
571	143	INV-0003	500	2015-03-10 00:00:00+00
572	143	INV-0004	500	2015-04-10 00:00:00+00
573	144	INV-0001	500	2015-01-10 00:00:00+00
574	144	INV-0002	500	2015-02-10 00:00:00+00
575	144	INV-0003	500	2015-03-10 00:00:00+00
576	144	INV-0004	500	2015-04-10 00:00:00+00
577	145	INV-0001	500	2015-01-10 00:00:00+00
578	145	INV-0002	500	2015-02-10 00:00:00+00
579	145	INV-0003	500	2015-03-10 00:00:00+00
580	145	INV-0004	500	2015-04-10 00:00:00+00
581	146	INV-0001	500	2015-01-10 00:00:00+00
582	146	INV-0002	500	2015-02-10 00:00:00+00
583	146	INV-0003	500	2015-03-10 00:00:00+00
584	146	INV-0004	500	2015-04-10 00:00:00+00
585	147	INV-0001	500	2015-01-10 00:00:00+00
586	147	INV-0002	500	2015-02-10 00:00:00+00
587	147	INV-0003	500	2015-03-10 00:00:00+00
588	147	INV-0004	500	2015-04-10 00:00:00+00
589	148	INV-0001	500	2015-01-10 00:00:00+00
590	148	INV-0002	500	2015-02-10 00:00:00+00
591	148	INV-0003	500	2015-03-10 00:00:00+00
592	148	INV-0004	500	2015-04-10 00:00:00+00
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.posts (id, title, text, published) FROM stdin;
\.


--
-- Data for Name: security_feedback; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.security_feedback (id, email, link, info, created) FROM stdin;
\.


--
-- Data for Name: sent_messages; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.sent_messages (id, message_id, from_user, to_user, read) FROM stdin;
1	1	1	3	\N
2	1	1	4	\N
3	2	1	5	\N
4	2	1	3	\N
5	3	1	4	\N
6	3	1	5	\N
7	4	1	3	\N
8	4	1	4	\N
9	5	3	1	\N
10	5	4	1	\N
11	5	5	1	\N
12	6	3	1	\N
13	6	4	1	\N
14	6	5	1	\N
15	7	3	1	\N
16	7	4	1	\N
17	7	5	1	\N
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.testimonials (id, name, profession, image, description) FROM stdin;
1	Jessica Lovebird	Private trainer and life coach	img/testimonial-1.jpg	Absolutely love the them!<br>Wonderful, attentive and friendly smiles all around.<br>The staff treated me and my family so special
2	Walter White	Chemist, Berylia Chemist Laboratories	img/testimonial-2.jpg	We moved our entire energy consumptions over to BEG, which has proven to be the best solution for us.<br>Partnerships are the foundation of our success and we're grateful to be working with a community energy provider that treats us like a partner.
3	Robert Banks	Professional possession relocator	img/testimonial-3.jpg	Best company ever! I was providing services to my client and the energy group<br>employees were helpful and welcoming throughout the whole time!<br>They bought a smile on my face!
\.


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.user_settings (id, user_id, daily_market_overview, products_services_info, order_submitted, executed_trade, transfer_failed, currency_excange_transaction, login_from_unknown_location, change_password) FROM stdin;
1	1	f	f	f	f	f	f	f	f
2	2	f	f	f	f	f	f	f	f
3	3	f	f	f	f	f	f	f	f
4	4	t	t	t	t	t	t	t	t
5	5	t	t	t	t	t	t	t	t
6	6	t	t	t	t	t	t	t	t
7	7	t	t	t	t	t	t	t	t
8	8	t	t	t	t	t	t	t	t
9	9	t	t	t	t	t	t	t	t
10	10	t	t	t	t	t	t	t	t
11	11	t	t	t	t	t	t	t	t
12	12	t	t	t	t	t	t	t	t
13	13	t	t	t	t	t	t	t	t
14	14	t	t	t	t	t	t	t	t
15	15	t	t	t	t	t	t	t	t
16	16	t	t	t	t	t	t	t	t
17	17	t	t	t	t	t	t	t	t
18	18	t	t	t	t	t	t	t	t
19	19	t	t	t	t	t	t	t	t
20	20	t	t	t	t	t	t	t	t
21	21	t	t	t	t	t	t	t	t
22	22	t	t	t	t	t	t	t	t
23	23	t	t	t	t	t	t	t	t
24	24	t	t	t	t	t	t	t	t
25	25	t	t	t	t	t	t	t	t
26	26	t	t	t	t	t	t	t	t
27	27	t	t	t	t	t	t	t	t
28	28	t	t	t	t	t	t	t	t
29	29	t	t	t	t	t	t	t	t
30	30	t	t	t	t	t	t	t	t
31	31	t	t	t	t	t	t	t	t
32	32	t	t	t	t	t	t	t	t
33	33	t	t	t	t	t	t	t	t
34	34	t	t	t	t	t	t	t	t
35	35	t	t	t	t	t	t	t	t
36	36	t	t	t	t	t	t	t	t
37	37	t	t	t	t	t	t	t	t
38	38	t	t	t	t	t	t	t	t
39	39	t	t	t	t	t	t	t	t
40	40	t	t	t	t	t	t	t	t
41	41	t	t	t	t	t	t	t	t
42	42	t	t	t	t	t	t	t	t
43	43	t	t	t	t	t	t	t	t
44	44	t	t	t	t	t	t	t	t
45	45	t	t	t	t	t	t	t	t
46	46	t	t	t	t	t	t	t	t
47	47	t	t	t	t	t	t	t	t
48	48	t	t	t	t	t	t	t	t
49	49	t	t	t	t	t	t	t	t
50	50	t	t	t	t	t	t	t	t
51	51	t	t	t	t	t	t	t	t
52	52	t	t	t	t	t	t	t	t
53	53	t	t	t	t	t	t	t	t
54	54	t	t	t	t	t	t	t	t
55	55	t	t	t	t	t	t	t	t
56	56	t	t	t	t	t	t	t	t
57	57	t	t	t	t	t	t	t	t
58	58	t	t	t	t	t	t	t	t
59	59	t	t	t	t	t	t	t	t
60	60	t	t	t	t	t	t	t	t
61	61	t	t	t	t	t	t	t	t
62	62	t	t	t	t	t	t	t	t
63	63	t	t	t	t	t	t	t	t
64	64	t	t	t	t	t	t	t	t
65	65	t	t	t	t	t	t	t	t
66	66	t	t	t	t	t	t	t	t
67	67	t	t	t	t	t	t	t	t
68	68	t	t	t	t	t	t	t	t
69	69	t	t	t	t	t	t	t	t
70	70	t	t	t	t	t	t	t	t
71	71	t	t	t	t	t	t	t	t
72	72	t	t	t	t	t	t	t	t
73	73	t	t	t	t	t	t	t	t
74	74	t	t	t	t	t	t	t	t
75	75	t	t	t	t	t	t	t	t
76	76	t	t	t	t	t	t	t	t
77	77	t	t	t	t	t	t	t	t
78	78	t	t	t	t	t	t	t	t
79	79	t	t	t	t	t	t	t	t
80	80	t	t	t	t	t	t	t	t
81	81	t	t	t	t	t	t	t	t
82	82	t	t	t	t	t	t	t	t
83	83	t	t	t	t	t	t	t	t
84	84	t	t	t	t	t	t	t	t
85	85	t	t	t	t	t	t	t	t
86	86	t	t	t	t	t	t	t	t
87	87	t	t	t	t	t	t	t	t
88	88	t	t	t	t	t	t	t	t
89	89	t	t	t	t	t	t	t	t
90	90	t	t	t	t	t	t	t	t
91	91	t	t	t	t	t	t	t	t
92	92	t	t	t	t	t	t	t	t
93	93	t	t	t	t	t	t	t	t
94	94	t	t	t	t	t	t	t	t
95	95	t	t	t	t	t	t	t	t
96	96	t	t	t	t	t	t	t	t
97	97	t	t	t	t	t	t	t	t
98	98	t	t	t	t	t	t	t	t
99	99	t	t	t	t	t	t	t	t
100	100	t	t	t	t	t	t	t	t
101	101	t	t	t	t	t	t	t	t
102	102	t	t	t	t	t	t	t	t
103	103	t	t	t	t	t	t	t	t
104	104	t	t	t	t	t	t	t	t
105	105	t	t	t	t	t	t	t	t
106	106	t	t	t	t	t	t	t	t
107	107	t	t	t	t	t	t	t	t
108	108	t	t	t	t	t	t	t	t
109	109	t	t	t	t	t	t	t	t
110	110	t	t	t	t	t	t	t	t
111	111	t	t	t	t	t	t	t	t
112	112	t	t	t	t	t	t	t	t
113	113	t	t	t	t	t	t	t	t
114	114	t	t	t	t	t	t	t	t
115	115	t	t	t	t	t	t	t	t
116	116	t	t	t	t	t	t	t	t
117	117	t	t	t	t	t	t	t	t
118	118	t	t	t	t	t	t	t	t
119	119	t	t	t	t	t	t	t	t
120	120	t	t	t	t	t	t	t	t
121	121	t	t	t	t	t	t	t	t
122	122	t	t	t	t	t	t	t	t
123	123	t	t	t	t	t	t	t	t
124	124	t	t	t	t	t	t	t	t
125	125	t	t	t	t	t	t	t	t
126	126	t	t	t	t	t	t	t	t
127	127	t	t	t	t	t	t	t	t
128	128	t	t	t	t	t	t	t	t
129	129	t	t	t	t	t	t	t	t
130	130	t	t	t	t	t	t	t	t
131	131	t	t	t	t	t	t	t	t
132	132	t	t	t	t	t	t	t	t
133	133	t	t	t	t	t	t	t	t
134	134	t	t	t	t	t	t	t	t
135	135	t	t	t	t	t	t	t	t
136	136	t	t	t	t	t	t	t	t
137	137	t	t	t	t	t	t	t	t
138	138	t	t	t	t	t	t	t	t
139	139	t	t	t	t	t	t	t	t
140	140	t	t	t	t	t	t	t	t
141	141	t	t	t	t	t	t	t	t
142	142	t	t	t	t	t	t	t	t
143	143	t	t	t	t	t	t	t	t
144	144	t	t	t	t	t	t	t	t
145	145	t	t	t	t	t	t	t	t
146	146	t	t	t	t	t	t	t	t
147	147	t	t	t	t	t	t	t	t
148	148	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: self_service
--

COPY public.users (id, username, password, email, profile_picture, admin) FROM stdin;
1	admin	$argon2i$v=19$m=65536,t=3,p=1$ICAgIEFkbWluMUFkbWluMQ$pbq5ARoF6BhnxHyXAFqrBcULi0iS5PX/UKqiOhxUK/c	admin@self-service.beg.05.berylia.org	img/user0.jpg	t
2	gt	$argon2i$v=19$m=65536,t=3,p=1$VGFibGUuU3ByZWFkLjk1NjAh$YMu8YRk0moOmTTDuG7KlxwBu+CtHkAGvdEF1nHWWK9E	gt@self-service.beg.05.berylia.org	img/user1.jpg	t
3	Rolf.Long	$argon2i$v=19$m=65536,t=3,p=1$Q2hpbGUuQ29uc2lkZXIuMTA4OCE$UvA+nOpLinED6a7G4LrDrTBldDJJl47DpQt6YqTIcG0	rolf.long@self-service.beg.05.berylia.org	img/default.jpg	f
4	Scottie.Wood	$argon2i$v=19$m=65536,t=3,p=1$U2NvdGxhbmQuU2lsdmVyLjIwODQh$8E+k+wSlQWowqR+t5z4qj23ehFQKPUcu56e5wq+LOXw	scottie.wood@self-service.beg.05.berylia.org	img/default.jpg	f
5	Matilda.Goodman	$argon2i$v=19$m=65536,t=3,p=1$UHJpbnRlZC5SYWRpby4zNzIyIQ$d+hzG213caZEU+4s8D6ILJggnTtapniNCAWdd1o0weY	matilda.goodman@self-service.beg.05.berylia.org	img/default.jpg	f
6	Ezekiel.Glenn	$argon2i$v=19$m=65536,t=3,p=1$U3RyZWFtLk9mZmljZS40MTcxIQ$sEJevDJdtlLUu/AhKtIl15G16F2oYoPONNRs5XW3FyY	ezekiel.glenn@self-service.beg.05.berylia.org	img/default.jpg	f
7	Alyssa.Hensley	$argon2i$v=19$m=65536,t=3,p=1$TWFya2V0LkJhc2tldC4xNzgyIQ$QV0D3+tOAecNDDzzgjo+LtYVmwIVwIUVDIvzWtWGrhY	alyssa.hensley@self-service.beg.05.berylia.org	img/default.jpg	f
8	Elsie.Mercado	$argon2i$v=19$m=65536,t=3,p=1$QnJpbmcuSW1wb3J0YW50LjQwOTch$+jxBsKdZ5Ghx3T3hHtzYTekY3xBTUb+AnZlXYFQwTj8	elsie.mercado@self-service.beg.05.berylia.org	img/default.jpg	f
9	Jayne.Galloway	$argon2i$v=19$m=65536,t=3,p=1$Q3Jvd2QuQWZyaWNhLjk2MDMh$SmF3uSMGejHEtuz98qKjA3Dgye0w3kTL4jk49rEqGrU	jayne.galloway@self-service.beg.05.berylia.org	img/default.jpg	f
10	Maryellen.Mays	$argon2i$v=19$m=65536,t=3,p=1$RGl2aWRlLlRydXN0LjM4MjIh$d6gNBIB7OgJ7Yv/HKrvrCqrPUGXqMkvR+JFyyH+R2Yg	maryellen.mays@self-service.beg.05.berylia.org	img/default.jpg	f
11	Serena.Logan	$argon2i$v=19$m=65536,t=3,p=1$QXBwbGUuRGlzdGFudC4zODI5IQ$gezO7Yx0sPnyDszPVBVT4vwMG7REkHnHhu0ot1sKhwM	serena.logan@self-service.beg.05.berylia.org	img/default.jpg	f
12	Mauro.Jacobs	$argon2i$v=19$m=65536,t=3,p=1$UGxlYXNlLlN0aWNrLjQxODQh$BZ0/k93Yj3ezIOjEjibYZcUrPVcKlNkSX23SUHyXe04	mauro.jacobs@self-service.beg.05.berylia.org	img/default.jpg	f
13	Jose.Lynn	$argon2i$v=19$m=65536,t=3,p=1$U29sZGllci5DYXR0bGUuODc1MyE$HzJPISlijYVUaXwutWc78AwzmuchRoxDBfzuHvxN1U8	jose.lynn@self-service.beg.05.berylia.org	img/default.jpg	f
14	John.Sherman	$argon2i$v=19$m=65536,t=3,p=1$QWdyZWVkLkFuZ2xlLjUzNzgh$D2N3nXlUiA6/rDYH+NLUfzTxIz+MGnQWVcghZ45i93c	john.sherman@self-service.beg.05.berylia.org	img/default.jpg	f
15	Genevieve.Thornton	$argon2i$v=19$m=65536,t=3,p=1$TmV2ZXIuUGxhaW4uODYxNSE$/j/P2OasmeBDfl27zWcXuSQFb6X2mNjRRiDeOA1uS9g	genevieve.thornton@self-service.beg.05.berylia.org	img/default.jpg	f
16	Jerrold.Burnett	$argon2i$v=19$m=65536,t=3,p=1$QXVzdHJhbGlhLlByaW50ZWQuNjQwMSE$T9eB7EnaMuaqDnblwyUCJ2QMkkgRVvBWdT2A0ZYp++Q	jerrold.burnett@self-service.beg.05.berylia.org	img/default.jpg	f
17	Catherine.Sloan	$argon2i$v=19$m=65536,t=3,p=1$U3BhaW4uV2F0Y2guMTYyNCE$/Opqnm59BL6BBZPRWQpACXx7AC5GGRTQ9eNHwBE+svM	catherine.sloan@self-service.beg.05.berylia.org	img/default.jpg	f
18	Amie.Gardner	$argon2i$v=19$m=65536,t=3,p=1$QnVpbHQuRXZlbmluZy4xOTU0IQ$uoJ35PxWO+KxvcEr8QQav6VsSRpgSR5S1mOQ6Pk2GZY	amie.gardner@self-service.beg.05.berylia.org	img/default.jpg	f
19	Roosevelt.Tanner	$argon2i$v=19$m=65536,t=3,p=1$R2FyZGVuLlJhZGlvLjM2ODAh$vcGNBikpR3A2+j84fLK0sZH619v0J++8TjcMBFgmP4w	roosevelt.tanner@self-service.beg.05.berylia.org	img/default.jpg	f
20	Fernando.Clay	$argon2i$v=19$m=65536,t=3,p=1$RGl2aXNpb24uQWlycGxhbmUuNTk0NyE$ELH7w172ZO5Skb0xwwKX8avl33ZMG2emDAh6Bj2SOpI	fernando.clay@self-service.beg.05.berylia.org	img/default.jpg	f
21	Geoffrey.Williamson	$argon2i$v=19$m=65536,t=3,p=1$QWxhc2thLkxlbmd0aC44MTI2IQ$NIjPTdlk6ByQ0YivJkbudgcZe5QVce3SjG9MNlhcdYg	geoffrey.williamson@self-service.beg.05.berylia.org	img/default.jpg	f
22	Fran.Holland	$argon2i$v=19$m=65536,t=3,p=1$QWx0aG91Z2guQmFyYmFkb3MuNzQ1MyE$walwz4SjQD57qfbUdUvZKhMym5YusCZjEH8QqGpettI	fran.holland@self-service.beg.05.berylia.org	img/default.jpg	f
23	Trey.Mcbride	$argon2i$v=19$m=65536,t=3,p=1$T2ZmaWNlLkNvbHVtbi44Njk5IQ$VtpNs0tlQ2jjfG3ZqQOdCwDdX/6aly5REeRGOr0Eop8	trey.mcbride@self-service.beg.05.berylia.org	img/default.jpg	f
24	Lindsey.Mcgrath	$argon2i$v=19$m=65536,t=3,p=1$RmFtb3VzLkV4cGxhaW4uMjkxOSE$N4S/xVflF/W6jlDbPeryGk9qgiuBZkVLaJcmpL3ikVE	lindsey.mcgrath@self-service.beg.05.berylia.org	img/default.jpg	f
25	Kathie.Burgess	$argon2i$v=19$m=65536,t=3,p=1$V2hlYXQuTGFkZGVyLjg0MTAh$4DIeB7tImcD8vsCV/BaJjLrrFkRr2RR+SrtaAw9IeHQ	kathie.burgess@self-service.beg.05.berylia.org	img/default.jpg	f
26	Katherine.Hutchinson	$argon2i$v=19$m=65536,t=3,p=1$UHVzaGVkLlNlcHRlbWJlci4wNjU3IQ$SAtDOdfHZ87uCQakekN5yOvOHM3198q2gkF8kGVg9bc	katherine.hutchinson@self-service.beg.05.berylia.org	img/default.jpg	f
27	Haley.Adams	$argon2i$v=19$m=65536,t=3,p=1$Q2xhc3MuR2VudGxlbWFuLjYyNjgh$pSFzpDRABvcb1h842z5fCCge/pIQ7Esd/NmDVKUvKgI	haley.adams@self-service.beg.05.berylia.org	img/default.jpg	f
28	Jarrod.Banks	$argon2i$v=19$m=65536,t=3,p=1$Q2lnYXJldHRlLkJhc2tldC44MDM4IQ$DXIqjAFGhTkby1BjvtuoyqEMiJvzFRGi9nkWllQ58Xw	jarrod.banks@self-service.beg.05.berylia.org	img/default.jpg	f
29	Willa.Madden	$argon2i$v=19$m=65536,t=3,p=1$Q29udGludWUuU3RyZWV0Ljc1MTch$QIjad9wak3JbtjTKyJh/nmw+NaIvEkczg8B99Ew0mp4	willa.madden@self-service.beg.05.berylia.org	img/default.jpg	f
30	Leigh.Ballard	$argon2i$v=19$m=65536,t=3,p=1$QmF0dGxlLlNwZW50LjU1NjYh$j4/DmyQb90jXWxQyM8yJDgFvFyY3ujC/b5MQ43R6bQM	leigh.ballard@self-service.beg.05.berylia.org	img/default.jpg	f
31	Ignacio.Ryan	$argon2i$v=19$m=65536,t=3,p=1$U2Vjb25kLkluZGlhbi4yNzI3IQ$gJsLzo55vVTSR8gHUpB1+TUPWYeqlrw44xD/xeqogxc	ignacio.ryan@self-service.beg.05.berylia.org	img/default.jpg	f
32	Celina.Jordan	$argon2i$v=19$m=65536,t=3,p=1$TWFqb3IuQ29tcG91bmQuMjUzMCE$sCezZI/ARuWV+PPDH0xdxBSUNdUSCDQryFnSyb6cDgw	celina.jordan@self-service.beg.05.berylia.org	img/default.jpg	f
33	Rochelle.Novak	$argon2i$v=19$m=65536,t=3,p=1$UXVlc3Rpb25zLlNoYXBlLjc2MDIh$wNAlcirItbs6F1DIaD7stT052gK5iIP+yEtfaimMcEU	rochelle.novak@self-service.beg.05.berylia.org	img/default.jpg	f
34	Edmund.Ferguson	$argon2i$v=19$m=65536,t=3,p=1$VGhhbmsuQ3JlYXRlLjk2NDgh$QCqYkDuWVO/uz25scACJrc7vV9cu988OxXoCaUBJV8E	edmund.ferguson@self-service.beg.05.berylia.org	img/default.jpg	f
35	Kim.Fletcher	$argon2i$v=19$m=65536,t=3,p=1$TW9ybmluZy5BbmdyeS42MDgyIQ$2qmW0E5eQYPlqMS+8HpgEYx9kAZoKXvWOnsT/vXh0v0	kim.fletcher@self-service.beg.05.berylia.org	img/default.jpg	f
36	Demarcus.Bennett	$argon2i$v=19$m=65536,t=3,p=1$V29ydGguU2luY2UuODUwNSE$skTbak8kOYwPgp1IixlGQ4SlFGlOWBmdYTvI1e1o3h4	demarcus.bennett@self-service.beg.05.berylia.org	img/default.jpg	f
37	Sheila.Dunlap	$argon2i$v=19$m=65536,t=3,p=1$TGlrZWx5LkNvbG9tYmlhLjQyOTAh$KdHy8I2BLryNQRdypGMPblVAmzhHnp2F5IyzHzbQ0Mw	sheila.dunlap@self-service.beg.05.berylia.org	img/default.jpg	f
38	Nola.Gould	$argon2i$v=19$m=65536,t=3,p=1$SG93ZXZlci5Eb2xsYXIuMTUwNCE$nwV8NBVSntAlwnGwd4UZ/wD3WqNjlH6HIC5JbIZFTc0	nola.gould@self-service.beg.05.berylia.org	img/default.jpg	f
39	Derek.Yang	$argon2i$v=19$m=65536,t=3,p=1$UGFyaXMuUGxlYXN1cmUuNzQ0OSE$It2UOwMSipxnQnzutywyGvp6HSQTOii/3oYkUTpFuQ8	derek.yang@self-service.beg.05.berylia.org	img/default.jpg	f
40	Darren.West	$argon2i$v=19$m=65536,t=3,p=1$UHJvdWQuQ29tcGFyZS4xOTk3IQ$57bs/NaJgp4khgFZIwKFfEC7Epd6l2EPn6Rfr1m7ZJE	darren.west@self-service.beg.05.berylia.org	img/default.jpg	f
41	Hilton.Benton	$argon2i$v=19$m=65536,t=3,p=1$UmV0dXJuLkxldmVsLjk2NTQh$NSXORNG/oIzjlGvvGa7QbimWkteHkeY/doFIT2aToTU	hilton.benton@self-service.beg.05.berylia.org	img/default.jpg	f
42	Marietta.Kaiser	$argon2i$v=19$m=65536,t=3,p=1$RmFtaWx5LlByZXNlbnQuNTc4MSE$0kLuBOtJ7spXpvRzfOzgRf5MmuD1CKbT8AtdPegK+Uo	marietta.kaiser@self-service.beg.05.berylia.org	img/default.jpg	f
43	Carrol.Crosby	$argon2i$v=19$m=65536,t=3,p=1$U2Nob29sLkp1bXBlZC4zODMwIQ$nsMFUsL3qGq4RmPwl02J+0f2fpRHwbrGlK1E/I6wnzI	carrol.crosby@self-service.beg.05.berylia.org	img/default.jpg	f
44	Bridgett.Hardin	$argon2i$v=19$m=65536,t=3,p=1$U2V2ZW4uQ3Jvc3MuNjU1NCE$eBimrNlqhZcZM+QmL81hDwB86nRNs1wLczoN0SxdVm8	bridgett.hardin@self-service.beg.05.berylia.org	img/default.jpg	f
45	Kari.Knapp	$argon2i$v=19$m=65536,t=3,p=1$TmF0aW9uLlRocm91Z2guNTU4MSE$czAsqUPl3nRiDfH/vUmMwRplH0RDXNi3/KxnDBpD8co	kari.knapp@self-service.beg.05.berylia.org	img/default.jpg	f
46	Toni.Ashley	$argon2i$v=19$m=65536,t=3,p=1$SGVhbHRoLlR3ZW50eS44MTI4IQ$VNV0EJrAgchL/K4wVkD/zzeRY9nmOU9LF1+rozBI8tk	toni.ashley@self-service.beg.05.berylia.org	img/default.jpg	f
47	Katie.Robertson	$argon2i$v=19$m=65536,t=3,p=1$TmV2YWRhLkNoYW5nZS4yNzI3IQ$VPWaUBUDm8BOnW7w/8czzPzTEKTHqTpuXKbhYrRL2KM	katie.robertson@self-service.beg.05.berylia.org	img/default.jpg	f
48	Josiah.Huffman	$argon2i$v=19$m=65536,t=3,p=1$RHJpbmsuU3R1ZGVudHMuNjQ1NyE$4kF3gVSZXkSEfrSElv7LFp5MqYT2UU5e2hVmCoaXlvI	josiah.huffman@self-service.beg.05.berylia.org	img/default.jpg	f
49	Tim.Knight	$argon2i$v=19$m=65536,t=3,p=1$U2VwYXJhdGUuVGVhY2guNDMxMCE$WzwAaT4xpTEc7B5an5wAfa/02/gOgmXmjHsBRRhdcAg	tim.knight@self-service.beg.05.berylia.org	img/default.jpg	f
50	Tara.Schneider	$argon2i$v=19$m=65536,t=3,p=1$Q29uc29uYW50LlByb2Nlc3MuMTA3OSE$Mrf5xOvwRPw+eJif2D29kCPYS+5dWT8xTe8zrQfHRfc	tara.schneider@self-service.beg.05.berylia.org	img/default.jpg	f
51	Patty.Buckley	$argon2i$v=19$m=65536,t=3,p=1$Rm9ydHkuT2Z0ZW4uODI5MiE$cQk1L4eFlAq/iozZqQ1XgWjzdhA2DiFVexZhQU7xn3g	patty.buckley@self-service.beg.05.berylia.org	img/default.jpg	f
52	Joni.Chambers	$argon2i$v=19$m=65536,t=3,p=1$TWFjaGluZS5EZXRhaWxzLjY5MjUh$PfDas+7ea5TU5FNZ+ySWooJzGk+Fx1MEEOpEUjei8ZQ	joni.chambers@self-service.beg.05.berylia.org	img/default.jpg	f
53	Mary.Berger	$argon2i$v=19$m=65536,t=3,p=1$V2VhdGhlci5BcnJpdmUuNzQ4NCE$lQ+ypBDVhr/hMnyl20KMRnsCmZ63YulgySa7Itg55U0	mary.berger@self-service.beg.05.berylia.org	img/default.jpg	f
54	Elijah.Watson	$argon2i$v=19$m=65536,t=3,p=1$SW50ZXJlc3QuV2hlZWwuODgwMyE$urp8hkoQkmwxMERP4IBTuy9rCnsda7Fu5y75q2wAfNM	elijah.watson@self-service.beg.05.berylia.org	img/default.jpg	f
55	Kerttu.Heikkila	$argon2i$v=19$m=65536,t=3,p=1$QmVhdXRpZnVsLlRleGFzLjgwMDIh$daPflA1e5pKEzT4l2aTqg2yPUmDaetC3gnCGUuovWyM	kerttu.heikkila@self-service.beg.05.berylia.org	img/default.jpg	f
56	Ernesto.Romero	$argon2i$v=19$m=65536,t=3,p=1$Q2hpZWYuRGVjaW1hbC4xMjY1IQ$duS51ZqN2xotrMb2p6MO0EZ6ziYLx+sm1VQoLf5/ukY	ernesto.romero@self-service.beg.05.berylia.org	img/default.jpg	f
57	Jesse.Takala	$argon2i$v=19$m=65536,t=3,p=1$UmVzdWx0LlF1aWV0LjczMjUh$oRaQ060KOwR3sgtuSGjY55kdNvhIn1HuNQbXrCNVAEI	jesse.takala@self-service.beg.05.berylia.org	img/default.jpg	f
58	Theodore.Reynolds	$argon2i$v=19$m=65536,t=3,p=1$U29ycnkuQXR0ZW1wdC4zNzM4IQ$AMNee4lC63CQb5RlA/OjcmUr51A4kjqraSK1Uw3XVw8	theodore.reynolds@self-service.beg.05.berylia.org	img/default.jpg	f
59	Shane.Turner	$argon2i$v=19$m=65536,t=3,p=1$Q2hhbmdlLkRlbWFuZC45NDc1IQ$mPna3smoogGXq9wW1R0Kg7X1/K++uxrfM4YrumQzF3w	shane.turner@self-service.beg.05.berylia.org	img/default.jpg	f
60	Olivia.Laine	$argon2i$v=19$m=65536,t=3,p=1$U2xlZXAuVHJhaW5pbmcuOTMzNSE$DjSCBcp6EGQ2GK1YIn4F6Qbhk1ylojhujBJoZFZ2ltE	olivia.laine@self-service.beg.05.berylia.org	img/default.jpg	f
61	Laura.Hidalgo	$argon2i$v=19$m=65536,t=3,p=1$SmFwYW4uVG9vbHMuNjkzMCE$RaAc+eYecKuX1A0bPtkr01QmK4IDvUG9uUZpLuATqx4	laura.hidalgo@self-service.beg.05.berylia.org	img/default.jpg	f
62	Lucienne.Clement	$argon2i$v=19$m=65536,t=3,p=1$Rm9sbG93LlN0YXRlLjgwOTEh$Fi9pAsOQJNjPRpn/aqoyPPhxfvhGlmpmv4D6H7qV2s0	lucienne.clement@self-service.beg.05.berylia.org	img/default.jpg	f
63	Edwin.Washington	$argon2i$v=19$m=65536,t=3,p=1$VXN1YWwuRmFtaWx5LjYyMDMh$EUHg59W+YDSRow8c7Ue5EiHc5gOV/pLGPv+j92mE1f0	edwin.washington@self-service.beg.05.berylia.org	img/default.jpg	f
64	Ana.Martinez	$argon2i$v=19$m=65536,t=3,p=1$U3lsbGFibGVzLkJyaW5nLjE5OTYh$szBRdsAw4GeznO09lpsJczIfkTDvnU/bF5t3b1QrbVA	ana.martinez@self-service.beg.05.berylia.org	img/default.jpg	f
65	Begona.Santiago	$argon2i$v=19$m=65536,t=3,p=1$U2V2ZW4uUGVyaW9kLjQxMzUh$cat7QNEzmpZzp/pVJhIAfUC81AFEtz4OBJiloByqwFk	begona.santiago@self-service.beg.05.berylia.org	img/default.jpg	f
66	Robin.Marshall	$argon2i$v=19$m=65536,t=3,p=1$R3Jvd24uUHJvYmFibGUuNzA2NiE$xgpdX3qUh0DL/fnoTa1krv6uGM8vMrwbgzdxWPcSr0U	robin.marshall@self-service.beg.05.berylia.org	img/default.jpg	f
67	Peppi.Nevala	$argon2i$v=19$m=65536,t=3,p=1$U2VudGVuY2UuVGhlcmVmb3JlLjE4MjAh$QuZ7oUz205goXtNaxYmVBxXFhuWWOIGEU5Y2PPf6D+8	peppi.nevala@self-service.beg.05.berylia.org	img/default.jpg	f
68	Nenad.Nicolas	$argon2i$v=19$m=65536,t=3,p=1$V29tYW4uSHVuZHJlZC45MDY1IQ$AYBZBiRcbOyavTpnwYZwB+DqV/sBCDzFpQ2SXKOJM5I	nenad.nicolas@self-service.beg.05.berylia.org	img/default.jpg	f
69	Todd.Vasquez	$argon2i$v=19$m=65536,t=3,p=1$TWV0aG9kLkpvaW5lZC4yMjA1IQ$S8N2OSOLNxStfpijIggBXHkpMPf9O9VJZLHy3o0ugB0	todd.vasquez@self-service.beg.05.berylia.org	img/default.jpg	f
70	Rosario.Gauthier	$argon2i$v=19$m=65536,t=3,p=1$U3RyYW5nZXIuVGhyb3VnaC44Nzc4IQ$zDeOBTjO/tDopzOhQkvJ4uF4T776lOCzsXt6UNE65Y8	rosario.gauthier@self-service.beg.05.berylia.org	img/default.jpg	f
71	Selim.Hubert	$argon2i$v=19$m=65536,t=3,p=1$V2Fyc2F3Lkhpc3RvcnkuMDQ0NiE$m23u27Lux89Dms5KaEPDMaXMakEWoWNuaN73ayj6/tU	selim.hubert@self-service.beg.05.berylia.org	img/default.jpg	f
72	Dale.Steward	$argon2i$v=19$m=65536,t=3,p=1$Q2lyY2xlLlF1ZXN0aW9ucy43MDQ4IQ$PCqqIlAKFwfcJ8Z6NhgHWyrkD331SHyxZweqblTBp5g	dale.steward@self-service.beg.05.berylia.org	img/default.jpg	f
73	Amanda.Aro	$argon2i$v=19$m=65536,t=3,p=1$UGFpbnQuT3h5Z2VuLjE5MDAh$I6sSuO2RZ1b4mN5UHApcX1lBS5W/3/D+VGxlKfQA1tA	amanda.aro@self-service.beg.05.berylia.org	img/default.jpg	f
74	Perry.Webb	$argon2i$v=19$m=65536,t=3,p=1$QmVmb3JlLlBsdXJhbC4wNDY1IQ$LbMfZBSzqewDdwbirl6FLY33xhhFUwWAqx0XZz+NZBE	perry.webb@self-service.beg.05.berylia.org	img/default.jpg	f
75	Iker.Vargas	$argon2i$v=19$m=65536,t=3,p=1$Qm9ycm93LlNldmVyYWwuMDQ4OCE$iXCLPEcCCDU09ZWDcvQd4VmUAtaUw66zsuQqxWbN8p0	iker.vargas@self-service.beg.05.berylia.org	img/default.jpg	f
76	Gregorio.Castro	$argon2i$v=19$m=65536,t=3,p=1$U3RyZW5ndGguV3JvdGUuMzM0MCE$o8frclsGigHHCb0FFA4CirGUVrZVYiPo3eb610cX0sQ	gregorio.castro@self-service.beg.05.berylia.org	img/default.jpg	f
77	Anton.Sakala	$argon2i$v=19$m=65536,t=3,p=1$R3Jvd24uQWNyb3NzLjk2OTQh$LNyOgbhWbkLzZhDfg+kMt7nySgAuQJF4hZVzdup9/1s	anton.sakala@self-service.beg.05.berylia.org	img/default.jpg	f
78	Minea.Leppo	$argon2i$v=19$m=65536,t=3,p=1$SW5zZWN0cy5Bcml6b25hLjYxMzch$kGe0mR5kUNfRBdayky8pZlpCEAGgdMGpJhvRskLn9+4	minea.leppo@self-service.beg.05.berylia.org	img/default.jpg	f
79	Jesus.Benitez	$argon2i$v=19$m=65536,t=3,p=1$RmVicnVhcnkuU21hbGwuMTIwMCE$sTc8QOSw8i7visfDr0+62RLOw52q918s3jXVq82gnXE	jesus.benitez@self-service.beg.05.berylia.org	img/default.jpg	f
80	Helmi.Korpi	$argon2i$v=19$m=65536,t=3,p=1$U3RyaW5nLkJyYW5jaC42OTA4IQ$8d0lNj3CZQDWPH1b29dJfyx7QmLt/FnmoMT1QOJKN/M	helmi.korpi@self-service.beg.05.berylia.org	img/default.jpg	f
81	Joachim.Schmitt	$argon2i$v=19$m=65536,t=3,p=1$Q2xvc2UuQmVsZ2l1bS40NjkwIQ$h5hiwZyUneWE+csV0VZ6Lny8O+RdJy7GHwLfSl8k1uA	joachim.schmitt@self-service.beg.05.berylia.org	img/default.jpg	f
82	Andre.Roux	$argon2i$v=19$m=65536,t=3,p=1$VGFibGUuTWVldGluZy4xMDQ4IQ$UifDK4AKTWOajToiaJsbTZjWo3JOit0jE6w15J9nz1c	andre.roux@self-service.beg.05.berylia.org	img/default.jpg	f
83	Corey.Miller	$argon2i$v=19$m=65536,t=3,p=1$Q29uZ28uUGVhY2UuNDY3NyE$BRmdCnFsUYJX8gF3rh8SYfH85HV61zCXB+cTSygqEUM	corey.miller@self-service.beg.05.berylia.org	img/default.jpg	f
84	Nevaeh.Reid	$argon2i$v=19$m=65536,t=3,p=1$QXJyaXZlZC5Nb250aHMuNjI2NCE$NXT+z4IsGXEMtm23NX0du+qQK9klkbLDS8+qBNQ6gqc	nevaeh.reid@self-service.beg.05.berylia.org	img/default.jpg	f
85	Alisa.Polon	$argon2i$v=19$m=65536,t=3,p=1$R2VudGxlLktpbGxlZC42MDQzIQ$fuxPFaXNmNiPBGRqRMxroGXUGaPz5Qbjwhx3Uzt63HI	alisa.polon@self-service.beg.05.berylia.org	img/default.jpg	f
86	Pat.Fleming	$argon2i$v=19$m=65536,t=3,p=1$VGhlcmVmb3JlLlByaWNlLjQyMTUh$/esT9P9NhZS/3zb+u8qhkmrjjy9vCbOnnp3o/ZnUMYU	pat.fleming@self-service.beg.05.berylia.org	img/default.jpg	f
87	Johnni.Caldwell	$argon2i$v=19$m=65536,t=3,p=1$V29uZGVyLlNldmVuLjk5OTQh$PY4rK+IJMYwdT4IYgsGFZxS4Rt0eGu8iiiJhAD/o7cw	johnni.caldwell@self-service.beg.05.berylia.org	img/default.jpg	f
88	Andrea.Dupuis	$argon2i$v=19$m=65536,t=3,p=1$UGVhY2UuU2ltaWxhci4xMzU1IQ$3LLWzJkpfGqZI039ZFLmqGJEJmmK/CnBaBySVDmCukg	andrea.dupuis@self-service.beg.05.berylia.org	img/default.jpg	f
89	Cristina.Mora	$argon2i$v=19$m=65536,t=3,p=1$RmlnaHQuTWVsb2R5Ljc5MzMh$8UDdVR1zOASfdI6sNymkKUv7mRgdCp2zyRlZfGuc9Vg	cristina.mora@self-service.beg.05.berylia.org	img/default.jpg	f
90	Dijana.Roy	$argon2i$v=19$m=65536,t=3,p=1$UXVlc3Rpb24uQWdyZWUuMTAwMSE$+97GvgEy5jDBRzYZvPGBitgfGR/klyUPG71MI+cxGI8	dijana.roy@self-service.beg.05.berylia.org	img/default.jpg	f
91	Carolina.Schmitt	$argon2i$v=19$m=65536,t=3,p=1$U2VlZHMuV2l0aGluLjU4Mjch$0Hq1nWrkkJAJudG+ufR/+udxD4rXR9PoUjBN1wk9JoQ	carolina.schmitt@self-service.beg.05.berylia.org	img/default.jpg	f
92	Felix.Elliott	$argon2i$v=19$m=65536,t=3,p=1$QnJhbmNoLlRvbW9ycm93LjQwNjch$vFo8rItT02jyIbaXKmRqJst6un7xqSrj9nXRPkwvqcg	felix.elliott@self-service.beg.05.berylia.org	img/default.jpg	f
93	Trifon.Zarezan	$argon2i$v=19$m=65536,t=3,p=1$QXJpem9uYS5TaW1wbGUuNTA1MSE$gtTaKPFCaG4PH/IjS2lV1Dm09Vr8A0C5rrIrlXK9/m0	trifon.zarezan@self-service.beg.05.berylia.org	img/default.jpg	f
94	Cosimo.Moreau	$argon2i$v=19$m=65536,t=3,p=1$V3JpdGUuTW9udGguOTY1OCE$9RbyJY8tpI1K11/d2F8rr+cZsdOfqOrckSkvDxs0oFo	cosimo.moreau@self-service.beg.05.berylia.org	img/default.jpg	f
95	Elisa.Esteban	$argon2i$v=19$m=65536,t=3,p=1$VHdlbHZlLkJpY3ljbGUuNjcyOCE$+GlClyMhs5/FAAH67n6VxQs5rKE+JGxB9CQX1zN3Dzg	elisa.esteban@self-service.beg.05.berylia.org	img/default.jpg	f
96	Jerry.Reynolds	$argon2i$v=19$m=65536,t=3,p=1$TWV4aWNvLkRlc2lyZS41NzYxIQ$Lrj1Zk1BJQkRFMfkbMfKslpKpZFiZTItY0GnsLn+GeM	jerry.reynolds@self-service.beg.05.berylia.org	img/default.jpg	f
97	Anne.Guillaume	$argon2i$v=19$m=65536,t=3,p=1$WW91cnNlbGYuQm9uZXMuNzY0MSE$Tlmw9e1Fl0bm6TApPXQWCveeo7XTsf9c/zu88XK6tRk	anne.guillaume@self-service.beg.05.berylia.org	img/default.jpg	f
98	Cristian.Rodriguez	$argon2i$v=19$m=65536,t=3,p=1$VW5kZXIuVmlyZ2luaWEuNDYzOSE$AFTWark1zX3w0rDRv4dHNk8GLzrsaK4rdLAlXBaZnJ4	cristian.rodriguez@self-service.beg.05.berylia.org	img/default.jpg	f
99	Gilbert.Weaver	$argon2i$v=19$m=65536,t=3,p=1$V2l0aGluLkhvdXNlLjMyNzgh$iSAgpaZ7pVKSiwAgKSMzPitZbzAvyzaDjYqfsX+3LXU	gilbert.weaver@self-service.beg.05.berylia.org	img/default.jpg	f
100	Vilma.Tervo	$argon2i$v=19$m=65536,t=3,p=1$UHJlc3MuU2F0dXJuLjc4MDIh$UmWSfWOpOa/BfwxsBp3lXyW4cGzeNMTLE6/cE2fxWsA	vilma.tervo@self-service.beg.05.berylia.org	img/default.jpg	f
101	Monica.Gallardo	$argon2i$v=19$m=65536,t=3,p=1$SnVwaXRlci5Gb3JlaWduLjU4NzYh$y8RHLrurOWX0CzmWjmyOicY+YNMXZNTHBFvV8v3dM2Q	monica.gallardo@self-service.beg.05.berylia.org	img/default.jpg	f
102	Jaime.Santiago	$argon2i$v=19$m=65536,t=3,p=1$Q2xhc3MuQmljeWNsZS41NDk2IQ$2zefcnnDsvTOgWMU3hQUfR1CXsd9qIzzLgZw+zZ0a50	jaime.santiago@self-service.beg.05.berylia.org	img/default.jpg	f
103	keycloak_sso	$argon2i$v=19$m=65536,t=3,p=1$ICAgIGwuMTE4WkM0bkdTMg$tdOCgsSpt6TVsHrcdHYb0GBULl36Y4HS1ixAyUvySiw	keycloak_sso@self-service.beg.05.berylia.org	img/default.jpg	f
104	Samuel.Sanz	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBNYXJrLkluY2guMQ$lICmd2Nyx1Gp8TJ879FaBFA1v5Ge05yMlm48Bds1fIs	samuel.sanz@self-service.beg.05.berylia.org	img/default.jpg	f
105	Vaino.Aho	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBIYXZlLldlcmUuMg$9xj+cPM9InTxLIlRUPYDbRD2h9AVBwo8CCdtIJEQ+WY	vaino.aho@self-service.beg.05.berylia.org	img/default.jpg	f
106	Alex.Duran	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBTYWZlLldvcmUuOA$7+Pk5NsuLW+q/+MfAeYehXXQ8IMuIrl6YuIdrm8YqmI	alex.duran@self-service.beg.05.berylia.org	img/default.jpg	f
107	Dora.Dumas	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBNb29uLlJhaW4uOA$fc35FojjIu1EJa/VXxu22tQK9qr7YVK5L8gkGTjAAYg	dora.dumas@self-service.beg.05.berylia.org	img/default.jpg	f
108	Alba.Vicente	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBWZXJ5LkJlYW4uNA$TImPKqtJIbABlU9gYj4qbQLetEfS6UAA4HG3/UIgKC4	alba.vicente@self-service.beg.05.berylia.org	img/default.jpg	f
109	Celia.Santos	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBGcm9tLldoYXQuNw$WlKfH+hrTOHHDI55coAHhBcIMoEvEWnIPRSKOnKievQ	celia.santos@self-service.beg.05.berylia.org	img/default.jpg	f
110	Valtteri.Halonen	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBIb3BlLk1vb24uMg$KLZIMkWOGSRbDLhj8Od9oarHybBVly1XVTRXZYgsqPc	valtteri.halonen@self-service.beg.05.berylia.org	img/default.jpg	f
111	Bettina.Blanc	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBSb2xsLlNpbmcuOQ$Pncq0s0zIop+lM4DIHC8nS7qxNcv62ublTqdtWapE9A	bettina.blanc@self-service.beg.05.berylia.org	img/default.jpg	f
112	Samuel.Lammi	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBOZXh0LkZpcmUuMg$oOhVypa+KhmgiL9EyF7biYSqlwuICIS1Fb/KMwRF5kc	samuel.lammi@self-service.beg.05.berylia.org	img/default.jpg	f
113	Liselotte.Barbier	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBHYWluLkVhcnMuMA$NNVtDhZMeffuFYTtde2+mC+eebBOSs1VszvXfi5FBl0	liselotte.barbier@self-service.beg.05.berylia.org	img/default.jpg	f
114	Barbara.Petrovsky	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBQYXNzLkNhcmQuOA$KMhWstAtvLSmyM+p0lexRtj3Sse62WetYcidLGwyhTk	barbara.petrovsky@self-service.beg.05.berylia.org	img/default.jpg	f
115	Anna.Polansky	$argon2i$v=19$m=65536,t=3,p=1$ICAgIFRoaWVmLlNvaWwuNw$C4onwUoXTIpPpAmWBVYdLE+8+0QOa1V3gHU9+g7NfGM	anna.polansky@self-service.beg.05.berylia.org	img/default.jpg	f
116	Gerard.Maulin	$argon2i$v=19$m=65536,t=3,p=1$ICAgIENoaWxsaS5Eb2cuNQ$tA5jaNU3j0oMMVRVTTMhrvoVcWDaoiDVgUX12cFksus	gerard.maulin@self-service.beg.05.berylia.org	img/default.jpg	f
117	Samuel.Cole	$argon2i$v=19$m=65536,t=3,p=1$ICAgIENvb2wuRHJpbmsuNg$xsfAHpODKue1e+Kd819CZiGKUk5QGuXjjW8hORjquig	samuel.cole@self-service.beg.05.berylia.org	img/default.jpg	f
118	Orlando.Borland	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBDcHAuSXMuT2suNw$/0xBIod3+ZW1pQ7YtJAe2q8wDu6sPc1+AQ+nULyDCis	orlando.borland@self-service.beg.05.berylia.org	img/default.jpg	f
119	Agustin.Prieto	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBTaG9lLldlYWsuOA$3IDKfNNGFB6at9uVSKq7REkuIARg4RHNdvSju3KBrBc	agustin.prieto@self-service.beg.05.berylia.org	img/default.jpg	f
120	Lenni.Toivonen	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBOYWlsLkR1c2suOQ$tsf/pFnK7haOAk2d/MFzBVKMZ4WOhLgecRwdHwzl+kQ	lenni.toivonen@self-service.beg.05.berylia.org	img/default.jpg	f
121	Roland.Price	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBPdmVyLlRvb2suNQ$BoT2nMsO0fI9/3KPTrplMeGug/Bnn2Huk5gx+MeLtO4	roland.price@self-service.beg.05.berylia.org	img/default.jpg	f
122	Leta.Shelton	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBLbm93LkhvdXIuOQ$0q8pBqDifvNFneonw6tApNXC1e7681xovlHL8FBK7Gw	leta.shelton@self-service.beg.05.berylia.org	img/default.jpg	f
123	Purificacion.Sanz	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBNYWlsLlRlbGwuNA$iEza7jJsj3ndYzQdDpqDAFjAzJMo721r1TqhyaTisoI	purificacion.sanz@self-service.beg.05.berylia.org	img/default.jpg	f
124	Regula.Moulin	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBTdWNoLkNvYXQuMA$8dipnOCznXM2nz2gF5sWgAkcCl69nz4/EfGDU361Kqk	regula.moulin@self-service.beg.05.berylia.org	img/default.jpg	f
125	Theresia.Girard	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBXYXJtLk1lYW4uNg$KufWAkviOMQhzvpTCuWFfgJENAz0hv+kOftqsHrULnw	theresia.girard@self-service.beg.05.berylia.org	img/default.jpg	f
126	Elisabete.Moreau	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBDb3dzLkdpZnQuNA$qOpugeLRYf3NzobqHWe0mcFhT24yVL5TfN8NRNCz6lc	elisabete.moreau@self-service.beg.05.berylia.org	img/default.jpg	f
127	Blanca.Sanz	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBQb2VtLkRyYXcuMw$27V7oLGhu3DDK+84OIzPmS4upZFEuCDMJ9BMhMtSwQI	blanca.sanz@self-service.beg.05.berylia.org	img/default.jpg	f
128	Georgia.Ford	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBTaG93LkhlYWQuMw$yKbMb+297Fofa7+Lfj+sUsYHvWb65paGrTRL7r6cOrA	georgia.ford@self-service.beg.05.berylia.org	img/default.jpg	f
129	Jason.Mendez	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBZb3VyLkZpbGUuOA$8xye96Gl6UNARNHq3EB70I6dzVsyjXTdIDC3jdub+NQ	jason.mendez@self-service.beg.05.berylia.org	img/default.jpg	f
130	Sille.Kaunas	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBCYWQuU3R5bGUuNw$ZTW4mHjdNzuYukOTeOMrkUcENgfPOcSF03YinoGgXBE	sille.kaunas@self-service.beg.05.berylia.org	img/default.jpg	f
131	Angel.Rossi	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBMb3ZlLkJpa2UuMQ$H9yV62PAZAOLInLoQpX77KGOyq0UQHF5+he5OP60l9s	angel.rossi@self-service.beg.05.berylia.org	img/default.jpg	f
132	Mara.Hules	$argon2i$v=19$m=65536,t=3,p=1$ICAgIFdlaXJkLlNvdW5kLg$UqTQ6MfkbkmXzZplPeD9sm/VPfmwuYq6ruvhlW1QUgY	mara.hules@self-service.beg.05.berylia.org	img/default.jpg	f
133	Lissa.Pokorny	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBVYmVyLkhvcHAuMQ$W8fjoqIx/Q1Zq3bxr48Y7QSQnbyOoaSNej+Im72ijkU	lissa.pokorny@self-service.beg.05.berylia.org	img/default.jpg	f
134	Laurissa.Ravenna	$argon2i$v=19$m=65536,t=3,p=1$ICBGbGlwcGVyLlplcm8uMg$W4FT/X/46zoLtr/vP0gQYa8sLyRtTfxYQTjcnokuEHg	laurissa.ravenna@self-service.beg.05.berylia.org	img/default.jpg	f
135	Ward.Candis	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBTdGFyLkR1c3QuMw$tpjwT/qPrhTs2ySFNm3+LavBnKn2f3qxytRDXY8Xrw0	ward.candis@self-service.beg.05.berylia.org	img/default.jpg	f
136	Marvin.Bayley	$argon2i$v=19$m=65536,t=3,p=1$IE92ZXIuUmVhY3Rpb24uMg$UPJto2FrGZ6LHchzzTP1Y1+VDi+2n9kIuZy1d6yn2hs	marvin.bayley@self-service.beg.05.berylia.org	img/default.jpg	f
137	Edgar.Bottle	$argon2i$v=19$m=65536,t=3,p=1$ICAgIEdyZWVuLk1pbGUuMw$4wpwyAnGPpGU3TsJI+SosHtF3uLAecB47uhEJxB7JRs	edgar.bottle@self-service.beg.05.berylia.org	img/default.jpg	f
138	Erica.Zoie	$argon2i$v=19$m=65536,t=3,p=1$ICAgIExldHRlci5Cb3guOQ$L/HAIDuWev+/T5Yj072rlNv2aRjcIJDdUb2gjWdDSrg	erica.zoie@self-service.beg.05.berylia.org	img/default.jpg	f
139	Rodge.Candy	$argon2i$v=19$m=65536,t=3,p=1$ICAgSGlnaC5Gb3Jlc3QuMA$tKwTLO9TvhCb4x4tLbJ6ybnuGlGdTsgNmwFLAtyCl+o	rodge.candy@self-service.beg.05.berylia.org	img/default.jpg	f
140	Kristy.Detta	$argon2i$v=19$m=65536,t=3,p=1$ICBNZWF0LkNob3BwZXIuNA$2AE6wS7LrlHlM7YBjytqW+6qFE4xlYbz1GEjIHySed8	kristy.detta@self-service.beg.05.berylia.org	img/default.jpg	f
141	Chesley.Quentin	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBDb3cuQ2FuZHkuNg$s8jqLIakbLLnO6UGQfKxCe0BYvwqP/x9kwsVk4ABkkQ	chesley.quentin@self-service.beg.05.berylia.org	img/default.jpg	f
142	Elisabete.Trucker	$argon2i$v=19$m=65536,t=3,p=1$ICAgWmVyby5CaW5hcnkuNw$zXUdITxR3ogPYkr1sLso2tvt2p+R5vcELtYKAR9H0v8	elisabete.trucker@self-service.beg.05.berylia.org	img/default.jpg	f
143	Rhys.Lamont	$argon2i$v=19$m=65536,t=3,p=1$ICAgU25vdy5TdW1tZXIuNA$j8O8R+CBLe8rW6xErJJaMlAanVQl2fIItaShdGFycQc	rhys.lamont@self-service.beg.05.berylia.org	img/default.jpg	f
144	Kelda.Norene	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBEb3duLkxvYWQuNw$VaXK+psXOtfO1ntg3t/cusjSbs9SG+1bbqfjJxLXLF8	kelda.norene@self-service.beg.05.berylia.org	img/default.jpg	f
145	Alberto.Cargia	$argon2i$v=19$m=65536,t=3,p=1$ICAgTm90LldhcnpvbmUuOQ$bAzQxQ0+pc36qgkoCNN3iB06fLonVXViJVp8o79eO98	alberto.cargia@self-service.beg.05.berylia.org	img/default.jpg	f
146	Evelynn.Ste	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBDdXQuU3BhY2UuMg$rV6rQQM1yqlv3lTak73WtXPRTatMVGKBmrgr1lbdkCU	evelynn.ste@self-service.beg.05.berylia.org	img/default.jpg	f
147	Taegan.Hector	$argon2i$v=19$m=65536,t=3,p=1$IFNvdW5kLlNwZWFrZXIuMA$W156GJe8e6ND/TcTVzHaxiaE1pJHFsIwHjKfwgz5geo	taegan.hector@self-service.beg.05.berylia.org	img/default.jpg	f
148	Adeline.Dwain	$argon2i$v=19$m=65536,t=3,p=1$ICAgICBCb2x0LkZvb2QuNA$JGKb9YS3x6sXOfHvo2ASBp+3On2rBvnhka3qP0dOrJ4	adeline.dwain@self-service.beg.05.berylia.org	img/default.jpg	f
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, false);


--
-- Name: contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.contracts_id_seq', 148, true);


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.feedback_id_seq', 3, true);


--
-- Name: inquiries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.inquiries_id_seq', 3, true);


--
-- Name: insurances_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.insurances_id_seq', 148, true);


--
-- Name: loans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.loans_id_seq', 148, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.messages_id_seq', 7, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.news_id_seq', 2, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.payments_id_seq', 592, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.posts_id_seq', 1, false);


--
-- Name: security_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.security_feedback_id_seq', 1, false);


--
-- Name: sent_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.sent_messages_id_seq', 17, true);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 3, true);


--
-- Name: user_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.user_settings_id_seq', 148, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: self_service
--

SELECT pg_catalog.setval('public.users_id_seq', 148, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: inquiries inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_pkey PRIMARY KEY (id);


--
-- Name: insurances insurances_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurances_pkey PRIMARY KEY (id);


--
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: security_feedback security_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.security_feedback
    ADD CONSTRAINT security_feedback_pkey PRIMARY KEY (id);


--
-- Name: sent_messages sent_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.sent_messages
    ADD CONSTRAINT sent_messages_pkey PRIMARY KEY (id);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: user_settings user_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: inquiries inquiries_related_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_related_to_fkey FOREIGN KEY (related_to) REFERENCES public.insurances(id) ON DELETE CASCADE;


--
-- Name: inquiries inquiries_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.inquiries
    ADD CONSTRAINT inquiries_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: insurances insurances_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.insurances
    ADD CONSTRAINT insurances_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: loans loans_contract_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_contract_id_fkey FOREIGN KEY (contract_id) REFERENCES public.contracts(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payments payments_loan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_loan_id_fkey FOREIGN KEY (loan_id) REFERENCES public.loans(id) ON DELETE CASCADE;


--
-- Name: sent_messages sent_messages_from_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.sent_messages
    ADD CONSTRAINT sent_messages_from_user_fkey FOREIGN KEY (from_user) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sent_messages sent_messages_message_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.sent_messages
    ADD CONSTRAINT sent_messages_message_id_fkey FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: sent_messages sent_messages_to_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.sent_messages
    ADD CONSTRAINT sent_messages_to_user_fkey FOREIGN KEY (to_user) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_settings user_settings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: self_service
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT user_settings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

