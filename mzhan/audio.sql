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
-- Name: mzhan_audio; Type: TABLE; Schema: public; Owner: huangkaijie
--

CREATE TABLE mzhan_audio (
    main_url character varying(200),
    id bigint NOT NULL,
    name character varying(200),
    cover_image character varying(200),
    introduce character varying(1000),
    category_first character varying(10),
    category_last character varying(10),
    duration integer,
    mzhan_play_times smallint,
    mzhan_points smallint,
    create_time date,
    url_low character varying(200),
    url_middle character varying(200),
    mzhan_grade smallint,
    pw_grade smallint,
    pw_uptimes smallint,
    pw_play_times smallint,
    type bit(1),
    album_id bigint,
    upper_id bigint,
    url_high character varying(200),
    mzhan_uptimes smallint,
    mzhan_comments smallint
);


ALTER TABLE mzhan_audio OWNER TO huangkaijie;

--
-- Name: COLUMN mzhan_audio.main_url; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.main_url IS '音频的url';


--
-- Name: COLUMN mzhan_audio.id; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.id IS '音频id，唯一标示';


--
-- Name: COLUMN mzhan_audio.name; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.name IS '音频名字';


--
-- Name: COLUMN mzhan_audio.cover_image; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.cover_image IS '音频封面URL';


--
-- Name: COLUMN mzhan_audio.introduce; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.introduce IS '音频介绍';


--
-- Name: COLUMN mzhan_audio.category_first; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.category_first IS '音频一级分类';


--
-- Name: COLUMN mzhan_audio.category_last; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.category_last IS '音频末级分类';


--
-- Name: COLUMN mzhan_audio.duration; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.duration IS '音频时长，单位是   秒';


--
-- Name: COLUMN mzhan_audio.mzhan_play_times; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.mzhan_play_times IS '播放次数';


--
-- Name: COLUMN mzhan_audio.mzhan_points; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.mzhan_points IS '投食次数';


--
-- Name: COLUMN mzhan_audio.create_time; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.create_time IS '上船时间';


--
-- Name: COLUMN mzhan_audio.url_low; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.url_low IS '低音质URL';


--
-- Name: COLUMN mzhan_audio.url_middle; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.url_middle IS '中音质URL，默认';


--
-- Name: COLUMN mzhan_audio.mzhan_grade; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.mzhan_grade IS '根据从m站获取的信息给音频计算出的分数';


--
-- Name: COLUMN mzhan_audio.pw_grade; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.pw_grade IS '根据新收集的信息计算的陪我分数';


--
-- Name: COLUMN mzhan_audio.pw_uptimes; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.pw_uptimes IS '陪我的点赞次数';


--
-- Name: COLUMN mzhan_audio.pw_play_times; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.pw_play_times IS '陪我的播放次数';


--
-- Name: COLUMN mzhan_audio.type; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.type IS '是原创还是转载';


--
-- Name: COLUMN mzhan_audio.album_id; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.album_id IS '专辑id，外键';


--
-- Name: COLUMN mzhan_audio.upper_id; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.upper_id IS '音频所有者ID,外键';


--
-- Name: COLUMN mzhan_audio.url_high; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.url_high IS '音频高音质URL';


--
-- Name: COLUMN mzhan_audio.mzhan_uptimes; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.mzhan_uptimes IS 'mzhan点赞次数';


--
-- Name: COLUMN mzhan_audio.mzhan_comments; Type: COMMENT; Schema: public; Owner: huangkaijie
--

COMMENT ON COLUMN mzhan_audio.mzhan_comments IS 'mzhan评论次数';


--
-- Data for Name: mzhan_audio; Type: TABLE DATA; Schema: public; Owner: huangkaijie
--

COPY mzhan_audio (main_url, id, name, cover_image, introduce, category_first, category_last, duration, mzhan_play_times, mzhan_points, create_time, url_low, url_middle, mzhan_grade, pw_grade, pw_uptimes, pw_play_times, type, album_id, upper_id, url_high, mzhan_uptimes, mzhan_comments) FROM stdin;
\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N
\N	22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N
huagnkaijie	222	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	4	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: mzhan_audio mzhan_audio_pkey; Type: CONSTRAINT; Schema: public; Owner: huangkaijie
--

ALTER TABLE ONLY mzhan_audio
    ADD CONSTRAINT mzhan_audio_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

