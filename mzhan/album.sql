--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: mzhan_album; Type: TABLE; Schema: public; Owner: huangkaijie
--

CREATE TABLE mzhan_album (
    id bigint NOT NULL,
    name character varying(200),
    cover_image character varying(200),
    create_time date,
    update_time date,
    create_user_id bigint
);


ALTER TABLE mzhan_album OWNER TO huangkaijie;

--
-- Name: COLUMN mzhan_album.cover_image; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_album.cover_image IS '封面图片';


--
-- Name: COLUMN mzhan_album.create_time; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_album.create_time IS '创建时间';


--
-- Name: COLUMN mzhan_album.update_time; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_album.update_time IS '更新时间';


--
-- Name: COLUMN mzhan_album.create_user_id; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_album.create_user_id IS '创建者ID';


--
-- Data for Name: mzhan_album; Type: TABLE DATA; Schema: public; Owner: huangkaijie
--

COPY mzhan_album (id, name, cover_image, create_time, update_time, create_user_id) FROM stdin;
9999124229	精神异常梦游症患者调查报告	http://static.missevan.com/coversmini/201607/14/bd3f2f20efc239bb56639d9c41b15ce5110619.jpg	2016-07-14	2017-08-03	9999280861
\.


--
-- Name: mzhan_album mzhan_album_pkey; Type: CONSTRAINT; Schema: public; Owner: huangkaijie
--

ALTER TABLE ONLY mzhan_album
    ADD CONSTRAINT mzhan_album_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

