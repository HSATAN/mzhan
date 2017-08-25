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
-- Name: mzhan_user; Type: TABLE; Schema: public; Owner: huangkaijie
--

CREATE TABLE mzhan_user (
    id bigint NOT NULL,
    name character varying(200),
    head_image character varying(200),
    introduce character varying(200),
    fansnum smallint,
    soundnum smallint
);


ALTER TABLE mzhan_user OWNER TO huangkaijie;

--
-- Name: COLUMN mzhan_user.head_image; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_user.head_image IS '头像URL';


--
-- Name: COLUMN mzhan_user.introduce; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_user.introduce IS '个性签名';


--
-- Name: COLUMN mzhan_user.fansnum; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_user.fansnum IS '粉丝数';


--
-- Name: COLUMN mzhan_user.soundnum; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_user.soundnum IS '拥有的音频数';


--
-- Data for Name: mzhan_user; Type: TABLE DATA; Schema: public; Owner: huangkaijie
--

COPY mzhan_user (id, name, head_image, introduce, fansnum, soundnum) FROM stdin;
9999280861	凯特caty	http://static.missevan.com/avatars/201605/27/19ebbfe8c47451119c9a4d006c94dcbd150803.jpg	配音学徒 @凯特caty	\N	\N
\.


--
-- Name: mzhan_user mzhan_user_pkey; Type: CONSTRAINT; Schema: public; Owner: huangkaijie
--

ALTER TABLE ONLY mzhan_user
    ADD CONSTRAINT mzhan_user_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

