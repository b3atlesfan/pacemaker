--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: beat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beat_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: beat_timings_per_run; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beat_timings_per_run (
    run_id integer NOT NULL,
    beat_id integer NOT NULL,
    time_diff interval
);


ALTER TABLE public.beat_timings_per_run OWNER TO postgres;

--
-- Name: beats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beats (
    run_id integer NOT NULL,
    beat_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.beats OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    run_id integer NOT NULL,
    beat_id integer,
    type character varying(255) NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: runs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.runs (
    run_id integer NOT NULL,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.runs OWNER TO postgres;

--
-- Name: runs_run_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.runs_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.runs_run_id_seq OWNER TO postgres;

--
-- Name: runs_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.runs_run_id_seq OWNED BY public.runs.run_id;


--
-- Name: variable_changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variable_changes (
    variable_change_id integer NOT NULL,
    event_id integer NOT NULL,
    name_and_path character varying(255) NOT NULL,
    new_value double precision NOT NULL,
    diff double precision NOT NULL
);


ALTER TABLE public.variable_changes OWNER TO postgres;

--
-- Name: variable_changes_variable_change_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variable_changes_variable_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variable_changes_variable_change_id_seq OWNER TO postgres;

--
-- Name: variable_changes_variable_change_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variable_changes_variable_change_id_seq OWNED BY public.variable_changes.variable_change_id;


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: runs run_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs ALTER COLUMN run_id SET DEFAULT nextval('public.runs_run_id_seq'::regclass);


--
-- Name: variable_changes variable_change_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_changes ALTER COLUMN variable_change_id SET DEFAULT nextval('public.variable_changes_variable_change_id_seq'::regclass);


--
-- Data for Name: beat_timings_per_run; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beat_timings_per_run (run_id, beat_id, time_diff) FROM stdin;
65	1	00:00:07.427
65	2	00:00:08.21
65	3	00:00:09.984
65	4	00:00:10.394
\.


--
-- Data for Name: beats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.beats (run_id, beat_id, "timestamp") FROM stdin;
9	2	2025-05-13 15:40:07.884
12	1	2025-05-13 16:28:10.725
12	2	2025-05-13 16:28:10.725
12	3	2025-05-13 16:28:10.725
9	1	2025-05-13 15:40:07.884
13	0	2025-05-13 16:33:18.078
13	1	2025-05-13 16:33:18.078
13	2	2025-05-13 16:33:18.078
14	0	2025-05-16 15:14:01.14
14	1	2025-05-16 15:14:01.14
14	2	2025-05-16 15:14:01.14
14	3	2025-05-16 15:14:01.14
14	4	2025-05-16 15:14:01.14
14	5	2025-05-16 15:14:01.14
14	6	2025-05-16 15:14:01.14
14	7	2025-05-16 15:14:01.14
14	8	2025-05-16 15:14:01.14
14	9	2025-05-16 15:14:01.14
14	10	2025-05-16 15:14:01.14
14	11	2025-05-16 15:14:01.14
14	12	2025-05-16 15:14:01.14
14	13	2025-05-16 15:14:01.14
14	14	2025-05-16 15:14:01.14
14	15	2025-05-16 15:14:01.14
14	16	2025-05-16 15:14:01.14
14	17	2025-05-16 15:14:01.14
14	18	2025-05-16 15:14:01.14
14	19	2025-05-16 15:14:01.14
14	20	2025-05-16 15:14:01.14
14	21	2025-05-16 15:14:01.14
14	22	2025-05-16 15:14:01.14
14	23	2025-05-16 15:14:01.14
14	24	2025-05-16 15:14:01.14
14	25	2025-05-16 15:14:01.14
14	26	2025-05-16 15:14:01.14
14	27	2025-05-16 15:14:01.14
14	28	2025-05-16 15:14:01.14
14	29	2025-05-16 15:14:01.14
14	30	2025-05-16 15:14:01.14
14	31	2025-05-16 15:14:01.14
14	32	2025-05-16 15:14:01.14
14	33	2025-05-16 15:14:01.14
14	34	2025-05-16 15:14:01.14
14	35	2025-05-16 15:14:01.14
14	36	2025-05-16 15:14:01.14
15	0	2025-05-16 19:11:13.291
15	1	2025-05-16 19:11:13.291
15	2	2025-05-16 19:11:13.291
18	0	2025-05-16 19:27:05.704
18	1	2025-05-16 19:27:05.704
18	2	2025-05-16 19:27:05.704
18	3	2025-05-16 19:27:05.704
18	4	2025-05-16 19:27:05.704
18	5	2025-05-16 19:27:05.704
18	6	2025-05-16 19:27:05.704
19	0	2025-05-16 19:47:36.947
20	0	2025-05-16 19:49:38.901
21	0	2025-05-16 19:50:14.465
21	1	2025-05-16 19:50:14.465
21	2	2025-05-16 19:50:14.465
21	3	2025-05-16 19:50:14.465
22	0	2025-05-16 19:57:53.443
22	1	2025-05-16 19:57:53.443
22	2	2025-05-16 19:57:53.443
23	0	2025-05-16 20:17:43.675
23	1	2025-05-16 20:17:43.675
23	2	2025-05-16 20:17:43.675
23	3	2025-05-16 20:17:43.675
24	0	2025-05-17 15:35:58.349
24	1	2025-05-17 15:35:58.349
26	0	2025-05-17 17:15:01.223
26	1	2025-05-17 17:15:50.834
27	0	2025-05-17 17:17:22.276
27	1	2025-05-17 17:17:32.099
27	2	2025-05-17 17:17:32.536
28	0	2025-05-17 17:18:18.467
28	1	2025-05-17 17:18:23.469
29	0	2025-05-17 17:19:18.067
29	1	2025-05-17 17:19:19.113
29	2	2025-05-17 17:19:19.954
29	3	2025-05-17 17:19:20.626
30	0	2025-05-17 17:20:26.376
30	1	2025-05-17 17:20:29.629
30	2	2025-05-17 17:20:30.912
31	0	2025-05-17 17:21:33.468
31	1	2025-05-17 17:21:41.431
31	2	2025-05-17 17:22:05.127
33	0	2025-05-18 12:28:54.114
33	1	2025-05-18 12:29:03.055
33	2	2025-05-18 12:29:13.927
33	3	2025-05-18 12:29:22.443
33	4	2025-05-18 12:29:31.891
34	0	2025-05-18 13:28:19.182
34	1	2025-05-18 13:28:35.606
37	0	2025-05-18 13:46:41.701
37	1	2025-05-18 13:53:28.468
41	0	2025-05-18 14:20:20.215
41	1	2025-05-18 14:20:27
41	2	2025-05-18 14:20:36.246
42	0	2025-05-18 14:20:53.263
42	1	2025-05-18 14:20:59.773
42	2	2025-05-18 14:21:10.431
43	0	2025-05-18 14:33:54.074
43	1	2025-05-18 14:34:01.459
43	2	2025-05-18 14:34:16.582
43	3	2025-05-18 14:34:27.188
44	0	2025-05-18 14:52:50.237
44	1	2025-05-18 14:52:58.046
44	2	2025-05-18 14:53:08.718
44	3	2025-05-18 14:53:20.043
44	4	2025-05-18 14:53:32.897
44	5	2025-05-18 14:53:42.463
45	0	2025-05-18 15:36:53.092
45	1	2025-05-18 15:36:58.547
45	2	2025-05-18 15:37:09.264
45	3	2025-05-18 15:37:18.152
45	4	2025-05-18 15:37:25.546
49	0	2025-05-19 00:28:34.858
50	0	2025-05-19 00:29:44.452
50	1	2025-05-19 00:30:11.591
50	2	2025-05-19 00:30:57.594
50	3	2025-05-19 00:31:31.257
51	0	2025-05-19 00:33:00.073
51	1	2025-05-19 00:39:33.964
51	2	2025-05-19 00:40:37.687
51	3	2025-05-19 00:41:05.976
51	4	2025-05-19 00:41:05.983
51	5	2025-05-19 00:41:24.254
51	6	2025-05-19 00:41:41.155
51	7	2025-05-19 00:41:52.78
51	8	2025-05-19 00:42:05.281
51	9	2025-05-19 00:42:33.745
51	10	2025-05-19 00:43:16.434
51	11	2025-05-19 00:43:33.296
51	12	2025-05-19 00:43:39.214
51	13	2025-05-19 00:43:49.318
51	14	2025-05-19 00:46:22.908
51	15	2025-05-19 00:47:33.219
52	0	2025-05-19 00:50:51.021
52	1	2025-05-19 00:51:13.358
52	2	2025-05-19 00:51:16.431
52	3	2025-05-19 00:51:26.25
53	0	2025-05-19 01:06:07.06
54	0	2025-05-19 01:09:18.563
54	1	2025-05-19 01:09:33.995
54	2	2025-05-19 01:09:35.572
54	3	2025-05-19 01:09:43.27
54	4	2025-05-19 01:11:12.102
54	5	2025-05-19 01:12:10.17
55	0	2025-05-19 02:20:13.432
55	1	2025-05-19 02:20:18.404
55	2	2025-05-19 02:20:19.799
55	3	2025-05-19 02:20:26.569
55	4	2025-05-19 02:20:38.045
55	5	2025-05-19 02:20:45.387
55	6	2025-05-19 02:20:50.924
55	7	2025-05-19 02:20:53.557
55	8	2025-05-19 02:21:01.02
55	9	2025-05-19 02:21:06.194
55	10	2025-05-19 02:21:23.372
55	11	2025-05-19 02:21:35.585
56	0	2025-05-19 02:26:14.404
56	1	2025-05-19 02:26:19.148
56	2	2025-05-19 02:26:20.611
56	3	2025-05-19 02:26:27.817
56	4	2025-05-19 02:26:32.945
56	5	2025-05-19 02:26:40.426
56	6	2025-05-19 02:26:46.153
56	7	2025-05-19 02:26:48.658
56	8	2025-05-19 02:26:48.728
56	9	2025-05-19 02:26:54.711
56	10	2025-05-19 02:26:59.168
56	11	2025-05-19 02:27:08.37
56	12	2025-05-19 02:27:08.468
56	13	2025-05-19 02:27:19.245
57	0	2025-05-19 02:50:22.599
57	1	2025-05-19 02:50:31.053
57	2	2025-05-19 02:50:33.931
57	3	2025-05-19 02:50:41.327
57	4	2025-05-19 02:50:47.848
58	0	2025-05-19 02:52:22.735
58	1	2025-05-19 02:52:39.991
58	2	2025-05-19 02:52:45.586
58	3	2025-05-19 02:53:02.027
59	0	2025-05-19 02:54:36.722
59	1	2025-05-19 02:54:49.502
59	2	2025-05-19 02:54:56.799
59	3	2025-05-19 02:55:03.916
59	4	2025-05-19 02:55:09.019
59	5	2025-05-19 02:55:15.177
59	6	2025-05-19 02:55:20.454
59	7	2025-05-19 02:55:22.391
59	8	2025-05-19 02:55:22.733
59	9	2025-05-19 02:55:28.624
60	0	2025-05-19 02:57:14.626
60	1	2025-05-19 02:57:19.384
60	2	2025-05-19 02:57:22.201
60	3	2025-05-19 02:57:25.954
60	4	2025-05-19 02:57:32.869
60	5	2025-05-19 02:57:43.498
60	6	2025-05-19 02:58:00.245
60	7	2025-05-19 02:58:08.513
60	8	2025-05-19 02:58:13.203
60	9	2025-05-19 02:58:17.872
60	10	2025-05-19 02:58:28.156
61	0	2025-05-19 03:05:24.99
61	1	2025-05-19 03:05:31.27
61	2	2025-05-19 03:05:33.735
61	3	2025-05-19 03:05:44.684
61	4	2025-05-19 03:05:50.457
61	5	2025-05-19 03:06:00.865
61	6	2025-05-19 03:06:18.577
61	7	2025-05-19 03:06:26.476
61	8	2025-05-19 03:06:31.589
61	9	2025-05-19 03:06:37.306
61	10	2025-05-19 03:06:59.385
61	11	2025-05-19 03:07:35.067
61	12	2025-05-19 03:07:37.223
63	0	2025-05-19 20:35:52.745
63	1	2025-05-19 20:36:00.341
63	2	2025-05-19 20:36:34.69
63	3	2025-05-19 20:36:46.321
63	4	2025-05-19 20:37:00.543
64	0	2025-05-19 20:40:19.569
64	1	2025-05-19 20:40:26.029
64	2	2025-05-19 20:40:50.136
65	0	2025-05-19 20:49:31.685
65	1	2025-05-19 20:49:39.112
65	2	2025-05-19 20:49:47.322
65	3	2025-05-19 20:49:57.306
65	4	2025-05-19 20:50:07.7
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, run_id, beat_id, type, "timestamp") FROM stdin;
0	1	1	checkpointReached	2025-05-13 13:04:25.488
105	9	3	checkpointReached	2025-05-13 15:40:07.884
1	3	\N	VariableChanged	2025-05-13 15:03:45.291
2	3	\N	VariableChanged	2025-05-13 15:04:15.047
3	3	\N	VariableChanged	2025-05-13 15:04:20.013
4	3	\N	VariableChanged	2025-05-13 15:04:25.041
5	3	\N	VariableChanged	2025-05-13 15:04:30.045
6	3	\N	VariableChanged	2025-05-13 15:04:35.062
7	3	\N	VariableChanged	2025-05-13 15:04:40.079
8	3	\N	VariableChanged	2025-05-13 15:04:45.091
9	3	\N	VariableChanged	2025-05-13 15:04:50.109
10	3	\N	VariableChanged	2025-05-13 15:06:25.021
11	3	\N	VariableChanged	2025-05-13 15:06:55.15
12	3	\N	VariableChanged	2025-05-13 15:07:49.874
13	3	\N	VariableChanged	2025-05-13 15:08:10.524
114	11	\N	VariableChanged	2025-05-13 16:25:19.28
115	11	\N	VariableChanged	2025-05-13 16:25:20.107
132	13	0	VariableChanged	2025-05-13 16:33:14.545
133	13	0	checkpointReached	2025-05-13 16:33:18.078
14	7	\N	VariableChanged	2025-05-13 15:22:50.13
15	7	\N	VariableChanged	2025-05-13 15:22:55.688
16	7	\N	VariableChanged	2025-05-13 15:24:15
134	13	1	VariableChanged	2025-05-13 16:33:18.616
135	13	1	VariableChanged	2025-05-13 16:33:23.643
136	13	1	VariableChanged	2025-05-13 16:33:28.67
137	13	1	VariableChanged	2025-05-13 16:33:33.692
138	13	1	checkpointReached	2025-05-13 16:33:37.107
139	13	2	VariableChanged	2025-05-13 16:33:39.997
140	13	2	VariableChanged	2025-05-13 16:33:43.518
141	13	2	VariableChanged	2025-05-13 16:33:48.575
142	13	2	VariableChanged	2025-05-13 16:33:53.597
143	13	2	checkpointReached	2025-05-13 16:33:58.991
144	14	0	checkpointReached	2025-05-16 15:14:01.14
145	14	1	checkpointReached	2025-05-16 15:14:24.928
146	14	2	VariableChanged	2025-05-16 15:14:29.25
147	14	2	VariableChanged	2025-05-16 15:14:33.771
148	14	2	checkpointReached	2025-05-16 15:14:38.885
149	14	3	VariableChanged	2025-05-16 15:16:54.383
150	14	3	checkpointReached	2025-05-16 15:16:58.621
151	14	4	VariableChanged	2025-05-16 15:16:59.062
152	14	4	VariableChanged	2025-05-16 15:17:04.114
153	14	4	checkpointReached	2025-05-16 15:17:06.922
154	14	5	VariableChanged	2025-05-16 15:17:38.269
155	14	5	checkpointReached	2025-05-16 15:17:39.54
156	14	6	VariableChanged	2025-05-16 15:17:40.093
157	14	6	VariableChanged	2025-05-16 15:17:43.117
158	14	6	checkpointReached	2025-05-16 15:17:44.882
159	14	7	VariableChanged	2025-05-16 15:18:53.141
160	14	7	checkpointReached	2025-05-16 15:18:56.153
161	14	8	VariableChanged	2025-05-16 15:18:56.706
162	14	8	VariableChanged	2025-05-16 15:18:58.212
163	14	8	checkpointReached	2025-05-16 15:19:03.687
164	14	9	VariableChanged	2025-05-16 15:19:17.039
165	14	9	checkpointReached	2025-05-16 15:19:18.725
166	14	10	VariableChanged	2025-05-16 15:19:19.251
167	14	10	VariableChanged	2025-05-16 15:19:21.772
168	14	10	checkpointReached	2025-05-16 15:19:27.226
169	14	11	VariableChanged	2025-05-16 15:21:56.56
170	14	11	checkpointReached	2025-05-16 15:21:59.236
171	14	12	VariableChanged	2025-05-16 15:21:59.774
172	14	12	VariableChanged	2025-05-16 15:22:01.285
17	8	1	VariableChanged	2025-05-13 15:25:07.719
18	8	1	VariableChanged	2025-05-13 15:25:11.757
19	8	1	VariableChanged	2025-05-13 15:26:14.325
20	8	1	VariableChanged	2025-05-13 15:26:21.56
21	8	1	VariableChanged	2025-05-13 15:26:24.378
22	8	1	VariableChanged	2025-05-13 15:26:29.401
23	8	1	VariableChanged	2025-05-13 15:26:34.428
24	8	1	VariableChanged	2025-05-13 15:26:39.458
25	8	1	VariableChanged	2025-05-13 15:26:44.478
26	8	1	VariableChanged	2025-05-13 15:26:49.495
27	8	1	VariableChanged	2025-05-13 15:27:09.573
28	8	1	VariableChanged	2025-05-13 15:27:14.587
29	8	1	VariableChanged	2025-05-13 15:27:19.638
30	8	1	VariableChanged	2025-05-13 15:27:24.66
173	14	12	checkpointReached	2025-05-16 15:22:06.7
174	14	13	VariableChanged	2025-05-16 15:22:21.973
175	14	13	checkpointReached	2025-05-16 15:22:23.47
176	14	14	VariableChanged	2025-05-16 15:22:24.032
177	14	14	VariableChanged	2025-05-16 15:22:27.05
178	14	14	checkpointReached	2025-05-16 15:22:30.287
179	14	15	VariableChanged	2025-05-16 15:22:41.132
180	14	15	checkpointReached	2025-05-16 15:22:42.768
181	14	16	VariableChanged	2025-05-16 15:22:43.306
182	14	16	VariableChanged	2025-05-16 15:22:45.839
183	14	16	checkpointReached	2025-05-16 15:22:48.586
204	14	24	checkpointReached	2025-05-16 15:25:53.31
202	14	24	VariableChanged	2025-05-16 15:25:48.398
203	14	24	VariableChanged	2025-05-16 15:25:50.404
205	14	25	VariableChanged	2025-05-16 15:27:18.983
206	14	25	VariableChanged	2025-05-16 15:27:23.98
207	14	25	VariableChanged	2025-05-16 15:27:29.01
208	14	25	VariableChanged	2025-05-16 15:27:34.03
209	14	25	VariableChanged	2025-05-16 15:27:39.048
210	14	25	VariableChanged	2025-05-16 15:27:44.065
211	14	25	VariableChanged	2025-05-16 15:27:49.103
212	14	25	checkpointReached	2025-05-16 15:27:49.677
213	14	26	VariableChanged	2025-05-16 15:27:50.219
214	14	26	checkpointReached	2025-05-16 15:27:54.828
215	14	27	VariableChanged	2025-05-16 15:29:49.228
216	14	27	checkpointReached	2025-05-16 15:29:51.021
217	14	28	VariableChanged	2025-05-16 15:29:51.574
218	14	28	VariableChanged	2025-05-16 15:29:54.086
219	14	28	checkpointReached	2025-05-16 15:29:59.691
220	14	29	VariableChanged	2025-05-16 15:30:02.011
221	14	29	VariableChanged	2025-05-16 15:30:04.022
222	14	29	VariableChanged	2025-05-16 15:30:09.046
223	14	29	VariableChanged	2025-05-16 15:30:14.071
224	14	29	VariableChanged	2025-05-16 15:39:08.23
225	14	29	checkpointReached	2025-05-16 15:39:09.876
226	14	30	VariableChanged	2025-05-16 15:39:10.417
227	14	30	VariableChanged	2025-05-16 15:39:12.946
228	14	30	checkpointReached	2025-05-16 15:39:16.741
31	8	1	VariableChanged	2025-05-13 15:27:29.682
32	8	1	VariableChanged	2025-05-13 15:27:34.698
33	8	1	VariableChanged	2025-05-13 15:27:39.718
34	8	1	VariableChanged	2025-05-13 15:27:44.738
35	8	1	VariableChanged	2025-05-13 15:27:49.754
36	8	1	VariableChanged	2025-05-13 15:27:54.777
37	8	1	VariableChanged	2025-05-13 15:28:04.822
38	8	1	VariableChanged	2025-05-13 15:28:29.42
39	8	1	checkpointReached	2025-05-13 15:28:31.135
40	8	1	VariableChanged	2025-05-13 15:28:31.663
41	8	1	VariableChanged	2025-05-13 15:28:34.672
42	8	1	checkpointReached	2025-05-13 15:28:49.473
43	9	1	VariableChanged	2025-05-13 15:31:28.85
44	9	1	VariableChanged	2025-05-13 15:31:33.38
45	9	1	VariableChanged	2025-05-13 15:31:38.412
46	9	1	VariableChanged	2025-05-13 15:31:43.428
47	9	1	VariableChanged	2025-05-13 15:31:48.452
48	9	1	VariableChanged	2025-05-13 15:32:23.569
49	9	1	VariableChanged	2025-05-13 15:32:38.632
50	9	1	VariableChanged	2025-05-13 15:32:43.67
51	9	1	VariableChanged	2025-05-13 15:33:08.77
52	9	1	VariableChanged	2025-05-13 15:33:13.787
53	9	1	VariableChanged	2025-05-13 15:33:18.807
54	9	1	VariableChanged	2025-05-13 15:33:23.822
55	9	1	VariableChanged	2025-05-13 15:33:28.358
56	9	1	VariableChanged	2025-05-13 15:33:33.372
57	9	1	VariableChanged	2025-05-13 15:33:38.387
58	9	1	VariableChanged	2025-05-13 15:33:43.408
59	9	1	VariableChanged	2025-05-13 15:34:08.504
60	9	1	VariableChanged	2025-05-13 15:34:13.524
61	9	1	VariableChanged	2025-05-13 15:34:18.54
62	9	1	VariableChanged	2025-05-13 15:34:23.555
63	9	1	VariableChanged	2025-05-13 15:34:28.573
64	9	1	VariableChanged	2025-05-13 15:34:33.59
65	9	1	VariableChanged	2025-05-13 15:34:38.604
66	9	1	VariableChanged	2025-05-13 15:34:48.642
67	9	1	VariableChanged	2025-05-13 15:34:53.66
68	9	1	VariableChanged	2025-05-13 15:35:03.695
69	9	1	VariableChanged	2025-05-13 15:35:08.729
70	9	1	VariableChanged	2025-05-13 15:35:13.746
71	9	1	VariableChanged	2025-05-13 15:35:18.762
72	9	1	VariableChanged	2025-05-13 15:35:23.781
73	9	1	VariableChanged	2025-05-13 15:35:28.802
74	9	1	VariableChanged	2025-05-13 15:35:33.832
75	9	1	VariableChanged	2025-05-13 15:35:38.851
76	9	1	VariableChanged	2025-05-13 15:35:43.868
77	9	1	VariableChanged	2025-05-13 15:36:03.946
78	9	1	VariableChanged	2025-05-13 15:36:08.962
79	9	1	VariableChanged	2025-05-13 15:36:13.492
80	9	1	VariableChanged	2025-05-13 15:36:18.515
81	9	1	VariableChanged	2025-05-13 15:36:23.529
82	9	1	VariableChanged	2025-05-13 15:36:28.564
83	9	1	VariableChanged	2025-05-13 15:36:33.578
84	9	1	VariableChanged	2025-05-13 15:36:38.603
85	9	1	VariableChanged	2025-05-13 15:36:43.626
86	9	1	VariableChanged	2025-05-13 15:36:48.648
87	9	1	VariableChanged	2025-05-13 15:36:53.661
88	9	1	VariableChanged	2025-05-13 15:37:08.717
89	9	1	VariableChanged	2025-05-13 15:37:13.736
90	9	1	VariableChanged	2025-05-13 15:37:18.756
91	9	1	VariableChanged	2025-05-13 15:37:23.779
92	9	1	VariableChanged	2025-05-13 15:37:28.804
93	9	1	VariableChanged	2025-05-13 15:37:33.824
94	9	1	VariableChanged	2025-05-13 15:37:38.835
95	9	1	VariableChanged	2025-05-13 15:37:43.849
96	9	1	VariableChanged	2025-05-13 15:37:48.871
97	9	1	VariableChanged	2025-05-13 15:38:03.928
98	9	1	VariableChanged	2025-05-13 15:38:08.956
99	9	1	VariableChanged	2025-05-13 15:38:18.99
100	9	1	VariableChanged	2025-05-13 15:38:24.007
101	9	1	VariableChanged	2025-05-13 15:38:29.042
102	9	1	VariableChanged	2025-05-13 15:38:34.066
103	9	1	VariableChanged	2025-05-13 15:38:38.595
104	9	1	checkpointReached	2025-05-13 15:38:39.752
106	10	4	VariableChanged	2025-05-13 16:05:06.456
107	10	4	checkpointReached	2025-05-13 16:05:08.684
108	10	\N	checkpointReached	2025-05-13 16:06:32.257
109	10	\N	VariableChanged	2025-05-13 16:06:35.144
110	10	\N	VariableChanged	2025-05-13 16:06:36.375
111	10	\N	VariableChanged	2025-05-13 16:06:41.417
112	10	\N	VariableChanged	2025-05-13 16:06:46.441
113	10	\N	VariableChanged	2025-05-13 16:06:51.461
116	12	1	VariableChanged	2025-05-13 16:28:07.033
117	12	1	checkpointReached	2025-05-13 16:28:10.725
118	12	2	VariableChanged	2025-05-13 16:29:01.939
119	12	2	VariableChanged	2025-05-13 16:29:06.964
120	12	2	VariableChanged	2025-05-13 16:29:11.991
121	12	2	checkpointReached	2025-05-13 16:29:16.912
122	12	3	VariableChanged	2025-05-13 16:29:27.005
123	12	3	VariableChanged	2025-05-13 16:29:32.05
124	12	3	VariableChanged	2025-05-13 16:29:37.077
125	12	3	checkpointReached	2025-05-13 16:29:58.49
126	12	3	VariableChanged	2025-05-13 16:29:58.996
127	12	3	VariableChanged	2025-05-13 16:30:02.007
128	12	3	VariableChanged	2025-05-13 16:30:07.031
129	12	3	VariableChanged	2025-05-13 16:30:12.059
130	12	3	VariableChanged	2025-05-13 16:30:17.079
131	12	3	VariableChanged	2025-05-13 16:30:22.097
184	14	17	VariableChanged	2025-05-16 15:23:37.781
185	14	17	VariableChanged	2025-05-16 15:24:12.244
186	14	17	checkpointReached	2025-05-16 15:24:14.397
187	14	18	VariableChanged	2025-05-16 15:24:14.958
188	14	18	VariableChanged	2025-05-16 15:24:16.971
189	14	18	checkpointReached	2025-05-16 15:24:21.345
190	14	19	VariableChanged	2025-05-16 15:24:33.072
191	14	19	checkpointReached	2025-05-16 15:24:34.651
192	14	20	VariableChanged	2025-05-16 15:24:35.201
193	14	20	VariableChanged	2025-05-16 15:24:38.212
194	14	20	checkpointReached	2025-05-16 15:24:39.296
195	14	21	VariableChanged	2025-05-16 15:25:06.926
196	14	21	checkpointReached	2025-05-16 15:25:09.351
197	14	22	VariableChanged	2025-05-16 15:25:09.883
198	14	22	VariableChanged	2025-05-16 15:25:11.897
199	14	22	checkpointReached	2025-05-16 15:25:14.81
200	14	23	VariableChanged	2025-05-16 15:25:45.451
201	14	23	checkpointReached	2025-05-16 15:25:47.864
229	14	31	VariableChanged	2025-05-16 15:39:20.893
230	14	31	VariableChanged	2025-05-16 15:39:22.922
231	14	31	VariableChanged	2025-05-16 16:45:26.561
232	14	31	checkpointReached	2025-05-16 16:45:31.546
233	14	32	VariableChanged	2025-05-16 16:45:32.108
234	14	32	VariableChanged	2025-05-16 16:45:36.137
235	14	32	VariableChanged	2025-05-16 16:45:41.538
236	14	32	VariableChanged	2025-05-16 16:45:46.507
237	14	32	VariableChanged	2025-05-16 16:45:51.535
238	14	32	checkpointReached	2025-05-16 16:46:06.754
239	14	33	VariableChanged	2025-05-16 16:46:07.273
240	14	33	VariableChanged	2025-05-16 16:46:11.301
241	14	33	checkpointReached	2025-05-16 16:46:16.631
242	14	34	VariableChanged	2025-05-16 16:46:17.705
243	14	34	VariableChanged	2025-05-16 16:46:21.228
244	14	34	VariableChanged	2025-05-16 16:46:36.495
245	14	34	checkpointReached	2025-05-16 16:46:38.036
246	14	35	VariableChanged	2025-05-16 16:46:38.579
247	14	35	VariableChanged	2025-05-16 16:46:41.623
248	14	35	checkpointReached	2025-05-16 16:46:46.237
249	14	36	VariableChanged	2025-05-16 16:46:47.409
250	14	36	checkpointReached	2025-05-16 17:14:54.902
251	15	0	checkpointReached	2025-05-16 19:11:13.291
252	15	1	checkpointReached	2025-05-16 19:11:21.924
253	15	2	VariableChanged	2025-05-16 19:11:25.98
254	15	2	VariableChanged	2025-05-16 19:11:29.498
255	15	2	checkpointReached	2025-05-16 19:11:32.287
257	16	\N	VariableChanged	2025-05-16 19:23:22.233
258	17	\N	VariableChanged	2025-05-16 19:24:29.689
256	15	2	VariableChanged	2025-05-16 19:11:34.548
259	18	0	VariableChanged	2025-05-16 19:26:41.297
260	18	0	checkpointReached	2025-05-16 19:27:05.704
261	18	1	VariableChanged	2025-05-16 19:27:06.244
262	18	1	VariableChanged	2025-05-16 19:27:10.773
263	18	1	VariableChanged	2025-05-16 19:27:24.399
264	18	1	checkpointReached	2025-05-16 19:27:26.147
265	18	2	VariableChanged	2025-05-16 19:27:26.695
266	18	2	VariableChanged	2025-05-16 19:27:29.211
267	18	2	checkpointReached	2025-05-16 19:27:35.001
268	18	3	VariableChanged	2025-05-16 19:27:37.021
269	18	3	VariableChanged	2025-05-16 19:27:39.535
270	18	3	checkpointReached	2025-05-16 19:27:45.27
271	18	4	VariableChanged	2025-05-16 19:27:46.917
272	18	4	VariableChanged	2025-05-16 19:37:16.261
273	18	4	checkpointReached	2025-05-16 19:37:18.283
274	18	5	VariableChanged	2025-05-16 19:37:18.716
275	18	5	VariableChanged	2025-05-16 19:37:21.231
276	18	5	checkpointReached	2025-05-16 19:37:26.25
277	18	6	VariableChanged	2025-05-16 19:37:28.167
278	18	6	VariableChanged	2025-05-16 19:37:31.182
279	18	6	checkpointReached	2025-05-16 19:37:36.897
280	18	6	VariableChanged	2025-05-16 19:37:38.618
281	18	6	RecordingStarted	2025-05-16 21:44:02.758
282	19	0	VariableChanged	2025-05-16 19:47:35.088
283	19	0	checkpointReached	2025-05-16 19:47:36.947
284	19	0	VariableChanged	2025-05-16 19:47:37.407
285	20	0	VariableChanged	2025-05-16 19:49:33.517
286	20	0	VariableChanged	2025-05-16 19:49:38.526
287	20	0	checkpointReached	2025-05-16 19:49:38.901
288	20	0	VariableChanged	2025-05-16 19:49:39.378
289	20	0	VariableChanged	2025-05-16 19:49:43.396
290	20	0	VariableChanged	2025-05-16 19:49:48.78
291	21	0	VariableChanged	2025-05-16 19:50:10.044
292	21	0	checkpointReached	2025-05-16 19:50:14.465
293	21	1	VariableChanged	2025-05-16 19:50:14.995
294	21	1	VariableChanged	2025-05-16 19:50:20.056
295	21	1	VariableChanged	2025-05-16 19:50:25.114
296	21	1	checkpointReached	2025-05-16 19:50:31.255
297	21	2	VariableChanged	2025-05-16 19:50:33.57
298	21	2	VariableChanged	2025-05-16 19:50:35.077
299	21	2	checkpointReached	2025-05-16 19:50:38.313
300	21	3	VariableChanged	2025-05-16 19:50:40.093
301	21	3	VariableChanged	2025-05-16 19:51:34.733
302	21	3	checkpointReached	2025-05-16 19:51:37.419
303	21	3	VariableChanged	2025-05-16 19:51:37.95
304	21	3	VariableChanged	2025-05-16 19:51:40.135
305	22	0	VariableChanged	2025-05-16 19:57:51.553
306	22	0	checkpointReached	2025-05-16 19:57:53.443
307	22	1	VariableChanged	2025-05-16 19:57:53.972
308	22	1	VariableChanged	2025-05-16 19:57:56.535
309	22	1	VariableChanged	2025-05-16 19:58:01.501
310	22	1	checkpointReached	2025-05-16 19:58:04.909
311	22	2	VariableChanged	2025-05-16 19:58:06.779
312	22	2	VariableChanged	2025-05-16 19:58:11.3
313	22	2	checkpointReached	2025-05-16 19:58:17.368
314	22	2	VariableChanged	2025-05-16 19:58:19.268
315	22	2	VariableChanged	2025-05-16 19:58:21.297
316	23	0	VariableChanged	2025-05-16 20:17:41.936
317	23	0	checkpointReached	2025-05-16 20:17:43.675
318	23	1	VariableChanged	2025-05-16 20:17:44.201
319	23	1	VariableChanged	2025-05-16 20:17:46.711
320	23	1	checkpointReached	2025-05-16 20:17:50.939
321	23	2	VariableChanged	2025-05-16 20:17:55.884
322	23	2	VariableChanged	2025-05-16 20:17:56.888
323	23	2	checkpointReached	2025-05-16 20:18:02.234
324	23	3	VariableChanged	2025-05-16 20:18:07.363
325	23	3	VariableChanged	2025-05-16 20:18:11.883
326	23	3	VariableChanged	2025-05-16 20:18:16.912
327	23	3	checkpointReached	2025-05-16 20:18:20.789
328	23	3	VariableChanged	2025-05-16 20:18:30.988
329	24	0	VariableChanged	2025-05-17 15:35:37.5
330	24	0	VariableChanged	2025-05-17 15:35:42.572
331	24	0	VariableChanged	2025-05-17 15:35:47.621
332	24	0	VariableChanged	2025-05-17 15:35:52.677
333	24	0	VariableChanged	2025-05-17 15:35:57.716
334	24	0	checkpointReached	2025-05-17 15:35:58.349
335	24	1	VariableChanged	2025-05-17 15:36:02.249
336	24	1	VariableChanged	2025-05-17 15:36:07.951
337	24	1	VariableChanged	2025-05-17 15:36:12.499
338	24	1	checkpointReached	2025-05-17 15:36:14.847
339	24	1	VariableChanged	2025-05-17 15:36:17.545
340	24	1	VariableChanged	2025-05-17 15:38:42.702
341	26	0	VariableChanged	2025-05-17 17:14:44.954
342	26	0	VariableChanged	2025-05-17 17:14:49.698
343	26	0	VariableChanged	2025-05-17 17:14:55.916
344	26	0	VariableChanged	2025-05-17 17:14:58.442
345	26	0	checkpointReached	2025-05-17 17:15:01.223
346	26	1	VariableChanged	2025-05-17 17:15:40.56
347	26	1	VariableChanged	2025-05-17 17:15:43.595
348	26	1	VariableChanged	2025-05-17 17:15:48.633
349	26	1	checkpointReached	2025-05-17 17:15:50.834
350	27	0	VariableChanged	2025-05-17 17:16:23.044
351	27	0	checkpointReached	2025-05-17 17:17:22.276
352	27	1	VariableChanged	2025-05-17 17:17:26.315
353	27	1	VariableChanged	2025-05-17 17:17:28.824
354	27	1	checkpointReached	2025-05-17 17:17:32.099
355	27	2	checkpointReached	2025-05-17 17:17:32.536
356	27	2	VariableChanged	2025-05-17 17:17:33.875
357	27	2	VariableChanged	2025-05-17 17:17:38.918
358	27	2	VariableChanged	2025-05-17 17:17:43.471
359	27	2	VariableChanged	2025-05-17 17:18:01.419
360	28	0	checkpointReached	2025-05-17 17:18:18.467
361	28	1	VariableChanged	2025-05-17 17:18:19.692
362	28	1	checkpointReached	2025-05-17 17:18:23.469
363	28	1	VariableChanged	2025-05-17 17:18:24.733
364	28	1	VariableChanged	2025-05-17 17:18:42.094
365	29	0	VariableChanged	2025-05-17 17:19:06.61
366	29	0	VariableChanged	2025-05-17 17:19:11.127
367	29	0	VariableChanged	2025-05-17 17:19:16.182
368	29	0	checkpointReached	2025-05-17 17:19:18.067
369	29	1	checkpointReached	2025-05-17 17:19:19.113
370	29	2	checkpointReached	2025-05-17 17:19:19.954
371	29	3	checkpointReached	2025-05-17 17:19:20.626
372	29	3	VariableChanged	2025-05-17 17:19:21.225
373	29	3	VariableChanged	2025-05-17 17:19:26.269
374	29	3	VariableChanged	2025-05-17 17:20:04.242
375	30	0	VariableChanged	2025-05-17 17:20:14.541
376	30	0	checkpointReached	2025-05-17 17:20:26.376
377	30	1	VariableChanged	2025-05-17 17:20:27.532
378	30	1	checkpointReached	2025-05-17 17:20:29.629
379	30	2	checkpointReached	2025-05-17 17:20:30.912
380	30	2	VariableChanged	2025-05-17 17:20:32.568
381	31	0	checkpointReached	2025-05-17 17:21:33.468
382	31	1	VariableChanged	2025-05-17 17:21:34.587
383	31	1	VariableChanged	2025-05-17 17:21:39.618
384	31	1	checkpointReached	2025-05-17 17:21:41.431
385	31	2	VariableChanged	2025-05-17 17:21:44.678
386	31	2	VariableChanged	2025-05-17 17:21:49.738
387	31	2	VariableChanged	2025-05-17 17:21:50.885
388	31	2	VariableChanged	2025-05-17 17:21:51.387
389	31	2	VariableChanged	2025-05-17 17:21:51.953
390	31	2	VariableChanged	2025-05-17 17:21:52.462
391	31	2	VariableChanged	2025-05-17 17:21:53.015
392	31	2	VariableChanged	2025-05-17 17:21:53.597
393	31	2	VariableChanged	2025-05-17 17:21:54.599
394	31	2	VariableChanged	2025-05-17 17:21:57.166
395	31	2	VariableChanged	2025-05-17 17:21:57.675
396	31	2	VariableChanged	2025-05-17 17:21:58.218
397	31	2	VariableChanged	2025-05-17 17:21:58.72
398	31	2	VariableChanged	2025-05-17 17:21:59.224
399	31	2	VariableChanged	2025-05-17 17:21:59.782
400	31	2	VariableChanged	2025-05-17 17:22:00.29
401	31	2	VariableChanged	2025-05-17 17:22:00.796
402	31	2	VariableChanged	2025-05-17 17:22:01.316
403	31	2	VariableChanged	2025-05-17 17:22:01.821
404	31	2	VariableChanged	2025-05-17 17:22:02.332
405	31	2	VariableChanged	2025-05-17 17:22:02.888
406	31	2	VariableChanged	2025-05-17 17:22:03.391
407	31	2	VariableChanged	2025-05-17 17:22:04.435
408	31	2	VariableChanged	2025-05-17 17:22:04.94
409	31	2	checkpointReached	2025-05-17 17:22:05.127
412	32	\N	VariableChanged	2025-05-18 12:08:29.592
413	32	\N	VariableChanged	2025-05-18 12:08:34.587
414	32	\N	VariableChanged	2025-05-18 12:08:39.609
415	32	\N	VariableChanged	2025-05-18 12:08:49.644
416	32	\N	VariableChanged	2025-05-18 12:08:54.661
417	32	\N	VariableChanged	2025-05-18 12:08:59.691
418	32	\N	VariableChanged	2025-05-18 12:09:04.703
419	32	\N	VariableChanged	2025-05-18 12:09:09.724
420	32	\N	VariableChanged	2025-05-18 12:09:14.739
421	32	\N	VariableChanged	2025-05-18 12:09:19.753
422	32	\N	VariableChanged	2025-05-18 12:09:54.367
423	32	\N	VariableChanged	2025-05-18 12:09:59.388
424	32	\N	VariableChanged	2025-05-18 12:10:04.417
425	32	\N	VariableChanged	2025-05-18 12:10:09.433
426	32	\N	VariableChanged	2025-05-18 12:10:14.454
427	32	\N	VariableChanged	2025-05-18 12:10:19.473
428	32	\N	VariableChanged	2025-05-18 12:10:24.492
429	32	\N	VariableChanged	2025-05-18 12:10:29.518
430	32	\N	VariableChanged	2025-05-18 12:10:34.564
431	32	\N	VariableChanged	2025-05-18 12:10:39.549
432	32	\N	VariableChanged	2025-05-18 12:10:49.584
433	32	\N	VariableChanged	2025-05-18 12:10:59.629
434	32	\N	VariableChanged	2025-05-18 12:11:04.639
435	32	\N	VariableChanged	2025-05-18 12:11:09.658
436	32	\N	VariableChanged	2025-05-18 12:11:14.677
437	32	\N	VariableChanged	2025-05-18 12:11:19.697
438	32	\N	VariableChanged	2025-05-18 12:11:24.708
410	31	2	VariableChanged	2025-05-17 17:22:05.965
411	31	2	VariableChanged	2025-05-17 17:22:06.477
439	33	0	VariableChanged	2025-05-18 12:28:50.383
440	33	0	checkpointReached	2025-05-18 12:28:54.114
441	33	1	VariableChanged	2025-05-18 12:28:54.642
442	33	1	VariableChanged	2025-05-18 12:28:55.143
443	33	1	VariableChanged	2025-05-18 12:29:00.169
444	33	1	checkpointReached	2025-05-18 12:29:03.055
445	33	2	VariableChanged	2025-05-18 12:29:05.363
446	33	2	VariableChanged	2025-05-18 12:29:10.482
447	33	2	checkpointReached	2025-05-18 12:29:13.927
448	33	3	VariableChanged	2025-05-18 12:29:16.087
449	33	3	VariableChanged	2025-05-18 12:29:20.103
450	33	3	checkpointReached	2025-05-18 12:29:22.443
451	33	4	VariableChanged	2025-05-18 12:29:25.096
452	33	4	VariableChanged	2025-05-18 12:29:30.121
453	33	4	checkpointReached	2025-05-18 12:29:31.891
454	33	4	VariableChanged	2025-05-18 12:29:34.992
455	34	0	checkpointReached	2025-05-18 13:28:19.182
456	34	1	VariableChanged	2025-05-18 13:28:21.227
457	34	1	VariableChanged	2025-05-18 13:28:26.302
458	34	1	VariableChanged	2025-05-18 13:28:31.321
459	34	1	checkpointReached	2025-05-18 13:28:35.606
461	35	\N	VariableChanged	2025-05-18 13:31:28.859
462	35	\N	VariableChanged	2025-05-18 13:31:33.914
463	35	\N	VariableChanged	2025-05-18 13:31:38.933
464	35	\N	VariableChanged	2025-05-18 13:31:43.481
465	35	\N	VariableChanged	2025-05-18 13:31:48.495
466	35	\N	VariableChanged	2025-05-18 13:31:53.518
467	35	\N	VariableChanged	2025-05-18 13:31:58.534
468	35	\N	VariableChanged	2025-05-18 13:32:03.548
469	35	\N	VariableChanged	2025-05-18 13:32:08.564
470	35	\N	VariableChanged	2025-05-18 13:32:13.579
471	35	\N	VariableChanged	2025-05-18 13:32:18.599
472	35	\N	VariableChanged	2025-05-18 13:32:23.62
473	35	\N	VariableChanged	2025-05-18 13:32:28.647
474	35	\N	VariableChanged	2025-05-18 13:32:33.662
475	35	\N	VariableChanged	2025-05-18 13:32:38.684
476	35	\N	VariableChanged	2025-05-18 13:32:43.699
477	35	\N	VariableChanged	2025-05-18 13:32:48.721
478	35	\N	VariableChanged	2025-05-18 13:32:53.735
479	35	\N	VariableChanged	2025-05-18 13:32:58.758
480	35	\N	VariableChanged	2025-05-18 13:33:03.77
481	35	\N	VariableChanged	2025-05-18 13:33:08.786
482	35	\N	VariableChanged	2025-05-18 13:33:13.798
483	35	\N	VariableChanged	2025-05-18 13:33:18.816
484	35	\N	VariableChanged	2025-05-18 13:33:23.838
485	35	\N	VariableChanged	2025-05-18 13:33:28.859
486	35	\N	VariableChanged	2025-05-18 13:33:33.882
487	35	\N	VariableChanged	2025-05-18 13:33:38.898
488	35	\N	VariableChanged	2025-05-18 13:33:43.914
489	35	\N	VariableChanged	2025-05-18 13:33:48.934
490	35	\N	VariableChanged	2025-05-18 13:33:53.957
491	35	\N	VariableChanged	2025-05-18 13:33:58.975
492	35	\N	VariableChanged	2025-05-18 13:34:03.99
493	35	\N	VariableChanged	2025-05-18 13:34:08.563
494	35	\N	VariableChanged	2025-05-18 13:34:13.586
495	35	\N	VariableChanged	2025-05-18 13:34:18.602
496	35	\N	VariableChanged	2025-05-18 13:34:23.624
497	35	\N	VariableChanged	2025-05-18 13:34:28.639
498	35	\N	VariableChanged	2025-05-18 13:34:33.661
499	35	\N	VariableChanged	2025-05-18 13:34:38.677
500	35	\N	VariableChanged	2025-05-18 13:34:43.692
501	35	\N	VariableChanged	2025-05-18 13:34:48.715
502	35	\N	VariableChanged	2025-05-18 13:34:53.74
503	35	\N	VariableChanged	2025-05-18 13:34:58.758
504	35	\N	VariableChanged	2025-05-18 13:35:03.779
505	35	\N	VariableChanged	2025-05-18 13:35:08.792
506	35	\N	VariableChanged	2025-05-18 13:35:13.811
507	35	\N	VariableChanged	2025-05-18 13:35:18.836
508	35	\N	VariableChanged	2025-05-18 13:35:23.857
509	35	\N	VariableChanged	2025-05-18 13:35:28.871
510	35	\N	VariableChanged	2025-05-18 13:35:33.891
511	35	\N	VariableChanged	2025-05-18 13:35:38.913
512	35	\N	VariableChanged	2025-05-18 13:35:43.928
513	35	\N	VariableChanged	2025-05-18 13:35:48.943
514	35	\N	VariableChanged	2025-05-18 13:35:53.964
515	35	\N	VariableChanged	2025-05-18 13:35:58.974
516	35	\N	VariableChanged	2025-05-18 13:36:03.986
517	35	\N	VariableChanged	2025-05-18 13:36:09.005
518	35	\N	VariableChanged	2025-05-18 13:36:14.028
519	35	\N	VariableChanged	2025-05-18 13:36:19.046
520	35	\N	VariableChanged	2025-05-18 13:36:24.062
521	35	\N	VariableChanged	2025-05-18 13:36:29.079
522	35	\N	VariableChanged	2025-05-18 13:36:34.091
523	35	\N	VariableChanged	2025-05-18 13:36:39.111
524	35	\N	VariableChanged	2025-05-18 13:36:44.129
525	35	\N	VariableChanged	2025-05-18 13:36:48.653
526	35	\N	VariableChanged	2025-05-18 13:36:53.669
527	35	\N	VariableChanged	2025-05-18 13:36:58.692
528	35	\N	Initial	2025-05-18 13:37:17.548
460	34	1	VariableChanged	2025-05-18 13:28:37.027
529	37	0	checkpointReached	2025-05-18 13:46:41.701
530	37	1	checkpointReached	2025-05-18 13:53:28.468
531	38	\N	VariableChanged	2025-05-18 14:08:40.811
532	38	\N	VariableChanged	2025-05-18 14:08:45.822
533	38	\N	VariableChanged	2025-05-18 14:08:50.839
534	38	\N	VariableChanged	2025-05-18 14:08:55.856
535	38	\N	Initial	2025-05-18 14:08:56.011
536	38	\N	VariableChanged	2025-05-18 14:09:00.872
537	38	\N	VariableChanged	2025-05-18 14:09:05.898
538	38	\N	VariableChanged	2025-05-18 14:09:10.924
539	38	\N	VariableChanged	2025-05-18 14:09:15.941
540	38	\N	VariableChanged	2025-05-18 14:09:20.963
541	38	\N	VariableChanged	2025-05-18 14:09:25.98
542	39	\N	Initial	2025-05-18 14:09:41.44
543	39	\N	VariableChanged	2025-05-18 14:09:45.921
544	39	\N	VariableChanged	2025-05-18 14:09:50.951
545	39	\N	VariableChanged	2025-05-18 14:10:06.01
546	39	\N	VariableChanged	2025-05-18 14:10:11.022
547	39	\N	VariableChanged	2025-05-18 14:10:15.546
548	39	\N	VariableChanged	2025-05-18 14:10:20.562
549	39	\N	VariableChanged	2025-05-18 14:10:27.949
550	39	\N	VariableChanged	2025-05-18 14:10:35.662
551	39	\N	VariableChanged	2025-05-18 14:10:40.565
552	39	\N	VariableChanged	2025-05-18 14:10:40.685
553	39	\N	VariableChanged	2025-05-18 14:10:58.326
554	39	\N	VariableChanged	2025-05-18 14:11:03.347
555	39	\N	VariableChanged	2025-05-18 14:11:08.362
556	39	\N	VariableChanged	2025-05-18 14:11:28.425
557	39	\N	VariableChanged	2025-05-18 14:11:43.485
558	39	\N	VariableChanged	2025-05-18 14:11:48.496
559	39	\N	VariableChanged	2025-05-18 14:11:58.531
560	39	\N	VariableChanged	2025-05-18 14:12:08.57
561	39	\N	VariableChanged	2025-05-18 14:12:13.589
562	39	\N	VariableChanged	2025-05-18 14:12:18.605
563	39	\N	VariableChanged	2025-05-18 14:12:23.619
564	39	\N	VariableChanged	2025-05-18 14:12:28.646
565	39	\N	VariableChanged	2025-05-18 14:12:33.662
566	39	\N	VariableChanged	2025-05-18 14:12:38.677
567	39	\N	Initial	2025-05-18 14:12:43.508
568	39	\N	VariableChanged	2025-05-18 14:12:48.729
569	39	\N	VariableChanged	2025-05-18 14:12:53.74
570	39	\N	VariableChanged	2025-05-18 14:13:08.794
571	39	\N	VariableChanged	2025-05-18 14:13:33.873
572	39	\N	VariableChanged	2025-05-18 14:13:38.403
573	39	\N	VariableChanged	2025-05-18 14:13:43.423
574	39	\N	VariableChanged	2025-05-18 14:14:03.512
575	39	\N	VariableChanged	2025-05-18 14:14:05.395
576	39	\N	VariableChanged	2025-05-18 14:14:36.575
577	39	\N	VariableChanged	2025-05-18 14:14:41.586
578	39	\N	VariableChanged	2025-05-18 14:14:46.606
579	39	\N	VariableChanged	2025-05-18 14:14:51.62
580	39	\N	VariableChanged	2025-05-18 14:14:56.643
581	39	\N	Initial	2025-05-18 14:15:34.616
582	40	\N	Initial	2025-05-18 14:17:53.42
583	40	\N	VariableChanged	2025-05-18 14:18:39.693
584	40	\N	VariableChanged	2025-05-18 14:19:23.39
585	40	\N	VariableChanged	2025-05-18 14:19:37.779
586	40	\N	VariableChanged	2025-05-18 14:19:39.884
587	40	\N	VariableChanged	2025-05-18 14:19:44.427
588	40	\N	Initial	2025-05-18 14:20:06.071
589	41	0	Initial	2025-05-18 14:20:19.116
590	41	0	checkpointReached	2025-05-18 14:20:20.215
591	41	1	Initial	2025-05-18 14:20:21.736
592	41	1	VariableChanged	2025-05-18 14:20:23.232
593	41	1	checkpointReached	2025-05-18 14:20:27
594	41	2	VariableChanged	2025-05-18 14:20:28.502
595	41	2	VariableChanged	2025-05-18 14:20:33.039
596	41	2	checkpointReached	2025-05-18 14:20:36.246
597	41	2	VariableChanged	2025-05-18 14:20:37.881
598	41	2	VariableChanged	2025-05-18 14:20:38.395
599	42	0	Initial	2025-05-18 14:20:52.033
600	42	0	checkpointReached	2025-05-18 14:20:53.263
601	42	1	Initial	2025-05-18 14:20:54.888
602	42	1	VariableChanged	2025-05-18 14:20:56.372
603	42	1	checkpointReached	2025-05-18 14:20:59.773
604	42	2	VariableChanged	2025-05-18 14:21:01.774
605	42	2	VariableChanged	2025-05-18 14:21:06.286
606	42	2	checkpointReached	2025-05-18 14:21:10.431
607	42	2	VariableChanged	2025-05-18 14:21:12.399
608	43	0	checkpointReached	2025-05-18 14:33:54.074
609	43	1	Initial	2025-05-18 14:33:55.675
610	43	1	VariableChanged	2025-05-18 14:33:57.162
611	43	1	checkpointReached	2025-05-18 14:34:01.459
612	43	2	VariableChanged	2025-05-18 14:34:07.936
613	43	2	VariableChanged	2025-05-18 14:34:11.953
614	43	2	checkpointReached	2025-05-18 14:34:16.582
615	43	3	VariableChanged	2025-05-18 14:34:18.28
616	43	3	VariableChanged	2025-05-18 14:34:22.3
617	43	3	checkpointReached	2025-05-18 14:34:27.188
618	43	3	VariableChanged	2025-05-18 14:34:30.278
619	43	3	Initial	2025-05-18 14:33:52.707
620	44	0	Initial	2025-05-18 14:52:49.275
621	44	0	checkpointReached	2025-05-18 14:52:50.237
622	44	1	Initial	2025-05-18 14:52:51.775
623	44	1	VariableChanged	2025-05-18 14:52:53.255
624	44	1	checkpointReached	2025-05-18 14:52:58.046
625	44	2	VariableChanged	2025-05-18 14:52:59.944
626	44	2	VariableChanged	2025-05-18 14:53:03.457
627	44	2	checkpointReached	2025-05-18 14:53:08.718
628	44	3	VariableChanged	2025-05-18 14:53:11.887
629	44	3	VariableChanged	2025-05-18 14:53:13.396
630	44	3	VariableChanged	2025-05-18 14:53:18.415
631	44	3	checkpointReached	2025-05-18 14:53:20.043
632	44	4	VariableChanged	2025-05-18 14:53:25.226
633	44	4	VariableChanged	2025-05-18 14:53:28.246
634	44	4	checkpointReached	2025-05-18 14:53:32.897
635	44	5	VariableChanged	2025-05-18 14:53:34.557
636	44	5	VariableChanged	2025-05-18 14:53:38.581
637	44	5	checkpointReached	2025-05-18 14:53:42.463
638	44	5	VariableChanged	2025-05-18 14:53:44.583
639	45	0	Initial	2025-05-18 15:36:46.882
640	45	0	VariableChanged	2025-05-18 15:36:50.857
641	45	0	checkpointReached	2025-05-18 15:36:53.092
642	45	1	Initial	2025-05-18 15:36:54.664
643	45	1	VariableChanged	2025-05-18 15:36:56.152
644	45	1	checkpointReached	2025-05-18 15:36:58.547
645	45	2	VariableChanged	2025-05-18 15:37:00.453
646	45	2	VariableChanged	2025-05-18 15:37:00.944
647	45	2	VariableChanged	2025-05-18 15:37:05.967
648	45	2	checkpointReached	2025-05-18 15:37:09.264
649	45	3	VariableChanged	2025-05-18 15:37:10.72
650	45	3	VariableChanged	2025-05-18 15:37:11.221
651	45	3	VariableChanged	2025-05-18 15:37:16.244
652	45	3	checkpointReached	2025-05-18 15:37:18.152
653	45	4	VariableChanged	2025-05-18 15:37:19.541
654	45	4	VariableChanged	2025-05-18 15:37:20.945
655	45	4	checkpointReached	2025-05-18 15:37:25.546
657	46	\N	Initial	2025-05-19 00:15:08.627
658	46	\N	VariableChanged	2025-05-19 00:15:26.98
659	46	\N	VariableChanged	2025-05-19 00:15:27.495
660	46	\N	VariableChanged	2025-05-19 00:15:32.711
661	46	\N	VariableChanged	2025-05-19 00:15:37.43
662	46	\N	VariableChanged	2025-05-19 00:15:42.907
663	46	\N	VariableChanged	2025-05-19 00:15:47.81
664	46	\N	VariableChanged	2025-05-19 00:15:52.947
665	46	\N	VariableChanged	2025-05-19 00:15:57.635
666	47	\N	Initial	2025-05-19 00:22:25.517
667	47	\N	Initial	2025-05-19 00:22:25.527
668	47	\N	VariableChanged	2025-05-19 00:27:06.251
669	47	\N	VariableChanged	2025-05-19 00:27:06.254
670	47	\N	VariableChanged	2025-05-19 00:27:11.751
671	47	\N	VariableChanged	2025-05-19 00:27:11.776
656	45	4	VariableChanged	2025-05-18 15:37:27.621
672	49	0	checkpointReached	2025-05-19 00:28:34.858
673	50	0	checkpointReached	2025-05-19 00:29:44.452
674	50	1	checkpointReached	2025-05-19 00:30:11.591
675	50	2	Initial	2025-05-19 00:30:13.787
676	50	2	Initial	2025-05-19 00:30:13.791
677	50	2	VariableChanged	2025-05-19 00:30:16.506
678	50	2	VariableChanged	2025-05-19 00:30:16.509
679	50	2	VariableChanged	2025-05-19 00:30:21.475
680	50	2	VariableChanged	2025-05-19 00:30:21.478
681	50	2	VariableChanged	2025-05-19 00:30:26.567
682	50	2	VariableChanged	2025-05-19 00:30:26.569
683	50	2	VariableChanged	2025-05-19 00:30:31.694
684	50	2	VariableChanged	2025-05-19 00:30:31.697
685	50	2	VariableChanged	2025-05-19 00:30:36.098
686	50	2	VariableChanged	2025-05-19 00:30:36.1
687	50	2	VariableChanged	2025-05-19 00:30:36.692
688	50	2	VariableChanged	2025-05-19 00:30:36.694
689	50	2	VariableChanged	2025-05-19 00:30:41.836
690	50	2	VariableChanged	2025-05-19 00:30:41.838
691	50	2	VariableChanged	2025-05-19 00:30:46.586
692	50	2	VariableChanged	2025-05-19 00:30:46.588
693	50	2	VariableChanged	2025-05-19 00:30:51.657
694	50	2	VariableChanged	2025-05-19 00:30:51.659
695	50	2	VariableChanged	2025-05-19 00:30:56.767
696	50	2	VariableChanged	2025-05-19 00:30:56.77
697	50	2	checkpointReached	2025-05-19 00:30:57.594
698	50	3	VariableChanged	2025-05-19 00:31:02.215
699	50	3	VariableChanged	2025-05-19 00:31:02.219
700	50	3	VariableChanged	2025-05-19 00:31:07.065
701	50	3	VariableChanged	2025-05-19 00:31:07.067
702	50	3	VariableChanged	2025-05-19 00:31:12.053
703	50	3	VariableChanged	2025-05-19 00:31:12.055
704	50	3	VariableChanged	2025-05-19 00:31:16.873
705	50	3	VariableChanged	2025-05-19 00:31:16.875
706	50	3	VariableChanged	2025-05-19 00:31:21.936
707	50	3	VariableChanged	2025-05-19 00:31:21.938
708	50	3	VariableChanged	2025-05-19 00:31:27.182
709	50	3	VariableChanged	2025-05-19 00:31:27.186
710	50	3	checkpointReached	2025-05-19 00:31:31.257
711	50	3	VariableChanged	2025-05-19 00:31:32.427
712	50	3	VariableChanged	2025-05-19 00:31:32.43
713	50	3	VariableChanged	2025-05-19 00:31:37.414
714	50	3	VariableChanged	2025-05-19 00:31:37.416
715	50	3	VariableChanged	2025-05-19 00:31:42.131
716	50	3	VariableChanged	2025-05-19 00:31:42.133
717	50	3	VariableChanged	2025-05-19 00:31:47.259
718	50	3	VariableChanged	2025-05-19 00:31:47.266
719	50	3	VariableChanged	2025-05-19 00:31:52.533
720	50	3	VariableChanged	2025-05-19 00:31:52.535
721	50	3	VariableChanged	2025-05-19 00:31:57.604
722	50	3	VariableChanged	2025-05-19 00:31:57.608
723	50	3	VariableChanged	2025-05-19 00:31:59.35
724	50	3	VariableChanged	2025-05-19 00:31:59.352
725	50	3	VariableChanged	2025-05-19 00:32:02.518
726	50	3	VariableChanged	2025-05-19 00:32:02.521
727	50	3	VariableChanged	2025-05-19 00:32:07.365
728	50	3	VariableChanged	2025-05-19 00:32:07.367
729	50	3	VariableChanged	2025-05-19 00:32:12.466
730	50	3	VariableChanged	2025-05-19 00:32:12.469
731	51	0	VariableChanged	2025-05-19 00:32:38.185
732	51	0	VariableChanged	2025-05-19 00:32:43.494
733	51	0	VariableChanged	2025-05-19 00:32:48.485
734	51	0	VariableChanged	2025-05-19 00:32:53.564
735	51	0	VariableChanged	2025-05-19 00:32:58.513
736	51	0	checkpointReached	2025-05-19 00:33:00.073
737	51	1	VariableChanged	2025-05-19 00:33:03.485
738	51	1	VariableChanged	2025-05-19 00:33:08.442
739	51	1	VariableChanged	2025-05-19 00:33:13.322
740	51	1	VariableChanged	2025-05-19 00:33:18.345
741	51	1	VariableChanged	2025-05-19 00:33:23.506
742	51	1	VariableChanged	2025-05-19 00:33:26.786
743	51	1	VariableChanged	2025-05-19 00:33:28.438
744	51	1	VariableChanged	2025-05-19 00:33:33.747
745	51	1	VariableChanged	2025-05-19 00:33:38.77
746	51	1	VariableChanged	2025-05-19 00:33:43.821
747	51	1	VariableChanged	2025-05-19 00:33:48.805
748	51	1	VariableChanged	2025-05-19 00:33:53.909
749	51	1	VariableChanged	2025-05-19 00:33:58.818
750	51	1	VariableChanged	2025-05-19 00:34:04.035
751	51	1	VariableChanged	2025-05-19 00:34:09.236
752	51	1	VariableChanged	2025-05-19 00:34:14.287
753	51	1	VariableChanged	2025-05-19 00:34:19.034
754	51	1	VariableChanged	2025-05-19 00:34:24.26
755	51	1	VariableChanged	2025-05-19 00:34:29.219
756	51	1	VariableChanged	2025-05-19 00:34:34.338
757	51	1	VariableChanged	2025-05-19 00:34:39.411
758	51	1	VariableChanged	2025-05-19 00:34:44.362
759	51	1	VariableChanged	2025-05-19 00:34:49.415
760	51	1	VariableChanged	2025-05-19 00:34:54.541
761	51	1	VariableChanged	2025-05-19 00:34:59.543
762	51	1	VariableChanged	2025-05-19 00:35:05.013
763	51	1	VariableChanged	2025-05-19 00:35:09.882
764	51	1	VariableChanged	2025-05-19 00:35:15.147
765	51	1	VariableChanged	2025-05-19 00:35:19.853
766	51	1	VariableChanged	2025-05-19 00:35:25.356
767	51	1	VariableChanged	2025-05-19 00:35:30.304
768	51	1	VariableChanged	2025-05-19 00:35:35.088
769	51	1	VariableChanged	2025-05-19 00:35:40.319
770	51	1	VariableChanged	2025-05-19 00:35:45.352
771	51	1	VariableChanged	2025-05-19 00:35:50.622
772	51	1	VariableChanged	2025-05-19 00:35:55.514
773	51	1	VariableChanged	2025-05-19 00:36:00.48
774	51	1	VariableChanged	2025-05-19 00:36:05.513
775	51	1	VariableChanged	2025-05-19 00:36:10.739
776	51	1	VariableChanged	2025-05-19 00:36:15.893
777	51	1	VariableChanged	2025-05-19 00:36:20.944
778	51	1	VariableChanged	2025-05-19 00:36:26.034
779	51	1	VariableChanged	2025-05-19 00:36:31.095
780	51	1	VariableChanged	2025-05-19 00:36:36.31
781	51	1	VariableChanged	2025-05-19 00:36:41.253
782	51	1	VariableChanged	2025-05-19 00:36:46.136
783	51	1	VariableChanged	2025-05-19 00:36:51.176
784	51	1	VariableChanged	2025-05-19 00:36:56.064
785	51	1	VariableChanged	2025-05-19 00:37:01.556
786	51	1	VariableChanged	2025-05-19 00:37:06.536
787	51	1	VariableChanged	2025-05-19 00:37:11.578
788	51	1	VariableChanged	2025-05-19 00:37:16.498
789	51	1	VariableChanged	2025-05-19 00:37:21.525
790	51	1	VariableChanged	2025-05-19 00:37:26.493
791	51	1	VariableChanged	2025-05-19 00:37:31.472
792	51	1	VariableChanged	2025-05-19 00:37:36.569
793	51	1	VariableChanged	2025-05-19 00:37:41.775
794	51	1	VariableChanged	2025-05-19 00:37:47.113
795	51	1	VariableChanged	2025-05-19 00:37:52.255
796	51	1	VariableChanged	2025-05-19 00:37:56.943
797	51	1	VariableChanged	2025-05-19 00:38:01.925
798	51	1	VariableChanged	2025-05-19 00:38:07.089
799	51	1	VariableChanged	2025-05-19 00:38:12.076
800	51	1	VariableChanged	2025-05-19 00:38:17.582
801	51	1	VariableChanged	2025-05-19 00:38:22.458
802	51	1	VariableChanged	2025-05-19 00:38:27.364
803	51	1	VariableChanged	2025-05-19 00:38:32.375
804	51	1	VariableChanged	2025-05-19 00:38:37.381
805	51	1	VariableChanged	2025-05-19 00:38:42.43
806	51	1	VariableChanged	2025-05-19 00:38:47.718
807	51	1	VariableChanged	2025-05-19 00:38:52.655
808	51	1	VariableChanged	2025-05-19 00:38:57.515
809	51	1	VariableChanged	2025-05-19 00:39:03.005
810	51	1	VariableChanged	2025-05-19 00:39:07.931
811	51	1	VariableChanged	2025-05-19 00:39:12.715
812	51	1	VariableChanged	2025-05-19 00:39:18.479
813	51	1	VariableChanged	2025-05-19 00:39:23.275
814	51	1	VariableChanged	2025-05-19 00:39:28.253
815	51	1	VariableChanged	2025-05-19 00:39:33.692
816	51	1	checkpointReached	2025-05-19 00:39:33.964
817	51	2	VariableChanged	2025-05-19 00:40:21.45
818	51	2	VariableChanged	2025-05-19 00:40:26.354
819	51	2	VariableChanged	2025-05-19 00:40:31.47
820	51	2	checkpointReached	2025-05-19 00:40:37.687
821	51	3	VariableChanged	2025-05-19 00:40:38.304
822	51	3	VariableChanged	2025-05-19 00:40:43.266
823	51	3	VariableChanged	2025-05-19 00:40:49.136
824	51	3	VariableChanged	2025-05-19 00:40:54.745
825	51	3	VariableChanged	2025-05-19 00:41:02.608
826	51	3	VariableChanged	2025-05-19 00:41:04.555
827	51	3	checkpointReached	2025-05-19 00:41:05.976
828	51	4	checkpointReached	2025-05-19 00:41:05.983
829	51	5	VariableChanged	2025-05-19 00:41:09.336
830	51	5	VariableChanged	2025-05-19 00:41:11.684
831	51	5	VariableChanged	2025-05-19 00:41:14.444
832	51	5	VariableChanged	2025-05-19 00:41:19.346
833	51	5	checkpointReached	2025-05-19 00:41:24.254
834	51	6	VariableChanged	2025-05-19 00:41:24.516
835	51	6	VariableChanged	2025-05-19 00:41:33.174
836	51	6	VariableChanged	2025-05-19 00:41:35.239
837	51	6	checkpointReached	2025-05-19 00:41:41.155
838	51	7	VariableChanged	2025-05-19 00:41:41.547
839	51	7	VariableChanged	2025-05-19 00:41:46.598
840	51	7	VariableChanged	2025-05-19 00:41:51.492
841	51	7	checkpointReached	2025-05-19 00:41:52.78
842	51	8	checkpointReached	2025-05-19 00:42:05.281
843	51	9	VariableChanged	2025-05-19 00:42:05.987
844	51	9	VariableChanged	2025-05-19 00:42:10.548
845	51	9	VariableChanged	2025-05-19 00:42:15.612
846	51	9	VariableChanged	2025-05-19 00:42:20.619
847	51	9	checkpointReached	2025-05-19 00:42:33.745
848	51	10	VariableChanged	2025-05-19 00:42:34.251
849	51	10	checkpointReached	2025-05-19 00:43:16.434
850	51	11	checkpointReached	2025-05-19 00:43:33.296
851	51	12	checkpointReached	2025-05-19 00:43:39.214
852	51	13	checkpointReached	2025-05-19 00:43:49.318
853	51	14	Initial	2025-05-19 00:44:07.892
854	51	14	VariableChanged	2025-05-19 00:44:10.614
855	51	14	VariableChanged	2025-05-19 00:44:15.642
856	51	14	VariableChanged	2025-05-19 00:44:16.683
857	51	14	VariableChanged	2025-05-19 00:44:20.521
858	51	14	VariableChanged	2025-05-19 00:44:25.46
859	51	14	VariableChanged	2025-05-19 00:44:30.863
860	51	14	VariableChanged	2025-05-19 00:44:35.86
861	51	14	VariableChanged	2025-05-19 00:44:40.506
862	51	14	VariableChanged	2025-05-19 00:44:45.954
863	51	14	VariableChanged	2025-05-19 00:44:51.049
864	51	14	VariableChanged	2025-05-19 00:44:55.913
865	51	14	VariableChanged	2025-05-19 00:45:00.927
866	51	14	VariableChanged	2025-05-19 00:45:06.061
867	51	14	VariableChanged	2025-05-19 00:45:11.133
868	51	14	VariableChanged	2025-05-19 00:45:16.044
869	51	14	VariableChanged	2025-05-19 00:45:20.894
870	51	14	VariableChanged	2025-05-19 00:45:25.969
871	51	14	VariableChanged	2025-05-19 00:45:31.237
872	51	14	VariableChanged	2025-05-19 00:45:36.47
873	51	14	checkpointReached	2025-05-19 00:46:22.908
874	51	15	VariableChanged	2025-05-19 00:46:23.115
875	51	15	VariableChanged	2025-05-19 00:46:49.036
876	51	15	VariableChanged	2025-05-19 00:46:54.065
877	51	15	VariableChanged	2025-05-19 00:46:58.998
878	51	15	checkpointReached	2025-05-19 00:47:33.219
879	52	0	checkpointReached	2025-05-19 00:50:51.021
880	52	1	checkpointReached	2025-05-19 00:51:13.358
881	52	2	checkpointReached	2025-05-19 00:51:16.431
882	52	3	checkpointReached	2025-05-19 00:51:26.25
883	52	3	Initial	2025-05-19 00:51:41.172
884	52	3	Initial	2025-05-19 00:51:41.178
885	52	3	VariableChanged	2025-05-19 00:51:43.311
886	52	3	VariableChanged	2025-05-19 00:51:43.315
887	52	3	VariableChanged	2025-05-19 00:51:48.361
888	52	3	VariableChanged	2025-05-19 00:51:48.364
889	52	3	VariableChanged	2025-05-19 00:51:52.21
890	52	3	VariableChanged	2025-05-19 00:51:52.211
891	52	3	VariableChanged	2025-05-19 00:51:53.369
892	52	3	VariableChanged	2025-05-19 00:51:53.371
893	52	3	VariableChanged	2025-05-19 00:51:58.471
894	52	3	VariableChanged	2025-05-19 00:51:58.472
895	52	3	VariableChanged	2025-05-19 00:52:02.505
896	52	3	VariableChanged	2025-05-19 00:52:02.506
897	52	3	VariableChanged	2025-05-19 00:52:03.521
898	52	3	VariableChanged	2025-05-19 00:52:03.523
899	52	3	VariableChanged	2025-05-19 00:52:08.692
900	52	3	VariableChanged	2025-05-19 00:52:08.695
901	53	0	VariableChanged	2025-05-19 01:04:11.766
902	53	0	VariableChanged	2025-05-19 01:04:18.04
903	53	0	VariableChanged	2025-05-19 01:04:21.192
904	53	0	VariableChanged	2025-05-19 01:04:26.055
905	53	0	VariableChanged	2025-05-19 01:05:54.74
906	53	0	VariableChanged	2025-05-19 01:06:01.146
907	53	0	VariableChanged	2025-05-19 01:06:05.799
908	53	0	checkpointReached	2025-05-19 01:06:07.06
909	53	0	VariableChanged	2025-05-19 01:06:10.963
910	53	0	VariableChanged	2025-05-19 01:06:15.707
911	53	0	VariableChanged	2025-05-19 01:06:22.061
912	53	0	VariableChanged	2025-05-19 01:06:26.176
913	53	0	VariableChanged	2025-05-19 01:06:31.245
914	53	0	VariableChanged	2025-05-19 01:06:32.935
915	53	0	VariableChanged	2025-05-19 01:06:36.106
916	53	0	VariableChanged	2025-05-19 01:06:41.034
917	53	0	VariableChanged	2025-05-19 01:06:46.069
918	53	0	VariableChanged	2025-05-19 01:06:51.271
919	53	0	VariableChanged	2025-05-19 01:06:56.437
920	53	0	VariableChanged	2025-05-19 01:07:01.385
921	53	0	VariableChanged	2025-05-19 01:07:06.64
922	54	0	VariableChanged	2025-05-19 01:07:26.666
923	54	0	VariableChanged	2025-05-19 01:07:31.872
924	54	0	checkpointReached	2025-05-19 01:09:18.563
925	54	1	checkpointReached	2025-05-19 01:09:33.995
926	54	2	checkpointReached	2025-05-19 01:09:35.572
927	54	3	checkpointReached	2025-05-19 01:09:43.27
928	54	4	checkpointReached	2025-05-19 01:11:12.102
929	54	5	Initial	2025-05-19 01:11:13.616
930	54	5	VariableChanged	2025-05-19 01:11:17.465
931	54	5	VariableChanged	2025-05-19 01:11:18.662
932	54	5	VariableChanged	2025-05-19 01:11:22.515
933	54	5	VariableChanged	2025-05-19 01:11:26.469
934	54	5	VariableChanged	2025-05-19 01:11:27.555
935	54	5	VariableChanged	2025-05-19 01:11:32.596
936	54	5	VariableChanged	2025-05-19 01:11:37.678
937	54	5	VariableChanged	2025-05-19 01:11:38.252
938	54	5	VariableChanged	2025-05-19 01:11:42.838
939	54	5	VariableChanged	2025-05-19 01:11:47.788
940	54	5	VariableChanged	2025-05-19 01:11:53.026
941	54	5	VariableChanged	2025-05-19 01:11:58.026
942	54	5	VariableChanged	2025-05-19 01:12:03.007
943	54	5	checkpointReached	2025-05-19 01:12:10.17
944	54	5	VariableChanged	2025-05-19 01:12:11.204
945	54	5	VariableChanged	2025-05-19 01:12:15.913
946	54	5	VariableChanged	2025-05-19 01:12:20.615
947	54	5	VariableChanged	2025-05-19 01:12:26
948	55	0	checkpointReached	2025-05-19 02:20:13.432
949	55	1	checkpointReached	2025-05-19 02:20:18.404
950	55	2	checkpointReached	2025-05-19 02:20:19.799
951	55	3	checkpointReached	2025-05-19 02:20:26.569
952	55	4	Initial	2025-05-19 02:20:35.47
953	55	4	checkpointReached	2025-05-19 02:20:38.045
954	55	5	VariableChanged	2025-05-19 02:20:39.195
955	55	5	VariableChanged	2025-05-19 02:20:40.349
956	55	5	VariableChanged	2025-05-19 02:20:45.387
957	55	5	checkpointReached	2025-05-19 02:20:45.387
958	55	6	VariableChanged	2025-05-19 02:20:48.633
959	55	6	VariableChanged	2025-05-19 02:20:50.405
960	55	6	checkpointReached	2025-05-19 02:20:50.924
961	55	7	checkpointReached	2025-05-19 02:20:53.557
962	55	8	VariableChanged	2025-05-19 02:20:55.417
963	55	8	VariableChanged	2025-05-19 02:21:00.866
964	55	8	checkpointReached	2025-05-19 02:21:01.02
965	55	9	VariableChanged	2025-05-19 02:21:05.876
966	55	9	checkpointReached	2025-05-19 02:21:06.194
967	55	10	VariableChanged	2025-05-19 02:21:10.902
968	55	10	VariableChanged	2025-05-19 02:21:12.469
969	55	10	VariableChanged	2025-05-19 02:21:15.169
970	55	10	VariableChanged	2025-05-19 02:21:15.692
971	55	10	VariableChanged	2025-05-19 02:21:20.706
972	55	10	checkpointReached	2025-05-19 02:21:23.372
973	55	11	VariableChanged	2025-05-19 02:21:25.66
974	55	11	VariableChanged	2025-05-19 02:21:30.753
975	55	11	checkpointReached	2025-05-19 02:21:35.585
976	55	11	VariableChanged	2025-05-19 02:21:36.233
977	55	11	VariableChanged	2025-05-19 02:21:41.254
978	56	0	VariableChanged	2025-05-19 02:26:00.891
979	56	0	checkpointReached	2025-05-19 02:26:14.404
980	56	1	checkpointReached	2025-05-19 02:26:19.148
981	56	2	checkpointReached	2025-05-19 02:26:20.611
982	56	3	checkpointReached	2025-05-19 02:26:27.817
983	56	4	checkpointReached	2025-05-19 02:26:32.945
984	56	5	Initial	2025-05-19 02:26:38.445
985	56	5	checkpointReached	2025-05-19 02:26:40.426
986	56	6	VariableChanged	2025-05-19 02:26:41.505
987	56	6	VariableChanged	2025-05-19 02:26:42.079
988	56	6	checkpointReached	2025-05-19 02:26:46.153
989	56	7	VariableChanged	2025-05-19 02:26:46.715
990	56	7	checkpointReached	2025-05-19 02:26:48.658
991	56	8	checkpointReached	2025-05-19 02:26:48.728
992	56	9	VariableChanged	2025-05-19 02:26:49.599
993	56	9	VariableChanged	2025-05-19 02:26:51.714
994	56	9	checkpointReached	2025-05-19 02:26:54.711
995	56	10	VariableChanged	2025-05-19 02:26:56.568
996	56	10	checkpointReached	2025-05-19 02:26:59.168
997	56	11	VariableChanged	2025-05-19 02:27:01.476
998	56	11	VariableChanged	2025-05-19 02:27:06.891
999	56	11	VariableChanged	2025-05-19 02:27:08.035
1000	56	11	checkpointReached	2025-05-19 02:27:08.37
1001	56	12	checkpointReached	2025-05-19 02:27:08.468
1002	56	13	VariableChanged	2025-05-19 02:27:10.764
1003	56	13	VariableChanged	2025-05-19 02:27:11.801
1004	56	13	VariableChanged	2025-05-19 02:27:16.649
1005	56	13	checkpointReached	2025-05-19 02:27:19.245
1006	57	0	checkpointReached	2025-05-19 02:50:22.599
1007	57	1	checkpointReached	2025-05-19 02:50:31.053
1008	57	2	checkpointReached	2025-05-19 02:50:33.931
1009	57	3	checkpointReached	2025-05-19 02:50:41.327
1010	57	4	Initial	2025-05-19 02:50:44.774
1011	57	4	checkpointReached	2025-05-19 02:50:47.848
1012	57	4	VariableChanged	2025-05-19 02:50:49.566
1013	57	4	VariableChanged	2025-05-19 02:50:51.881
1014	57	4	VariableChanged	2025-05-19 02:50:55.062
1015	58	0	checkpointReached	2025-05-19 02:52:22.735
1016	58	1	checkpointReached	2025-05-19 02:52:39.991
1017	58	2	checkpointReached	2025-05-19 02:52:45.586
1018	58	3	Initial	2025-05-19 02:52:54.615
1019	58	3	Initial	2025-05-19 02:52:54.617
1020	58	3	VariableChanged	2025-05-19 02:52:55.138
1021	58	3	VariableChanged	2025-05-19 02:52:55.139
1022	58	3	VariableChanged	2025-05-19 02:52:59.678
1023	58	3	VariableChanged	2025-05-19 02:52:59.679
1024	58	3	VariableChanged	2025-05-19 02:53:00.79
1025	58	3	VariableChanged	2025-05-19 02:53:00.79
1026	58	3	checkpointReached	2025-05-19 02:53:02.027
1027	58	3	VariableChanged	2025-05-19 02:53:05.192
1028	58	3	VariableChanged	2025-05-19 02:53:05.194
1029	59	0	VariableChanged	2025-05-19 02:54:27.261
1030	59	0	checkpointReached	2025-05-19 02:54:36.722
1031	59	1	checkpointReached	2025-05-19 02:54:49.502
1032	59	2	checkpointReached	2025-05-19 02:54:56.799
1033	59	3	checkpointReached	2025-05-19 02:55:03.916
1034	59	4	checkpointReached	2025-05-19 02:55:09.019
1035	59	5	Initial	2025-05-19 02:55:09.305
1036	59	5	VariableChanged	2025-05-19 02:55:09.614
1037	59	5	VariableChanged	2025-05-19 02:55:13.4
1038	59	5	VariableChanged	2025-05-19 02:55:14.536
1039	59	5	checkpointReached	2025-05-19 02:55:15.177
1040	59	6	VariableChanged	2025-05-19 02:55:19.479
1041	59	6	checkpointReached	2025-05-19 02:55:20.454
1042	59	7	checkpointReached	2025-05-19 02:55:22.391
1043	59	8	checkpointReached	2025-05-19 02:55:22.733
1044	59	9	VariableChanged	2025-05-19 02:55:24.815
1045	59	9	VariableChanged	2025-05-19 02:55:25.836
1046	59	9	checkpointReached	2025-05-19 02:55:28.624
1047	59	9	VariableChanged	2025-05-19 02:55:29.684
1048	59	9	VariableChanged	2025-05-19 02:55:34.661
1049	60	0	checkpointReached	2025-05-19 02:57:14.626
1050	60	1	checkpointReached	2025-05-19 02:57:19.384
1051	60	2	checkpointReached	2025-05-19 02:57:22.201
1052	60	3	checkpointReached	2025-05-19 02:57:25.954
1053	60	4	checkpointReached	2025-05-19 02:57:32.869
1054	60	5	Initial	2025-05-19 02:57:36.854
1055	60	5	VariableChanged	2025-05-19 02:57:40.247
1056	60	5	VariableChanged	2025-05-19 02:57:41.892
1057	60	5	checkpointReached	2025-05-19 02:57:43.498
1058	60	6	VariableChanged	2025-05-19 02:57:46.855
1059	60	6	VariableChanged	2025-05-19 02:57:47.974
1060	60	6	VariableChanged	2025-05-19 02:57:51.844
1061	60	6	VariableChanged	2025-05-19 02:57:56.703
1062	60	6	checkpointReached	2025-05-19 02:58:00.245
1063	60	7	VariableChanged	2025-05-19 02:58:01.737
1064	60	7	VariableChanged	2025-05-19 02:58:06.703
1065	60	7	checkpointReached	2025-05-19 02:58:08.513
1066	60	8	VariableChanged	2025-05-19 02:58:12.189
1067	60	8	checkpointReached	2025-05-19 02:58:13.203
1068	60	9	VariableChanged	2025-05-19 02:58:16.876
1069	60	9	checkpointReached	2025-05-19 02:58:17.872
1070	60	10	VariableChanged	2025-05-19 02:58:21.893
1071	60	10	VariableChanged	2025-05-19 02:58:27.062
1072	60	10	checkpointReached	2025-05-19 02:58:28.156
1073	60	10	VariableChanged	2025-05-19 02:58:30.705
1074	60	10	VariableChanged	2025-05-19 02:58:32.32
1075	60	10	VariableChanged	2025-05-19 02:58:37.048
1076	61	0	checkpointReached	2025-05-19 03:05:24.99
1077	61	1	checkpointReached	2025-05-19 03:05:31.27
1078	61	2	checkpointReached	2025-05-19 03:05:33.735
1079	61	3	checkpointReached	2025-05-19 03:05:44.684
1080	61	4	Initial	2025-05-19 03:05:47.604
1081	61	4	checkpointReached	2025-05-19 03:05:50.457
1082	61	5	VariableChanged	2025-05-19 03:05:52.344
1083	61	5	VariableChanged	2025-05-19 03:05:52.591
1084	61	5	VariableChanged	2025-05-19 03:05:57.103
1085	61	5	checkpointReached	2025-05-19 03:06:00.865
1086	61	6	VariableChanged	2025-05-19 03:06:02.65
1087	61	6	VariableChanged	2025-05-19 03:06:06.596
1088	61	6	VariableChanged	2025-05-19 03:06:07.173
1089	61	6	VariableChanged	2025-05-19 03:06:12.678
1090	61	6	VariableChanged	2025-05-19 03:06:17.679
1091	61	6	checkpointReached	2025-05-19 03:06:18.577
1092	61	7	VariableChanged	2025-05-19 03:06:22.658
1093	61	7	checkpointReached	2025-05-19 03:06:26.476
1094	61	8	VariableChanged	2025-05-19 03:06:28.393
1095	61	8	checkpointReached	2025-05-19 03:06:31.589
1096	61	9	VariableChanged	2025-05-19 03:06:33.86
1097	61	9	checkpointReached	2025-05-19 03:06:37.306
1098	61	10	VariableChanged	2025-05-19 03:06:39.465
1099	61	10	VariableChanged	2025-05-19 03:06:40.609
1100	61	10	VariableChanged	2025-05-19 03:06:42.639
1101	61	10	VariableChanged	2025-05-19 03:06:47.665
1102	61	10	VariableChanged	2025-05-19 03:06:48.751
1103	61	10	VariableChanged	2025-05-19 03:06:52.458
1104	61	10	VariableChanged	2025-05-19 03:06:57.946
1105	61	10	checkpointReached	2025-05-19 03:06:59.385
1106	61	11	VariableChanged	2025-05-19 03:07:02.935
1107	61	11	VariableChanged	2025-05-19 03:07:07.568
1108	61	11	VariableChanged	2025-05-19 03:07:12.888
1109	61	11	VariableChanged	2025-05-19 03:07:17.601
1110	61	11	VariableChanged	2025-05-19 03:07:22.013
1111	61	11	VariableChanged	2025-05-19 03:07:23.022
1112	61	11	VariableChanged	2025-05-19 03:07:27.863
1113	61	11	VariableChanged	2025-05-19 03:07:32.921
1114	61	11	checkpointReached	2025-05-19 03:07:35.067
1115	61	12	checkpointReached	2025-05-19 03:07:37.223
1116	61	12	VariableChanged	2025-05-19 03:07:39.621
1117	61	12	VariableChanged	2025-05-19 03:07:42.786
1118	61	12	VariableChanged	2025-05-19 03:07:47.966
1119	61	12	VariableChanged	2025-05-19 03:07:53.268
1120	61	12	VariableChanged	2025-05-19 03:07:56.509
1121	61	12	VariableChanged	2025-05-19 03:07:58.04
1122	61	12	VariableChanged	2025-05-19 03:08:03.156
1123	61	12	VariableChanged	2025-05-19 03:08:08.193
1124	61	12	VariableChanged	2025-05-19 03:08:13.307
1125	61	12	VariableChanged	2025-05-19 03:08:18.407
1126	61	12	VariableChanged	2025-05-19 03:08:23.247
1127	61	12	VariableChanged	2025-05-19 03:08:28.426
1128	61	12	VariableChanged	2025-05-19 03:08:33.494
1129	61	12	VariableChanged	2025-05-19 03:08:38.128
1130	61	12	VariableChanged	2025-05-19 03:08:43.146
1131	61	12	VariableChanged	2025-05-19 03:08:48.586
1132	61	12	VariableChanged	2025-05-19 03:08:53.267
1133	63	0	checkpointReached	2025-05-19 20:35:52.745
1134	63	1	VariableChanged	2025-05-19 20:35:53.203
1135	63	1	VariableChanged	2025-05-19 20:35:55.212
1136	63	1	checkpointReached	2025-05-19 20:36:00.341
1137	63	2	VariableChanged	2025-05-19 20:36:00.482
1138	63	2	VariableChanged	2025-05-19 20:36:05.011
1139	63	2	VariableChanged	2025-05-19 20:36:05.511
1140	63	2	VariableChanged	2025-05-19 20:36:10.038
1141	63	2	VariableChanged	2025-05-19 20:36:15.078
1142	63	2	VariableChanged	2025-05-19 20:36:20.121
1143	63	2	VariableChanged	2025-05-19 20:36:25.145
1144	63	2	VariableChanged	2025-05-19 20:36:30.178
1145	63	2	checkpointReached	2025-05-19 20:36:34.69
1146	63	3	VariableChanged	2025-05-19 20:36:35.22
1147	63	3	VariableChanged	2025-05-19 20:36:40.268
1148	63	3	checkpointReached	2025-05-19 20:36:46.321
1149	63	4	VariableChanged	2025-05-19 20:36:46.394
1150	63	4	VariableChanged	2025-05-19 20:36:49.93
1151	63	4	VariableChanged	2025-05-19 20:36:50.435
1152	63	4	VariableChanged	2025-05-19 20:36:54.969
1153	63	4	VariableChanged	2025-05-19 20:36:55.468
1154	63	4	checkpointReached	2025-05-19 20:37:00.543
1155	63	4	VariableChanged	2025-05-19 20:37:00.579
1156	64	0	checkpointReached	2025-05-19 20:40:19.569
1157	64	1	VariableChanged	2025-05-19 20:40:20.036
1158	64	1	VariableChanged	2025-05-19 20:40:21.044
1159	64	1	checkpointReached	2025-05-19 20:40:26.029
1160	64	2	VariableChanged	2025-05-19 20:40:26.248
1161	64	2	VariableChanged	2025-05-19 20:40:30.789
1162	64	2	VariableChanged	2025-05-19 20:40:31.289
1163	64	2	VariableChanged	2025-05-19 20:40:39.288
1164	64	2	VariableChanged	2025-05-19 20:40:40.805
1165	64	2	VariableChanged	2025-05-19 20:40:41.311
1166	64	2	VariableChanged	2025-05-19 20:40:45.826
1167	64	2	checkpointReached	2025-05-19 20:40:50.136
1168	64	2	VariableChanged	2025-05-19 20:40:51.289
1169	65	0	Initial	2025-05-19 20:49:31.512
1170	65	0	checkpointReached	2025-05-19 20:49:31.685
1171	65	1	VariableChanged	2025-05-19 20:49:35.222
1172	65	1	checkpointReached	2025-05-19 20:49:39.112
1173	65	2	VariableChanged	2025-05-19 20:49:39.173
1174	65	2	VariableChanged	2025-05-19 20:49:40.292
1175	65	2	VariableChanged	2025-05-19 20:49:45.277
1176	65	2	VariableChanged	2025-05-19 20:49:45.48
1177	65	2	checkpointReached	2025-05-19 20:49:47.322
1178	65	3	VariableChanged	2025-05-19 20:49:47.714
1179	65	3	VariableChanged	2025-05-19 20:49:50.219
1180	65	3	VariableChanged	2025-05-19 20:49:55.299
1181	65	3	checkpointReached	2025-05-19 20:49:57.306
1182	65	4	VariableChanged	2025-05-19 20:49:57.782
1183	65	4	VariableChanged	2025-05-19 20:50:00.276
1184	65	4	VariableChanged	2025-05-19 20:50:00.494
1185	65	4	checkpointReached	2025-05-19 20:50:07.7
1186	65	\N	VariableChanged	2025-05-19 20:50:07.766
\.


--
-- Data for Name: runs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.runs (run_id, "timestamp") FROM stdin;
1	2025-05-13 13:04:25.4942
2	2025-05-13 13:41:50.492589
3	2025-05-13 15:03:45.077082
4	2025-05-13 15:13:17.321558
5	2025-05-13 15:17:17.489009
6	2025-05-13 15:18:07.188952
7	2025-05-13 15:22:50.133235
8	2025-05-13 15:25:07.722008
9	2025-05-13 15:31:28.854117
10	2025-05-13 16:05:06.459402
11	2025-05-13 16:25:19.282775
12	2025-05-13 16:28:07.035818
13	2025-05-13 16:33:14.547902
14	2025-05-16 15:14:01.145557
15	2025-05-16 19:11:13.303642
16	2025-05-16 19:23:22.233656
17	2025-05-16 19:24:29.691254
18	2025-05-16 19:26:41.299519
19	2025-05-16 19:47:02.395937
20	2025-05-16 19:49:23.186113
21	2025-05-16 19:50:01.77604
22	2025-05-16 19:57:14.110027
23	2025-05-16 20:17:34.742661
24	2025-05-17 15:35:28.307587
25	2025-05-17 17:12:50.94283
26	2025-05-17 17:13:42.209885
27	2025-05-17 17:16:21.54383
28	2025-05-17 17:18:09.313041
29	2025-05-17 17:18:47.822992
30	2025-05-17 17:20:08.685639
31	2025-05-17 17:21:25.367777
32	2025-05-18 12:08:20.590602
33	2025-05-18 12:28:49.759032
34	2025-05-18 13:27:54.103597
35	2025-05-18 13:31:16.242205
36	2025-05-18 13:37:30.552514
37	2025-05-18 13:41:12.904966
38	2025-05-18 14:08:13.942252
39	2025-05-18 14:09:32.74601
40	2025-05-18 14:17:38.098689
41	2025-05-18 14:20:10.05184
42	2025-05-18 14:20:43.172558
43	2025-05-18 14:33:43.180552
44	2025-05-18 14:52:38.195269
45	2025-05-18 15:36:33.956379
46	2025-05-19 00:13:57.337183
47	2025-05-19 00:19:18.301357
48	2025-05-19 00:27:43.361915
49	2025-05-19 00:28:30.268422
50	2025-05-19 00:28:52.731547
51	2025-05-19 00:32:38.126903
52	2025-05-19 00:49:38.401713
53	2025-05-19 01:02:09.80273
54	2025-05-19 01:07:26.283658
55	2025-05-19 02:20:01.540198
56	2025-05-19 02:25:59.638834
57	2025-05-19 02:50:09.690813
58	2025-05-19 02:52:12.406346
59	2025-05-19 02:54:26.065952
60	2025-05-19 02:57:05.583207
61	2025-05-19 03:05:11.030364
62	2025-05-19 03:09:23.166051
63	2025-05-19 20:35:37.384806
64	2025-05-19 20:40:09.609736
65	2025-05-19 20:49:22.819387
\.


--
-- Data for Name: variable_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variable_changes (variable_change_id, event_id, name_and_path, new_value, diff) FROM stdin;
1	0	index	0	0
2	0	userReportedIntensity	0	0
3	0	(Empty, NoPath)	0	0
16	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	285.660767	285.660767
17	1	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	416036500	1452052860
18	1	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5782.25537	5496.59473
19	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14977.6738	6
20	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17007.7383	2030.06445
21	4	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19382.5352	3.4140625
22	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22914.2988	44.27539
23	6	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
24	6	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25856.5371	15.5605469
25	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28449.4121	2592.875
26	8	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31430.5645	2981.15234
27	9	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31468.89	38.32617
28	10	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33089.207	20.40625
29	11	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33899.8125	112.699219
30	12	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35351.875	110.164063
31	13	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35981.1055	629.230469
32	14	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	36690.5664	709.460938
33	15	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	37871.42	1180.85547
34	16	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	38178.6133	307.1914
35	17	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
36	17	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41840.21	3661.59766
37	18	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	43544.1563	1703.94531
38	19	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	5
39	19	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	47629.35	4085.19531
40	20	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	2
41	20	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	51368.6328	3739.28125
42	21	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54066.18	5.38671875
43	22	index	0	0
44	22	userReportedIntensity	0	0
45	22	(Empty, NoPath)	0	0
46	23	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.254088074	-0.745911956
47	23	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	2
48	23	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54371.1133	304.9336
49	23	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-3
50	23	(currentExp, Level 1/World/??/Character)	0	-1
51	23	(currentHealth, Level 1/World/??/Character)	100	42
52	23	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	96
53	23	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5040879	0.5040879
54	23	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5040879	0.5040879
55	23	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5040879	0.5040879
56	23	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
57	23	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-60
58	23	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-42
59	23	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-2
60	24	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.54259872	0.265186071
61	24	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323057	-0.004122734
62	24	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.766183734	0.2696043
63	24	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
64	24	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54601.37	230.257813
65	24	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
66	24	(currentExp, Level 1/World/??/Character)	1	1
67	24	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
68	24	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.06690526	0.269604325
69	24	(levelTime, Level 1/World/Level Manager/LevelManager)	3.516182	0.269603968
70	24	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.693496	0.269604325
71	24	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.516182	0.269603968
72	25	index	1	0
73	25	userReportedIntensity	4	0
74	25	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.6830976	0
75	25	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.24368286	0
76	25	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323057	0
77	25	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.004122734	0
78	25	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
79	25	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
80	25	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	4.64013433	0
81	25	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4.64013433	0
82	25	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.6522656	0
83	25	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.3477344	0
84	25	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	0
85	25	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
86	25	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	0
87	25	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	0
88	25	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54672.02	0
89	25	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	300.90625	0
90	25	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	416036500	0
91	25	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
92	25	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
93	25	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
94	25	(currentExp, Level 1/World/??/Character)	5	0
95	25	(currentExp_Diff, Level 1/World/??/Character)	5	0
96	25	(currentHealth, Level 1/World/??/Character)	100	0
97	25	(currentHealth_Diff, Level 1/World/??/Character)	0	0
98	25	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
99	25	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
100	25	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.20298624	0
101	25	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3.20298624	0
102	25	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
103	25	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
104	25	(levelTime, Level 1/World/Level Manager/LevelManager)	4.65226173	0
105	25	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	4.65226173	0
106	25	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.07219047	0
107	25	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.07219047	0
108	25	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.65226173	0
109	25	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	4.65226173	0
110	25	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
111	25	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
112	25	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
113	25	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
114	25	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
115	25	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
116	25	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
117	25	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
118	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1554.22729	163.911621
119	1	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
120	1	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10152.0713	26.4677734
121	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15796.5313	80.6181641
122	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17251.4336	37.4101563
123	4	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18345.53	1094.0957
124	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29153.49	4458.994
125	6	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35468.1953	464.3789
126	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41145.832	46.4765625
127	8	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	49575.4531	2.4140625
128	9	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	52825.2422	577.3242
129	10	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	3
130	10	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	56096.0938	75.75391
131	11	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	56895.1523	16.5117188
132	12	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	60946.17	4051.01953
133	13	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	61251.3	305.1289
134	14	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	61256.4258	5.125
135	15	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	61846.0234	589.597656
136	16	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	64371.9961	2525.97266
137	17	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	64818.47	446.472656
138	18	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	65395.5859	577.1172
139	19	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	65784.2656	388.6797
140	20	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	68573.46	2789.19531
141	21	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	69311.37	34.7734375
142	22	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	69623.63	312.265625
143	23	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	70570.82	22.421875
144	24	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	73135.5156	2564.69531
145	25	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	73682.65	547.1328
146	26	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	75668.7344	1443.33594
147	27	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	76387.28	718.5469
148	28	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	77832.07	627.0469
149	29	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	80849.88	7
150	30	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	81207.1641	357.28125
151	31	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	82844.25	102.5625
152	32	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	83015.91	73.33594
153	33	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	84344.01	1328.10156
154	34	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	84721.45	377.4453
155	35	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	86683.22	110.554688
156	36	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	89864.73	3181.50781
157	37	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	90729.95	865.226563
158	38	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	93436.22	2706.26563
159	39	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	95251.35	1815.13281
160	40	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	95999.7656	55.8984375
161	41	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	98977.17	2977.40625
162	42	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	99532.58	555.40625
163	43	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	104256.906	1
164	44	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	105648.289	1
165	45	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	106359.914	121.257813
166	46	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	107159.289	799.375
167	47	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	107406.195	246.90625
168	48	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	109981.82	32.828125
169	49	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	111482.742	1500.92188
170	50	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	111905.07	422.328125
171	51	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	112992.023	1086.95313
172	52	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	113784.172	792.148438
173	53	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	113805.5	21.328125
174	54	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	114968.141	11
175	55	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	114975.969	7.828125
176	56	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	116124.531	1148.5625
177	57	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	116230.148	21.1875
178	58	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	119059.656	173.140625
179	59	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	120351.359	1291.70313
180	60	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
181	60	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	124900.242	24.1875
182	61	index	0	0
183	61	userReportedIntensity	0	0
184	61	(Empty, NoPath)	0	0
185	62	index	0	0
186	62	userReportedIntensity	0	0
187	62	(Empty, NoPath)	0	0
188	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14836.5029	546.1045
189	1	index	0	0
190	1	userReportedIntensity	0	0
191	1	(Empty, NoPath)	0	0
192	2	index	0	0
193	2	userReportedIntensity	0	0
194	2	(Empty, NoPath)	0	0
195	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.254452437	-0.745547533
196	3	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	2
197	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	62786.9648	269.0547
198	3	(currentHealth, Level 1/World/??/Character)	100	100
199	3	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	100
200	3	(levelTime, Level 1/World/Level Manager/LevelManager)	0.504452348	0.504452348
201	3	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.504452348	0.504452348
202	3	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.504452348	0.504452348
203	3	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-3
204	3	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-90
205	3	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-100
206	4	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.057765	0.224570513
207	4	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.032486	-0.400998116
208	4	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0369887277	0.2292192
209	4	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	67971.81	66.71875
2563	106	index	0	0
210	4	(levelTime, Level 1/World/Level Manager/LevelManager)	4.036989	0.229219437
211	4	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.324532717	0.229219228
212	4	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.036989	0.229219437
213	5	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.097233	0.257982731
214	5	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0778354257	0.264007151
215	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	71269.98	3298.164
216	5	(levelTime, Level 1/World/Level Manager/LevelManager)	9.07784	0.264007568
217	5	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.44536525	0.264007121
218	5	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	9.07784	0.264007568
219	6	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.123568341	-0.220355079
220	6	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.102405585	0.283897728
221	6	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
222	6	(currentExp, Level 1/World/??/Character)	1	1
223	6	(currentHealth, Level 1/World/??/Character)	70	-4
224	6	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	70	-4
225	6	(levelTime, Level 1/World/Level Manager/LevelManager)	14.1024151	0.283902168
226	6	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.4128099	0.283897758
227	6	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.1024151	0.283902168
228	6	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	3
229	6	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	90
230	6	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	30	4
231	7	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.144082129	-0.205499381
232	7	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.1229773	0.298811078
233	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	71422.58	152.601563
234	7	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	1
235	7	(currentExp, Level 1/World/??/Character)	2	1
236	7	(currentHealth, Level 1/World/??/Character)	22	-6
237	7	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	22	-6
238	7	(levelTime, Level 1/World/Level Manager/LevelManager)	19.1230068	0.298814774
239	7	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.282052815	-0.31535995
240	7	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.1230068	0.298814774
241	7	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	4
242	7	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	210	120
243	7	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	78	6
244	0	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4
245	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-259014.141
246	0	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-2136008580	-497368960
247	1	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3045.33667	816.4822
248	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13596.1758	1077.86328
249	1	index	0	0
250	1	userReportedIntensity	0	0
251	1	(Empty, NoPath)	0	0
252	2	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.07004356	0.334451675
253	2	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.545901656	0.3382436
254	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39344.83	370.7422
255	2	(levelTime, Level 1/World/Level Manager/LevelManager)	7.045902	0.338243484
256	2	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7920224	0.3382434
257	2	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.045902	0.338243484
258	3	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.0409794	0.3522234
259	3	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.2618837	0.2294817
260	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.571092248	0.358469665
261	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41141.1875	52.92578
262	3	(currentHealth, Level 1/World/??/Character)	90	-2
263	3	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	-2
264	3	(levelTime, Level 1/World/Level Manager/LevelManager)	12.0711079	0.358469963
265	3	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.475086868	0.358469456
266	3	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.0711079	0.358469963
267	3	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
268	3	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
269	3	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	2
270	4	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.06318951	-0.123730093
271	4	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.596353352	0.385555863
272	4	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	46093.8945	2903.53516
273	4	(currentHealth, Level 1/World/??/Character)	38	-8
664	7	(currentLevel, Level 1/World/??/Character)	1	-2
274	4	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	38	-8
275	4	(levelTime, Level 1/World/Level Manager/LevelManager)	17.096365	0.38555336
276	4	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.122088917	-0.253082067
277	4	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	17.096365	0.38555336
278	4	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	2
279	4	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	60
280	4	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	62	8
281	4	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
282	5	index	0	0
283	5	userReportedIntensity	0	0
284	5	(Empty, NoPath)	0	0
285	6	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.109933	0.233520508
286	6	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.1669278	-1.01224935
287	6	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54288.2852	1092.94531
288	6	(levelTime, Level 1/World/Level Manager/LevelManager)	10.0830841	0.237753868
289	6	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6891699	0.237750679
290	6	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.0830841	0.237753868
291	7	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.1541653	0.274209023
292	7	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.122419775	-0.9712914
293	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	55800.55	47.7148438
294	7	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
295	7	(currentExp, Level 1/World/??/Character)	1	1
296	7	(currentHealth, Level 1/World/??/Character)	74	-26
297	7	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	74	-26
298	7	(levelTime, Level 1/World/Level Manager/LevelManager)	15.12758	0.2787056
299	7	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.09625617	-0.387469351
300	7	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.12758	0.2787056
301	7	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
302	7	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	30
303	7	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	26	26
304	8	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	18.7965	0.295024872
305	8	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.5230513	0.490754128
306	8	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.09611264	-0.948449254
307	8	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	58722.457	2921.90625
308	8	(currentHealth, Level 1/World/??/Character)	8	-4
309	8	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	8	-4
310	8	(levelTime, Level 1/World/Level Manager/LevelManager)	20.1538754	0.3015499
311	8	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.107370049	-0.297884822
312	8	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	20.1538754	0.3015499
313	8	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	3
314	8	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	150	60
315	8	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	92	4
316	9	index	0	0
317	9	userReportedIntensity	0	0
318	9	(Empty, NoPath)	0	0
319	10	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.251308858	-0.748691142
320	10	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
321	10	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	65448.6	23.9335938
322	10	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-1
323	10	(currentExp, Level 1/World/??/Character)	0	-1
324	10	(currentHealth, Level 1/World/??/Character)	100	100
325	10	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	100
326	10	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5013088	0.5013088
327	10	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5013088	0.5013088
328	10	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5013088	0.5013088
329	10	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-5
330	10	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-150
331	10	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-100
332	11	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.5347476	0.198796749
333	11	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324326	-0.4906187
334	11	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7630413	0.204103649
335	11	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	67637.3047	2188.70313
336	11	(levelTime, Level 1/World/Level Manager/LevelManager)	3.51304221	0.20410347
337	11	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6903419	0.204103619
338	11	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.51304221	0.20410347
339	12	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.55942154	0.2225585
665	7	(currentExp, Level 1/World/??/Character)	0	-11
340	12	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.786522269	0.22667104
341	12	(levelTime, Level 1/World/Level Manager/LevelManager)	8.536523	0.226668358
342	12	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6805123	0.22667101
343	12	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.536523	0.226668358
344	13	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	12.2475939	0.242917061
345	13	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3132887	0.280856133
346	13	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8141292	0.248783886
347	13	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	67991.95	354.648438
348	13	(currentHealth, Level 1/World/??/Character)	88	-4
349	13	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	88	-4
350	13	(levelTime, Level 1/World/Level Manager/LevelManager)	13.5641127	0.248782158
351	13	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.56104517	0.248783827
352	13	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	13.5641127	0.248782158
353	13	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
354	13	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
355	13	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	12	4
356	14	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	17.26988	0.2615776
357	14	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.834633052	0.265651345
358	14	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	68065.5859	73.63281
359	14	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
360	14	(currentExp, Level 1/World/??/Character)	2	2
361	14	(currentHealth, Level 1/World/??/Character)	48	-2
362	14	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	48	-2
363	14	(levelTime, Level 1/World/Level Manager/LevelManager)	18.5845871	0.265645981
364	14	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.357791752	0.265651017
365	14	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	18.5845871	0.265645981
366	14	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	5
367	14	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	210	150
368	14	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	52	2
369	15	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	21.464838	0.275291443
370	15	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.7460175	0.432728767
371	15	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	68163.7344	98.14844
372	15	(currentHealth, Level 1/World/??/Character)	0	-48
373	15	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	0	-48
374	15	(levelTime, Level 1/World/Level Manager/LevelManager)	23.6017056	0.279340744
375	15	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0975124761	-0.281360269
376	15	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	23.6017056	0.279340744
377	15	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	13	6
378	15	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	390	180
379	15	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	100	48
380	0	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
381	0	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-92839.51
382	0	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1695530000	-1177965700
383	1	index	0	0
384	1	userReportedIntensity	0	0
385	1	(Empty, NoPath)	0	0
386	2	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2533438	0.35170272
387	2	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
388	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5632.07568	216.657227
389	2	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-2
390	2	(currentExp, Level 1/World/??/Character)	0	-2
391	2	(currentHealth, Level 1/World/??/Character)	100	100
392	2	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	100
393	2	(levelTime, Level 1/World/Level Manager/LevelManager)	0.503343761	0.35170266
394	2	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.503343761	0.35170266
395	2	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.503343761	0.35170266
396	2	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-13
397	2	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-390
398	2	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-100
399	3	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.55332	0.3672905
400	3	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324259	-0.7135916
401	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2810264	0.372214973
402	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10636.76	89.44336
403	3	(levelTime, Level 1/World/Level Manager/LevelManager)	5.53103447	0.372217655
404	3	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.104247592	-0.474565238
2566	0	index	0	0
405	3	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.53103447	0.372217655
406	4	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.473635	0.388332367
407	4	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3132668	0.280840874
408	4	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.306658179	0.393118918
409	4	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11504.6836	6.4140625
410	4	(levelTime, Level 1/World/Level Manager/LevelManager)	10.556675	0.3931179
411	4	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.415332347	0.3931189
412	4	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.556675	0.3931179
413	4	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
414	4	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
415	5	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.4957	0.406164169
416	5	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.329204023	0.4114298
417	5	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
418	5	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
419	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13350.18	11
420	5	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	1
421	5	(currentExp, Level 1/World/??/Character)	2	1
422	5	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
423	5	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.81514835	0.41143012
424	5	(levelTime, Level 1/World/Level Manager/LevelManager)	15.5792189	0.411428452
425	5	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5498731	0.411429822
426	5	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.5792189	0.411428452
427	5	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	4	3
428	5	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	120	90
429	6	index	1	0
430	6	userReportedIntensity	4	0
431	6	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	16.0806561	0
432	6	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-5.868494	0
433	6	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3132668	0
434	6	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.4327507	0
435	6	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
436	6	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
437	6	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	17.1452332	0
438	6	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	17.1452332	0
439	6	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
440	6	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
441	6	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.6588999	0
442	6	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.3411001	0
443	6	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
444	6	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
445	6	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
446	6	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
447	6	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13364.5938	0
448	6	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8001.182	0
449	6	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1695530000	0
450	6	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
451	6	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
452	6	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
453	6	(currentLevel, Level 1/World/??/Character)	1	0
454	6	(currentLevel_Diff, Level 1/World/??/Character)	0	0
455	6	(currentExp, Level 1/World/??/Character)	5	0
456	6	(currentExp_Diff, Level 1/World/??/Character)	5	0
457	6	(currentHealth, Level 1/World/??/Character)	100	0
458	6	(currentHealth_Diff, Level 1/World/??/Character)	0	0
459	6	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
460	6	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
461	6	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
462	6	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
463	6	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
464	6	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
465	6	(levelTime, Level 1/World/Level Manager/LevelManager)	17.1589127	0
466	6	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	17.1589127	0
467	6	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.1869367	0
468	6	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.1869367	0
469	6	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	17.1589127	0
470	6	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	17.1589127	0
471	6	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	0
472	6	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	5	0
473	6	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	150	0
474	6	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	150	0
475	6	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
476	6	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
477	6	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
478	6	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
479	7	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	16.5039387	0.423282623
480	7	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
481	7	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	17.1452332	17.1452332
482	7	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.162548482	-0.8214484
483	7	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	1
484	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13946.8525	582.2588
485	7	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	3
486	7	(currentExp, Level 1/World/??/Character)	5	3
487	7	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
488	7	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.07683879	0.07683879
489	7	(levelTime, Level 1/World/Level Manager/LevelManager)	17.5874672	0.428554535
490	7	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6154884	0.4285517
491	7	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	17.5874672	0.428554535
492	7	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	1
493	7	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	150	30
494	7	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
495	7	(currentLevel, Level 1/World/??/Character)	2	1
496	8	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	20.0250912	0.223752975
497	8	(timeSinceLastAttack, Level 1/World/Ability Manager/Grenade Ability(Clone)/GrenadeThrowableAbility)	0.444454163	0.22375299
498	8	(level, Level 1/World/Ability Manager/Grenade Ability(Clone)/GrenadeThrowableAbility)	1	1
499	8	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8582591	0.228657126
500	8	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
501	8	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12	3
502	8	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16684.1484	4.828125
503	8	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
504	8	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
505	8	(nextLevelExp, Level 1/World/??/Character)	11	6
506	8	(expToNextLevel, Level 1/World/??/Character)	6	1
507	8	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-0.07683879
508	8	(levelTime, Level 1/World/Level Manager/LevelManager)	21.1082516	0.228656769
509	8	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.47140494	0.228656992
510	8	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	21.1082516	0.228656769
511	8	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
512	8	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
513	8	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
514	8	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	2
515	8	(<FireRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
516	8	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	1
517	8	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	210	60
518	8	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.2751176
519	9	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	25.0814571	0.276201248
520	9	(timeSinceLastAttack, Level 1/World/Ability Manager/Grenade Ability(Clone)/GrenadeThrowableAbility)	2.25085831	0.276204467
521	9	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.9153997	0.2818458
522	9	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
523	9	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	6
524	9	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18840.6563	2156.50781
525	9	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	2
526	9	(currentExp, Level 1/World/??/Character)	7	2
527	9	(currentHealth, Level 1/World/??/Character)	94	-6
528	9	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.55839467	0.281846046
529	9	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	94	-6
530	9	(levelTime, Level 1/World/Level Manager/LevelManager)	26.1653557	0.2818432
531	9	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.476687968	0.2818457
532	9	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	26.1653557	0.2818432
533	9	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	8	2
534	9	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	300	10
535	9	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	6	6
536	9	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
537	9	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.219238028
538	10	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	30.0997429	0.291259766
539	10	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.313266754	-10
540	10	(timeSinceLastAttack, Level 1/World/Ability Manager/Grenade Ability(Clone)/GrenadeThrowableAbility)	0.7691181	0.291249633
541	10	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.936178446	0.2994092
542	10	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26	1
543	10	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	8	1
544	10	(currentExp, Level 1/World/??/Character)	8	1
545	10	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.37969476	0.29940936
546	10	(levelTime, Level 1/World/Level Manager/LevelManager)	31.18616	0.2994194
547	10	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.370173156	0.2994094
548	10	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.18614268	0.2994091
549	10	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	12	4
550	10	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	450	150
551	10	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.201189086
552	11	index	2	0
553	11	userReportedIntensity	4	0
554	11	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	32.85939	0
555	11	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	16.7787342	0
556	11	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.313266754	0
557	11	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-10	0
558	11	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
559	11	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
560	11	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	33.92401	0
561	11	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	16.7787781	0
562	11	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	0
563	11	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4	0
564	11	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.0623216964	0
565	11	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.7212216	0
566	11	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	0
567	11	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
568	11	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28	0
569	11	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	0
570	11	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18840.6563	0
571	11	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5476.0625	0
572	11	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1695530000	0
573	11	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
574	11	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
575	11	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
576	11	(currentLevel, Level 1/World/??/Character)	2	0
577	11	(currentLevel_Diff, Level 1/World/??/Character)	1	0
578	11	(currentExp, Level 1/World/??/Character)	11	0
579	11	(currentExp_Diff, Level 1/World/??/Character)	6	0
580	11	(currentHealth, Level 1/World/??/Character)	90	0
581	11	(currentHealth_Diff, Level 1/World/??/Character)	-10	0
582	11	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
583	11	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
584	11	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.13119388	0
585	11	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3.13119388	0
586	11	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	0
587	11	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-10	0
588	11	(levelTime, Level 1/World/Level Manager/LevelManager)	33.93763	0
589	11	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	16.778717	0
590	11	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.241623133	0
591	11	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.0546864271	0
592	11	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.93764043	0
593	11	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	-13.2212725	0
594	11	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	16	0
595	11	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	11	0
596	11	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	620	0
597	11	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	470	0
598	11	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
599	11	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
600	11	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
601	11	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
602	0	index	0	0
603	0	userReportedIntensity	0	0
604	0	(Empty, NoPath)	0	0
605	1	index	1	0
606	1	userReportedIntensity	4	0
607	2	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	-1
608	2	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	25.2122383	0.5001755
609	2	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.20890236	0.500173569
610	2	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
611	2	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
612	2	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.305216461	0.500174642
613	2	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
614	2	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	1
615	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10295.9268	277.9912
616	2	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
617	2	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
618	2	(currentLevel, Level 1/World/??/Character)	2	1
619	2	(nextLevelExp, Level 1/World/??/Character)	11	6
620	2	(expToNextLevel, Level 1/World/??/Character)	6	1
621	2	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.3669647	0.500174761
622	2	(levelTime, Level 1/World/Level Manager/LevelManager)	23.0552177	0.5001793
623	2	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.1117992	-0.06645752
624	2	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	23.0552177	0.5001793
625	2	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
626	2	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
627	2	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
628	2	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
629	2	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
630	2	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	11	3
631	3	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	-2
632	3	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	29.73923	0.0221366882
633	3	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.735884	0.0221357346
634	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.1677931	0.0221360028
635	3	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	4
636	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10574.1064	278.1797
637	3	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	9	4
638	3	(currentExp, Level 1/World/??/Character)	9	4
639	3	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
640	3	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	5.893957	0.0221362114
641	3	(levelTime, Level 1/World/Level Manager/LevelManager)	27.5822124	0.0221366882
642	3	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.305551738	0.0221360028
643	3	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	27.5822124	0.0221366882
644	3	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	13	2
645	3	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	420	90
646	4	index	2	0
647	4	userReportedIntensity	2	0
648	5	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4
649	5	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-24
650	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-27112.7246
651	5	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1940884740	1749526140
652	6	index	0	0
653	6	userReportedIntensity	0	0
654	6	(Empty, NoPath)	0	0
655	7	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
656	7	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-30.37122
657	7	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
658	7	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	-1
659	7	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.253576368	0.07676384
660	7	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
661	7	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	420.021484	89.05054
662	7	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
663	7	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
666	7	(nextLevelExp, Level 1/World/??/Character)	5	-6
667	7	(expToNextLevel, Level 1/World/??/Character)	5	-1
668	7	(currentHealth, Level 1/World/??/Character)	100	20
669	7	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
670	7	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-8.692701
671	7	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	20
672	7	(levelTime, Level 1/World/Level Manager/LevelManager)	0.503576458	0.07676384
673	7	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.503576458	0.07676384
674	7	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.503576458	0.07676384
675	7	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
676	7	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
677	7	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
678	7	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
679	7	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
680	7	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-15
681	7	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-440
682	7	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-20
683	8	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.57822132	0.118443966
684	8	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323687	-0.595842361
685	8	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.306803554	0.125966474
686	8	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	5
687	8	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	864.8656	9.621277
688	8	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	3
689	8	(currentExp, Level 1/World/??/Character)	3	3
690	8	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.8016994	0.125966311
691	8	(levelTime, Level 1/World/Level Manager/LevelManager)	5.55680466	0.125966549
692	8	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.1301747	0.125966489
693	8	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.55680466	0.125966549
694	8	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
695	8	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
696	9	index	1	0
697	9	userReportedIntensity	4	0
698	9	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
699	9	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
700	9	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
701	9	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
702	9	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.68907976	0
703	9	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-5.845556	0
704	9	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
705	9	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
706	9	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.5515666	0
707	9	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	6.5515666	0
708	9	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
709	9	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
710	9	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
711	9	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
712	9	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.160138682	0
713	9	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.839861333	0
714	9	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
715	9	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
716	9	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
717	9	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
718	9	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	876.8656	0
719	9	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	545.894653	0
720	9	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1940884740	0
721	9	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
722	9	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
723	9	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
724	9	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
725	9	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
726	9	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
727	9	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
728	9	(currentLevel, Level 1/World/??/Character)	1	0
729	9	(currentLevel_Diff, Level 1/World/??/Character)	0	0
730	9	(currentExp, Level 1/World/??/Character)	5	0
731	9	(currentExp_Diff, Level 1/World/??/Character)	5	0
732	9	(nextLevelExp, Level 1/World/??/Character)	5	0
733	9	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
734	9	(expToNextLevel, Level 1/World/??/Character)	5	0
735	9	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
736	9	(currentHealth, Level 1/World/??/Character)	100	0
737	9	(currentHealth_Diff, Level 1/World/??/Character)	0	0
738	9	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
739	9	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
740	9	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.905036	0
741	9	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	4.905036	0
742	9	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
743	9	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
744	9	(levelTime, Level 1/World/Level Manager/LevelManager)	6.66014051	0
745	9	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	6.66014051	0
746	9	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.406059772	0
747	9	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.406059772	0
748	9	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.66014051	0
749	9	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	6.66014051	0
750	9	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
751	9	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
752	9	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
753	9	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
754	9	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
755	9	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
756	9	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
757	9	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
758	9	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
759	9	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
760	9	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
761	9	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
762	9	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
763	9	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
764	9	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
765	9	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
766	10	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
767	10	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
768	10	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4.12310553	4.12310553
769	10	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1913871740	-3854756350
770	11	index	0	0
771	11	userReportedIntensity	0	0
772	11	(Empty, NoPath)	0	0
773	12	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
774	12	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-6.5515666
775	12	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
776	12	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.257763237	-0.742236733
777	12	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
778	12	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	559.233	298.573
779	12	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
780	12	(currentLevel, Level 1/World/??/Character)	1	-1
781	12	(currentExp, Level 1/World/??/Character)	0	-5
782	12	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
783	12	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.0378256	0.0378256
784	12	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5077632	0.5077632
785	12	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5077632	0.5077632
786	12	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5077632	0.5077632
787	12	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
788	12	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
789	13	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.5502317	0.2125833
790	13	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324411	7.247925e-05
791	13	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.780920267	0.220033228
792	13	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
793	13	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	594.7181	35.4851074
794	13	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	4	1
795	13	(currentExp, Level 1/World/??/Character)	4	1
796	13	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.06098127	0.220032692
797	13	(levelTime, Level 1/World/Level Manager/LevelManager)	3.53091884	0.220032692
798	13	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7083628	0.220033169
799	13	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.53091884	0.220032692
800	14	index	1	0
801	14	userReportedIntensity	4	0
802	14	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
803	14	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
804	14	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
805	14	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
806	14	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.865731	0
807	14	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-2.82334876	0
808	14	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324411	0
809	14	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.247925e-05	0
810	14	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
811	14	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
812	14	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	3.82640076	0
813	14	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	3.82640076	0
814	14	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
815	14	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
816	14	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
817	14	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
818	14	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.1610291	0
819	14	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-1.1610291	0
820	14	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
821	14	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
822	14	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
823	14	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
824	14	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	594.7181	0
825	14	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	334.0581	0
826	14	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1913871740	0
827	14	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
828	14	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
829	14	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
830	14	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
831	14	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
832	14	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
833	14	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
834	14	(currentLevel, Level 1/World/??/Character)	1	0
835	14	(currentLevel_Diff, Level 1/World/??/Character)	0	0
836	14	(currentExp, Level 1/World/??/Character)	5	0
837	14	(currentExp_Diff, Level 1/World/??/Character)	5	0
838	14	(nextLevelExp, Level 1/World/??/Character)	5	0
839	14	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
840	14	(expToNextLevel, Level 1/World/??/Character)	5	0
841	14	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
842	14	(currentHealth, Level 1/World/??/Character)	100	0
843	14	(currentHealth_Diff, Level 1/World/??/Character)	0	0
844	14	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
845	14	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
846	14	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.36903119	0
847	14	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3.36903119	0
848	14	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
849	14	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
850	14	(levelTime, Level 1/World/Level Manager/LevelManager)	3.83896875	0
851	14	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	3.83896875	0
852	14	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.126616985	0
853	14	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.126616985	0
854	14	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.83896875	0
855	14	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	3.83896875	0
856	14	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
857	14	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
858	14	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
859	14	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
860	14	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
861	14	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
862	14	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
863	14	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
864	14	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
865	14	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
866	14	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
867	14	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
868	14	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
869	14	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
870	14	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
871	14	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
872	15	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
873	15	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
874	15	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-18518.3652
875	15	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1164173180	749698560
876	16	index	0	0
877	16	userReportedIntensity	0	0
878	16	(Empty, NoPath)	0	0
879	17	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
880	17	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-3.82640076
881	17	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
882	17	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.252379328	-0.7476207
883	17	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
884	17	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1367.79041	225.758423
885	17	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
886	17	(currentLevel, Level 1/World/??/Character)	1	-1
887	17	(currentExp, Level 1/World/??/Character)	0	-5
888	17	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
889	17	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3.36903119
890	17	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5023794	0.5023794
891	17	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5023794	0.5023794
892	17	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5023794	0.5023794
893	18	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.02748263	0.383722365
894	18	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324078	-3.33786e-05
895	18	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5078547	0.3918672
896	18	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
897	18	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
898	18	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1608.7926	10
899	18	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
900	18	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.899601936	0.391867042
901	18	(levelTime, Level 1/World/Level Manager/LevelManager)	2.00785422	0.391867042
902	18	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0990924	-0.5482854
903	18	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.00785422	0.391867042
904	19	index	1	0
905	19	userReportedIntensity	4	0
906	19	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
907	19	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
908	19	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
909	19	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
910	19	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.50836468	0
911	19	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.64263368	0
912	19	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324078	0
913	19	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-3.33786e-05	0
914	19	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
915	19	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
916	19	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.46899748	0
917	19	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	5.46899748	0
918	19	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
919	19	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
920	19	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
921	19	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
922	19	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.230590135	0
923	19	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.7694099	0
924	19	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
925	19	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
926	19	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	0
927	19	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	0
928	19	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1667.08374	0
929	19	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	525.051758	0
930	19	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-1164173180	0
931	19	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
932	19	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
933	19	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
934	19	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
935	19	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
936	19	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
937	19	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
938	19	(currentLevel, Level 1/World/??/Character)	1	0
939	19	(currentLevel_Diff, Level 1/World/??/Character)	0	0
940	19	(currentExp, Level 1/World/??/Character)	5	0
941	19	(currentExp_Diff, Level 1/World/??/Character)	5	0
942	19	(nextLevelExp, Level 1/World/??/Character)	5	0
943	19	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
944	19	(expToNextLevel, Level 1/World/??/Character)	5	0
945	19	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
946	19	(currentHealth, Level 1/World/??/Character)	100	0
947	19	(currentHealth_Diff, Level 1/World/??/Character)	0	0
948	19	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
949	19	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
950	19	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.372338	0
951	19	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	4.372338	0
952	19	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
953	19	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
954	19	(levelTime, Level 1/World/Level Manager/LevelManager)	5.48058939	0
955	19	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	5.48058939	0
956	19	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.05390828	0
957	19	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.05390828	0
958	19	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.48058939	0
959	19	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	5.48058939	0
960	19	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
961	19	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
962	19	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
963	19	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
964	19	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
965	19	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
966	19	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
967	19	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
968	19	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
969	19	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
970	19	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
971	19	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
972	19	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
973	19	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
974	19	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
975	19	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
976	20	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
977	20	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-6
978	20	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	167.408386	167.408386
979	20	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-924405400	239767800
980	21	index	0	0
981	21	userReportedIntensity	0	0
982	21	(Empty, NoPath)	0	0
983	22	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
984	22	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-5.46899748
985	22	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.253882855	-0.7461171
986	22	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2074	82	(currentExp, Level 1/World/??/Character)	0	-9
987	22	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	638.493958	204.604187
988	22	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
989	22	(currentExp, Level 1/World/??/Character)	0	-5
990	22	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
991	22	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.372338
992	22	(levelTime, Level 1/World/Level Manager/LevelManager)	0.503882766	0.503882766
993	22	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.503882766	0.503882766
994	22	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.503882766	0.503882766
995	23	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.04554081	0.0392439365
996	23	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.03242	1.23977661e-05
997	23	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.273596823	0.0446945876
998	23	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
999	23	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	897.384644	258.8907
1000	23	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
1001	23	(currentExp, Level 1/World/??/Character)	1	1
1002	23	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
1003	23	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.40885019	0.0446944237
1004	23	(levelTime, Level 1/World/Level Manager/LevelManager)	3.02359748	0.0446944237
1005	23	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.201101273	0.0446946025
1006	23	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.02359748	0.0446944237
1007	24	index	1	0
1008	24	userReportedIntensity	4	0
1009	24	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1010	24	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1011	24	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1012	24	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1013	24	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.22095776	0
1014	24	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.71259308	0
1015	24	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.03242	0
1016	24	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.23977661e-05	0
1017	24	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1018	24	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1019	24	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	7.1775775	0
1020	24	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	7.1775775	0
1021	24	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1022	24	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1023	24	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1024	24	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1025	24	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.693561	0
1026	24	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.306438982	0
1027	24	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1028	24	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1029	24	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	0
1030	24	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	0
1031	24	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	897.384644	0
1032	24	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	463.494873	0
1033	24	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	-924405400	0
1034	24	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1035	24	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1036	24	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1037	24	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1038	24	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1039	24	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1040	24	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1041	24	(currentLevel, Level 1/World/??/Character)	1	0
1042	24	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1043	24	(currentExp, Level 1/World/??/Character)	5	0
1044	24	(currentExp_Diff, Level 1/World/??/Character)	5	0
1045	24	(nextLevelExp, Level 1/World/??/Character)	5	0
1046	24	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1047	24	(expToNextLevel, Level 1/World/??/Character)	5	0
1048	24	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1049	24	(currentHealth, Level 1/World/??/Character)	100	0
1050	24	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1051	24	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1052	24	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1053	24	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1054	24	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1055	24	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1056	24	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1057	24	(levelTime, Level 1/World/Level Manager/LevelManager)	7.193567	0
1058	24	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	7.193567	0
1059	24	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.131005183	0
1060	24	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.131005183	0
1061	24	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.193567	0
1062	24	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	7.193567	0
1063	24	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1064	24	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1065	24	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1066	24	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1067	24	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1068	24	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1069	24	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1070	24	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1071	24	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1072	24	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1073	24	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1074	24	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1075	24	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1076	24	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1077	24	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1078	24	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1079	25	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1080	25	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-14
1081	25	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-897.384644
1082	25	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	671168500	1595573890
1083	26	index	0	0
1084	26	userReportedIntensity	0	0
1085	26	(Empty, NoPath)	0	0
1086	27	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1087	27	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-7.1775775
1088	27	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.252204835	-0.747795165
1089	27	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
1090	27	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	557.237061	55.236084
1091	27	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1092	27	(currentExp, Level 1/World/??/Character)	0	-5
1093	27	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5022047	0.5022047
1094	27	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5022047	0.5022047
1095	27	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5022047	0.5022047
1096	27	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
1097	27	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
1098	28	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.01466	-5.206298
1099	28	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322914	-0.000128746033
1100	28	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.514616668	0.0312042832
1101	28	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
1102	28	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
1103	28	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.49797571	0.0312043428
1104	28	(levelTime, Level 1/World/Level Manager/LevelManager)	2.014617	0.0312042236
1105	28	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.105742306	0.0312042981
1106	28	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.014617	0.0312042236
1107	29	index	1	0
1108	29	userReportedIntensity	4	0
1109	29	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1110	29	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1111	29	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1112	29	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1113	29	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.12189865	0
1114	29	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-1.0990591	0
1115	29	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322914	0
1116	29	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.000128746033	0
1117	29	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1118	29	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1119	29	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.079989	0
1120	29	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	6.079989	0
1121	29	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1122	29	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1123	29	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1124	29	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1125	29	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.840647638	0
1126	29	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.159352362	0
1127	29	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
1128	29	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1129	29	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1130	29	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1131	29	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	557.237061	0
1132	29	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	55.236084	0
1133	29	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	671168500	0
1134	29	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1135	29	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1136	29	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1137	29	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1138	29	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1139	29	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1140	29	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1141	29	(currentLevel, Level 1/World/??/Character)	1	0
1142	29	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1143	29	(currentExp, Level 1/World/??/Character)	5	0
1144	29	(currentExp_Diff, Level 1/World/??/Character)	5	0
1145	29	(nextLevelExp, Level 1/World/??/Character)	5	0
1146	29	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1147	29	(expToNextLevel, Level 1/World/??/Character)	5	0
1148	29	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1149	29	(currentHealth, Level 1/World/??/Character)	100	0
1150	29	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1151	29	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
1152	29	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
1153	29	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	5.574011	0
1154	29	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	5.574011	0
1155	29	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1156	29	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1157	29	(levelTime, Level 1/World/Level Manager/LevelManager)	6.0906477	0
1158	29	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	6.0906477	0
1159	29	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.663806558	0
1160	29	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.663806558	0
1161	29	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.0906477	0
1162	29	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	6.0906477	0
1163	29	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1164	29	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1165	29	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1166	29	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1167	29	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1168	29	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1169	29	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1170	29	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1171	29	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1172	29	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1173	29	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1174	29	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1175	29	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1176	29	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1177	29	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1178	29	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1179	30	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
1180	30	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
1181	30	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39.6888275	39.6888275
1182	30	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	923560768	252392256
1183	31	index	0	0
1184	31	userReportedIntensity	0	0
1185	31	(Empty, NoPath)	0	0
1186	32	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1187	32	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-6.079989
1188	32	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
1189	32	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2556479	-0.7443521
1190	32	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1191	32	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	836.244446	311.17688
1192	32	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1193	32	(currentLevel, Level 1/World/??/Character)	1	-1
1194	32	(currentExp, Level 1/World/??/Character)	0	-5
1195	32	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
1196	32	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-5.574011
1197	32	(levelTime, Level 1/World/Level Manager/LevelManager)	0.505647957	0.505647957
1198	32	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.505647957	0.505647957
1199	32	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.505647957	0.505647957
1200	33	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.547156	0.4262116
1201	33	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323753	8.392334e-05
1202	33	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.774362266	0.432149768
1203	33	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
1204	33	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	930.797668	45.88324
1205	33	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
1206	33	(currentExp, Level 1/World/??/Character)	1	1
1207	33	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	1
1208	33	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.96701813	0.432148933
1209	33	(levelTime, Level 1/World/Level Manager/LevelManager)	3.524364	0.432148933
1210	33	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.701805234	0.432149827
1211	33	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.524364	0.432148933
1212	34	index	1	0
1213	34	userReportedIntensity	2	0
1214	34	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1215	34	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1216	34	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1217	34	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1218	34	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.48229551	0
1219	34	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.639603138	0
1220	34	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323753	0
1221	34	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.392334e-05	0
1222	34	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1223	34	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1224	34	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.441606	0
1225	34	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	5.441606	0
1226	34	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1227	34	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1228	34	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1229	34	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1230	34	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.203563124	0
1231	34	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.7964369	0
1232	34	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1233	34	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1234	34	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1235	34	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1236	34	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	930.797668	0
1237	34	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	405.7301	0
1238	34	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	923560768	0
1239	34	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1240	34	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1241	34	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1242	34	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1243	34	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1244	34	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1245	34	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1246	34	(currentLevel, Level 1/World/??/Character)	1	0
1247	34	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1248	34	(currentExp, Level 1/World/??/Character)	5	0
1249	34	(currentExp_Diff, Level 1/World/??/Character)	5	0
1250	34	(nextLevelExp, Level 1/World/??/Character)	5	0
1251	34	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1252	34	(expToNextLevel, Level 1/World/??/Character)	5	0
1253	34	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1254	34	(currentHealth, Level 1/World/??/Character)	100	0
1255	34	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1256	34	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1257	34	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1258	34	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.89622068	0
1259	34	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	4.89622068	0
1260	34	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1261	34	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1262	34	(levelTime, Level 1/World/Level Manager/LevelManager)	5.4535675	0
1263	34	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	5.4535675	0
1264	34	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0270153489	0
1265	34	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.0270153489	0
1266	34	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.4535675	0
1267	34	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	5.4535675	0
1268	34	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1269	34	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1270	34	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1271	34	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1272	34	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1273	34	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1274	34	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1275	34	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1276	34	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1277	34	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1278	34	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1279	34	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1280	34	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1281	34	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1282	34	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1283	34	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1284	35	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1285	35	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
1286	35	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	83.95237	83.95237
1287	35	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1116066820	192506048
1288	36	index	0	0
1289	36	userReportedIntensity	0	0
1290	36	(Empty, NoPath)	0	0
1291	37	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1292	37	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-5.441606
1293	37	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
1294	37	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.252515763	-0.7474842
1295	37	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1296	37	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	719.605	234.905
1297	37	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1298	37	(currentLevel, Level 1/World/??/Character)	1	-1
1299	37	(currentExp, Level 1/World/??/Character)	0	-5
1300	37	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.89622068
1301	37	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5025156	0.5025156
1302	37	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5025156	0.5025156
1303	37	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5025156	0.5025156
1304	37	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
1305	37	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
1306	38	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.03752637	-2.44476914
1371	39	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.73298931	0
1307	38	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323162	-5.91278076e-05
1308	38	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2859783	0.0289585
1309	38	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
1310	38	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	763.019165	43.4141846
1311	38	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
1312	38	(currentExp, Level 1/World/??/Character)	1	1
1313	38	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.460742	0.028958559
1314	38	(levelTime, Level 1/World/Level Manager/LevelManager)	3.03597832	0.028958559
1315	38	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.213244751	0.0289585
1316	38	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.03597832	0.028958559
1317	39	index	1	0
1318	39	userReportedIntensity	4	0
1319	39	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1320	39	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1321	39	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1322	39	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1323	39	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.76349688	0
1324	39	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.718798637	0
1325	39	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323162	0
1326	39	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-5.91278076e-05	0
1327	39	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1328	39	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1329	39	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	4.720997	0
1330	39	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4.720997	0
1331	39	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1332	39	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1333	39	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1334	39	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1335	39	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7329889	0
1336	39	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.2670111	0
1337	39	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1338	39	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1339	39	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1340	39	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1341	39	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	763.019165	0
1342	39	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	278.319183	0
1343	39	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1116066820	0
1344	39	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1345	39	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1346	39	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1347	39	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1348	39	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1349	39	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1350	39	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1351	39	(currentLevel, Level 1/World/??/Character)	1	0
1352	39	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1353	39	(currentExp, Level 1/World/??/Character)	5	0
1354	39	(currentExp_Diff, Level 1/World/??/Character)	5	0
1355	39	(nextLevelExp, Level 1/World/??/Character)	5	0
1356	39	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1357	39	(expToNextLevel, Level 1/World/??/Character)	5	0
1358	39	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1359	39	(currentHealth, Level 1/World/??/Character)	100	0
1360	39	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1361	39	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1362	39	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1363	39	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1364	39	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1365	39	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1366	39	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1367	39	(levelTime, Level 1/World/Level Manager/LevelManager)	4.73298931	0
1368	39	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	4.73298931	0
1369	39	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.152936652	0
1370	39	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.152936652	0
1372	39	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	4.73298931	0
1373	39	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1374	39	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1375	39	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1376	39	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1377	39	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1378	39	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1379	39	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1380	39	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1381	39	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1382	39	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1383	39	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1384	39	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1385	39	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1386	39	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1387	39	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1388	39	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1389	40	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1390	40	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4
1391	40	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4406.02637	4261.02637
1392	40	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1679632380	563565600
1393	41	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4406.02637
1394	41	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	-1679632380
1395	42	index	0	0
1396	42	userReportedIntensity	0	0
1397	42	(Empty, NoPath)	0	0
1398	43	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1399	43	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4.720997
1400	43	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.255575538	-0.744424462
1401	43	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1402	43	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	879.4897	349.593933
1403	43	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1404	43	(currentExp, Level 1/World/??/Character)	0	-5
1405	43	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5055754	0.5055754
1406	43	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5055754	0.5055754
1407	43	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5055754	0.5055754
1408	44	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.54124284	0.09733331
1409	44	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323629	4.673004e-05
1410	44	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.232072666	-1.14687574
1411	44	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
1412	44	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	971.7958	92.30609
1413	44	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	1
1414	44	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.95426691	0.103124261
1415	44	(levelTime, Level 1/World/Level Manager/LevelManager)	2.51792669	0.103124142
1416	44	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6092017	0.103124261
1417	44	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.51792669	0.103124142
1418	45	index	1	0
1419	45	userReportedIntensity	4	0
1420	45	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1421	45	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1422	45	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1423	45	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1424	45	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.53500748	0
1425	45	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.7715106	0
1426	45	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1527777	0
1427	45	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.120461464	0
1428	45	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1429	45	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1430	45	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.02019739	0
1431	45	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	6.02019739	0
1432	45	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1433	45	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1434	45	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1435	45	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1436	45	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.78409034	0
1437	45	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.21590966	0
1438	45	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1439	45	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1440	45	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
1441	45	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
1442	45	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	971.7958	0
1443	45	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	441.900024	0
1444	45	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1445	45	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1446	45	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1447	45	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1448	45	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1449	45	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1450	45	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1451	45	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1452	45	(currentLevel, Level 1/World/??/Character)	1	0
1453	45	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1454	45	(currentExp, Level 1/World/??/Character)	5	0
1455	45	(currentExp_Diff, Level 1/World/??/Character)	5	0
1456	45	(nextLevelExp, Level 1/World/??/Character)	5	0
1457	45	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1458	45	(expToNextLevel, Level 1/World/??/Character)	5	0
1459	45	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1460	45	(currentHealth, Level 1/World/??/Character)	100	0
1461	45	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1462	45	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1463	45	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1464	45	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1465	45	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1466	45	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1467	45	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1468	45	(levelTime, Level 1/World/Level Manager/LevelManager)	6.034087	0
1469	45	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	6.034087	0
1470	45	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6074529	0
1471	45	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.6074529	0
1472	45	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.034087	0
1473	45	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	6.034087	0
1474	45	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1475	45	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1476	45	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1477	45	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1478	45	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1479	45	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1480	45	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1481	45	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1482	45	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1483	45	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1484	45	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1485	45	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1486	45	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1487	45	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1488	45	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1489	45	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1490	46	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1491	46	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
1492	46	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-971.7958
1493	47	index	0	0
1494	47	userReportedIntensity	0	0
1495	47	(Empty, NoPath)	0	0
1496	48	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1497	48	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-6.02019739
1498	48	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
1562	50	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1499	48	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.262651622	-0.7373484
1500	48	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1501	48	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	599.353943	185.033081
1502	48	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1503	48	(currentLevel, Level 1/World/??/Character)	1	-1
1504	48	(currentExp, Level 1/World/??/Character)	0	-5
1505	48	(levelTime, Level 1/World/Level Manager/LevelManager)	0.512651563	0.512651563
1506	48	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.512651563	0.512651563
1507	48	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.512651563	0.512651563
1508	48	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
1509	48	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
1510	49	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.54436421	0.4782462
1511	49	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324516	-0.120326042
1512	49	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7724418	0.4827825
1513	49	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	7
1514	49	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	4	1
1515	49	(currentExp, Level 1/World/??/Character)	4	1
1516	49	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	1
1517	49	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.04713273	0.482783318
1518	49	(levelTime, Level 1/World/Level Manager/LevelManager)	3.52244449	0.482783318
1519	49	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6997972	0.482782423
1520	49	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.52244449	0.482783318
1521	50	index	1	0
1522	50	userReportedIntensity	1	0
1523	50	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1524	50	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1525	50	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1526	50	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1527	50	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.87265587	0
1528	50	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-1.66235161	0
1529	50	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324516	0
1530	50	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.120326042	0
1531	50	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1532	50	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1533	50	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	3.83544183	0
1534	50	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	3.83544183	0
1535	50	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1536	50	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1537	50	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1538	50	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1539	50	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.153803453	0
1540	50	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-1.15380347	0
1541	50	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1542	50	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1543	50	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1544	50	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
1545	50	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	599.353943	0
1546	50	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	185.033081	0
1547	50	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1548	50	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1549	50	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1550	50	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1551	50	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1552	50	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1553	50	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1554	50	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1555	50	(currentLevel, Level 1/World/??/Character)	1	0
1556	50	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1557	50	(currentExp, Level 1/World/??/Character)	5	0
1558	50	(currentExp_Diff, Level 1/World/??/Character)	5	0
1559	50	(nextLevelExp, Level 1/World/??/Character)	5	0
1560	50	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1561	50	(expToNextLevel, Level 1/World/??/Character)	5	0
1563	50	(currentHealth, Level 1/World/??/Character)	100	0
1564	50	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1565	50	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1566	50	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1567	50	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1568	50	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1569	50	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1570	50	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1571	50	(levelTime, Level 1/World/Level Manager/LevelManager)	3.846199	0
1572	50	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	3.846199	0
1573	50	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.133698344	0
1574	50	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.133698344	0
1575	50	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.846199	0
1576	50	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	3.846199	0
1577	50	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1578	50	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1579	50	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1580	50	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1581	50	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1582	50	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1583	50	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1584	50	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1585	50	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1586	50	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1587	50	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1588	50	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1589	50	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1590	50	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1591	50	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1592	50	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1593	51	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1594	51	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
1595	51	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1018.22443
1596	51	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
1597	52	index	0	0
1598	52	userReportedIntensity	0	0
1599	52	(Empty, NoPath)	0	0
1600	53	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1601	53	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-3.83544183
1602	53	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1603	53	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2505639	-0.74943614
1604	53	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1605	53	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	489.8893	206.4548
1606	53	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1607	53	(currentLevel, Level 1/World/??/Character)	1	-1
1608	53	(currentExp, Level 1/World/??/Character)	0	-5
1609	53	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5005639	0.5005639
1610	53	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5005639	0.5005639
1611	53	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5005639	0.5005639
1612	54	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.53188336	0.2798314
1613	54	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324955	4.386902e-05
1614	54	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.235212117	-0.9621345
1615	54	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1616	54	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	716.919434	105.100708
1617	54	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.15980041	0.28786546
1618	54	(levelTime, Level 1/World/Level Manager/LevelManager)	2.51478863	0.287864685
1619	54	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6060962	0.2878656
1620	54	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.51478863	0.287864685
1621	55	index	1	0
1622	55	userReportedIntensity	4	0
1623	55	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1624	55	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1625	55	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1626	55	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2075	82	(nextLevelExp, Level 1/World/??/Character)	5	-6
1627	55	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.27545786	0
1628	55	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.402802	0
1629	55	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324955	0
1630	55	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.386902e-05	0
1631	55	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1632	55	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1633	55	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	4.23101759	0
1634	55	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4.23101759	0
1635	55	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1636	55	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1637	55	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1638	55	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1639	55	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.250327	0
1640	55	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.749673	0
1641	55	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1642	55	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1643	55	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1644	55	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1645	55	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	825.3745	0
1646	55	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	541.94	0
1647	55	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
1648	55	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1649	55	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1650	55	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1651	55	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1652	55	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1653	55	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1654	55	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1655	55	(currentLevel, Level 1/World/??/Character)	1	0
1656	55	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1657	55	(currentExp, Level 1/World/??/Character)	5	0
1658	55	(currentExp_Diff, Level 1/World/??/Character)	5	0
1659	55	(nextLevelExp, Level 1/World/??/Character)	5	0
1660	55	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1661	55	(expToNextLevel, Level 1/World/??/Character)	5	0
1662	55	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1663	55	(currentHealth, Level 1/World/??/Character)	100	0
1664	55	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1665	55	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1666	55	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1667	55	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.89534044	0
1668	55	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	2.89534044	0
1669	55	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1670	55	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1671	55	(levelTime, Level 1/World/Level Manager/LevelManager)	4.25032854	0
1672	55	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	4.25032854	0
1673	55	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5379728	0
1674	55	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.5379728	0
1675	55	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.25032854	0
1676	55	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	4.25032854	0
1677	55	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1678	55	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1679	55	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1680	55	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1681	55	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1682	55	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1683	55	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1684	55	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1685	55	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1686	55	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1687	55	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1688	55	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1689	55	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2076	82	(expToNextLevel, Level 1/World/??/Character)	5	-1
1690	55	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1691	55	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1692	55	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1693	56	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1694	56	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-6
1695	56	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-825.3745
1696	56	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
1697	57	index	0	0
1698	57	userReportedIntensity	0	0
1699	57	(Empty, NoPath)	0	0
1700	58	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1701	58	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4.23101759
1702	58	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
1703	58	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.251393855	-0.748606145
1704	58	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1705	58	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	937.3524	433.9488
1706	58	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1707	58	(currentLevel, Level 1/World/??/Character)	1	-1
1708	58	(currentExp, Level 1/World/??/Character)	0	-5
1709	58	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.89534044
1710	58	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5013939	0.5013939
1711	58	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5013939	0.5013939
1712	58	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5013939	0.5013939
1713	59	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.533355	0.299380183
1714	59	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322933	-0.000202178955
1715	59	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.242659286	-0.945444465
1716	59	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	5
1717	59	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1149.20117	211.848755
1718	59	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	3
1719	59	(currentExp, Level 1/World/??/Character)	3	3
1720	59	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.93865621	0.304555535
1721	59	(levelTime, Level 1/World/Level Manager/LevelManager)	2.50734019	0.304555655
1722	59	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5985299	0.304555357
1723	59	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.50734019	0.304555655
1724	60	index	1	0
1725	60	userReportedIntensity	5	0
1726	60	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1727	60	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1728	60	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1729	60	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1730	60	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.8240416	0
1731	60	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.548583746	0
1732	60	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322933	0
1733	60	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.000202178955	0
1734	60	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1735	60	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1736	60	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	4.773547	0
1737	60	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4.773547	0
1738	60	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1739	60	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1740	60	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1741	60	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1742	60	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7928511	0
1743	60	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.20714891	0
1744	60	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
1745	60	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1746	60	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
1747	60	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
1748	60	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1149.20117	0
1749	60	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	645.797546	0
1750	60	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1751	60	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1752	60	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1753	60	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1754	60	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1755	60	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1756	60	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1757	60	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1758	60	(currentLevel, Level 1/World/??/Character)	1	0
1759	60	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1760	60	(currentExp, Level 1/World/??/Character)	5	0
1761	60	(currentExp_Diff, Level 1/World/??/Character)	5	0
1762	60	(nextLevelExp, Level 1/World/??/Character)	5	0
1763	60	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1764	60	(expToNextLevel, Level 1/World/??/Character)	5	0
1765	60	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1766	60	(currentHealth, Level 1/World/??/Character)	100	0
1767	60	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1768	60	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1769	60	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1770	60	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1771	60	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1772	60	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1773	60	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1774	60	(levelTime, Level 1/World/Level Manager/LevelManager)	4.792849	0
1775	60	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	4.792849	0
1776	60	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.212835	0
1777	60	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.212835	0
1778	60	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.792849	0
1779	60	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	4.792849	0
1780	60	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1781	60	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1782	60	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1783	60	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1784	60	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1785	60	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1786	60	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1787	60	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1788	60	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1789	60	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1790	60	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1791	60	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1792	60	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1793	60	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1794	60	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1795	60	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1796	61	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
1797	61	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
1798	61	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	198.225754	197.225754
1799	62	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	307.648346	109.422592
1800	63	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1042.07886	734.430542
1801	64	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1466.28967	173.116821
1802	65	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1496.97327	5
1803	66	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3145.34473	21.3007813
1804	67	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1805	67	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7585.87549	235.9751
1806	68	index	0	0
1807	68	userReportedIntensity	0	0
1808	68	(Empty, NoPath)	0	0
1809	69	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1810	69	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4.773547
1811	69	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-5
1812	69	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.250353634	-0.749646366
1813	69	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
1814	69	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8057.938	434.499023
1815	69	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1816	69	(currentLevel, Level 1/World/??/Character)	1	-1
1817	69	(currentExp, Level 1/World/??/Character)	0	-5
1818	69	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5003538	0.5003538
2077	82	(currentHealth, Level 1/World/??/Character)	100	58
1819	69	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5003538	0.5003538
1820	69	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5003538	0.5003538
1821	70	index	1	0
1822	70	userReportedIntensity	4	0
1823	70	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1824	70	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1825	70	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1826	70	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1827	70	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.706726	0
1828	70	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-1.11731553	0
1829	70	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322924	0
1830	70	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-9.536743e-07	0
1831	70	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1832	70	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1833	70	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	3.66472816	0
1834	70	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	3.66472816	0
1835	70	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1836	70	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1837	70	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1838	70	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1839	70	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.925492644	0
1840	70	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.0745073557	0
1841	70	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
1842	70	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1843	70	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	0
1844	70	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	0
1845	70	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8379.434	0
1846	70	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	755.9946	0
1847	70	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1848	70	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1849	70	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1850	70	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1851	70	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1852	70	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1853	70	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1854	70	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1855	70	(currentLevel, Level 1/World/??/Character)	1	0
1856	70	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1857	70	(currentExp, Level 1/World/??/Character)	5	0
1858	70	(currentExp_Diff, Level 1/World/??/Character)	5	0
1859	70	(nextLevelExp, Level 1/World/??/Character)	5	0
1860	70	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1861	70	(expToNextLevel, Level 1/World/??/Character)	5	0
1862	70	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1863	70	(currentHealth, Level 1/World/??/Character)	100	0
1864	70	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1865	70	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1866	70	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1867	70	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1868	70	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1869	70	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1870	70	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1871	70	(levelTime, Level 1/World/Level Manager/LevelManager)	3.67549	0
1872	70	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	3.67549	0
1873	70	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.852810264	0
1874	70	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.852810264	0
1875	70	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.67549	0
1876	70	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	3.67549	0
1877	70	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1878	70	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1879	70	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1880	70	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1881	70	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2140	84	(nextLevelExp, Level 1/World/??/Character)	5	0
1882	70	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1883	70	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1884	70	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1885	70	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1886	70	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1887	70	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1888	70	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1889	70	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1890	70	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1891	70	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1892	70	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1893	71	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
1894	71	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-9
1895	71	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	425.370636	425.370636
1896	72	index	0	0
1897	72	userReportedIntensity	0	0
1898	72	(Empty, NoPath)	0	0
1899	73	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
1900	73	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-3.66472816
1901	73	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
1902	73	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.268840879	-0.7311591
1903	73	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
1904	73	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1039.30286	165.177246
1905	73	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
1906	73	(currentLevel, Level 1/World/??/Character)	1	-1
1907	73	(currentExp, Level 1/World/??/Character)	0	-5
1908	73	(levelTime, Level 1/World/Level Manager/LevelManager)	0.518841	0.518841
1909	73	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.518841	0.518841
1910	73	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.518841	0.518841
1911	74	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.05553341	0.2249465
1912	74	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322952	2.861023e-06
1913	74	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.279557616	0.230124891
1914	74	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
1915	74	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4875.893	1.4140625
1916	74	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	1
1917	74	(currentExp, Level 1/World/??/Character)	3	1
1918	74	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
1919	74	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.54832077	0.230124712
1920	74	(levelTime, Level 1/World/Level Manager/LevelManager)	3.02955651	0.230124712
1921	74	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.207133114	-0.6835516
1922	74	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.02955651	0.230124712
1923	75	index	1	0
1924	75	userReportedIntensity	4	0
1925	75	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
1926	75	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1927	75	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
1928	75	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
1929	75	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.383538	0
1930	75	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.6768117	0
1931	75	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322952	0
1932	75	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.861023e-06	0
1933	75	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1934	75	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
1935	75	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.34106	0
1936	75	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	5.34106	0
1937	75	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1938	75	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
1939	75	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1940	75	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
1941	75	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.102380924	0
1942	75	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.897619069	0
1943	75	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
2141	84	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1944	75	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1945	75	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	0
1946	75	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	0
1947	75	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6839.28271	0
1948	75	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5965.157	0
1949	75	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
1950	75	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
1951	75	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1952	75	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1953	75	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1954	75	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1955	75	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
1956	75	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
1957	75	(currentLevel, Level 1/World/??/Character)	1	0
1958	75	(currentLevel_Diff, Level 1/World/??/Character)	0	0
1959	75	(currentExp, Level 1/World/??/Character)	5	0
1960	75	(currentExp_Diff, Level 1/World/??/Character)	5	0
1961	75	(nextLevelExp, Level 1/World/??/Character)	5	0
1962	75	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
1963	75	(expToNextLevel, Level 1/World/??/Character)	5	0
1964	75	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
1965	75	(currentHealth, Level 1/World/??/Character)	100	0
1966	75	(currentHealth_Diff, Level 1/World/??/Character)	0	0
1967	75	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1968	75	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
1969	75	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.87114429	0
1970	75	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	4.87114429	0
1971	75	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
1972	75	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
1973	75	(levelTime, Level 1/World/Level Manager/LevelManager)	5.35238075	0
1974	75	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	5.35238075	0
1975	75	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7725965	0
1976	75	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.7725965	0
1977	75	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.35238075	0
1978	75	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	5.35238075	0
1979	75	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1980	75	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1981	75	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
1982	75	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1983	75	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1984	75	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1985	75	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1986	75	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1987	75	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
1988	75	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
1989	75	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1990	75	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
1991	75	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1992	75	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
1993	75	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1994	75	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
1995	76	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.57620144	0.19266367
1996	76	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
1997	76	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.34106	5.34106
1998	76	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.299684227	0.1973033
1999	76	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	1
2000	76	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8921.303	118.878906
2001	76	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	2
2002	76	(currentExp, Level 1/World/??/Character)	5	2
2003	76	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
2004	76	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.87114429
2005	76	(levelTime, Level 1/World/Level Manager/LevelManager)	5.549683	0.197302341
2006	76	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.123128057	-0.6494684
2007	76	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.549683	0.197302341
2008	76	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
2009	76	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
2010	77	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.58545732	0.148378849
2011	77	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
2012	77	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
2013	77	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.190188855	-1.09611309
2014	77	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2015	77	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10699.7217	8.4140625
2016	77	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
2017	77	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
2018	77	(currentLevel, Level 1/World/??/Character)	2	1
2019	77	(nextLevelExp, Level 1/World/??/Character)	11	6
2020	77	(expToNextLevel, Level 1/World/??/Character)	6	1
2021	77	(levelTime, Level 1/World/Level Manager/LevelManager)	7.55980825	0.1538868
2022	77	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.4964885	0.153886944
2023	77	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.55980825	0.1538868
2024	77	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2025	77	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2026	77	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2027	77	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2028	77	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2029	77	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.351113766
2030	78	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.111456484	-0.3306239
2031	78	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.164551243	-1.07547879
2032	78	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12725.5605	32.2714844
2033	78	(currentHealth, Level 1/World/??/Character)	86	-2
2034	78	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	86	-2
2035	78	(levelTime, Level 1/World/Level Manager/LevelManager)	12.5854492	0.174519539
2036	78	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.280232549	0.174521118
2037	78	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.5854492	0.174519539
2038	78	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	1
2039	78	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	120	30
2040	78	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	14	2
2041	78	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.329975039
2042	79	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.244779	0.18248558
2043	79	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.5230455	0.4907503
2044	79	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.142466083	-1.05923688
2045	79	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13731.3838	19.10254
2046	79	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	9	4
2047	79	(currentExp, Level 1/World/??/Character)	9	4
2048	79	(currentHealth, Level 1/World/??/Character)	42	-44
2049	79	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	42	-44
2050	79	(levelTime, Level 1/World/Level Manager/LevelManager)	17.6075287	0.190763474
2051	79	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.00314998627	-0.439389259
2052	79	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	17.6075287	0.190763474
2053	79	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	5
2054	79	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	230	110
2055	79	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	58	44
2056	79	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.310870916
2057	80	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
2058	80	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-10
2059	80	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-13731.3838
2060	81	index	0	0
2061	81	userReportedIntensity	0	0
2062	81	(Empty, NoPath)	0	0
2063	82	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
2064	82	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-5.34106
2065	82	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
2066	82	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	-1
2067	82	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.251583	-0.748417
2068	82	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2069	82	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	481.1883	41.53354
2070	82	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-9
2071	82	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
2072	82	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
2073	82	(currentLevel, Level 1/World/??/Character)	1	-1
2078	82	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	58
2079	82	(levelTime, Level 1/World/Level Manager/LevelManager)	0.501583	0.501583
2080	82	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.501583	0.501583
2081	82	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.501583	0.501583
2082	82	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2083	82	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2084	82	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2085	82	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2086	82	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2087	82	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-7
2088	82	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-230
2089	82	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-58
2090	83	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.047302	0.0459392071
2091	83	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.03246	-0.490585327
2092	83	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.279031336	0.05386503
2093	83	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
2094	83	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	772.0099	290.8216
2095	83	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
2096	83	(currentExp, Level 1/World/??/Character)	2	2
2097	83	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
2098	83	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.427414	0.0538649559
2099	83	(levelTime, Level 1/World/Level Manager/LevelManager)	3.02903032	0.0538649559
2100	83	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.206541225	0.053865
2101	83	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.02903032	0.0538649559
2102	84	index	1	0
2103	84	userReportedIntensity	4	0
2104	84	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
2105	84	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2106	84	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
2107	84	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2108	84	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.653058	0
2109	84	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.408279	0
2110	84	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.03246	0
2111	84	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.490585327	0
2112	84	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2113	84	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2114	84	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.61481333	0
2115	84	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	5.61481333	0
2116	84	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2117	84	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2118	84	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2119	84	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2120	84	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.376865745	0
2121	84	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.623134255	0
2122	84	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
2123	84	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2124	84	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
2125	84	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	0
2126	84	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	941.0998	0
2127	84	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	501.445038	0
2128	84	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
2129	84	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2130	84	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2131	84	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2132	84	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2133	84	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2134	84	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2135	84	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2136	84	(currentLevel, Level 1/World/??/Character)	1	0
2137	84	(currentLevel_Diff, Level 1/World/??/Character)	0	0
2138	84	(currentExp, Level 1/World/??/Character)	5	0
2139	84	(currentExp_Diff, Level 1/World/??/Character)	5	0
2142	84	(expToNextLevel, Level 1/World/??/Character)	5	0
2143	84	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
2144	84	(currentHealth, Level 1/World/??/Character)	100	0
2145	84	(currentHealth_Diff, Level 1/World/??/Character)	0	0
2146	84	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
2147	84	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
2148	84	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
2149	84	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
2150	84	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
2151	84	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
2152	84	(levelTime, Level 1/World/Level Manager/LevelManager)	5.626858	0
2153	84	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	5.626858	0
2154	84	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.200359628	0
2155	84	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.200359628	0
2156	84	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.626858	0
2157	84	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	5.626858	0
2158	84	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2159	84	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2160	84	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2161	84	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2162	84	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2163	84	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2164	84	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2165	84	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2166	84	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2167	84	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2168	84	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2169	84	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2170	84	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2171	84	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2172	84	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2173	84	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2174	85	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.06689453	0.413836479
2175	85	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
2176	85	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	5.61481333	5.61481333
2177	85	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7949835	0.418117762
2178	85	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
2179	85	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1153.54871	67.33435
2180	85	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
2181	85	(currentExp, Level 1/World/??/Character)	6	1
2182	85	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.427414
2183	85	(levelTime, Level 1/World/Level Manager/LevelManager)	6.04497433	0.4181161
2184	85	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6184775	0.418117881
2185	85	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.04497433	0.4181161
2186	85	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
2187	85	(currentLevel, Level 1/World/??/Character)	2	1
2188	86	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.076072	2.00917768
2189	86	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
2190	86	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3239471	0.0240708888
2191	86	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2192	86	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	2
2193	86	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1415.42346	261.874756
2194	86	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	1
2195	86	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
2196	86	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
2197	86	(currentExp, Level 1/World/??/Character)	7	1
2198	86	(nextLevelExp, Level 1/World/??/Character)	11	6
2199	86	(expToNextLevel, Level 1/World/??/Character)	6	1
2200	86	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	3
2201	86	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.56880939	0.024070859
2202	86	(levelTime, Level 1/World/Level Manager/LevelManager)	8.073942	0.02407074
2203	86	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.218204319	0.0240709037
2204	86	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.073942	0.02407074
2205	86	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2206	86	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2207	86	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2208	86	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2209	86	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2210	86	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.499875873
2211	87	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
2212	87	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-10
2213	87	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1415.42346
2214	88	index	0	0
2215	88	userReportedIntensity	0	0
2216	88	(Empty, NoPath)	0	0
2217	89	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
2218	89	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-5.61481333
2219	89	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
2220	89	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	-1
2221	89	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.253565639	-0.746434331
2222	89	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
2223	89	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2513.52515	586.2435
2224	89	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-7
2225	89	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
2226	89	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
2227	89	(currentLevel, Level 1/World/??/Character)	1	-1
2228	89	(currentExp, Level 1/World/??/Character)	0	-7
2229	89	(nextLevelExp, Level 1/World/??/Character)	5	-6
2230	89	(expToNextLevel, Level 1/World/??/Character)	5	-1
2231	89	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
2232	89	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.56880939
2233	89	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5035656	0.5035656
2234	89	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5035656	0.5035656
2235	89	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5035656	0.5035656
2236	89	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2237	89	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2238	89	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2239	89	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2240	89	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2241	90	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.56301284	0.06364584
2242	90	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0322981	-0.000162124634
2243	90	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.536251545	0.06795153
2244	90	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2245	90	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3487.8562	974.331055
2246	90	(levelTime, Level 1/World/Level Manager/LevelManager)	4.53625	0.0679512
2247	90	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.8245921	0.06795156
2248	90	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.53625	0.0679512
2249	91	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.8845144	-2.67849851
2250	91	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.967701	-30
2251	91	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8548942	0.388688773
2252	91	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5202.05225	453.6714
2253	91	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
2254	91	(currentExp, Level 1/World/??/Character)	1	1
2255	91	(currentHealth, Level 1/World/??/Character)	96	-4
2256	91	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-4
2257	91	(levelTime, Level 1/World/Level Manager/LevelManager)	9.854897	0.388689041
2258	91	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.46283713	0.3886888
2259	91	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	9.854897	0.388689041
2260	91	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
2261	91	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
2262	91	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
2263	92	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.636249	0.41943264
2264	92	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3381548	30.3058548
2265	92	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.903084755	0.426133722
2266	92	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2267	92	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10307.292	843.9453
2268	92	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	1
2269	92	(currentExp, Level 1/World/??/Character)	2	1
2270	92	(currentHealth, Level 1/World/??/Character)	84	-2
2271	92	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-2
2272	92	(levelTime, Level 1/World/Level Manager/LevelManager)	14.9030962	0.4261341
2273	92	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5391622	0.426133752
2274	92	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.9030962	0.4261341
2275	92	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	4	2
2276	92	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	120	60
2277	92	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	2
2278	93	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.6614838	0.450050354
2279	93	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.9288579	0.457276523
2280	93	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12688.2588	2380.9668
2281	93	(currentHealth, Level 1/World/??/Character)	18	-6
2282	93	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	18	-6
2283	93	(levelTime, Level 1/World/Level Manager/LevelManager)	19.9288559	0.4572792
2284	93	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.483235925	0.457276434
2285	93	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.9288559	0.4572792
2286	93	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	2
2287	93	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	180	60
2288	93	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	82	6
2289	94	index	0	0
2290	94	userReportedIntensity	0	0
2291	94	(Empty, NoPath)	0	0
2292	95	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.25007996	-0.74992
2293	95	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2294	95	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22351.14	311.761719
2295	95	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-2
2296	95	(currentExp, Level 1/World/??/Character)	0	-2
2297	95	(currentHealth, Level 1/World/??/Character)	100	100
2298	95	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	100
2299	95	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5000799	0.5000799
2300	95	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5000799	0.5000799
2301	95	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5000799	0.5000799
2302	95	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-6
2303	95	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-180
2304	95	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-100
2305	96	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.54488921	0.1947596
2306	96	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0325251	-0.30562973
2307	96	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5270306	0.201151192
2308	96	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	1
2309	96	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22822.8223	471.681641
2310	96	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	3
2311	96	(currentExp, Level 1/World/??/Character)	3	3
2312	96	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
2313	96	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.7908783	0.201151133
2314	96	(levelTime, Level 1/World/Level Manager/LevelManager)	4.52702761	0.201150417
2315	96	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.8147115	0.201151133
2316	96	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.52702761	0.201150417
2317	97	index	1	0
2318	97	userReportedIntensity	4	0
2319	97	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
2320	97	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2321	97	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
2322	97	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2323	97	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.580156	0
2324	97	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-7.59188128	0
2325	97	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.9674759	0
2326	97	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-30.30563	0
2327	97	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2328	97	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2329	97	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	7.67598534	0
2330	97	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	7.67598534	0
2331	97	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2332	97	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2333	97	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2334	97	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2335	97	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.05159466	0
2336	97	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-1.05159461	0
2337	97	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
2338	97	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2339	97	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	0
2340	97	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	0
2341	97	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22853.3945	0
2342	97	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	814.0156	0
2343	97	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
2344	97	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2345	97	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2346	97	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2347	97	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2348	97	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2349	97	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2350	97	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2351	97	(currentLevel, Level 1/World/??/Character)	1	0
2352	97	(currentLevel_Diff, Level 1/World/??/Character)	0	0
2353	97	(currentExp, Level 1/World/??/Character)	5	0
2354	97	(currentExp_Diff, Level 1/World/??/Character)	5	0
2355	97	(nextLevelExp, Level 1/World/??/Character)	5	0
2356	97	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
2357	97	(expToNextLevel, Level 1/World/??/Character)	5	0
2358	97	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
2359	97	(currentHealth, Level 1/World/??/Character)	100	0
2360	97	(currentHealth_Diff, Level 1/World/??/Character)	0	0
2361	97	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2362	97	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2363	97	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.08411181	0
2364	97	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1.08411181	0
2365	97	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
2366	97	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
2367	97	(levelTime, Level 1/World/Level Manager/LevelManager)	7.698399	0
2368	97	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	7.698399	0
2369	97	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.635156035	0
2370	97	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.635156035	0
2371	97	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.698399	0
2372	97	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	7.698399	0
2373	97	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2374	97	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2375	97	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2376	97	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2377	97	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2378	97	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2379	97	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2380	97	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2381	97	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2382	97	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2383	97	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	0
2384	97	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	2	0
2385	97	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	0
2386	97	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	60	0
2387	97	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2388	97	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2389	98	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.75949049	0.179334641
2390	98	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.2619753	30.22945
2391	98	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
2392	98	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	7.67598534	7.67598534
2393	98	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.295185655	0.3467803
2394	98	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16	1
2395	98	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23434.8535	219.537109
2396	98	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
2397	98	(currentExp, Level 1/World/??/Character)	6	1
2398	98	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
2399	98	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.08411181
2400	98	(levelTime, Level 1/World/Level Manager/LevelManager)	8.045178	0.346779346
2401	98	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.189527437	-0.445628583
2402	98	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.045178	0.346779346
2403	98	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
2404	98	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
2405	99	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.279738	0.111907959
2406	99	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
2407	99	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
2408	99	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.06633877	0.119415194
2409	99	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
2410	99	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30	14
2411	99	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23473.2246	38.3710938
2412	99	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	1
2413	99	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
2414	99	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
2415	99	(currentLevel, Level 1/World/??/Character)	2	1
2416	99	(currentExp, Level 1/World/??/Character)	7	1
2417	99	(nextLevelExp, Level 1/World/??/Character)	11	6
2418	99	(expToNextLevel, Level 1/World/??/Character)	6	1
2419	99	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	1
2420	99	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.248371288	0.119415209
2421	99	(levelTime, Level 1/World/Level Manager/LevelManager)	11.5663185	0.119413376
2422	99	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.69141525	0.119415283
2423	99	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	11.5663185	0.119413376
2424	99	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2425	99	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2426	99	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2427	99	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2428	99	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2429	99	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	130	70
2430	99	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.383098066
2431	100	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4
2432	100	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-30
2433	100	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	367.7143	367.7143
2434	101	index	0	0
2435	101	userReportedIntensity	0	0
2436	101	(Empty, NoPath)	0	0
2437	102	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
2438	102	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-7.67598534
2439	102	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
2440	102	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	-1
2441	102	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.256834239	-0.743165731
2442	102	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2443	102	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1537.34253	775.3382
2444	102	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-7
2445	102	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
2446	102	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
2447	102	(currentLevel, Level 1/World/??/Character)	1	-1
2448	102	(currentExp, Level 1/World/??/Character)	0	-7
2449	102	(nextLevelExp, Level 1/World/??/Character)	5	-6
2450	102	(expToNextLevel, Level 1/World/??/Character)	5	-1
2451	102	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
2452	102	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-0.248371288
2453	102	(levelTime, Level 1/World/Level Manager/LevelManager)	0.506834269	0.506834269
2454	102	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.506834269	0.506834269
2455	102	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.506834269	0.506834269
2456	102	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2457	102	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2458	102	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2459	102	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2460	102	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2461	102	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-2
2462	102	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-130
2527	104	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	6.819581	0
2463	103	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.56063581	0.4018166
2464	103	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324421	-0.2295332
2465	103	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7964535	0.414366663
2466	103	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
2467	103	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1600.4657	63.12317
2468	103	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
2469	103	(currentExp, Level 1/World/??/Character)	2	2
2470	103	(levelTime, Level 1/World/Level Manager/LevelManager)	3.54645324	0.414366961
2471	103	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7240445	0.4143667
2472	103	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.54645324	0.414366961
2473	103	(screenHeightWorldSpace, Level 1/World/Level Manager/????/EntityManager)	4.68229151	0.01380825
2474	103	(screenDiagonalWorldSpace, Level 1/World/Level Manager/????/EntityManager)	11.041913	0.005847931
2475	103	(minSpawnDistance, Level 1/World/Level Manager/????/EntityManager)	5.52095652	0.00292396545
2476	104	index	1	0
2477	104	userReportedIntensity	4	0
2478	104	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	2	0
2479	104	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2480	104	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	32.5379753	0
2481	104	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2482	104	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.31643867	0
2483	104	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-3.96329975	0
2484	104	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1529531	0
2485	104	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.109022141	0
2486	104	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2487	104	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2488	104	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.80584145	0
2489	104	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	6.80584145	0
2490	104	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2491	104	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2492	104	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2493	104	(level_Diff, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
2494	104	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3195827	0
2495	104	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.6804173	0
2496	104	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
2497	104	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2498	104	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12	0
2499	104	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12	0
2500	104	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1600.4657	0
2501	104	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	838.461365	0
2502	104	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	0
2503	104	(Seed_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2504	104	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2505	104	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2506	104	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2507	104	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2508	104	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2509	104	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2510	104	(currentLevel, Level 1/World/??/Character)	1	0
2511	104	(currentLevel_Diff, Level 1/World/??/Character)	0	0
2512	104	(currentExp, Level 1/World/??/Character)	5	0
2513	104	(currentExp_Diff, Level 1/World/??/Character)	5	0
2514	104	(nextLevelExp, Level 1/World/??/Character)	5	0
2515	104	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
2516	104	(expToNextLevel, Level 1/World/??/Character)	5	0
2517	104	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
2518	104	(currentHealth, Level 1/World/??/Character)	100	0
2519	104	(currentHealth_Diff, Level 1/World/??/Character)	0	0
2520	104	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2521	104	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2522	104	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.8025645	0
2523	104	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1.8025645	0
2524	104	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
2525	104	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
2526	104	(levelTime, Level 1/World/Level Manager/LevelManager)	6.819581	0
2528	104	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5661074	0
2529	104	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.5661074	0
2530	104	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.819581	0
2531	104	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	6.819581	0
2532	104	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2533	104	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2534	104	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2535	104	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2536	104	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2537	104	(<AOEUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2538	104	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2539	104	(<ProjectileCountUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2540	104	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2541	104	(<RotationSpeedUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2542	104	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
2543	104	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
2544	104	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
2545	104	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
2546	104	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2547	104	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2548	105	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.55989456	0.243455887
2549	105	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1529531	0.120511055
2550	105	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
2551	105	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.80584145	6.80584145
2552	105	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.578121245	0.258538544
2553	105	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	1
2554	105	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	3
2555	105	(currentExp, Level 1/World/??/Character)	5	3
2556	105	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
2557	105	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.8025645
2558	105	(levelTime, Level 1/World/Level Manager/LevelManager)	7.07811975	0.258538723
2559	105	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.01521413	-0.550893247
2560	105	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.07811975	0.258538723
2561	105	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
2562	105	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
3853	329	(killcounter, Statics/Enemy)	0	-1
3855	329	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
3856	329	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
3857	329	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-6818.27539
3858	329	(Seed, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	-2075831810
3859	329	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3860	329	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
3861	329	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
3862	330	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2094.11816	192.3352
3863	330	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3864	330	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3865	330	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3866	330	(timeSpendIdle, ScriptableObjects/Statistics)	4.999996	0.359999657
3867	331	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
3868	331	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4094.05957	651.605469
3869	331	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3870	331	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
3871	331	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
3872	331	(timeSpendIdle, ScriptableObjects/Statistics)	10.04004	0.400009155
3873	332	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
3874	332	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6740.076	2646.0166
3875	332	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3876	332	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3877	332	(timeSpendIdle, ScriptableObjects/Statistics)	14.7201471	0.08000183
3878	333	(jumpCounter, ScriptableObjects/Statistics)	3	3
3879	333	(killcounter, Statics/Enemy)	1	1
3880	333	(score, Statics/Score)	5	2
3881	333	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
3882	333	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3883	333	(moveDirection, 1/Player/CharacterControl)	1	1
2564	106	userReportedIntensity	0	0
2565	106	(Empty, NoPath)	0	0
3884	333	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
3885	333	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3886	335	(score, Statics/Score)	8	3
3887	335	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8662.294	1922.21777
3888	335	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3889	335	(moveDirection, 1/Player/CharacterControl)	0	-1
3890	335	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3891	335	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
3892	335	(timeSpendIdle, ScriptableObjects/Statistics)	18.1002235	0.0200004578
3893	336	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12419.1572	2821.11719
3894	336	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3895	336	(timeSpendIdle, ScriptableObjects/Statistics)	20.16027	0.340007782
3896	337	(jumpCounter, ScriptableObjects/Statistics)	7	4
3897	337	(score, Statics/Score)	10	2
3898	337	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3899	337	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	8
3900	337	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12427.9453	8.788086
3901	337	(moveDirection, 1/Player/CharacterControl)	1	1
3902	337	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3903	337	(timeSpendIdle, ScriptableObjects/Statistics)	20.4602776	0.300006866
3904	339	(jumpCounter, ScriptableObjects/Statistics)	8	1
3905	339	(deathcounter, Statics/Death)	1	1
3906	339	(health, Statics/HealthSystem)	2	-1
3907	339	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	4
3908	339	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3909	339	(moveDirection, 1/Player/CharacterControl)	0	-1
3910	339	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3911	339	(timeSpendIdle, ScriptableObjects/Statistics)	22.2403183	0.300006866
3912	340	(deathcounter, Statics/Death)	0	-1
3913	340	(killcounter, Statics/Enemy)	0	-1
3914	340	(health, Statics/HealthSystem)	3	1
3915	340	(score, Statics/Score)	0	-10
3916	340	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
3917	340	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-18
3918	340	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	158.138	157.1954
3919	340	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
3920	340	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
3921	340	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
3983	356	(jumpCounter, ScriptableObjects/Statistics)	4	1
3984	356	(killcounter, Statics/Enemy)	1	1
3985	356	(score, Statics/Score)	8	5
3986	356	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	3
3987	356	(moveDirection, 1/Player/CharacterControl)	0	-1
3988	356	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3989	356	(timeSpendIdle, ScriptableObjects/Statistics)	1.23999941	0.459999621
3990	357	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1729.66577	1214.74268
3991	357	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3992	357	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
3993	357	(timeSpendIdle, ScriptableObjects/Statistics)	6.279995	0.499999523
3994	358	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2922.5498	1192.884
3995	358	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3996	358	(timeSpendIdle, ScriptableObjects/Statistics)	10.8200579	0.0400009155
3997	359	(timeSpendIdle, ScriptableObjects/Statistics)	11.3200693	0.440010071
3998	361	(jumpCounter, ScriptableObjects/Statistics)	0	-4
3999	361	(killcounter, Statics/Enemy)	0	-1
4000	361	(score, Statics/Score)	0	-8
4001	361	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
4002	361	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-6
4003	361	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2922.5498
4004	361	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4005	361	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4006	361	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4007	361	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	-11.3000689
4008	363	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
4009	363	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4010	363	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4011	363	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4012	363	(timeSpendIdle, ScriptableObjects/Statistics)	2.859998	0.239999771
4013	364	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
4014	364	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4015	364	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4016	364	(index, 1/Checkpoints/CheckPoint3 (3)/CheckpointEventEmitter)	4	-1
4017	364	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
2567	0	userReportedIntensity	0	0
2568	0	(Empty, NoPath)	0	0
2569	1	index	1	0
2570	1	userReportedIntensity	2	0
2571	2	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
2572	2	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	1
2573	2	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6050.02734	12
2574	2	(currentLevel, Level 1/World/??/Character)	2	1
2575	3	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	3
2576	3	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	18.2131557	0.490726471
2577	3	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.27223444	0.4907291
2578	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.020723274	-0.263860345
2579	3	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
2580	3	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.279036939	0.4907273
2581	3	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2582	3	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	1
2583	3	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6155.042	6
2584	3	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	10	2
2585	3	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
2586	3	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
2587	3	(currentExp, Level 1/World/??/Character)	10	2
2588	3	(nextLevelExp, Level 1/World/??/Character)	11	6
2589	3	(expToNextLevel, Level 1/World/??/Character)	6	1
2590	3	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
2591	3	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.6245718	0.490727663
2592	3	(levelTime, Level 1/World/Level Manager/LevelManager)	10.5290327	0.490722656
2593	3	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.387724876	-0.256617725
2594	3	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.5290327	0.490722656
2595	3	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2596	3	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2597	3	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2598	3	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2599	3	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2600	3	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2601	4	index	2	0
2602	4	userReportedIntensity	2	0
2603	5	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0.0747337341
2604	5	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.27599859	0.07473278
2605	5	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.20855999	-10
2606	5	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	1
2607	5	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	11.4470005	4.954342
2608	5	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.274666935	0.07032548
2609	5	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0328005143	0.074733004
2610	5	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	5
2611	5	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6493.44434	18.4780273
2612	5	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	1
2613	5	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
2614	5	(currentLevel, Level 1/World/??/Character)	3	1
2615	5	(currentExp, Level 1/World/??/Character)	11	1
2616	5	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3.6245718
2617	5	(levelTime, Level 1/World/Level Manager/LevelManager)	11.5327883	0.07473278
2618	5	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6575517	0.07473296
2619	5	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	11.5327883	0.07473278
2620	5	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
2621	5	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	55	55
3854	329	(score, Statics/Score)	1	-8
4018	364	(index, 1/Checkpoints/CheckPoint3 (1)/CheckpointEventEmitter)	3	-1
2624	259	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.08070326	0.100093365
2625	259	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3104524	0.105805025
2626	259	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6063.00439	3863.65112
2627	259	(levelTime, Level 1/World/Level Manager/LevelManager)	8.060449	0.10580349
2628	259	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.204592422	0.10580498
2629	259	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.060449	0.10580349
2630	260	index	0	0
2631	260	userReportedIntensity	0	0
2632	260	(Empty, NoPath)	0	0
2633	261	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2548686	0.498384446
2634	261	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2635	261	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15671.0664	330.609375
2636	261	(currentHealth, Level 1/World/??/Character)	100	100
2637	261	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	100
2638	261	(levelTime, Level 1/World/Level Manager/LevelManager)	0.504868448	0.498384356
2639	261	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.504868448	0.498384356
2640	261	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.504868448	0.498384356
2641	261	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
2642	261	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
2643	261	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-100
2644	262	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.056566	0.03212166
2645	262	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323734	-9.441376e-05
2646	262	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.216547251	-1.21219885
2647	262	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
2648	262	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	4
2649	262	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15795.1875	124.121094
2650	262	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	4	4
2651	262	(currentExp, Level 1/World/??/Character)	4	4
2652	262	(levelTime, Level 1/World/Level Manager/LevelManager)	5.033449	0.03780079
2653	262	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.4536207	0.0378010869
2654	262	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.033449	0.03780079
2655	263	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-4
2656	263	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
2657	263	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	53.4134827	53.4134827
2658	264	index	0	0
2659	264	userReportedIntensity	0	0
2660	264	(Empty, NoPath)	0	0
2661	265	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
2662	265	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-6.86379671
2663	265	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.256046653	-0.743953347
2664	265	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2665	265	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	772.948853	245.0094
2666	265	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
2667	265	(currentExp, Level 1/World/??/Character)	0	-5
2668	265	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.09731861	0.09731861
2669	265	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5060467	0.5060467
2670	265	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5060467	0.5060467
2671	265	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5060467	0.5060467
2672	265	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-2
2673	265	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-60
2674	266	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.04531574	0.13711369
2675	266	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324039	3.05175781e-05
2676	266	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2718207	0.1415058
2677	266	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
2678	266	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1086.98889	3
2679	266	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
2680	266	(currentExp, Level 1/World/??/Character)	1	1
2681	266	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.61309338	0.141505957
2682	266	(levelTime, Level 1/World/Level Manager/LevelManager)	3.0218215	0.141505957
2683	266	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.199197367	0.141505808
2684	266	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.0218215	0.141505957
2685	267	index	1	0
2686	267	userReportedIntensity	4	0
2687	267	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
2688	267	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2689	267	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
2690	267	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2691	267	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.45267	0
2692	267	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.5471091	0
2693	267	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324039	0
2694	267	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.05175781e-05	0
2695	267	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
4406	455	index	0	0
2696	267	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2697	267	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	7.41313171	0
2698	267	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	7.41313171	0
2699	267	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2700	267	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2701	267	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2702	267	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2703	267	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2704	267	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2705	267	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.9247898	0
2706	267	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.07521021	0
2707	267	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
2708	267	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2709	267	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	0
2710	267	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	0
2711	267	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1277.42871	0
2712	267	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	749.489258	0
2713	267	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2714	267	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2715	267	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2716	267	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2717	267	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2718	267	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2719	267	(currentLevel, Level 1/World/??/Character)	1	0
2720	267	(currentLevel_Diff, Level 1/World/??/Character)	0	0
2721	267	(currentExp, Level 1/World/??/Character)	5	0
2722	267	(currentExp_Diff, Level 1/World/??/Character)	5	0
2723	267	(nextLevelExp, Level 1/World/??/Character)	5	0
2724	267	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
2725	267	(expToNextLevel, Level 1/World/??/Character)	5	0
2726	267	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
2727	267	(currentHealth, Level 1/World/??/Character)	100	0
2728	267	(currentHealth_Diff, Level 1/World/??/Character)	0	0
2729	267	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2730	267	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
2731	267	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	7.01605463	0
2732	267	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	7.01605463	0
2733	267	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
2734	267	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	0	0
2735	267	(levelTime, Level 1/World/Level Manager/LevelManager)	7.42478275	0
2736	267	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	7.42478275	0
2737	267	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.361307025	0
2738	267	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.361307025	0
2739	267	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.42478275	0
2740	267	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	7.42478275	0
2741	267	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2742	267	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2743	267	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2744	267	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2745	267	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2746	267	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2747	267	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2748	267	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2749	267	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2750	267	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2751	267	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
2752	267	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
2753	267	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2754	267	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2755	267	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2756	267	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2757	267	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
2758	267	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
3204	287	userReportedIntensity	0	0
2759	268	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.56762552	0.114955425
2760	268	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
2761	268	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	7.41313171	7.41313171
2762	268	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.205017373	-1.12980711
2763	268	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	1
2764	268	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1362.57971	85.151
2765	268	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	4
2766	268	(currentExp, Level 1/World/??/Character)	5	4
2767	268	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
2768	268	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-7.01605463
2769	268	(levelTime, Level 1/World/Level Manager/LevelManager)	7.54497576	0.120193005
2770	268	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.48149994	0.120192915
2771	268	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.54497576	0.120193005
2772	269	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.081304	0.451151848
2773	269	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
2774	269	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.128632039	-0.298846424
2775	269	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
2776	269	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.191008165	-0.7932763
2777	269	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
2778	269	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	1
2779	269	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1415.38977	52.81006
2780	269	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	1
2781	269	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
2782	269	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
2783	269	(currentLevel, Level 1/World/??/Character)	2	1
2784	269	(currentExp, Level 1/World/??/Character)	7	1
2785	269	(nextLevelExp, Level 1/World/??/Character)	11	6
2786	269	(expToNextLevel, Level 1/World/??/Character)	6	1
2787	269	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	3
2788	269	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.36249232	0.4567237
2789	269	(levelTime, Level 1/World/Level Manager/LevelManager)	10.0589914	0.45672226
2790	269	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.66514504	0.45672363
2791	269	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.0589914	0.45672226
2792	269	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2793	269	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2794	269	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
2795	269	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2796	269	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2797	269	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
2798	269	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0460491
2799	270	index	2	0
2800	270	userReportedIntensity	2	0
2801	270	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
2802	270	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2803	270	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
2804	270	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2805	270	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.93284929	0
2806	270	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-4.51982069	0
2807	270	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4564161	0
2808	270	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.424012184	0
2809	270	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
2810	270	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2811	270	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	14.4289837	0
2812	270	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	7.015852	0
2813	270	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	0
2814	270	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	4	0
2815	270	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.0158518869	0
2816	270	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.0158518869	0
2817	270	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
2818	270	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
2819	270	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.440642148	0
2820	270	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.484147638	0
2821	270	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
2822	270	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
2823	270	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25	0
2824	270	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	0
2825	270	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1415.38977	0
2826	270	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	137.96106	0
2827	270	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
2828	270	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
2829	270	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2830	270	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2831	270	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
2832	270	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
2833	270	(currentLevel, Level 1/World/??/Character)	2	0
2834	270	(currentLevel_Diff, Level 1/World/??/Character)	1	0
2835	270	(currentExp, Level 1/World/??/Character)	11	0
2836	270	(currentExp_Diff, Level 1/World/??/Character)	6	0
2837	270	(nextLevelExp, Level 1/World/??/Character)	11	0
2838	270	(nextLevelExp_Diff, Level 1/World/??/Character)	6	0
2839	270	(expToNextLevel, Level 1/World/??/Character)	6	0
2840	270	(expToNextLevel_Diff, Level 1/World/??/Character)	1	0
2841	270	(currentHealth, Level 1/World/??/Character)	92	0
2842	270	(currentHealth_Diff, Level 1/World/??/Character)	-8	0
2843	270	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
2844	270	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
2845	270	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	6.74414444	0
2846	270	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	-0.2719102	0
2847	270	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	0
2848	270	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-8	0
2849	270	(levelTime, Level 1/World/Level Manager/LevelManager)	14.4406395	0
2850	270	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	7.01585674	0
2851	270	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.07505593	0
2852	270	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	-0.2862511	0
2853	270	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.4406395	0
2854	270	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	7.01585674	0
2855	270	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
2856	270	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2857	270	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
2858	270	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2859	270	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
2860	270	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2861	270	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2862	270	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2863	270	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2864	270	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2865	270	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
2866	270	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
2867	270	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	0
2868	270	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	5	0
2869	270	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	115	0
2870	270	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	115	0
2871	270	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	0
2872	270	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	8	0
2873	271	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.07513666	0.142287374
2874	271	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4564161	0.424012184
2875	271	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	1
2876	271	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	14.4289837	7.015852
2877	271	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.158138976	0.14228709
2878	271	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.589139163	0.148497015
2879	271	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28	1
2880	271	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	4
2881	271	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
2882	271	(currentExp, Level 1/World/??/Character)	11	4
2883	271	(currentHealth, Level 1/World/??/Character)	92	-8
2884	271	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-6.74414444
2885	271	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-8
2886	271	(levelTime, Level 1/World/Level Manager/LevelManager)	14.5891333	0.148493767
2887	271	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.223552823	0.1484969
2888	271	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.5891333	0.148493767
2889	271	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	5
2890	271	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	115	115
2891	271	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	8
2892	271	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
2893	271	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	1
2894	271	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.356842726
2895	272	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
2896	272	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-28
2897	272	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39.8246155	39.8246155
2898	273	index	0	0
2899	273	userReportedIntensity	0	0
2900	273	(Empty, NoPath)	0	0
2901	274	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
2902	274	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-14.4289837
2903	274	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
2904	274	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-0.158138976
2905	274	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-1
2906	274	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.250508547	-0.749491453
2907	274	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
2908	274	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	377.0396	337.215
2909	274	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
2910	274	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
2911	274	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
2912	274	(currentLevel, Level 1/World/??/Character)	1	-1
2913	274	(currentExp, Level 1/World/??/Character)	0	-11
2914	274	(nextLevelExp, Level 1/World/??/Character)	5	-6
2915	274	(expToNextLevel, Level 1/World/??/Character)	5	-1
2916	274	(currentHealth, Level 1/World/??/Character)	100	8
2917	274	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
2918	274	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	8
2919	274	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5005085	0.5005085
2920	274	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5005085	0.5005085
2921	274	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5005085	0.5005085
2922	274	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2923	274	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2924	274	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
2925	274	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2926	274	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2927	274	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
2928	274	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-5
2929	274	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-115
2930	274	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-8
2931	274	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-2
2932	275	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.03940463	0.2993971
2933	275	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323973	-0.42401886
2934	275	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.26572448	0.303785741
2935	275	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	4
2936	275	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	548.6537	171.614075
2937	275	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
2938	275	(currentExp, Level 1/World/??/Character)	2	2
2939	275	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-1
2940	275	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.74836957	0.3037858
2941	275	(levelTime, Level 1/World/Level Manager/LevelManager)	3.01572514	0.303784847
2942	275	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.193117544	-0.610153139
2943	275	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.01572514	0.303784847
2944	276	index	1	0
2945	276	userReportedIntensity	2	0
2946	276	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
2947	276	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2948	276	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
3205	287	(Empty, NoPath)	0	0
2949	276	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
2950	276	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.62779474	0
2951	276	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.552658	0
2952	276	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323973	0
2953	276	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.42401886	0
2954	276	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2955	276	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
2956	276	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.497221	0
2957	276	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	6.497221	0
2958	276	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2959	276	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
2960	276	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2961	276	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2962	276	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2963	276	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
2964	276	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.09972334	0
2965	276	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.900276661	0
2966	276	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
2967	276	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
2968	276	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	0
2969	276	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	0
2970	276	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	548.6537	0
2971	276	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	171.614075	0
2972	276	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2973	276	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2974	276	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2975	276	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2976	276	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
2977	276	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
2978	276	(currentLevel, Level 1/World/??/Character)	1	0
2979	276	(currentLevel_Diff, Level 1/World/??/Character)	0	0
2980	276	(currentExp, Level 1/World/??/Character)	5	0
2981	276	(currentExp_Diff, Level 1/World/??/Character)	5	0
2982	276	(nextLevelExp, Level 1/World/??/Character)	5	0
2983	276	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
2984	276	(expToNextLevel, Level 1/World/??/Character)	5	0
2985	276	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
2986	276	(currentHealth, Level 1/World/??/Character)	94	0
2987	276	(currentHealth_Diff, Level 1/World/??/Character)	-6	0
2988	276	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
2989	276	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
2990	276	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.184893027	0
2991	276	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0.184893027	0
2992	276	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	94	0
2993	276	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-6	0
2994	276	(levelTime, Level 1/World/Level Manager/LevelManager)	6.599725	0
2995	276	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	6.599725	0
2996	276	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.346282631	0
2997	276	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.346282631	0
2998	276	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.599725	0
2999	276	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	6.599725	0
3000	276	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3001	276	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3002	276	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3003	276	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3004	276	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3005	276	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3006	276	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3007	276	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3008	276	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3009	276	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3010	276	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3011	276	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3012	276	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
3013	276	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
3014	276	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
3015	276	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	30	0
3016	276	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	6	0
3017	276	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	6	0
3018	276	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
3019	276	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
3020	277	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.05684376	0.429049015
3021	277	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
3022	277	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	6.497221	6.497221
3023	277	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.533183455	0.433460116
3024	277	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12	2
3025	277	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	3
3026	277	(currentExp, Level 1/World/??/Character)	5	3
3027	277	(currentHealth, Level 1/World/??/Character)	94	-6
3028	277	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.312907666	0.128014639
3029	277	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	94	-6
3030	277	(levelTime, Level 1/World/Level Manager/LevelManager)	7.033183	0.433458328
3031	277	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7797426	0.433459967
3032	277	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.033183	0.433458328
3033	277	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
3034	277	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
3035	277	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	6	6
3036	277	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1263.543	417.050842
3037	278	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.071678	0.239020348
3038	278	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
3039	278	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.193884879	0.239021331
3040	278	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
3041	278	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.202263638	-1.00685036
3042	278	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3043	278	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16	4
3044	278	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
3045	278	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
3046	278	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3047	278	(currentLevel, Level 1/World/??/Character)	2	1
3048	278	(currentExp, Level 1/World/??/Character)	6	1
3049	278	(nextLevelExp, Level 1/World/??/Character)	11	6
3050	278	(expToNextLevel, Level 1/World/??/Character)	6	1
3051	278	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-1
3052	278	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.32746029	0.243149281
3053	278	(levelTime, Level 1/World/Level Manager/LevelManager)	10.0477428	0.2431488
3054	278	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.654493868	0.2431494
3055	278	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.0477428	0.2431488
3056	278	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3057	278	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3058	278	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3059	278	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3060	278	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3061	278	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3062	278	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	1
3063	278	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	70	40
3064	278	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.258521229
3065	279	index	2	0
3066	279	userReportedIntensity	4	0
3067	279	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
3068	279	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3069	279	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
3070	279	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3071	279	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.4887953	0
3072	279	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.86100054	0
3136	279	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	160	0
3073	279	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323973	0
3074	279	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0	0
3075	279	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3076	279	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
3077	279	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	14.3582211	0
3078	279	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	7.861	0
3079	279	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3080	279	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3081	279	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.111000679	0
3082	279	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.111000679	0
3083	279	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
3084	279	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
3085	279	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.460724384	0
3086	279	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.361001045	0
3087	279	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
3088	279	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
3089	279	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	0
3090	279	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	0
3091	279	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1263.543	0
3092	279	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	714.8893	0
3093	279	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
3094	279	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
3095	279	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3096	279	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3097	279	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
3098	279	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
3099	279	(currentLevel, Level 1/World/??/Character)	2	0
3100	279	(currentLevel_Diff, Level 1/World/??/Character)	1	0
3101	279	(currentExp, Level 1/World/??/Character)	11	0
3102	279	(currentExp_Diff, Level 1/World/??/Character)	6	0
3103	279	(nextLevelExp, Level 1/World/??/Character)	11	0
3104	279	(nextLevelExp_Diff, Level 1/World/??/Character)	6	0
3105	279	(expToNextLevel, Level 1/World/??/Character)	6	0
3106	279	(expToNextLevel_Diff, Level 1/World/??/Character)	1	0
3107	279	(currentHealth, Level 1/World/??/Character)	90	0
3108	279	(currentHealth_Diff, Level 1/World/??/Character)	-4	0
3109	279	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
3110	279	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	0	0
3111	279	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	7.74045	0
3112	279	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	7.555557	0
3113	279	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	0
3114	279	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-4	0
3115	279	(levelTime, Level 1/World/Level Manager/LevelManager)	14.4607315	0
3116	279	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	7.86100674	0
3117	279	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0955387652	0
3118	279	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	-0.250743866	0
3119	279	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.4607315	0
3120	279	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	7.86100674	0
3121	279	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3122	279	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3123	279	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3124	279	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3125	279	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3126	279	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3127	279	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3128	279	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3129	279	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3130	279	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3131	279	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3132	279	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3133	279	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	0
3134	279	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	6	0
3135	279	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	190	0
3137	279	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
3138	279	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	4	0
3139	279	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
3140	279	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	1	0
3141	280	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.5964565	0.107661247
3142	280	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	1
3143	280	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	14.3582211	7.861
3144	280	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.218664587	0.107663907
3145	280	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5745093	0.113784939
3146	280	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	1
3147	280	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	5
3148	280	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
3149	280	(currentExp, Level 1/World/??/Character)	11	5
3150	280	(currentHealth, Level 1/World/??/Character)	90	-4
3151	280	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-7.74045
3152	280	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	-4
3153	280	(levelTime, Level 1/World/Level Manager/LevelManager)	14.5745134	0.113781929
3154	280	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.209323764	0.113785
3155	280	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.5745134	0.113781929
3156	280	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	5
3157	280	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	190	120
3158	280	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	4
3159	280	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	6	5
3160	280	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
3161	280	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.389668256
3162	282	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
3163	282	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-22
3164	282	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	149.5846	149.5846
3165	283	index	0	0
3166	283	userReportedIntensity	0	0
3167	283	(Empty, NoPath)	0	0
3168	284	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
3169	284	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-14.3582211
3170	284	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-4
3171	284	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-0.218664587
3172	284	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-1
3173	284	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.253309935	-0.746690035
3174	284	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
3175	284	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	470.6436	66.78525
3176	284	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
3177	284	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
3178	284	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
3179	284	(currentLevel, Level 1/World/??/Character)	1	-1
3180	284	(currentExp, Level 1/World/??/Character)	0	-11
3181	284	(nextLevelExp, Level 1/World/??/Character)	5	-6
3182	284	(expToNextLevel, Level 1/World/??/Character)	5	-1
3183	284	(currentHealth, Level 1/World/??/Character)	100	10
3184	284	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3185	284	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	10
3186	284	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5033099	0.5033099
3187	284	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5033099	0.5033099
3188	284	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5033099	0.5033099
3189	284	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3190	284	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3191	284	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3192	284	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3193	284	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3194	284	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3195	284	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-7
3196	284	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-190
3197	284	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-10
3198	284	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-6
3199	285	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
3200	285	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-470.6436
3201	286	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
3202	286	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4003.67041	181.5669
3203	287	index	0	0
3206	288	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.254334658	-0.7456653
3207	288	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
3208	288	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4372.23047	367.560059
3209	288	(levelTime, Level 1/World/Level Manager/LevelManager)	0.50433445	0.50433445
3210	288	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.50433445	0.50433445
3211	288	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.50433445	0.50433445
3212	289	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.54708171	0.1449902
3213	289	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323305	-6.67572e-05
3214	289	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5211602	0.149139047
3215	289	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
3216	289	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5389.68359	7.4140625
3217	289	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
3218	289	(currentExp, Level 1/World/??/Character)	2	2
3219	289	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
3220	289	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.01878285	0.149139285
3221	289	(levelTime, Level 1/World/Level Manager/LevelManager)	4.52116156	0.149138927
3222	289	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.8086374	0.149138987
3223	289	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.52116156	0.149138927
3224	290	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.86345863	0.3013997
3225	290	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.2353029	0.202972412
3226	290	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.239110112	-0.7232692
3227	290	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7721.75439	342.388184
3228	290	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	1
3229	290	(currentExp, Level 1/World/??/Character)	3	1
3230	290	(currentHealth, Level 1/World/??/Character)	84	-4
3231	290	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.01878285
3232	290	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-4
3233	290	(levelTime, Level 1/World/Level Manager/LevelManager)	9.239116	0.526730537
3234	290	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6135114	0.526730835
3235	290	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	9.239116	0.526730537
3236	290	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
3237	290	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
3238	290	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	4
3239	291	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
3240	291	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-6
3241	291	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	207.885773	207.885773
3242	292	index	0	0
3243	292	userReportedIntensity	0	0
3244	292	(Empty, NoPath)	0	0
3245	293	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.250659555	0.3167066
3246	293	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
3247	293	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2204.01172	3
3248	293	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-3
3249	293	(currentExp, Level 1/World/??/Character)	0	-3
3250	293	(currentHealth, Level 1/World/??/Character)	100	16
3251	293	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	16
3252	293	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5006596	0.316706568
3253	293	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5006596	0.316706568
3254	293	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5006596	0.316706568
3255	293	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-1
3256	293	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-30
3257	293	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-16
3258	294	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.58374834	0.365493774
3259	294	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324306	-0.202872276
3260	294	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.312352419	0.371171385
3261	294	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3610.21582	1406.2041
3262	294	(levelTime, Level 1/World/Level Manager/LevelManager)	5.56235266	0.371171
3263	294	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.135556564	-0.47557503
3264	294	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.56235266	0.371171
3265	295	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.473684	0.253790855
3266	295	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.370443463	0.4276077
3267	295	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6640.404	94.42969
3268	295	(currentHealth, Level 1/World/??/Character)	92	-2
3269	295	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-2
3270	295	(levelTime, Level 1/World/Level Manager/LevelManager)	10.6204243	0.427607536
3271	295	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.479116261	0.427607745
3272	295	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.6204243	0.427607536
3273	295	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	2
3274	296	index	1	0
3275	296	userReportedIntensity	2	0
3276	296	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
3277	296	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3278	296	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
3279	296	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3280	296	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.3601313	0
3281	296	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.49667263	0
3282	296	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324306	0
3283	296	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-0.202872276	0
3284	296	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
3285	296	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
3286	296	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	15.2627268	0
3287	296	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	15.2627268	0
3288	296	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
3289	296	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
3290	296	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
3291	296	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
3292	296	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
3293	296	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
3294	296	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.08306966	0
3295	296	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.9169303	0
3296	296	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
3297	296	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
3298	296	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	0
3299	296	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	0
3300	296	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7729.64551	0
3301	296	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5532.634	0
3302	296	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
3303	296	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
3304	296	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3305	296	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3306	296	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
3307	296	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3308	296	(currentLevel, Level 1/World/??/Character)	1	0
3309	296	(currentLevel_Diff, Level 1/World/??/Character)	0	0
3310	296	(currentExp, Level 1/World/??/Character)	5	0
3311	296	(currentExp_Diff, Level 1/World/??/Character)	5	0
3312	296	(nextLevelExp, Level 1/World/??/Character)	5	0
3313	296	(nextLevelExp_Diff, Level 1/World/??/Character)	0	0
3314	296	(expToNextLevel, Level 1/World/??/Character)	5	0
3315	296	(expToNextLevel_Diff, Level 1/World/??/Character)	0	0
3316	296	(currentHealth, Level 1/World/??/Character)	90	0
3317	296	(currentHealth_Diff, Level 1/World/??/Character)	-10	0
3318	296	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
3319	296	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	3	0
3320	296	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.337904	0
3321	296	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	4.337904	0
3322	296	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	0
3323	296	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-10	0
3324	296	(levelTime, Level 1/World/Level Manager/LevelManager)	15.3330545	0
3325	296	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	15.3330545	0
3326	296	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.301144958	0
3327	296	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	0.301144958	0
3328	296	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.3330545	0
3329	296	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	15.3330545	0
3330	296	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3331	296	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3332	296	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3395	298	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
3333	296	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3334	296	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3335	296	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3336	296	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3337	296	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3338	296	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3339	296	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3340	296	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
3341	296	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	0	0
3342	296	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	0
3343	296	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	2	0
3344	296	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	0
3345	296	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	90	0
3346	296	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
3347	296	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
3348	296	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
3349	296	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
3350	297	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.6674471	0.307315826
3351	297	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3957267	0.312657058
3352	297	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	2
3353	297	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7991.1626	261.5171
3354	297	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
3355	297	(currentExp, Level 1/World/??/Character)	6	1
3356	297	(currentHealth, Level 1/World/??/Character)	90	-2
3357	297	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
3358	297	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.0186875984	-4.31921625
3359	297	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	-2
3360	297	(levelTime, Level 1/World/Level Manager/LevelManager)	15.64571	0.312655449
3361	297	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.613801837	0.312656879
3362	297	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.64571	0.312655449
3363	297	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	1
3364	297	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	30
3365	297	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	2
3366	297	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	1	1
3367	297	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	15.2627268	15.2627268
3368	298	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.173767954	-0.125669062
3369	298	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
3370	298	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.06364109	-0.375669032
3371	298	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
3372	298	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.6524539	0.3800743
3373	298	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3374	298	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	2
3375	298	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8021.64063	30.4780273
3376	298	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
3377	298	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3378	298	(currentLevel, Level 1/World/??/Character)	2	1
3379	298	(nextLevelExp, Level 1/World/??/Character)	11	6
3380	298	(expToNextLevel, Level 1/World/??/Character)	6	1
3381	298	(currentHealth, Level 1/World/??/Character)	84	-4
3382	298	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	3
3383	298	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.52541518	0.380074263
3384	298	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-4
3385	298	(levelTime, Level 1/World/Level Manager/LevelManager)	17.1524277	0.380073547
3386	298	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.177965745	-0.258552969
3387	298	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	17.1524277	0.380073547
3388	298	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3389	298	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3390	298	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3391	298	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3392	298	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3393	298	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3394	298	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	4
3586	311	(currentLevel, Level 1/World/??/Character)	2	1
3396	298	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.121402591
3397	299	index	2	0
3398	299	userReportedIntensity	2	0
3399	299	(currSequenceFrame, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	3	0
3400	299	(currSequenceFrame_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3401	299	(animationTime, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	19.21692	0
3402	299	(animationTime_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/Sprite / Hitbox/SpriteAnimator)	0	0
3403	299	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.07472372	0
3404	299	(timeSinceLastAttack_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-13.285408	0
3405	299	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.6281509	0
3406	299	(currentHealth_Diff, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.5957203	0
3407	299	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3408	299	(lastIndex_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	1	0
3409	299	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	19.0127449	0
3410	299	(currentTime_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	3.75001812	0
3411	299	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3412	299	(userReportedIntensity_Diff, Level 1/DiffEventEmitter/DiffEventEmitter)	2	0
3413	299	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.24998039	0
3414	299	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.24998039	0
3415	299	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
3416	299	(level_Diff, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	0
3417	299	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.08308892	0
3418	299	(timeSinceLastAttack_Diff, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	1.925975e-05	0
3419	299	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
3420	299	(totalMouseClicks_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
3421	299	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17	0
3422	299	(totalKeystrokes_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
3423	299	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8049.603	0
3424	299	(totalMouseDistance_Diff, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	319.95752	0
3425	299	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
3426	299	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
3427	299	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3428	299	(minPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
3429	299	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	0
3430	299	(maxPoints_Diff, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	0
3431	299	(currentLevel, Level 1/World/??/Character)	2	0
3432	299	(currentLevel_Diff, Level 1/World/??/Character)	1	0
3433	299	(currentExp, Level 1/World/??/Character)	11	0
3434	299	(currentExp_Diff, Level 1/World/??/Character)	6	0
3435	299	(nextLevelExp, Level 1/World/??/Character)	11	0
3436	299	(nextLevelExp_Diff, Level 1/World/??/Character)	6	0
3437	299	(expToNextLevel, Level 1/World/??/Character)	6	0
3438	299	(expToNextLevel_Diff, Level 1/World/??/Character)	1	0
3439	299	(currentHealth, Level 1/World/??/Character)	78	0
3440	299	(currentHealth_Diff, Level 1/World/??/Character)	-12	0
3441	299	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
3442	299	(currSequenceFrame_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	-1	0
3443	299	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.45605254	0
3444	299	(animationTime_Diff, Level 1/World/??/Character Sprite/SpriteAnimator)	-0.881851435	0
3445	299	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	78	0
3446	299	(currentPoints_Diff, Level 1/UI Canvas/Safe Area/???/PointBar)	-12	0
3447	299	(levelTime, Level 1/World/Level Manager/LevelManager)	19.0830784	0
3448	299	(levelTime_Diff, Level 1/World/Level Manager/LevelManager)	3.75002384	0
3449	299	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.242229044	0
3450	299	(timeSinceLastMonsterSpawned_Diff, Level 1/World/Level Manager/LevelManager)	-0.0589159131	0
3451	299	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.0830784	0
3452	299	(timeSinceLastChestSpawned_Diff, Level 1/World/Level Manager/LevelManager)	3.75002384	0
3453	299	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3454	299	(<DamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3455	299	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3456	299	(<KnockbackUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3457	299	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	0
3587	311	(currentExp, Level 1/World/??/Character)	5	2
3458	299	(<WeaponCooldownUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3459	299	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3460	299	(<BleedDamageUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3461	299	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3462	299	(<BleedRateUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3463	299	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
3464	299	(<BleedDurationUpgradeablesCount>k__BackingField_Diff, Level 1/World/Ability Manager/AbilityManager)	1	0
3465	299	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	12	0
3466	299	(monstersKilled_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	10	0
3467	299	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	435	0
3468	299	(damageDealt_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	345	0
3469	299	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	22	0
3470	299	(damageTaken_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	12	0
3471	299	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	3	0
3472	299	(coinsGained_Diff, Level 1/UI Canvas/Stats Manager/StatsManager)	3	0
3473	300	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.14704216	0.0723184347
3474	300	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.6281509	0.5957203
3475	300	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	2	1
3476	300	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	19.0127449	3.75001812
3477	300	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.177662075	0.0723183155
3478	300	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.161466941	0.07837802
3479	300	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	1
3480	300	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8211.544	5
3481	300	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	13	2
3482	300	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
3483	300	(currentExp, Level 1/World/??/Character)	13	2
3484	300	(currentHealth, Level 1/World/??/Character)	78	-6
3485	300	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
3486	300	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3.45605254
3487	300	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	78	-6
3488	300	(levelTime, Level 1/World/Level Manager/LevelManager)	19.1614552	0.07837677
3489	300	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.320607066	0.07837802
3490	300	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.1614552	0.07837677
3491	300	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	13	1
3492	300	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	435	345
3493	300	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	22	6
3494	300	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	3	1
3495	300	(currentLevel, Level 1/World/??/Character)	3	1
3496	300	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4219177
3497	301	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
3498	301	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-18
3499	301	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	125.898094	61.400032
3500	302	index	0	0
3501	302	userReportedIntensity	0	0
3502	302	(Empty, NoPath)	0	0
3503	303	(lastIndex, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
3504	303	(currentTime, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-19.0127449
3505	303	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
3506	303	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0.177662075
3507	303	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-1
3508	303	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.255021751	-0.744978249
3509	303	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
3510	303	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1524.91455	136.303955
3511	303	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-13
3512	303	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
3513	303	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-6
3514	303	(currentLevel, Level 1/World/??/Character)	1	-2
3515	303	(currentExp, Level 1/World/??/Character)	0	-13
3516	303	(nextLevelExp, Level 1/World/??/Character)	5	-6
3517	303	(expToNextLevel, Level 1/World/??/Character)	5	-1
3518	303	(currentHealth, Level 1/World/??/Character)	100	22
3519	303	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	22
3520	303	(levelTime, Level 1/World/Level Manager/LevelManager)	0.50502187	0.50502187
3521	303	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.50502187	0.50502187
3522	303	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.50502187	0.50502187
3523	303	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3524	303	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3525	303	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
3526	303	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3527	303	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3528	303	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
3529	303	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-13
3530	303	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-435
3531	303	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-22
3532	303	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-3
3533	304	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.9598495	0.3333333
3534	304	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323668	-0.5957842
3535	304	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.556054	0.4585241
3536	304	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
3537	304	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3505.245	1342.60449
3538	304	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3539	304	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-0.9912174
3540	304	(levelTime, Level 1/World/Level Manager/LevelManager)	2.05605483	0.4585241
3541	304	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.147876978	-0.481005669
3542	304	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.05605483	0.4585241
3543	305	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
3544	305	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
3545	305	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3505.245
3546	306	index	0	0
3547	306	userReportedIntensity	0	0
3548	306	(Empty, NoPath)	0	0
3549	307	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.251681924	-0.7483181
3550	307	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
3551	307	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	522.240051	197.126343
3552	307	(levelTime, Level 1/World/Level Manager/LevelManager)	0.501682	0.501682
3553	307	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.501682	0.501682
3554	307	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.501682	0.501682
3555	308	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.03439331	0.267558575
3556	308	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323124	-5.4359436e-05
3557	308	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.260477483	0.2742591
3558	308	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
3559	308	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1125.66711	96.63281
3560	308	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
3561	308	(currentExp, Level 1/World/??/Character)	1	1
3562	308	(levelTime, Level 1/World/Level Manager/LevelManager)	3.01047659	0.274258852
3563	308	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.187899992	-0.6395642
3564	308	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.01047659	0.274258852
3565	308	(screenHeightWorldSpace, Level 1/World/Level Manager/????/EntityManager)	9.2883215	4.619838
3566	308	(screenDiagonalWorldSpace, Level 1/World/Level Manager/????/EntityManager)	13.6481838	2.61211872
3567	308	(minSpawnDistance, Level 1/World/Level Manager/????/EntityManager)	6.824092	1.30605936
3568	309	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.05775738	0.240533352
3569	309	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.28021577	0.243616477
3570	309	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	1
3571	309	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1860.72144	735.0543
3572	309	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	2
3573	309	(currentExp, Level 1/World/??/Character)	3	2
3574	309	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.05236578	0.2436161
3575	309	(levelTime, Level 1/World/Level Manager/LevelManager)	8.030222	0.243617535
3576	309	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.175031289	-0.548833132
3577	309	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.030222	0.243617535
3578	309	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
3579	309	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
3580	311	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.070631	0.09223747
3581	311	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
3582	311	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.205297217	-1.15307248
3583	311	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	3
3584	311	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2372.776	63.6572266
3585	311	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	2
3588	311	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3589	311	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.969927
3590	311	(levelTime, Level 1/World/Level Manager/LevelManager)	10.0447083	0.09692669
3591	311	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6514932	0.09692758
3592	311	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.0447083	0.09692669
3593	312	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.5922537	0.0298471451
3594	312	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.13615194	0.0298482031
3595	312	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
3596	312	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5675892	0.0358146429
3597	312	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3598	312	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	7
3599	312	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2503.42236	130.646484
3600	312	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	2
3601	312	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
3602	312	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3603	312	(currentExp, Level 1/World/??/Character)	7	2
3604	312	(nextLevelExp, Level 1/World/??/Character)	11	6
3605	312	(expToNextLevel, Level 1/World/??/Character)	6	1
3606	312	(currentHealth, Level 1/World/??/Character)	96	-4
3607	312	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	1
3608	312	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.31125	0.0358147621
3609	312	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-4
3610	312	(levelTime, Level 1/World/Level Manager/LevelManager)	14.5676079	0.03581333
3611	312	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.20248571	0.0358147025
3612	312	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.5676079	0.03581333
3613	312	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3614	312	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3615	312	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3616	312	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3617	312	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3618	312	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3619	312	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	1
3620	312	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	120	60
3621	312	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
3622	313	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	17.827877	4.23562336
3623	313	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.607542	0.575229645
3624	313	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
3625	313	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.0171906836	0.15334262
3626	313	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.214965463	-0.352623761
3627	313	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	1
3628	313	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	4
3629	313	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
3630	313	(currentExp, Level 1/World/??/Character)	11	4
3631	313	(currentHealth, Level 1/World/??/Character)	92	-4
3632	313	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
3633	313	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	8.958629	4.64737844
3634	313	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-4
3635	313	(levelTime, Level 1/World/Level Manager/LevelManager)	19.2149887	4.647381
3636	313	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.374588251	0.172102541
3637	313	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.2149887	4.647381
3638	313	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	8	5
3639	313	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	285	165
3640	313	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	4
3641	313	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
3642	314	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	18.2006683	0.3727913
3643	314	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.607542	0.575229645
3644	314	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
3645	314	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.3899783	0.3727876
3646	314	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5914665	0.376501024
3647	314	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	1
3648	314	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	4
3649	314	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
3650	314	(currentExp, Level 1/World/??/Character)	11	4
3651	314	(currentHealth, Level 1/World/??/Character)	90	-2
3652	314	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3653	314	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-8.958629
3654	314	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	90	-2
3655	314	(levelTime, Level 1/World/Level Manager/LevelManager)	19.5914936	0.3765049
3656	314	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.144407138	-0.230181113
3657	314	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.5914936	0.3765049
3658	314	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	8	5
3659	314	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	295	10
3660	314	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	10	2
3661	314	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
3662	315	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	20.20581	2.00514221
3663	315	(timeSinceLastAttack, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	-0.1220911	-0.1220911
3664	315	(level, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	1	1
3665	315	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.145099252	-0.244879037
3666	315	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.117276788	0.0244026035
3667	315	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
3668	315	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3825.935	1322.5127
3669	315	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	12	1
3670	315	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
3671	315	(currentLevel, Level 1/World/??/Character)	3	1
3672	315	(currentExp, Level 1/World/??/Character)	12	1
3673	315	(nextLevelExp, Level 1/World/??/Character)	18	7
3674	315	(expToNextLevel, Level 1/World/??/Character)	7	1
3675	315	(currentHealth, Level 1/World/??/Character)	86	-4
3676	315	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	86	-4
3677	315	(levelTime, Level 1/World/Level Manager/LevelManager)	21.6173248	0.0244026184
3678	315	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.39283964	0.0244025886
3679	315	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	21.6173248	0.0244026184
3680	315	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3681	315	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3682	315	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3683	315	(<ProjectileSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3684	315	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3685	315	(<FireRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3686	315	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	10	2
3687	315	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	340	45
3688	315	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	14	4
3689	316	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-5
3690	316	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-34
3691	316	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	129.034882	129.034882
3692	317	index	0	0
3693	317	userReportedIntensity	0	0
3694	317	(Empty, NoPath)	0	0
3695	318	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-2
3696	318	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.253801584	-0.7461984
3697	318	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
3698	318	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	814.261841	248.417419
3699	318	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
3700	318	(currentLevel, Level 1/World/??/Character)	1	-1
3701	318	(currentExp, Level 1/World/??/Character)	0	-5
3702	318	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3703	318	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.581371
3704	318	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5038016	0.5038016
3705	318	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5038016	0.5038016
3706	318	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5038016	0.5038016
3707	319	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.03625822	0.09111214
3708	319	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324392	-5.531311e-05
3709	319	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.263144851	0.09482029
3710	319	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	6
3711	319	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	860.225647	45.9638062
3712	319	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	1
3713	319	(currentExp, Level 1/World/??/Character)	2	1
3714	319	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	1
3715	319	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.33289814	0.0948197842
3716	319	(levelTime, Level 1/World/Level Manager/LevelManager)	3.01314425	0.0948197842
3717	319	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.190588221	0.09482029
3718	319	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.01314425	0.0948197842
3719	321	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.552095	0.364950657
3720	321	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
3721	321	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.02917393	-0.8811461
3722	321	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	2
3723	321	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1219.33313	229.402588
3724	321	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	3
3725	321	(currentLevel, Level 1/World/??/Character)	2	1
3726	321	(currentExp, Level 1/World/??/Character)	5	3
3727	321	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
3728	321	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.33289814
3729	321	(levelTime, Level 1/World/Level Manager/LevelManager)	6.52917528	0.368854046
3730	321	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.275060683	-0.458520144
3731	321	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.52917528	0.368854046
3732	322	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.556462	0.261922836
3733	322	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	1.03598428	0.2619214
3734	322	(level, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	1	1
3735	322	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.216615781	-0.9843321
3736	322	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3737	322	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	2
3738	322	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
3739	322	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3740	322	(nextLevelExp, Level 1/World/??/Character)	11	6
3741	322	(expToNextLevel, Level 1/World/??/Character)	6	1
3742	322	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-1
3743	322	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.953168631	0.265667915
3744	322	(levelTime, Level 1/World/Level Manager/LevelManager)	7.53338528	0.265669346
3745	322	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.4699292	0.2656678
3746	322	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.53338528	0.265669346
3747	322	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3748	322	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3749	322	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
3750	322	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3751	322	(<FireRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3752	323	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.56412315	-3.99233866
3753	323	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.032439	-2
3754	323	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
3755	323	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	0.8769788	-0.159005463
3756	323	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0372982323	0.253914
3757	323	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	1
3758	323	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1453.05164	233.7185
3759	323	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3760	323	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
3761	323	(currentExp, Level 1/World/??/Character)	11	6
3762	323	(currentHealth, Level 1/World/??/Character)	92	-8
3763	323	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	2
3764	323	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.50663543	0.5534668
3765	323	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-8
3766	323	(levelTime, Level 1/World/Level Manager/LevelManager)	11.5372972	4.003912
3767	323	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.662571967	0.192642778
3768	323	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	11.5372972	4.003912
3769	323	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	44	44
3770	323	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	8
3771	324	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.57755613	0.01343298
3772	324	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.032439	-2
3773	324	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
3774	324	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	0.8904119	0.0134330988
3775	324	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0565160327	0.0192178
3776	324	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	1
3777	324	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1755.27234	302.2207
3778	324	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
3779	324	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
3780	324	(currentExp, Level 1/World/??/Character)	11	6
3781	324	(currentHealth, Level 1/World/??/Character)	92	-8
3782	324	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	2
3783	324	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.52585328	0.0192178488
3784	324	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-8
3785	324	(levelTime, Level 1/World/Level Manager/LevelManager)	11.5565147	0.0192174911
3786	324	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.681789756	0.01921779
3787	324	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	11.5565147	0.0192174911
3788	324	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	44	44
3789	324	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	8
3790	324	(currentLevel, Level 1/World/??/Character)	3	1
3791	325	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.09936762	0.245708942
3792	325	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	1.24555492	0.245709717
3793	325	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.214758366	-0.5042906
3794	325	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
3795	325	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8263934	0.249562621
3796	325	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
3797	325	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	6
3798	325	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2121.71069	3.236084
3799	325	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	12	1
3800	325	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
3801	325	(currentExp, Level 1/World/??/Character)	12	1
3802	325	(nextLevelExp, Level 1/World/??/Character)	18	7
3803	325	(expToNextLevel, Level 1/World/??/Character)	7	1
3804	325	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.8384378	0.249562263
3805	325	(levelTime, Level 1/World/Level Manager/LevelManager)	16.0763912	0.249567986
3806	325	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.388301373	0.249562591
3807	325	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	16.0763912	0.249567986
3808	325	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3809	325	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3810	325	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
3811	325	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3812	325	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3813	325	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
3814	325	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	3
3815	325	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	46
3816	326	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.9468412	0.267807961
3817	326	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.6879864	2.65554714
3818	326	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	0.0243639	0.2678044
3819	326	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.3140499	0.267804384
3820	326	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.855710566	0.272166669
3821	326	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24	1
3822	326	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2196.74463	75.0339355
3823	326	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	14	2
3824	326	(currentExp, Level 1/World/??/Character)	14	2
3825	326	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
3826	326	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	8.867756	0.272170067
3827	326	(levelTime, Level 1/World/Level Manager/LevelManager)	21.10573	0.2721634
3828	326	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.466637373	0.272166461
3829	326	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	21.10573	0.2721634
3830	326	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	8	5
3831	326	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	174	2
3832	328	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.9639463	0.4588251
3833	328	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	5	2
3834	328	(timeSinceLastAttack, Level 1/World/Ability Manager/Machete Ability(Clone)/BoomerangAbility)	0.9581386	0.458822817
3835	328	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.3311586	0.458822966
3836	328	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.276262254	-0.633371353
3837	328	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	3
3838	328	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	4
3839	328	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	18
3840	328	(currentLevel, Level 1/World/??/Character)	4	1
3841	328	(currentExp, Level 1/World/??/Character)	18	4
3842	328	(currentHealth, Level 1/World/??/Character)	88	-4
3843	328	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
3844	328	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-11.4216728
3845	328	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	88	-4
3846	328	(levelTime, Level 1/World/Level Manager/LevelManager)	24.126297	0.466630936
3847	328	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0675134957	-0.08825785
3848	328	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	24.126297	0.466630936
3849	328	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	11	1
3850	328	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	244	8
3851	328	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	12	4
3852	328	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2993.869	469.8706
3922	341	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	573.88446	559.496338
3923	341	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
3924	342	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
3925	342	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3926	342	(timeSpendIdle, ScriptableObjects/Statistics)	2.939998	0.21999979
3927	343	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
3928	343	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
3929	343	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4876.68164	1667.45825
3930	343	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3931	343	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3932	343	(timeSpendIdle, ScriptableObjects/Statistics)	4.159997	0.180000067
3933	344	(jumpCounter, ScriptableObjects/Statistics)	3	1
3934	344	(score, Statics/Score)	3	3
3935	344	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
3936	344	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3937	344	(moveDirection, 1/Player/CharacterControl)	1	1
3938	344	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3939	344	(timeSpendIdle, ScriptableObjects/Statistics)	4.199997	0.03999996
3940	346	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9221.242	2285.503
3941	346	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3942	346	(timeSpendIdle, ScriptableObjects/Statistics)	6.75999451	0.07999992
3943	347	(jumpCounter, ScriptableObjects/Statistics)	4	1
3944	347	(score, Statics/Score)	9	1
3945	347	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
3946	347	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	4
3947	347	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9577.668	356.425781
3948	347	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
3949	347	(timeSpendIdle, ScriptableObjects/Statistics)	8.119996	0.0200004578
3950	348	(jumpCounter, ScriptableObjects/Statistics)	5	1
3951	348	(score, Statics/Score)	11	2
3952	348	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	4
3953	348	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9834.614	256.9463
3954	348	(moveDirection, 1/Player/CharacterControl)	1	1
3955	348	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3956	348	(timeSpendIdle, ScriptableObjects/Statistics)	10.5000505	2.38005447
3957	350	(jumpCounter, ScriptableObjects/Statistics)	6	1
3958	350	(killcounter, Statics/Enemy)	2	1
3959	350	(score, Statics/Score)	14	3
3960	350	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	4
3961	350	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
3962	350	(moveDirection, 1/Player/CharacterControl)	0	-1
3963	350	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
3964	350	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
3965	350	(timeSpendIdle, ScriptableObjects/Statistics)	11.2000666	0.120002747
3966	352	(jumpCounter, ScriptableObjects/Statistics)	0	-6
3967	352	(killcounter, Statics/Enemy)	0	-2
3968	352	(score, Statics/Score)	0	-14
3969	352	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
3970	352	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
3971	352	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	514.9231	500.057037
3972	352	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
3973	352	(index, 1/Checkpoints/CheckPoint3 (3)/CheckpointEventEmitter)	5	1
3974	352	(index, 1/Checkpoints/CheckPoint3 (1)/CheckpointEventEmitter)	4	1
3975	352	(index, 1/Checkpoints/CheckPoint3/CheckpointEventEmitter)	3	1
3976	352	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	-11.1800661
3977	353	(jumpCounter, ScriptableObjects/Statistics)	3	3
3978	353	(score, Statics/Score)	3	3
3979	353	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	2
3980	353	(moveDirection, 1/Player/CharacterControl)	1	1
3981	353	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
3982	353	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4019	364	(index, 1/Checkpoints/CheckPoint3/CheckpointEventEmitter)	2	-1
4020	364	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	-2.839998
4021	365	(jumpCounter, ScriptableObjects/Statistics)	1	1
4022	365	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
4023	365	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
4024	365	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	45.23607	45.23607
4025	365	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4026	365	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4027	365	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4028	365	(timeSpendIdle, ScriptableObjects/Statistics)	2.11999869	2.09999871
4029	366	(jumpCounter, ScriptableObjects/Statistics)	4	3
4030	366	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	1
4031	366	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4032	366	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4033	366	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4034	366	(timeSpendIdle, ScriptableObjects/Statistics)	2.15999866	0.03999996
4035	367	(jumpCounter, ScriptableObjects/Statistics)	8	4
4036	367	(score, Statics/Score)	3	3
4037	367	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12	5
4038	367	(moveDirection, 1/Player/CharacterControl)	1	1
4039	367	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4040	367	(timeSpendIdle, ScriptableObjects/Statistics)	2.35999846	0.199999809
4041	372	(killcounter, Statics/Enemy)	1	1
4042	372	(score, Statics/Score)	8	5
4043	372	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	6
4044	372	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4045	372	(moveDirection, 1/Player/CharacterControl)	0	-1
4046	372	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4047	372	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4048	372	(timeSpendIdle, ScriptableObjects/Statistics)	3.01999784	0.119999886
4049	373	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2461.95166	73.98633
4050	373	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4051	373	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4052	373	(timeSpendIdle, ScriptableObjects/Statistics)	8.079995	0.180001736
4053	374	(killcounter, Statics/Enemy)	0	-1
4054	374	(score, Statics/Score)	0	-8
4055	375	(jumpCounter, ScriptableObjects/Statistics)	0	-8
4056	375	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
4057	375	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-18
4058	375	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3742.79541
4059	375	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	-11.920083
4060	377	(index, 1/Checkpoints/CheckPoint3 (3)/CheckpointEventEmitter)	5	1
4061	377	(index, 1/Checkpoints/CheckPoint3 (1)/CheckpointEventEmitter)	4	1
4062	377	(index, 1/Checkpoints/CheckPoint3/CheckpointEventEmitter)	3	1
4063	380	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
4064	380	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	3
4065	380	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1256.93359	146.771851
4066	380	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4067	380	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4068	380	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4069	380	(timeSpendIdle, ScriptableObjects/Statistics)	1.51999915	0.239999771
4070	382	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
4071	382	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3
4072	382	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1256.93359
4073	382	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4074	382	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4075	382	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4076	382	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
4077	383	(jumpCounter, ScriptableObjects/Statistics)	2	2
4078	383	(score, Statics/Score)	2	2
4079	383	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
4080	383	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	5
4081	383	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4082	383	(moveDirection, 1/Player/CharacterControl)	1	1
4083	383	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4084	383	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4085	383	(timeSpendIdle, ScriptableObjects/Statistics)	0.6799999	0.6599999
4086	385	(killcounter, Statics/Enemy)	1	1
4087	385	(score, Statics/Score)	7	5
4088	385	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	1
4089	385	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4090	385	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4091	385	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4092	385	(timeSpendIdle, ScriptableObjects/Statistics)	1.83999884	1.15999889
4093	386	(jumpCounter, ScriptableObjects/Statistics)	4	2
4094	386	(score, Statics/Score)	9	2
4095	386	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17	7
4096	386	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2240.44751	84.06665
4097	386	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4098	386	(moveDirection, 1/Player/CharacterControl)	0	-1
4099	386	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4100	386	(timeSpendIdle, ScriptableObjects/Statistics)	4.059997	0.3399999
4101	387	(jumpForce, 1/MovingPlatform/FlyPlats/Player/CharacterControl)	6	6
4102	387	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2510.92847	270.480957
4103	387	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4104	387	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4105	387	(timeSpendIdle, ScriptableObjects/Statistics)	5.219996	0.199999809
4106	387	(speed, 1/MovingPlatform/FlyPlats/Player/CharacterControl)	4.94	4.94
4107	388	(timeSpendIdle, ScriptableObjects/Statistics)	5.7199955	0.07999992
4108	389	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4109	389	(timeSpendIdle, ScriptableObjects/Statistics)	6.279995	0.0999999046
4110	389	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4111	390	(timeSpendIdle, ScriptableObjects/Statistics)	6.79999447	0.07999992
4112	391	(timeSpendIdle, ScriptableObjects/Statistics)	7.339994	0.07999992
4113	392	(timeSpendIdle, ScriptableObjects/Statistics)	7.9199934	0.0999999046
4114	392	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4115	393	(score, Statics/Score)	10	1
4116	393	(timeSpendIdle, ScriptableObjects/Statistics)	8.940015	0.220005035
4117	394	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4118	394	(timeSpendIdle, ScriptableObjects/Statistics)	11.5000734	0.08000183
4119	395	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
4120	395	(timeSpendIdle, ScriptableObjects/Statistics)	12.0000849	0.120002747
4121	396	(timeSpendIdle, ScriptableObjects/Statistics)	12.5400972	0.0400009155
4122	396	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2712.20532	12.0830078
4123	397	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2837.205	7.708252
4124	397	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4125	397	(timeSpendIdle, ScriptableObjects/Statistics)	13.0601091	0.100002289
4126	397	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4127	398	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
4128	398	(timeSpendIdle, ScriptableObjects/Statistics)	13.1801119	0.0600013733
4129	398	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	1
4130	398	(moveDirection, 1/Player/CharacterControl)	1	1
4131	399	(jumpCounter, ScriptableObjects/Statistics)	5	1
4132	399	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	1
4133	400	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4134	401	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	1
4135	401	(moveDirection, 1/Player/CharacterControl)	1	2
4136	402	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2851.74243	8.123047
4137	402	(moveDirection, 1/Player/CharacterControl)	1	1
4138	402	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	1
4139	402	(timeSpendIdle, ScriptableObjects/Statistics)	13.2001123	0.0200004578
4140	403	(jumpCounter, ScriptableObjects/Statistics)	6	1
4141	403	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	1
4142	403	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4143	404	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
4144	405	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26	1
4145	405	(moveDirection, 1/Player/CharacterControl)	0	1
4146	406	(moveDirection, 1/Player/CharacterControl)	1	1
4147	406	(jumpCounter, ScriptableObjects/Statistics)	7	1
4148	406	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	1
4149	406	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4150	407	(killcounter, Statics/Enemy)	2	1
4151	407	(score, Statics/Score)	11	1
4152	408	(score, Statics/Score)	13	1
4153	408	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
4154	408	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
4155	410	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
4156	410	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28	1
4157	410	(moveDirection, 1/Player/CharacterControl)	0	1
4158	410	(timeSpendIdle, ScriptableObjects/Statistics)	13.5001192	0.0600013733
4159	411	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3340.602	21.416748
4160	411	(timeSpendIdle, ScriptableObjects/Statistics)	14.0001307	0.08000183
4161	411	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
4162	412	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
4163	412	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-36
4164	412	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	651.694	651.694
4165	413	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2416.57153	1764.87756
4166	414	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2987.44238	570.87085
4167	415	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3228.2063	117.859131
4168	416	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3232.2063	4
4169	417	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3350.84863	118.642334
4170	418	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3934.65234	583.8037
4171	419	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6520.351	841.897
4172	420	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8965.599	829.4507
4173	421	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9022.774	57.17578
4174	422	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10850.8311	29.7675781
4175	423	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12295.7764	1444.94531
4176	424	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16161.6162	1393.7832
4177	425	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18428.43	1
4178	426	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21855.6426	132.644531
4179	427	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24584.39	2728.748
4180	428	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25779.88	23.6386719
4181	429	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26310.25	530.369141
4182	430	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27585.55	1275.30078
4183	431	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27653.9	68.34961
4184	432	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29016.7715	1362.87109
4185	433	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29422.8633	80.3339844
4186	434	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29809.9844	387.1211
4187	435	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29942.85	20.6015625
4188	436	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30821.4277	878.5781
4189	437	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31533.2168	133.9043
4190	438	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33566.17	20.8828125
4191	439	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	271092.75	831.96875
4192	440	index	0	0
4193	440	userReportedIntensity	0	0
4194	440	(Empty, NoPath)	0	0
4195	441	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	-1
4196	441	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	-1
4197	441	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-0.0263996068
4198	441	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	-1
4199	441	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2505263	-0.7494737
4200	441	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	2
4201	441	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	318317.969	83.78125
4202	441	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-16
4203	441	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
4204	441	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	-13
4205	441	(currentLevel, Level 1/World/??/Character)	1	-2
4206	441	(currentExp, Level 1/World/??/Character)	0	-16
4207	441	(nextLevelExp, Level 1/World/??/Character)	5	-13
4208	441	(expToNextLevel, Level 1/World/??/Character)	5	-2
4209	441	(currentHealth, Level 1/World/??/Character)	100	18
4210	441	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	1
4211	441	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.174347878	0.174347878
4212	441	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	18
4213	441	(levelTime, Level 1/World/Level Manager/LevelManager)	0.5005263	0.5005263
4214	441	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5005263	0.5005263
4215	441	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	0.5005263	0.5005263
4216	441	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-2
4217	441	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-2
4218	441	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	-1
4219	441	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4220	441	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4221	441	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4222	441	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4223	441	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4224	441	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	-1
4225	441	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-17
4226	441	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-430
4227	441	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-18
4228	441	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	-3
4229	442	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.7523013	0.203112841
4230	442	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4231	442	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
4232	442	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.6761227	0.20311287
4233	442	(levelTime, Level 1/World/Level Manager/LevelManager)	1.00230145	0.203112841
4234	442	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.03367851	-0.7655101
4235	442	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.00230145	0.203112841
4236	443	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.52266359	0.223250866
4237	443	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1527491	9.766071
4238	443	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.778304458	0.226642132
4239	443	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	1
4240	443	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	318606.031	288.0625
4241	443	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	3
4242	443	(currentExp, Level 1/World/??/Character)	3	3
4243	443	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	5.70212555	0.226643085
4244	443	(levelTime, Level 1/World/Level Manager/LevelManager)	6.028308	0.226643085
4245	443	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.601587951	0.226642072
4246	443	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.028308	0.226643085
4247	443	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
4248	443	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
4249	445	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.531611	0.409274578
4250	445	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
4251	445	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
4252	445	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.290100664	0.415514529
4253	445	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
4254	445	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20	2
4255	445	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	318903.281	67.03125
4256	445	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
4257	445	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
4258	445	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
4259	445	(currentLevel, Level 1/World/??/Character)	2	1
4260	445	(currentExp, Level 1/World/??/Character)	6	1
4261	445	(nextLevelExp, Level 1/World/??/Character)	11	6
4262	445	(expToNextLevel, Level 1/World/??/Character)	6	1
4263	445	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	1
4264	445	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.1965986	0.1965986
4265	445	(levelTime, Level 1/World/Level Manager/LevelManager)	8.040103	0.415514469
4266	445	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.184175014	-0.3768552
4267	445	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	8.040103	0.415514469
4268	445	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4269	445	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4270	445	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4271	445	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4272	445	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4273	445	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	4	1
4274	445	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	120	60
4275	445	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.08922551
4276	446	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.2253761	0.4375496
4277	446	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.31315	0.160401344
4278	446	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.32177034	0.442247033
4279	446	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	32	12
4280	446	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	318907.531	4.25
4281	446	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	8	2
4282	446	(currentExp, Level 1/World/??/Character)	8	2
4283	446	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	1
4284	446	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.10481143	0.442247033
4285	446	(levelTime, Level 1/World/Level Manager/LevelManager)	13.0717573	0.442246437
4286	446	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.06881785	-0.255355358
4287	446	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	13.0717573	0.442246437
4288	446	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	7	3
4289	446	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	220	100
4290	446	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	3	1
4291	446	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0603343956
4292	448	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.7317152	0.270986557
4293	448	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	1
4294	448	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.328731447	0.2763015
4295	448	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	40	1
4296	448	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	319176.344	97.125
4297	448	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	3
4298	448	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
4299	448	(currentLevel, Level 1/World/??/Character)	3	1
4300	448	(currentExp, Level 1/World/??/Character)	11	3
4301	448	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.0668971	-1.52709818
4302	448	(levelTime, Level 1/World/Level Manager/LevelManager)	15.5787163	0.2763033
4303	448	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5468198	0.276301533
4304	448	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.5787163	0.2763033
4305	448	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	10	1
4306	448	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	300	80
4307	448	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	6	3
4308	448	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.226818323
4309	449	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	16.5033932	0.1404419
4310	449	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.586832	0.273681641
4311	449	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.2877667	0.140437678
4312	449	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
4313	449	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5942923	0.144533426
4314	449	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4315	449	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	47	7
4316	449	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	14	3
4317	449	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
4318	449	(currentExp, Level 1/World/??/Character)	14	3
4319	449	(nextLevelExp, Level 1/World/??/Character)	18	7
4320	449	(expToNextLevel, Level 1/World/??/Character)	7	1
4321	449	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.498227	0.144533634
4322	449	(levelTime, Level 1/World/Level Manager/LevelManager)	19.59426	0.144536972
4323	449	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.146700636	0.144533411
4324	449	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.59426	0.144536972
4325	449	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
4326	449	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
4327	449	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4328	449	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4329	449	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4330	449	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4331	449	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	14	4
4332	449	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	385	85
4333	449	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3581145
4334	451	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	17.6758919	0.128387451
4335	451	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.6880341	0.101202011
4336	451	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	-1
4337	451	(level, Level 1/World/Ability Manager/Cooldown Upgrade Ability(Clone)/CooldownUpgradeAbility)	1	1
4338	451	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.294393778	0.128386617
4339	451	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.248336613	-0.96677345
4340	451	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
4341	451	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	49	2
4342	451	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	319503.625	327.28125
4343	451	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	4
4344	451	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
4345	451	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	8
4346	451	(currentLevel, Level 1/World/??/Character)	4	1
4347	451	(currentExp, Level 1/World/??/Character)	18	4
4348	451	(nextLevelExp, Level 1/World/??/Character)	26	8
4349	451	(expToNextLevel, Level 1/World/??/Character)	8	1
4350	451	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
4351	451	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.498227
4352	451	(levelTime, Level 1/World/Level Manager/LevelManager)	21.1016331	0.1332283
4353	451	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.462264538	0.133226663
4354	451	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	21.1016331	0.1332283
4355	451	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	17	3
4356	451	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	505	120
4357	451	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.369210362
4358	452	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.79177177	-16.88412
4359	452	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.3119659	-30
4360	452	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.07928611	0.151453078
4361	452	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.379437864	0.157748193
4362	452	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	57	1
4363	452	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	319507.625	4
4364	452	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	24	1
4365	452	(currentExp, Level 1/World/??/Character)	24	1
4366	452	(currentHealth, Level 1/World/??/Character)	94	-6
4367	452	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
4368	452	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.04185963	0.157748222
4369	452	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	94	-6
4370	452	(levelTime, Level 1/World/Level Manager/LevelManager)	26.1293888	0.157743454
4371	452	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.438420117	0.157748193
4372	452	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	26.1293888	0.157743454
4373	452	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	24	7
4374	452	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	750	245
4375	452	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	6	6
4376	452	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	7	1
4377	452	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.343356818
4378	454	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.15492046	0.3631487
4379	454	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.891777	30.203743
4380	454	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.2390692	0.318355322
4381	454	(timeSinceLastHealed, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	0.223114729	0.223114729
4382	454	(level, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	1	1
4383	454	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2869147	0.0204164088
4384	454	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
4385	454	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	59	2
4386	454	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	319665.875	158.25
4387	454	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	2
4388	454	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	8
4389	454	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	35	9
4390	454	(currentLevel, Level 1/World/??/Character)	5	1
4391	454	(currentExp, Level 1/World/??/Character)	26	2
4392	454	(nextLevelExp, Level 1/World/??/Character)	35	9
4393	454	(expToNextLevel, Level 1/World/??/Character)	9	1
4394	454	(currentHealth, Level 1/World/??/Character)	92	-2
4395	454	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-4.04185963
4396	454	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-2
4397	454	(levelTime, Level 1/World/Level Manager/LevelManager)	27.1368866	0.02041626
4398	454	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.3837582	0.0204164088
4399	454	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	27.1368866	0.02041626
4400	454	(<RecoveryCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4401	454	(<RecoveryUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4402	454	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	25	1
4403	454	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	780	30
4404	454	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	2
4405	454	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.485932142
6055	713	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1098	6
6056	714	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1098	6
6057	714	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	162.052292	0.5312195
6058	714	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	162.052292	0.5312195
6059	714	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101699829	0.00379943848
6060	714	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101699829	0.00379943848
6061	714	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	158.860565	7.8372345
6062	714	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	158.860565	7.8372345
6063	714	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	176195.25	1031.125
6064	714	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	176195.25	1031.125
6065	714	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	21.2087021	0.08585358
6066	714	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	21.2087021	0.08585358
4407	455	userReportedIntensity	0	0
4408	455	(Empty, NoPath)	0	0
4409	456	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	1.02942407	0.319722235
4410	456	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324306	-0.8593464
4411	456	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.508079648	0.325460017
4412	456	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
4413	456	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1920.728	564.1564
4414	456	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
4415	456	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.40029383	0.325460076
4416	456	(levelTime, Level 1/World/Level Manager/LevelManager)	2.00807977	0.3254603
4417	456	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.09938518	-0.614646256
4418	456	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.00807977	0.3254603
4419	456	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.178149715
4420	457	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.004575	0.3914194
4421	457	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1809969	0.148566246
4422	457	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5834786	0.3954119
4423	457	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2668.61646	747.8884
4424	457	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	2	2
4425	457	(currentExp, Level 1/World/??/Character)	2	2
4426	457	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
4427	457	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.40029383
4428	457	(levelTime, Level 1/World/Level Manager/LevelManager)	7.08348274	0.3954134
4429	457	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0201836228	-0.4139346
4430	457	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	7.08348274	0.3954134
4431	457	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
4432	457	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
4433	457	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.107542992
4434	458	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.0219757	-0.091683656
4435	458	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.601462245	0.4128945
4436	458	(currentHealth, Level 1/World/??/Character)	86	-2
4437	458	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	86	-2
4438	458	(levelTime, Level 1/World/Level Manager/LevelManager)	12.1014547	0.4128933
4439	458	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5052936	0.412894517
4440	458	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.1014547	0.4128933
4441	458	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	2
4442	458	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	60
4443	458	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	14	2
4444	458	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0889110938
4445	460	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.731435537	0.0270056725
4446	460	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.8190041	-30
4447	460	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
4448	460	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3679381	0.338600338
4449	460	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4450	460	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	4
4451	460	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3973.06616	435.786133
4452	460	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	3
4453	460	(currentLevel, Level 1/World/??/Character)	2	1
4454	460	(currentExp, Level 1/World/??/Character)	5	3
4455	460	(currentHealth, Level 1/World/??/Character)	84	-2
4456	460	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
4457	460	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.3425144
4458	460	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-2
4459	460	(levelTime, Level 1/World/Level Manager/LevelManager)	15.6179237	0.3385973
4460	460	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.586225867	0.338600338
4461	460	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.6179237	0.3385973
4462	460	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	8	3
4463	460	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	240	150
4464	460	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	2
4465	460	(_timeSinceLastSend, Level 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.167183787
4466	461	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3244.18628	3244.18628
4467	461	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.09048719
4468	462	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3964.35669	86.0647
4469	462	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0412051976
4950	608	userReportedIntensity	0	0
4470	463	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4607.99	643.633545
4471	463	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0267706
4472	464	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5035.814	1
4473	464	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.487337857
4474	465	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5549.767	13
4475	465	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4684441
4476	466	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5767.73633	217.969238
4477	466	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.449050039
4478	467	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5781.80029	14.0639648
4479	467	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4376374
4480	468	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6011.78271	229.982422
4481	468	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.424245745
4482	469	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6164.952	153.169434
4483	469	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.410152853
4484	470	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6477.064	312.111816
4485	470	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.39920947
4486	471	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6789.011	311.947266
4487	471	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3803522
4488	472	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7110.648	1
4489	472	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.364826024
4490	473	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7887.73926	777.0913
4491	473	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.338259637
4492	474	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8281.318	393.5791
4493	474	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.324881315
4494	475	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8787.372	506.0537
4495	475	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3043572
4496	476	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9064.356	276.984375
4497	476	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.292944342
4498	477	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9596.739	532.3828
4499	477	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.272141427
4500	478	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.261424422
4501	479	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9881.66	284.9209
4502	479	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.23997049
4503	480	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.231691882
4504	481	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10390.1963	10.7148438
4505	481	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.216391772
4506	482	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10783.3223	393.125977
4507	482	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.2096759
4508	483	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10922.4873	139.165039
4509	483	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.193659589
4510	484	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11264.9863	18
4511	484	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.179331288
4512	485	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11568.2979	168.638672
4513	485	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.160350323
4514	486	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11599.74	31.4423828
4515	486	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.139856681
4516	487	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.126174688
4517	488	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.112607904
4518	489	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.09476911
4519	490	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0752247
4520	491	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11866.9482	267.208
4521	491	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0603491
4522	492	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11958.8164	91.8681641
4523	492	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.048835
4524	493	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13029.3	1070.4834
4525	493	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.484913379
4526	494	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14352.5234	1323.22363
4527	494	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.455960125
4528	495	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14463.5371	111.013672
4951	608	(Empty, NoPath)	0	0
4529	495	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.448205262
4530	496	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15129.8291	666.292
4531	496	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.430840284
4532	497	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15474.3467	4
4533	497	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4157754
4534	498	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16704.2129	5.2421875
4535	498	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3966833
4536	499	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17175.8574	146.273438
4537	499	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.382092327
4538	500	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18176.9863	26.2675781
4539	500	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.371083647
4540	501	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19468.9316	1291.94531
4541	501	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3524427
4542	502	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19499.0664	30.1347656
4543	502	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.3349984
4544	503	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19911.6426	412.576172
4545	503	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.314593583
4546	504	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20409.3379	497.6953
4547	504	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.2924204
4548	505	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22787.3047	77.0918
4549	505	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.286612868
4550	506	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22791.7188	4.4140625
4551	506	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.2713014
4552	507	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23032.8164	241.097656
4553	507	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.251548946
4554	508	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24761.7266	1728.91016
4555	508	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.230777889
4556	509	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.218533158
4557	510	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25169.0859	407.359375
4558	510	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.200370461
4559	511	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25676.2715	8
4560	511	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.182414189
4561	512	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26545.99	154.544922
4562	512	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.169905409
4563	513	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28013.57	5
4564	513	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1549917
4565	514	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1358775
4566	515	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28491.0332	477.4629
4567	515	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1292533
4568	516	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28836.3574	345.324219
4569	516	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1215293
4570	517	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29243.9063	407.548828
4571	517	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.104837306
4572	518	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29363.0977	119.191406
4573	518	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0827177
4574	519	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29670.3926	307.294922
4575	519	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0681069046
4576	520	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30312.4	139.761719
4577	520	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.055413004
4578	521	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30580.3867	267.986328
4579	521	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0389278
4580	522	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31266.34	95.34766
4581	522	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0303608
4582	523	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0161964
4583	524	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31682.5742	416.234375
4584	524	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0032245
4585	525	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31967.0527	284.478516
4586	525	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.49243018
4587	526	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	32332.42	365.3672
4659	561	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6911.221	1
4588	526	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.46622628
4589	527	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33775.6055	44.8984375
4590	527	(_timeSinceLastSend, Main Menu/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.447440624
4592	529	index	0	0
4593	529	userReportedIntensity	0	0
4594	529	(Empty, NoPath)	0	0
4595	530	index	0	0
4596	530	userReportedIntensity	0	0
4597	530	(Empty, NoPath)	0	0
4598	531	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3444.56519	657.0923
4599	531	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	3444.56519	657.0923
4600	532	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4461.93	1017.365
4601	532	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	4461.93	1017.365
4602	533	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4946.877	484.946777
4603	533	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	4946.877	484.946777
4604	534	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6203.483	70.59082
4605	534	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6203.483	70.59082
4607	536	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12105.5625	388.250977
4608	536	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	12105.5625	388.250977
4609	537	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15154.77	3049.207
4610	537	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	15154.77	3049.207
4611	538	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17614.5781	186.353516
4612	538	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	17614.5781	186.353516
4613	539	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17660.8848	46.30664
4614	539	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	17660.8848	46.30664
4615	540	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18589.9941	929.1094
4616	540	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	18589.9941	929.1094
4617	541	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21959.6348	183.476563
4618	541	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	21959.6348	183.476563
4620	543	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	177.2921	177.2921
4621	543	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	177.2921	177.2921
4622	544	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
4623	544	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	805.2553	627.9632
4624	544	(totalKeystrokes, Main Menu/Filemanager/GameDataCollector)	1	1
4625	544	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	805.2553	627.9632
4626	545	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2044.543	404.990845
4627	545	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2044.543	404.990845
4628	546	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2820.262	113.699463
4629	546	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2820.262	113.699463
4630	547	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6323.842	1
4631	547	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6323.842	1
4632	548	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	12144.8555	52.36621
4633	548	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	12144.8555	52.36621
4634	549	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13126.2432	3
4635	549	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	13126.2432	3
4636	550	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18325.7148	12.828125
4637	550	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	18325.7148	12.828125
4638	551	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14840.8281	177.99707
4639	551	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	14840.8281	177.99707
4640	552	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21856.832	107.214844
4641	552	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	21856.832	107.214844
4642	553	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2841.766	1048.99646
4643	553	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2841.766	1048.99646
4644	554	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3246.86816	405.102051
4645	554	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	3246.86816	405.102051
4646	555	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3329.07813	82.20996
4647	555	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	3329.07813	82.20996
4648	556	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4026.75635	697.6782
4649	556	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	4026.75635	697.6782
4650	557	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4719.2417	692.485352
4651	557	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	4719.2417	692.485352
4652	558	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5939.219	1219.97754
4653	558	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	5939.219	1219.97754
4654	559	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6001.55127	62.33203
4655	559	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6001.55127	62.33203
4656	560	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6632.928	145.706055
4657	560	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6632.928	145.706055
4658	561	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6911.221	1
4660	562	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6948.22852	1
4661	562	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6948.22852	1
4662	563	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6956.22852	8
4663	563	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	6956.22852	8
4664	564	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9822.057	146.395508
4665	564	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	9822.057	146.395508
4666	565	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10783.0156	125.604492
4667	565	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	10783.0156	125.604492
4668	566	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11490.1406	707.125
4669	566	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	11490.1406	707.125
4671	568	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17524.0762	151.800781
4672	568	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	17524.0762	151.800781
4673	569	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17623.1172	99.0410156
4674	569	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	17623.1172	99.0410156
4675	570	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17735.47	27.9160156
4676	570	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	17735.47	27.9160156
4677	571	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18288.3086	107.367188
4678	571	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	18288.3086	107.367188
4679	572	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18644.0469	355.738281
4680	572	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	18644.0469	355.738281
4681	573	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18767.7188	123.671875
4682	573	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	18767.7188	123.671875
4683	574	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25032.293	20.9511719
4684	574	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	25032.293	20.9511719
4685	575	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14887.8984	3397.75781
4686	575	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	14887.8984	3397.75781
4687	576	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2085.651	57.8468
4688	576	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2085.651	57.8468
4689	577	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2239.5498	153.898926
4690	577	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2239.5498	153.898926
4691	578	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2976.86646	737.31665
4692	578	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	2976.86646	737.31665
4693	579	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3929.02612	224.030762
4694	579	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	3929.02612	224.030762
4695	580	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4514.824	585.7981
4696	580	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	4514.824	585.7981
4697	582	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	336.901031	0
4698	582	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	336.901031	0
4699	583	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16531.9473	21.6894531
4700	583	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	16531.9473	21.6894531
4701	584	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3682.17847	3345.27734
4702	584	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	3682.17847	3345.27734
4703	585	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	34390.26	1664.332
4704	585	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	34390.26	1664.332
4705	586	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39640.1563	491.65625
4706	586	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	39640.1563	491.65625
4707	587	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	40645.0859	1004.92969
4708	587	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	40645.0859	1004.92969
4709	588	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1368.29407	0
4710	588	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	1368.29407	0
4711	589	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	226.354767	0
4712	589	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	226.354767	0
4713	590	index	0	0
4714	590	userReportedIntensity	0	0
4715	590	(Empty, NoPath)	0	0
4716	591	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.036720112	0
4717	591	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
4718	591	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	676.358154	0
4719	591	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
4720	591	(currentExp, Level 1/World/??/Character)	0	0
4721	591	(currentHealth, Level 1/World/??/Character)	100	0
4722	591	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
4723	591	(levelTime, Level 1/World/Level Manager/LevelManager)	1.46327984	0
4724	591	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.494597584	0
4725	591	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.46327984	0
4726	591	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4727	591	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4728	591	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4729	591	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4730	591	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.4933829	0
4731	591	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.03233	0
4732	591	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
4733	591	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
4734	591	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.08279324	0
4735	592	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.00286317	0.215844631
4736	592	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.228508875	0.221593037
4737	592	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
4738	592	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	743.291565	66.93341
4739	592	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
4740	592	(currentExp, Level 1/World/??/Character)	1	1
4741	592	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
4742	592	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.5980227	0.221593142
4743	592	(levelTime, Level 1/World/Level Manager/LevelManager)	2.978509	0.221593142
4744	592	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.155777574	-0.6924063
4745	592	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.978509	0.221593142
4746	593	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.91601229	1.91314912
4747	593	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8859102	0.6574013
4748	593	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
4749	593	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	4
4750	593	(currentExp, Level 1/World/??/Character)	5	4
4751	593	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
4752	593	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.5980227
4753	593	(levelTime, Level 1/World/Level Manager/LevelManager)	4.88591051	1.90740156
4754	593	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.3058691	0.150091529
4755	593	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.88591051	1.90740156
4756	594	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.01399851	0.09798622
4757	594	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.988742352	0.102832139
4758	594	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
4759	594	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	4
4760	594	(currentExp, Level 1/World/??/Character)	5	4
4761	594	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
4762	594	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2.5980227
4763	594	(levelTime, Level 1/World/Level Manager/LevelManager)	4.988743	0.102832317
4764	594	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.4087012	0.102832109
4765	594	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.988743	0.102832317
4766	594	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
4767	594	(currentLevel, Level 1/World/??/Character)	2	1
4768	595	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.476714	4.46271563
4769	595	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.2619343	0.229604721
4770	595	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.136263177	-0.136263177
4771	595	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
4772	595	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5248089	0.0251611769
4773	595	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
4774	595	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16	10
4775	595	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	7	2
4776	595	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
4777	595	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
4778	595	(currentExp, Level 1/World/??/Character)	7	2
4779	595	(nextLevelExp, Level 1/World/??/Character)	11	6
4780	595	(expToNextLevel, Level 1/World/??/Character)	6	1
4781	595	(currentHealth, Level 1/World/??/Character)	96	-4
4782	595	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.09062052	0.0251612663
4783	595	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-4
4784	595	(levelTime, Level 1/World/Level Manager/LevelManager)	9.524799	0.02516079
4785	595	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.130723119	0.0251612067
4786	595	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	9.524799	0.02516079
4787	595	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4788	595	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4789	595	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4790	595	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4791	595	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4792	595	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4793	595	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
4794	595	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	140	140
4795	595	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
4796	595	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
4797	597	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.0092821	0.20592308
4798	597	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.146302611	0.2059212
4799	597	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5375863	0.211293727
4800	597	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	6
4801	597	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	4
4802	597	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
4803	597	(currentLevel, Level 1/World/??/Character)	3	1
4804	597	(currentExp, Level 1/World/??/Character)	11	4
4805	597	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
4806	597	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.06496239
4807	597	(levelTime, Level 1/World/Level Manager/LevelManager)	12.03758	0.211296082
4808	597	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.441090852	0.211293817
4809	597	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.03758	0.211296082
4810	597	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	2
4811	597	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	205	5
4812	597	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	3	1
4813	598	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.5007544	0.349429131
4814	598	(timeSinceLastAttack, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	0.197391987	0.3494283
4815	598	(level, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	1	1
4816	598	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.112226613	-0.400571734
4817	598	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.199604884	-0.873861
4818	598	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4819	598	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1144.39563	24.8416748
4820	598	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
4821	598	(nextLevelExp, Level 1/World/??/Character)	18	7
4822	598	(expToNextLevel, Level 1/World/??/Character)	7	1
4823	598	(levelTime, Level 1/World/Level Manager/LevelManager)	12.5503893	0.376139641
4824	598	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.244820639	-0.332939982
4825	598	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.5503893	0.376139641
4826	598	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
4827	598	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
4828	598	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
4829	598	(<ProjectileSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4830	598	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4831	598	(<FireRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4832	599	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
4833	599	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
4834	599	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
4835	599	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	0	0
4836	600	index	0	0
4837	600	userReportedIntensity	0	0
4838	600	(Empty, NoPath)	0	0
4839	601	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
4840	601	(timeSinceLastAttack, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	0	0
4841	601	(level, Level 1/World/Ability Manager/Shuriken Ability(Clone)/GunAbility)	0	0
4842	601	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
4843	601	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
4844	601	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.07547188	0
4845	601	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
4846	601	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	615.6589	0
4847	601	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
4848	601	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
4849	601	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
4850	601	(currentLevel, Level 1/World/??/Character)	1	0
4851	601	(currentExp, Level 1/World/??/Character)	0	0
4852	601	(nextLevelExp, Level 1/World/??/Character)	5	0
4853	601	(expToNextLevel, Level 1/World/??/Character)	5	0
4854	601	(currentHealth, Level 1/World/??/Character)	100	0
4949	608	index	0	0
4855	601	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
4856	601	(levelTime, Level 1/World/Level Manager/LevelManager)	1.5754714	0
4857	601	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.608854651	0
4858	601	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.5754714	0
4859	601	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4860	601	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4861	601	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4862	601	(<ProjectileSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4863	601	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4864	601	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4865	601	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4866	601	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4867	601	(<FireRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4868	601	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4869	601	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4870	601	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4871	601	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4872	601	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.5393969	0
4873	601	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0345354	0
4874	601	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
4875	601	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.8481284	0
4876	602	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.040163	0.327674985
4877	602	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.329844058	0.331280857
4878	602	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	2
4879	602	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	3
4880	602	(currentExp, Level 1/World/??/Character)	3	3
4881	602	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.35250068	0.3312812
4882	602	(levelTime, Level 1/World/Level Manager/LevelManager)	3.07984376	0.331280947
4883	602	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.259083182	-0.5827143
4884	602	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.07984376	0.331280947
4885	604	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.026056	0.411134481
4886	604	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1526394	0.118103981
4887	604	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
4888	604	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.342629224	0.415870726
4889	604	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	1
4890	604	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
4891	604	(currentLevel, Level 1/World/??/Character)	2	1
4892	604	(currentExp, Level 1/World/??/Character)	6	1
4893	604	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
4894	604	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.167037174	-0.6105751
4895	604	(levelTime, Level 1/World/Level Manager/LevelManager)	5.59262848	0.4158702
4896	604	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.167547867	-0.430974543
4897	604	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.59262848	0.4158702
4898	604	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
4899	604	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
4900	604	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	666.8808	17.7727051
4901	605	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.49731731	3.4712615
4902	605	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.84736	-30
4903	605	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.172871679	0.2366657
4904	605	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
4905	605	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.146332934	-1.00929832
4906	605	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4907	605	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	1
4908	605	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	9	3
4909	605	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
4910	605	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
4911	605	(currentExp, Level 1/World/??/Character)	9	3
4912	605	(nextLevelExp, Level 1/World/??/Character)	11	6
4913	605	(expToNextLevel, Level 1/World/??/Character)	6	1
4914	605	(currentHealth, Level 1/World/??/Character)	94	-6
4915	605	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.07519	-2.05558872
4916	605	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	94	-6
4917	605	(levelTime, Level 1/World/Level Manager/LevelManager)	10.1036663	0.240701675
4918	605	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.7111654	0.240701646
4919	605	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.1036663	0.240701675
4920	605	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4921	605	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4922	605	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
4923	605	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4924	605	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4925	605	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
4926	605	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	5	4
4927	605	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	145	115
4928	605	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	6	6
4929	607	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.9711027	0.483613968
4930	607	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3381195	30.18548
4931	607	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.0593774654	-0.2663848
4932	607	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.8713625	0.487595677
4933	607	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20	6
4934	607	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	2
4935	607	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
4936	607	(currentLevel, Level 1/World/??/Character)	3	1
4937	607	(currentExp, Level 1/World/??/Character)	11	2
4938	607	(currentHealth, Level 1/World/??/Character)	84	-10
4939	607	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
4940	607	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3.10529041
4941	607	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-10
4942	607	(levelTime, Level 1/World/Level Manager/LevelManager)	13.6213551	0.4875946
4943	607	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.619686246	0.487595856
4944	607	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	13.6213551	0.4875946
4945	607	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	10	5
4946	607	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	290	145
4947	607	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	10
4948	607	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
6067	714	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1097	5
6068	714	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1097	5
6134	726	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	26.2300758	0.063993454
6135	726	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.096206665	-0.00465393066
6136	726	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1334	4
6137	726	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	26.2300758	0.063993454
6138	726	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1334	4
6139	727	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6140	728	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6141	728	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1382	1
6142	728	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1382	1
6143	728	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	192.002182	0.170516968
6144	728	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	192.002182	0.170516968
6145	728	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.17048645	0.0674743652
6146	728	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.17048645	0.0674743652
6147	728	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	27.18493	0.954854965
6148	728	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	27.18493	0.954854965
6149	728	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1381	47
6150	728	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1381	47
6151	728	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6152	728	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6153	729	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6154	729	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1433	1
6155	730	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6156	730	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	197.103256	0.184265137
6157	730	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1433	1
6158	730	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.184234619	0.09185791
6159	730	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	197.103256	0.184265137
6160	730	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	28.20245	1.017519
6161	730	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.184234619	0.09185791
6162	730	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1432	51
6163	730	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	28.20245	1.017519
6164	730	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
4952	609	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
4953	609	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
4954	609	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
4955	609	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.05396753	0
4956	609	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
4957	609	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	531.3251	0
4958	609	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
4959	609	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
4960	609	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
4961	609	(currentLevel, Level 1/World/??/Character)	1	0
4962	609	(currentExp, Level 1/World/??/Character)	0	0
4963	609	(nextLevelExp, Level 1/World/??/Character)	5	0
4964	609	(expToNextLevel, Level 1/World/??/Character)	5	0
4965	609	(currentHealth, Level 1/World/??/Character)	100	0
4966	609	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
4967	609	(levelTime, Level 1/World/Level Manager/LevelManager)	1.55396736	0
4968	609	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.585289	0
4969	609	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.55396736	0
4970	609	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4971	609	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4972	609	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
4973	609	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4974	609	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4975	609	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
4976	609	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4977	609	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4978	609	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4979	609	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
4980	609	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.583933055	0
4981	609	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323343	0
4982	609	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
4983	609	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.441846073	0
4984	610	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.0878036	0.424190044
4985	610	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.311867982	0.428220034
4986	610	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
4987	610	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
4988	610	(currentExp, Level 1/World/??/Character)	1	1
4989	610	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	3
4990	610	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.94974589	0.428219676
4991	610	(levelTime, Level 1/World/Level Manager/LevelManager)	3.061866	0.4282198
4992	610	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.239100739	-0.485722542
4993	610	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.061866	0.4282198
4994	612	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.072755	0.125049591
4995	612	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.1528015	0.120467186
4996	612	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
4997	612	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.07288099	0.1301253
4998	612	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10	6
4999	612	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	6	1
5000	612	(currentLevel, Level 1/World/??/Character)	2	1
5001	612	(currentExp, Level 1/World/??/Character)	6	1
5002	612	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5003	612	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.94974589
5004	612	(levelTime, Level 1/World/Level Manager/LevelManager)	6.572882	0.130124092
5005	612	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.318627983	0.130125344
5006	612	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.572882	0.130124092
5007	612	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
5008	612	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	60	60
5009	612	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	833.7642	1
5010	613	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.08967	0.19383812
5011	613	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
5012	613	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.339400262	0.1985155
5013	613	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
5014	613	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	8
5015	613	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	8	2
5016	613	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
5017	613	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
5018	613	(currentExp, Level 1/World/??/Character)	8	2
5019	613	(nextLevelExp, Level 1/World/??/Character)	11	6
5020	613	(expToNextLevel, Level 1/World/??/Character)	6	1
5021	613	(currentHealth, Level 1/World/??/Character)	96	-4
5022	613	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.62920284	0.198515415
5023	613	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-4
5024	613	(levelTime, Level 1/World/Level Manager/LevelManager)	10.5893946	0.198516846
5025	613	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.447946548	0.198515519
5026	613	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.5893946	0.198516846
5027	613	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5028	613	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5029	613	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5030	613	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5031	613	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5032	613	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	4
5033	613	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	180	120
5034	613	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
5035	615	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.565458238	0.0120490789
5036	615	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.8471985	-30
5037	615	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	1
5038	615	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.112887263	0.0644222
5039	615	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	5
5040	615	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	3
5041	615	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
5042	615	(currentLevel, Level 1/World/??/Character)	3	1
5043	615	(currentExp, Level 1/World/??/Character)	11	3
5044	615	(currentHealth, Level 1/World/??/Character)	92	-4
5045	615	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-6.08827
5046	615	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	92	-4
5047	615	(levelTime, Level 1/World/Level Manager/LevelManager)	14.112874	0.0644216537
5048	615	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.423029363	0.06442222
5049	615	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.112874	0.0644216537
5050	615	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	210	30
5051	615	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	8	4
5052	615	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
5053	616	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.32322264	0.481134176
5054	616	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4789848	30.3261833
5055	616	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.078857094	-0.268864483
5056	616	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
5057	616	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3821177	0.4859307
5058	616	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
5059	616	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	32	1
5060	616	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	926.162659	92.39844
5061	616	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
5062	616	(nextLevelExp, Level 1/World/??/Character)	18	7
5063	616	(expToNextLevel, Level 1/World/??/Character)	7	1
5064	616	(currentHealth, Level 1/World/??/Character)	78	-2
5065	616	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	1
5066	616	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.12073135	0.485929728
5067	616	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	78	-2
5068	616	(levelTime, Level 1/World/Level Manager/LevelManager)	18.1321144	0.4859352
5069	616	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.527171135	0.48593086
5070	616	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	18.1321144	0.4859352
5071	616	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
5072	616	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
5073	616	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5074	616	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5075	616	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5076	616	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5077	616	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	9	2
5078	616	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	295	35
5079	616	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	22	2
5080	617	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.226504	3.90328169
5081	617	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
5082	617	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.232134491	0.1532774
5083	617	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.530599	0.148481309
5084	617	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	36	1
5085	617	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
5086	617	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-11
5087	617	(currentExp, Level 1/World/??/Character)	18	7
5088	617	(currentHealth, Level 1/World/??/Character)	72	-6
5089	617	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5090	617	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.22289562	-1.89783573
5091	617	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	72	-6
5092	617	(levelTime, Level 1/World/Level Manager/LevelManager)	22.030611	3.89849663
5093	617	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.226289719	-0.300881416
5094	617	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	22.030611	3.89849663
5095	617	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	17	8
5096	617	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	545	250
5097	617	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	28	6
5098	617	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	5	3
5099	618	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.343502	0.116997719
5100	618	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	2
5101	618	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.34913376	0.116999269
5102	618	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.651505	0.120905995
5103	618	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	36	1
5104	618	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
5105	618	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	18
5106	618	(currentExp, Level 1/World/??/Character)	18	7
5107	618	(currentHealth, Level 1/World/??/Character)	72	-6
5108	618	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5109	618	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.22289562
5110	618	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	72	-6
5111	618	(levelTime, Level 1/World/Level Manager/LevelManager)	22.1515121	0.120901108
5112	618	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.347195774	0.120906055
5113	618	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	22.1515121	0.120901108
5114	618	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	17	8
5115	618	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	545	250
5116	618	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	28	6
5117	618	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	5	3
5118	618	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	942.162659	12
5119	618	(currentLevel, Level 1/World/??/Character)	4	1
5120	619	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5121	619	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5122	619	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5123	620	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
5124	620	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5125	620	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22.4669361	0
5126	620	(totalMouseClicks, Main Menu/Filemanager/GameDataCollector)	1	0
5127	620	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	22.4669361	0
5128	621	index	0	0
5129	621	userReportedIntensity	0	0
5130	621	(Empty, NoPath)	0	0
5131	622	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
5132	622	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
5133	622	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
5134	622	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
5135	622	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.01066471	0
5136	622	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
5137	622	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	385.152557	0
5138	622	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
5139	622	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
5140	622	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
5141	622	(currentLevel, Level 1/World/??/Character)	1	0
5142	622	(currentExp, Level 1/World/??/Character)	0	0
5143	622	(nextLevelExp, Level 1/World/??/Character)	5	0
5144	622	(expToNextLevel, Level 1/World/??/Character)	5	0
5145	622	(currentHealth, Level 1/World/??/Character)	100	0
5146	622	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
5147	622	(levelTime, Level 1/World/Level Manager/LevelManager)	1.4893353	0
5148	622	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.520703852	0
5149	622	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.4893353	0
5150	622	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5151	622	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5152	622	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5153	622	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5154	622	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5155	622	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5156	622	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5157	622	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5158	622	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5159	622	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5160	622	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5161	622	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5162	622	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5163	622	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.517807	0
5164	622	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0323839	0
5165	622	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
5166	622	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	0
5167	622	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.9363522	0
5168	623	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.01610017	0.1065861
5169	623	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.241558731	0.110516995
5170	623	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	3
5171	623	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	394.31485	9.16229248
5172	623	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	1	1
5173	623	(currentExp, Level 1/World/??/Character)	1	1
5174	623	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5175	623	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.43857718	0.110517025
5176	623	(levelTime, Level 1/World/Level Manager/LevelManager)	2.99156046	0.110517025
5177	623	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.1688686	0.11051701
5178	623	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.99156046	0.110517025
5179	625	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.02245474	0.420354366
5180	625	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
5181	625	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.49966535	0.426036
5182	625	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	2
5183	625	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	4
5184	625	(currentLevel, Level 1/World/??/Character)	2	1
5185	625	(currentExp, Level 1/World/??/Character)	5	4
5186	625	(currentHealth, Level 1/World/??/Character)	98	-2
5187	625	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.1174824	0.1174824
5188	625	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	98	-2
5189	625	(levelTime, Level 1/World/Level Manager/LevelManager)	6.99967051	0.426034451
5190	625	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.746202946	0.426036328
5191	625	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	6.99967051	0.426034451
5192	625	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
5193	625	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	30	30
5194	625	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	2	2
5195	626	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	9.202995	0.283688545
5196	626	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3132	0.280816078
5197	626	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.06523697	-0.466313183
5198	626	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	1	1
5199	626	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.262858152	0.288152784
5200	626	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	1
5201	626	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	2
5202	626	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	434.6621	40.34726
5203	626	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	9	1
5204	626	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
5205	626	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
5206	626	(currentExp, Level 1/World/??/Character)	9	1
5207	626	(nextLevelExp, Level 1/World/??/Character)	11	6
5208	626	(expToNextLevel, Level 1/World/??/Character)	6	1
5209	626	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
5210	626	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	3.63067436	0.288152456
5211	626	(levelTime, Level 1/World/Level Manager/LevelManager)	10.5128689	0.2881546
5212	626	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.372216254	0.288152784
5213	626	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.5128689	0.2881546
5214	626	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5215	626	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5216	626	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5217	626	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5218	626	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5219	626	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5220	626	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	4	2
5221	626	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	135	105
5222	627	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.1231184	3.920123
5223	627	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4788666	0.16566658
5224	627	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
5225	627	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.4141303	0.479367256
5226	627	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.73775965	0.4749015
5227	627	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	1
5228	627	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	2
5229	627	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	-5
5230	627	(currentExp, Level 1/World/??/Character)	11	2
5231	627	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.0264598988	-3.60421443
5232	627	(levelTime, Level 1/World/Level Manager/LevelManager)	14.73775	4.224881
5233	627	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.3724861	0.000269860029
5234	627	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	14.73775	4.224881
5235	627	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	2
5236	627	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	205	70
5237	628	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	13.4096622	0.286543846
5238	628	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4788666	0.16566658
5239	628	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	3	3
5240	628	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.0493234769	-0.46345377
5241	628	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.222009882	-0.959769547
5242	628	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	1
5243	628	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	2
5244	628	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
5245	628	(currentExp, Level 1/World/??/Character)	11	2
5246	628	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.0304263979	0.003966499
5247	628	(levelTime, Level 1/World/Level Manager/LevelManager)	15.0279779	0.2902279
5248	628	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6627165	0.2902304
5249	628	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	15.0279779	0.2902279
5250	628	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	2
5251	628	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	205	70
5252	628	(currentLevel, Level 1/World/??/Character)	3	1
5253	629	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	14.9182663	0.215087891
5254	629	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
5255	629	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.040712025	-0.534913659
5256	629	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0368631072	0.219032079
5257	629	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
5258	629	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28	1
5259	629	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
5260	629	(nextLevelExp, Level 1/World/??/Character)	18	7
5261	629	(expToNextLevel, Level 1/World/??/Character)	7	1
5262	629	(currentHealth, Level 1/World/??/Character)	96	-2
5263	629	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	3	2
5264	629	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.53929949	0.219031572
5265	629	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-2
5266	629	(levelTime, Level 1/World/Level Manager/LevelManager)	16.5368481	0.2190342
5267	629	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.2014745	-0.428319454
5268	629	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	16.5368481	0.2190342
5269	629	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
5270	629	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	3	1
5271	629	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5272	629	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5273	629	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5274	629	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	245	40
5275	629	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	2
5276	630	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	18.6942673	3.776001
5277	630	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-19.5211334	-30
5278	630	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.478362024	0.230097339
5279	630	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.0561487637	0.234254315
5280	630	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35	7
5281	630	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	17	6
5282	630	(currentExp, Level 1/World/??/Character)	17	6
5283	630	(currentHealth, Level 1/World/??/Character)	86	-10
5284	630	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	6.558583	0.2342534
5285	630	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	86	-10
5286	630	(levelTime, Level 1/World/Level Manager/LevelManager)	21.5561333	0.234251022
5287	630	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.3315966	0.234254226
5288	630	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	21.5561333	0.234251022
5289	630	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	17	11
5290	630	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	535	290
5291	630	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	14	10
5292	630	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
5293	632	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	-1
5294	632	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.2286808	0.145196185
5295	632	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.556295	0.149180561
5296	632	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	36	1
5297	632	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	1
5298	632	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	18
5299	632	(currentLevel, Level 1/World/??/Character)	4	1
5300	632	(currentExp, Level 1/World/??/Character)	18	1
5301	632	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1
5302	632	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-6.909549
5303	632	(levelTime, Level 1/World/Level Manager/LevelManager)	22.0562725	0.149177551
5304	632	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.252659649	0.149180591
5305	632	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	22.0562725	0.149177551
5306	632	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	545	10
5307	632	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	9	5
5308	633	(level, Level 1/World/Ability Manager/Cooldown Upgrade Ability(Clone)/CooldownUpgradeAbility)	1	1
5309	633	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.12840499	0.0529429168
5310	633	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.2753549	0.05807309
5311	633	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
5312	633	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	40	4
5313	633	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	23	5
5314	633	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	8
5315	633	(currentExp, Level 1/World/??/Character)	23	5
5316	633	(nextLevelExp, Level 1/World/??/Character)	26	8
5317	633	(expToNextLevel, Level 1/World/??/Character)	8	1
5318	633	(currentHealth, Level 1/World/??/Character)	84	-2
5319	633	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.93515944	0.0580730438
5320	633	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	84	-2
5321	633	(levelTime, Level 1/World/Level Manager/LevelManager)	25.0753555	0.05807495
5322	633	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.467383057	0.0580731034
5323	633	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	25.0753555	0.05807495
5324	633	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	24	7
5325	633	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	690	145
5326	633	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	16	2
5327	633	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	20	11
5328	635	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	5	3
5329	635	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.18681474	0.333703816
5330	635	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.01067251	-0.7624132
5331	635	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	45	5
5332	635	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	3
5333	635	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	26
5334	635	(currentLevel, Level 1/World/??/Character)	5	1
5335	635	(currentExp, Level 1/World/??/Character)	26	3
5336	635	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-5.611546
5337	635	(levelTime, Level 1/World/Level Manager/LevelManager)	28.08932	0.3375759
5338	635	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.2938439	-0.181448936
5339	635	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	28.08932	0.3375759
5340	635	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	26	2
5341	635	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	840	60
5342	636	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	23.0024242	0.3804779
5343	636	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.9266491	-10
5344	636	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0.1590512	0.3804865
5345	636	(timeSinceLastHealed, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	4.355944	0.380488873
5346	636	(level, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	1	1
5347	636	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.712259054	0.385064721
5348	636	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
5349	636	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	50	1
5350	636	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	32	1
5351	636	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	35	9
5352	636	(currentExp, Level 1/World/??/Character)	32	1
5353	636	(nextLevelExp, Level 1/World/??/Character)	35	9
5354	636	(expToNextLevel, Level 1/World/??/Character)	9	1
5355	636	(currentHealth, Level 1/World/??/Character)	74	-10
5356	636	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	4.01200056	0.385065079
5357	636	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	74	-10
5358	636	(levelTime, Level 1/World/Level Manager/LevelManager)	32.1122169	0.385057449
5359	636	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.319880217	-0.100406855
5360	636	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	2.11223	0.385064363
5361	636	(<RecoveryCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5362	636	(<RecoveryUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5363	636	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	35	9
5364	636	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	1085	10
5365	636	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	26	10
5366	638	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.6050399	-22.3973846
5367	638	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	-9.073351	-10
5368	638	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	2	-3
5369	638	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	-0.203984082	-0.271693051
5370	638	(timeSinceLastHealed, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	7.36791134	0.403307438
5371	638	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.4241041	0.4077647
5372	638	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	54	4
5373	638	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	36	1
5374	638	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	35	35
5375	638	(currentLevel, Level 1/World/??/Character)	6	1
5376	638	(currentExp, Level 1/World/??/Character)	36	1
5377	638	(currentHealth, Level 1/World/??/Character)	66	-8
5378	638	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-1.23957872
5379	638	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	66	-8
5380	638	(levelTime, Level 1/World/Level Manager/LevelManager)	35.1240654	0.407764435
5381	638	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0340043381	-0.0531114563
5382	638	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.12407255	0.4077654
5383	638	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	40	1
5384	638	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	1225	10
5385	638	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	34	8
5386	638	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	481.8889	33.2267761
5387	639	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5388	639	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
5389	639	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	59.71972	0
5390	639	(totalMouseClicks, Main Menu/Filemanager/GameDataCollector)	0	0
5391	639	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	59.71972	0
5392	640	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	142.97876	30.9446182
5393	640	(totalMouseDistance, Main Menu/Filemanager/GameDataCollector)	142.97876	30.9446182
5394	641	index	0	0
5395	641	userReportedIntensity	0	0
5396	641	(Empty, NoPath)	0	0
5397	642	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	0	0
5398	642	(level, Level 1/World/Ability Manager/Cooldown Upgrade Ability(Clone)/CooldownUpgradeAbility)	0	0
5399	642	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	0	0
5400	642	(timeSinceLastAttack, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
8946	1051	(letterCounter, ScriptableObjects/Statistics)	974	334
5401	642	(level, Level 1/World/Ability Manager/Dagger Ability(Clone)/DaggerAbility)	0	0
5402	642	(timeSinceLastHealed, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	0	0
5403	642	(level, Level 1/World/Ability Manager/Recovery Ability(Clone)/RecoveryAbility)	0	0
5404	642	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.02447908	0
5405	642	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	0
5406	642	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	935.884338	0
5407	642	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
5408	642	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	0	0
5409	642	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	0
5410	642	(currentLevel, Level 1/World/??/Character)	1	0
5411	642	(currentExp, Level 1/World/??/Character)	0	0
5412	642	(nextLevelExp, Level 1/World/??/Character)	5	0
5413	642	(expToNextLevel, Level 1/World/??/Character)	5	0
5414	642	(currentHealth, Level 1/World/??/Character)	100	0
5415	642	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	100	0
5416	642	(levelTime, Level 1/World/Level Manager/LevelManager)	1.52447891	0
5417	642	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5558704	0
5418	642	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	1.52447891	0
5419	642	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5420	642	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5421	642	(<WeaponCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	0
5422	642	(<RecoveryCooldownUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5423	642	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5424	642	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5425	642	(<RecoveryUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5426	642	(<BleedDamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5427	642	(<BleedRateUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5428	642	(<BleedDurationUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5429	642	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	0	0
5430	642	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5431	642	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5432	642	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5433	642	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	0	0
5434	642	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.552222252	0
5435	642	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.0324087	0
5436	642	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	0
5437	642	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	0
5438	642	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.6663253	0
5439	643	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	2.05822587	0.341309071
5440	643	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.284201115	0.3450274
5441	643	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	2
5442	643	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	3	2
5443	643	(currentExp, Level 1/World/??/Character)	3	2
5444	643	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.176047	0.3450277
5445	643	(levelTime, Level 1/World/Level Manager/LevelManager)	3.03420234	0.345028877
5446	643	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.211516485	-0.568907142
5447	643	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	3.03420234	0.345028877
5448	645	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	3.5650754	0.493658543
5449	645	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	4	4
5450	645	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.5419608	0.498285681
5451	645	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	1
5452	645	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	2
5453	645	(currentLevel, Level 1/World/??/Character)	2	1
5454	645	(currentExp, Level 1/World/??/Character)	5	2
5455	645	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	-2
5456	645	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.1289901	-3.05652952
5457	645	(levelTime, Level 1/World/Level Manager/LevelManager)	4.54196024	0.4982853
5458	645	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.829403639	0.4982857
5459	645	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	4.54196024	0.4982853
5460	646	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	4.06775	0.13036418
5461	646	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.0324087143	-10
5462	646	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	1	1
5463	646	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.2046366	-1.1142807
5464	646	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
5465	646	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1108.60645	172.7221
5466	646	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	5	5
5467	646	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	6
5468	646	(nextLevelExp, Level 1/World/??/Character)	11	6
5469	646	(expToNextLevel, Level 1/World/??/Character)	6	1
5470	646	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	2
5471	646	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.632392764	0.135719359
5472	646	(levelTime, Level 1/World/Level Manager/LevelManager)	5.04536438	0.135720253
5473	646	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.465287268	0.135719359
5474	646	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	5.04536438	0.135720253
5475	646	(<DamageUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5476	646	(<KnockbackUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	2	1
5477	646	(<AOEUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5478	646	(<ProjectileCountUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5479	646	(<RotationSpeedUpgradeablesCount>k__BackingField, Level 1/World/Ability Manager/AbilityManager)	1	1
5480	646	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	10	10
5481	647	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	8.59258652	0.150014877
5482	647	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.2619925	10.2295837
5483	647	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.181279063	-1.09568393
5484	647	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17	1
5485	647	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1121.60645	13
5486	647	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	8	3
5487	647	(currentExp, Level 1/World/??/Character)	8	3
5488	647	(currentHealth, Level 1/World/??/Character)	96	-4
5489	647	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	1
5490	647	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	2.2945292	0.154316187
5491	647	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	96	-4
5492	647	(levelTime, Level 1/World/Level Manager/LevelManager)	10.068717	0.154315948
5493	647	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.6746645	0.154315889
5494	647	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	10.068717	0.154315948
5495	647	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	3	3
5496	647	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	90	80
5497	647	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	4	4
5498	647	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	1	1
5499	649	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.125518709	-10.1073666
5500	649	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.3626032	0.100610733
5501	649	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	-0.174366891	-0.8526764
5502	649	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	1
5503	649	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	3
5504	649	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	11	11
5505	649	(currentLevel, Level 1/World/??/Character)	3	1
5506	649	(currentExp, Level 1/World/??/Character)	11	3
5507	649	(currentHealth, Level 1/World/??/Character)	86	-6
5508	649	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-2
5509	649	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.08179891	-4.32231569
5510	649	(currentPoints, Level 1/UI Canvas/Safe Area/???/PointBar)	86	-6
5511	649	(levelTime, Level 1/World/Level Manager/LevelManager)	12.5756264	0.397320747
5512	649	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.270171762	-0.3117274
5513	649	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	12.5756264	0.397320747
5514	649	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	6	3
5515	649	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	200	30
5516	649	(damageTaken, Level 1/UI Canvas/Stats Manager/StatsManager)	14	6
5517	650	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	0.628253341	0.4014337
5518	650	(level, Level 1/World/Ability Manager/Knockback Upgrade Ability(Clone)/KnockbackUpgradeAbility)	1	1
5519	650	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.327903	0.40565598
5520	650	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	1
5521	650	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	7
5522	650	(nextLevelExp, Level 1/World/??/Character)	18	7
5523	650	(expToNextLevel, Level 1/World/??/Character)	7	1
5524	650	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	1	1
5525	650	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0.584068835	0.405656
5526	650	(levelTime, Level 1/World/Level Manager/LevelManager)	13.077898	0.405657768
5527	650	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.07485169	-0.291933954
5528	650	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	13.077898	0.405657768
5529	651	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	5.335405	0.4203825
5530	651	(currentHealth, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	10.4789467	0.1163435
5531	651	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.350426137	0.426139653
5532	651	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30	1
5533	651	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	16	5
5534	651	(currentExp, Level 1/World/??/Character)	16	5
5535	651	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5536	651	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	5.60659	0.4261408
5537	651	(levelTime, Level 1/World/Level Manager/LevelManager)	18.10044	0.426141739
5538	651	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.495629668	0.426139623
5539	651	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	18.10044	0.426141739
5540	651	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	10	4
5541	651	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	310	20
5542	653	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	6.342748	0.231917858
5543	653	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.10573329	0.2356372
5544	653	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6	1
5545	653	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33	3
5546	653	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	2
5547	653	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	18	18
5548	653	(currentLevel, Level 1/World/??/Character)	4	1
5549	653	(currentExp, Level 1/World/??/Character)	18	2
5550	653	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5551	653	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-6.376257
5552	653	(levelTime, Level 1/World/Level Manager/LevelManager)	19.10576	0.2356453
5553	653	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.264758557	0.235637173
5554	653	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	19.10576	0.2356453
5555	654	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	7.850297	0.121314049
5556	654	(level, Level 1/World/Ability Manager/Book Ability(Clone)/BookAbility)	2	1
5557	654	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.3642371	0.125990912
5558	654	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35	2
5559	654	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	19	1
5560	654	(maxPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	8
5561	654	(currentExp, Level 1/World/??/Character)	19	1
5562	654	(nextLevelExp, Level 1/World/??/Character)	26	8
5563	654	(expToNextLevel, Level 1/World/??/Character)	8	1
5564	654	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	2	1
5565	654	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	1.49850786	0.125990629
5566	654	(levelTime, Level 1/World/Level Manager/LevelManager)	20.6142712	0.125991821
5567	654	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.5671897	0.125991017
5568	654	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	20.6142712	0.125991821
5569	654	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	15	1
5570	654	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	475	15
5571	656	(timeSinceLastAttack, Level 1/World/Level Manager/????/???/???/Default Melee Monster(Clone)/MeleeMonster)	11.8647814	0.351981163
5572	656	(userReportedIntensity, Level 1/DiffEventEmitter/DiffEventEmitter)	1	-3
5573	656	(timeSinceLastAttack, Level 1/World/Ability Manager/Fixed Direction Stab Ability(Clone)/FixedDirectionStabAbility)	0.628574431	0.3565003
5574	656	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	40	5
5575	656	(currentPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	7
5576	656	(minPoints, Level 1/UI Canvas/Safe Area/Upper UI/???/PointBar)	26	26
5577	656	(currentLevel, Level 1/World/??/Character)	5	1
5578	656	(currentExp, Level 1/World/??/Character)	26	7
5579	656	(currSequenceFrame, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-3
5580	656	(animationTime, Level 1/World/??/Character Sprite/SpriteAnimator)	0	-5.15634727
5581	656	(levelTime, Level 1/World/Level Manager/LevelManager)	24.6286163	0.3564949
5582	656	(timeSinceLastMonsterSpawned, Level 1/World/Level Manager/LevelManager)	0.0200548768	-0.1928375
5583	656	(timeSinceLastChestSpawned, Level 1/World/Level Manager/LevelManager)	24.6286163	0.3564949
5584	656	(monstersKilled, Level 1/UI Canvas/Stats Manager/StatsManager)	21	6
5585	656	(damageDealt, Level 1/UI Canvas/Stats Manager/StatsManager)	580	105
5586	656	(coinsGained, Level 1/UI Canvas/Stats Manager/StatsManager)	2	1
5587	657	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	239	0
5588	657	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	60.9918137	0
5589	657	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0770568848	0
5590	657	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	49.5613823	0
5591	657	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	28	0
5592	657	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17	0
5593	657	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11192.499	0
5594	657	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
5595	657	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	17	0
5596	657	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.55394208	0
5597	657	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	20	0
5598	657	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.96614265	0
5599	657	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	238	0
5600	657	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	0
5601	657	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
5602	658	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5603	658	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	243	2
5604	658	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	79.41026	18.227253
5605	658	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4.823227	4.713867
5606	658	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	1
5607	658	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	21	4
5608	658	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.04598117	0.0039999485
5609	658	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.023621	0.004000187
5610	658	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	242	1
5611	658	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5612	659	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5613	659	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	4
5614	659	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	79.95026	0.40776062
5615	659	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.102218628	0.00100708008
5616	659	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	74.58642	25.0250359
5617	659	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.20022655	0.06106043
5618	659	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.09028769	0.0666666
5619	659	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	3
5620	660	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	304	4
5621	660	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	85.08547	0.452461243
5622	660	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.179359436	0.08489227
5623	660	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	29	1
5624	660	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15996.4736	2353.34668
5625	660	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.93196869	0.731742144
5626	660	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	22	2
5627	660	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.174148	0.0546441078
5628	660	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	303	3
5629	660	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
5630	661	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	352	2
5631	661	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	89.9056854	0.1945343
5632	661	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0590515137	-0.0455474854
5633	661	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	88.00852	13.4221039
5634	661	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16729.5449	733.0713
5635	661	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.06464529	0.0275964737
5636	661	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	351	1
5637	661	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
5638	662	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5639	662	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	407	6
5640	662	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	95.34313	0.5710373
5641	662	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.123840332	0.007659912
5642	662	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.139149	0.0899877548
5643	662	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	406	5
5644	663	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	456	4
5645	663	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	100.269234	0.4067459
5646	663	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09467316	-0.003540039
5647	663	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.13003349	0.0621919632
5648	663	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	455	3
5649	664	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5650	664	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	509	6
5651	664	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	105.420013	0.513946533
5652	664	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09710693	-0.00106811523
5653	664	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.1596775	0.08317566
5654	664	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	508	5
5655	665	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5656	665	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	562	1
5657	665	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	110.110634	0.111549377
5658	665	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.11151886	0.0268554688
5659	665	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31	2
5660	665	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20526.1641	116.542969
5661	665	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	23	2
5662	665	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.19272327	1.26075459
5663	665	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	24	2
5664	665	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.0746326	0.914955139
5665	665	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	561	53
5666	666	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	240	0
5667	666	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	184.449112	0
5668	667	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	240	0
5669	667	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07707214	0
5670	667	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	184.449112	0
5671	667	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	184.140823	0
5672	667	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07707214	0
5673	667	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
5674	667	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	184.140823	0
5675	667	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
5676	667	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
5677	667	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13500.958	0
5678	667	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	0
5679	667	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
5680	667	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13500.958	0
5681	667	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	12	0
5682	667	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
5683	667	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.5288977	0
5684	667	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	12	0
5685	667	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	11	0
5686	667	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.5288977	0
5687	667	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.70656371	0
5688	667	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	11	0
5689	667	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	239	0
5690	667	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.70656371	0
5691	667	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
5692	667	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	239	0
5693	667	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
5694	667	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
5695	667	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
5696	668	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	261	4
5697	669	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	261	4
5698	669	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	464.881927	278.725159
5699	669	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	464.881927	278.725159
5700	669	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1355896	0.03413391
5701	669	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1355896	0.03413391
5702	669	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.952517748	0.06666666
5703	669	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.952517748	0.06666666
5704	669	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	13	2
5705	669	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	13	2
5706	669	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.762441	0.09806919
5707	669	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.762441	0.09806919
5708	669	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	260	3
5709	669	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	260	3
5710	670	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5711	670	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	270	2
5712	670	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	470.7691	-277.091553
5713	670	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.317474365	0.216918945
5714	670	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.977462	0.004000187
5715	670	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	269	1
5716	670	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
5717	671	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5718	671	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	270	2
5719	671	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	470.7691	-277.091553
5720	671	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.317474365	0.216918945
5721	671	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.977462	0.004000187
5722	671	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	269	1
5723	671	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
5724	672	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-270
5725	672	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	15.9390259	-454.830078
5726	672	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.317474365
5727	672	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-184.140823
5728	672	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
5729	672	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8
5730	672	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-13500.958
5731	672	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	2
5732	672	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	0.00399999833
5733	672	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	2
5734	672	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	0.00399999833
5735	672	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-2
5736	673	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5737	673	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-50
5738	673	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	42.8075867	-0.5207672
5739	673	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.0872077942
5740	673	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-39.1327248
5741	673	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-13599.6045
5742	673	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
5743	673	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-1
5744	673	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-0.7998441
5745	673	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-50
5746	673	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5747	674	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5748	674	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	219	5
5749	674	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	76.21166	0.51084137
5750	674	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.170608521	0.08617401
5751	674	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	67.23138	10.8994179
5752	674	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	151077.031	147745.922
5753	674	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
5754	674	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	4
5755	674	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.80062819	0.06798792
5756	674	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	218	4
5757	674	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
5758	674	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	2
5759	675	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
5760	676	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
5761	676	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
5762	676	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
5763	676	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	78.3543	0
5764	676	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	78.3543	0
5765	676	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101196289	0
5766	676	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101196289	0
5767	676	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	67.23138	0
5768	676	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	67.23138	0
5769	676	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	151077.031	0
5770	676	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	151077.031	0
5771	676	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
5772	676	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
5773	676	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	11	0
5774	676	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	11	0
5775	676	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.243061	0
5776	676	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.243061	0
5777	676	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
5778	676	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
5779	676	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
5780	676	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
5781	676	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	0
5782	676	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	0
5783	677	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5784	678	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5785	678	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	270	4
5786	678	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	270	4
5787	678	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	81.14443	0.411315918
5788	678	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	81.14443	0.411315918
5789	678	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09906006	-0.00440979
5790	678	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09906006	-0.00440979
5791	678	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	80.62814	13.3967667
5792	678	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	80.62814	13.3967667
5793	678	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	153937.438	2860.40625
5794	678	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	153937.438	2860.40625
5795	678	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.78278255	0.0625066757
5796	678	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.78278255	0.0625066757
5797	678	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	269	3
5798	678	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	269	3
5799	679	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	320	3
5800	680	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	320	3
5801	680	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	86.11195	0.3141861
5802	680	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	86.11195	0.3141861
5803	680	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1065979	0.007774353
5804	680	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1065979	0.007774353
5805	680	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	156245.672	2308.23438
5806	680	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	156245.672	2308.23438
5807	680	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.77463865	0.0414118767
5808	680	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.77463865	0.0414118767
5809	680	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	319	2
5810	680	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	319	2
5811	680	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5812	680	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5813	681	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	370	3
5814	681	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	91.19823	0.304084778
5815	682	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	370	3
5816	682	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09302521	-0.00649261475
5817	682	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	91.19823	0.304084778
5818	682	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.793709	0.04115677
5819	682	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09302521	-0.00649261475
5820	682	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	369	2
5821	682	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.793709	0.04115677
5822	682	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5823	682	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	369	2
5824	682	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5825	683	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	421	4
5826	683	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	96.3308945	0.397277832
5827	684	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	421	4
5828	684	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0962219238	-0.0030670166
5829	684	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	96.3308945	0.397277832
5830	684	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.82034445	0.0599560738
5831	684	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0962219238	-0.0030670166
5832	684	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	420	3
5833	684	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.82034445	0.0599560738
5834	684	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
5835	684	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	420	3
5836	684	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
5837	685	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5838	686	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5839	686	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	466	5
5840	686	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	466	5
5841	686	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	100.735611	0.4165573
5842	686	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	100.735611	0.4165573
5843	686	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09966278	0.00255584717
5844	686	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09966278	0.00255584717
5845	686	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.700949	0.083067894
5846	686	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.700949	0.083067894
5847	686	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	465	5
5848	686	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	465	5
5849	686	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5850	686	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5851	687	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	472	3
5852	688	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	472	3
5853	688	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	101.330284	0.2974472
5854	688	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	101.330284	0.2974472
9832	1135	(score, Statics/Score)	3	3
5855	688	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0976028442	-0.00122833252
5856	688	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0976028442	-0.00122833252
5857	688	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.82010651	0.0398015976
5858	688	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.82010651	0.0398015976
5859	688	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	471	2
5860	688	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	471	2
5861	688	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5862	688	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5863	689	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	523	4
5864	689	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	106.472984	0.440177917
5865	690	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	523	4
5866	690	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0993499756	0.000793457031
5867	690	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	106.472984	0.440177917
5868	690	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.848447	0.0682401657
5869	690	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0993499756	0.000793457031
5870	690	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	522	3
5871	690	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.848447	0.0682401657
5872	690	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
5873	690	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	522	3
5874	690	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
5875	691	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5876	692	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5877	692	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	571	1
5878	692	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	571	1
5879	692	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	111.225052	0.1255951
5880	692	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	111.225052	0.1255951
5881	692	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125579834	0.0271606445
5882	692	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125579834	0.0271606445
5883	692	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.7936277	0.9451809
5884	692	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.7936277	0.9451809
5885	692	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	570	48
5886	692	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	570	48
5887	693	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5888	693	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	629	2
5889	694	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5890	694	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	116.293991	0.179573059
5891	694	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	629	2
5892	694	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.05596161	-0.03176117
5893	694	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	116.293991	0.179573059
5894	694	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	1
5895	694	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.05596161	-0.03176117
5896	694	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	158837.313	2591.64063
5897	694	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	1
5898	694	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
5899	694	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	158837.313	2591.64063
5900	694	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
5901	694	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
5902	694	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.676849544	0.02466017
5903	694	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
5904	694	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.1772528	0.383625031
5905	694	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.676849544	0.02466017
5906	694	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	628	1
5907	694	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.1772528	0.383625031
5908	694	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
5909	694	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	628	1
5910	694	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
5911	695	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5912	696	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5913	696	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	682	3
5914	696	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	682	3
5915	696	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	121.404449	0.276016235
5916	696	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	121.404449	0.276016235
5917	696	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09604645	0.0157699585
5918	696	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09604645	0.0157699585
5919	696	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	118.582245	37.9541
5920	696	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	118.582245	37.9541
5921	696	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20	1
5922	696	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20	1
5923	696	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
5924	696	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
5925	696	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.7971672	0.120317638
5926	696	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.7971672	0.120317638
5927	696	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
5928	696	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
5929	696	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.4545135	0.0359277725
5930	696	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.4545135	0.0359277725
5931	696	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	681	2
5932	696	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	681	2
5933	698	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	736	5
5934	699	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	736	5
5935	699	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	126.851784	0.6356888
5936	699	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	126.851784	0.6356888
5937	699	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.142326355	0.02822113
5938	699	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.142326355	0.02822113
5939	699	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	124.558311	5.97606659
5940	699	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	124.558311	5.97606659
5941	699	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	1
5942	699	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	1
5943	699	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	162948.031	2157.48438
5944	699	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	162948.031	2157.48438
5945	699	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	15	1
5946	699	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	15	1
5947	699	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.4374323	0.09860039
5948	699	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.4374323	0.09860039
5949	699	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	735	4
5950	699	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	735	4
5951	699	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
5952	699	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
5953	700	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5954	701	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5955	701	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	784	4
5956	701	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	784	4
5957	701	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	131.700821	0.415512085
5958	701	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	131.700821	0.415512085
5959	701	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100097656	0.007675171
5960	701	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100097656	0.007675171
5961	701	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.415576	0.06302166
5962	701	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.415576	0.06302166
5963	701	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	783	3
5964	701	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	783	3
5965	701	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
5966	701	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
5967	702	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	832	3
5968	703	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	832	3
5969	703	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	136.688934	0.363174438
5970	703	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	136.688934	0.363174438
5971	703	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.127822876	0.0133209229
5972	703	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.127822876	0.0133209229
5973	703	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.40787	0.04729271
5974	703	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.40787	0.04729271
5975	703	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	831	2
5976	703	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	831	2
5977	703	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5978	703	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
5979	704	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5980	705	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
5981	705	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	879	1
5982	705	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	879	1
5983	705	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	141.5113	0.126068115
5984	705	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	141.5113	0.126068115
5985	705	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.126052856	0.02708435
5986	705	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.126052856	0.02708435
9906	1147	(timeSpendIdle, ScriptableObjects/Statistics)	17.7002144	0.220005035
5987	705	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.3727341	0.964864731
5988	705	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.3727341	0.964864731
5989	705	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	878	47
5990	705	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	878	47
5991	705	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
5992	705	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
5993	706	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5994	706	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	938	1
5995	707	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
5996	707	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	146.573517	0.122634888
5997	707	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	938	1
5998	707	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.122619629	0.0354919434
5999	707	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	146.573517	0.122634888
6000	707	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25	4
6001	707	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.122619629	0.0354919434
6002	707	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	164984.75	2036.71875
6003	707	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25	4
6004	707	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	18	5
6005	707	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	164984.75	2036.71875
6006	707	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.35548067	5.55831337
6007	707	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	18	5
6008	707	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	1
6009	707	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.35548067	5.55831337
6010	707	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	18.0244637	0.6517296
6011	707	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	1
6012	707	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	937	59
6013	707	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	18.0244637	0.6517296
6014	707	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	937	59
6015	708	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6016	708	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	995	5
6017	709	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6018	709	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	151.819443	0.3338623
6019	709	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	995	5
6020	709	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06907654	-0.0302276611
6021	709	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	151.819443	0.3338623
6022	709	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	151.023331	26.46502
6023	709	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06907654	-0.0302276611
6024	709	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	2
6025	709	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	151.023331	26.46502
6026	709	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	170811.344	2364.51563
6027	709	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	2
6028	709	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	1
6029	709	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	170811.344	2364.51563
6030	709	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.318311	0.05294752
6031	709	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	1
6032	709	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	994	4
6033	709	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.318311	0.05294752
6034	709	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	994	4
6035	711	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6036	711	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1051	6
6037	712	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6038	712	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	157.0646	0.575698853
6039	712	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1051	6
6040	712	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.187347412	0.0922699
6041	712	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	157.0646	0.575698853
6042	712	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30	3
6043	712	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.187347412	0.0922699
6044	712	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	175164.125	2942.125
6045	712	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30	3
6046	712	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.161139	0.8428273
6047	712	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	175164.125	2942.125
6048	712	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	20	4
6049	712	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.161139	0.8428273
6050	712	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.3001289	0.07762146
6051	712	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	20	4
6052	712	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1050	5
6053	712	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.3001289	0.07762146
6054	712	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1050	5
6069	715	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1141	1
6070	716	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1141	1
6071	716	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	166.762024	0.214447021
6072	716	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	166.762024	0.214447021
6073	716	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2144165	0.111694336
6074	716	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2144165	0.111694336
6075	716	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.12779	0.919088364
6076	716	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.12779	0.919088364
6077	716	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1140	43
6078	716	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1140	43
6079	717	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1190	4
6080	717	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	171.890335	0.318344116
6081	718	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1190	4
6082	718	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0193023682	-0.08076477
6083	718	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	171.890335	0.318344116
6084	718	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.1927357	0.05980873
6085	718	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0193023682	-0.08076477
6086	718	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1189	3
6087	718	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.1927357	0.05980873
6088	718	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6089	718	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1189	3
6090	718	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6091	719	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1242	6
6092	720	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1242	6
6093	720	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	177.169952	0.5082855
6094	720	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	177.169952	0.5082855
6095	720	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.102554321	-0.022064209
6096	720	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.102554321	-0.022064209
6097	720	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	24.2321148	0.08362961
6098	720	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	24.2321148	0.08362961
6099	720	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1241	5
6100	720	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1241	5
6101	720	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6102	720	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6103	721	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6104	722	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6105	722	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1287	6
6106	722	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1287	6
6107	722	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	182.240967	0.5737152
6108	722	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	182.240967	0.5737152
6109	722	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100479126	-0.0367126465
6110	722	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100479126	-0.0367126465
6111	722	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.2467365	0.09474373
6112	722	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.2467365	0.09474373
6113	722	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1286	5
6114	722	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1286	5
6115	722	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6116	722	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6117	723	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1304	5
6118	724	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1304	5
6119	724	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	183.951248	0.491653442
6120	724	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	183.951248	0.491653442
6121	724	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.111724854	0.0150756836
6122	724	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.111724854	0.0150756836
6123	724	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.5865021	0.09591675
6124	724	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.5865021	0.09591675
6125	724	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1303	5
6126	724	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1303	5
6127	724	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6128	724	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6129	725	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1335	5
6130	725	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	187.153839	0.416641235
6131	726	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1335	5
6132	726	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.096206665	-0.00465393066
6133	726	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	187.153839	0.416641235
6165	730	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1432	51
6166	730	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6167	731	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1672	4
6168	731	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	222.7846	0.397521973
6169	731	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09970093	-0.009185791
6170	731	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	187303.453	3600.34375
6171	731	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	33.3384171	0.0595550537
6172	731	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1671	3
6173	731	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
6174	732	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6175	732	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1729	6
6176	732	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	228.129562	0.6537781
6177	732	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.185531616	0.09509277
6178	732	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	33	3
6179	732	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
6180	732	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	191748.969	4445.51563
6181	732	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	22	3
6182	732	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	21.4322338	0.0936450958
6183	732	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	21	1
6184	732	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	34.2795868	0.04360199
6185	732	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1728	5
6186	732	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	-1
6187	733	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1783	5
6188	733	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	233.1197	0.53692627
6189	733	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0861358643	-0.00273132324
6190	733	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39	1
6191	733	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	1
6192	733	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	22.4500427	0.09004021
6193	733	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1782	4
6194	733	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	2
6195	734	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6196	734	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1838	5
6197	734	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	238.200668	0.554657
6198	734	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.189987183	0.09861755
6199	734	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	45	1
6200	734	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	28	2
6201	734	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	23.5450134	0.3186798
6202	734	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	27	6
6203	734	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	36.5429726	0.07286453
6204	734	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1837	4
6205	734	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
6206	734	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	2
6207	735	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6208	735	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1892	4
6209	735	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	243.148987	0.447814941
6210	735	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.174636841	0.08888245
6211	735	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	55	2
6212	735	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	33	4
6213	735	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	24.5462723	0.504890442
6214	735	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	32	5
6215	735	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	37.5308	0.0545692444
6216	735	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1891	3
6217	735	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-2
6218	737	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6219	737	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1942	4
6220	737	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	248.120667	0.345962524
6221	737	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103378296	0.0849762
6222	737	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	247.755417	88.89485
6223	737	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	57	2
6224	737	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	195551.047	3802.07813
6225	737	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	24.9530926	0.4068203
6226	737	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	34	2
6227	737	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	38.4856529	0.04870987
6228	737	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1941	3
6229	737	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6230	737	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
6231	738	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6232	738	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1992	4
6233	738	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	253.079391	0.309860229
6234	738	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0119781494	-0.08772278
6235	738	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	39.4956665	0.0596466064
6236	738	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1991	3
6237	739	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2040	1
6238	739	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	257.9588	0.152923584
6239	739	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.152893066	0.052520752
6240	739	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	40.4433556	0.947689056
6241	739	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2039	48
6242	740	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6243	740	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2089	1
6244	740	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	262.983368	0.150421143
6245	740	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.150390625	-0.04650879
6246	740	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	41.44846	1.00510406
6247	740	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2088	49
6248	740	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6249	741	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6250	741	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2139	2
6251	741	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	268.0617	0.199798584
6252	741	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.057800293	-0.0417785645
6253	741	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	42.4827538	0.02827835
6254	741	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2138	1
6255	741	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
6256	742	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2175	6
6257	742	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	271.417664	0.353240967
6258	742	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2029419	0.104064941
6259	742	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	43.1250458	0.0498771667
6260	742	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2174	6
6261	742	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
6262	743	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2191	1
6263	743	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	273.07608	0.145599365
6264	743	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.145568848	0.0475463867
6265	743	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	199342.3	3791.25
6266	743	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	43.4683228	0.343276978
6267	743	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2190	16
6268	744	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2247	3
6269	744	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	278.3836	0.3703308
6270	744	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09173584	0.00228881836
6271	744	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	60	3
6272	744	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	204985.828	5643.53125
6273	744	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	3
6274	744	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	26.6552238	0.0556716919
6275	744	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	44.09599	0.6276665
6276	744	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2246	2
6277	744	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
6278	745	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2295	1
6279	745	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	283.407837	0.262084961
6280	745	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.262023926	0.163208008
6281	745	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	281.151031	33.3956146
6282	745	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	206749.547	1763.71875
6283	745	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	27.5179157	0.8626919
6284	745	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2294	48
6285	746	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2347	3
6286	746	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	288.45755	0.298339844
6287	746	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100982666	-0.0002746582
6288	746	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	28.5600986	0.0395717621
6289	746	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2346	2
6290	747	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2396	2
6291	747	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	293.437653	0.208374023
6292	747	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0187072754	-0.08111572
6293	747	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	29.5725327	0.0378913879
6294	747	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2395	1
6295	748	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2447	3
6296	748	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	298.544983	0.2973938
6297	748	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09854126	-0.00128173828
6298	748	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	30.5780449	0.0398082733
6299	748	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2446	2
6300	749	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6301	749	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2496	1
6302	749	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	303.456177	0.119995117
6303	749	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1199646	0.0129089355
6304	749	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	31.5560226	0.977977753
6305	749	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2495	49
6306	750	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6307	750	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2549	3
6308	750	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	308.6684	0.309021
6309	750	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.105987549	0.007080078
6310	750	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	32.6012459	0.04058075
6311	750	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2548	2
6312	751	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6313	751	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2602	5
6314	751	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	313.8728	0.41003418
6315	751	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09841919	-0.0002746582
6316	751	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	33.6436844	0.06232071
6317	751	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2601	4
6318	752	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6319	752	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2652	4
6320	752	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	318.922272	0.4140625
6321	752	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103240967	0.002746582
6322	752	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	34.6525841	0.06212616
6323	752	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2651	3
6324	753	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2698	1
6325	753	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	323.671783	0.127471924
6326	753	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1274414	0.0267333984
6327	753	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	35.5975266	0.9449425
6328	753	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2697	46
6329	754	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2749	2
6330	754	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	328.852875	0.23147583
6331	754	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0387573242	-0.0606384277
6332	754	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	36.651516	0.0385322571
6333	754	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2748	1
6334	755	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6335	755	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2797	1
6336	755	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	333.857452	0.133636475
6337	755	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.133605957	0.034576416
6338	755	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	37.633564	0.982048035
6339	755	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2796	48
6340	756	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6341	756	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2848	1
6342	756	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	338.975525	0.149841309
6343	756	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.149810791	0.0485534668
6344	756	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	38.65392	1.02035522
6345	756	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2847	51
6346	757	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6347	757	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2900	2
6348	757	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	344.045654	0.202575684
6349	757	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0809021	-0.0189208984
6350	757	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	39.68175	0.0243339539
6351	757	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2899	1
6352	758	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6353	758	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2949	1
6354	758	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	349.000275	0.122711182
6355	758	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.122680664	0.024230957
6356	758	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	40.66427	0.982517242
6357	758	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2948	49
6358	759	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2999	1
6359	759	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	354.051025	0.1257019
6360	759	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125671387	0.0283813477
6361	759	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	41.67389	1.00962067
6362	759	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2998	50
6363	760	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6364	760	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3051	2
6365	760	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	359.177856	0.197692871
6366	760	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06689453	-0.0355834961
6367	760	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	42.71079	0.0259284973
6368	760	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3050	1
6369	761	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3099	1
6370	761	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	364.1807	0.13180542
6371	761	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1317749	0.0282592773
6372	761	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	43.6984634	0.9876747
6373	761	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3098	48
6374	762	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6375	762	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3155	6
6376	762	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	369.650116	0.51651
6377	762	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09866333	-0.0008239746
6378	762	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	44.79911	0.0835456848
6379	762	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3154	5
6380	763	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3203	3
6381	763	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	374.51886	0.2930298
6382	763	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101867676	-0.005706787
6383	763	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	45.77221	0.0386352539
6384	763	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3202	2
6385	764	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6386	764	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3257	6
6387	764	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	379.7807	0.5144043
6388	764	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0993042	-0.0158996582
6389	764	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	46.8251076	0.08313751
6390	764	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3256	5
6391	765	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3303	1
6392	765	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	384.4891	0.146911621
6393	765	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1468811	0.04876709
6394	765	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	47.7572327	0.9321251
6395	765	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3302	46
6396	766	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6397	766	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3359	6
6398	766	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	389.988983	0.5434265
6399	766	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.109832764	0.0111694336
6400	766	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	48.8642235	0.0862579346
6401	766	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3358	5
6402	767	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3408	4
6403	767	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	394.889648	0.404632568
6404	767	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.106140137	0.00732421875
6405	767	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	49.84555	0.05970764
6406	767	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3407	3
6407	768	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3455	1
6408	768	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	399.720551	0.176452637
6409	768	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.176422119	0.07745361
6410	768	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	50.7976837	0.9521332
6411	768	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3454	47
6412	769	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3506	2
6413	769	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	404.814117	0.20010376
6414	769	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.01751709	-0.0509338379
6415	769	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	51.8480873	0.0364685059
6416	769	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3505	1
6417	770	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3557	3
6418	770	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	409.984772	0.304779053
6419	770	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09765625	-0.011505127
6420	770	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	52.8662376	0.04153061
6421	770	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3556	2
6422	771	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3610	6
6423	771	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	415.252625	0.5166626
6424	771	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.10244751	0.002380371
6425	771	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	53.91887	0.08290863
6426	771	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3609	5
6427	772	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3653	1
6428	772	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	420.148041	0.395446777
6429	772	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.39541626	0.2970276
6430	772	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	54.8392639	0.9203949
6431	772	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3652	43
6432	773	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6433	773	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3698	1
6434	773	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	425.111877	0.234954834
6435	773	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2348938	0.1126709
6436	773	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	55.85162	1.0123558
6437	773	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3697	45
6438	774	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6439	774	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3747	1
6440	774	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	430.148438	0.157440186
6441	774	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.157409668	0.0573730469
6442	774	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	56.8744621	1.02284241
6443	774	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3746	49
6444	775	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3799	3
6445	775	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	435.371735	0.349700928
6446	775	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0693664551	-0.0314025879
6447	775	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	57.93685	0.05601883
6448	775	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3798	2
6449	776	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3851	5
6450	776	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	440.527039	0.412597656
6451	776	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.01373291	-0.0836181641
6452	776	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	58.9791	0.07978058
6453	776	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3850	4
6454	777	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6455	777	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3901	4
6456	777	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	445.5785	0.4028015
6457	777	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09991455	0.00192260742
6458	777	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	59.9721031	0.0605697632
6459	777	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3900	3
6460	778	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	3952	4
6461	778	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	450.667542	0.4003601
6462	778	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100616455	0.00277709961
6463	778	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	60.9897423	0.0599441528
6464	778	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	3951	3
6465	779	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6466	779	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4004	5
6467	779	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	455.7291	0.41796875
6468	779	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09945679	-0.0135192871
6469	779	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	62.0023651	0.06414032
6470	779	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4003	4
6471	780	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6472	780	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4056	6
6473	780	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	460.89566	0.5262146
6474	780	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.105407715	0.0145874023
6475	780	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	63.03425	0.0839347839
6476	780	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4055	5
6477	781	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4105	4
6478	781	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	465.812	0.399047852
6479	781	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09976196	9.15527344e-05
6480	781	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	64.01887	0.0598297119
6481	781	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4104	3
6482	782	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6483	782	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4155	3
6484	782	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	470.769958	0.300262451
6485	782	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101104736	0.00198364258
6486	782	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	65.0102158	0.0398407
6487	782	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4154	2
6488	783	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4206	4
6489	783	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	475.812561	0.3178711
6490	783	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0197143555	-0.0804443359
6491	783	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	66.03495	0.0595703125
6492	783	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4205	3
6493	784	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6494	784	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4254	1
6495	784	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	480.6996	0.159912109
6496	784	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.159881592	0.0601806641
6497	784	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	66.98438	0.9494324
6498	784	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4253	48
6499	785	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6500	785	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4310	6
6501	785	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	486.189636	0.575531
6502	785	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.13760376	0.038482666
6503	785	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	68.0868149	0.08841705
6504	785	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4309	5
6505	786	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6506	786	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4358	4
6507	786	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	491.171234	0.54486084
6508	786	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09875488	6.10351563e-05
6509	786	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	69.08993	0.0882720947
6510	786	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4357	3
6511	787	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4409	6
6512	787	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	496.214447	0.5404663
6513	787	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101928711	0.0008544922
6514	787	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	70.09894	0.08771515
6515	787	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4408	5
6516	788	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6517	788	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4457	3
6518	788	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	501.116821	0.361419678
6519	788	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0478210449	-0.0528564453
6520	788	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	71.0798	0.0522384644
6521	788	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4456	2
6522	789	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6523	789	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4508	3
6524	789	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	506.158234	0.2989502
6525	789	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100158691	-0.000793457031
6526	789	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	72.08808	0.03980255
6527	789	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4507	2
6528	790	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6529	790	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4558	2
6530	790	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	511.127716	0.201843262
6531	790	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06704712	-0.0295715332
6532	790	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	73.08853	0.0269088745
6533	790	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4557	1
6534	791	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6535	791	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4607	1
6536	791	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	516.108032	0.1552124
6537	791	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1552124	0.0552368164
6538	791	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	74.06696	0.9784317
6539	791	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4606	49
6540	792	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6541	792	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4656	1
6542	792	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	521.198364	0.218505859
6543	792	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.218444824	0.117980957
6544	792	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	75.07223	1.00526428
6545	792	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4655	49
6546	793	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4708	3
6547	793	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	526.4089	0.299865723
6548	793	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1003418	0.00201416016
6549	793	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	76.1380844	0.0398788452
6550	793	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4707	2
6551	794	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4761	6
6552	794	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	531.746948	0.578369141
6553	794	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100708008	0.005859375
6554	794	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	77.20564	0.0955657959
6555	794	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4760	5
6556	795	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4811	6
6557	795	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	536.876831	0.540344238
6558	795	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.111083984	0.0111083984
6559	795	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	78.22948	0.08594513
6560	795	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4810	5
6561	796	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6562	796	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4855	1
6563	796	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	541.5796	0.165649414
6564	796	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.165649414	0.06573486
6565	796	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	79.15917	0.9296951
6566	796	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4854	44
6567	797	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6568	797	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4904	1
6569	797	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	546.5618	0.1328125
6570	797	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1328125	0.0348510742
6571	797	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	80.16222	1.00304413
6572	797	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4903	49
6573	798	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6574	798	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	4956	2
6575	798	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	551.72406	0.199646
6576	798	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0487060547	-0.0490722656
6577	798	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	81.21145	0.030166626
6578	798	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	4955	1
6579	799	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5006	1
6580	799	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	556.7127	0.1453247
6581	799	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1453247	0.0466918945
6582	799	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	82.1899	0.9784546
6583	799	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5005	50
6584	800	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5061	6
6585	800	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	562.218262	0.602661133
6586	800	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.105224609	0.007080078
6587	800	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	83.29901	0.09950256
6588	800	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5060	5
6589	801	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5109	4
6590	801	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	567.0924	0.399230957
6591	801	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0999755859	0.0005493164
6592	801	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	84.27486	0.05986023
6593	801	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5108	3
6594	802	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6595	802	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5157	1
6596	802	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	571.9991	0.220947266
6597	802	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.22088623	0.117919922
6598	802	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	85.23205	0.957191467
6599	802	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5156	48
6600	803	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5207	1
6601	803	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	577.0073	0.1876831
6602	803	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1876831	0.0433959961
6603	803	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	86.23957	1.00752258
6604	803	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5206	50
6605	804	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5257	1
6606	804	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	582.0161	0.135131836
6607	804	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1350708	0.0348510742
6608	804	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	87.252655	1.01308441
6609	804	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5256	50
6610	805	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6611	805	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5308	1
6612	805	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	587.066345	0.138916016
6613	805	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.13885498	0.0390625
6614	805	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	88.26196	1.00930786
6615	805	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5307	51
6616	806	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6617	806	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5362	4
6618	806	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	592.3549	0.3994751
6619	806	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100219727	0.000793457031
6620	806	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	89.32742	0.05983734
6621	806	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5361	3
6622	807	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5412	3
6623	807	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	597.2887	0.300354
6624	807	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101806641	0.00280761719
6625	807	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	90.31389	0.0397186279
6626	807	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5411	2
6627	808	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5460	1
6628	808	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	602.150635	0.1326294
6629	808	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1326294	0.03302002
6630	808	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	91.2801	0.9662094
6631	808	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5459	48
6632	809	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6633	809	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5516	6
6634	809	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	607.6336	0.5536499
6635	809	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101074219	0.003479004
6636	809	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	92.3830261	0.0905303955
6637	809	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5515	5
6638	810	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5566	5
6639	810	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	612.565857	0.4147339
6640	810	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0168457031	-0.08288574
6641	810	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	93.38618	0.0794448853
6642	810	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5565	4
6643	811	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6644	811	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5613	1
6645	811	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	617.351746	0.140075684
6646	811	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.140014648	0.0411376953
6647	811	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	94.31885	0.9326706
6648	811	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5612	47
6649	812	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6650	812	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5667	4
6651	812	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	623.1134	0.8032837
6652	812	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09851074	-0.00170898438
6653	812	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	95.4295654	0.09113312
6654	812	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5666	3
6655	813	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5712	2
6656	813	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	627.909	-346.0534
6657	813	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.111877441	0.007080078
6658	813	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	96.30705	0.00399780273
6659	813	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5711	1
6660	814	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6661	814	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5768	1
6662	814	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	632.8882	0.216552734
6663	814	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2164917	0.13458252
6664	814	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	70	10
6665	814	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	213385.75	6636.203
6666	814	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	41	5
6667	814	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	97.29123	0.984176636
6668	814	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	42	8
6669	814	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	103.920258	59.82427
6670	814	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5767	56
6671	814	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
6672	815	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5828	5
6673	815	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	638.3257	0.543640137
6674	815	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09210205	0.000610351563
6675	815	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	86	2
6676	815	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	51	8
6677	815	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	98.83597	1.09576416
6678	815	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	50	8
6679	815	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	105.054909	0.0901641846
6680	815	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5827	4
6681	815	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6682	817	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6683	817	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5837	5
6684	817	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	686.0837	47.4862061
6685	817	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09979248	0.006225586
6686	817	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	87	1
6687	817	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	98.9480438	0.039100647
6688	817	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	52	2
6689	817	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	105.18734	0.039100647
6690	817	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5836	4
6691	818	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6692	818	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5884	3
6693	818	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	690.9877	0.301513672
6694	818	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101623535	0.001953125
6695	818	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	685.8076	404.6566
6696	818	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	98.96804	0.0199966431
6697	818	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	106.167831	0.0399932861
6698	818	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5883	2
6699	819	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6700	819	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5941	3
6701	819	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	696.1032	0.343322754
6702	819	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0793457	-0.004760742
6703	819	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	99	2
6704	819	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	217561.875	4176.125
6705	819	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	56	5
6706	819	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	99.79821	0.05268097
6707	819	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	57	5
6708	819	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	107.166954	0.05268097
6709	819	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5940	2
6710	819	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6711	821	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6712	821	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5980	5
6713	821	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	702.9223	3.973816
6714	821	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100708008	0.0115356445
6715	821	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	119	20
6716	821	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	65	9
6717	821	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	100.405533	0.0395965576
6718	821	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	66	9
6719	821	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	107.81163	0.0395965576
6720	821	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	5979	4
6721	821	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
6722	822	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6723	822	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6030	4
6724	822	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	707.8995	0.4025879
6725	822	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0994873047	-6.10351563e-05
6726	822	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	702.642	16.8344116
6727	822	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	100.425781	0.0202484131
6728	822	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	108.807419	0.0605316162
6729	822	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6029	3
6730	822	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6731	823	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6732	823	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6077	1
6733	823	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	713.7716	1.24523926
6734	823	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1.24517822	1.14453125
6735	823	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	109.752739	0.9453201
6736	823	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6076	47
6737	824	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6119	3
6738	824	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	719.3797	1.79266357
6739	824	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09832764	-0.00305175781
6740	824	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	110.653358	0.0708847046
6741	824	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6118	2
6742	824	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
6743	825	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6135	1
6744	825	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	727.242249	5.96569824
6745	825	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	5.965637	23.1234741
6746	825	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	121	1
6747	825	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	222727.563	2598.60938
6748	825	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	67	1
6749	825	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	110.870094	0.21673584
6750	825	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6134	16
6751	825	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
6752	826	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6156	6
6753	826	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	729.1902	0.5668335
6754	826	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.10144043	-0.0007324219
6755	826	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	727.306335	24.6643066
6756	826	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	226391.4	1139.07813
6757	826	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	111.259872	0.05609131
6758	826	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6155	5
6759	826	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
6760	829	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6205	1
6761	829	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	733.9718	0.241821289
6762	829	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.241821289	0.141479492
6763	829	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	732.687744	5.38140869
6764	829	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	132	11
6765	829	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	230519.484	4128.078
6766	829	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
6767	829	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	70	5
6768	829	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	101.462914	1.03713226
6769	829	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	72	5
6770	829	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	112.091606	0.8317337
6771	829	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6204	49
6772	830	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6233	2
6773	830	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	736.3183	0.2793579
6774	830	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.192993164	0.112426758
6775	830	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	137	1
6776	830	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	233567.828	87.25
6777	830	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	74	4
6778	830	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	102.562386	0.0334396362
6779	830	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	73	1
6780	830	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	112.533295	0.0334396362
6781	830	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6232	2
6782	830	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6783	831	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6784	831	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6264	3
6785	831	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	739.078857	0.272888184
6786	831	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0914306641	0.00317382813
6787	831	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	146	9
6788	831	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	236524.313	14.953125
6789	831	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	78	4
6790	831	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	103.137543	0.0363388062
6791	831	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	77	4
6792	831	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	112.864967	0.331672668
6793	831	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6263	2
6794	831	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
6795	832	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6796	832	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6317	1
6797	832	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	743.9816	0.125061035
6798	832	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125	0.110351563
6799	832	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	155	9
6800	832	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	239188	2663.6875
6801	832	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	82	4
6802	832	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	104.115173	0.9776306
6803	832	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	81	4
6804	832	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	114.075844	1.21087646
6805	832	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6316	53
6806	834	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6377	3
6807	834	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	749.1506	0.261901855
6808	834	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08886719	-0.0007324219
6809	834	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	162	7
6810	834	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	86	4
6811	834	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	105.204788	0.03466797
6812	834	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	85	4
6813	834	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	115.116837	0.03466797
6814	834	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6376	2
6815	834	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6816	835	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6433	3
6817	835	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	757.807739	3.92504883
6818	835	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.3600464	0.2654419
6819	835	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	166	2
6820	835	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	245366.141	1960.85938
6821	835	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	105.684029	0.148002625
6822	835	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	87	2
6823	835	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	116.096321	0.00799560547
6824	835	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6432	2
6825	835	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
6826	836	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6459	5
6827	836	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	759.873352	0.5293579
6828	836	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08654785	-0.0005493164
6829	836	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	756.3776	23.68988
6830	836	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	175	4
6831	836	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	91	5
6832	836	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	106.146652	0.0882797241
6833	836	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	117.04335	0.880363464
6834	836	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6458	4
6835	838	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6491	5
6836	838	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	766.180237	3.88690186
6837	838	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0180053711	-0.0726318359
6838	838	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	186	11
6839	838	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	96	5
6840	838	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	106.629036	0.482383728
6841	838	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	98	11
6842	838	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	117.523567	0.0445327759
6843	838	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6490	4
6844	839	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6845	839	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6546	3
6846	839	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	771.233	0.354187
6847	839	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08721924	-0.00146484375
6848	839	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	765.958069	9.580444
6849	839	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	213	3
6850	839	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	247421.641	2055.5
6851	839	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	108	12
6852	839	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	107.74453	0.0533752441
6853	839	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	109	2
6854	839	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	118.410271	0.0533752441
6855	839	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6545	2
6856	839	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
6857	840	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6858	840	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6601	1
6859	840	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	776.122	0.139831543
6860	840	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.139648438	0.0723876953
6861	840	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	236	1
6862	840	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	120	12
6863	840	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	108.774193	1.02966309
6864	840	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	118	9
6865	840	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	119.325981	0.915710449
6866	840	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6600	55
6867	843	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6868	843	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6621	6
6869	843	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	790.620239	13.2056274
6870	843	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.198181152	0.111755371
6871	843	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	244	8
6872	843	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	123	3
6873	843	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	109.11422	0.0535202026
6874	843	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	124	6
6875	843	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	119.728645	0.0535202026
6876	843	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6620	5
6877	843	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
6878	844	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6671	1
6879	844	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	795.18335	0.122680664
6880	844	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.122619629	0.0308227539
6881	844	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	790.1736	24.2155151
6882	844	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	267	23
6883	844	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	249211.4	1789.76563
6884	844	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	133	10
6885	844	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	110.003014	0.888793945
6886	844	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	132	8
6887	844	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	120.463768	0.7351227
6888	844	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6670	50
6889	845	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6890	845	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6726	1
6891	845	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	800.2462	0.132385254
6892	845	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.132324219	0.03527832
6893	845	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	281	14
6894	845	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	139	6
6895	845	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	110.976791	0.9737778
6896	845	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	141	9
6897	845	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	121.670662	1.20689392
6898	845	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6725	55
6899	845	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
6900	845	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
6901	846	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6780	1
6902	846	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	805.25354	0.125793457
6903	846	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125732422	0.037902832
6904	846	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	291	10
6905	846	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	249360	148.59375
6906	846	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	142	3
6907	846	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	111.341919	0.365127563
6908	846	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	144	3
6909	846	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	122.642265	0.9716034
6910	846	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6779	54
6911	848	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6912	848	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6832	6
6913	848	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	818.8851	0.483032227
6914	848	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.132446289	-8.999817
6915	848	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	293	2
6916	848	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	252464.6	3104.59375
6917	848	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	145	1
6918	848	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	123.5509	0.06278229
6919	848	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	6831	5
6920	849	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6921	849	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-6832
6922	849	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.7012043	-796.183838
6923	849	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.132446289
6924	849	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-790.1736
6925	849	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-293
6926	849	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
6927	849	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-252464.6
6928	849	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
6929	849	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
6930	849	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
6931	849	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-140
6932	849	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-111.337921
6933	849	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-142
6934	849	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-123.546906
6935	849	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-6831
6936	850	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6937	850	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	87	38
6938	850	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	46.02047	3.29592514
6939	850	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08957672	0.00465393066
6940	850	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-790.1736
6941	850	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16	15
6942	850	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
6943	850	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4689.944	3366.56787
6944	850	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
6945	850	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
6946	850	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
6947	850	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-140
6948	850	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-111.337921
6949	850	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
6950	850	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.50039935	0.6411676
6951	850	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	86	37
6952	850	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6953	851	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
6954	851	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	108	21
6955	851	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	52.48911	6.46863937
6956	851	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07796097	-0.0116157532
6957	851	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.78048	50.78048
6958	851	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24	8
6959	851	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
6960	851	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5243.41	553.4663
6961	851	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
6962	851	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
6963	851	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
6964	851	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
6965	851	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.225674808	0.221674815
6966	851	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
6967	851	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.74477863	0.226406932
6968	851	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	107	20
6969	851	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
6970	852	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
6971	852	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	159	51
6972	852	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	61.05411	8.565002
6973	852	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0924301147	0.0144691467
6974	852	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	56.5554123	5.774933
6975	852	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	53	29
6976	852	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2
6977	852	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6271.18555	1027.77539
6978	852	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
6979	852	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
6980	852	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
6981	852	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	12
6982	852	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.45285094	1.22717619
6983	852	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	1
6984	852	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.97370636	0.212970376
6985	852	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	158	50
6986	852	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
6987	852	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
6988	853	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
6989	853	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
6990	853	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	84.93857	0
6991	853	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0173034668	0
6992	853	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	77.294	0
6993	853	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	53	0
6994	853	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
6995	853	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11307.8223	0
6996	853	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
6997	853	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	0
6998	853	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
6999	853	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	0
7000	853	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.52173615	0
7001	853	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	26	0
7002	853	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.149974	0
7003	853	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
7004	853	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
7005	853	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
7006	853	(GrandpaCount, Statics/DialogueVariables)	1	0
7007	854	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	272	5
7008	854	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	87.78878	0.5465851
7009	854	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09755707	-0.00426483154
7010	854	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15564.8066	4256.98438
7011	854	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.7039423	0.08989143
7012	854	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	271	4
7013	855	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7014	855	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	322	6
7015	855	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	92.81564	0.514442444
7016	855	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0988464355	-0.000343322754
7017	855	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.70884037	0.08285093
7018	855	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	321	5
7019	855	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7020	856	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7021	856	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	333	4
7022	856	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	93.859726	0.329246521
7023	856	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09590149	-0.0006713867
7024	856	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.918351	0.06616306
7025	856	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	332	4
7026	856	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7027	857	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	372	4
7028	857	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	97.69885	0.3055725
7029	857	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.015296936	-0.09379578
7030	857	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.70246029	0.0585627556
7031	857	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	371	3
7032	857	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
7033	858	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7034	858	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	420	1
7035	858	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	102.637131	0.157447815
7036	858	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.157409668	0.05995941
7037	858	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.66168928	0.041929245
7038	858	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	419	2
7039	858	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7040	859	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7041	859	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	476	6
7042	859	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	108.040672	0.5530548
7043	859	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100730896	-0.00198364258
7044	859	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.753646	0.0904665
7045	859	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	475	5
7046	859	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7047	860	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	524	5
7048	860	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	113.037872	0.513305664
7049	860	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103347778	-0.133361816
7050	860	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.752576	0.0820560455
7051	860	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	523	4
7052	860	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
7053	861	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	570	1
7054	861	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	117.684509	0.1257019
7055	861	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.125686646	0.0254974365
7056	861	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.6775179	0.924942
7057	861	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	569	46
7058	862	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7059	862	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	626	6
7060	862	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	123.130661	0.5120239
7061	862	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0983963	-0.00156402588
7062	862	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.7721891	0.0828552246
7063	862	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	625	5
7064	862	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7065	863	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	677	6
7066	863	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	128.221863	0.5217056
7067	863	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09899902	0.004371643
7068	863	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.7901669	0.08442116
7069	863	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	676	5
7070	863	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7071	864	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	724	3
7072	864	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	133.089661	0.3005371
7073	864	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.102142334	0.0046081543
7074	864	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.7632523	0.03966999
7075	864	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	723	2
7076	864	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7077	865	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7078	865	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	775	3
7079	865	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	138.103073	0.296966553
7080	865	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09899902	-0.001373291
7081	865	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.7664948	0.03972721
7082	865	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	774	2
7083	865	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7084	866	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	826	4
7085	866	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	143.236862	0.398300171
7086	866	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100112915	-0.00152587891
7087	866	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.7930441	0.05978775
7088	866	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	825	3
7089	866	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7090	867	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	876	4
7091	867	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	148.308578	0.4023285
7092	867	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09983826	0.0101776123
7093	867	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.8070068	0.0600128174
7094	867	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	875	3
7095	867	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7096	868	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7097	868	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	924	3
7098	868	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	153.21965	0.295593262
7099	868	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09921265	-0.008407593
7100	868	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.7896767	0.0392742157
7101	868	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	923	2
7102	868	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7103	869	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	972	1
7104	869	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	158.071167	0.138336182
7105	869	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.138305664	0.03665161
7106	869	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	18.75217	0.9624939
7107	869	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	971	48
7108	870	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7109	870	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1023	1
7110	870	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	163.1465	0.136978149
7111	870	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.136947632	0.0353393555
7112	870	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	19.7674427	1.01527214
7113	870	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1022	51
7114	871	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7115	871	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1072	1
7116	871	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	168.413879	0.3616333
7117	871	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.361602783	0.25402832
7118	871	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.7759838	1.00854111
7119	871	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1071	49
7120	871	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7121	872	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7122	872	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1130	6
7123	872	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	173.645691	0.5753937
7124	872	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.191299438	0.0104522705
7125	872	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	80	3
7126	872	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16926.91	1362.10352
7127	872	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
7128	872	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	2
7129	872	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.040666	0.103173733
7130	872	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	35	9
7131	872	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	21.8038635	0.0767478943
7132	872	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1129	5
7133	872	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7134	874	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1169	4
7135	874	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	220.291168	43.5060577
7136	874	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101089478	0.00389099121
7137	874	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	97	17
7138	874	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	4
7139	874	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.416484	0.375817776
7140	874	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	45	10
7141	874	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.4797573	0.009748459
7142	874	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1168	3
7143	874	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
7144	875	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7145	875	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1183	3
7146	875	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	246.21106	24.737442
7147	875	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101852417	-0.00537109375
7148	875	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	220.160828	142.866821
7149	875	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.8126945	0.07634735
7150	875	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1182	2
7151	875	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7152	876	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1231	3
7153	876	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	251.236176	0.291534424
7154	876	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0904541	-0.0220947266
7155	876	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.81987	0.0402584076
7156	876	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1230	2
7157	877	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7158	877	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1278	1
7159	877	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	256.176178	0.142456055
7160	877	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.14239502	0.04046631
7161	877	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	24.79754	0.97767067
7162	877	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1277	47
7163	877	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7164	878	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-1332
7165	878	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	14.4863844	-246.6384
7166	878	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.08557129
7167	878	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-220.160828
7168	878	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-97
7169	878	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-19283.957
7170	878	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
7171	878	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
7172	878	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
7173	878	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-38
7174	878	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-6.41248369
7175	878	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-42
7176	878	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-25.8118019
7177	878	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-1332
7178	878	(GrandpaCount, Statics/DialogueVariables)	0	-1
7179	879	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-172
7180	879	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	16.7625141	-33.1918564
7181	879	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.09947586
7182	879	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-38.20815
7183	879	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-12378.74
7184	879	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
7185	879	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-1
7186	879	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-3.649233
7187	879	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-172
7188	880	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	109	21
7189	880	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	71.8904343	1.74012756
7190	880	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0864944458	-0.08161926
7191	880	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	60.77732	60.77732
7192	880	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1085.76147	348.930359
7193	880	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7194	880	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	3
7195	880	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.113118	0.330764532
7196	880	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	108	20
7197	880	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7198	880	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7199	880	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	9
7200	881	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	136	27
7201	881	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	82.4893	10.5988693
7202	881	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08257294	-0.003921509
7203	881	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	79.80332	19.026001
7204	881	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1802.564	716.8025
7205	881	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7206	881	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
7207	881	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.58815479	0.4577918
7208	881	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	135	26
7209	881	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7210	881	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7211	881	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24	9
7212	882	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	197	52
7213	882	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	89.57701	5.32135773
7214	882	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.12739563	-0.115203857
7215	882	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	79.80332	19.026001
7216	882	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1802.564	716.8025
7217	882	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7218	882	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
7219	882	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.94113231	0.3529775
7220	882	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	196	51
7221	882	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7222	882	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7223	882	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	56	23
7224	882	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
7225	882	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	8
7226	882	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.59849334	0.9762984
7227	882	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
7228	883	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
7229	884	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
7230	884	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	107.3936	0
7231	884	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	107.3936	0
7232	884	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06210327	0
7233	884	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06210327	0
7234	884	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	104.492447	0
7235	884	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	104.492447	0
7236	884	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3176.65771	0
7237	884	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3176.65771	0
7238	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
7239	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
7240	884	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	32	0
7241	884	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	32	0
7242	884	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.978865	0
7243	884	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.978865	0
7244	884	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
7245	884	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
7246	884	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
7247	884	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
7248	884	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
7249	884	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
7250	884	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	71	0
7251	884	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	71	0
7252	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
7253	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
7254	884	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	31	0
7255	884	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	31	0
7256	884	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.230464	0
7257	884	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.230464	0
7258	884	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
7259	884	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
7260	884	(GrandpaCount, Statics/DialogueVariables)	1	0
7261	884	(GrandpaCount, Statics/DialogueVariables)	1	0
7262	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	0
7263	884	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	0
7264	885	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7265	886	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7266	886	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	266	2
7267	886	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	266	2
7268	886	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	109.606064	0.1619339
7269	886	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	109.606064	0.1619339
7270	886	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0470275879	0.0341720581
7271	886	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0470275879	0.0341720581
7272	886	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	81	1
7273	886	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	81	1
7274	886	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	5
7275	886	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	5
7276	886	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.66696334	0.0229055882
7277	886	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.66696334	0.0229055882
7278	886	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	37	2
7279	886	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	37	2
7280	886	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.449739	0.160338879
7281	886	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.449739	0.160338879
7282	886	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	265	1
7283	886	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	265	1
7284	886	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7285	886	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7286	887	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7287	888	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7288	888	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	315	1
7289	888	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	315	1
7290	888	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	114.655785	0.190635681
7291	888	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	114.655785	0.190635681
7292	888	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.190605164	0.09111786
7293	888	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.190605164	0.09111786
7294	888	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	113.286736	8.794289
7295	888	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	113.286736	8.794289
7296	888	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	92	11
7297	888	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	92	11
7298	888	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4113.67139	937.0137
7299	888	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4113.67139	937.0137
7300	888	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	4
7301	888	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	4
7302	888	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.06456113	0.3975978
7303	888	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.06456113	0.3975978
7304	888	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	42	5
7305	888	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	42	5
7306	888	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.29906368	0.8493247
7307	888	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.29906368	0.8493247
7308	888	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	314	49
7309	888	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	314	49
7310	888	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7311	888	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7312	888	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
7313	888	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
7314	889	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	355	4
7315	890	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	355	4
7316	890	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	118.506073	0.315307617
7317	890	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	118.506073	0.315307617
7318	890	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100410461	-0.00100708008
7319	890	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100410461	-0.00100708008
7320	890	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.08722258	0.06342268
7321	890	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.08722258	0.06342268
7322	890	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	354	4
7323	890	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	354	4
7324	890	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7325	890	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7326	891	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	365	1
7327	891	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	119.662025	0.1642685
7328	892	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	365	1
7329	892	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.164161682	0.0641098
7330	892	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	119.662025	0.1642685
7331	892	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.30562973	0.218407154
7332	892	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.164161682	0.0641098
7333	892	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	364	10
7334	892	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.30562973	0.218407154
7335	892	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7336	892	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	364	10
7337	892	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7338	893	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7339	894	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7340	894	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	417	2
7341	894	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	417	2
7342	894	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	124.766472	0.198135376
7343	894	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	124.766472	0.198135376
7344	894	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0397644043	-0.0525817871
7345	894	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0397644043	-0.0525817871
7346	894	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.351143	0.0314464569
7347	894	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.351143	0.0314464569
7348	894	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	416	1
7349	894	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	416	1
7350	895	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7351	896	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7352	896	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	458	2
7353	896	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	458	2
7354	896	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	128.7993	0.199066162
7355	896	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	128.7993	0.199066162
7356	896	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0988464355	-0.0006713867
7357	896	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0988464355	-0.0006713867
7358	896	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.146163	0.0399093628
7359	896	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.146163	0.0399093628
7360	896	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	457	2
7361	896	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	457	2
7362	896	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7363	896	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7364	897	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	469	2
7365	898	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	469	2
7366	898	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	129.815384	0.200897217
7367	898	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	129.815384	0.200897217
7368	898	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07975769	-0.021484375
7369	898	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07975769	-0.021484375
7370	898	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.353217	0.0243701935
7371	898	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.353217	0.0243701935
7372	898	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	468	1
7373	898	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	468	1
7374	899	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7375	900	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7376	900	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	521	3
7377	900	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	521	3
7378	900	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	134.987885	0.3007202
7379	900	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	134.987885	0.3007202
7380	900	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.10118103	0.000198364258
7381	900	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.10118103	0.000198364258
7382	900	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.3833866	0.03999138
7383	900	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.3833866	0.03999138
7384	900	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	520	2
7385	900	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	520	2
7386	901	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7387	901	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	546	1
7388	901	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	857.9954	720.6764
7389	901	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	720.6666	720.5673
7390	901	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.8698978	0.48651123
7391	901	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	545	25
7392	901	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7393	902	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7394	902	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	561	1
7395	902	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	864.3213	2.244995
7396	902	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2.244995	2.14648438
7397	902	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	93	1
7398	902	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5366.93457	1253.26318
7399	902	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	43	1
7400	902	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.3284788	0.458580971
7401	902	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	560	15
7402	902	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7403	903	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7404	903	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	587	4
7405	903	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	867.4741	0.360473633
7406	903	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09094238	0.004760742
7407	903	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	94	1
7408	903	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7947.00439	2454.19824
7409	903	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.8153467	0.0539360046
7410	903	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	586	3
7411	904	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7412	904	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	634	1
7413	904	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	872.344	0.176757813
7414	904	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.176696777	0.07305908
7415	904	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	869.9927	756.705933
7416	904	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8917.2	970.1958
7417	904	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.6740713	0.8587246
7418	904	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	633	47
7419	905	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7420	905	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	691	1
7421	905	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	960.7947	83.54645
7422	905	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	83.54639	83.4584961
7423	905	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	96	2
7424	905	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14784.2676	3350.79
7425	905	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	44	1
7426	905	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.6497564	0.9756851
7427	905	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	690	57
7428	906	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7429	906	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.8132792	0.09285641
7430	906	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	697	5
7431	906	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7432	906	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	698	6
7433	906	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	967.346436	0.552368164
7434	906	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08831787	-5.91101074
7435	906	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	966.792969	96.80029
7436	907	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7437	907	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	745	3
7438	907	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	972.053	0.3034668
7439	907	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.104675293	0.00384521484
7440	907	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.7513418	0.0397338867
7441	907	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	744	2
7442	909	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	805	5
7443	909	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	977.2212	0.43951416
7444	909	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07696533	-0.008666992
7445	909	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	98	1
7446	909	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18190.4238	3406.15625
7447	909	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	45	1
7448	909	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.7481279	0.07246494
7449	909	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	804	4
7450	909	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7451	910	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7452	910	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	858	1
7453	910	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	981.979736	0.191345215
7454	910	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.191345215	0.1027832
7455	910	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	105	7
7456	910	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	47	7
7457	910	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.938733	5.874172
7458	910	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	49	4
7459	910	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.6926117	0.944483757
7460	910	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	857	53
7461	911	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7462	911	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	911	3
7463	911	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	987.2353	0.361694336
7464	911	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.121032715	0.02508545
7465	911	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	984.991333	18.1983643
7466	911	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24957.18	6766.756
7467	911	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.6533527	0.0480518341
7468	911	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	910	2
7469	911	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7470	912	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	958	6
7471	912	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	992.4256	0.5100708
7472	912	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.102478027	0.000305175781
7473	912	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	18.6932926	0.08164406
7474	912	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	957	5
7475	913	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7476	913	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1009	6
7477	913	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	997.4934	0.541564941
7478	913	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0999755859	0.000183105469
7479	913	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	19.7073326	0.08835411
7480	913	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1008	5
7481	914	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1022	3
7482	914	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	999.1356	0.534790039
7483	914	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101745605	-0.10369873
7484	914	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.02994	0.122335434
7485	914	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1021	3
7486	915	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1053	3
7487	915	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1002.36859	0.3163452
7488	915	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100036621	0.00677490234
7489	915	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.6769161	0.0433692932
7490	915	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1052	2
7491	916	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1101	1
7492	916	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1007.29242	0.193603516
7493	916	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.19354248	0.09136963
7494	916	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	21.6429539	0.96603775
7495	916	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1100	48
7496	917	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1151	1
7497	917	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1012.34766	0.16015625
7498	917	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.16015625	0.05908203
7499	917	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.6607513	1.01779747
7500	917	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1150	50
7501	918	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7502	918	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1204	3
7503	918	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1017.53455	0.314453125
7504	918	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.115356445	0.01574707
7505	918	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.7070961	0.0398578644
7506	918	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1203	2
7507	919	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7508	919	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1257	5
7509	919	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1022.69678	0.41003418
7510	919	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0121459961	-0.0883789063
7511	919	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	24.7601871	0.0795784
7512	919	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1256	4
7513	920	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7514	920	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1307	4
7515	920	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1027.60583	0.3157959
7516	920	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0167236328	-0.08312988
7517	920	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.74108	0.0598182678
7518	920	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1306	3
7519	921	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1360	6
7520	921	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1032.82092	0.526001
7521	921	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.104125977	0.00537109375
7522	921	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	26.7665558	0.08430481
7523	921	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1359	5
7524	922	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1548	2
7525	922	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1052.7157	0.205322266
7526	922	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0153808594	-0.0847168
7527	922	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	30.74937	0.0378799438
7528	922	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1547	1
7529	923	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1602	2
7530	923	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1058.12732	0.5255127
7531	923	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.230712891	0.213745117
7532	923	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	106	1
7533	923	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	30101.873	5144.69336
7534	923	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	50	1
7535	923	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	31.7361622	0.0588855743
7536	923	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1601	1
7537	923	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7538	924	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-1602
7539	924	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	19.24618	-1038.8811
7540	924	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.230712891
7541	924	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-984.991333
7542	924	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-106
7543	924	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-30101.873
7544	924	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
7545	924	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
7610	928	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	93	4
7546	924	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
7547	924	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-45
7548	924	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-8.934733
7549	924	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-47
7550	924	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-31.7321625
7551	924	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-1601
7552	924	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7553	924	(GrandpaCount, Statics/DialogueVariables)	0	-1
7554	925	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45	4
7555	925	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	116.514839	0.3395691
7556	925	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.083480835	-0.0047454834
7557	925	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	112.720673	112.720673
7558	925	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	16	3
7559	925	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	633.2049	633.2049
7560	925	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7561	925	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
7562	925	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
7563	925	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-45
7564	925	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-8.934733
7565	925	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
7566	925	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.6556373	0.05122018
7567	925	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	44	3
7568	925	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7569	925	(GrandpaCount, Statics/DialogueVariables)	0	-1
7570	925	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7571	926	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	61	16
7572	926	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	118.022545	1.50770569
7573	926	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08483887	0.00135803223
7574	926	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	112.720673	112.720673
7575	926	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26	10
7576	926	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	633.2049	633.2049
7577	926	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7578	926	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
7579	926	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
7580	926	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
7581	926	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.236819983	0.232819989
7582	926	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	4
7583	926	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.9795972	0.3239599
7584	926	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	60	16
7585	926	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7586	926	(GrandpaCount, Statics/DialogueVariables)	0	-1
7587	926	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7588	927	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	108	11
7589	927	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	122.191048	0.953109741
7590	927	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08641815	0.00338745117
7591	927	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	112.720673	112.720673
7592	927	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	51	6
7593	927	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	633.2049	633.2049
7594	927	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7595	927	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
7596	927	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
7597	927	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	2
7598	927	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.05986369	0.173298776
7599	927	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
7600	927	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.2371465	0.2575493
7601	927	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	107	10
7602	927	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7603	927	(GrandpaCount, Statics/DialogueVariables)	0	-1
7604	927	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7605	927	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	-1
7606	928	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	228	8
7607	928	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	168.059677	0.7132721
7608	928	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09161377	0.007507324
7609	928	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	157.254669	44.5339966
7611	928	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3393.03076	2759.826
7612	928	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7613	928	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
7614	928	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
7615	928	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	9
7616	928	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.60635662	0.881270051
7617	928	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	44	1
7618	928	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.94810128	0.12428546
7619	928	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	227	7
7620	928	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7621	928	(GrandpaCount, Statics/DialogueVariables)	1	1
7622	928	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7623	928	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
7624	929	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	242	0
7625	929	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	215.987457	0
7626	929	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.110748291	0
7627	929	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	214.919769	0
7628	929	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	93	0
7629	929	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5355.59033	0
7630	929	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
7631	929	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	0
7632	929	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
7633	929	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	0
7634	929	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.60635662	0
7635	929	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	45	0
7636	929	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.161634	0
7637	929	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	241	0
7638	929	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
7639	929	(GrandpaCount, Statics/DialogueVariables)	1	0
7640	929	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
7641	929	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	0
7642	930	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	280	1
7643	930	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	220.047516	0.2170105
7644	930	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.216964722	0.116973877
7645	930	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.95234776	0.7907138
7646	930	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	279	38
7647	931	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7648	931	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	293	6
7649	931	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	221.125336	0.5298004
7650	931	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.108795166	0.009002686
7651	931	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.18957472	0.104087353
7652	931	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	292	6
7653	932	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7654	932	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	330	1
7655	932	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	225.070587	0.230407715
7656	932	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.2303772	0.127975464
7657	932	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.954063	0.7644882
7658	932	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	329	37
7659	932	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7660	933	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7661	933	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	370	3
7662	933	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	229.023972	0.3026123
7663	933	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0232543945	-0.07296753
7664	933	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.78626537	0.07529068
7665	933	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	369	3
7666	933	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7667	934	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	381	2
7668	934	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	230.121613	0.202392578
7669	934	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0150909424	-0.0843811
7670	934	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.007612	0.037478447
7671	934	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	380	1
7672	934	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7673	935	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7674	935	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	431	1
7675	935	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	235.17627	0.2030487
7676	935	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.202987671	0.102157593
7677	935	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.98086834	0.9732561
7678	935	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	430	50
7679	936	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7680	936	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	483	2
7681	936	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	240.231079	0.19342041
7682	936	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0145263672	-0.09199524
7683	936	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.029595	0.03584671
7684	936	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	482	1
7685	936	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7686	937	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	490	3
7687	937	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	240.8063	0.2582245
7688	937	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.100418091	0.000366210938
7689	937	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.127485	0.05152607
7690	937	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	489	3
7691	937	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7692	938	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7693	938	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	536	3
7694	938	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	245.399216	0.299118042
7695	938	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0998687744	0.00048828125
7696	938	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.046196	0.040017128
7697	938	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	535	2
7698	939	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	586	1
7699	939	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	250.371292	0.169509888
7700	939	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.16947937	0.06889343
7701	939	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.02651	0.980314255
7702	939	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	585	50
7703	940	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7704	940	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	639	3
7705	940	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	255.543991	0.307601929
7706	940	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1026001	0.00218200684
7707	940	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.0745792	0.040968895
7708	940	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	638	2
7709	940	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7710	941	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7711	941	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	691	4
7712	941	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	260.584747	0.312713623
7713	941	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0132141113	-0.08590698
7714	941	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.100585	0.059844017
7715	941	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	690	3
7716	942	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7717	942	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	745	2
7718	942	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	265.528076	0.239257813
7719	942	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0403747559	-0.04486084
7720	942	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	107	1
7721	942	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	10324.9707	4969.38037
7722	942	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	52	5
7723	942	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	13.3421154	0.6357527
7724	942	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	51	6
7725	942	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.1593885	0.03973484
7726	942	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	744	1
7727	942	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7728	944	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	799	7
7729	944	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	273.7477	4.004364
7730	944	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1751709	0.08590698
7731	944	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	138	2
7732	944	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	62	10
7733	944	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.2225056	0.0231161118
7734	944	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	63	12
7735	944	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.0390816	0.0231161118
7736	944	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	798	6
7737	944	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7738	945	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7739	945	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	855	6
7740	945	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	278.436768	0.5154419
7741	945	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0805969238	-0.005279541
7872	957	(letterCounter, ScriptableObjects/Statistics)	3808	374
7742	945	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	273.212524	58.2927551
7743	945	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	164	2
7744	945	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11249.71	924.739258
7745	945	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	75	8
7746	945	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	15.9963255	1.31666279
7747	945	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	74	11
7748	945	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.9734945	0.0646925
7749	945	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	854	5
7750	945	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
7751	946	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7752	946	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	908	1
7753	946	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	283.1929	0.1927185
7754	946	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.192687988	0.101348877
7755	946	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	20505.5781	34.0917969
7756	946	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	16.9253235	0.928998
7757	946	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	907	53
7758	946	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
7759	947	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7760	947	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	967	5
7761	947	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	288.54718	0.461334229
7762	947	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09310913	-0.00509643555
7763	947	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	285.3558	12.14328
7764	947	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22500.4258	3.62695313
7765	947	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	17.9549046	0.0736541748
7766	947	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	966	4
7767	948	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7768	948	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-3
7769	948	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	8.133341	-11.0371609
7770	948	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.117035866
7771	948	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-14.549962
7772	948	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1473.34644
7773	948	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
7774	948	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-1
7775	948	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-0.007999998
7776	948	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-3
7777	949	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7778	949	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	41	40
7779	949	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	14.2931185	4.822381
7780	949	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0721540451	-1.25625992
7781	949	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-14.549962
7782	949	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	656.995	656.995
7783	949	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7784	949	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
7785	949	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.5873824	0.583382368
7786	949	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	40	39
7787	950	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7788	950	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	57	16
7789	950	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	15.6887693	1.39565086
7790	950	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.17212677	0.0999727249
7791	950	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-14.549962
7792	950	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	689.5284	32.5333862
7793	950	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7794	950	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	4
7795	950	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.8616312	0.274248838
7796	950	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	56	16
7797	951	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7798	951	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	140	18
7799	951	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.4586086	1.47337151
7800	951	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08401108	0.007127762
7801	951	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-14.549962
7802	951	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1261.28552	552.9012
7803	951	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
7804	951	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	1
7805	951	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.1433481	0.1970138
7806	951	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	139	17
7807	951	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	45	2
7808	951	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
7809	951	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	1
7810	951	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.55626357	0.2778871
7811	951	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7812	951	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	2
7813	952	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
7814	952	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	247	0
7815	952	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	31.3101215	0
7816	952	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09304428	0
7817	952	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	0
7818	952	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1359.71265	0
7819	952	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
7820	952	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	37	0
7821	952	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.31111145	0
7822	952	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	246	0
7823	952	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	69	0
7824	952	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
7825	952	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	0
7826	952	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.407635	0
7827	952	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	0
7828	952	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	0
7829	952	(GrandpaCount, Statics/DialogueVariables)	1	0
7830	952	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	0
7831	952	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	0	0
7832	954	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7833	954	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	293	5
7834	954	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	35.0836563	0.411899567
7835	954	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07790375	-0.0778198242
7836	954	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	91	2
7837	954	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1378.64587	18.9332275
7838	954	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	47	1
7839	954	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.128152	0.09782076
7840	954	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	45	8
7841	954	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.0065484	0.03115511
7842	954	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	292	5
7843	954	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7844	954	(lineCounter, ScriptableObjects/Statistics)	44	1
7845	954	(wordCounter, ScriptableObjects/Statistics)	641	42
7846	954	(letterCounter, ScriptableObjects/Statistics)	3309	221
7847	955	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7848	955	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	308	1
7849	955	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	36.2387772	0.114017487
7850	955	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.113983154	0.03224945
7851	955	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	98	1
7852	955	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.191347	0.06319523
7853	955	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	51	6
7854	955	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.293157	0.2866087
7855	955	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	307	15
7856	955	(lineCounter, ScriptableObjects/Statistics)	48	4
7857	955	(wordCounter, ScriptableObjects/Statistics)	666	25
7858	955	(letterCounter, ScriptableObjects/Statistics)	3434	125
7859	956	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7860	957	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	369	1
7861	957	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	41.27703	0.194396973
7862	957	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1943779	0.113746643
7863	957	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	123	1
7864	957	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1383.23267	4.586792
7865	957	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	62	15
7866	957	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.428785	1.23743773
7867	957	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	61	10
7868	957	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.278905	0.9857478
7869	957	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	368	61
7870	957	(lineCounter, ScriptableObjects/Statistics)	59	11
7871	957	(wordCounter, ScriptableObjects/Statistics)	734	68
7873	958	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7874	958	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	411	7
7875	958	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	44.519146	0.5506401
7876	958	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.094581604	0.009273529
7877	958	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	139	3
7878	958	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1387.14758	3.914917
7879	958	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	67	5
7880	958	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.89415646	0.4653716
7881	958	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	71	2
7882	958	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.97285271	0.108268738
7883	958	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	410	7
7884	958	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
7885	958	(lineCounter, ScriptableObjects/Statistics)	68	2
7886	958	(wordCounter, ScriptableObjects/Statistics)	853	24
7887	958	(letterCounter, ScriptableObjects/Statistics)	4433	124
7888	959	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7889	959	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	432	1
7890	959	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	46.294754	0.189922333
7891	959	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.189876556	0.09379959
7892	959	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	147	1
7893	959	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1388.76917	1.621582
7894	959	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	75	8
7895	959	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.503901	0.609744549
7896	959	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	74	3
7897	959	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.30891752	0.336064816
7898	959	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	431	21
7899	959	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7900	959	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
7901	959	(lineCounter, ScriptableObjects/Statistics)	72	4
7902	959	(wordCounter, ScriptableObjects/Statistics)	909	56
7903	959	(letterCounter, ScriptableObjects/Statistics)	4715	282
7904	962	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	496	1
7905	962	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	51.3070221	0.110969543
7906	962	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.110939026	0.0253753662
7907	962	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	165	18
7908	962	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1567.57458	178.80542
7909	962	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	81	6
7910	962	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.24958563	0.7456846
7911	962	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	84	10
7912	962	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.359549	1.050631
7913	962	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	495	64
7914	962	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
7915	962	(GrandpaCount, Statics/DialogueVariables)	2	1
7916	962	(lineCounter, ScriptableObjects/Statistics)	81	9
7917	962	(wordCounter, ScriptableObjects/Statistics)	1031	122
7918	962	(letterCounter, ScriptableObjects/Statistics)	5396	681
7919	963	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
7920	963	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	561	5
7921	963	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	56.7533	0.497711182
7922	963	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1634903	0.114044189
7923	963	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	192	2
7924	963	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1604.75867	37.184082
7925	963	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	93	12
7926	963	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.180534	0.930948734
7927	963	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	97	1
7928	963	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.449163	0.06678009
7929	963	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	560	4
7930	963	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
7931	963	(lineCounter, ScriptableObjects/Statistics)	94	1
7932	963	(wordCounter, ScriptableObjects/Statistics)	1214	4
7933	963	(letterCounter, ScriptableObjects/Statistics)	6407	32
7934	965	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	622	6
7935	965	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	61.76353	0.485572815
7936	965	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07975769	-0.007862091
7937	965	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	216	2
7938	965	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1608.002	3.24328613
7939	965	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	108	15
7940	965	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	9.420102	0.08114624
7941	965	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	109	2
7942	965	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.4558659	0.0859642
7943	965	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	621	5
7944	965	(lineCounter, ScriptableObjects/Statistics)	106	1
7945	965	(wordCounter, ScriptableObjects/Statistics)	1374	3
7946	965	(letterCounter, ScriptableObjects/Statistics)	7250	12
7947	967	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	683	5
7948	967	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	66.7880859	0.478721619
7949	967	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0841140747	0.0101318359
7950	967	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	228	1
7951	967	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	116	8
7952	967	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.4049873	0.07893753
7953	967	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	115	6
7954	967	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.26643	0.810564041
7955	967	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	682	4
7956	967	(lineCounter, ScriptableObjects/Statistics)	113	7
7957	967	(wordCounter, ScriptableObjects/Statistics)	1398	24
7958	967	(letterCounter, ScriptableObjects/Statistics)	7364	114
7959	968	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
7960	968	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	702	2
7961	968	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	68.3587646	0.248527527
7962	968	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.164787292	0.07971954
7963	968	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	230	2
7964	968	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	118	2
7965	968	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.7054615	0.0336418152
7966	968	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	119	4
7967	968	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.749464	0.0336418152
7968	968	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	701	2
7969	968	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
7970	968	(lineCounter, ScriptableObjects/Statistics)	116	3
7971	968	(wordCounter, ScriptableObjects/Statistics)	1404	6
7972	968	(letterCounter, ScriptableObjects/Statistics)	7387	23
7973	969	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	735	1
7974	969	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	71.058815	0.07279205
7975	969	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.072769165	-0.009941101
7976	969	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	235	1
7977	969	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	120	2
7978	969	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	11.1339388	0.4284773
7979	969	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	121	2
7980	969	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.3255177	0.0165290833
7981	969	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	734	1
7982	969	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
7983	969	(lineCounter, ScriptableObjects/Statistics)	118	2
7984	969	(wordCounter, ScriptableObjects/Statistics)	1409	5
7985	969	(letterCounter, ScriptableObjects/Statistics)	7418	31
7986	969	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
7987	970	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	740	3
7988	970	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	71.57818	0.3419876
7989	970	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0983505249	0.00373840332
7990	970	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	122	2
7991	970	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	11.3645515	0.0488538742
7992	970	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.4178514	0.0423059464
7993	970	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	739	2
7994	970	(lineCounter, ScriptableObjects/Statistics)	119	1
7995	970	(wordCounter, ScriptableObjects/Statistics)	1412	3
7996	970	(letterCounter, ScriptableObjects/Statistics)	7434	16
7997	970	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
7998	971	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	802	3
7999	971	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	76.5941849	0.246192932
8000	971	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.116958618	0.0146484375
8001	971	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	248	13
8002	971	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1680.76221	67.51257
8003	971	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	129	7
8004	971	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	12.3795977	0.0259971619
8005	971	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	127	6
8006	971	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.2940073	0.876155853
8007	971	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	801	2
8008	971	(lineCounter, ScriptableObjects/Statistics)	126	7
8009	971	(wordCounter, ScriptableObjects/Statistics)	1451	39
8010	971	(letterCounter, ScriptableObjects/Statistics)	7616	182
8011	971	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
8012	973	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	862	1
8013	973	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	81.5502853	0.204422
8014	973	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.204391479	0.13646698
8015	973	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	267	19
8016	973	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2366.13721	4.58667
8017	973	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	135	6
8018	973	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	13.3640471	0.9844494
8019	973	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	134	7
8020	973	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.4396572	1.14564991
8021	973	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	861	60
8022	973	(lineCounter, ScriptableObjects/Statistics)	132	6
8023	973	(wordCounter, ScriptableObjects/Statistics)	1517	66
8024	973	(letterCounter, ScriptableObjects/Statistics)	7930	314
8025	974	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8026	974	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	925	1
8027	974	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	86.64306	0.119606018
8028	974	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.119560242	0.06380463
8029	974	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	290	23
8030	974	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2407.20752	41.0703125
8031	974	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	146	11
8032	974	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.3679743	1.00392723
8033	974	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	143	9
8034	974	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.3585072	0.918849945
8035	974	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	924	63
8036	974	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8037	974	(lineCounter, ScriptableObjects/Statistics)	143	11
8038	974	(wordCounter, ScriptableObjects/Statistics)	1675	158
8039	974	(letterCounter, ScriptableObjects/Statistics)	8722	792
8040	976	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8041	976	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	991	6
8042	976	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	92.11922	0.5689163
8043	976	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07395172	0.0160293579
8044	976	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	304	14
8045	976	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3843.12378	472.1062
8046	976	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	148	2
8047	976	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.6140966	0.24612236
8048	976	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	151	8
8049	976	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.5669346	0.09891319
8050	976	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	990	5
8051	976	(lineCounter, ScriptableObjects/Statistics)	148	5
8052	976	(wordCounter, ScriptableObjects/Statistics)	1720	45
8053	976	(letterCounter, ScriptableObjects/Statistics)	8983	261
8054	977	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8055	977	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1052	5
8056	977	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	97.1412048	0.5208206
8057	977	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1873703	0.103614807
8058	977	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	327	23
8059	977	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4153.14551	140.1123
8060	977	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	159	11
8061	977	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	16.22393	1.60983372
8062	977	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	160	9
8063	977	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.54582	0.06675339
8064	977	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1051	4
8065	977	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
8066	977	(lineCounter, ScriptableObjects/Statistics)	157	9
8067	977	(wordCounter, ScriptableObjects/Statistics)	1785	65
8068	977	(letterCounter, ScriptableObjects/Statistics)	9316	333
8069	978	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	551	7
8070	978	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	147.000275	92.65106
8071	978	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.198684692	-0.327026367
8072	978	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	54.34849	54.34849
8073	978	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	178	15
8074	978	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8152.03662	1706.70215
8075	978	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	82	4
8076	978	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.79950857	0.376577854
8077	978	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	85	8
8078	978	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.093164	0.06304073
8079	978	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	550	6
8080	978	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
8081	978	(lineCounter, ScriptableObjects/Statistics)	82	7
8082	978	(wordCounter, ScriptableObjects/Statistics)	1307	132
8083	978	(letterCounter, ScriptableObjects/Statistics)	6905	725
8084	979	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-551
8085	979	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6.90006733	-140.1002
8086	979	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.198684692
8087	979	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-54.34849
8088	979	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-178
8089	979	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8152.03662
8090	979	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
8091	979	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8092	979	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8093	979	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-80
8094	979	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-7.79550838
8095	979	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-82
8096	979	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-9.089165
8097	979	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-550
8098	979	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
8099	979	(lineCounter, ScriptableObjects/Statistics)	0	-82
8100	979	(wordCounter, ScriptableObjects/Statistics)	0	-1307
8101	979	(letterCounter, ScriptableObjects/Statistics)	0	-6905
8102	980	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	41	40
8103	980	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	12.769783	4.633665
8104	980	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07972622	-1.14879608
8105	980	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-54.34849
8106	980	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	15
8107	980	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8152.03662
8108	980	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8109	980	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8110	980	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8111	980	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-80
8112	980	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-7.79550838
8113	980	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
8114	980	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.579782367	0.575782359
8115	980	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	40	39
8116	980	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
8117	980	(lineCounter, ScriptableObjects/Statistics)	7	6
8118	980	(wordCounter, ScriptableObjects/Statistics)	120	109
8119	980	(letterCounter, ScriptableObjects/Statistics)	640	590
8120	980	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8121	981	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	58	17
8122	981	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	14.2335052	1.46372223
8123	981	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0883626938	0.008636475
8124	981	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-54.34849
8125	981	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	24	9
8126	981	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-8152.03662
8127	981	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8128	981	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8129	981	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8130	981	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
8131	981	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.19968906	0.195689067
8132	981	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	4
8133	981	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.889247	0.309464633
8134	981	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	57	17
8135	981	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8136	981	(lineCounter, ScriptableObjects/Statistics)	11	4
8137	981	(wordCounter, ScriptableObjects/Statistics)	180	60
8138	981	(letterCounter, ScriptableObjects/Statistics)	974	334
8139	981	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8140	982	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	120	22
8141	982	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	21.43568	1.79435158
8142	982	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0791721344	-0.005344391
8143	982	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	16.43778	16.43778
8144	982	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	47	12
8145	982	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1763.89539	293.722046
8146	982	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8147	982	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8148	982	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8149	982	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	6
8150	982	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.17584407	0.343205929
8151	982	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
8152	982	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.08884823	0.1315071
8153	982	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	119	21
8154	982	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8155	982	(lineCounter, ScriptableObjects/Statistics)	16	3
8156	982	(wordCounter, ScriptableObjects/Statistics)	298	66
8157	982	(letterCounter, ScriptableObjects/Statistics)	1562	323
8158	982	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8159	982	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
8160	982	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
8161	983	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	181	23
8162	983	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	26.5671368	1.89750671
8163	983	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08362961	-0.08065605
8164	983	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	16.43778	16.43778
8165	983	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	83	13
8166	983	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1763.89539	293.722046
8167	983	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8168	983	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8169	983	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8170	983	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	33	5
8171	983	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.209387	0.374547
8172	983	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	32	5
8173	983	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.91445041	0.363845348
8174	983	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	180	22
8175	983	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8176	983	(lineCounter, ScriptableObjects/Statistics)	30	5
8177	983	(wordCounter, ScriptableObjects/Statistics)	649	104
8178	983	(letterCounter, ScriptableObjects/Statistics)	3357	555
8179	983	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8180	983	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
8181	983	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
8182	984	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	248	0
8183	984	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	32.022007	0
8184	984	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08263588	0
8185	984	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	16.43778	0
8186	984	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	112	0
8187	984	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1763.89539	0
8188	984	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8189	984	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	0
8190	984	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8191	984	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	43	0
8192	984	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.98514152	0
8193	984	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	47	0
8194	984	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.003989	0
8195	984	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	247	0
8196	984	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
8197	984	(lineCounter, ScriptableObjects/Statistics)	44	0
8198	984	(wordCounter, ScriptableObjects/Statistics)	776	0
8199	984	(letterCounter, ScriptableObjects/Statistics)	4033	0
8200	984	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
8201	984	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
8202	984	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	0
8203	986	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8204	986	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	284	4
8205	986	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	35.1272621	0.413478851
8206	986	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0847396851	0.00194168091
8207	986	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	126	2
8208	986	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	53	10
8209	986	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.96557713	0.06577802
8210	986	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	54	2
8211	986	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.6259594	0.0657782555
8212	986	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	283	3
8213	986	(lineCounter, ScriptableObjects/Statistics)	51	1
8214	986	(wordCounter, ScriptableObjects/Statistics)	858	19
8215	986	(letterCounter, ScriptableObjects/Statistics)	4484	89
8216	987	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8217	987	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	291	2
8218	987	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	35.7019844	0.246372223
8219	987	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07883453	-0.00202560425
8220	987	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	130	2
8221	987	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	56	1
8222	987	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.08183432	0.04962492
8223	987	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.7085495	0.0162343979
8224	987	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	290	2
8225	987	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8226	987	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
8227	987	(lineCounter, ScriptableObjects/Statistics)	53	1
8228	987	(wordCounter, ScriptableObjects/Statistics)	898	24
8229	987	(letterCounter, ScriptableObjects/Statistics)	4690	131
8230	989	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	349	5
8231	989	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	40.3387032	0.496177673
8232	989	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07910919	0.0100402832
8233	989	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	153	2
8234	989	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	65	9
8235	989	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.968834	0.0342254639
8236	989	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	67	1
8237	989	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.687179	0.0834732056
8238	989	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	348	4
8239	989	(lineCounter, ScriptableObjects/Statistics)	64	1
8240	989	(wordCounter, ScriptableObjects/Statistics)	1052	17
8241	989	(letterCounter, ScriptableObjects/Statistics)	5491	91
8242	992	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	386	1
8243	992	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	43.22165	0.08106995
8244	992	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08104324	0.004398346
8245	992	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	166	1
8246	992	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
8247	992	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	70	5
8248	992	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.441045	0.472210884
8249	992	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	73	6
8250	992	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.24021864	0.0153675079
8251	992	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	385	1
8252	992	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8253	992	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
8254	992	(lineCounter, ScriptableObjects/Statistics)	70	6
8255	992	(wordCounter, ScriptableObjects/Statistics)	1107	55
8256	992	(letterCounter, ScriptableObjects/Statistics)	5812	321
8257	993	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	410	4
8258	993	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45.3326378	0.4375229
8259	993	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.185646057	0.109443665
8260	993	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	175	2
8261	993	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	76	6
8262	993	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.146465	0.0503716469
8263	993	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	77	4
8264	993	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.6471467	0.0503716469
8265	993	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	409	3
8266	993	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	1	1
8267	993	(lineCounter, ScriptableObjects/Statistics)	74	4
8268	993	(wordCounter, ScriptableObjects/Statistics)	1139	32
8269	993	(letterCounter, ScriptableObjects/Statistics)	5986	174
8270	995	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	469	3
8271	995	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.1855354	0.2422638
8272	995	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09547806	-0.00661849976
8273	995	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	203	1
8274	995	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	91	1
8275	995	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.140642	0.0295972824
8276	995	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	87	10
8277	995	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.48206854	0.834921837
8278	995	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	468	2
8279	995	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8280	995	(lineCounter, ScriptableObjects/Statistics)	88	1
8281	995	(wordCounter, ScriptableObjects/Statistics)	1369	15
8282	995	(letterCounter, ScriptableObjects/Statistics)	7226	79
8283	997	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8284	997	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	528	1
8285	997	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	55.09913	0.0903587341
8286	997	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09033966	-0.0821723938
8287	997	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	233	30
8288	997	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	104	13
8289	997	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.140018	0.9993763
8290	997	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	103	16
8291	997	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.660525	1.17845678
8292	997	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	527	59
8293	997	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8294	997	(lineCounter, ScriptableObjects/Statistics)	101	13
8295	997	(wordCounter, ScriptableObjects/Statistics)	1491	122
8296	997	(letterCounter, ScriptableObjects/Statistics)	7862	636
8297	998	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	594	5
8298	998	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	60.5105438	0.5048027
8299	998	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0940132141	0.008903503
8300	998	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	264	3
8301	998	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	119	2
8302	998	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	9.262543	0.08218098
8303	998	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	118	15
8304	998	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.71957	0.0705575943
8305	998	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	593	4
8306	998	(lineCounter, ScriptableObjects/Statistics)	116	1
8307	998	(wordCounter, ScriptableObjects/Statistics)	1577	27
8308	998	(letterCounter, ScriptableObjects/Statistics)	8270	128
8309	998	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	1	1
8310	999	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8311	999	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	608	3
8312	999	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	61.6576653	0.324455261
8313	999	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.163082123	0.0803146362
8314	999	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	270	2
8315	999	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	121	2
8316	999	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	9.47813	0.048822403
8317	999	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	122	4
8318	999	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.973299	0.048822403
8319	999	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	607	3
8320	999	(lineCounter, ScriptableObjects/Statistics)	119	3
8321	999	(wordCounter, ScriptableObjects/Statistics)	1635	58
8322	999	(letterCounter, ScriptableObjects/Statistics)	8578	308
8323	1002	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	642	6
8324	1002	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	64.38027	0.496059418
8325	1002	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07442474	0.00426864624
8326	1002	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	279	3
8327	1002	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	127	1
8328	1002	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.039012	0.09847736
8329	1002	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	124	2
8330	1002	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.2745752	0.3012762
8331	1002	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	641	6
8332	1002	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
8333	1002	(lineCounter, ScriptableObjects/Statistics)	124	1
8334	1002	(wordCounter, ScriptableObjects/Statistics)	1794	30
8335	1002	(letterCounter, ScriptableObjects/Statistics)	9426	154
8336	1003	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	654	3
8337	1003	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	65.40087	0.271820068
8338	1003	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103683472	0.0145339966
8339	1003	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	287	2
8340	1003	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.12191	0.08289814
8341	1003	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	130	1
8342	1003	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	10.7500114	0.0336513519
8343	1003	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	653	2
8344	1003	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
8345	1003	(lineCounter, ScriptableObjects/Statistics)	127	1
8346	1003	(wordCounter, ScriptableObjects/Statistics)	1821	10
8347	1003	(letterCounter, ScriptableObjects/Statistics)	9561	52
8348	1003	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
8349	1004	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	712	1
8350	1004	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	70.2726746	0.116333008
8351	1004	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.116317749	0.0262985229
8352	1004	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	318	1
8353	1004	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	142	15
8354	1004	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	11.2555027	1.13359261
8355	1004	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	143	13
8356	1004	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.72379	0.9737787
8357	1004	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	711	58
8358	1004	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8359	1004	(lineCounter, ScriptableObjects/Statistics)	140	13
8360	1004	(wordCounter, ScriptableObjects/Statistics)	1979	158
8361	1004	(letterCounter, ScriptableObjects/Statistics)	10361	800
8362	1006	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8363	1006	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-712
8364	1006	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	8.23492	-62.0377541
8365	1006	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.116317749
8366	1006	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-16.43778
8367	1006	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-318
8368	1006	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
8369	1006	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1763.89539
8370	1006	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
8371	1006	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8372	1006	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8373	1006	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-140
8374	1006	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-11.251503
8375	1006	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-140
8376	1006	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-11.71979
8377	1006	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-711
8378	1006	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8379	1007	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8380	1007	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	85	23
8381	1007	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	17.8984566	1.79738617
8382	1007	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08119202	0.00193405151
8383	1007	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-16.43778
8384	1007	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	5
8385	1007	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
8386	1007	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1504.96924	1504.96924
8387	1007	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8388	1007	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8389	1007	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8390	1007	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-140
8391	1007	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-11.251503
8392	1007	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	2
8393	1007	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.28661644	0.3432653
8394	1007	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	84	22
8395	1007	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8396	1007	(lineCounter, ScriptableObjects/Statistics)	7	2
8397	1007	(wordCounter, ScriptableObjects/Statistics)	120	43
8398	1007	(letterCounter, ScriptableObjects/Statistics)	640	232
8399	1008	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8400	1008	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	120	35
8401	1008	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	20.7769165	2.87846
8402	1008	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08213234	0.0009403229
8403	1008	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-16.43778
8404	1008	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	8
8405	1008	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
8406	1008	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1504.96924	1504.96924
8407	1008	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8408	1008	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8409	1008	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8410	1008	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
8411	1008	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.3660128	0.3620128
8412	1008	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	4
8413	1008	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.87577486	0.5891584
8414	1008	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	119	35
8415	1008	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8416	1008	(lineCounter, ScriptableObjects/Statistics)	11	4
8417	1008	(wordCounter, ScriptableObjects/Statistics)	180	60
8418	1008	(letterCounter, ScriptableObjects/Statistics)	974	334
8419	1009	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8420	1009	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	209	24
8421	1009	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	28.1726341	1.99265289
8422	1009	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08551407	0.0349597931
8423	1009	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-16.43778
8424	1009	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	36	4
8425	1009	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-1
8426	1009	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3395.69043	1127.38428
8427	1009	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8428	1009	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
8429	1009	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8430	1009	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	6
8431	1009	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.93805254	0.3814429
8432	1009	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	1
8433	1009	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.2064662	0.2470845
8434	1009	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	208	23
8435	1009	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8436	1009	(lineCounter, ScriptableObjects/Statistics)	16	4
8437	1009	(wordCounter, ScriptableObjects/Statistics)	298	86
8438	1009	(letterCounter, ScriptableObjects/Statistics)	1562	431
8439	1009	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
8440	1010	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
8441	1010	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	0
8442	1010	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	31.5846977	0
8443	1010	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.164625168	0
8444	1010	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	0
8445	1010	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	49	0
8446	1010	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
8447	1010	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3395.69043	0
8448	1010	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8449	1010	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	0
8450	1010	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8451	1010	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	26	0
8452	1010	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.60556841	0
8453	1010	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	21	0
8454	1010	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.65873456	0
8455	1010	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	0
8456	1010	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	0
8457	1010	(lineCounter, ScriptableObjects/Statistics)	23	0
8458	1010	(wordCounter, ScriptableObjects/Statistics)	500	0
8459	1010	(letterCounter, ScriptableObjects/Statistics)	2569	0
8460	1010	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	0
8461	1012	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	307	1
8462	1012	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	36.41266	0.105701447
8463	1012	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.105678558	0.03055954
8464	1012	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	70	21
8465	1012	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	10
8466	1012	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.512353	0.906784534
8467	1012	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	37	16
8468	1012	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.08030462	1.42157006
8469	1012	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	306	58
8470	1012	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8471	1012	(lineCounter, ScriptableObjects/Statistics)	34	11
8472	1012	(wordCounter, ScriptableObjects/Statistics)	721	221
8473	1012	(letterCounter, ScriptableObjects/Statistics)	3746	1177
8474	1013	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8475	1013	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	335	1
8476	1013	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	38.7286263	0.07219696
8477	1013	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0721817	-0.009635925
8478	1013	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	71	1
8479	1013	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	38	1
8480	1013	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.550141	0.0164208412
8481	1013	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	334	1
8482	1013	(lineCounter, ScriptableObjects/Statistics)	35	1
8483	1013	(wordCounter, ScriptableObjects/Statistics)	726	5
8484	1013	(letterCounter, ScriptableObjects/Statistics)	3763	17
8485	1014	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	373	7
8486	1014	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	41.9094925	0.572189331
8487	1014	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07386398	0.0621452332
8488	1014	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	82	11
8489	1014	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	43	7
8490	1014	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.673041	0.0299243927
8491	1014	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	44	6
8492	1014	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.190592	0.0996418
8493	1014	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	372	6
8494	1014	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8495	1014	(lineCounter, ScriptableObjects/Statistics)	41	6
8496	1014	(wordCounter, ScriptableObjects/Statistics)	769	43
8497	1014	(letterCounter, ScriptableObjects/Statistics)	3997	234
8498	1015	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-378
8499	1015	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6.80642462	-35.96962
8500	1015	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.517944336
8501	1015	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-42.7737846
8502	1015	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-82
8503	1015	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-7789.229
8504	1015	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
8505	1015	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8506	1015	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-41
8507	1015	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-4.66904068
8508	1015	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-41
8509	1015	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-6.275059
8510	1015	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-378
8511	1015	(lineCounter, ScriptableObjects/Statistics)	0	-41
8512	1015	(wordCounter, ScriptableObjects/Statistics)	0	-769
8513	1015	(letterCounter, ScriptableObjects/Statistics)	0	-3997
8514	1016	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	76	5
8515	1016	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	25.18636	0.465732574
8516	1016	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0804958344	0.002670288
8517	1016	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	11.2844906	11.2844906
8518	1016	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	1
8519	1016	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6302.619	3249.62769
8520	1016	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8521	1016	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8522	1016	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-41
8523	1016	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-4.66904068
8524	1016	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
8525	1016	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.08917391	0.0770431757
8526	1016	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	75	4
8527	1016	(lineCounter, ScriptableObjects/Statistics)	7	6
8528	1016	(wordCounter, ScriptableObjects/Statistics)	120	109
8529	1016	(letterCounter, ScriptableObjects/Statistics)	640	590
8530	1016	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8531	1016	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8532	1017	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	146	13
8533	1017	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	30.7761669	1.04161644
8534	1017	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09720039	0.01300621
8535	1017	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	11.2844906	11.2844906
8536	1017	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	3
8537	1017	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6302.619	3249.62769
8538	1017	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8539	1017	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8540	1017	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
8541	1017	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.6802454	0.110966206
8542	1017	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
8543	1017	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.76311827	1.24788618
8544	1017	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	145	12
8545	1017	(lineCounter, ScriptableObjects/Statistics)	11	1
8546	1017	(wordCounter, ScriptableObjects/Statistics)	180	5
8547	1017	(letterCounter, ScriptableObjects/Statistics)	974	23
8548	1017	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8549	1017	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
8550	1018	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	0
8551	1019	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	0
8552	1019	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39.77574	0
8553	1019	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39.77574	0
8554	1019	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0784301758	0
8555	1019	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0784301758	0
8556	1019	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	37.0896873	0
8557	1019	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	37.0896873	0
8558	1019	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31	0
8559	1019	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31	0
8560	1019	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14995.7109	0
8561	1019	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14995.7109	0
8562	1019	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8563	1019	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8564	1019	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8565	1019	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8566	1019	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	0
8567	1019	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	0
8568	1019	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.4028306	0
8569	1019	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.4028306	0
8570	1019	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	0
8571	1019	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	0
8572	1019	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.16180968	0
8573	1019	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.16180968	0
8574	1019	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	0
8575	1019	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	0
8576	1019	(lineCounter, ScriptableObjects/Statistics)	16	0
8577	1019	(lineCounter, ScriptableObjects/Statistics)	16	0
8578	1019	(wordCounter, ScriptableObjects/Statistics)	298	0
8579	1019	(wordCounter, ScriptableObjects/Statistics)	298	0
8580	1019	(letterCounter, ScriptableObjects/Statistics)	1562	0
8581	1019	(letterCounter, ScriptableObjects/Statistics)	1562	0
8582	1019	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
8583	1019	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
8584	1019	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
8585	1019	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	0
8586	1019	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
8587	1019	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
8588	1020	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8589	1021	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8590	1021	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.51436353	0.0958371162
8591	1021	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.51436353	0.0958371162
8592	1021	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	254	5
8593	1021	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	254	5
8594	1022	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8595	1023	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8596	1023	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	312	1
8597	1023	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	312	1
8598	1023	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	44.8741531	0.09737396
8599	1023	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	44.8741531	0.09737396
8600	1023	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09734726	0.0192604065
8601	1023	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09734726	0.0192604065
8602	1023	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39	8
8603	1023	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	39	8
8604	1023	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	23	4
8605	1023	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	23	4
8606	1023	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.41876554	0.904402
8607	1023	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.41876554	0.904402
8608	1023	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	311	57
8609	1023	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	311	57
8610	1023	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	1
8611	1023	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	1
8612	1023	(lineCounter, ScriptableObjects/Statistics)	20	4
8613	1023	(lineCounter, ScriptableObjects/Statistics)	20	4
8614	1023	(wordCounter, ScriptableObjects/Statistics)	323	25
8615	1023	(wordCounter, ScriptableObjects/Statistics)	323	25
8616	1023	(letterCounter, ScriptableObjects/Statistics)	1683	121
8617	1023	(letterCounter, ScriptableObjects/Statistics)	1683	121
8618	1024	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8619	1025	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8620	1025	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	326	1
8621	1025	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	326	1
8622	1025	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45.9861832	0.08175659
8623	1025	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45.9861832	0.08175659
8624	1025	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08174133	-0.003479004
8625	1025	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08174133	-0.003479004
8626	1025	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41	2
8627	1025	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41	2
8628	1025	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	24	1
8629	1025	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	24	1
8630	1025	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.64427	0.01701951
8631	1025	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.64427	0.01701951
8632	1025	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	325	1
8633	1025	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	325	1
8634	1025	(lineCounter, ScriptableObjects/Statistics)	21	1
8635	1025	(lineCounter, ScriptableObjects/Statistics)	21	1
8636	1025	(wordCounter, ScriptableObjects/Statistics)	337	14
8637	1025	(wordCounter, ScriptableObjects/Statistics)	337	14
8638	1025	(letterCounter, ScriptableObjects/Statistics)	1746	63
8639	1025	(letterCounter, ScriptableObjects/Statistics)	1746	63
8640	1027	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8641	1028	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8642	1028	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	376	6
8643	1028	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	376	6
8644	1028	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.38814	0.580322266
8645	1028	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.38814	0.580322266
8646	1028	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0815391541	0.009502411
8647	1028	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0815391541	0.009502411
8648	1028	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	44	3
8649	1028	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	44	3
8650	1028	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18544.6641	101.009766
8651	1028	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18544.6641	101.009766
8652	1028	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	1
8653	1028	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	1
8654	1028	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.965029	0.320759058
8655	1028	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.965029	0.320759058
8656	1028	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	26	10
8657	1028	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	26	10
8658	1028	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.99407053	0.09974146
8659	1028	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.99407053	0.09974146
8660	1028	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	375	5
8661	1028	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	375	5
8662	1028	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
8663	1028	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
8664	1028	(GrandpaCount, Statics/DialogueVariables)	1	1
8665	1028	(GrandpaCount, Statics/DialogueVariables)	1	1
8666	1028	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-2
8667	1028	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-2
8668	1028	(lineCounter, ScriptableObjects/Statistics)	23	2
8669	1028	(lineCounter, ScriptableObjects/Statistics)	23	2
8670	1028	(wordCounter, ScriptableObjects/Statistics)	348	11
8671	1028	(wordCounter, ScriptableObjects/Statistics)	348	11
8672	1028	(letterCounter, ScriptableObjects/Statistics)	1814	68
8673	1028	(letterCounter, ScriptableObjects/Statistics)	1814	68
8674	1029	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8675	1029	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	393	5
8676	1029	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	132.456924	80.71169
8677	1029	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.173583984	-0.3189888
8678	1029	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	51.74471	14.6550217
8679	1029	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23047.7754	3472.56055
8680	1029	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.20125628	0.0139927864
8681	1029	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	392	4
8682	1029	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
8683	1030	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-393
8684	1030	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6.47509861	-125.981827
8685	1030	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.173583984
8686	1030	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-51.74471
8687	1030	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-44
8688	1030	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-23047.7754
8689	1030	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
8690	1030	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8691	1030	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-23
8692	1030	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-3.961029
8693	1030	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-23
8694	1030	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-6.197256
8695	1030	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-392
8696	1030	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8697	1030	(GrandpaCount, Statics/DialogueVariables)	0	-1
8698	1030	(lineCounter, ScriptableObjects/Statistics)	0	-23
8699	1030	(wordCounter, ScriptableObjects/Statistics)	0	-348
8700	1030	(letterCounter, ScriptableObjects/Statistics)	0	-1814
8701	1031	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50	7
8702	1031	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	20.3513527	0.6153755
8703	1031	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07935524	0.0029964447
8704	1031	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	11.52651	11.52651
8705	1031	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	4
8706	1031	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6965.297	2815.816
8707	1031	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8708	1031	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8709	1031	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-23
8710	1031	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-3.961029
8711	1031	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	1
8712	1031	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.6716294	0.10723561
8713	1031	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	49	6
8714	1031	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8715	1031	(GrandpaCount, Statics/DialogueVariables)	0	-1
8716	1031	(lineCounter, ScriptableObjects/Statistics)	7	1
8717	1031	(wordCounter, ScriptableObjects/Statistics)	120	23
8718	1031	(letterCounter, ScriptableObjects/Statistics)	640	109
8719	1031	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8720	1032	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	96	19
8721	1032	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	27.64961	4.69212151
8722	1032	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07918739	-0.3942318
8723	1032	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.9570656	11.4305553
8724	1032	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	22	5
8725	1032	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13845.5674	3087.1377
8726	1032	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8727	1032	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8728	1032	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	1
8729	1032	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.616132259	0.23501721
8730	1032	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
8731	1032	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.43294871	0.6198985
8732	1032	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	95	18
8733	1032	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8734	1032	(GrandpaCount, Statics/DialogueVariables)	0	-1
8735	1032	(lineCounter, ScriptableObjects/Statistics)	11	2
8736	1032	(wordCounter, ScriptableObjects/Statistics)	180	26
8737	1032	(letterCounter, ScriptableObjects/Statistics)	974	139
8738	1032	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8739	1033	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	185	61
8740	1033	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	34.76545	4.91271
8741	1033	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07711792	0.00165176392
8742	1033	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.9570656	11.4305553
8743	1033	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	41	14
8744	1033	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17403.6113	2471.14648
8745	1033	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8746	1033	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8747	1033	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	2
8748	1033	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.060074	0.967105269
8749	1033	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
8750	1033	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.68058515	0.247636437
8751	1033	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	184	60
8752	1033	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8753	1033	(GrandpaCount, Statics/DialogueVariables)	0	-1
8754	1033	(lineCounter, ScriptableObjects/Statistics)	16	2
8755	1033	(wordCounter, ScriptableObjects/Statistics)	298	62
8756	1033	(letterCounter, ScriptableObjects/Statistics)	1562	302
8757	1033	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8758	1034	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	248	62
8759	1034	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39.86845	5.01614761
8760	1034	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.04335022	-0.04347992
8761	1034	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.9570656	11.4305553
8762	1034	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	75	33
8763	1034	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17403.6113	2471.14648
8764	1034	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8765	1034	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8766	1034	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	33	14
8767	1034	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.11737847	1.02455211
8768	1034	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	32	12
8769	1034	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.83552933	0.9935024
8770	1034	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	247	61
8771	1034	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8772	1034	(GrandpaCount, Statics/DialogueVariables)	0	-1
8773	1034	(lineCounter, ScriptableObjects/Statistics)	30	13
8774	1034	(wordCounter, ScriptableObjects/Statistics)	649	316
8775	1034	(letterCounter, ScriptableObjects/Statistics)	3357	1610
8776	1034	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8777	1034	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	1
8778	1035	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	0
8779	1035	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39.9490967	0
8780	1035	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08061218	0
8781	1035	(_pausedTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	22.9570656	0
8782	1035	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	75	0
8783	1035	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17403.6113	0
8784	1035	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8785	1035	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8786	1035	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	33	0
8787	1035	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.12602663	0
8788	1035	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	34	0
8789	1035	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.87012148	0
8790	1035	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	0
8791	1035	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	0
8792	1035	(GrandpaCount, Statics/DialogueVariables)	0	0
8793	1035	(lineCounter, ScriptableObjects/Statistics)	31	0
8794	1035	(wordCounter, ScriptableObjects/Statistics)	658	0
8795	1035	(letterCounter, ScriptableObjects/Statistics)	3404	0
8796	1035	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
8797	1035	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	0
8798	1036	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8799	1036	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.22853255	0.08642459
8800	1036	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.96857929	0.08237648
8801	1036	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	253	4
8802	1036	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
8803	1037	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8804	1037	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	302	3
8805	1037	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	44.24677	0.249382019
8806	1037	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.101833344	0.02021408
8807	1037	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	102	1
8808	1037	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	43	10
8809	1037	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.84033585	0.6118033
8810	1037	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	46	1
8811	1037	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.713614	0.0459618568
8812	1037	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	301	3
8813	1037	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8814	1037	(lineCounter, ScriptableObjects/Statistics)	43	1
8815	1037	(wordCounter, ScriptableObjects/Statistics)	771	1
8816	1037	(letterCounter, ScriptableObjects/Statistics)	4001	1
8817	1038	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8818	1038	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	316	4
8819	1038	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45.3838272	0.344562531
8820	1038	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09446335	0.0103187561
8821	1038	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	109	2
8822	1038	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	50	1
8823	1038	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.942444	0.05000925
8824	1038	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	315	3
8825	1038	(lineCounter, ScriptableObjects/Statistics)	47	1
8826	1038	(wordCounter, ScriptableObjects/Statistics)	806	9
8827	1038	(letterCounter, ScriptableObjects/Statistics)	4201	54
8828	1040	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	378	3
8829	1040	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.32592	0.241130829
8830	1040	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0875663757	0.0152168274
8831	1040	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	139	2
8832	1040	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	56	13
8833	1040	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.79543257	0.9550967
8834	1040	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	63	13
8835	1040	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.8891077	0.030725956
8836	1040	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	377	2
8837	1040	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
8838	1040	(lineCounter, ScriptableObjects/Statistics)	60	13
8839	1040	(wordCounter, ScriptableObjects/Statistics)	944	138
8840	1040	(letterCounter, ScriptableObjects/Statistics)	4938	737
8841	1044	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8842	1044	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	442	6
8843	1044	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	55.6624756	0.5260544
8844	1044	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.184448242	0.09794235
8845	1044	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	166	3
8846	1044	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
8847	1044	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	76	2
8848	1044	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.756154	0.089764595
8849	1044	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	75	12
8850	1044	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.94566774	0.06833267
8851	1044	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	441	5
8852	1044	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8853	1044	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	0	-1
8854	1044	(lineCounter, ScriptableObjects/Statistics)	73	1
8855	1044	(wordCounter, ScriptableObjects/Statistics)	1130	15
8856	1044	(letterCounter, ScriptableObjects/Statistics)	5936	79
8857	1045	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8858	1045	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	454	3
8859	1045	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	56.6849442	0.247810364
8860	1045	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0764122	-0.09816742
8861	1045	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	171	2
8862	1045	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	78	2
8863	1045	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.98481369	0.06925869
8864	1045	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	79	2
8865	1045	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.15153027	0.0490875244
8866	1045	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	453	3
8867	1045	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
8868	1045	(lineCounter, ScriptableObjects/Statistics)	76	1
8869	1045	(wordCounter, ScriptableObjects/Statistics)	1188	13
8870	1045	(letterCounter, ScriptableObjects/Statistics)	6244	64
8871	1047	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8872	1047	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	501	5
8873	1047	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	60.53342	0.339744568
8874	1047	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08175659	0.0188713074
8875	1047	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	188	1
8876	1047	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	88	2
8877	1047	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	7.7664175	0.0488581657
8878	1047	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	87	8
8879	1047	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.920676	0.05155468
8880	1047	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	500	4
8881	1047	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
8882	1047	(lineCounter, ScriptableObjects/Statistics)	85	1
8883	1047	(wordCounter, ScriptableObjects/Statistics)	1334	7
8884	1047	(letterCounter, ScriptableObjects/Statistics)	7042	32
8885	1048	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	561	3
8886	1048	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	65.5084152	0.242584229
8887	1048	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0905456543	0.009895325
8888	1048	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	197	9
8889	1048	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	91	3
8890	1048	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.16978	0.403362274
8891	1048	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	92	5
8892	1048	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.990047	0.03050232
8893	1048	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	560	2
8894	1048	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
8895	1048	(lineCounter, ScriptableObjects/Statistics)	89	4
8896	1048	(wordCounter, ScriptableObjects/Statistics)	1391	57
8897	1048	(letterCounter, ScriptableObjects/Statistics)	7336	294
8898	1049	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-186
8899	1049	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	6.46203947	-18.5996456
8900	1049	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.173091888
8901	1049	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-84
8902	1049	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-3149.687
8903	1049	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
8904	1049	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8905	1049	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-31
8906	1049	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-2.27761841
8907	1049	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-31
8908	1049	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-3.00721
8909	1049	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-186
8910	1049	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8911	1049	(lineCounter, ScriptableObjects/Statistics)	0	-31
8912	1049	(wordCounter, ScriptableObjects/Statistics)	0	-658
8913	1049	(letterCounter, ScriptableObjects/Statistics)	0	-3404
8914	1050	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39	38
8915	1050	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	12.3315191	4.65348339
8916	1050	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08034897	-1.12664175
8917	1050	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	18	18
8918	1050	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134.079758	134.079758
8919	1050	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8920	1050	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
8921	1050	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-31
8922	1050	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-2.27761841
8923	1050	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
8924	1050	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.572757244	0.568757236
8925	1050	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	38	37
8926	1050	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8927	1050	(lineCounter, ScriptableObjects/Statistics)	7	6
8928	1050	(wordCounter, ScriptableObjects/Statistics)	120	109
8929	1050	(letterCounter, ScriptableObjects/Statistics)	640	590
8930	1050	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
8931	1051	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	74	12
8932	1051	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	15.149332	0.9755306
8933	1051	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0852584839	0.00607681274
8934	1051	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	2
8935	1051	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134.079758	134.079758
8936	1051	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8937	1051	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8938	1051	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	11
8939	1051	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.371255159	0.0470691323
8940	1051	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	4
8941	1051	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.14872813	0.178092778
8942	1051	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	73	11
8943	1051	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
8944	1051	(lineCounter, ScriptableObjects/Statistics)	11	4
8945	1051	(wordCounter, ScriptableObjects/Statistics)	180	60
8947	1051	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8948	1052	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	120	46
8949	1052	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	18.9004688	3.75113678
8950	1052	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07799339	-0.007265091
8951	1052	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	57	30
8952	1052	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134.079758	134.079758
8953	1052	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8954	1052	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8955	1052	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	12
8956	1052	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	1.23047245	0.8592173
8957	1052	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
8958	1052	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.36558771	0.216859579
8959	1052	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	119	46
8960	1052	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
8961	1052	(lineCounter, ScriptableObjects/Statistics)	22	11
8962	1052	(wordCounter, ScriptableObjects/Statistics)	339	159
8963	1052	(letterCounter, ScriptableObjects/Statistics)	1759	785
8964	1052	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8965	1053	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	202	20
8966	1053	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	25.813879	1.58045959
8967	1053	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0740203857	-0.0153388977
8968	1053	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	102	9
8969	1053	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134.079758	134.079758
8970	1053	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
8971	1053	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
8972	1053	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	40	15
8973	1053	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.41029668	0.06613326
8974	1053	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	44	5
8975	1053	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.240292	0.3646171
8976	1053	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	201	19
8977	1053	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
8978	1053	(lineCounter, ScriptableObjects/Statistics)	41	4
8979	1053	(wordCounter, ScriptableObjects/Statistics)	573	45
8980	1053	(letterCounter, ScriptableObjects/Statistics)	2941	249
8981	1053	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
8982	1053	(GrandpaCount, Statics/DialogueVariables)	1	1
8983	1053	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
8984	1053	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	99999
8985	1053	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	1	1
8986	1054	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	249	0
8987	1054	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	29.74074	0
8988	1054	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.176687241	0
8989	1054	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	113	0
8990	1054	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	137.323044	0
8991	1054	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
8992	1054	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
8993	1054	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	47	0
8994	1054	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.27246666	0
8995	1054	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	50	0
8996	1054	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.02581453	0
8997	1054	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	248	0
8998	1054	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
8999	1054	(lineCounter, ScriptableObjects/Statistics)	47	0
9000	1054	(wordCounter, ScriptableObjects/Statistics)	656	0
9001	1054	(letterCounter, ScriptableObjects/Statistics)	3375	0
9002	1054	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	0
9003	1054	(GrandpaCount, Statics/DialogueVariables)	1	0
9004	1054	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	0
9005	1054	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	99999	0
9006	1054	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	1	0
9007	1055	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9008	1055	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	291	3
9009	1055	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	33.19579	0.330596924
9010	1055	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.166172028	0.08267975
9011	1055	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	125	1
9012	1055	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	154.459015	17.1359711
9013	1055	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	54	7
9014	1055	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.023357	0.750890255
9015	1055	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	56	6
9016	1055	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	4.705614	0.0495653152
9017	1055	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	290	3
9018	1055	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9019	1055	(lineCounter, ScriptableObjects/Statistics)	53	6
9020	1055	(wordCounter, ScriptableObjects/Statistics)	694	38
9021	1055	(letterCounter, ScriptableObjects/Statistics)	3584	209
9022	1056	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9023	1056	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	311	6
9024	1056	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	34.8379173	0.578846
9025	1056	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0846405	0.02003479
9026	1056	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134	1
9027	1056	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	61	1
9028	1056	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.050265	0.09877062
9029	1056	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	310	5
9030	1056	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9031	1056	(lineCounter, ScriptableObjects/Statistics)	58	1
9032	1056	(wordCounter, ScriptableObjects/Statistics)	730	9
9033	1056	(letterCounter, ScriptableObjects/Statistics)	3785	54
9034	1058	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	373	5
9035	1058	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	39.80423	0.47385025
9036	1058	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07997131	0.00289917
9037	1058	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	142	1
9038	1058	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	64	10
9039	1058	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.457936	0.07863188
9040	1058	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	63	2
9041	1058	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.760786	0.7105212
9042	1058	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	372	4
9043	1058	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9044	1058	(lineCounter, ScriptableObjects/Statistics)	61	3
9045	1058	(wordCounter, ScriptableObjects/Statistics)	763	33
9046	1058	(letterCounter, ScriptableObjects/Statistics)	3979	194
9047	1059	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9048	1059	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	388	2
9049	1059	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	40.9206161	0.155956268
9050	1059	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09685898	0.0220375061
9051	1059	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	143	1
9052	1059	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.52339363	0.06545782
9053	1059	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	65	2
9054	1059	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.27035666	0.0270032883
9055	1059	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	387	2
9056	1059	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
9057	1059	(lineCounter, ScriptableObjects/Statistics)	62	1
9058	1059	(wordCounter, ScriptableObjects/Statistics)	782	19
9059	1059	(letterCounter, ScriptableObjects/Statistics)	4068	89
9060	1060	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9061	1060	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	436	4
9062	1060	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	44.7908	0.384983063
9063	1060	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0541687	-0.0222892761
9064	1060	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	147	1
9065	1060	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	67	3
9066	1060	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.49053144	0.06606197
9067	1060	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.4295373	0.159180641
9068	1060	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	435	3
9069	1060	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9070	1060	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
9071	1060	(lineCounter, ScriptableObjects/Statistics)	64	2
9072	1060	(wordCounter, ScriptableObjects/Statistics)	822	40
9073	1060	(letterCounter, ScriptableObjects/Statistics)	4274	206
9074	1061	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	500	3
9075	1061	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	49.6503868	0.2342987
9076	1061	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.086063385	0.0217857361
9077	1061	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	159	1
9078	1061	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.58304739	0.0925159454
9079	1061	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	74	1
9080	1061	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.95247746	0.029671669
9081	1061	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	499	2
9082	1061	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
9083	1061	(lineCounter, ScriptableObjects/Statistics)	71	1
9084	1061	(wordCounter, ScriptableObjects/Statistics)	868	4
9085	1061	(letterCounter, ScriptableObjects/Statistics)	4522	23
9086	1063	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9087	1063	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	563	3
9088	1063	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	54.6843147	0.228916168
9089	1063	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08620834	0.0139160156
9090	1063	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	168	9
9091	1063	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	76	9
9092	1063	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	8.471348	1.88830042
9093	1063	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	78	4
9094	1063	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.981759	0.0286540985
9095	1063	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	562	2
9096	1063	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9097	1063	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
9098	1063	(lineCounter, ScriptableObjects/Statistics)	75	4
9099	1063	(wordCounter, ScriptableObjects/Statistics)	976	108
9100	1063	(letterCounter, ScriptableObjects/Statistics)	5075	553
9101	1064	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	626	2
9102	1064	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	59.65236	0.160438538
9103	1064	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.04543686	0.007091522
9104	1064	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	174	6
9105	1064	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1179.18152	1024.72253
9106	1064	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	81	5
9107	1064	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	9.767263	0.02298832
9108	1064	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	80	2
9109	1064	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.732397	0.750638
9110	1064	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	625	1
9111	1064	(lineCounter, ScriptableObjects/Statistics)	78	3
9112	1064	(wordCounter, ScriptableObjects/Statistics)	1020	44
9113	1064	(letterCounter, ScriptableObjects/Statistics)	5331	256
9114	1066	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9115	1066	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	694	7
9116	1066	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	65.13594	0.5602188
9117	1066	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07733154	0.0139541626
9118	1066	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	194	4
9119	1066	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2296.301	1117.11951
9120	1066	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	86	5
9121	1066	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.6794491	0.912185669
9122	1066	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	90	1
9123	1066	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.0967588	0.09642887
9124	1066	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	693	6
9125	1066	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
9126	1066	(lineCounter, ScriptableObjects/Statistics)	87	1
9127	1066	(wordCounter, ScriptableObjects/Statistics)	1242	9
9128	1066	(letterCounter, ScriptableObjects/Statistics)	6503	55
9129	1068	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	750	1
9130	1068	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	69.8239	0.214195251
9131	1068	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.214149475	0.151802063
9132	1068	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	221	1
9133	1068	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	102	16
9134	1068	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	11.7263441	1.046895
9135	1068	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	103	13
9136	1068	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.9943161	0.897557259
9137	1068	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	749	56
9138	1068	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9139	1068	(lineCounter, ScriptableObjects/Statistics)	100	13
9140	1068	(wordCounter, ScriptableObjects/Statistics)	1427	185
9141	1068	(letterCounter, ScriptableObjects/Statistics)	7503	1000
9142	1070	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9143	1070	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	811	1
9144	1070	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	74.84175	0.134674072
9145	1070	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.134643555	0.0761871338
9146	1070	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	249	1
9147	1070	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	116	2
9148	1070	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	12.7859325	0.07591915
9149	1070	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	115	12
9150	1070	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.0173626	0.06154251
9151	1070	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	810	4
9152	1070	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9153	1070	(lineCounter, ScriptableObjects/Statistics)	113	1
9154	1070	(wordCounter, ScriptableObjects/Statistics)	1465	2
9155	1070	(letterCounter, ScriptableObjects/Statistics)	7687	15
9156	1070	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	1	1
9157	1071	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	875	3
9158	1071	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	80.01049	0.239242554
9159	1071	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0793151855	-0.00157928467
9160	1071	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	275	1
9161	1071	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	129	13
9162	1071	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	13.81366	0.0319986343
9163	1071	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	126	11
9164	1071	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.0119343	0.9945717
9165	1071	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	874	2
9166	1071	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
9167	1071	(lineCounter, ScriptableObjects/Statistics)	126	13
9168	1071	(wordCounter, ScriptableObjects/Statistics)	1593	128
9169	1071	(letterCounter, ScriptableObjects/Statistics)	8331	644
9170	1071	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	1	1
9171	1073	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	917	6
9172	1073	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	83.6530151	0.507614136
9173	1073	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0792007446	-0.00625610352
9174	1073	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	295	3
9175	1073	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	135	6
9176	1073	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.4269094	0.6132498
9177	1073	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	138	2
9178	1073	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.9943047	0.102663994
9179	1073	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	916	6
9180	1073	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9181	1073	(GrandpaCount, Statics/DialogueVariables)	2	1
9182	1073	(lineCounter, ScriptableObjects/Statistics)	135	2
9183	1073	(wordCounter, ScriptableObjects/Statistics)	1780	5
9184	1073	(letterCounter, ScriptableObjects/Statistics)	9304	25
9185	1073	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
9186	1074	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9187	1074	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	936	5
9188	1074	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	85.26514	0.440109253
9189	1074	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.182945251	0.10382843
9190	1074	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	302	2
9191	1074	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	141	6
9192	1074	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.8659925	0.0513792038
9193	1074	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	140	2
9194	1074	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.258337	0.0513792038
9195	1074	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	935	4
9196	1074	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9197	1074	(variantID, Game/Scene/CharacterDisplay/Grandpa(Clone)/LipAnimator)	0	-1
9198	1074	(lineCounter, ScriptableObjects/Statistics)	138	3
9199	1074	(wordCounter, ScriptableObjects/Statistics)	1790	10
9200	1074	(letterCounter, ScriptableObjects/Statistics)	9368	64
9201	1075	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9202	1075	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	993	1
9203	1075	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	89.99802	0.103317261
9204	1075	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103294373	0.0164031982
9205	1075	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	324	22
9206	1075	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	147	6
9207	1075	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	15.442728	0.5767355
9208	1075	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	150	10
9209	1075	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.2021561	0.943819046
9210	1075	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	992	57
9211	1075	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9212	1075	(lineCounter, ScriptableObjects/Statistics)	147	9
9213	1075	(wordCounter, ScriptableObjects/Statistics)	1939	149
9214	1075	(letterCounter, ScriptableObjects/Statistics)	10148	780
9215	1076	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-993
9216	1076	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	7.59758854	-82.40043
9217	1076	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0	-0.103294373
9218	1076	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-324
9219	1076	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	-2296.301
9220	1076	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	0	-99999
9221	1076	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
9222	1076	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
9223	1076	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-145
9224	1076	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-15.4387283
9225	1076	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	3	-147
9226	1076	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.00399999833	-16.1981564
9227	1076	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	0	-992
9228	1076	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9229	1076	(GrandpaCount, Statics/DialogueVariables)	0	-2
9230	1077	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	56	55
9231	1077	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	15.0367823	6.146079
9232	1077	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08002186	-1.20405769
9233	1077	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	15
9234	1077	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	248.200912	248.200912
9235	1077	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
9236	1077	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
9237	1077	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	0	-99999
9238	1077	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	2	-145
9239	1077	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.00399999833	-15.4387283
9240	1077	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	10	6
9241	1077	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	0.836040735	0.8320407
9242	1077	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	55	54
9243	1077	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9244	1077	(GrandpaCount, Statics/DialogueVariables)	0	-2
9245	1077	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9246	1077	(lineCounter, ScriptableObjects/Statistics)	7	6
9247	1077	(wordCounter, ScriptableObjects/Statistics)	120	109
9248	1077	(letterCounter, ScriptableObjects/Statistics)	640	590
9249	1078	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	84	23
9250	1078	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	17.502243	2.06104088
9251	1078	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07832146	-0.004681587
9252	1078	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26	7
9253	1078	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	248.200912	248.200912
9254	1078	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
9255	1078	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
9256	1078	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
9257	1078	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	13	1
9258	1078	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	0.433358848	0.3965536
9259	1078	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	14	3
9260	1078	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	1.34812486	0.41525507
9261	1078	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	83	22
9262	1078	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9263	1078	(GrandpaCount, Statics/DialogueVariables)	0	-2
9264	1078	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9265	1078	(lineCounter, ScriptableObjects/Statistics)	11	2
9266	1078	(wordCounter, ScriptableObjects/Statistics)	180	26
9267	1078	(letterCounter, ScriptableObjects/Statistics)	974	139
9268	1079	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	216	34
9269	1079	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	28.4309063	2.83412933
9270	1079	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0847759247	-0.00507926941
9271	1079	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	35	2
9272	1079	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1927.38208	665.536865
9273	1079	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	99999
9274	1079	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	-99999
9275	1079	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	99999
9276	1079	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	19	6
9277	1079	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	2.61044765	0.549778
9278	1079	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	16	2
9279	1079	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	2.12160373	0.14835
9280	1079	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	215	33
9281	1079	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9282	1079	(GrandpaCount, Statics/DialogueVariables)	0	-2
9283	1079	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9284	1079	(lineCounter, ScriptableObjects/Statistics)	16	3
9285	1079	(wordCounter, ScriptableObjects/Statistics)	298	66
9286	1079	(letterCounter, ScriptableObjects/Statistics)	1562	323
9287	1079	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
9288	1080	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	250	0
9289	1080	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	31.32776	0
9290	1080	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0957107544	0
9291	1080	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	48	0
9292	1080	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1927.38208	0
9293	1080	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleLeft/Background/Text/TextAnimator_TMP)	99999	0
9294	1080	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleSFX/Background/Text/TextAnimator_TMP)	0	0
9295	1080	(tmpMaxVisibleCharacters, Game/Canvas/DialogueDisplay/SpeechBubbleRight/Background/Text/TextAnimator_TMP)	99999	0
9296	1080	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	25	0
9297	1080	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	3.19772315	0
9298	1080	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	21	0
9299	1080	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	3.92931414	0
9300	1080	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	249	0
9301	1080	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	0
9302	1080	(GrandpaCount, Statics/DialogueVariables)	0	0
9303	1080	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	0
9304	1080	(lineCounter, ScriptableObjects/Statistics)	22	0
9305	1080	(wordCounter, ScriptableObjects/Statistics)	479	0
9306	1080	(letterCounter, ScriptableObjects/Statistics)	2478	0
9307	1080	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	0
9308	1082	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9309	1082	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	305	1
9310	1082	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	35.78866	0.09569931
9311	1082	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.09567642	0.08790207
9312	1082	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	73	25
9313	1082	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	36	11
9314	1082	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	4.067245	0.869521856
9315	1082	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	37	16
9316	1082	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.095212	1.16589785
9317	1082	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	304	55
9318	1082	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9319	1082	(lineCounter, ScriptableObjects/Statistics)	34	12
9320	1082	(wordCounter, ScriptableObjects/Statistics)	721	242
9321	1082	(letterCounter, ScriptableObjects/Statistics)	3746	1268
9322	1083	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9323	1083	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	311	5
9324	1083	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	36.35813	0.5082092
9325	1083	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0905952454	0.0293464661
9326	1083	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	5.210115	0.09579563
9327	1083	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	310	5
9328	1084	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	367	1
9329	1084	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	40.8704529	0.113300323
9330	1084	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.113277435	0.0312957764
9331	1084	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	88	1
9332	1084	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	43	7
9333	1084	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.03769159	0.9704466
9334	1084	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	45	8
9335	1084	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	6.155557	0.9454422
9336	1084	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	366	56
9337	1084	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9338	1084	(lineCounter, ScriptableObjects/Statistics)	42	8
9339	1084	(wordCounter, ScriptableObjects/Statistics)	770	49
9340	1084	(letterCounter, ScriptableObjects/Statistics)	4000	254
9341	1086	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	429	1
9342	1086	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	45.9251137	0.104255676
9343	1086	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1042366	0.0266151428
9344	1086	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	100	12
9345	1086	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	51	8
9346	1086	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	5.880804	0.843112469
9347	1086	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	52	7
9348	1086	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	7.1882925	1.03273535
9349	1086	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	428	62
9350	1086	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
9351	1086	(lineCounter, ScriptableObjects/Statistics)	49	7
9352	1086	(wordCounter, ScriptableObjects/Statistics)	814	44
9353	1086	(letterCounter, ScriptableObjects/Statistics)	4258	258
9354	1087	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	484	1
9355	1087	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.3614044	0.08366394
9356	1087	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08364105	0.0193328857
9357	1087	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	109	9
9358	1087	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	56	5
9359	1087	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	6.911327	1.03052282
9360	1087	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	57	5
9361	1087	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.142756	0.0129995346
9362	1087	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	483	1
9363	1087	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	1	1
9364	1087	(lineCounter, ScriptableObjects/Statistics)	54	5
9365	1087	(wordCounter, ScriptableObjects/Statistics)	904	90
9366	1087	(letterCounter, ScriptableObjects/Statistics)	4721	463
9367	1088	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9368	1088	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	492	1
9369	1088	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	50.9413528	0.082775116
9370	1088	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08275604	0.0696373
9371	1088	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	110	1
9372	1088	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	8.258897	0.116140366
9373	1088	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	491	8
9374	1088	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9375	1089	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	561	6
9376	1089	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	56.4421463	0.554046631
9377	1089	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0869407654	0.0104751587
9378	1089	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	117	1
9379	1089	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	61	4
9380	1089	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.358111	0.09339714
9381	1089	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	560	5
9382	1089	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9383	1089	(lineCounter, ScriptableObjects/Statistics)	58	4
9384	1089	(wordCounter, ScriptableObjects/Statistics)	938	34
9385	1089	(letterCounter, ScriptableObjects/Statistics)	4902	181
9386	1090	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9387	1090	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	624	6
9388	1090	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	61.4423	0.5478592
9389	1090	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0793876648	-0.00266265869
9390	1090	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	123	6
9391	1090	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1933.86865	6.48657227
9392	1090	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	65	9
9393	1090	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	9.259148	0.09370613
9394	1090	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	63	2
9395	1090	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	9.850698	0.4925871
9396	1090	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	623	5
9397	1090	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
9398	1090	(lineCounter, ScriptableObjects/Statistics)	62	4
9399	1090	(wordCounter, ScriptableObjects/Statistics)	1010	72
9400	1090	(letterCounter, ScriptableObjects/Statistics)	5249	347
9401	1092	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	686	5
9402	1092	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	66.42583	0.458763123
9403	1092	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.05797577	-0.0235137939
9404	1092	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	134	1
9405	1092	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2314.44214	380.5735
9406	1092	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	70	5
9407	1092	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	10.29984	0.080163
9408	1092	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	69	6
9409	1092	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	11.4184122	0.0465602875
9410	1092	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	685	4
9411	1092	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9412	1092	(lineCounter, ScriptableObjects/Statistics)	67	5
9413	1092	(wordCounter, ScriptableObjects/Statistics)	1096	86
9414	1092	(letterCounter, ScriptableObjects/Statistics)	5747	498
9415	1094	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9416	1094	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	746	4
9417	1094	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	71.36743	0.407432556
9418	1094	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.161346436	0.08115387
9419	1094	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	136	1
9420	1094	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3980.34888	838.637451
9421	1094	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	11.1207342	0.820894241
9422	1094	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	71	2
9423	1094	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	12.4329548	0.0492172241
9424	1094	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	745	3
9425	1094	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9426	1094	(variantID, Game/Scene/CharacterDisplay/Shrimp(Clone)/LipAnimator)	0	-1
9427	1094	(lineCounter, ScriptableObjects/Statistics)	68	1
9428	1094	(wordCounter, ScriptableObjects/Statistics)	1120	24
9429	1094	(letterCounter, ScriptableObjects/Statistics)	5875	128
9430	1096	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	809	6
9431	1096	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	76.5475	0.52108
9432	1096	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.176277161	0.09761047
9433	1096	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	166	3
9434	1096	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3981.97046	1.621582
9435	1096	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	85	2
9436	1096	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	12.2632761	0.0515728
9437	1096	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	84	13
9438	1096	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	13.4880419	0.06889629
9439	1096	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	808	5
9440	1096	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9441	1096	(lineCounter, ScriptableObjects/Statistics)	82	1
9442	1096	(wordCounter, ScriptableObjects/Statistics)	1376	7
9443	1096	(letterCounter, ScriptableObjects/Statistics)	7245	32
9444	1098	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9445	1098	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	865	1
9446	1098	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	81.17937	0.105926514
9447	1098	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.105903625	0.01953125
9448	1098	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	184	18
9449	1098	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	93	8
9450	1098	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	13.0230227	0.759746552
9451	1098	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	95	11
9452	1098	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	14.4694557	0.981413841
9453	1098	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	864	56
9454	1098	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9455	1098	(lineCounter, ScriptableObjects/Statistics)	92	10
9456	1098	(wordCounter, ScriptableObjects/Statistics)	1516	140
9457	1098	(letterCounter, ScriptableObjects/Statistics)	7984	739
9458	1099	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9459	1099	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	902	2
9460	1099	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	84.37792	0.2550888
9461	1099	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.166610718	0.08483887
9462	1099	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	190	1
9463	1099	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	98	2
9464	1099	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	13.8452625	0.158110619
9465	1099	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	97	2
9466	1099	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.1167393	0.0339269638
9467	1099	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	901	2
9468	1099	(lineCounter, ScriptableObjects/Statistics)	95	1
9469	1099	(wordCounter, ScriptableObjects/Statistics)	1530	1
9470	1099	(letterCounter, ScriptableObjects/Statistics)	8057	3
9471	1099	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	1	1
9472	1100	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	926	3
9473	1100	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	86.40615	0.331520081
9474	1100	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.164726257	0.081703186
9475	1100	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	194	1
9476	1100	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	14.3036051	0.220499992
9477	1100	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	100	3
9478	1100	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	15.5458508	0.0333538055
9479	1100	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	925	2
9480	1100	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9481	1100	(lineCounter, ScriptableObjects/Statistics)	98	1
9482	1100	(wordCounter, ScriptableObjects/Statistics)	1533	1
9483	1100	(letterCounter, ScriptableObjects/Statistics)	8065	3
9484	1101	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	986	3
9485	1101	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	91.43297	0.340614319
9486	1101	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1631012	0.08126831
9487	1101	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	202	1
9488	1101	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	107	2
9489	1101	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	15.3329487	0.115221977
9490	1101	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	106	6
9491	1101	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.6044121	0.0354061127
9492	1101	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	985	2
9493	1101	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9494	1101	(lineCounter, ScriptableObjects/Statistics)	104	1
9495	1101	(wordCounter, ScriptableObjects/Statistics)	1547	3
9496	1101	(letterCounter, ScriptableObjects/Statistics)	8135	16
9497	1102	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9498	1102	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1000	3
9499	1102	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	92.5193253	0.170402527
9500	1102	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08480072	0.002281189
9501	1102	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	203	1
9502	1102	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	15.5164213	0.183472633
9503	1102	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	108	2
9504	1102	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	16.8522434	0.03362465
9505	1102	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	999	3
9506	1102	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9507	1102	(lineCounter, ScriptableObjects/Statistics)	105	1
9508	1102	(wordCounter, ScriptableObjects/Statistics)	1552	5
9509	1102	(letterCounter, ScriptableObjects/Statistics)	8158	23
9510	1103	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9511	1103	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1043	1
9512	1103	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	96.22562	0.183792114
9513	1103	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.183769226	0.103866577
9514	1103	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	209	6
9515	1103	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	110	3
9516	1103	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	16.3149662	0.7985449
9517	1103	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	111	3
9518	1103	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.58616	0.733917236
9519	1103	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1042	43
9520	1103	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9521	1103	(lineCounter, ScriptableObjects/Statistics)	108	3
9522	1103	(wordCounter, ScriptableObjects/Statistics)	1569	17
9523	1103	(letterCounter, ScriptableObjects/Statistics)	8237	79
9524	1103	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
9525	1104	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1110	6
9526	1104	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	101.708237	0.557479858
9527	1104	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.169807434	0.105270386
9528	1104	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	216	7
9529	1104	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5642.916	815.4043
9530	1104	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	114	4
9531	1104	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	17.45267	0.07755852
9532	1104	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	112	1
9533	1104	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	17.988554	0.402393341
9534	1104	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1109	5
9535	1104	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9536	1104	(lineCounter, ScriptableObjects/Statistics)	111	3
9537	1104	(wordCounter, ScriptableObjects/Statistics)	1586	17
9538	1104	(letterCounter, ScriptableObjects/Statistics)	8317	80
9539	1104	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
9540	1106	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1165	1
9541	1106	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	106.704109	0.495933533
9542	1106	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.495918274	0.3303299
9543	1106	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	230	14
9544	1106	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	120	6
9545	1106	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	18.3689079	0.9162388
9546	1106	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	119	7
9547	1106	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	19.6418953	1.65334129
9548	1106	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1164	55
9549	1106	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	-1
9550	1106	(lineCounter, ScriptableObjects/Statistics)	117	6
9551	1106	(wordCounter, ScriptableObjects/Statistics)	1652	66
9552	1106	(letterCounter, ScriptableObjects/Statistics)	8631	314
9553	1106	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	1	1
9554	1107	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1219	1
9555	1107	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	111.336349	0.103912354
9556	1107	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.103889465	0.0197143555
9557	1107	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	247	1
9558	1107	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	127	7
9559	1107	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	19.1214523	0.7525444
9560	1107	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	126	7
9561	1107	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	20.4872761	0.8453808
9562	1107	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1218	54
9563	1107	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9564	1107	(lineCounter, ScriptableObjects/Statistics)	124	7
9565	1107	(wordCounter, ScriptableObjects/Statistics)	1702	50
9566	1107	(letterCounter, ScriptableObjects/Statistics)	8894	263
9567	1108	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1282	4
9568	1108	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	116.655121	0.40738678
9569	1108	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0850296	0.07621765
9570	1108	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	256	9
9571	1108	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	131	4
9572	1108	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	20.07306	0.95160675
9573	1108	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	132	6
9574	1108	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	21.7795277	0.06444359
9575	1108	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1281	3
9576	1108	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9577	1108	(lineCounter, ScriptableObjects/Statistics)	129	5
9578	1108	(wordCounter, ScriptableObjects/Statistics)	1817	115
9579	1108	(letterCounter, ScriptableObjects/Statistics)	9469	575
9580	1109	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1339	1
9581	1109	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	121.36969	0.11089325
9582	1109	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.110877991	0.0285263062
9583	1109	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	259	3
9584	1109	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	133	2
9585	1109	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	20.9577217	0.8846626
9586	1109	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	134	2
9587	1109	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	22.7189522	0.9394245
9588	1109	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1338	57
9589	1109	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9590	1109	(lineCounter, ScriptableObjects/Statistics)	131	2
9591	1109	(wordCounter, ScriptableObjects/Statistics)	1842	25
9592	1109	(letterCounter, ScriptableObjects/Statistics)	9596	127
9593	1109	(variantID, Game/Scene/CharacterDisplay/RoxannePrefab(Clone)/LipAnimator)	0	-1
9594	1110	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1392	5
9595	1110	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	125.781845	0.4139862
9596	1110	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.00856781	-0.077796936
9597	1110	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	262	3
9598	1110	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	135	1
9599	1110	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.6218681	0.09836388
9600	1110	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1391	5
9601	1110	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9602	1110	(lineCounter, ScriptableObjects/Statistics)	132	1
9603	1110	(wordCounter, ScriptableObjects/Statistics)	1846	4
9604	1110	(letterCounter, ScriptableObjects/Statistics)	9628	32
9605	1111	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1403	5
9606	1111	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	126.790543	0.5075226
9607	1111	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0848693848	0.0008010864
9608	1111	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	23.8083382	0.08452034
9609	1111	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1402	4
9610	1112	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1461	3
9611	1112	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	131.63147	0.332321167
9612	1112	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.166229248	0.0843658447
9613	1112	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6161.38135	518.465332
9614	1112	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	24.7602367	0.0332050323
9615	1112	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1460	2
9616	1113	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9617	1113	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1523	4
9618	1113	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	136.687973	0.3322296
9619	1113	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0923156738	0.007797241
9620	1113	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	6711.5083	2.293457
9621	1113	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	25.7863235	0.04800415
9622	1113	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1522	3
9623	1116	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9624	1116	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1584	3
9625	1116	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	141.678619	0.2975464
9626	1116	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1431427	0.06266785
9627	1116	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	265	3
9628	1116	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8041.18066	1329.67236
9629	1116	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	137	4
9630	1116	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	25.2630348	0.0308837891
9631	1116	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	136	1
9632	1116	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	26.7742844	0.0308837891
9633	1116	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1583	2
9634	1116	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9635	1116	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
9636	1116	(lineCounter, ScriptableObjects/Statistics)	134	2
9637	1116	(wordCounter, ScriptableObjects/Statistics)	1861	15
9638	1116	(letterCounter, ScriptableObjects/Statistics)	9715	87
9639	1117	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1643	2
9640	1117	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	146.554153	0.173049927
9641	1117	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06758118	-0.0159301758
9642	1117	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	269	4
9643	1117	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	139	2
9644	1117	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	26.2199936	0.0210762024
9645	1117	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	138	2
9646	1117	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	27.7006359	0.926351547
9647	1117	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1642	1
9648	1117	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	1
9649	1117	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-2
9650	1117	(lineCounter, ScriptableObjects/Statistics)	136	2
9651	1117	(wordCounter, ScriptableObjects/Statistics)	1892	31
9652	1117	(letterCounter, ScriptableObjects/Statistics)	9886	171
9653	1118	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9654	1118	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1704	4
9655	1118	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	151.735046	0.3353424
9656	1118	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.07574463	-0.0153656006
9657	1118	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	270	1
9658	1118	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	27.2543755	0.0517654419
9659	1118	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1703	3
9660	1118	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	0	-1
9661	1119	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9662	1119	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1766	6
9663	1119	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	157.036469	0.5767822
9664	1119	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0819397	-0.00103759766
9665	1119	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	272	2
9666	1119	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	27.4082813	0.153905869
9667	1119	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	140	2
9668	1119	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	29.9443836	0.09896469
9669	1119	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1765	5
9670	1119	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9671	1119	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	1
9672	1119	(lineCounter, ScriptableObjects/Statistics)	137	1
9673	1119	(wordCounter, ScriptableObjects/Statistics)	1917	25
9674	1119	(letterCounter, ScriptableObjects/Statistics)	10021	135
9675	1120	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1805	5
9676	1120	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	160.2766	0.507644653
9677	1120	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08628845	0.00372314453
9678	1120	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	274	2
9679	1120	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	141	2
9680	1120	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	28.90257	0.016494751
9681	1120	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	142	2
9682	1120	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	30.5936089	0.100788116
9683	1120	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1804	5
9684	1120	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9685	1120	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	2	1
9686	1120	(lineCounter, ScriptableObjects/Statistics)	139	2
9687	1120	(wordCounter, ScriptableObjects/Statistics)	1936	19
9688	1120	(letterCounter, ScriptableObjects/Statistics)	10139	118
9689	1121	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9690	1121	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1824	4
9691	1121	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	161.809021	0.3404541
9692	1121	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08444214	-0.00129699707
9693	1121	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	30.9004574	0.0512084961
9694	1121	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1823	3
9695	1121	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9696	1122	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1885	4
9697	1122	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	166.924774	0.4090271
9698	1122	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.165237427	0.07952881
9699	1122	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	276	2
9700	1122	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	143	1
9701	1122	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	31.9074421	0.0488929749
9702	1122	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1884	3
9703	1122	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9704	1122	(lineCounter, ScriptableObjects/Statistics)	140	1
9705	1122	(wordCounter, ScriptableObjects/Statistics)	1972	36
9706	1122	(letterCounter, ScriptableObjects/Statistics)	10339	200
9707	1123	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9708	1123	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	1946	4
9709	1123	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	171.9614	0.413833618
9710	1123	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08052063	-0.00268554688
9711	1123	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	32.9316864	0.06663132
9712	1123	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	1945	3
9713	1123	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9714	1124	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2008	5
9715	1124	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	177.072464	0.49206543
9716	1124	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.171325684	0.08996582
9717	1124	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	280	4
9718	1124	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	146	5
9719	1124	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	32.4289	0.06412506
9720	1124	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	145	2
9721	1124	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	33.78819	0.856502533
9722	1124	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2007	4
9723	1124	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9724	1124	(lineCounter, ScriptableObjects/Statistics)	143	3
9725	1124	(wordCounter, ScriptableObjects/Statistics)	1986	14
9726	1124	(letterCounter, ScriptableObjects/Statistics)	10408	69
9727	1125	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9728	1125	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2070	6
9729	1125	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	182.174667	0.5773163
9730	1125	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0818328857	-0.0006713867
9731	1125	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	282	2
9732	1125	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	32.6107559	0.181854248
9733	1125	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	147	2
9734	1125	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	35.01489	0.09908676
9735	1125	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2069	5
9736	1125	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9737	1125	(lineCounter, ScriptableObjects/Statistics)	144	1
9738	1125	(wordCounter, ScriptableObjects/Statistics)	2040	54
9739	1125	(letterCounter, ScriptableObjects/Statistics)	10697	289
9740	1126	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2128	3
9741	1126	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	187.015366	0.3368225
9742	1126	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.168304443	0.08439636
9743	1126	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	35.9657364	0.03370285
9744	1126	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2127	2
9745	1127	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	0	-1
9746	1127	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2189	5
9747	1127	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	192.193024	0.499130249
9748	1127	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.08287048	0.00134277344
9749	1127	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	284	2
9750	1127	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	148	1
9751	1127	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	37.0183144	0.08320236
9752	1127	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2188	4
9753	1127	(variantID, Game/Scene/Detective/Variants/LipAnimator)	1	1
9754	1127	(lineCounter, ScriptableObjects/Statistics)	145	1
9755	1127	(wordCounter, ScriptableObjects/Statistics)	2058	18
9756	1127	(letterCounter, ScriptableObjects/Statistics)	10799	102
9757	1128	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2249	5
9758	1128	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	197.262787	0.508163452
9759	1128	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.0852508545	-0.0006866455
9760	1128	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	286	2
9761	1128	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	149	1
9762	1128	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	38.03184	0.08457184
9763	1128	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2248	4
9764	1128	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-1
9765	1128	(lineCounter, ScriptableObjects/Statistics)	146	1
9766	1128	(wordCounter, ScriptableObjects/Statistics)	2084	26
9767	1128	(letterCounter, ScriptableObjects/Statistics)	10942	143
9768	1129	(m_CollectionIndex, DontDestroyOnLoad/DelayedActionManager/DelayedActionManager)	1	1
9769	1129	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2304	1
9770	1129	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	201.896179	0.102203369
9771	1129	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.10218811	0.0168457031
9772	1129	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	38.9550934	0.9232521
9773	1129	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2303	55
9774	1129	(variantID, Game/Scene/Detective/Variants/LipAnimator)	2	2
9775	1130	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2364	1
9776	1130	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	206.914108	0.104537964
9777	1130	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.104522705	0.0199432373
9778	1130	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	287	1
9779	1130	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	150	4
9780	1130	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	38.6911049	6.080349
9781	1130	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	39.1750374	0.219944
9782	1130	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2363	60
9783	1130	(variantID, Game/Scene/CharacterDisplay/MichaelPrefab(Clone)/LipAnimator)	1	-1
9784	1130	(lineCounter, ScriptableObjects/Statistics)	147	1
9785	1130	(wordCounter, ScriptableObjects/Statistics)	2127	43
9786	1130	(letterCounter, ScriptableObjects/Statistics)	11174	232
9787	1131	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2428	5
9788	1131	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	212.354538	0.509017944
9789	1131	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.1671753	0.08543396
9790	1131	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	290	3
9791	1131	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	39.5455551	0.8544502
9792	1131	(ActivationId, Game/CameraShoulderSuspect/CinemachineCamera)	151	2
9793	1131	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	40.99001	0.0683403
9794	1131	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2427	4
9795	1131	(variantID, Game/Scene/Detective/Variants/LipAnimator)	0	-2
9796	1131	(lineCounter, ScriptableObjects/Statistics)	148	1
9797	1131	(wordCounter, ScriptableObjects/Statistics)	2140	13
9798	1131	(letterCounter, ScriptableObjects/Statistics)	11238	64
9799	1132	(inspectorUpdater, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	2483	2
9800	1132	(_unscaledTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	217.034912	0.172714233
9801	1132	(_unscaledDeltaTime, DontDestroyOnLoad/[DOTween]/DOTweenComponent)	0.06681824	-0.02243042
9802	1132	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	292	2
9803	1132	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8499.972	11.6933594
9804	1132	(ActivationId, Game/CameraShoulderDetective/CinemachineCamera)	152	2
9805	1132	(m_NoiseTime, Game/CameraShoulderDetective/CinemachineBasicMultiChannelPerlin)	40.75199	0.0211830139
9806	1132	(m_NoiseTime, Game/CameraShoulderSuspect/CinemachineBasicMultiChannelPerlin)	41.2473373	0.257328033
9807	1132	(m_LastFrameUpdated, Game/Main Camera/CinemachineBrain)	2482	1
9808	1132	(lineCounter, ScriptableObjects/Statistics)	149	1
9809	1132	(wordCounter, ScriptableObjects/Statistics)	2144	4
9810	1132	(letterCounter, ScriptableObjects/Statistics)	11259	21
9811	1133	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
9812	1133	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9813	1133	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9814	1133	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	648.002869	506.1924
9815	1133	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9816	1133	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9817	1133	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
9818	1133	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.02	0.02
9819	1134	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
9820	1134	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9821	1134	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9822	1134	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	648.002869	506.1924
9823	1134	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9824	1134	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9825	1134	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
9826	1134	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.02
9827	1135	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	4
9828	1135	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9829	1135	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9830	1135	(jumpCounter, ScriptableObjects/Statistics)	2	2
9831	1135	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.107794605
9833	1136	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
9834	1136	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
9835	1136	(killcounter, Statics/Enemy)	1	1
9836	1136	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9837	1136	(score, Statics/Score)	6	3
9838	1136	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9839	1136	(jumpCounter, ScriptableObjects/Statistics)	3	1
9840	1136	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.363478273	0.363478273
9841	1137	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
9842	1137	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	8	1
9843	1137	(killcounter, Statics/Enemy)	1	1
9844	1137	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9845	1137	(score, Statics/Score)	7	1
9846	1137	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9847	1137	(jumpCounter, ScriptableObjects/Statistics)	3	1
9848	1137	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.363478273
9849	1138	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	3
9850	1138	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1081.8457	433.842834
9851	1138	(score, Statics/Score)	8	1
9852	1138	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9853	1138	(timeSpendIdle, ScriptableObjects/Statistics)	3.35999751	0.179999828
9854	1138	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.313946843
9855	1139	(timeSpendIdle, ScriptableObjects/Statistics)	3.859997	0.479999542
9856	1140	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	15	4
9857	1140	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9858	1140	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9859	1140	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9860	1140	(jumpCounter, ScriptableObjects/Statistics)	4	1
9861	1140	(timeSpendIdle, ScriptableObjects/Statistics)	6.399995	0.199999809
9862	1140	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.2896694
9863	1141	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	17	2
9864	1141	(score, Statics/Score)	11	3
9865	1141	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9866	1141	(jumpCounter, ScriptableObjects/Statistics)	5	1
9867	1141	(timeSpendIdle, ScriptableObjects/Statistics)	10.1600428	3.760048
9868	1141	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.260019
9869	1142	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	4
9870	1142	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9871	1142	(_health, Statics/HealthSystem)	2	-1
9872	1142	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9873	1142	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9874	1142	(jumpCounter, ScriptableObjects/Statistics)	6	1
9875	1142	(timeSpendIdle, ScriptableObjects/Statistics)	11.3800707	0.08000183
9876	1142	(healthLost, ScriptableObjects/Statistics)	1	1
9877	1142	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.222644985
9878	1143	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	2
9879	1143	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9880	1143	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9881	1143	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9882	1143	(jumpCounter, ScriptableObjects/Statistics)	7	1
9883	1143	(timeSpendIdle, ScriptableObjects/Statistics)	15.1401567	0.120002747
9884	1143	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.201742992
9885	1144	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	26	1
9886	1144	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9887	1144	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9888	1144	(jumpCounter, ScriptableObjects/Statistics)	9	1
9889	1144	(timeSpendIdle, ScriptableObjects/Statistics)	17.3002052	2.16004848
9890	1144	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.174688
9891	1146	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	4	2
9892	1146	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	27	1
9893	1146	(killcounter, Statics/Enemy)	2	1
9894	1146	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9895	1146	(score, Statics/Score)	14	3
9896	1146	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9897	1146	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.137300789
9898	1146	(timeSpendIdle, ScriptableObjects/Statistics)	17.48021	0.160003662
9899	1147	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	34	1
9900	1147	(killcounter, Statics/Enemy)	3	1
9901	1147	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9902	1147	(score, Statics/Score)	16	2
9903	1147	(carrot, Statics/Score)	1	1
9904	1147	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9905	1147	(jumpCounter, ScriptableObjects/Statistics)	13	4
9907	1147	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1029173
9908	1148	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9909	1148	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	37	1
9910	1148	(killcounter, Statics/Enemy)	4	1
9911	1148	(score, Statics/Score)	21	5
9912	1148	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9913	1148	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9914	1148	(jumpCounter, ScriptableObjects/Statistics)	14	1
9915	1148	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.4312124	0.4312124
9916	1149	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9917	1149	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	37	1
9918	1149	(killcounter, Statics/Enemy)	4	1
9919	1149	(score, Statics/Score)	21	5
9920	1149	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9921	1149	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9922	1149	(jumpCounter, ScriptableObjects/Statistics)	14	1
9923	1149	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4312124
9924	1150	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	45	8
9925	1150	(killcounter, Statics/Enemy)	5	1
9926	1150	(jumpCounter, ScriptableObjects/Statistics)	15	1
9927	1150	(timeSpendIdle, ScriptableObjects/Statistics)	17.8002167	0.100002289
9928	1150	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.453153
9929	1151	(timeSpendIdle, ScriptableObjects/Statistics)	17.96022	0.1400032
9930	1152	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	52	1
9931	1152	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9932	1152	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9933	1152	(jumpCounter, ScriptableObjects/Statistics)	19	4
9934	1152	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.419589579
9935	1153	(killcounter, Statics/Enemy)	6	1
9936	1154	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9937	1154	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	55	1
9938	1154	(jumpCounter, ScriptableObjects/Statistics)	20	1
9939	1154	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.468597353	0.468597353
9940	1155	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9941	1155	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	55	1
9942	1155	(jumpCounter, ScriptableObjects/Statistics)	20	1
9943	1155	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.468597353
9944	1156	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9945	1156	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9946	1156	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9947	1156	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	600.900757	451.225952
9948	1156	(killcounter, Statics/Enemy)	0	-6
9949	1156	(score, Statics/Score)	0	-21
9950	1156	(carrot, Statics/Score)	0	-1
9951	1156	(_health, Statics/HealthSystem)	3	1
9952	1156	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9953	1156	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
9954	1156	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.02	0.02
9955	1157	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	3
9956	1157	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	1
9957	1157	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	3	2
9958	1157	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	600.900757	451.225952
9959	1157	(killcounter, Statics/Enemy)	0	-6
9960	1157	(score, Statics/Score)	0	-21
9961	1157	(carrot, Statics/Score)	0	-1
9962	1157	(_health, Statics/HealthSystem)	3	1
9963	1157	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9964	1157	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0.02
9965	1157	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.02
9966	1158	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	4	1
9967	1158	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
9968	1158	(jumpCounter, ScriptableObjects/Statistics)	1	1
9969	1158	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.190047488
9970	1159	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	1
9971	1159	(killcounter, Statics/Enemy)	1	1
9972	1159	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9973	1159	(score, Statics/Score)	7	1
9974	1159	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
9975	1159	(jumpCounter, ScriptableObjects/Statistics)	3	2
9976	1159	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.282104075	0.123644486
9977	1160	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	1
9978	1160	(killcounter, Statics/Enemy)	1	1
9979	1160	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
9980	1160	(score, Statics/Score)	8	1
9981	1160	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
9982	1160	(jumpCounter, ScriptableObjects/Statistics)	3	2
9983	1160	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.282104075
9984	1161	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	1	-2
9985	1161	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	11	2
9986	1161	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	819.483032	128.75293
9987	1161	(score, Statics/Score)	9	1
9988	1161	(_health, Statics/HealthSystem)	2	-1
9989	1161	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
9990	1161	(jumpCounter, ScriptableObjects/Statistics)	4	1
9991	1161	(timeSpendIdle, ScriptableObjects/Statistics)	0.279999971	0.0600000024
9992	1161	(healthLost, ScriptableObjects/Statistics)	1	1
9993	1161	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.455676615
9994	1162	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	933.122253	8.828369
9995	1162	(timeSpendIdle, ScriptableObjects/Statistics)	0.7799998	0.2999997
9996	1163	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	2
9997	1163	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2286.57764	24.6052246
9998	1163	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
9999	1163	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10000	1163	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10001	1163	(jumpCounter, ScriptableObjects/Statistics)	5	1
10002	1163	(timeSpendIdle, ScriptableObjects/Statistics)	3.75999713	0.03999996
10003	1163	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.1540426
10004	1164	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2	1
10005	1164	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2381.79053	95.21289
10006	1164	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
10007	1164	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
10008	1164	(timeSpendIdle, ScriptableObjects/Statistics)	5.279996	0.01999998
10009	1164	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.493520439
10010	1165	(timeSpendIdle, ScriptableObjects/Statistics)	5.77999544	0.3199997
10011	1166	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	6
10012	1166	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2520.71533	138.9248
10013	1166	(score, Statics/Score)	11	2
10014	1166	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10015	1166	(jumpCounter, ScriptableObjects/Statistics)	6	1
10016	1166	(timeSpendIdle, ScriptableObjects/Statistics)	7.099994	1.31999874
10017	1166	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.4715718
10018	1168	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	21	2
10019	1168	(killcounter, Statics/Enemy)	2	1
10020	1168	(score, Statics/Score)	14	3
10021	1168	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10022	1168	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
10023	1168	(jumpCounter, ScriptableObjects/Statistics)	7	1
10024	1168	(timeSpendIdle, ScriptableObjects/Statistics)	7.89999342	0.259999752
10025	1168	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0149786
10026	1168	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	2983.24731	458.408936
10027	1169	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	0	0
10028	1169	(totalMouseClicks, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	1	0
10029	1169	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	0	0
10030	1169	(totalMouseDistance, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	48.2597122	0
10031	1169	(killcounter, Statics/Enemy)	0	0
10032	1169	(score, Statics/Score)	0	0
10033	1169	(timeSpendIdle, ScriptableObjects/Statistics)	0.02	0
10034	1171	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	1	1
10035	1171	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	5	5
10036	1171	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
10037	1171	(score, Statics/Score)	3	3
10038	1171	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10039	1171	(jumpCounter, ScriptableObjects/Statistics)	3	3
10040	1171	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.07358109
10041	1171	(moveDirection, 1/Player/CharacterControl)	1	1
10042	1172	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	1	1
10043	1172	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	1
10044	1172	(killcounter, Statics/Enemy)	1	1
10045	1172	(score, Statics/Score)	7	4
10046	1172	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
10047	1172	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
10048	1172	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.0698455	0.0698455
10049	1173	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	1	1
10050	1173	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	7	1
10051	1173	(killcounter, Statics/Enemy)	1	1
10052	1173	(score, Statics/Score)	7	4
10053	1173	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
10054	1173	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
10055	1173	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0698455
10056	1174	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	9	2
10057	1174	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
10058	1174	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10059	1174	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10060	1174	(jumpCounter, ScriptableObjects/Statistics)	4	1
10061	1174	(timeSpendIdle, ScriptableObjects/Statistics)	0.139999986	0.11999999
10062	1174	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0077148
10063	1175	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	13	4
10064	1175	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	1	1
10065	1175	(score, Statics/Score)	10	3
10066	1175	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
10067	1175	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
10068	1175	(jumpCounter, ScriptableObjects/Statistics)	6	2
10069	1175	(timeSpendIdle, ScriptableObjects/Statistics)	1.07999957	0.9399996
10070	1175	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0288639
10071	1176	(killcounter, Statics/Enemy)	2	1
10072	1178	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	3	2
10073	1178	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	14	1
10074	1178	(currentWaypointIndex, 1/Enemies/Slugs/Slug0/Slug/SlugMove)	0	-1
10075	1178	(score, Statics/Score)	13	3
10076	1178	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10077	1178	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10078	1178	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0413057022
10079	1179	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	19	5
10080	1179	(carrot, Statics/Score)	1	1
10081	1179	(jumpCounter, ScriptableObjects/Statistics)	10	4
10082	1179	(timeSpendIdle, ScriptableObjects/Statistics)	1.29999936	0.21999979
10083	1179	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0968868
10084	1180	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	23	4
10085	1180	(killcounter, Statics/Enemy)	4	2
10086	1180	(score, Statics/Score)	15	2
10087	1180	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	1	1
10088	1180	(jumpCounter, ScriptableObjects/Statistics)	11	1
10089	1180	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.010388
10090	1182	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	25	1
10091	1182	(score, Statics/Score)	17	2
10092	1182	(currentWaypointIndex, 1/Enemies/Slugs/Slug1/Slug/SlugMove)	0	-1
10093	1182	(timeSpendIdle, ScriptableObjects/Statistics)	1.33999932	0.01999998
10094	1182	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.038911704
10095	1182	(moveDirection, 1/Player/CharacterControl)	1	1
10096	1183	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	31	6
10097	1183	(killcounter, Statics/Enemy)	5	1
10098	1183	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	0	-1
10099	1183	(jumpCounter, ScriptableObjects/Statistics)	12	1
10100	1183	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0325743034
10101	1184	(totalKeystrokes, DontDestroyOnLoad/GameDataCollector/GameDataCollector)	32	1
10102	1184	(jumpCounter, ScriptableObjects/Statistics)	14	2
10103	1185	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
10104	1185	(killcounter, Statics/Enemy)	6	1
10105	1185	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10106	1185	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0.0350094028	0.0350094028
10107	1186	(userReportedIntensity, 1/DiffEventEmitter/DiffEventEmitter)	2	2
10108	1186	(killcounter, Statics/Enemy)	6	1
10109	1186	(currentWaypointIndex, 1/MovingPlatform/FlyPlats/Platform)	1	1
10110	1186	(_timeSinceLastSend, 1/VariableChangedEventEmitter/VariableChangedEventEmitter)	0	-0.0350094028
\.


--
-- Name: beat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beat_id_seq', 4, true);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 1186, true);


--
-- Name: runs_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.runs_run_id_seq', 65, true);


--
-- Name: variable_changes_variable_change_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variable_changes_variable_change_id_seq', 10110, true);


--
-- Name: beats beats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beats
    ADD CONSTRAINT beats_pkey PRIMARY KEY (beat_id, run_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: runs runs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.runs
    ADD CONSTRAINT runs_pkey PRIMARY KEY (run_id);


--
-- Name: beat_timings_per_run unique_run_beat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beat_timings_per_run
    ADD CONSTRAINT unique_run_beat UNIQUE (run_id, beat_id);


--
-- Name: variable_changes variable_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_changes
    ADD CONSTRAINT variable_changes_pkey PRIMARY KEY (variable_change_id);


--
-- Name: beats beats_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beats
    ADD CONSTRAINT beats_run_id_fkey FOREIGN KEY (run_id) REFERENCES public.runs(run_id);


--
-- Name: events events_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_run_id_fkey FOREIGN KEY (run_id) REFERENCES public.runs(run_id);


--
-- Name: variable_changes variable_changes_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variable_changes
    ADD CONSTRAINT variable_changes_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- PostgreSQL database dump complete
--

