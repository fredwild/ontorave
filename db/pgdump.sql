--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: info_nodes_ref_targets_items; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE info_nodes_ref_targets_items (
    info_node_src_id integer DEFAULT 0 NOT NULL,
    item_dest_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.info_nodes_ref_targets_items OWNER TO app35549;

--
-- Name: items; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    "type" character varying(64),
    name character varying(120),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    info_node_info_node_id integer,
    body text,
    value character varying(120),
    sort_code integer,
    "view" text
);


ALTER TABLE public.items OWNER TO app35549;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: app35549
--

CREATE SEQUENCE items_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO app35549;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app35549
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app35549
--

SELECT pg_catalog.setval('items_id_seq', 1948, true);


--
-- Name: properties; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE properties (
    id integer NOT NULL,
    name character varying(120),
    value character varying(120),
    item_item_id integer
);


ALTER TABLE public.properties OWNER TO app35549;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: app35549
--

CREATE SEQUENCE properties_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO app35549;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app35549
--

ALTER SEQUENCE properties_id_seq OWNED BY properties.id;


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app35549
--

SELECT pg_catalog.setval('properties_id_seq', 559, true);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO app35549;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(120)
);


ALTER TABLE public.tags OWNER TO app35549;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: app35549
--

CREATE SEQUENCE tags_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO app35549;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app35549
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app35549
--

SELECT pg_catalog.setval('tags_id_seq', 147, true);


--
-- Name: tags_items_items; Type: TABLE; Schema: public; Owner: app35549; Tablespace: 
--

CREATE TABLE tags_items_items (
    tag_src_id integer DEFAULT 0 NOT NULL,
    item_dest_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.tags_items_items OWNER TO app35549;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app35549
--

ALTER TABLE items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app35549
--

ALTER TABLE properties ALTER COLUMN id SET DEFAULT nextval('properties_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app35549
--

ALTER TABLE tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Data for Name: info_nodes_ref_targets_items; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY info_nodes_ref_targets_items (info_node_src_id, item_dest_id) FROM stdin;
400	402
738	742
743	740
746	738
746	743
750	736
750	737
772	736
772	778
777	736
777	779
781	1319
1124	808
1124	809
1124	817
1124	818
1124	819
1124	820
1124	821
1124	822
1124	823
1132	1003
1132	1004
1132	1005
1132	1006
1132	1007
1132	1008
1132	1009
1146	912
1146	913
1146	914
1146	915
1146	916
1146	917
1146	918
1156	884
1156	886
1156	1417
1156	1447
1185	979
1185	980
1185	981
1185	982
1195	1010
1195	1011
1195	1013
1195	1014
1195	1015
1195	1429
1203	834
1203	835
1203	836
1203	837
1203	853
1203	1411
1212	907
1212	909
1212	910
1212	911
1212	1423
1217	1083
1217	1084
1217	1085
1217	1086
1217	1089
1217	1091
1217	1441
1221	1151
1221	1771
1221	1772
1221	1773
1255	791
1255	797
1255	1250
1255	1251
1255	1252
1255	1253
1255	1254
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY items (id, "type", name, created_at, updated_at, info_node_info_node_id, body, value, sort_code, "view") FROM stdin;
398	InfoNode	AST Web Sites	2008-03-17 18:37:00	2008-06-19 10:12:21	\N	\N	\N	398	\N
399	InfoNode	David Hay	2008-03-17 18:38:23	2008-05-02 18:14:09	398	\N	\N	399	\N
400	InfoNode	ARVC	2008-03-17 18:38:23	2008-05-02 18:14:09	398	\N	\N	400	\N
401	InfoNode	FH Conference	2008-03-17 18:38:23	2008-05-02 18:14:09	398	\N	\N	401	\N
402	InfoNode	Domains	2008-03-17 18:50:47	2008-05-02 18:14:09	399	\N	\N	402	\N
403	InfoNode	DavidHaycom	2008-03-17 18:52:58	2008-05-02 18:14:10	402	\N	\N	403	\N
405	InfoNode	PamelaHaycom	2008-03-17 18:52:58	2008-05-02 18:14:10	402	\N	\N	405	\N
406	InfoNode	Othercom	2008-03-17 18:52:58	2008-05-02 18:14:10	402	\N	\N	406	\N
407	Section	Needs	2008-03-17 18:55:01	2008-04-25 23:00:07	403	Website should allow: \r\n* login \r\n* user contact info editing \r\n* present papers/pubs \r\n* record which user accessed which papers/pubs \r\n* allow entry of comments with approval control\r	\N	407	\N
421	InfoNode	domain info	2008-04-25 09:29:34	2008-05-02 18:14:10	442	\N	\N	421	\N
424	Attribute	domain_name	2008-04-25 09:32:09	2008-04-25 23:00:07	421	\N	string	424	\N
425	Section	Requirements	2008-04-25 09:34:00	2008-04-25 23:00:07	421		\N	425	\N
426	Attribute	yearly_cost	2008-04-25 09:35:22	2008-04-25 23:00:07	421	\N	money	426	\N
429	Attribute	domain_name	2008-04-25 10:22:01	2008-04-25 23:00:07	403	\N	tbd	429	\N
430	Attribute	yearly_cost	2008-04-25 10:22:01	2008-04-25 23:00:07	403	\N	tbd	430	\N
431	Attribute	domain_name	2008-04-25 10:22:08	2008-04-25 23:00:07	405	\N	tbd	431	\N
432	Attribute	yearly_cost	2008-04-25 10:22:08	2008-04-25 23:00:07	405	\N	tbd	432	\N
433	Attribute	domain_name	2008-04-25 10:22:16	2008-04-25 23:00:07	406	\N	tbd	433	\N
434	Attribute	yearly_cost	2008-04-25 10:22:16	2008-04-25 23:00:07	406	\N	tbd	434	\N
435	Section	Requirements	2008-04-25 10:25:00	2008-04-25 23:00:07	406	Hello\r\n* one\r\n* two	\N	435	\N
436	InfoNode	Sub1	2008-04-25 11:58:03	2008-05-02 18:14:10	421	\N	\N	436	\N
437	InfoNode	Sub2	2008-04-25 11:58:03	2008-05-02 18:14:10	421	\N	\N	437	\N
442	InfoNode	templates	2008-04-25 11:59:09	2008-05-02 18:14:10	398	\N	\N	442	\N
443	Section	Requirements	2008-04-25 14:04:46	2008-04-25 23:00:07	403	tbd	\N	443	\N
444	InfoNode	sub1	2008-04-25 14:04:46	2008-05-02 18:14:10	403	\N	\N	444	\N
445	InfoNode	sub2	2008-04-25 14:04:46	2008-05-02 18:14:10	403	\N	\N	445	\N
446	Attribute	hosting_site	2008-04-25 14:05:31	2008-04-25 23:00:07	421	\N	string	446	\N
447	Attribute	hosting_site	2008-04-25 14:05:43	2008-04-25 23:00:07	403	\N	tbd	447	\N
457	InfoNode	EssentialStrategiescom	2008-04-25 14:38:18	2008-05-02 18:14:10	402	\N	\N	457	\N
458	Attribute	domain_name	2008-04-25 14:38:37	2008-04-25 23:00:07	457	\N	tbd	458	\N
459	Attribute	hosting_site	2008-04-25 14:38:37	2008-04-25 23:00:07	457	\N	tbd	459	\N
460	Attribute	yearly_cost	2008-04-25 14:38:37	2008-04-25 23:00:07	457	\N	tbd	460	\N
462	InfoNode	Sub1	2008-04-25 14:38:37	2008-05-02 18:14:10	457	\N	\N	462	\N
463	InfoNode	Sub2	2008-04-25 14:38:37	2008-05-02 18:14:10	457	\N	\N	463	\N
464	Section	Notes	2008-04-25 16:26:01	2008-04-25 23:00:07	457	Hmm\r\n\r\nThis could be good.\r\n\r\nWhy?\r\n# reason \r\n# rationale\r	\N	464	\N
467	Attribute	hosting_site	2008-04-25 17:58:15	2008-04-25 23:00:07	405	\N	tbd	467	\N
468	Section	Requirements	2008-04-25 17:58:15	2008-04-25 23:00:07	405	tbd	\N	468	\N
469	InfoNode	Sub1	2008-04-25 17:58:15	2008-05-02 18:14:10	405	\N	\N	469	\N
470	InfoNode	Sub2	2008-04-25 17:58:16	2008-05-02 18:14:10	405	\N	\N	470	\N
471	InfoNode	Micheal Pullen	2008-04-25 17:59:58	2008-05-02 18:14:10	398	\N	\N	471	\N
472	Section	What we have for  deal	2008-04-25 18:02:07	2008-04-25 23:00:08	400	They let me use their facilities, and I do their web site.\r\n\r\nNot a bad deal.	\N	472	\N
473	Section	Requirements	2008-04-25 20:29:26	2008-04-25 23:00:08	457	A list:\r\n* first\r\n* second\r\n\r\nOh Boy!	\N	473	\N
474	Section	Status Notes	2008-04-25 20:48:58	2008-04-25 23:00:08	421		\N	474	\N
475	Section	Status Notes	2008-04-25 20:49:36	2008-04-25 23:00:08	457	tbd	\N	475	\N
476	InfoNode	person info	2008-04-25 20:51:17	2008-05-02 18:14:10	442	\N	\N	476	\N
477	Attribute	first_name	2008-04-25 20:54:43	2008-04-25 23:00:08	476	\N	string	477	\N
478	Attribute	last_name	2008-04-25 20:54:43	2008-04-25 23:00:08	476	\N	string	478	\N
479	Attribute	age	2008-04-25 20:54:43	2008-04-25 23:00:08	476	\N	int	479	\N
481	Attribute	gender	2008-04-25 20:54:43	2008-04-25 23:00:08	476	\N	string	481	\N
485	Attribute	first_name	2008-04-25 20:55:27	2008-06-28 18:14:37	399	\N	David	485	\N
488	Section	Sample	2008-04-25 20:58:48	2008-04-28 00:29:59	476		\N	488	\N
494	Section	Sample	2008-04-25 21:23:18	2008-04-28 00:30:10	399	This is a sample\r\n\r\nof several lines of text.\r	\N	494	\N
496	Attribute	age	2008-04-25 21:46:23	2008-06-28 18:14:37	399	\N	52	496	\N
497	Attribute	gender	2008-04-25 21:46:23	2008-06-28 18:14:37	399	\N	Man	497	\N
498	Attribute	last_name	2008-04-25 21:46:23	2008-06-28 18:14:37	399	\N	Hay	498	\N
499	Attribute	passport	2008-04-25 21:48:00	2008-06-28 18:14:37	399	\N	273912643	499	\N
500	Section	Notes	2008-04-25 23:00:51	2008-04-25 23:05:39	399		\N	502	\N
501	Section	Legal Notice	2008-04-25 23:05:08	2008-04-25 23:06:06	476		\N	501	\N
502	Section	Legal Notice	2008-04-25 23:05:19	2008-04-25 23:06:14	399		\N	500	\N
537	Attribute	a	2008-04-26 08:09:49	2008-04-26 08:09:49	401	\N	b	537	\N
538	Section	Test	2008-04-26 08:37:30	2008-04-26 08:44:04	401	This is a paragraph of test text.  It contains:\r\n\r\nA list\r\n* one \r\n* two\r\n* three\r\n\r\nA numbered list\r\n# first\r\n# second \r\n# third\r\n\r\nh3. A section heading\r\n\r\nWith some text under it.\r\n\r\nh3. And another \r\n\r\nWith some text also under it	\N	538	\N
539	Value	one	2008-04-26 08:37:58	2008-04-26 08:37:58	401	\N	\N	539	\N
540	Value	two	2008-04-26 08:37:58	2008-04-26 08:37:58	401	\N	\N	540	\N
541	Value	three	2008-04-26 08:37:58	2008-04-26 08:37:58	401	\N	\N	541	\N
543	InfoNode	states	2008-04-26 10:47:30	2008-05-02 18:14:10	594	\N	\N	543	\N
594	InfoNode	reference	2008-04-26 10:54:53	2008-05-02 18:14:10	398	\N	\N	594	\N
595	InfoNode	Address	2008-04-26 10:57:00	2008-05-02 18:14:10	399	\N	\N	595	\N
596	InfoNode	Alabama	2008-04-26 10:59:04	2008-05-02 18:14:10	543	\N	\N	596	\N
597	InfoNode	Alaska	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	597	\N
598	InfoNode	Arizona	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	598	\N
599	InfoNode	Arkansas	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	599	\N
600	InfoNode	California	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	600	\N
601	InfoNode	Colorado	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	601	\N
602	InfoNode	Connecticut	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	602	\N
603	InfoNode	Delaware	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	603	\N
604	InfoNode	Florida	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	604	\N
605	InfoNode	Georgia	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	605	\N
606	InfoNode	Hawaii	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	606	\N
607	InfoNode	Idaho	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	607	\N
608	InfoNode	Illinois	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	608	\N
609	InfoNode	Indiana	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	609	\N
610	InfoNode	Iowa	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	610	\N
611	InfoNode	Kansas	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	611	\N
612	InfoNode	Kentucky	2008-04-26 10:59:05	2008-05-02 18:14:10	543	\N	\N	612	\N
613	InfoNode	Louisiana	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	613	\N
614	InfoNode	Maine	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	614	\N
615	InfoNode	Maryland	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	615	\N
616	InfoNode	Massachusetts	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	616	\N
617	InfoNode	Michigan	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	617	\N
618	InfoNode	Minnesota	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	618	\N
619	InfoNode	Mississippi	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	619	\N
620	InfoNode	Missouri	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	620	\N
621	InfoNode	Montana	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	621	\N
622	InfoNode	Nebraska	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	622	\N
623	InfoNode	Nevada	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	623	\N
624	InfoNode	New Hampshire	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	624	\N
625	InfoNode	New Jersey	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	625	\N
626	InfoNode	New Mexico	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	626	\N
627	InfoNode	New York	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	627	\N
628	InfoNode	North Carolina	2008-04-26 10:59:06	2008-05-02 18:14:10	543	\N	\N	628	\N
629	InfoNode	North Dakota	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	629	\N
630	InfoNode	Ohio	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	630	\N
631	InfoNode	Oklahoma	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	631	\N
632	InfoNode	Oregon	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	632	\N
633	InfoNode	Pennsylvania	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	633	\N
634	InfoNode	Rhode Island	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	634	\N
635	InfoNode	South Carolina	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	635	\N
636	InfoNode	South Dakota	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	636	\N
637	InfoNode	Tennessee	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	637	\N
638	InfoNode	Texas	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	638	\N
639	InfoNode	Utah	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	639	\N
640	InfoNode	Vermont	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	640	\N
641	InfoNode	Virginia	2008-04-26 10:59:07	2008-05-02 18:14:11	543	\N	\N	641	\N
642	InfoNode	Washington	2008-04-26 10:59:08	2008-05-02 18:14:11	543	\N	\N	642	\N
643	InfoNode	West Virginia	2008-04-26 10:59:08	2008-05-02 18:14:11	543	\N	\N	643	\N
644	InfoNode	Wisconsin	2008-04-26 10:59:08	2008-05-02 18:14:11	543	\N	\N	644	\N
645	InfoNode	Wyoming	2008-04-26 10:59:08	2008-05-02 18:14:11	543	\N	\N	645	\N
647	Attribute	city	2008-04-26 11:01:17	2008-04-26 11:01:17	595	\N	Houston	647	\N
648	Attribute	state	2008-04-26 11:01:17	2008-04-26 11:01:17	595	\N	Texas	648	\N
650	InfoNode	address info	2008-04-26 11:03:00	2008-05-02 18:14:11	442	\N	\N	650	\N
652	Attribute	city	2008-04-26 11:03:36	2008-04-26 11:03:36	650	\N	string	652	\N
653	Attribute	state	2008-04-26 11:03:36	2008-04-26 11:03:36	650	\N	string	653	\N
654	Attribute	addr2	2008-04-26 11:03:54	2008-04-26 11:03:54	650	\N	string	654	\N
656	Attribute	addr2	2008-04-26 11:05:30	2008-04-26 11:05:30	595	\N		656	\N
667	InfoNode	Hosting	2008-04-26 16:25:23	2008-05-02 18:14:11	\N	\N	\N	667	<h3>A Custom View</h3>\r\n\r\n<h4>Me as a Node List </h4>\r\n<%= labeled_node_list @node %>\r\n\r\n<% for ls in @sub_nodes do %>\r\n  <h4><%=ls.name%></h4>\r\n  <%= labeled_node_list(ls) %>\r\n<% end %>
668	InfoNode	templates	2008-04-26 21:35:36	2008-05-02 18:14:11	675	\N	\N	668	\N
669	InfoNode	client template	2008-04-26 21:36:04	2008-05-02 18:14:11	668	\N	\N	669	\N
670	InfoNode	service	2008-04-26 21:36:05	2008-05-02 18:14:11	668	\N	\N	670	\N
671	Attribute	name	2008-04-26 21:37:56	2008-04-26 21:37:56	669	\N	string	671	\N
672	Attribute	email	2008-04-26 21:37:56	2008-04-26 21:37:56	669	\N	string	672	\N
673	Section	Requirements	2008-04-26 21:38:14	2008-04-26 21:38:14	669		\N	673	\N
674	InfoNode	Clients	2008-04-26 21:49:06	2008-05-02 18:14:11	667	\N	\N	674	\N
675	InfoNode	system things	2008-04-26 21:50:37	2008-05-02 18:14:11	667	\N	\N	675	\N
677	InfoNode	David Hay	2008-04-26 21:54:03	2008-05-02 18:14:11	674	\N	\N	677	\N
678	InfoNode	ARVC	2008-04-26 21:54:03	2008-05-02 18:14:11	674	\N	\N	678	\N
679	InfoNode	Tirvi	2008-04-26 21:54:03	2008-05-02 18:14:11	674	\N	\N	679	\N
680	Attribute	email	2008-04-26 21:54:40	2008-04-26 21:59:33	677	\N	dave@davehay.com	680	\N
681	Attribute	name	2008-04-26 21:54:40	2008-04-26 21:59:33	677	\N	Dave	681	\N
682	Section	Requirements	2008-04-26 21:54:40	2008-06-28 12:43:24	677	Requirements\r\n# do this \r\n# do that\r\n# another one\r	\N	682	\N
685	Attribute	tel_no	2008-04-26 22:00:35	2008-04-26 22:00:35	669	\N	string	685	\N
686	Attribute	tel_no	2008-04-26 22:00:55	2008-04-26 22:00:55	677	\N		686	\N
687	Attribute	family_site	2008-04-26 22:03:24	2008-04-26 22:31:08	677	\N	http://www.pamelahay.com	687	\N
688	InfoNode	payments	2008-04-26 22:12:00	2008-05-02 18:14:11	669	\N	\N	688	\N
689	InfoNode	services	2008-04-26 22:12:00	2008-05-02 18:14:11	669	\N	\N	689	\N
690	InfoNode	payments	2008-04-26 22:12:26	2008-05-02 18:14:11	677	\N	\N	690	\N
691	InfoNode	services	2008-04-26 22:12:26	2008-05-02 18:14:11	677	\N	\N	691	\N
693	Attribute	email	2008-04-27 18:53:57	2008-04-27 18:53:57	678	\N		693	\N
694	Attribute	name	2008-04-27 18:53:57	2008-04-27 18:53:57	678	\N		694	\N
695	Attribute	tel_no	2008-04-27 18:53:57	2008-04-27 18:53:57	678	\N		695	\N
696	Section	Requirements	2008-04-27 18:53:57	2008-04-27 18:53:58	678		\N	696	\N
697	InfoNode	payments	2008-04-27 18:53:58	2008-05-02 18:14:11	678	\N	\N	697	\N
698	InfoNode	services	2008-04-27 18:53:58	2008-05-02 18:14:11	678	\N	\N	698	\N
699	Attribute	cost_per_year	2008-04-27 18:54:52	2008-04-27 18:54:52	669	\N	money	699	\N
700	Attribute	cost_per_year	2008-04-27 18:55:13	2008-04-27 18:56:26	678	\N	0.0	700	\N
701	Attribute	cost_per_year	2008-04-27 18:58:45	2008-04-27 18:59:16	679	\N	0.0	701	\N
702	Attribute	email	2008-04-27 18:58:45	2008-04-27 18:58:45	679	\N		702	\N
703	Attribute	name	2008-04-27 18:58:45	2008-04-27 18:58:46	679	\N		703	\N
704	Attribute	tel_no	2008-04-27 18:58:46	2008-04-27 18:58:46	679	\N		704	\N
705	Section	Requirements	2008-04-27 18:58:46	2008-04-27 18:58:46	679		\N	705	\N
706	InfoNode	payments	2008-04-27 18:58:46	2008-05-02 18:14:11	679	\N	\N	706	\N
707	InfoNode	services	2008-04-27 18:58:46	2008-05-02 18:14:11	679	\N	\N	707	\N
708	InfoNode	view test	2008-04-27 19:00:30	2008-05-02 18:14:11	675	\N	\N	708	<h3><%= @node.name.humanize %></h3>\r\n\r\n<hr />\r\n\r\n<div style="width:29%">\r\n<%= labeled_node_list "Friends", :label_background => 'maroon' %>\r\n</div>\r\n\r\n<div style="margin-top:10px; width:29%">\r\n<%= labeled_value_list @node, :label => 'Greetings' %>\r\n</div>\r\n\r\n<p>\r\n<% for item in @docs.select{|d| d.name.downcase != "view"} do %>\r\n   <h3><%=item.name%></h3>\r\n   <div><%=rc_format(item.body)%></div>\r\n<% end %>\r\n</p>\r
713	Section	This is a doc section	2008-04-27 19:07:53	2008-04-27 19:07:59	708	Textile is a lightweight markup language originally developed by Dean Allen and billed as a "humane Web text generator". Textile converts its marked-up text input to valid, well-formed XHTML and also inserts character entity references for apostrophes, opening and closing single and double quotation marks, ellipses and em dashes.\r\n\r\nTextile was originally implemented in PHP, but has been translated into other programming languages including Perl, Python, Ruby, ASP, Java and C#.\r\n\r\nTextile is distributed under a BSD-style license and is included with, or available as a plugin for, several content-management systems.\r\n\r\nVersion 2.0 beta was released in 2004 as part of the Textpattern content management system.\r\n\r\nVersion 2.0 was released in 2006.\r	\N	712	\N
722	Attribute	cost_per_year	2008-04-27 20:53:17	2008-04-27 20:54:01	677	\N	$250	722	\N
723	Attribute	email	2008-04-28 00:23:22	2008-06-28 18:14:37	399	\N	dch@essentialstrategies.com	723	\N
724	Attribute	addr1	2008-04-28 00:25:37	2008-04-28 00:25:37	650	\N	string	724	\N
725	Attribute	addr1	2008-04-28 00:26:07	2008-04-28 00:26:22	595	\N	123 street name way	725	\N
727	Value	Hello	2008-04-28 09:21:19	2008-04-28 09:21:19	708	\N	\N	727	\N
728	Value	Hi	2008-04-28 09:21:19	2008-04-28 09:21:19	708	\N	\N	728	\N
729	Value	What's up	2008-04-28 09:21:19	2008-04-28 09:21:19	708	\N	\N	729	\N
730	Value	wild_fred@emc.com	2008-04-28 09:32:18	2008-04-28 09:32:18	708	\N	\N	730	\N
733	InfoNode	BusinessTerminology	2008-04-30 08:13:43	2008-05-02 18:14:11	\N	\N	\N	733	\N
734	InfoNode	Business Terms	2008-04-30 08:14:21	2008-05-02 18:14:11	733	\N	\N	734	\N
735	InfoNode	Insurance Program	2008-04-30 08:14:47	2008-05-02 18:14:11	734	\N	\N	735	\N
736	InfoNode	Insurance	2008-04-30 08:15:23	2008-05-02 18:14:11	744	\N	\N	736	
737	InfoNode	Program	2008-04-30 08:15:23	2008-05-02 18:14:11	744	\N	\N	737	
738	InfoNode	Ins	2008-04-30 08:16:42	2008-05-02 18:14:11	745	\N	\N	738	\N
739	InfoNode	Abbreviation Types	2008-04-30 08:18:48	2008-05-02 18:14:11	733	\N	\N	739	\N
740	InfoNode	Oracle	2008-04-30 08:19:27	2008-05-02 18:14:11	739	\N	\N	740	\N
741	InfoNode	SQL Server	2008-04-30 08:19:27	2008-05-02 18:14:11	739	\N	\N	741	\N
742	InfoNode	Business	2008-04-30 08:19:27	2008-05-02 18:14:11	739	\N	\N	742	\N
743	InfoNode	INS	2008-04-30 08:22:02	2008-05-02 18:14:11	745	\N	\N	743	\N
744	InfoNode	Business Words	2008-04-30 08:25:41	2008-05-02 18:14:11	733	\N	\N	744	\N
745	InfoNode	Abbreviations	2008-04-30 08:26:13	2008-05-02 18:14:11	733	\N	\N	745	\N
746	InfoNode	Abbreviations	2008-04-30 09:21:33	2008-05-02 18:14:11	736	\N	\N	746	\N
747	InfoNode	templates	2008-04-30 09:22:57	2008-05-02 18:14:11	733	\N	\N	747	\N
748	InfoNode	bus word info	2008-04-30 09:23:18	2008-05-02 18:14:11	747	\N	\N	748	<h1 name="hlist_name" id="hlist_name" style="color:maroon; margin-botom:8px;">\r\n<%=@node.name%>\r\n</h1>\r\n\r\n<div>\r\n\r\n<div style="float:left; width:45%; margin:10px;">\r\n<%= labeled_node_list "Abbreviations" %>\r\n</div>\r\n\r\n<% \r\n  words = @in_refs.select{|rn| rn.name == "Words"}\r\n  terms = words.collect{|ref| ref.parent}\r\n%>\r\n\r\n<div style="float:left; width:45%; margin:10px;">\r\n<%= labeled_node_list terms, {:label => 'Used In Terms'} %>\r\n</div>\r\n\r\n</div>\r
749	InfoNode	Abbreviations	2008-04-30 09:23:47	2008-05-02 18:14:11	748	\N	\N	749	\N
750	InfoNode	Words	2008-04-30 09:25:51	2008-05-02 18:14:11	735	\N	\N	750	\N
751	InfoNode	bus term info	2008-04-30 09:29:45	2008-05-04 14:09:27	747	\N	\N	751	<h1 style="color:maroon;"><%=@node.name%></h1>\r\n\r\n<div style="float:left; width:30%; margin:10px;">\r\n\t<%= labeled_node_list "Words"%>\r\n</div>\r\n\r\n\r\n<div style="float:left; width:30%; margin:10px;">\r\n\t\r\n<div style=" border:solid 1px black;">\r\n\t<div style="padding:0px 3px 0px 3px; color:white; background:navy; border-bottom:solid 1px black;">\r\n\t\tAttributes\r\n\t</div>\r\n\t<div style="padding:1px 3px 0px 3px; color:black; background:white;">\r\n\t\t<% for attr in @attributes %>\r\n\t\t\t<p style="margin:0px; padding:0px;"><%=attr.name%> : <%=attr.value%></p>\r\n\t\t<% end %>\r\n\t</div>\r\n</div>\r\n\r\n</div>\r\n\r\n\r\n<div style="float:left; width:30%; margin:10px;">\r\n\r\n<%\r\n  words = @node.get_subnodes_of("Words")\r\n  words_nodes = referrers_to(words)\r\n  others = parents_of(words_nodes)\r\n  related_terms = others.delete_if {|node| node == @node}  \r\n%>\r\n\r\n<%= labeled_node_list related_terms, :label => 'Related Terms' %>\r\n\r\n</div>\r\n\r\n<div style="float:right; width:25%; margin-right:30px; margin-top:20px;">\r\n\r\n<h3><%= link_to "All Business Terms", url_show(@node.parent) %></h3>\r\n\r\n<div style="width:100%; padding:4px; background:transparent; border:solid 1px black; height:2in; overflow:auto;">\r\n    <% for item in elements_with_all_tags("is_bus_term").sort{|i1,i2| i1.iname <=> i2.iname} do %>\r\n             <p style="background:transparent; margin:0px 0px 0px 10px;">\r\n             <%= link_to item.iname, :action => 'show_element', :id => item %>\r\n             </p>\r\n    <% end %>\r\n</div>\r\n\r\n</div>\r\n\r\n\r\n<div class="docs" style="float:left; width:65%;">\r\n       <% for doc in @docs do %>\r\n\t\t<div class="view_doc">\r\n\t\t\t<div class="view_doc_name"><%=doc.name%></div>\r\n\t\t\t<div class="view_doc_body"><%=rc_format(doc.body)%></div>\r\n\t\t</div>\r\n\t<% end %>\r\n</div>\r\n\r\n       
752	InfoNode	Words	2008-04-30 09:31:06	2008-05-02 18:14:12	751	\N	\N	752	\N
753	Section	Business Definition	2008-04-30 09:35:17	2008-04-30 09:35:17	751		\N	753	\N
755	Attribute	Approved Acronym	2008-04-30 09:36:29	2008-04-30 23:54:14	751	\N	string	755	\N
756	Section	Comments	2008-04-30 09:37:31	2008-04-30 09:37:31	751		\N	756	\N
757	Attribute	Approved Acronym	2008-04-30 09:38:01	2008-05-01 00:01:32	735	\N	IP	757	\N
759	Section	Business Definition	2008-04-30 09:38:02	2008-04-30 19:36:02	735	A program that has something to do with insurance.  Duh?  :-) \r	\N	759	\N
760	Section	Comments	2008-04-30 09:38:02	2008-05-01 01:09:42	735	Review remarks:\r\n* Seems rather obvious\r\n* Ho hum\r\n* Zzzzzzzzz\r	\N	760	\N
761	Attribute	Corporate Glossary	2008-04-30 09:45:38	2008-04-30 23:54:14	751	\N	boolean	761	\N
762	Attribute	Corporate Glossary	2008-04-30 09:46:25	2008-05-01 00:01:32	735	\N	Yes	762	\N
764	InfoNode	Abbreviations	2008-04-30 12:33:40	2008-05-02 18:14:12	737	\N	\N	764	\N
765	InfoNode	Top	2008-04-30 13:50:46	2008-05-02 18:14:12	\N	\N	\N	765	\N
766	InfoNode	Insurance Policy	2008-04-30 17:07:56	2008-05-02 18:14:12	734	\N	\N	766	\N
767	InfoNode	Insurance Coverage	2008-04-30 17:07:56	2008-05-02 18:14:12	734	\N	\N	767	\N
768	Attribute	Approved Acronym	2008-04-30 17:09:06	2008-04-30 17:09:06	767	\N		768	\N
769	Attribute	Corporate Glossary	2008-04-30 17:09:06	2008-04-30 17:09:06	767	\N		769	\N
770	Section	Business Definition	2008-04-30 17:09:06	2008-04-30 17:09:06	767		\N	770	\N
771	Section	Comments	2008-04-30 17:09:06	2008-04-30 17:09:06	767		\N	771	\N
772	InfoNode	Words	2008-04-30 17:09:06	2008-05-02 18:14:12	767	\N	\N	772	\N
773	Attribute	Approved Acronym	2008-04-30 17:10:03	2008-05-01 00:10:57	766	\N	IPCY	773	\N
774	Attribute	Corporate Glossary	2008-04-30 17:10:04	2008-05-01 00:10:57	766	\N	Yes	774	\N
775	Section	Business Definition	2008-04-30 17:10:04	2008-04-30 17:10:04	766		\N	775	\N
776	Section	Comments	2008-04-30 17:10:04	2008-04-30 17:10:04	766		\N	776	\N
777	InfoNode	Words	2008-04-30 17:10:04	2008-05-02 18:14:12	766	\N	\N	777	\N
778	InfoNode	Coverage	2008-04-30 17:13:55	2008-05-02 18:14:12	744	\N	\N	778	\N
779	InfoNode	Policy	2008-04-30 17:13:55	2008-05-02 18:14:12	744	\N	\N	779	\N
780	InfoNode	Abbreviations	2008-04-30 17:17:19	2008-05-02 18:14:12	779	\N	\N	780	\N
781	InfoNode	Church	2008-04-30 23:03:27	2008-06-26 13:29:20	\N	\N	\N	781	<h2 style="color:maroon;"> Hingham Stake Information Base <h2>\r\n\r\n<div style="color:black;">\r\n\r\n<div style="float:right; margin-right:1%; height:3in; overflow:auto; margin-top:12px; padding:10px; border:solid 1px wheat;">\r\n   <h3> Units</h3>\r\n   <%= table_of_subnodes "Units" %>\r\n</div>\r\n\r\n<div style="float:right; margin-right:1%; height:3in; overflow:auto; margin-top:12px; padding:10px; border:solid 1px wheat;">\r\n   <h3> Action Item Categories</h3>\r\n   <%= table_of_subnodes @node.get_subnodes_of("Action Items") %>\r\n</div>\r\n\r\n<% for view in @sub_nodes.select{ |vn| vn.has_tag?('_is_view') } %>\r\n   <%= link_to "<h3>#{view.iname}</h3>", :id => view %>\r\n<% end %>\r\n\r\n<p class="spacer"><!-- not blank --></p>\r\n\r\n</div>\r
782	InfoNode	Units	2008-05-01 15:16:38	2008-06-26 13:42:58	781	\N	\N	782	\r\n<h3>Units</h3>\r\n\r\n<% for unit in @sub_nodes %>\r\n\r\n   <%= link_to "<h3>#{unit.iname}</h3>", :id => unit %>\r\n\r\n<% end %>\r
783	InfoNode	Action Items	2008-05-01 15:16:38	2008-05-02 18:14:12	781	\N	\N	783	\N
784	InfoNode	People	2008-05-01 15:16:00	2008-07-11 10:30:01	781	\N	\N	784	<h3>Stake and Ward Leadership Members</h3>\r\n\r\n<%= table_of_subnodes @node, :order_by => 'Calling', \r\n:select => ["Name","Calling","Email"] %>\r\n
785	InfoNode	_templates	2008-05-01 15:16:38	2008-05-02 18:14:12	781	\N	\N	785	\N
786	InfoNode	person info	2008-05-01 16:19:10	2008-05-06 22:06:21	785	\N	\N	786	<h2><%= @node.name %></h2>\r\n\r\n<table>\r\n<%= attr_rows_for(@node) %>\r\n</table>\r
787	Attribute	First Name	2008-05-01 16:20:37	2008-05-01 16:20:37	786	\N	string	787	\N
788	Attribute	Last Name	2008-05-01 16:20:37	2008-05-01 16:20:37	786	\N	string	788	\N
791	InfoNode	Fred Wild	2008-05-01 16:24:35	2008-05-02 18:14:12	784	\N	\N	791	\N
792	InfoNode	person list	2008-05-01 16:25:56	2008-05-02 18:14:12	785	\N	\N	792	\N
795	Attribute	Email	2008-05-02 08:43:38	2008-05-02 08:43:47	786	\N	string	795	\N
797	InfoNode	Leif Erickson	2008-05-02 08:44:13	2008-05-02 18:14:12	784	\N	\N	797	\N
801	Attribute	Email	2008-05-02 08:44:54	2008-05-02 19:17:51	791	\N	fredwild@gmail.com	801	\N
802	Attribute	First Name	2008-05-02 08:44:54	2008-05-02 19:17:51	791	\N	Fred	802	\N
803	Attribute	Last Name	2008-05-02 08:44:55	2008-05-02 19:17:51	791	\N	Wild	803	\N
804	Attribute	Email	2008-05-02 08:45:27	2008-05-05 00:55:02	797	\N	president@hinghamstake.org	804	\N
805	Attribute	First Name	2008-05-02 08:45:27	2008-05-05 00:55:02	797	\N	Leif	805	\N
806	Attribute	Last Name	2008-05-02 08:45:27	2008-05-05 00:55:02	797	\N	Erickson	806	\N
807	Attribute	Calling	2008-05-02 09:40:54	2008-05-02 19:17:51	791	\N	Assistant Stake Clerk (finance)	807	\N
808	InfoNode	Tom Badstubner	2008-05-02 15:58:08	2008-05-02 18:14:12	784	\N	\N	808	\N
809	InfoNode	Gregory Moessing	2008-05-02 15:58:08	2008-05-02 18:14:12	784	\N	\N	809	\N
810	Attribute	Email	2008-05-02 15:58:14	2008-05-02 18:28:21	809	\N	gmoessing@netscape.net	810	\N
811	Attribute	First Name	2008-05-02 15:58:14	2008-05-02 18:28:21	809	\N	Greg	811	\N
812	Attribute	Last Name	2008-05-02 15:58:14	2008-05-02 18:28:21	809	\N	Moessing	812	\N
813	Attribute	Phone	2008-05-02 15:59:53	2008-05-02 15:59:53	786	\N	string	813	\N
814	Attribute	Phone	2008-05-02 16:00:05	2008-05-02 18:28:21	809	\N	508-528-4688 	814	\N
815	Attribute	Phone	2008-05-02 16:02:00	2008-05-02 19:17:51	791	\N	401-465-5269	815	\N
816	Attribute	Calling	2008-05-02 16:02:26	2008-05-02 16:02:26	786	\N	string	816	\N
817	InfoNode	Frank Truscott	2008-05-02 16:07:12	2008-05-02 18:14:12	784	\N	\N	817	\N
818	InfoNode	Pavel Kruchek	2008-05-02 16:07:12	2008-06-24 17:21:05	784	\N	\N	818	\N
819	InfoNode	Bart Byerly	2008-05-02 16:07:12	2008-05-02 22:07:17	784	\N	\N	819	<%= what_links_here @node, :label => 'What Links Here' %>\r
820	InfoNode	Kent Andrews	2008-05-02 16:07:12	2008-06-24 17:22:03	784	\N	\N	820	\N
821	InfoNode	Walter Zagieboylo	2008-05-02 16:07:12	2008-05-06 22:05:54	784	\N	\N	821	
822	InfoNode	Chris Doughty	2008-05-02 16:07:12	2008-05-02 18:14:12	784	\N	\N	822	\N
823	InfoNode	Jacob Peterson	2008-05-02 16:07:13	2008-05-02 18:14:12	784	\N	\N	823	\N
824	Attribute	Calling	2008-05-02 16:07:34	2008-05-02 16:10:51	819	\N	Ward Clerk	824	\N
825	Attribute	Email	2008-05-02 16:07:34	2008-05-02 16:10:51	819	\N	bart.byerly@genzyme.com	825	\N
826	Attribute	First Name	2008-05-02 16:07:34	2008-05-02 16:10:51	819	\N	Bart	826	\N
827	Attribute	Last Name	2008-05-02 16:07:35	2008-05-02 16:10:51	819	\N	Byerly	827	\N
828	Attribute	Phone	2008-05-02 16:07:35	2008-05-02 16:10:51	819	\N	508-668-6496	828	\N
829	Attribute	Calling	2008-05-02 16:08:54	2008-05-02 16:10:33	822	\N	Bishopric, 3rd Counselor (YSA)	829	\N
830	Attribute	Email	2008-05-02 16:08:55	2008-05-02 16:10:33	822	\N	cgdoughty@aol.com	830	\N
831	Attribute	First Name	2008-05-02 16:08:55	2008-05-02 16:10:33	822	\N	Chris	831	\N
832	Attribute	Last Name	2008-05-02 16:08:55	2008-05-02 16:10:33	822	\N	Doughty	832	\N
833	Attribute	Phone	2008-05-02 16:08:55	2008-05-02 16:10:33	822	\N	508-883-8781	833	\N
834	InfoNode	John Hodurski	2008-05-02 16:10:34	2008-05-02 18:14:12	784	\N	\N	834	\N
835	InfoNode	Michael Sugarman	2008-05-02 16:10:35	2008-05-02 18:14:12	784	\N	\N	835	\N
836	InfoNode	John Biega	2008-05-02 16:10:35	2008-05-02 18:14:12	784	\N	\N	836	\N
837	InfoNode	Doug Corb	2008-05-02 16:10:35	2008-05-02 18:14:12	784	\N	\N	837	\N
838	Attribute	Calling	2008-05-02 16:11:05	2008-05-02 16:21:57	837	\N	Branch Clerk	838	\N
839	Attribute	Email	2008-05-02 16:11:05	2008-05-02 16:21:57	837	\N	corb.doug@epa.gov	839	\N
840	Attribute	First Name	2008-05-02 16:11:05	2008-05-02 16:21:57	837	\N	Doug	840	\N
841	Attribute	Last Name	2008-05-02 16:11:05	2008-05-02 16:21:57	837	\N	Corb	841	\N
842	Attribute	Phone	2008-05-02 16:11:06	2008-05-02 16:21:57	837	\N	508-432-4956 	842	\N
843	Attribute	Calling	2008-05-02 16:11:42	2008-05-02 16:12:51	817	\N	Bishopric, 2nd Counselor	843	\N
844	Attribute	Email	2008-05-02 16:11:42	2008-05-02 16:12:51	817	\N	frank.truscott@iai.com	844	\N
845	Attribute	First Name	2008-05-02 16:11:42	2008-05-02 16:12:51	817	\N	Frank	845	\N
846	Attribute	Last Name	2008-05-02 16:11:42	2008-05-02 16:12:51	817	\N	Truscott	846	\N
847	Attribute	Phone	2008-05-02 16:11:42	2008-05-02 16:12:51	817	\N	508-735-2577	847	\N
848	Attribute	Calling	2008-05-02 16:13:10	2008-05-02 16:15:34	820	\N	Assistant Ward Clerk (membership)	848	\N
849	Attribute	Email	2008-05-02 16:13:10	2008-05-02 16:15:34	820	\N	kanda97@aol.com	849	\N
850	Attribute	First Name	2008-05-02 16:13:10	2008-05-02 16:15:35	820	\N	Kent	850	\N
851	Attribute	Last Name	2008-05-02 16:13:10	2008-05-02 16:15:35	820	\N	Andrews	851	\N
852	Attribute	Phone	2008-05-02 16:13:10	2008-05-02 16:15:35	820	\N	508-384-0049	852	\N
853	InfoNode	Paul Spencer	2008-05-02 16:13:27	2008-05-02 18:14:12	784	\N	\N	853	\N
854	Attribute	Calling	2008-05-02 16:13:31	2008-05-02 16:14:18	818	\N	Ward Executive Secretary	854	\N
855	Attribute	Email	2008-05-02 16:13:31	2008-05-02 16:14:19	818	\N	pkexecsec@gmail.com	855	\N
856	Attribute	First Name	2008-05-02 16:13:31	2008-05-02 16:14:19	818	\N	Pavel	856	\N
857	Attribute	Last Name	2008-05-02 16:13:31	2008-05-02 16:14:19	818	\N	Kruchek	857	\N
858	Attribute	Phone	2008-05-02 16:13:31	2008-05-02 16:14:19	818	\N	508-528-1160	858	\N
859	Attribute	Calling	2008-05-02 16:14:23	2008-05-02 16:17:48	834	\N	Branch Presidency, 1st Counselor:	859	\N
860	Attribute	Email	2008-05-02 16:14:23	2008-05-02 16:17:48	834	\N	jahodo@gis.net	860	\N
861	Attribute	First Name	2008-05-02 16:14:23	2008-05-02 16:17:48	834	\N	John	861	\N
862	Attribute	Last Name	2008-05-02 16:14:23	2008-05-02 16:17:48	834	\N	Hodurski	862	\N
863	Attribute	Phone	2008-05-02 16:14:23	2008-05-02 16:17:48	834	\N	508-394-0413	863	\N
864	Attribute	Calling	2008-05-02 16:16:08	2008-05-02 16:17:12	821	\N	Assistant Ward Clerk (finance)	864	\N
865	Attribute	Email	2008-05-02 16:16:08	2008-05-02 16:17:12	821	\N	wzagieboylo@msn.com	865	\N
866	Attribute	First Name	2008-05-02 16:16:09	2008-05-02 16:17:12	821	\N	Walter	866	\N
867	Attribute	Last Name	2008-05-02 16:16:09	2008-05-02 16:17:12	821	\N	Zagieboylo	867	\N
868	Attribute	Phone	2008-05-02 16:16:09	2008-05-02 16:17:12	821	\N	508-520-8760	868	\N
869	Attribute	Calling	2008-05-02 16:17:39	2008-05-02 16:18:26	823	\N	YSA Executive Secretary	869	\N
870	Attribute	Email	2008-05-02 16:17:40	2008-05-02 16:18:26	823	\N	japeterson@deloitte.com	870	\N
871	Attribute	First Name	2008-05-02 16:17:40	2008-05-02 16:18:26	823	\N	Jacob	871	\N
872	Attribute	Last Name	2008-05-02 16:17:40	2008-05-02 16:18:26	823	\N	Peterson	872	\N
873	Attribute	Phone	2008-05-02 16:17:40	2008-05-02 16:18:26	823	\N		873	\N
874	Attribute	Calling	2008-05-02 16:18:12	2008-05-02 16:18:53	835	\N	Branch Presidency, 2nd Counselor	874	\N
875	Attribute	Email	2008-05-02 16:18:13	2008-05-02 16:18:53	835	\N		875	\N
876	Attribute	First Name	2008-05-02 16:18:13	2008-05-02 16:18:53	835	\N	Micheal	876	\N
877	Attribute	Last Name	2008-05-02 16:18:13	2008-05-02 16:18:53	835	\N	Sugarman	877	\N
878	Attribute	Phone	2008-05-02 16:18:13	2008-05-02 16:18:53	835	\N	508-398-5298 	878	\N
879	Attribute	Calling	2008-05-02 16:19:19	2008-05-02 16:20:37	836	\N	Branch Executive Secretary:	879	\N
880	Attribute	Email	2008-05-02 16:19:19	2008-05-02 16:20:37	836	\N		880	\N
881	Attribute	First Name	2008-05-02 16:19:19	2008-05-02 16:20:37	836	\N	John	881	\N
882	Attribute	Last Name	2008-05-02 16:19:19	2008-05-02 16:20:37	836	\N	Biega	882	\N
883	Attribute	Phone	2008-05-02 16:19:19	2008-05-02 16:20:37	836	\N	(508) 398-5065	883	\N
884	InfoNode	Jim Powell	2008-05-02 16:21:08	2008-05-02 18:14:12	784	\N	\N	884	\N
885	InfoNode	Izaias Filho Silva	2008-05-02 16:21:08	2008-05-02 18:14:12	784	\N	\N	885	\N
886	InfoNode	Chad Card	2008-05-02 16:21:08	2008-05-02 18:14:12	784	\N	\N	886	\N
887	Attribute	Calling	2008-05-02 16:21:19	2008-06-24 17:28:57	886	\N	Branch Presidency, 1st Counselor	887	\N
888	Attribute	Email	2008-05-02 16:21:19	2008-06-24 17:28:57	886	\N	capocard33@yahoo.com	888	\N
889	Attribute	First Name	2008-05-02 16:21:19	2008-06-24 17:28:57	886	\N	Chad	889	\N
890	Attribute	Last Name	2008-05-02 16:21:20	2008-06-24 17:28:57	886	\N	Card	890	\N
891	Attribute	Phone	2008-05-02 16:21:20	2008-06-24 17:28:57	886	\N	774-563-8611 	891	\N
892	Attribute	Calling	2008-05-02 16:21:34	2008-06-24 17:29:35	884	\N	Branch Presidency, 2nd Counselor	892	\N
893	Attribute	Email	2008-05-02 16:21:34	2008-06-24 17:29:35	884	\N	OldMayhewFarm@gmail.com	893	\N
894	Attribute	First Name	2008-05-02 16:21:34	2008-06-24 17:29:35	884	\N	Jim	894	\N
895	Attribute	Last Name	2008-05-02 16:21:34	2008-06-24 17:29:35	884	\N	Powell	895	\N
896	Attribute	Phone	2008-05-02 16:21:34	2008-06-24 17:29:35	884	\N	508 696-1959	896	\N
897	Attribute	Calling	2008-05-02 16:22:19	2008-05-02 18:22:07	853	\N	Assistant Branch Clerk	897	\N
898	Attribute	Email	2008-05-02 16:22:19	2008-05-02 18:22:07	853	\N	paulspencerlds@yahoo.com	898	\N
899	Attribute	First Name	2008-05-02 16:22:19	2008-05-02 18:22:07	853	\N	Paul	899	\N
900	Attribute	Last Name	2008-05-02 16:22:20	2008-05-02 18:22:07	853	\N	Spencer	900	\N
901	Attribute	Phone	2008-05-02 16:22:20	2008-05-02 18:22:07	853	\N	508-534-9477 	901	\N
902	Attribute	Calling	2008-05-02 16:23:03	2008-06-24 17:28:17	885	\N		902	\N
903	Attribute	Email	2008-05-02 16:23:03	2008-06-24 17:28:17	885	\N		903	\N
904	Attribute	First Name	2008-05-02 16:23:03	2008-06-24 17:28:17	885	\N	Izaias	904	\N
905	Attribute	Last Name	2008-05-02 16:23:03	2008-06-24 17:28:17	885	\N	Silva	905	\N
906	Attribute	Phone	2008-05-02 16:23:03	2008-06-24 17:28:17	885	\N	508-696-9557	906	\N
907	InfoNode	Allen Mervin Endicott	2008-05-02 16:28:00	2008-05-02 18:14:12	784	\N	\N	907	\N
908	InfoNode	Michael Lewis	2008-05-02 16:28:00	2008-05-02 18:14:12	784	\N	\N	908	\N
909	InfoNode	Richard Lynn Rice	2008-05-02 16:28:00	2008-05-02 18:14:12	784	\N	\N	909	\N
910	InfoNode	Michael Scott Kuhn	2008-05-02 16:28:01	2008-05-02 18:14:12	784	\N	\N	910	\N
911	InfoNode	Brian James Behunin	2008-05-02 16:28:01	2008-05-02 18:14:12	784	\N	\N	911	\N
912	InfoNode	Gordon Laws	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	912	\N
913	InfoNode	Dan Camara	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	913	\N
914	InfoNode	Paul Leitch	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	914	\N
915	InfoNode	Keith Berry	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	915	\N
916	InfoNode	Charlie Hocking	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	916	\N
917	InfoNode	Paul Corkum	2008-05-02 16:28:07	2008-05-02 18:14:12	784	\N	\N	917	\N
918	InfoNode	Tom Flanagan	2008-05-02 16:28:08	2008-05-02 18:14:12	784	\N	\N	918	\N
919	Attribute	Calling	2008-05-02 16:28:23	2008-05-02 16:30:33	907	\N	Bishop	919	\N
920	Attribute	Email	2008-05-02 16:28:23	2008-05-02 16:30:33	907	\N	bsafam@gmail.com	920	\N
921	Attribute	First Name	2008-05-02 16:28:23	2008-05-02 16:30:33	907	\N	Allen	921	\N
922	Attribute	Last Name	2008-05-02 16:28:23	2008-05-02 16:30:33	907	\N	Endicott	922	\N
923	Attribute	Phone	2008-05-02 16:28:23	2008-05-02 16:30:33	907	\N	508-946-0511 	923	\N
924	Attribute	Calling	2008-05-02 16:28:33	2008-06-25 11:26:33	912	\N	Bishop	924	\N
925	Attribute	Email	2008-05-02 16:28:33	2008-06-25 11:26:33	912	\N	daaak@comcast.net	925	\N
926	Attribute	First Name	2008-05-02 16:28:33	2008-06-25 11:26:33	912	\N	Gordon	926	\N
927	Attribute	Last Name	2008-05-02 16:28:33	2008-06-25 11:26:33	912	\N	Laws	927	\N
928	Attribute	Phone	2008-05-02 16:28:33	2008-06-25 11:26:33	912	\N	508-697-6035	928	\N
929	Attribute	Calling	2008-05-02 16:29:19	2008-05-02 16:30:11	913	\N	Bishopric, 1st Counselor	929	\N
930	Attribute	Email	2008-05-02 16:29:19	2008-05-02 16:30:11	913	\N	daaak@comcast.net	930	\N
931	Attribute	First Name	2008-05-02 16:29:19	2008-05-02 16:30:11	913	\N	Dan	931	\N
932	Attribute	Last Name	2008-05-02 16:29:20	2008-05-02 16:30:11	913	\N	Camara	932	\N
933	Attribute	Phone	2008-05-02 16:29:20	2008-05-02 16:30:11	913	\N	508-279-8009	933	\N
934	Attribute	Calling	2008-05-02 16:30:38	2008-05-02 16:31:42	914	\N	Bishopric, 2nd Counselor	934	\N
935	Attribute	Email	2008-05-02 16:30:38	2008-05-02 16:31:42	914	\N	PaulLeitch_@msn.com	935	\N
936	Attribute	First Name	2008-05-02 16:30:38	2008-05-02 16:31:42	914	\N	Paul	936	\N
937	Attribute	Last Name	2008-05-02 16:30:38	2008-05-02 16:31:42	914	\N	Leitch	937	\N
938	Attribute	Phone	2008-05-02 16:30:38	2008-05-02 16:31:42	914	\N	781-447-4576	938	\N
939	Attribute	Calling	2008-05-02 16:30:56	2008-06-24 17:01:03	908	\N		939	\N
940	Attribute	Email	2008-05-02 16:30:56	2008-06-24 17:01:03	908	\N	michael_lewis@gillette.com	940	\N
941	Attribute	First Name	2008-05-02 16:30:57	2008-06-24 17:01:03	908	\N	Michael	941	\N
942	Attribute	Last Name	2008-05-02 16:30:57	2008-06-24 17:01:03	908	\N	Lewis	942	\N
943	Attribute	Phone	2008-05-02 16:30:57	2008-06-24 17:01:03	908	\N	508-833-2858 	943	\N
944	Attribute	Calling	2008-05-02 16:32:01	2008-05-02 16:32:58	915	\N	Ward Executive Secretary	944	\N
945	Attribute	Email	2008-05-02 16:32:01	2008-05-02 16:32:58	915	\N	info@berryphotos.com	945	\N
946	Attribute	First Name	2008-05-02 16:32:01	2008-05-02 16:32:58	915	\N	Keith	946	\N
947	Attribute	Last Name	2008-05-02 16:32:01	2008-05-02 16:32:58	915	\N	Berry	947	\N
948	Attribute	Phone	2008-05-02 16:32:01	2008-05-02 16:32:58	915	\N	508-697-4631	948	\N
949	Attribute	Calling	2008-05-02 16:32:44	2008-05-02 16:34:09	909	\N	Bishopric, 2nd Counselor	949	\N
950	Attribute	Email	2008-05-02 16:32:44	2008-05-02 16:34:09	909	\N	ricerichardl@verizon.net	950	\N
951	Attribute	First Name	2008-05-02 16:32:44	2008-05-02 16:34:09	909	\N	Richard	951	\N
952	Attribute	Last Name	2008-05-02 16:32:44	2008-05-02 16:34:09	909	\N	Rice	952	\N
953	Attribute	Phone	2008-05-02 16:32:44	2008-05-02 16:34:09	909	\N	508-759-1715 	953	\N
954	Attribute	Calling	2008-05-02 16:33:20	2008-05-02 16:34:13	916	\N	Ward Clerk	954	\N
955	Attribute	Email	2008-05-02 16:33:20	2008-05-02 16:34:13	916	\N	c.hocking@comcast.net	955	\N
956	Attribute	First Name	2008-05-02 16:33:21	2008-05-02 16:34:13	916	\N	Charlie	956	\N
957	Attribute	Last Name	2008-05-02 16:33:21	2008-05-02 16:34:13	916	\N	Hocking	957	\N
958	Attribute	Phone	2008-05-02 16:33:21	2008-05-02 16:34:13	916	\N	508-823-7470	958	\N
959	Attribute	Calling	2008-05-02 16:34:29	2008-05-02 16:35:22	917	\N	Assistant Ward Clerk (membership)	959	\N
960	Attribute	Email	2008-05-02 16:34:30	2008-05-02 16:35:22	917	\N	phcorkum@juno.com	960	\N
961	Attribute	First Name	2008-05-02 16:34:30	2008-05-02 16:35:22	917	\N	Paul	961	\N
962	Attribute	Last Name	2008-05-02 16:34:30	2008-05-02 16:35:22	917	\N	Corkum	962	\N
963	Attribute	Phone	2008-05-02 16:34:30	2008-05-02 16:35:22	917	\N	781-982-4323	963	\N
964	Attribute	Calling	2008-05-02 16:34:38	2008-05-02 16:37:26	910	\N	Ward Executive Secretary	964	\N
965	Attribute	Email	2008-05-02 16:34:38	2008-05-02 16:37:26	910	\N	mskuhn@adelphia.net	965	\N
966	Attribute	First Name	2008-05-02 16:34:38	2008-05-02 16:37:26	910	\N	Michael	966	\N
967	Attribute	Last Name	2008-05-02 16:34:38	2008-05-02 16:37:26	910	\N	Kuhn	967	\N
968	Attribute	Phone	2008-05-02 16:34:39	2008-05-02 16:37:26	910	\N	508-224-5894	968	\N
969	Attribute	Calling	2008-05-02 16:35:41	2008-05-02 16:36:39	918	\N	Assistant Ward Clerk (finance)	969	\N
970	Attribute	Email	2008-05-02 16:35:41	2008-05-02 16:36:39	918	\N	tom-flanagan@comcast.net	970	\N
971	Attribute	First Name	2008-05-02 16:35:41	2008-05-02 16:36:39	918	\N	Tom	971	\N
972	Attribute	Last Name	2008-05-02 16:35:42	2008-05-02 16:36:39	918	\N	Flanagan	972	\N
973	Attribute	Phone	2008-05-02 16:35:42	2008-05-02 16:36:39	918	\N	508-587-6684	973	\N
974	Attribute	Calling	2008-05-02 16:38:45	2008-05-02 16:40:21	911	\N	Ward Clerk	974	\N
975	Attribute	Email	2008-05-02 16:38:45	2008-05-02 16:40:21	911	\N		975	\N
976	Attribute	First Name	2008-05-02 16:38:45	2008-05-02 16:40:21	911	\N	Brian	976	\N
977	Attribute	Last Name	2008-05-02 16:38:45	2008-05-02 16:40:21	911	\N	Behunin	977	\N
978	Attribute	Phone	2008-05-02 16:38:45	2008-05-02 16:40:21	911	\N	774-238-6800 	978	\N
979	InfoNode	Adilson Rolando Pina	2008-05-02 16:38:52	2008-05-02 18:14:12	784	\N	\N	979	\N
980	InfoNode	Anacleto Pina Tavares	2008-05-02 16:38:52	2008-05-02 18:14:12	784	\N	\N	980	\N
981	InfoNode	Tomas Garcia Andrade	2008-05-02 16:38:52	2008-05-02 18:14:12	784	\N	\N	981	\N
982	InfoNode	Evandro Manuel Semedo	2008-05-02 16:38:52	2008-05-02 18:14:12	784	\N	\N	982	\N
983	Attribute	Calling	2008-05-02 16:39:06	2008-06-25 11:22:52	979	\N	Branch President	983	\N
984	Attribute	Email	2008-05-02 16:39:06	2008-06-25 11:22:52	979	\N	anacletotavares6@hotmail.com	984	\N
985	Attribute	First Name	2008-05-02 16:39:06	2008-06-25 11:22:52	979	\N	Adilson	985	\N
986	Attribute	Last Name	2008-05-02 16:39:06	2008-06-25 11:22:52	979	\N	Pina	986	\N
987	Attribute	Phone	2008-05-02 16:39:06	2008-06-25 11:22:53	979	\N	508-583-5772 	987	\N
988	Attribute	Calling	2008-05-02 16:40:26	2008-05-02 16:41:15	980	\N	Branch Presidency, 1st Counselor	988	\N
989	Attribute	Email	2008-05-02 16:40:26	2008-05-02 16:41:16	980	\N	anacletotavares6@hotmail.com	989	\N
990	Attribute	First Name	2008-05-02 16:40:26	2008-05-02 16:41:16	980	\N	Anacleto	990	\N
991	Attribute	Last Name	2008-05-02 16:40:27	2008-05-02 16:41:16	980	\N	Tavares	991	\N
992	Attribute	Phone	2008-05-02 16:40:27	2008-05-02 16:41:16	980	\N	508-559-8922 	992	\N
993	Attribute	Calling	2008-05-02 16:41:35	2008-05-02 16:42:17	981	\N	Branch Presidency, 2nd Counselor	993	\N
994	Attribute	Email	2008-05-02 16:41:35	2008-05-02 16:42:17	981	\N		994	\N
995	Attribute	First Name	2008-05-02 16:41:36	2008-05-02 16:42:17	981	\N	Tomas	995	\N
996	Attribute	Last Name	2008-05-02 16:41:36	2008-05-02 16:42:17	981	\N	Andrade	996	\N
997	Attribute	Phone	2008-05-02 16:41:36	2008-05-02 16:42:18	981	\N	508-586-1242	997	\N
998	Attribute	Calling	2008-05-02 16:42:43	2008-05-02 16:43:24	982	\N	Branch Clerk	998	\N
999	Attribute	Email	2008-05-02 16:42:44	2008-05-02 16:43:24	982	\N		999	\N
1000	Attribute	First Name	2008-05-02 16:42:44	2008-05-02 16:43:24	982	\N	Evandro	1000	\N
1001	Attribute	Last Name	2008-05-02 16:42:44	2008-05-02 16:43:24	982	\N	Semedo	1001	\N
1002	Attribute	Phone	2008-05-02 16:42:44	2008-05-02 16:43:24	982	\N	508-580-7763	1002	\N
1003	InfoNode	Mark Small	2008-05-02 16:45:18	2008-05-02 18:14:12	784	\N	\N	1003	\N
1004	InfoNode	Joe Giles	2008-05-02 16:45:18	2008-05-02 18:14:12	784	\N	\N	1004	\N
1005	InfoNode	Jesse Hansen	2008-05-02 16:45:18	2008-05-02 18:14:12	784	\N	\N	1005	\N
1006	InfoNode	Dan Rogers	2008-05-02 16:45:18	2008-05-02 18:14:12	784	\N	\N	1006	\N
1007	InfoNode	Jim Peterson	2008-05-02 16:45:19	2008-05-02 18:14:12	784	\N	\N	1007	\N
1008	InfoNode	Bill Pellegrini	2008-05-02 16:45:19	2008-05-02 18:14:13	784	\N	\N	1008	\N
1009	InfoNode	Robert Arthur Randall	2008-05-02 16:45:19	2008-05-02 18:14:13	784	\N	\N	1009	\N
1010	InfoNode	Lon Cook	2008-05-02 16:45:33	2008-05-02 18:14:13	784	\N	\N	1010	\N
1011	InfoNode	Thomas Armitage	2008-05-02 16:45:33	2008-05-02 18:14:13	784	\N	\N	1011	\N
1012	InfoNode	Randy Davis	2008-05-02 16:45:33	2008-05-02 18:14:13	784	\N	\N	1012	\N
1013	InfoNode	Jim Calkins	2008-05-02 16:45:34	2008-05-02 18:14:13	784	\N	\N	1013	\N
1014	InfoNode	Roy Chace	2008-05-02 16:45:34	2008-05-02 18:14:13	784	\N	\N	1014	\N
1015	InfoNode	Edward John Silvia	2008-05-02 16:45:34	2008-05-02 18:14:13	784	\N	\N	1015	\N
1016	Attribute	Calling	2008-05-02 16:45:50	2008-05-02 16:46:38	1010	\N	Branch President	1016	\N
1017	Attribute	Email	2008-05-02 16:45:50	2008-05-02 16:46:38	1010	\N	cookad@yahoo.com	1017	\N
1018	Attribute	First Name	2008-05-02 16:45:51	2008-05-02 16:46:38	1010	\N	Lon	1018	\N
1019	Attribute	Last Name	2008-05-02 16:45:51	2008-05-02 16:46:38	1010	\N	Cook	1019	\N
1020	Attribute	Phone	2008-05-02 16:45:51	2008-05-02 16:46:38	1010	\N	508-947-6580 	1020	\N
1021	Attribute	Calling	2008-05-02 16:46:08	2008-05-02 16:47:40	1003	\N	Bishop	1021	\N
1022	Attribute	Email	2008-05-02 16:46:08	2008-05-02 16:47:40	1003	\N	mark.small6@verizon.net	1022	\N
1023	Attribute	First Name	2008-05-02 16:46:08	2008-05-02 16:47:40	1003	\N	Mark	1023	\N
1024	Attribute	Last Name	2008-05-02 16:46:08	2008-05-02 16:47:40	1003	\N	Small	1024	\N
1025	Attribute	Phone	2008-05-02 16:46:09	2008-05-02 16:47:40	1003	\N	508-543-0428 	1025	\N
1026	Attribute	Calling	2008-05-02 16:47:00	2008-05-02 16:47:48	1011	\N	Branch Presidency, 1st Counselor	1026	\N
1027	Attribute	Email	2008-05-02 16:47:00	2008-05-02 16:47:48	1011	\N	thmsarmtg@aol.com	1027	\N
1028	Attribute	First Name	2008-05-02 16:47:01	2008-05-02 16:47:48	1011	\N	Thomas	1028	\N
1029	Attribute	Last Name	2008-05-02 16:47:01	2008-05-02 16:47:48	1011	\N	Armitage	1029	\N
1030	Attribute	Phone	2008-05-02 16:47:01	2008-05-02 16:47:48	1011	\N	508-326 3608	1030	\N
1031	Attribute	Calling	2008-05-02 16:48:12	2008-06-24 17:06:38	1012	\N		1031	\N
1032	Attribute	Email	2008-05-02 16:48:13	2008-06-24 17:06:38	1012	\N	dadoluke@gmail.com	1032	\N
1033	Attribute	First Name	2008-05-02 16:48:13	2008-06-24 17:06:38	1012	\N	Randy	1033	\N
1034	Attribute	Last Name	2008-05-02 16:48:13	2008-06-24 17:06:38	1012	\N	Davis	1034	\N
1035	Attribute	Phone	2008-05-02 16:48:13	2008-06-24 17:06:38	1012	\N	508-252-4992 	1035	\N
1036	Attribute	Calling	2008-05-02 16:48:25	2008-05-02 16:49:43	1004	\N	Bishopric, 1st Counselor	1036	\N
1037	Attribute	Email	2008-05-02 16:48:25	2008-05-02 16:49:43	1004	\N	joegiles2@yahoo.com	1037	\N
1038	Attribute	First Name	2008-05-02 16:48:25	2008-05-02 16:49:43	1004	\N	Joe	1038	\N
1039	Attribute	Last Name	2008-05-02 16:48:25	2008-05-02 16:49:43	1004	\N	Giles	1039	\N
1040	Attribute	Phone	2008-05-02 16:48:25	2008-05-02 16:49:43	1004	\N	508 409 2122 	1040	\N
1041	Attribute	Calling	2008-05-02 16:49:36	2008-05-02 16:50:18	1013	\N	Branch Executive Secretary	1041	\N
1042	Attribute	Email	2008-05-02 16:49:36	2008-05-02 16:50:18	1013	\N	jcalkins@detma.org	1042	\N
1043	Attribute	First Name	2008-05-02 16:49:37	2008-05-02 16:50:18	1013	\N	Jim	1043	\N
1044	Attribute	Last Name	2008-05-02 16:49:37	2008-05-02 16:50:18	1013	\N	Calkins	1044	\N
1045	Attribute	Phone	2008-05-02 16:49:37	2008-05-02 16:50:18	1013	\N	508-672-5682	1045	\N
1046	Attribute	Calling	2008-05-02 16:50:40	2008-05-02 16:51:56	1005	\N	Bishopric, 2nd Counselor:	1046	\N
1047	Attribute	Email	2008-05-02 16:50:40	2008-05-02 16:51:56	1005	\N	jesseohansen@yahoo.com	1047	\N
1048	Attribute	First Name	2008-05-02 16:50:40	2008-05-02 16:51:56	1005	\N	Jesse	1048	\N
1049	Attribute	Last Name	2008-05-02 16:50:40	2008-05-02 16:51:56	1005	\N	Hansen	1049	\N
1050	Attribute	Phone	2008-05-02 16:50:40	2008-05-02 16:51:56	1005	\N	508-455-0157	1050	\N
1051	Attribute	Calling	2008-05-02 16:50:42	2008-05-02 16:51:33	1014	\N	Branch Clerk	1051	\N
1052	Attribute	Email	2008-05-02 16:50:43	2008-05-02 16:51:33	1014	\N	rgc8146@aol.com	1052	\N
1053	Attribute	First Name	2008-05-02 16:50:43	2008-05-02 16:51:33	1014	\N	Roy 	1053	\N
1054	Attribute	Last Name	2008-05-02 16:50:43	2008-05-02 16:51:33	1014	\N	Chace	1054	\N
1055	Attribute	Phone	2008-05-02 16:50:43	2008-05-02 16:51:33	1014	\N	508-679-0955	1055	\N
1056	Attribute	Calling	2008-05-02 16:52:00	2008-05-02 16:52:37	1015	\N	Assistant Branch Clerk (finance)	1056	\N
1057	Attribute	Email	2008-05-02 16:52:00	2008-05-02 16:52:37	1015	\N		1057	\N
1058	Attribute	First Name	2008-05-02 16:52:00	2008-05-02 16:52:37	1015	\N	Edward	1058	\N
1059	Attribute	Last Name	2008-05-02 16:52:00	2008-05-02 16:52:37	1015	\N	Silvia	1059	\N
1060	Attribute	Phone	2008-05-02 16:52:01	2008-05-02 16:52:38	1015	\N	508-824-7415	1060	\N
1061	Attribute	Calling	2008-05-02 16:52:15	2008-05-04 15:01:01	1006	\N	Ward Executive Secretary	1061	\N
1062	Attribute	Email	2008-05-02 16:52:15	2008-05-04 15:01:01	1006	\N	usafe7ret@gmail.com	1062	\N
1063	Attribute	First Name	2008-05-02 16:52:15	2008-05-04 15:01:01	1006	\N	Dan	1063	\N
1064	Attribute	Last Name	2008-05-02 16:52:16	2008-05-04 15:01:01	1006	\N	Rogers	1064	\N
1065	Attribute	Phone	2008-05-02 16:52:16	2008-05-04 15:01:01	1006	\N	508-643-9103 	1065	\N
1066	Attribute	Calling	2008-05-02 16:54:52	2008-05-02 16:55:56	1007	\N	Ward Clerk	1066	\N
1067	Attribute	Email	2008-05-02 16:54:52	2008-05-02 16:55:56	1007	\N	barbarapeterson43@attbi.com	1067	\N
1068	Attribute	First Name	2008-05-02 16:54:53	2008-05-02 16:55:56	1007	\N	Jim 	1068	\N
1069	Attribute	Last Name	2008-05-02 16:54:53	2008-05-02 16:55:56	1007	\N	Peterson	1069	\N
1070	Attribute	Phone	2008-05-02 16:54:53	2008-05-02 16:55:56	1007	\N	508-226-7080 	1070	\N
1071	InfoNode	Franklin	2008-05-02 16:54:59	2008-05-02 18:14:13	782	\N	\N	1071	\N
1072	Attribute	Calling	2008-05-02 16:56:16	2008-05-02 16:57:17	1008	\N	Assistant Ward Clerk (membership)	1072	\N
1073	Attribute	Email	2008-05-02 16:56:16	2008-05-02 16:57:17	1008	\N	billpellegrini@yahoo.com	1073	\N
1074	Attribute	First Name	2008-05-02 16:56:16	2008-05-02 16:57:17	1008	\N	Bill	1074	\N
1075	Attribute	Last Name	2008-05-02 16:56:16	2008-05-02 16:57:17	1008	\N	Pellegrini	1075	\N
1076	Attribute	Phone	2008-05-02 16:56:16	2008-05-02 16:57:17	1008	\N	508 406 5319 	1076	\N
1077	Attribute	Calling	2008-05-02 16:57:47	2008-05-02 16:58:41	1009	\N	Assistant Ward Clerk (finance)	1077	\N
1078	Attribute	Email	2008-05-02 16:57:48	2008-05-02 16:58:41	1009	\N		1078	\N
1079	Attribute	First Name	2008-05-02 16:57:48	2008-05-02 16:58:41	1009	\N	Robert	1079	\N
1080	Attribute	Last Name	2008-05-02 16:57:48	2008-05-02 16:58:41	1009	\N	Randall	1080	\N
1081	Attribute	Phone	2008-05-02 16:57:48	2008-05-02 16:58:41	1009	\N	508-643-7075 	1081	\N
1082	InfoNode	unit info	2008-05-02 17:00:51	2008-06-25 23:12:22	785	\N	\N	1082	\r\n\r\n      <h3>Leadership</h3>\r\n      <%= table_of_subnodes @node.get_subnode_by_name("Leadership") , :order_by => 'Calling' %>\r\n\r\n      <h3>Missionaries In</h3>\r\n      <%= table_of_subnodes @node.get_subnode_by_name("Missionaries In") %>\r\n\r\n      <h3>Missionaries Out</h3>\r\n      <%= table_of_subnodes @node.get_subnode_by_name("Missionaries Out") %>\r
1083	InfoNode	John Zeller	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1083	\N
1084	InfoNode	Bruce Germinaro	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1084	\N
1085	InfoNode	Ryan Alton Esco	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1085	\N
1086	InfoNode	Benjamin J Cook	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1086	\N
1087	InfoNode	Cody Harward	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1087	\N
1088	InfoNode	Mark Harrop	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1088	\N
1089	InfoNode	Chris Kelson	2008-05-02 17:01:55	2008-05-02 18:14:13	784	\N	\N	1089	\N
1091	InfoNode	Brad Bennion	2008-05-02 17:02:01	2008-05-02 18:14:13	784	\N	\N	1091	\N
1092	InfoNode	Leadership	2008-05-02 17:03:05	2008-05-02 18:14:13	1082	\N	\N	1092	\N
1093	InfoNode	Missionaries Out	2008-05-02 17:03:05	2008-05-02 18:14:13	1082	\N	\N	1093	\N
1094	InfoNode	Missionaries In	2008-05-02 17:03:05	2008-05-02 18:14:13	1082	\N	\N	1094	\N
1095	Attribute	Calling	2008-05-02 17:03:06	2008-05-02 17:04:06	1083	\N	Bishop	1095	\N
1096	Attribute	Email	2008-05-02 17:03:06	2008-05-02 17:04:06	1083	\N	zeller101@verizon.net	1096	\N
1097	Attribute	First Name	2008-05-02 17:03:06	2008-05-02 17:04:06	1083	\N	John	1097	\N
1098	Attribute	Last Name	2008-05-02 17:03:06	2008-05-02 17:04:06	1083	\N	Zeller	1098	\N
1099	Attribute	Phone	2008-05-02 17:03:06	2008-05-02 17:04:06	1083	\N	781-834-6447 	1099	\N
1100	InfoNode	Foxboro	2008-05-02 17:03:37	2008-05-02 18:14:13	782	\N	\N	1100	\N
1101	Attribute	Calling	2008-05-02 17:04:57	2008-05-02 17:07:04	1084	\N	Bishopric, 1st Counselor	1101	\N
1102	Attribute	Email	2008-05-02 17:04:57	2008-05-02 17:07:04	1084	\N	Bcm6210@aol.com	1102	\N
1103	Attribute	First Name	2008-05-02 17:04:57	2008-05-02 17:07:04	1084	\N	Bruce	1103	\N
1104	Attribute	Last Name	2008-05-02 17:04:57	2008-05-02 17:07:05	1084	\N	Germinaro	1104	\N
1105	Attribute	Phone	2008-05-02 17:04:58	2008-05-02 17:07:05	1084	\N	781-585-2629 	1105	\N
1106	Attribute	Calling	2008-05-02 17:07:55	2008-05-02 17:08:59	1085	\N	Bishopric, 2nd Counselor	1106	\N
1107	Attribute	Email	2008-05-02 17:07:55	2008-05-02 17:08:59	1085	\N		1107	\N
1108	Attribute	First Name	2008-05-02 17:07:55	2008-05-02 17:08:59	1085	\N	Ryan	1108	\N
1109	Attribute	Last Name	2008-05-02 17:07:55	2008-05-02 17:08:59	1085	\N	Esco	1109	\N
1110	Attribute	Phone	2008-05-02 17:07:56	2008-05-02 17:08:59	1085	\N	781-740-4894 	1110	\N
1111	Attribute	Calling	2008-05-02 17:09:27	2008-05-02 17:10:41	1086	\N	Ward Executive Secretary	1111	\N
1112	Attribute	Email	2008-05-02 17:09:28	2008-05-02 17:10:41	1086	\N	abbeyroad28@yahoo.com	1112	\N
1113	Attribute	First Name	2008-05-02 17:09:28	2008-05-02 17:10:41	1086	\N	Benjamin	1113	\N
1114	Attribute	Last Name	2008-05-02 17:09:28	2008-05-02 17:10:41	1086	\N	Cook	1114	\N
1115	Attribute	Phone	2008-05-02 17:09:28	2008-05-02 17:10:41	1086	\N	781-843-3667 	1115	\N
1116	Attribute	Calling	2008-05-02 17:11:09	2008-06-24 17:23:47	1087	\N		1116	\N
1117	Attribute	Email	2008-05-02 17:11:10	2008-06-24 17:23:47	1087	\N	codyscottharward@yahoo.com	1117	\N
1118	Attribute	First Name	2008-05-02 17:11:10	2008-06-24 17:23:47	1087	\N	Cody	1118	\N
1119	Attribute	Last Name	2008-05-02 17:11:10	2008-06-24 17:23:47	1087	\N	Harward	1119	\N
1120	Attribute	Phone	2008-05-02 17:11:10	2008-06-24 17:23:47	1087	\N	781-727-9270 	1120	\N
1124	InfoNode	Leadership	2008-05-02 17:13:40	2008-05-02 18:27:03	1071	\N	\N	1124	<%= table_of_subnodes @node%>
1125	InfoNode	Missionaries In	2008-05-02 17:13:40	2008-05-02 18:14:13	1071	\N	\N	1125	\N
1126	InfoNode	Missionaries Out	2008-05-02 17:13:40	2008-05-02 18:14:13	1071	\N	\N	1126	\N
1127	Attribute	Calling	2008-05-02 17:15:37	2008-06-24 17:24:33	1088	\N		1127	\N
1128	Attribute	Email	2008-05-02 17:15:37	2008-06-24 17:24:33	1088	\N	harrop1@verizon.net	1128	\N
1129	Attribute	First Name	2008-05-02 17:15:37	2008-06-24 17:24:33	1088	\N	Mark	1129	\N
1130	Attribute	Last Name	2008-05-02 17:15:37	2008-06-24 17:24:33	1088	\N	Harrop	1130	\N
1131	Attribute	Phone	2008-05-02 17:15:37	2008-06-24 17:24:33	1088	\N	781-878-2429 	1131	\N
1132	InfoNode	Leadership	2008-05-02 17:17:12	2008-05-02 18:14:13	1100	\N	\N	1132	\N
1133	InfoNode	Missionaries In	2008-05-02 17:17:13	2008-05-02 18:14:13	1100	\N	\N	1133	\N
1134	InfoNode	Missionaries Out	2008-05-02 17:17:13	2008-05-02 18:14:13	1100	\N	\N	1134	\N
1135	Attribute	Calling	2008-05-02 17:17:23	2008-05-02 17:18:23	1089	\N	Assistant Ward Clerk (finance)	1135	\N
1136	Attribute	Email	2008-05-02 17:17:23	2008-05-02 17:18:23	1089	\N		1136	\N
1137	Attribute	First Name	2008-05-02 17:17:23	2008-05-02 17:18:23	1089	\N	Chris	1137	\N
1138	Attribute	Last Name	2008-05-02 17:17:23	2008-05-02 17:18:23	1089	\N	Kelson	1138	\N
1139	Attribute	Phone	2008-05-02 17:17:23	2008-05-02 17:18:23	1089	\N	781-812-2211 	1139	\N
1140	Attribute	Calling	2008-05-02 17:18:40	2008-05-02 17:19:43	1091	\N	Assistant Ward Clerk (finance)	1140	\N
1141	Attribute	Email	2008-05-02 17:18:41	2008-05-02 17:19:43	1091	\N	bradbennion@verizon.net	1141	\N
1142	Attribute	First Name	2008-05-02 17:18:41	2008-05-02 17:19:43	1091	\N	Brad	1142	\N
1143	Attribute	Last Name	2008-05-02 17:18:41	2008-05-02 17:19:43	1091	\N	Bennion	1143	\N
1144	Attribute	Phone	2008-05-02 17:18:41	2008-05-02 17:19:43	1091	\N	781-337-2675 	1144	\N
1145	InfoNode	West Bridgewater	2008-05-02 17:19:01	2008-05-02 18:14:13	782	\N	\N	1145	\N
1146	InfoNode	Leadership	2008-05-02 17:19:07	2008-05-02 18:14:13	1145	\N	\N	1146	\N
1147	InfoNode	Missionaries In	2008-05-02 17:19:08	2008-05-02 18:14:13	1145	\N	\N	1147	\N
1148	InfoNode	Missionaries Out	2008-05-02 17:19:08	2008-05-02 18:14:13	1145	\N	\N	1148	\N
1149	InfoNode	Marthas Vineyard	2008-05-02 17:23:10	2008-05-02 18:14:13	782	\N	\N	1149	\N
1150	InfoNode	Mark Mansius	2008-05-02 17:23:13	2008-05-02 18:14:13	784	\N	\N	1150	\N
1151	InfoNode	Bill Grigg	2008-05-02 17:23:13	2008-05-02 18:14:13	784	\N	\N	1151	\N
1152	InfoNode	Bret Livingston	2008-05-02 17:23:14	2008-05-02 18:14:13	784	\N	\N	1152	\N
1153	InfoNode	David A Eastman	2008-05-02 17:23:14	2008-05-02 18:14:13	784	\N	\N	1153	\N
1154	InfoNode	Dennis Patrick McCarthy	2008-05-02 17:23:14	2008-05-02 18:14:13	784	\N	\N	1154	\N
1155	InfoNode	Jose Rosario Gomes	2008-05-02 17:23:14	2008-05-02 18:14:13	784	\N	\N	1155	\N
1156	InfoNode	Leadership	2008-05-02 17:23:20	2008-05-02 18:14:13	1149	\N	\N	1156	\N
1157	InfoNode	Missionaries In	2008-05-02 17:23:20	2008-05-02 18:14:13	1149	\N	\N	1157	\N
1158	InfoNode	Missionaries Out	2008-05-02 17:23:20	2008-05-02 18:14:13	1149	\N	\N	1158	\N
1159	Attribute	Calling	2008-05-02 17:24:00	2008-09-06 15:23:43	1150	\N		1159	\N
1160	Attribute	Email	2008-05-02 17:24:01	2008-09-06 15:23:43	1150	\N	pocoach@comcast.net	1160	\N
1161	Attribute	First Name	2008-05-02 17:24:01	2008-09-06 15:23:43	1150	\N	Mark	1161	\N
1162	Attribute	Last Name	2008-05-02 17:24:01	2008-09-06 15:23:43	1150	\N	Mansius	1162	\N
1163	Attribute	Phone	2008-05-02 17:24:01	2008-09-06 15:23:43	1150	\N	508-997-7889	1163	\N
1164	Attribute	Calling	2008-05-02 17:25:22	2008-09-06 15:30:58	1151	\N	Bishop	1164	\N
1165	Attribute	Email	2008-05-02 17:25:22	2008-09-06 15:30:58	1151	\N	griggw@southcoast.org	1165	\N
1166	Attribute	First Name	2008-05-02 17:25:22	2008-09-06 15:30:58	1151	\N	Bill	1166	\N
1167	Attribute	Last Name	2008-05-02 17:25:23	2008-09-06 15:30:58	1151	\N	Grigg	1167	\N
1168	Attribute	Phone	2008-05-02 17:25:23	2008-09-06 15:30:58	1151	\N	1-774-202-5220	1168	\N
1169	Attribute	Calling	2008-05-02 17:27:06	2008-05-05 00:56:54	1152	\N	Bishopric, 2nd Counselor	1169	\N
1170	Attribute	Email	2008-05-02 17:27:06	2008-05-05 00:56:54	1152	\N	bret.livingston@fmr.com	1170	\N
1171	Attribute	First Name	2008-05-02 17:27:06	2008-05-05 00:56:54	1152	\N	Bret	1171	\N
1172	Attribute	Last Name	2008-05-02 17:27:06	2008-05-05 00:56:54	1152	\N	Livingston	1172	\N
1173	Attribute	Phone	2008-05-02 17:27:07	2008-05-05 00:56:54	1152	\N	508-863-5473 (BretCell)	1173	\N
1174	Attribute	Calling	2008-05-02 17:29:18	2008-05-02 17:30:29	1153	\N	Ward Clerk	1174	\N
1175	Attribute	Email	2008-05-02 17:29:18	2008-05-02 17:30:29	1153	\N	d_eastman@hotmail.com	1175	\N
1176	Attribute	First Name	2008-05-02 17:29:18	2008-05-02 17:30:29	1153	\N	David	1176	\N
1177	Attribute	Last Name	2008-05-02 17:29:18	2008-05-02 17:30:29	1153	\N	Eastman	1177	\N
1178	Attribute	Phone	2008-05-02 17:29:18	2008-05-02 17:30:29	1153	\N	508-993-7098 	1178	\N
1179	Attribute	Calling	2008-05-02 17:30:48	2008-05-02 17:32:01	1154	\N	Assistant Ward Clerk (membership)	1179	\N
1180	Attribute	Email	2008-05-02 17:30:48	2008-05-02 17:32:01	1154	\N		1180	\N
1181	Attribute	First Name	2008-05-02 17:30:48	2008-05-02 17:32:01	1154	\N	Dennis	1181	\N
1182	Attribute	Last Name	2008-05-02 17:30:49	2008-05-02 17:32:01	1154	\N	McCarthy	1182	\N
1183	Attribute	Phone	2008-05-02 17:30:49	2008-05-02 17:32:01	1154	\N	508-763-3687 	1183	\N
1184	InfoNode	Brockton Portuguese	2008-05-02 17:31:04	2008-05-02 18:14:13	782	\N	\N	1184	\N
1185	InfoNode	Leadership	2008-05-02 17:31:11	2008-05-02 18:14:13	1184	\N	\N	1185	\N
1186	InfoNode	Missionaries In	2008-05-02 17:31:11	2008-05-02 18:14:13	1184	\N	\N	1186	\N
1187	InfoNode	Missionaries Out	2008-05-02 17:31:11	2008-05-02 18:14:13	1184	\N	\N	1187	\N
1188	Attribute	Calling	2008-05-02 17:33:40	2008-05-02 17:35:07	1155	\N	Assistant Ward Clerk (finance)	1188	\N
1189	Attribute	Email	2008-05-02 17:33:40	2008-05-02 17:35:07	1155	\N		1189	\N
1190	Attribute	First Name	2008-05-02 17:33:40	2008-05-02 17:35:07	1155	\N	Jose	1190	\N
1191	Attribute	Last Name	2008-05-02 17:33:40	2008-05-02 17:35:07	1155	\N	Gomes	1191	\N
1192	Attribute	Phone	2008-05-02 17:33:40	2008-05-02 17:35:07	1155	\N	508-994-2756	1192	\N
1193	InfoNode	action item info	2008-05-02 17:35:08	2008-05-02 18:14:13	785	\N	\N	1193	\N
1194	InfoNode	Fall River	2008-05-02 17:35:16	2008-05-02 18:14:13	782	\N	\N	1194	\N
1195	InfoNode	Leadership	2008-05-02 17:35:22	2008-05-02 18:14:13	1194	\N	\N	1195	\N
1196	InfoNode	Missionaries In	2008-05-02 17:35:22	2008-05-02 18:14:13	1194	\N	\N	1196	\N
1197	InfoNode	Missionaries Out	2008-05-02 17:35:22	2008-05-02 18:14:13	1194	\N	\N	1197	\N
1198	Attribute	Assigned To	2008-05-02 17:37:46	2008-05-02 17:37:46	1193	\N	string	1198	\N
1199	Attribute	Needed By	2008-05-02 17:37:46	2008-05-02 17:37:46	1193	\N	string	1199	\N
1200	Section	Notes	2008-05-02 17:37:56	2008-05-02 17:37:56	1193		\N	1200	\N
1201	Attribute	Completed	2008-05-02 17:38:56	2008-05-02 17:38:56	1193	\N	boolean	1201	\N
1202	InfoNode	Brewster Branch	2008-05-02 17:40:49	2008-06-25 23:10:26	782	\N	\N	1202	
1203	InfoNode	Leadership	2008-05-02 17:40:55	2008-05-02 18:14:13	1202	\N	\N	1203	\N
1204	InfoNode	Missionaries In	2008-05-02 17:40:56	2008-05-02 18:14:14	1202	\N	\N	1204	\N
1205	InfoNode	Missionaries Out	2008-05-02 17:40:56	2008-05-02 18:14:14	1202	\N	\N	1205	\N
1206	InfoNode	Sister Worthen	2008-05-02 17:42:25	2008-05-02 18:14:14	1187	\N	\N	1206	\N
1207	InfoNode	Sister Bingham	2008-05-02 17:42:25	2008-05-02 18:14:14	1187	\N	\N	1207	\N
1208	Attribute	Phone	2008-05-02 17:44:28	2008-05-02 17:50:42	1187	\N	 508-743-9881 	1208	\N
1209	Attribute	Phone	2008-05-02 17:45:46	2008-05-02 17:48:31	1207	\N	 508-743-9881 	1209	\N
1210	Attribute	Phone	2008-05-02 17:47:42	2008-05-05 00:35:35	1206	\N		1210	\N
1211	InfoNode	Cape Cod	2008-05-02 17:52:24	2008-05-02 18:14:14	782	\N	\N	1211	\N
1212	InfoNode	Leadership	2008-05-02 17:52:32	2008-05-02 18:14:14	1211	\N	\N	1212	\N
1213	InfoNode	Missionaries In	2008-05-02 17:52:33	2008-05-02 18:14:14	1211	\N	\N	1213	\N
1214	InfoNode	Missionaries Out	2008-05-02 17:52:33	2008-05-02 18:14:14	1211	\N	\N	1214	\N
1216	InfoNode	Hingham	2008-05-02 18:01:05	2008-05-02 22:09:43	782	\N	\N	1216	\N
1217	InfoNode	Leadership	2008-05-02 18:01:14	2008-05-02 18:14:14	1216	\N	\N	1217	\N
1218	InfoNode	Missionaries In	2008-05-02 18:01:15	2008-05-02 18:14:14	1216	\N	\N	1218	\N
1219	InfoNode	Missionaries Out	2008-05-02 18:01:15	2008-05-02 18:14:14	1216	\N	\N	1219	\N
1220	InfoNode	North Dartmouth	2008-05-02 18:10:02	2008-05-02 18:14:14	782	\N	\N	1220	\N
1221	InfoNode	Leadership	2008-05-02 18:10:13	2008-05-02 18:14:14	1220	\N	\N	1221	\N
1222	InfoNode	Missionaries In	2008-05-02 18:10:13	2008-05-02 18:14:14	1220	\N	\N	1222	\N
1223	InfoNode	Missionaries Out	2008-05-02 18:10:13	2008-05-02 18:14:14	1220	\N	\N	1223	\N
1224	Attribute	Phone	2008-05-02 18:10:45	2008-05-03 15:51:27	1071	\N		1224	\N
1225	InfoNode	Elder Travis Alico	2008-05-02 18:13:17	2008-05-02 18:14:14	1126	\N	\N	1225	\N
1226	InfoNode	Elder Sampo Hynynen	2008-05-02 18:13:17	2008-05-02 18:14:14	1126	\N	\N	1226	\N
1227	InfoNode	Elder Hyung Kwan Kim	2008-05-02 18:13:17	2008-05-02 18:14:14	1126	\N	\N	1227	\N
1228	InfoNode	Elder Daniel Lyons	2008-05-02 18:13:17	2008-05-02 18:14:14	1126	\N	\N	1228	\N
1229	InfoNode	Elder Charles Valdez	2008-05-02 18:13:18	2008-05-02 18:14:14	1126	\N	\N	1229	\N
1230	InfoNode	Elder Jon Ward	2008-05-02 18:13:18	2008-05-02 18:14:14	1126	\N	\N	1230	\N
1231	InfoNode	Elder Daniel Wild	2008-05-02 18:13:18	2008-05-02 18:14:14	1126	\N	\N	1231	\N
1232	InfoNode	Elder Lucas Wild	2008-05-02 18:13:18	2008-05-02 18:14:14	1126	\N	\N	1232	\N
1236	InfoNode	Sister Patti Thomas	2008-05-02 18:20:35	2008-05-02 18:20:35	1219	\N	\N	1236	\N
1237	InfoNode	Sister Louise Arkell	2008-05-02 18:20:35	2008-05-02 18:20:35	1219	\N	\N	1237	\N
1238	InfoNode	Elder Jason Arias	2008-05-02 18:20:35	2008-05-02 18:20:35	1219	\N	\N	1238	\N
1239	InfoNode	Elder Pierre Robert	2008-05-02 18:22:14	2008-05-02 18:22:14	1148	\N	\N	1239	\N
1240	InfoNode	Elder Thomas Smith	2008-05-02 18:22:14	2008-05-02 18:22:14	1148	\N	\N	1240	\N
1241	Attribute	Calling	2008-05-02 18:22:37	2008-05-05 00:55:02	797	\N	Stake President	1241	\N
1242	Attribute	Phone	2008-05-02 18:22:37	2008-05-05 00:55:02	797	\N	781-659-4702	1242	\N
1243	Attribute	Calling	2008-05-02 18:27:44	2008-05-02 18:28:21	809	\N	Bishopric, 1st Counselor	1243	\N
1244	Attribute	Calling	2008-05-02 18:29:34	2008-05-02 18:57:28	808	\N	Bishop	1244	\N
1245	Attribute	Email	2008-05-02 18:29:34	2008-05-02 18:57:28	808	\N	tlbadstubn@aol.com	1245	\N
1246	Attribute	First Name	2008-05-02 18:29:35	2008-05-02 18:57:28	808	\N	Tom	1246	\N
1247	Attribute	Last Name	2008-05-02 18:29:35	2008-05-02 18:57:28	808	\N	Badstubner	1247	\N
1248	Attribute	Phone	2008-05-02 18:29:35	2008-05-02 18:57:28	808	\N	508-883-3545	1248	\N
1249	InfoNode	Stake	2008-05-02 19:02:19	2008-05-02 19:02:19	782	\N	\N	1249	\N
1250	InfoNode	Charles Volpetti	2008-05-02 19:05:14	2008-05-02 19:05:14	784	\N	\N	1250	\N
1251	InfoNode	Bryan Ward	2008-05-02 19:05:14	2008-05-02 19:05:14	784	\N	\N	1251	\N
1252	InfoNode	Matt Allen	2008-05-02 19:05:14	2008-05-02 19:05:14	784	\N	\N	1252	\N
1253	InfoNode	Jim Irey	2008-05-02 19:05:14	2008-05-02 19:05:14	784	\N	\N	1253	\N
1254	InfoNode	Robert White	2008-05-02 19:05:14	2008-05-02 19:05:14	784	\N	\N	1254	\N
1255	InfoNode	Leadership	2008-05-02 19:06:56	2008-05-02 19:06:57	1249	\N	\N	1255	\N
1256	InfoNode	Missionaries In	2008-05-02 19:06:57	2008-05-02 19:06:57	1249	\N	\N	1256	\N
1257	InfoNode	Missionaries Out	2008-05-02 19:06:57	2008-05-02 19:06:57	1249	\N	\N	1257	\N
1258	Attribute	Calling	2008-05-02 19:08:47	2008-05-02 19:10:16	1250	\N	Stake Presidency, 1st Counselor	1258	\N
1259	Attribute	Email	2008-05-02 19:08:47	2008-05-02 19:10:16	1250	\N	cvolpetti@aol.com	1259	\N
1260	Attribute	First Name	2008-05-02 19:08:47	2008-05-02 19:10:16	1250	\N	Charles	1260	\N
1261	Attribute	Last Name	2008-05-02 19:08:48	2008-05-02 19:10:16	1250	\N	Volpetti	1261	\N
1262	Attribute	Phone	2008-05-02 19:08:48	2008-05-02 19:10:16	1250	\N	508-224-7295	1262	\N
1263	Attribute	Calling	2008-05-02 19:10:48	2008-05-02 19:11:43	1251	\N	Stake Presidency, 2nd Counselor	1263	\N
1264	Attribute	Email	2008-05-02 19:10:49	2008-05-02 19:11:43	1251	\N	bward@westwoodglobal.com	1264	\N
1265	Attribute	First Name	2008-05-02 19:10:49	2008-05-02 19:11:43	1251	\N	Bryan	1265	\N
1266	Attribute	Last Name	2008-05-02 19:10:49	2008-05-02 19:11:43	1251	\N	Ward	1266	\N
1267	Attribute	Phone	2008-05-02 19:10:49	2008-05-02 19:11:43	1251	\N	508-359-5377	1267	\N
1268	Attribute	Calling	2008-05-02 19:12:15	2008-05-02 19:13:02	1252	\N	Stake Executive Secretary	1268	\N
1269	Attribute	Email	2008-05-02 19:12:16	2008-05-02 19:13:02	1252	\N	matt.r.allen@gmail.com	1269	\N
1270	Attribute	First Name	2008-05-02 19:12:16	2008-05-02 19:13:02	1252	\N	Matt	1270	\N
1271	Attribute	Last Name	2008-05-02 19:12:16	2008-05-02 19:13:02	1252	\N	Allen	1271	\N
1272	Attribute	Phone	2008-05-02 19:12:16	2008-05-02 19:13:02	1252	\N	508 520 0563	1272	\N
1273	Attribute	Calling	2008-05-02 19:13:21	2008-05-02 19:14:21	1253	\N	Stake Clerk	1273	\N
1274	Attribute	Email	2008-05-02 19:13:21	2008-05-02 19:14:21	1253	\N	jimirey2@gmail.com	1274	\N
1275	Attribute	First Name	2008-05-02 19:13:21	2008-05-02 19:14:21	1253	\N	Jim	1275	\N
1276	Attribute	Last Name	2008-05-02 19:13:21	2008-05-02 19:14:21	1253	\N	Irey	1276	\N
1277	Attribute	Phone	2008-05-02 19:13:22	2008-05-02 19:14:21	1253	\N	508-399-8601	1277	\N
1278	Attribute	Calling	2008-05-02 19:14:41	2008-05-02 19:15:25	1254	\N	Stake Technology Specialist	1278	\N
1279	Attribute	Email	2008-05-02 19:14:41	2008-05-02 19:15:25	1254	\N	rwhite38l@verizon.net	1279	\N
1280	Attribute	First Name	2008-05-02 19:14:42	2008-05-02 19:15:25	1254	\N	Robert	1280	\N
1281	Attribute	Last Name	2008-05-02 19:14:42	2008-05-02 19:15:25	1254	\N	White	1281	\N
1282	Attribute	Phone	2008-05-02 19:14:42	2008-05-02 19:15:25	1254	\N	508-533-3077	1282	\N
1296	InfoNode	BITI	2008-05-07 14:28:59	2008-05-07 14:28:59	1295	\N	\N	1296	\N
1297	InfoNode	Cetera and Data Lineage	2008-05-07 14:28:59	2008-05-07 14:28:59	1295	\N	\N	1297	\N
1298	InfoNode	GRC	2008-05-07 14:28:59	2008-05-07 14:28:59	1295	\N	\N	1298	\N
1299	InfoNode	Cloud	2008-05-07 14:29:00	2008-05-07 14:29:00	1295	\N	\N	1299	\N
1300	InfoNode	_templates	2008-05-07 14:29:48	2008-05-07 14:29:48	1295	\N	\N	1300	\N
1301	InfoNode	proj_info	2008-05-07 14:30:00	2008-05-07 14:30:00	1300	\N	\N	1301	\N
1302	InfoNode	Staff	2008-05-07 14:30:42	2008-05-07 14:30:42	1301	\N	\N	1302	\N
1303	InfoNode	Requirements	2008-05-07 14:30:42	2008-05-07 14:30:42	1301	\N	\N	1303	\N
1304	InfoNode	HW Resources	2008-05-07 14:30:42	2008-05-07 14:30:42	1301	\N	\N	1304	\N
1305	InfoNode	HW Resources	2008-05-07 14:31:19	2008-05-07 14:31:19	1297	\N	\N	1305	\N
1306	InfoNode	Requirements	2008-05-07 14:31:19	2008-05-07 14:31:20	1297	\N	\N	1306	\N
1307	InfoNode	Staff	2008-05-07 14:31:20	2008-05-07 14:31:20	1297	\N	\N	1307	\N
1308	Attribute	Owner	2008-05-07 14:32:07	2008-05-07 14:32:07	1301	\N	string	1308	\N
1309	Attribute	Due Date	2008-05-07 14:32:07	2008-05-07 14:32:07	1301	\N	date	1309	\N
1310	Attribute	Due Date	2008-05-07 14:32:12	2008-05-07 14:32:13	1297	\N		1310	\N
1311	Attribute	Owner	2008-05-07 14:32:13	2008-05-07 14:32:13	1297	\N		1311	\N
1312	Section	Title 	2008-05-07 14:33:35	2008-05-07 14:33:35	1297	pwfjh wof yuwoe fyow yfowe yf[o	\N	1312	\N
1313	InfoNode	Stake Audit Committee	2008-05-09 11:01:52	2008-05-09 11:01:52	783	\N	\N	1313	\N
1314	InfoNode	Stake Clerk Items	2008-05-09 11:02:21	2008-05-09 11:02:21	783	\N	\N	1314	\N
1319	InfoNode	2008 Q1	2008-05-09 11:05:38	2008-05-09 11:05:38	1313	\N	\N	1319	\N
1320	Section	Actions Required by Unit	2008-05-09 11:09:54	2008-07-29 08:51:31	1319	table(compact" width="100%" cellspacing="1px).\r\n| *Unit* | *Who* | *What* | *By&nbsp;When&nbsp;* | *Status* |\r\n| Family History Center | Br Wayne M | Ask about handling of funds in FHCs | 31-May-08| Open |\r\n| Cape Cod | Br Wild | Training: Handling of deposits | 15-Jun-08 | Open |\r\n| Brewster | Br Truscott | Work with clerk to correctly apply interest postings | 15-Jun-08 | Open |\r\n| Fall River| Br Lambert | Ensure on-line training taken on processing deposits | 15-Jun-08 | Open |\r\n| North Dartmouth | Pr Ward + Pr Erickson | Speak with Bishop about management of Other funds and accts | 15-Jun-08 | Open |\r\n| North Dartmouth | Br Wild | Work with Financial Clerk on dealing with Other funds | 15-Jun-08 | Open |\r\n\r\ntable(compact" width="100%" cellspacing="1px).\r\n| *Unit* | *Who* | *What* | *By&nbsp;When&nbsp;* | *Status* |\r\n| Hingham  | Br Larsen | Training: Monthly reconciliations | 15-Jun-08 | DONE |\r\n| Hingham FHC | Br Larsen | Ensure new procedures are followed in handling funds | 30-Jun-08 | DONE |\r\n| Hingham FHC | Br White | Ensure proper web filtering SW is on computers | 30-May-08 | DONE |\r\n| North Dartmouth FHC | Cody | Help them to sort out handling of funds | 15-Jun-08 | DONE |\r\n| Franklin | Br Wild | Ensure they clear their other acct of the neg balance | 15-Jun-08 | DONE |\r\n| Foxboro | Pr Erickson | Discuss with Bishop how to recover dbl-spend of budget and proper use of Other funds | 15-Jun-08 | DONE |\r\n| Stake Account | Br Wild | Followup on June receipts to cover $3K expense | ASAP | DONE |\r	\N	1320	\N
1321	Attribute	Due Date	2008-05-18 19:06:51	2008-05-18 19:06:51	1296	\N		1321	\N
1322	Attribute	Owner	2008-05-18 19:06:51	2008-05-18 19:06:51	1296	\N		1322	\N
1323	InfoNode	HW Resources	2008-05-18 19:06:52	2008-05-18 19:06:52	1296	\N	\N	1323	\N
1324	InfoNode	Requirements	2008-05-18 19:06:52	2008-05-18 19:06:52	1296	\N	\N	1324	\N
1325	InfoNode	Staff	2008-05-18 19:06:52	2008-05-18 19:06:52	1296	\N	\N	1325	\N
1326	InfoNode	Alena Injury	2008-05-28 10:04:57	2008-06-09 10:33:46	\N	\N	\N	1326	   <h3>Doctors</h3>\r\n\r\n<%= table_of_subnodes "Doctors" %>\r\n\r\n<% for doc in @docs %>\r\n\r\n   <h3><%= doc.name %></h3>\r\n   <div> <%= rc_format(doc.body) %> </div>\r\n\r\n<% end %>\r\n\r\n<!-- end -->\r\n
1327	InfoNode	Doctors	2008-05-28 10:05:11	2008-07-05 09:45:49	1326	\N	\N	1327	\r\n<%= table_of_subnodes(@sub_nodes) %>\r
1328	InfoNode	Toback	2008-05-28 10:06:11	2008-05-28 10:06:11	1327	\N	\N	1328	\N
1329	InfoNode	Donnahue and Hoffman	2008-05-28 10:06:11	2008-05-28 10:06:11	1327	\N	\N	1329	\N
1331	InfoNode	tem	2008-05-28 10:06:39	2008-05-28 10:06:39	1326	\N	\N	1331	\N
1332	InfoNode	doc	2008-05-28 10:06:50	2008-05-28 10:06:50	1331	\N	\N	1332	\N
1333	Attribute	Phone	2008-05-28 10:07:19	2008-05-28 10:07:19	1332	\N	string	1333	\N
1334	Attribute	Addr	2008-05-28 10:07:19	2008-05-28 10:07:19	1332	\N	string	1334	\N
1337	Attribute	Addr	2008-05-28 10:08:44	2008-05-28 10:25:49	1329	\N	150 East Manning St, Providence, RI	1337	\N
1338	Attribute	Phone	2008-05-28 10:08:44	2008-05-28 10:25:49	1329	\N	401-272-2020	1338	\N
1339	Attribute	Addr	2008-05-28 10:09:52	2008-07-12 14:33:58	1328	\N	School St, Pawtucket, RI	1339	\N
1340	Attribute	Phone	2008-05-28 10:09:53	2008-07-12 14:33:58	1328	\N	401-728-6990	1340	\N
1341	Section	Notes	2008-05-28 10:20:31	2008-06-18 20:28:06	1326	On abbrasions\r\n# Wash with saline solution - do not irratate the area\r\n# Apply healing cream so that it is always moist - do not let it dry out\r\n# See plastic surgeon to ensure proper healing\r	\N	1341	\N
1342	Attribute	Specialty	2008-05-28 10:24:57	2008-05-28 10:24:57	1332	\N	string	1342	\N
1343	Attribute	Specialty	2008-05-28 10:25:06	2008-07-12 14:33:58	1328	\N	Dermatology	1343	\N
1344	Attribute	Specialty	2008-05-28 10:25:25	2008-05-28 10:25:49	1329	\N	Plastic surgery - near eyes	1344	\N
1345	InfoNode	Referrals	2008-06-18 18:46:24	2008-06-18 18:46:24	1332	\N	\N	1345	\N
1346	InfoNode	Referrals	2008-06-18 18:46:38	2008-06-18 18:46:38	1329	\N	\N	1346	\N
1347	InfoNode	Referrals	2008-06-18 18:52:42	2008-06-18 18:52:43	1328	\N	\N	1347	\N
1348	Attribute	Date of injury	2008-06-18 18:54:10	2008-06-18 18:54:10	1326	\N	2008-05-01	1348	\N
1349	Attribute	Cost	2008-06-18 18:54:10	2008-06-18 18:54:10	1326	\N	$1,110	1349	\N
1350	Attribute	Cost	2008-06-18 18:55:23	2008-07-12 14:33:58	1328	\N	$300	1350	\N
1351	Attribute	Date of injury	2008-06-18 18:55:23	2008-07-12 14:33:58	1328	\N	2008-05-11	1351	\N
1411	InfoNode	Robert Barlow	2008-06-21 12:33:02	2008-06-21 12:33:02	784	\N	\N	1411	\N
1412	Attribute	Calling	2008-06-21 12:33:16	2008-06-21 12:33:56	1411	\N	Branch President	1412	\N
1413	Attribute	Email	2008-06-21 12:33:16	2008-06-21 12:33:56	1411	\N	bungybug@comcast.net	1413	\N
1414	Attribute	First Name	2008-06-21 12:33:16	2008-06-21 12:33:56	1411	\N	Robert	1414	\N
1415	Attribute	Last Name	2008-06-21 12:33:16	2008-06-21 12:33:56	1411	\N	Barlow	1415	\N
1416	Attribute	Phone	2008-06-21 12:33:16	2008-06-21 12:33:56	1411	\N	508-398-7867 	1416	\N
1417	InfoNode	Steven Higginson	2008-06-21 12:45:33	2008-06-21 12:45:33	784	\N	\N	1417	\N
1418	Attribute	Calling	2008-06-21 12:45:41	2008-06-21 12:47:11	1417	\N	Branch President	1418	\N
1419	Attribute	Email	2008-06-21 12:45:41	2008-06-21 12:47:11	1417	\N	schigginson@verizon.net	1419	\N
1420	Attribute	First Name	2008-06-21 12:45:41	2008-06-21 12:47:11	1417	\N	Steven	1420	\N
1421	Attribute	Last Name	2008-06-21 12:45:41	2008-06-21 12:47:11	1417	\N	Higginson	1421	\N
1422	Attribute	Phone	2008-06-21 12:45:41	2008-06-21 12:47:11	1417	\N	unknown	1422	\N
1423	InfoNode	Robert Clarke	2008-06-24 17:03:06	2008-06-24 17:03:06	784	\N	\N	1423	\N
1424	Attribute	Calling	2008-06-24 17:03:14	2008-06-24 17:04:21	1423	\N	Bishopric, 1st Counselor	1424	\N
1425	Attribute	Email	2008-06-24 17:03:15	2008-06-24 17:04:21	1423	\N	rclarke55@gmail.com	1425	\N
1426	Attribute	First Name	2008-06-24 17:03:15	2008-06-24 17:04:21	1423	\N	Robert	1426	\N
1427	Attribute	Last Name	2008-06-24 17:03:15	2008-06-24 17:04:21	1423	\N	Clarke	1427	\N
1428	Attribute	Phone	2008-06-24 17:03:15	2008-06-24 17:04:21	1423	\N	508-743-5622	1428	\N
1429	InfoNode	Jim Mack	2008-06-24 17:08:37	2008-06-24 17:08:37	784	\N	\N	1429	\N
1430	Attribute	Calling	2008-06-24 17:08:45	2008-06-24 17:09:51	1429	\N	Branch Presidency, 2nd Counselor	1430	\N
1431	Attribute	Email	2008-06-24 17:08:45	2008-06-24 17:09:51	1429	\N	jimack104@comcast.net	1431	\N
1432	Attribute	First Name	2008-06-24 17:08:46	2008-06-24 17:09:51	1429	\N	Jim	1432	\N
1433	Attribute	Last Name	2008-06-24 17:08:46	2008-06-24 17:09:51	1429	\N	Mack	1433	\N
1434	Attribute	Phone	2008-06-24 17:08:46	2008-06-24 17:09:51	1429	\N	508-673-4620	1434	\N
1441	InfoNode	Nathan Sandland	2008-06-24 17:26:19	2008-06-24 17:26:19	784	\N	\N	1441	\N
1442	Attribute	Calling	2008-06-24 17:26:26	2008-06-24 17:27:15	1441	\N	Assistant Ward Clerk	1442	\N
1443	Attribute	Email	2008-06-24 17:26:26	2008-06-24 17:27:15	1441	\N	nathan@sandlands.org	1443	\N
1444	Attribute	First Name	2008-06-24 17:26:26	2008-06-24 17:27:15	1441	\N	Nathan	1444	\N
1445	Attribute	Last Name	2008-06-24 17:26:26	2008-06-24 17:27:15	1441	\N	Sandland	1445	\N
1446	Attribute	Phone	2008-06-24 17:26:27	2008-06-24 17:27:15	1441	\N	781-335-6262	1446	\N
1447	InfoNode	Jonathan Polleys	2008-06-24 17:30:31	2008-06-24 17:30:31	784	\N	\N	1447	\N
1448	Attribute	Calling	2008-06-24 17:30:36	2008-06-24 17:31:27	1447	\N	Branch Clerk	1448	\N
1449	Attribute	Email	2008-06-24 17:30:36	2008-06-24 17:31:27	1447	\N	jonathanpolleys@comcast.net	1449	\N
1450	Attribute	First Name	2008-06-24 17:30:36	2008-06-24 17:31:27	1447	\N	Jonathan	1450	\N
1451	Attribute	Last Name	2008-06-24 17:30:36	2008-06-24 17:31:27	1447	\N	Polleys	1451	\N
1452	Attribute	Phone	2008-06-24 17:30:36	2008-06-24 17:31:27	1447	\N	508-627-3163	1452	\N
1454	InfoNode	Unit Leadership Directory	2008-06-25 11:28:30	2008-06-26 14:15:30	781	\N	\N	1454	<div>\r\n\r\n   <h3>Unit Leadership Directory</h3>\r\n\r\n   <% for unit in @node.parent.get_subnodes_of("Units") %>\r\n      <h5 style="margin-top:12px;"><%=unit.name%></h5>\r\n      <%= table_of_subnodes unit.get_subnode_by_name("Leadership"), :order_by => 'Calling' %>\r\n   <% end %>\r\n\r\n</div>\r
1455	InfoNode	Missionaries	2008-06-25 11:54:20	2008-06-25 11:57:06	781	\N	\N	1455	<div>\r\n   <h3>Missionaries</h3>\r\n   <% for unit in @node.parent.get_subnodes_of("Units") %>\r\n      <% missionaries = unit.get_subnode_by_name("Missionaries Out").children %>\r\n      <% if missionaries.size > 0 %>\r\n         <div style="float:left; width:28%; margin-left:1%; margin-top:12px;">\r\n         <h5><%=unit.name%></h5>\r\n         <%= table_of_subnodes missionaries %>\r\n         </div>\r\n      <% end %>\r\n   <% end %>\r\n</div>\r
1456	Section	wiki page	2008-06-26 15:52:58	2008-07-05 09:41:57	667	h2. This is a heading\r\n\r\nSome text above the outline\r\n* Greetings\r\n** Hello \r\n** Hi there\r\n** [[Linked Page Title]]\r\n** [[Hosting]]\r\n** [[>New Page]]\r\n\r\nh2. Alena's Space\r\n\r\n[[Alena Pages]]\r\n\r\n[[Dad's Pages]]\r\n\r\nh2. An image and a few other items\r\n\r\n{image:fred.jpg}\r\n\r\n[[Introduction to OntoRave]]\r\n\r\n[[The seasons]]\r\n\r\n# Hello \r\n## Hello\r\n## Hello\r\n# Hello\r\n##  Hello\r\n## Hello\r\n\r\nh3. A Table\r\n\r\n| Site 1 | Site 2 |\r\n| [[Diana and sleeping]] | [[Test one two]] |\r\n\r\nh1. Level 1 header on a major topic\r\n\r\nh2. This is a level 2 header \r\n\r\nAnd then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  \r\n\r\nAnd then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  \r\n\r\nh3. Level 3 header\r\n\r\nAnd then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  \r\n\r\nh3. Level 3 header\r\n\r\nAnd then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  And then a bunch of words.  \r	\N	1456	\N
1465	Section	wiki page	2008-06-26 20:13:06	2008-06-26 20:13:06	781	Empty...	\N	1465	\N
1466	InfoNode	Linked Page Title	2008-06-26 20:32:28	2008-06-26 20:32:28	667	\N	\N	1466	\N
1467	Section	wiki page	2008-06-26 20:32:28	2008-06-29 21:47:15	1466	Go Back [[Hosting]]\r\n\r\n[[This is another page]]\r	\N	1467	\N
1468	Section	wiki page	2008-06-28 08:12:48	2008-06-28 08:12:48	706	Empty...	\N	1468	\N
1492	Section	wiki page	2008-06-28 09:06:20	2008-06-29 22:25:04	674	Empty...\r\n\r\nSee also: [[David Hay]], [[Tirvi]], [[ARVC]]\r	\N	1492	\N
1493	Section	wiki page	2008-06-28 09:11:32	2008-06-28 09:11:32	688	Empty...	\N	1493	\N
1496	InfoNode	Introduction to OntoRave	2008-06-28 12:34:05	2008-06-28 12:34:05	667	\N	\N	1496	\N
1497	Section	wiki page	2008-06-28 12:34:06	2008-06-28 18:23:01	1496	h2. This is a test list\r\n\r\n* a\r\n* b\r\n* c \r\n\r\nh2. Another list\r\n\r\n# first\r\n## hmm\r\n# seconfd\r\n# third\r	\N	1497	\N
1507	InfoNode	Diana and sleeping	2008-06-28 23:03:40	2008-06-28 23:03:40	667	\N	\N	1507	\N
1508	Section	wiki page	2008-06-28 23:03:40	2008-06-29 13:14:45	1507	This is the story of Diana and her sleepiness ... \r\n\r\n[[Term 1]]   --  [[Term 2]]\r\n\r\nA "subnotebook":http://en.wikipedia.org/wiki/Subnotebook (or ultraportable computer) is a small and lightweight portable computer, with most of the features of a standard laptop computer but smaller. The term is often applied to systems that run full versions of desktop operating systems such as Windows or Linux, rather than specialized software such as Windows CE, Palm OS or Internet Tablet OS. The term "ultra-mobile PC" (UMPC) is also frequently used to refer to such machines, although this also refers to a small form-factor tablet PC platform.\r\n\r\nSubnotebooks are smaller than laptops but larger than handheld computers and UMPCs. They often have screens, usually measuring 10.6 inches (26.92cm) to 13.3 inches (33.78cm), and a weight less than 1 kg up to about 2 kg; as opposed to full-size laptops with 14.1 (35.81cm) to 15.4 inches (39.12cm) screens and a weight of 2 kg or more. The savings in size and weight are usually achieved partly by omitting ports or having removable media/optical drives; subnotebooks are often paired with docking stations to compensate.\r\n\r\nSubnotebooks have been something of a niche computing product and have rarely sold in large numbers until the 2007 introduction of the Asus Eee PC and the OLPC XO-1[1], known as ultra low-cost PC (ULPC or ULCPC), which are inexpensive in comparison to both existing machines in that form factor, and computers in general.\r	\N	1508	\N
1509	InfoNode	Term 1	2008-06-28 23:04:21	2008-06-28 23:04:21	667	\N	\N	1509	\N
1510	Section	wiki page	2008-06-28 23:04:22	2008-06-29 12:29:37	1509	This is about Term 1 ... \r\n\r\nSee also:   [[Term 2]]\r\n\r\nh1. la la la \r	\N	1510	\N
1511	InfoNode	Term 2	2008-06-28 23:04:46	2008-06-28 23:04:46	667	\N	\N	1511	\N
1512	Section	wiki page	2008-06-28 23:04:46	2008-06-28 23:07:25	1511	\r\nThe def of term 2. \r\n\r\nSee also:   [[Term 1]]\r	\N	1512	\N
1513	Section	wiki page	2008-06-28 23:53:14	2008-06-28 23:53:14	675	Empty...	\N	1513	\N
1516	InfoNode	New Page	2008-06-29 22:23:49	2008-06-29 22:23:49	667	\N	\N	1516	\N
1517	Section	wiki page	2008-06-29 22:23:49	2008-07-01 15:52:02	1516	The snoring page:  [[zzzzzzzzzz]]\r	\N	1517	\N
1518	Section	wiki page	2008-06-29 22:25:27	2008-06-29 22:25:27	698	Empty...	\N	1518	\N
1521	InfoNode	Test one two	2008-06-29 22:34:36	2008-06-29 22:34:36	667	\N	\N	1521	\N
1522	Section	wiki page	2008-06-29 22:34:37	2008-06-29 22:34:37	1521	Empty...	\N	1522	\N
1523	InfoNode	The seasons	2008-06-29 22:50:30	2008-06-29 22:50:30	667	\N	\N	1523	\N
1524	Section	wiki page	2008-06-29 22:50:36	2008-06-29 22:50:51	1523	How I do love summer	\N	1524	\N
1525	Attribute	Status	2008-07-01 13:42:09	2008-07-01 14:06:19	667	\N	OK	1525	\N
1526	Attribute	A long attr name	2008-07-01 13:46:22	2008-07-01 14:04:52	667	\N	A long attr value	1526	\N
1528	InfoNode	Alena Pages	2008-07-01 15:22:58	2008-07-01 15:22:58	667	\N	\N	1528	\N
1529	Section	wiki page	2008-07-01 15:22:58	2008-07-01 16:08:03	1528	Here are links to my favorite spots:\r\n\r\n"GMail":http://gmail.google.com/\r\n\r\n"My Wild Ones":http://mywildones.com/\r\n\r\n[[Notes on BYU]]\r\n\r\n[[Alena's Web Spaces]]	\N	1529	\N
1532	InfoNode	Notes on BYU	2008-07-01 15:28:06	2008-07-01 15:28:06	667	\N	\N	1532	\N
1533	Section	wiki page	2008-07-01 15:28:06	2008-07-01 15:29:39	1532	Go back to [[Alena Pages]] \r	\N	1533	\N
1536	InfoNode	Alena's Web Spaces	2008-07-01 16:08:59	2008-07-01 16:08:59	667	\N	\N	1536	\N
1537	Section	wiki page	2008-07-01 16:08:59	2008-07-01 16:08:59	1536	Empty...	\N	1537	\N
1538	InfoNode	Dad's Pages	2008-07-01 16:52:10	2008-07-01 16:52:10	667	\N	\N	1538	\N
1539	Section	wiki page	2008-07-01 16:52:11	2008-07-01 16:53:28	1538	This is a set of pages authored by Me.\r\n\r\nBack to top: [[Hosting]]\r	\N	1539	\N
1540	InfoNode	TestOntoRave	2008-07-01 19:37:00	2008-07-03 18:51:10	\N	\N	\N	1540	
1542	InfoNode	OntoRave Reference	2008-07-02 07:58:27	2008-07-02 07:58:27	1540	\N	\N	1542	\N
1544	InfoNode	User areas	2008-07-02 08:07:25	2008-07-02 08:07:26	1540	\N	\N	1544	\N
1548	InfoNode	Beta Feedback	2008-07-02 08:49:30	2008-07-02 08:49:30	1540	\N	\N	1548	\N
1549	Section	wiki page	2008-07-02 08:49:30	2008-07-16 13:37:21	1548	Please add your comments here:\r\n\r\n* Need a better explanation of attributes.\r\n\r\n* Need to be able to assign attributes to multiple selected topics at once\r\n* Need to be able to assign tags to multiple selected topics at once\r\n* Add the notion of a "select list" to support the above\r\n\r\n* Need a tabular edit view (like a spreadsheet) for editing attributes in cells, having the selected objects all in rows. \r\n\r\n* The need to go to the Edit view to add/modify attributes seems too "modal" ... it should be possible right in the topic view page (as it is for tags)\r	\N	1549	\N
1554	Attribute	Scope	2008-07-02 15:15:29	2008-07-02 15:15:30	1548	\N	Beta	1554	\N
1558	InfoNode	Fred	2008-07-02 18:27:49	2008-07-05 16:04:30	1544	\N	\N	1558	\N
1559	InfoNode	Diana	2008-07-02 18:27:50	2008-07-02 18:27:50	1544	\N	\N	1559	\N
1560	InfoNode	Suzanne	2008-07-02 18:27:50	2008-07-02 18:27:50	1544	\N	\N	1560	\N
1568	Attribute	Author	2008-07-02 22:22:33	2008-07-12 09:04:29	1542	\N	Fred W	1568	\N
1569	Attribute	Author	2008-07-02 22:23:07	2008-07-02 22:23:07	1548	\N	Various	1569	\N
1571	InfoNode	Lexi	2008-07-03 22:03:23	2008-07-03 22:03:23	1560	\N	\N	1571	\N
1572	Section	wiki page	2008-07-03 22:03:30	2008-07-03 22:03:30	1571	Empty...	\N	1572	\N
1573	InfoNode	Contacts	2008-07-03 22:04:05	2008-07-05 14:40:41	1560	\N	\N	1573	\N
1574	Section	wiki page	2008-07-03 23:19:58	2008-07-03 23:19:58	1573	Empty...	\N	1574	\N
1575	Attribute	First, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1575	\N
1576	Attribute	Last, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1576	\N
1577	Attribute	cell, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1577	\N
1578	Attribute	home, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1578	\N
1579	Attribute	email, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1579	\N
1580	Attribute	Employer, text	2008-07-03 23:21:29	2008-07-03 23:21:29	1573	\N		1580	\N
1581	InfoNode	Rebecca Northup	2008-07-03 23:23:28	2008-07-03 23:23:28	1573	\N	\N	1581	\N
1582	Section	wiki page	2008-07-03 23:23:34	2008-07-03 23:23:34	1581	Empty...	\N	1582	\N
1583	Attribute	E-Mail	2008-07-04 23:47:11	2008-07-04 23:47:11	1559	\N	dianawild@gmail.com	1583	\N
1584	Attribute	E-Mail	2008-07-04 23:47:44	2008-07-04 23:47:44	1558	\N	fredwild@gmail.com	1584	\N
1593	InfoNode	Things for Diana to do	2008-07-05 13:10:08	2008-07-05 13:10:08	1559	\N	\N	1593	\N
1594	Section	wiki page	2008-07-05 13:10:08	2008-07-05 13:10:08	1593	Empty...	\N	1594	\N
1596	Section	wiki page	2008-07-05 13:10:21	2008-07-05 13:10:21	1595	Empty...	\N	1596	\N
1597	InfoNode	Things for Fred to do	2008-07-05 13:10:29	2008-07-05 13:10:29	1558	\N	\N	1597	\N
1598	Section	wiki page	2008-07-05 13:10:29	2008-07-05 13:10:29	1597	Empty...	\N	1598	\N
1607	InfoNode	Guinea Pigery	2008-07-06 16:38:09	2008-07-06 16:38:09	1559	\N	\N	1607	\N
1609	InfoNode	Oreo	2008-07-06 16:39:58	2008-07-06 16:39:58	1607	\N	\N	1609	\N
1610	InfoNode	Butterscotch	2008-07-06 16:39:58	2008-07-06 16:39:58	1607	\N	\N	1610	\N
1611	InfoNode	Goldie	2008-07-06 16:39:58	2008-07-06 16:39:58	1607	\N	\N	1611	\N
1612	InfoNode	Patches	2008-07-06 16:39:59	2008-07-06 16:39:59	1607	\N	\N	1612	\N
1613	InfoNode	Blaze	2008-07-06 16:39:59	2008-07-06 16:39:59	1607	\N	\N	1613	\N
1614	InfoNode	Marshie	2008-07-06 16:39:59	2008-07-06 16:39:59	1607	\N	\N	1614	\N
1615	Section	wiki page	2008-07-06 16:40:15	2008-07-06 22:53:03	1613	!blaze.com!\r\n\r\nBlaze came from Oceans of Pets in Cumberland, RI	\N	1615	\N
1616	Attribute	Birthdate	2008-07-06 16:44:29	2008-07-06 16:57:50	1613	\N	2008-04-01	1616	\N
1617	Attribute	Color	2008-07-06 16:44:29	2008-07-06 16:57:50	1613	\N	Black, White & Cream	1617	\N
1566	Section	wiki page	2008-07-02 18:30:19	2008-09-27 23:06:18.262356	1560	\r\nHello, \r\n\r\nThese are my subtopics:\r\n\r\n[[>]]\r\n\r\n	\N	1566	\N
1619	InfoNode	Caramel	2008-07-06 16:47:10	2008-07-06 16:47:10	1607	\N	\N	1619	\N
1621	Section	wiki page	2008-07-06 16:48:26	2008-07-07 13:05:02	1609	!oreo.jpg!\r\n\r\nOreo came from a pet shop in Johnston.\r\n\r\nOreo was [[Butterscotch]]'s brother !Brothers.jpg!.\r\n\r\n!wfakegpigs.jpg!\r\n\r\nOreo died of a respiratory infection.	\N	1621	\N
1622	Section	wiki page	2008-07-06 16:50:38	2008-07-06 18:11:17	1612	!patches.jpg!\r\n\r\nPatches came from a pet shop in Garden City, RI	\N	1622	\N
1623	Section	wiki page	2008-07-06 16:51:18	2008-07-06 18:10:20	1614	!marshie.jpg!\r\n\r\nMarshie came from Petco in Johnston, RI	\N	1623	\N
1624	Attribute	Color	2008-07-06 16:54:01	2008-07-06 23:29:40	1619	\N	Gold & White	1624	\N
1625	Attribute	Birthdate	2008-07-06 16:54:01	2008-07-06 23:29:40	1619	\N	2008-03-30	1625	\N
1626	Attribute	Color	2008-07-06 16:57:02	2008-07-06 16:57:02	1614	\N	Black, White and Gold	1626	\N
1627	Attribute	Birthdate	2008-07-06 16:57:02	2008-07-06 16:57:02	1614	\N	2007-09-01	1627	\N
1628	Attribute	Gender	2008-07-06 16:57:02	2008-07-06 16:57:02	1614	\N	Sow	1628	\N
1629	Attribute	Gender	2008-07-06 16:57:29	2008-07-06 16:57:50	1613	\N	Boar	1629	\N
1630	Attribute	Gender	2008-07-06 16:58:23	2008-07-06 23:29:40	1619	\N	Sow	1630	\N
1631	Section	wiki page	2008-07-06 18:04:57	2008-07-07 13:04:20	1610	!butterscotch.jpg!\r\n\r\nButterscotch died of a heart attack at the ripe old age of 5.\r	\N	1631	\N
1632	InfoNode	Toffee	2008-07-06 18:07:11	2008-07-06 18:07:11	1607	\N	\N	1632	\N
1633	Section	wiki page	2008-07-06 18:07:20	2008-07-06 19:22:45	1632	!toffee.jpg!\r\n\r\nToffee lives with a family in Gloucester, RI.	\N	1633	\N
1634	InfoNode	Litter #3	2008-07-06 18:08:09	2008-07-06 18:08:09	1619	\N	\N	1634	\N
1635	Section	wiki page	2008-07-06 18:08:13	2008-07-06 18:08:27	1634	!litter3.jpg!	\N	1635	\N
1636	InfoNode	Litter #1	2008-07-06 18:18:02	2008-07-06 18:35:55	1619	\N	\N	1636	\N
1637	Section	wiki page	2008-07-06 18:18:02	2008-07-06 18:20:01	1636	!Litter1.jpg!\r\n\r\n[[Toffee]] & [[Nutmeg]]\r\n\r\nNutmeg was adopted by the Bolton family.	\N	1637	\N
1639	InfoNode	Litter #2	2008-07-06 18:27:47	2008-07-06 18:27:47	1619	\N	\N	1639	\N
1641	InfoNode	Litter #4	2008-07-06 18:27:47	2008-07-06 18:27:47	1619	\N	\N	1641	\N
1644	Section	wiki page	2008-07-06 18:28:56	2008-07-06 23:30:49	1639	!litter2.jpg!	\N	1644	\N
1645	Section	wiki page	2008-07-06 18:29:14	2008-07-06 18:30:30	1641	!Litter4.jpg!\r\n\r\n[[Goldie]] was orphaned after Caramel died during childbirth.	\N	1645	\N
1646	InfoNode	Litter #1	2008-07-06 18:44:09	2008-07-06 18:44:09	1614	\N	\N	1646	\N
1555	Attribute	Scope	2008-07-02 15:16:12	2008-12-09 13:15:56.879757	1542	\N	Beta	1555	\N
1648	Attribute	Color	2008-07-06 19:08:43	2008-07-06 19:08:43	1610	\N	Black, White & Gold	1648	\N
1649	Attribute	Gender	2008-07-06 19:08:43	2008-07-06 19:08:43	1610	\N	Boar	1649	\N
1652	Attribute	Gender	2008-07-06 19:20:13	2008-07-06 19:20:13	1611	\N	Sow	1652	\N
1653	Attribute	Color	2008-07-06 19:20:13	2008-07-06 19:20:13	1611	\N	Gold & White	1653	\N
1654	Attribute	Gender	2008-07-06 19:20:59	2008-07-06 19:20:59	1609	\N	Boar	1654	\N
1655	Attribute	Color	2008-07-06 19:20:59	2008-07-06 19:20:59	1609	\N	Black & White	1655	\N
1656	Attribute	Gender	2008-07-06 19:22:01	2008-07-06 19:22:01	1612	\N	Boar	1656	\N
1657	Attribute	Color	2008-07-06 19:22:01	2008-07-06 19:22:01	1612	\N	White with Black & Gold patches	1657	\N
1658	Attribute	Gender	2008-07-06 19:22:41	2008-07-06 19:22:41	1632	\N	Boar	1658	\N
1659	Attribute	Color	2008-07-06 19:22:41	2008-07-06 19:22:41	1632	\N	Gold & White	1659	\N
1676	Attribute	Birthdate	2008-07-07 13:04:08	2008-07-07 13:04:08	1610	\N	2000-11-15	1676	\N
1677	Attribute	Birthdate	2008-07-07 13:04:58	2008-07-07 13:04:58	1609	\N	2000-11-15	1677	\N
1678	InfoNode	Applications	2008-07-07 13:07:06	2008-07-07 14:03:07	1732	\N	\N	1678	\N
1679	Section	wiki page	2008-07-07 13:07:11	2008-07-07 14:02:47	1678	||>||	\N	1679	\N
1680	InfoNode	Enterprise Financial Management	2008-07-07 13:08:59	2008-07-07 13:41:18	1678	\N	\N	1680	\N
1681	InfoNode	Human Capital Management	2008-07-07 13:08:59	2008-07-07 13:35:38	1678	\N	\N	1681	\N
1682	InfoNode	Firewall Services Module	2008-07-07 13:08:59	2008-07-07 13:19:51	1678	\N	\N	1682	\N
1683	Section	wiki page	2008-07-07 13:09:05	2008-07-07 13:24:32	1682	Cisco Firewall Services Module (FWSM)â€”a high-speed, integrated firewall module for Cisco Catalyst 6500 switches and Cisco 7600 Series routersâ€”provides the fastest firewall data rates in the industry: 5-Gbps throughput, 100,000 CPS, and 1M concurrent connections. \r\n\r\nThe Cisco FWSM includes a number of advanced features that help reduce costs and operational complexity while enabling organizations to manage multiple firewalls from the same management platform. Features such as resource manager helps organizations limit the resources allocated to any security context at any time thus ensuring that one security context does not interfere with another. The transparent firewall feature configures the FWSM to act as a Layer 2 bridging firewall resulting in minimal changes to network topology.\r\n\r\n	\N	1683	\N
1684	Attribute	Acronym	2008-07-07 13:19:19	2008-07-07 13:19:19	1682	\N	FWSM	1684	\N
1685	Attribute	Category	2008-07-07 13:22:09	2008-07-07 13:22:09	1682	\N	Infrastructure	1685	\N
1686	Attribute	Vendor	2008-07-07 13:22:48	2008-07-07 13:22:48	1682	\N	Cisco	1686	\N
1687	Attribute	License	2008-07-07 13:22:48	2008-07-07 13:22:48	1682	\N		1687	\N
1688	Attribute	Date Implemented	2008-07-07 13:23:03	2008-07-07 13:23:03	1682	\N		1688	\N
1689	InfoNode	Intelligent Services Gateway	2008-07-07 13:27:18	2008-07-07 13:27:18	1678	\N	\N	1689	\N
1690	Section	wiki page	2008-07-07 13:27:47	2008-07-07 13:28:13	1689	The Cisco Intelligent Services Gateway offers Service Providers an opportunity to take direct control of resources and characteristics in their broadband network to deliver next generation services by:\r\n\r\n* Controlling, securing & differentiating services via intelligent policies embedded directly in the network or received via open and standards-based control interfaces to the BSS \r\n* Customizing Service Convergence with zero-touch provisioning across customized networks \r\n* Distributing IP Session control into the network while simultaneously maintaining consistent PPP session control 	\N	1690	\N
1691	Attribute	Category	2008-07-07 13:28:55	2008-07-07 13:28:55	1689	\N	Infrastructure	1691	\N
1692	Attribute	Vendor	2008-07-07 13:28:55	2008-07-07 13:28:55	1689	\N	Cisco	1692	\N
1693	Attribute	Date Implemented	2008-07-07 13:28:55	2008-07-07 13:28:55	1689	\N	12/03/2006	1693	\N
1694	Section	wiki page	2008-07-07 13:30:51	2008-07-07 13:44:08	1680	A tool suite that helps the business gain visibility into business-critical information, strengthen financial discipline and governance best practices, and realize efficiencies by automating and standardizing key business processes. These applications integrate with other solutions across departmental lines to help you implement departmental and industry best practices for all of your business processes.	\N	1694	\N
1695	Attribute	Category	2008-07-07 13:32:33	2008-07-07 13:32:33	1680	\N	Business	1695	\N
1696	Attribute	Vendor	2008-07-07 13:32:33	2008-07-07 13:32:33	1680	\N	Oracle	1696	\N
1697	Attribute	Date Implemented	2008-07-07 13:32:33	2008-07-07 13:32:33	1680	\N	1/31/2001	1697	\N
1698	Section	wiki page	2008-07-07 13:33:09	2008-07-07 13:42:51	1681	A tool suite that unlocks the full value of your organization's workforce. PeopleSoft HCM enables you to put the right people in the right jobs, develop and reward top performers, retain key talent for the long term, and increase efficiency and operating performance throughout your organization.	\N	1698	\N
1699	Attribute	Vendor	2008-07-07 13:34:48	2008-07-07 13:34:48	1681	\N	Oracle	1699	\N
1700	Attribute	Acronym	2008-07-07 13:34:48	2008-07-07 13:34:48	1681	\N	HCM	1700	\N
1701	Attribute	License	2008-07-07 13:38:21	2008-07-07 13:38:21	1681	\N		1701	\N
1702	Attribute	Date Implemented	2008-07-07 13:38:21	2008-07-07 13:38:21	1681	\N		1702	\N
1703	Attribute	Acronym	2008-07-07 13:40:06	2008-07-07 13:40:06	1689	\N	ISG	1703	\N
1704	Attribute	Acronym	2008-07-07 13:41:47	2008-07-07 13:41:47	1680	\N	EFM	1704	\N
1705	Attribute	Category	2008-07-07 13:42:44	2008-07-07 13:42:44	1681	\N	Business	1705	\N
1706	Attribute	Sourcing	2008-07-07 13:44:03	2008-07-07 13:44:03	1680	\N	Purchased	1706	\N
1707	InfoNode	Application Servers	2008-07-07 13:45:08	2008-07-07 14:04:33	1732	\N	\N	1707	\N
1708	InfoNode	Application Dependencies	2008-07-07 13:45:08	2008-07-07 14:04:10	1732	\N	\N	1708	\N
1709	InfoNode	Application Datastore	2008-07-07 13:45:08	2008-07-07 14:03:33	1732	\N	\N	1709	\N
1710	Section	wiki page	2008-07-07 13:45:15	2008-07-07 13:46:36	1709	||>||	\N	1710	\N
1713	InfoNode	Peoplesoft Database	2008-07-07 13:46:55	2008-07-07 13:46:55	1709	\N	\N	1713	\N
1714	Section	wiki page	2008-07-07 13:47:34	2008-07-07 13:47:34	1713	Empty...	\N	1714	\N
1715	Attribute	Technology	2008-07-07 13:48:01	2008-07-07 13:48:01	1713	\N	SQL Server	1715	\N
1716	Attribute	Type	2008-07-07 13:48:01	2008-07-07 13:48:01	1713	\N	Relational Database	1716	\N
1717	InfoNode	Authorization Manager	2008-07-07 13:49:04	2008-07-07 13:49:04	1678	\N	\N	1717	\N
1718	Section	wiki page	2008-07-07 13:49:55	2008-07-07 13:50:04	1717	Authorization Manager provides a flexible framework for integrating role-based access control into applications. It enables administrators who use those applications to provide access through assigned user roles that relate to job functions. Authorization Manager applications store authorization policy in the form of authorization stores that are stored in Active Directory or XML files and apply authorization policy at runtime. \r	\N	1718	\N
1719	Attribute	Acronym	2008-07-07 13:52:14	2008-07-07 13:52:14	1717	\N	AUTHMGR	1719	\N
1720	Attribute	Vendor	2008-07-07 13:52:14	2008-07-07 13:52:14	1717	\N	Microsoft	1720	\N
1721	Attribute	License	2008-07-07 13:52:14	2008-07-07 13:52:14	1717	\N		1721	\N
1722	Section	wiki page	2008-07-07 13:52:35	2008-07-07 13:57:49	1708	||>||	\N	1722	\N
1723	InfoNode	Peoplesoft to Auth Manager	2008-07-07 13:53:09	2008-07-07 13:53:09	1708	\N	\N	1723	\N
1724	Section	wiki page	2008-07-07 13:53:15	2008-07-07 13:57:30	1723	Non-sensitive employee data is output from the [[Peoplesoft Database]] in the form of an XML file for use by [[Authorization Manager]].	\N	1724	\N
1725	Attribute	Frequency	2008-07-07 13:57:25	2008-07-07 13:57:25	1723	\N	Nightly	1725	\N
1726	Attribute	Dependency Type	2008-07-07 13:57:25	2008-07-07 13:57:25	1723	\N	Batch	1726	\N
1727	InfoNode	Auth Manager File	2008-07-07 13:58:34	2008-07-07 13:58:52	1709	\N	\N	1727	\N
1728	Section	wiki page	2008-07-07 13:58:38	2008-07-07 14:00:25	1727	A listing of all employees who may need access to enterprise systems.	\N	1728	\N
1729	Attribute	Datastore Type	2008-07-07 13:59:36	2008-07-07 13:59:36	1727	\N	File	1729	\N
1730	Attribute	Technology	2008-07-07 13:59:36	2008-07-07 13:59:36	1727	\N	XML	1730	\N
1731	Section	wiki page	2008-07-07 14:01:53	2008-07-07 14:01:53	1707	Empty...	\N	1731	\N
1732	InfoNode	Application Inventory	2008-07-07 14:02:20	2008-07-07 14:02:20	1559	\N	\N	1732	\N
1733	Section	wiki page	2008-07-07 14:03:08	2008-07-07 14:05:00	1732	||>||\r	\N	1733	\N
1734	InfoNode	Margo	2008-07-09 11:43:10	2008-07-09 11:43:10	1559	\N	\N	1734	\N
1735	Section	wiki page	2008-07-09 11:43:15	2008-07-12 15:27:12	1734	Margo is my best friend.\r\n\r\nShe currently lives in Oregon. \r	\N	1735	\N
1736	Attribute	Hair Color	2008-07-09 11:43:57	2008-07-09 11:43:57	1734	\N	Brown	1736	\N
1737	Attribute	Birthdate	2008-07-09 11:43:57	2008-07-09 11:43:57	1734	\N	October 8	1737	\N
1738	InfoNode	Children	2008-07-09 11:44:10	2008-07-09 11:44:10	1734	\N	\N	1738	\N
1739	Section	wiki page	2008-07-09 11:44:15	2008-07-09 11:45:31	1738	||>||	\N	1739	\N
1740	InfoNode	Trevor	2008-07-09 11:44:40	2008-07-09 11:44:40	1738	\N	\N	1740	\N
1741	InfoNode	Griffin	2008-07-09 11:44:40	2008-07-09 11:44:40	1738	\N	\N	1741	\N
1742	InfoNode	Beatrice	2008-07-09 11:44:40	2008-07-09 11:44:41	1738	\N	\N	1742	\N
1743	Section	wiki page	2008-07-09 11:45:49	2008-07-09 11:45:49	1742	Empty...	\N	1743	\N
1744	Attribute	Hair Color	2008-07-09 11:46:08	2008-07-09 11:46:08	1742	\N	Blond	1744	\N
1746	Section	wiki page	2008-07-09 12:04:25	2008-07-09 12:04:25	1745	Empty...	\N	1746	\N
1747	InfoNode	Fred's Reading List	2008-07-11 08:55:26	2008-07-11 08:55:26	1558	\N	\N	1747	\N
1748	Section	wiki page	2008-07-11 08:55:30	2008-07-11 09:47:02	1747	Books to read:\r\n\r\n* Weinberger, "Everything is miscellaneous" \r\n* Weinberger, "Small pieces, loosely joined"\r\n* Alexander, "The nature of order" (4 vols - 1st two have the meat)\r\n* Wendelken, "Bussiness Rule Patterns"\r\n* Aristotle's "Organaut" - 6 books on logic\r\n* Greene and Elffers, "48 Laws of Power"\r\n* Landauer, "The Trouble with Computers"\r	\N	1748	\N
1749	Section	wiki page	2008-07-12 15:25:12	2008-07-12 15:25:12	1741	Empty...	\N	1749	\N
1750	Section	wiki page	2008-07-12 15:25:17	2008-07-12 15:25:17	1740	Empty...	\N	1750	\N
1751	Attribute	Hair Color	2008-07-12 15:25:53	2008-07-12 15:25:53	1741	\N	Brown	1751	\N
1752	Attribute	Hair Color	2008-07-12 15:26:22	2008-07-15 09:43:12	1740	\N	Brown	1752	\N
1753	Section	wiki page	2008-07-13 20:42:04	2008-07-13 20:42:04	1453	Empty...	\N	1753	\N
1754	Attribute	Birthdate	2008-07-15 09:41:52	2008-07-15 09:41:53	1742	\N	August 17	1754	\N
1755	Attribute	Birthdate	2008-07-15 09:42:28	2008-07-15 09:42:28	1741	\N	November 5	1755	\N
1756	Attribute	Birthdate	2008-07-15 09:42:54	2008-07-15 09:43:12	1740	\N	May 20	1756	\N
1758	InfoNode	Recreational	2008-07-17 16:38:24	2008-07-17 16:38:24	1747	\N	\N	1758	\N
1759	InfoNode	Work related	2008-07-17 16:38:24	2008-07-17 16:38:24	1747	\N	\N	1759	\N
1761	Section	wiki page	2008-07-21 10:12:11	2008-07-21 10:14:42	1760	I'm doing a study on "power" in the scriptures.  Please share your understanding and findings with me.  -Andrew	\N	1761	\N
1762	Attribute	Version	2008-07-21 18:45:21	2008-07-21 18:45:21	1548	\N	NA	1762	\N
1764	Section	wiki page	2008-08-01 18:25:46	2008-08-01 18:33:46	1763	This is a sample list\r\n* one \r\n* two \r\n* three \r\n\r\n[[>]]\r\n\r\n[[>>This is a test]]\r	\N	1764	\N
1765	InfoNode	sub1	2008-08-01 18:29:53	2008-08-01 18:29:53	1763	\N	\N	1765	\N
1766	InfoNode	sub2	2008-08-01 18:29:53	2008-08-01 18:29:53	1763	\N	\N	1766	\N
1767	Section	wiki page	2008-08-01 18:30:39	2008-08-01 18:34:26	1765	\r\n\r\n[[@demo]]\r	\N	1767	\N
1768	InfoNode	This is a test	2008-08-01 18:32:24	2008-08-01 18:33:15	1765	\N	\N	1768	\N
1769	Section	wiki page	2008-08-01 18:32:25	2008-08-01 18:32:28	1768	Empty...	\N	1769	\N
1771	InfoNode	Sean Spearin	2008-09-06 15:28:52	2008-09-06 15:28:52	784	\N	\N	1771	\N
1772	InfoNode	Marty Vieira	2008-09-06 15:28:52	2008-09-06 15:28:52	784	\N	\N	1772	\N
1773	InfoNode	Wayne Perry	2008-09-06 15:28:52	2008-09-06 15:32:21	784	\N	\N	1773	\N
1774	Attribute	Calling	2008-09-06 15:29:49	2008-09-06 15:32:07	1773	\N	Ward Clerk	1774	\N
1775	Attribute	Email	2008-09-06 15:29:49	2008-09-06 15:32:07	1773	\N	ffkp19@earthlink.net	1775	\N
1776	Attribute	First Name	2008-09-06 15:29:50	2008-09-06 15:32:08	1773	\N	Wayne	1776	\N
1777	Attribute	Last Name	2008-09-06 15:29:50	2008-09-06 15:32:08	1773	\N	Perry	1777	\N
1778	Attribute	Phone	2008-09-06 15:29:50	2008-09-06 15:32:08	1773	\N	508-996-2560	1778	\N
1779	Attribute	Calling	2008-09-06 15:32:57	2008-09-06 15:34:04	1771	\N	First Counselor	1779	\N
1780	Attribute	Email	2008-09-06 15:32:57	2008-09-06 15:34:05	1771	\N	Sean_Spearin@hillspet.com	1780	\N
1781	Attribute	First Name	2008-09-06 15:32:58	2008-09-06 15:34:05	1771	\N	Sean	1781	\N
1782	Attribute	Last Name	2008-09-06 15:32:58	2008-09-06 15:34:05	1771	\N	Spearin	1782	\N
1783	Attribute	Phone	2008-09-06 15:32:58	2008-09-06 15:34:05	1771	\N	774-849-5596	1783	\N
1784	Attribute	Calling	2008-09-06 15:34:20	2008-09-06 15:35:07	1772	\N	Second Counselor	1784	\N
1785	Attribute	Email	2008-09-06 15:34:21	2008-09-06 15:35:07	1772	\N	martyteaches@msn.com	1785	\N
1786	Attribute	First Name	2008-09-06 15:34:21	2008-09-06 15:35:07	1772	\N	Marty	1786	\N
1787	Attribute	Last Name	2008-09-06 15:34:21	2008-09-06 15:35:07	1772	\N	Vieira	1787	\N
1788	Attribute	Phone	2008-09-06 15:34:21	2008-09-06 15:35:07	1772	\N	508-636-5603	1788	\N
1790	Section	wiki page	2008-09-12 17:09:35	2008-09-12 17:09:35	1789	Empty...	\N	1790	\N
1792	Section	wiki page	2008-09-27 22:59:05.589331	2008-09-27 22:59:05.606273	1791	Empty...	\N	1792	\N
1793	InfoNode	person	2008-09-27 22:59:14.465473	2008-09-27 22:59:14.472678	1791	\N	\N	1793	\N
1795	Attribute	Phone	2008-09-27 23:00:44.995308	2008-09-27 23:00:45.006728	1793	\N	string	1795	\N
1794	Section	wiki page	2008-09-27 22:59:16.459082	2008-09-27 23:00:59.94078	1793	h3. Tell us about yourself\r\n\r\nh5. Work\r\n\r\nh5. Hobbies\r\n\r\n	\N	1794	\N
1796	Attribute	E-Mail	2008-09-27 23:00:45.043592	2008-09-27 23:03:39.363004	1793	\N	string	1796	\N
1798	Attribute	Phone	2008-09-27 23:01:34.481989	2008-09-27 23:05:32.669461	1560	\N	123-456-7890	1798	\N
1799	Attribute	Phone	2008-09-27 23:07:02.175098	2008-09-27 23:07:02.229991	1558	\N		1799	\N
1800	Attribute	Phone	2008-09-27 23:07:56.690631	2008-09-27 23:07:56.789973	1559	\N		1800	\N
1561	Section	wiki page	2008-07-02 18:29:26	2008-09-28 01:09:01.7534	1559	h2. Projects going on around the house\r\n\r\n* [[Things for Diana to do]]\r\n* [[Things for Fred to do]]\r\n\r\n	\N	1561	\N
1791	InfoNode	_templates	2008-09-27 22:59:00	2008-09-28 01:15:03.248751	1540	\N	\N	99999	
1801	InfoNode	Litter #2	2008-09-28 21:44:10.194776	2008-09-28 21:44:10.205393	1614	\N	\N	1801	\N
1802	Section	wiki page	2008-09-28 21:44:14.263151	2008-09-28 21:53:03.314115	1801	!Marshie_Litter2.jpg!\r\n\r\nMarshie and [[Patches]] had Litter 2 (only one baby) on Friday, September 26, 2008	\N	1802	\N
1620	Section	wiki page	2008-07-06 16:47:32	2008-09-28 22:07:45.52135	1619	!caramel.jpg!\r\n\r\nCaramel is the mother of [[Goldie]], she is also the mother of [[Toffee]]\r\n\r\nCaramel has had three litters of babies\r\n\r\nCaramel and [[Butterscotch]] had [[Litter #1]] on August 8, 2005 <br /> \r\nCaramel and [[Butterscotch]] had [[Litter #2]] on February 2, 2006 <br />\r\nCaramel and [[Butterscotch]] had [[Litter #3]] on July 7, 2006 <br /> \r\nCaramel and [[Patches]] had [[Litter #4]] on January 18, 2008 <br />\r\n\r\n\r\nCaramel died during the birth of Litter #4.\r\n	\N	1620	\N
1803	Attribute	Birthdate	2008-09-28 22:10:18.09578	2008-09-28 22:10:18.10625	1611	\N	January 18, 2008	1803	\N
1804	Attribute	Birthdate	2008-09-28 22:11:27.528515	2008-09-28 22:11:27.536013	1632	\N	August 8, 2005	1804	\N
1805	InfoNode	Genealogy Conferences	2008-10-11 17:25:05.293851	2008-10-11 17:25:05.344369	1559	\N	\N	1805	\N
1806	Section	wiki page	2008-10-11 17:25:09.983489	2008-10-11 17:25:09.993831	1805	Empty...	\N	1806	\N
1807	InfoNode	HERITAGE HARVEST	2008-10-11 17:26:23.780549	2008-10-11 17:26:23.822348	1805	\N	\N	1807	\N
1808	InfoNode	A Genealogy Conference	2008-10-11 17:26:23.886385	2008-10-11 17:26:23.88874	1805	\N	\N	1808	\N
1809	Attribute	Where Born	2008-10-22 16:52:02.940415	2008-10-22 16:52:03.33482	1559	\N	England	1809	\N
1813	Section	wiki page	2008-10-22 16:53:43.95606	2008-10-22 16:53:43.971996	1810	h3. Tell us about yourself\r\n\r\nh5. Work\r\n\r\nh5. Hobbies\r\n\r\n	\N	1813	\N
1814	Attribute	Role	2008-10-22 16:55:08.802957	2008-10-22 16:55:08.806031	1810	\N	Architect	1814	\N
1811	Attribute	E-Mail	2008-10-22 16:53:43.266651	2008-10-22 16:55:33.932911	1810	\N	li_zongliang@emc.com	1811	\N
1812	Attribute	Phone	2008-10-22 16:53:43.936798	2008-10-22 16:55:34.72755	1810	\N	123-456-7890	1812	\N
1817	InfoNode	This is a new topic	2008-10-22 17:01:05.359374	2008-10-22 17:01:05.601179	1815	\N	\N	1817	\N
1545	Section	wiki page	2008-07-02 08:07:30	2008-10-22 16:58:44.06437	1544	The topics under this one are meant to be the starting points for topics that individual users would catalogue. \r\n\r\n\r\nLook to the left margin for the current subtopics of this topic. \r\n\r\nYou can add another... \r\n\r\nNext level subtopics can be enumerated in a list like this (see edit view):\r\n[[>]]\r\n\r\nThat's easy.\r\n\r\nHow about a table of their attributes:\r\n\r\n||>||\r\n\r\nAlso easy.\r\n\r\n[[>Fred]] is a ref to Fred's page and only if it is directly below this topic.\r\n\r\n\r\nh2. Topic page inclusions by ID and by name\r\n\r\n<table>\r\n<tr>\r\n<td valign="top">{{1558}}</td>\r\n<td valign="top">{{Diana}}</td>\r\n</tr>\r\n</table>\r\n	\N	1545	\N
1816	Section	wiki page	2008-10-22 16:59:13.465484	2008-10-22 17:00:59.462864	1815	h3. ATSG Members \r\n\r\n[[@atsg]]\r\n\r\n[[>This is a new topic]]\r\n\r\n\r\n	\N	1816	\N
1818	Section	wiki page	2008-10-22 17:01:05.626111	2008-10-22 17:23:59.608863	1817	<h3>A Header</h3>\r\n\r\n||@is_person||{:select => ['Name', 'E-Mail']}\r\n\r\n	\N	1818	\N
1543	Section	wiki page	2008-07-02 08:06:50	2008-10-25 02:37:36.81945	1542	||.||\r\n\r\nh2. Resources\r\n\r\nPlease see these resources for more information\r\n* Browse the "Textile Markup Reference":http://hobix.com/textile/ \r\n\r\nh2. Special content macros\r\n\r\n* *&#91;&#91;Topic Title]]* inserts a link to the named topic.  If the topic does not exist, the link will be in red. Following the link creates the topic page and places you in the mode of editing its contents.\r\n* *&#91;&#91;>Topic Title]]* find topic directly under the current topic; create under current topic if it needs to be created. \r\n* *&#91;&#91;>>Topic Title]]* find topic in the subtree of topics under the current topic; create under current topic if it needs to be created. \r\n* *&#91;&#91;1234]]* link to topic by ID - see upper-right corner of any view for a topic's ID number. As a consequence of allowing the same topic title to be used for multiple topics at different levels in the hierarchy, a direct ID reference is sometimes required to unambiguously refer to a topic. This also safely links the topic by a value that is not change-able, as opposed to link-by-name, which can be broken when topics are renamed. \r\n\r\n* *&#91;&#91;@tag_name(s)]]* inserts a list of topics that are marked by the given tag name(s). Separate multiple tags by spaces. \r\n* *&#124;&#124;@tag_name(s)||* inserts an attribute table of topics that are marked by the given tag name(s). Separate multiple tags by spaces. \r\n\r\n* *&#91;&#91;>]]* inserts the list of subtopics found immediately under the current topic. \r\n* *&#124;&#124;>||* inserts an attribute table of subtopics found immediately under the current topic.\r\n\r\n* *&#124;&#124;.||* inserts an attribute table for just the current topic. \r\n\r\n* *&#123;&#123;Topic Title}}* finds the topic by name and inserts the full text of the topic in-line at this point.\r\n* *&#123;&#123;1234}}* finds the topic by ID and inserts the full text of the topic number in-line at this point.\r\n\r\n<hr/>\r\n\r\nh5. Table options\r\n\r\nTake a look at this example to see how to specify table options\r\n\r\n||@is_person|| { :select => ['Name', 'E-Mail'], :order_by => 'E-Mail' }\r\n\r\n<hr/>\r\n\r\n\r\nh2. Philosophy\r\n\r\nh3. Why tagging?  \r\n\r\nTags are useful in navigation and in applying semantic rules. First, 'tag' is short way of saying 'classification label' and as such tags are used... well... to classify things.  If I tag a topic with a tag called 'project' I can now ask for the set of topics that bear the tag 'project' and my project topic will be among the matching items. This is different, and better, from having to manually maintain a page that lists projects, and hope that everyone remembers to update the list.  Also, the tag 'project' can be used to collect topics, and to apply rules & constraints to such topics as we will later see. \r\n\r\nFurther, we can assign multiple tags.  For example, I can assign the tags 'active' or 'finished' as well.  Now I can find active projects or finished projects by asking for topics with tags in these combinations.  What I am effectively doing is asking for topics in the intersection of the sets of topics marked by each tag.  We can do several interesting things in OntoRave by leveraging tags as classifications.  See the macros above, for example. \r\n\r\nh3. Why attributes?  \r\n\r\nAttributes are useful for keeping discrete facts about a topic, without needing to read and parse the body of a topic to find them.  So, if we would like to provide a *milestone status* indicator on our project description, we can do so using an attribute, and use markup macros to automatically create tabular summaries of attributes of topics with certain tags.  E.g., we can ask for a table of active projects with their current milestone status.  \r\n\r\nIf it is helpful, think of your topics as information objects, and attributes as descriptive properties attached to those objects that are useful to know from the *outside* of the object, that is, without diving into the text inside. \r\n\r\nh3. Why topic hierarchies?\r\n\r\nWhen organizing information, we use structure to help us.  Recognize that topics don't naturally form a flat space; there are topics, and within them there are subtopics that address specialized areas.  A browse-able hierarchy of topics allows us to group related items, and provides a helpful outline to follow that is separate from the content.  \r\n\r\nCombining this structure with the open-ended support for creating hyperlink references between topics, one creates a "threaded hierarchy" which is arguably more familiar and meaningful than a flat reference graph with no starting points.  \r\n\r\nThat said, use of hierarchy is optional.  OntoRave allows you to just link topics in the usual WiKi way.  Also, it is important to consider what creating a threaded hierarchy means to the information reader/browser.  Many times, it makes more sense to place subtopics as sections within a topic, separated by section headers. \r\n\r\nIn a typical WiKi, there is no concept of "belongs to" among topics. Instead, all topic pages are of equal importance, relevance, and scope.    \r\n\r\nSo, how does this add up to advice about when to create a topic, subtopic, or topic section?  I suggest the following guidelines. \r\n* Don't create hierarchies arbitrarily; they should form a cohesive body of knowlege. \r\n* Think of topic hierarchies in the context of composing chapters of a book.  Within a book, text may refer to another book, or to chapters of other books, but the topics *within* a given book are strongly composed together, and it should make sense for them to be strongly associated in this way. \r\n* In an information flow, topics that feel like "see also" topics should stand on their own, outside of the current hierarchy. \r\n* How strongly is a subtopic connected to its outer topic?  So much so, that if you delete the outer topic, the subtopic goes with it, and its subtopics, all the way down.  That's how you should think of the relationship between topics and subtopics. If the outer topic becomes irrelevant, the subtopic becomes irrelevant as well. \r\n\r\nSubtopic attributes can be rolled up and presented in the context of an outer topic. See above. \r\n\r\nLastly, there is the intent to soon provide a feature to combine the topics within a topic hierarchy in such a way that a single "book" view of the whole can be presented. \r\n\r\n\r\nh2. Advanced features\r\n\r\nh5. Templates\r\n\r\nOne of the more exciting features of OntoRave is its ability to template entire hierarchies of information nodes.  When a template is established, it should be tagged with a tag that uses the naming convention 'as_XYZ' where XYZ is the name of the template as you want it to be referred to by nodes that follow it.  \r\n\r\nTo follow a template, an information node needs to have a tag that uses the naming convention 'is_XYZ' ... which is to say this information item is an XYZ, apply the structure of the information item that demonstrates what it means to act as an XYZ. \r\n\r\nContent, attributes and subtopics are all considered part of a template, and are copied into any node that follows it. Also, if to add items to a template, the next time you open a node that follows it, the node will be caught up to be consistent with the items added. Note that items are never removed from followers if they are removed from a template, becuase the items within the followers may have siginifcant content that would be otherwise be lost. \r\n\r\nNote that template entries do not need to occur in any special place within the information node hierarchy.  Nevertheless, by convention it is a good idea to keep them together.  \r\n\r\nYou can see this demonstrated in the example having to do with the [[person]] template entry.  If you inspect this node, you will see that in both has both content, and a set of attributes. Both will be promoted to any information node that follows it.  \r\n\r\nh5. Automatic tagging\r\n\r\nWhen you create a new person subtopic under [[User areas]] it automatically acquires the 'is_person' tag, and in turn a set of attributes from the person template.  How does the 'is_person' tag get applied to the subtopic?  This tag was added to the [[User areas]] topic with a scope setting to apply it to all subtopics on-going.  \r\n	\N	1543	\N
1585	Attribute	E-Mail	2008-07-04 23:48:19	2008-10-25 02:38:10.928365	1560	\N	asdalbon@comcast.net	1585	\N
1819	InfoNode	OrgTracks	2008-11-13 03:23:07.005138	2008-11-13 03:23:07.163346	1559	\N	\N	1819	\N
1820	Section	wiki page	2008-11-13 03:23:26.465572	2008-11-13 03:23:28.319425	1819	Empty...	\N	1820	\N
1821	InfoNode	Objects	2008-11-13 03:23:52.768369	2008-11-13 03:23:52.770891	1819	\N	\N	1821	\N
1822	InfoNode	Example Users	2008-11-13 03:23:59.036705	2008-11-13 03:23:59.039826	1819	\N	\N	1822	\N
1824	InfoNode	Person	2008-11-13 05:57:02.306013	2008-11-13 05:57:02.341458	1821	\N	\N	1824	\N
1825	InfoNode	Member	2008-11-13 05:57:08.904986	2008-11-13 05:57:08.907675	1821	\N	\N	1825	\N
1826	InfoNode	Speaker	2008-11-13 05:57:16.751681	2008-11-13 05:57:16.754127	1821	\N	\N	1826	\N
1827	InfoNode	Patron	2008-11-13 05:57:25.142364	2008-11-13 05:57:25.145317	1821	\N	\N	1827	\N
1828	InfoNode	Board Member	2008-11-13 05:57:31.81256	2008-11-13 05:57:31.815279	1821	\N	\N	1828	\N
1829	InfoNode	Performer	2008-11-13 05:57:36.75497	2008-11-13 05:57:36.757627	1821	\N	\N	1829	\N
1830	InfoNode	Paid Staff	2008-11-13 05:57:40.874391	2008-11-13 05:57:40.877068	1821	\N	\N	1830	\N
1831	InfoNode	Volunteer	2008-11-13 05:57:45.161339	2008-11-13 05:57:45.163843	1821	\N	\N	1831	\N
1832	InfoNode	Officer	2008-11-13 05:57:49.432292	2008-11-13 05:57:49.43475	1821	\N	\N	1832	\N
1833	InfoNode	Donor	2008-11-13 05:57:53.676841	2008-11-13 05:57:53.679414	1821	\N	\N	1833	\N
1834	InfoNode	Attendee	2008-11-13 05:57:57.736678	2008-11-13 05:57:57.739493	1821	\N	\N	1834	\N
1835	InfoNode	Class	2008-11-13 05:58:01.641103	2008-11-13 05:58:01.643554	1821	\N	\N	1835	\N
1836	InfoNode	Room	2008-11-13 05:58:05.673377	2008-11-13 05:58:05.676287	1821	\N	\N	1836	\N
1837	InfoNode	Exhibitor	2008-11-13 05:58:10.364361	2008-11-13 05:58:10.366756	1821	\N	\N	1837	\N
1838	InfoNode	External Entity	2008-11-13 05:58:14.583529	2008-11-13 05:58:14.586178	1821	\N	\N	1838	\N
1839	InfoNode	Facility	2008-11-13 05:58:18.714442	2008-11-13 05:58:18.717216	1821	\N	\N	1839	\N
1840	InfoNode	Calendar	2008-11-13 05:58:22.479296	2008-11-13 05:58:22.481679	1821	\N	\N	1840	\N
1841	InfoNode	Activity	2008-11-13 05:58:26.476152	2008-11-13 05:58:26.478611	1821	\N	\N	1841	\N
1842	InfoNode	Event	2008-11-13 05:58:30.562071	2008-11-13 05:58:30.564494	1821	\N	\N	1842	\N
1843	InfoNode	Award	2008-11-13 05:58:35.320111	2008-11-13 05:58:35.322748	1821	\N	\N	1843	\N
1844	InfoNode	Program	2008-11-13 05:58:41.331091	2008-11-13 05:58:41.333734	1821	\N	\N	1844	\N
1845	InfoNode	Notification	2008-11-13 05:58:45.409639	2008-11-13 05:58:45.412057	1821	\N	\N	1845	\N
1846	Section	wiki page	2008-11-13 05:58:56.463554	2008-11-13 06:01:07.252241	1834	[[Person]]	\N	1846	\N
1823	Section	wiki page	2008-11-13 05:52:38.590292	2008-11-13 05:52:39.849014	1821	Empty...	\N	1823	\N
1847	Section	wiki page	2008-11-13 06:01:11.778763	2008-11-13 06:01:14.174653	1824	Empty...	\N	1847	\N
1618	Section	wiki page	2008-07-06 16:46:42	2008-11-20 04:33:20.01743	1611	!goldie1.jpg!\r\n\r\nh5. Bottlefeeding Goldie having been orphaned after the death of her mother [[Caramel]].  \r\n\r\n[[Marshie]] adopted Goldie and fed and cared for her as if she was part of her own [[Litter #1]]\r\n\r\n<div><object width="425" height="344"><param name="movie" value="http://www.youtube.com/v/TXNqbIwN3P8&hl=en&fs=1"></param><param name="allowFullScreen" value="true"></param><embed src="http://www.youtube.com/v/TXNqbIwN3P8&hl=en&fs=1" type="application/x-shockwave-flash" allowfullscreen="true" width="425" height="344"></embed></object></div>\r\n\r\nGoldie died suddenly (apparently of dehydration) on November 9, 2008	\N	1618	\N
1567	Section	wiki page	2008-07-02 19:10:19	2009-01-26 04:50:07.900045	1558	h2. Projects going on around the house\r\n\r\n* [[Things for Fred to do]]\r\n* [[Things for Diana to do]]\r\n\r\n[[Where does this end up?]]\r\n\r\nSee [[1548]]\r\n\r\n[[986123946]]\r\n	\N	1567	\N
1453	InfoNode	Bishops	2008-06-24 19:17:24	2008-12-09 12:54:58.778479	781	\N	\N	1453	<p class="spacer">&nbsp;</p>\r\n\r\n<%\r\n   bishops = elements_with_all_tags('is_person')\r\n   bishops = bishops.select{|p| ['Bishop','Branch President'].include?(p.get_attr_value('Calling')) } \r\n   \r\n   emails = bishops.collect{|p| "#{p.name} &lt;#{p.get_attr_value('Email')}&gt;" }\r\n%>\r\n\r\n<%= labeled_node_list bishops, :label => 'Bishops' %>\r\n\r\n<h3>Bishop (or Counselor) E-Mail Addresses (comma separated)</h3>\r\n\r\n<p>\r\n<%= emails.join(",<br />")  %>\r\n</p>\r\n\r\n<h3>Bishoprics and Stake Leadership (as of 12/08)</h3>\r\n<p>\r\nmatt.r.allen@gmail.com, thmsarmtg@aol.com, tlbadstubn@aol.com, bungybug@comcast.net, mabsaguaro@comcast.net, bradbennion@verizon.net, berryphotos@comcast.net, stevebetznotary@aol.com, john.biega@verizon.net, dpblackburn@gmail.com, bart.byerly@genzyme.com, jcalkins@detma.org, rgc8146@aol.com, rclarke55@gmail.com, cookad@yahoo.com, corb.doug@epa.gov, phcorkum@juno.com, doaners@yahoo.com, cgdoughty@aol.com, d_eastman@hotmail.com, leif.erickson@fmr.com, tom-flanagan@comcast.net, joegiles2@yahoo.com, griggw@southcoast.org, bobgrovescc@aol.com, jesseohansen@yahoo.com, codyscottharward@yahoo.com, jodyheaton@mac.com, schigginson@verizon.net, c.hocking@comcast.net, jimirey2@gmail.com, dlandrith@mac.com, gdlaws@comcast.net, PaulLeitch_@msn.com, jimack104@comcast.net, KMacKaybyu@hotmail.com, csmaire@aol.com, miles.davemiles@gmail.com, gmoessing@netscape.net, brockandkristina@gmail.com, Scottorton@Hotmail.com, billpellegrini@yahoo.com, ffkp19@earthlink.net, japeterson@deloitte.com, barbarapeterson43@attbi.com, jonathanpolleys@comcast.net, OldMayhewFarm@gmail.com, rick.rice@live.com, usafe7ret@gmail.com, nathan@sandlands.org, mark.small6@verizon.net, evan.smith@bingham.com, Sean_Spearin@hillspet.com, paulspencerlds@yahoo.com, cjwt4@comcast.net, frank.truscott@iai.com, martyteaches@msn.com, cvolpetti@aol.com, bward@westwoodglobal.com, rwestergard@ascoa.com, rwhite38l@verizon.net, fredwild@gmail.com, wzagieboylo@msn.com, zeller101@verizon.net\r\n</p>\r\n
1848	InfoNode	Fred's Blog	2008-12-19 04:09:24.823833	2008-12-19 04:09:24.861303	\N	\N	\N	1848	\N
1851	Section	wiki page	2008-12-19 04:21:52.922066	2008-12-19 04:21:52.961728	1850	Empty...	\N	1851	\N
1853	Section	wiki page	2008-12-19 04:24:04.053023	2008-12-19 04:24:04.06106	1852	Empty...	\N	1853	\N
1849	Section	wiki page	2008-12-19 04:09:26.210039	2008-12-19 04:32:07.595265	1848	h3. Welcome\r\n\r\nHello and welcome to my blog.  I've posted a number of writings on various topics. They are grouped into these categories:\r\n\r\n* [[A brief history of places I've worked ]]\r\n* [[Things I want my kids to know]]\r\n	\N	1849	\N
1855	Section	wiki page	2008-12-19 04:39:48.684849	2008-12-19 04:39:50.409692	1854	Empty...	\N	1855	\N
1857	Section	wiki page	2008-12-19 04:56:23.55871	2008-12-19 04:56:25.638253	1856	Empty...	\N	1857	\N
1859	Section	wiki page	2008-12-19 04:57:44.080858	2008-12-19 04:57:46.279044	1858	Empty...	\N	1859	\N
1860	InfoNode	John Stobart	2009-01-10 17:43:25.560497	2009-01-10 17:43:25.663674	1544	\N	\N	1860	\N
1861	Attribute	E-Mail	2009-01-10 17:43:30.562027	2009-01-10 17:43:32.03862	1860	\N		1861	\N
1862	Attribute	Phone	2009-01-10 17:43:32.04205	2009-01-10 17:43:32.054788	1860	\N		1862	\N
1863	Section	wiki page	2009-01-10 17:43:32.060114	2009-01-10 17:43:32.075599	1860	h3. Tell us about yourself\r\n\r\nh5. Work\r\n\r\nh5. Hobbies\r\n\r\n	\N	1863	\N
1866	InfoNode	Life in Canada	2009-01-10 17:44:12.333491	2009-01-10 17:44:12.335974	1860	\N	\N	1866	\N
1867	InfoNode	Life in US	2009-01-10 17:44:12.34725	2009-01-10 17:44:12.349909	1860	\N	\N	1867	\N
1868	Section	wiki page	2009-01-10 17:45:12.876575	2009-01-10 17:45:13.516016	1865	Empty...	\N	1868	\N
1869	InfoNode	Paintings	2009-01-10 17:45:41.045422	2009-01-10 17:45:41.121426	1860	\N	\N	1869	\N
1865	InfoNode	2 College of Art	2009-01-10 17:44:12.318133	2009-01-10 17:46:46.752904	1860	\N	\N	1865	\N
1870	Section	wiki page	2009-01-10 17:47:15.061339	2009-01-10 17:47:15.763506	1864	Empty...	\N	1870	\N
1864	InfoNode	1 Life in Derby	2009-01-10 17:44:12.302971	2009-01-10 17:48:00.560045	1860	\N	\N	1864	\N
1872	Attribute	E-Mail	2009-01-25 20:52:59.127203	2009-01-25 20:52:59.877835	1871	\N		1872	\N
1873	Attribute	Phone	2009-01-25 20:52:59.880872	2009-01-25 20:52:59.894156	1871	\N		1873	\N
1874	Section	wiki page	2009-01-25 20:52:59.899868	2009-01-25 20:52:59.91625	1871	h3. Tell us about yourself\r\n\r\nh5. Work\r\n\r\nh5. Hobbies\r\n\r\n	\N	1874	\N
1875	Section	wiki page	2009-01-26 04:48:29.009578	2009-01-26 04:48:29.879126	1867	Empty...	\N	1875	\N
1876	Section	wiki page	2009-01-26 04:48:37.569066	2009-01-26 04:48:38.918361	1869	Empty...	\N	1876	\N
1878	Section	wiki page	2009-01-26 04:50:18.229737	2009-01-26 04:50:38.881811	1877	At the top level of course... 	\N	1878	\N
1880	Section	wiki page	2009-01-26 05:01:12.825064	2009-01-26 05:01:12.871204	1879	Empty...	\N	1880	\N
1570	Attribute	Version	2008-07-02 22:26:45	2009-01-26 05:01:59.992611	1542	\N	0.3	1570	\N
1647	Section	wiki page	2008-07-06 18:44:14	2009-01-31 05:06:19.835556	1646	\r\nh5. Litter #1 babies with [[Goldie]] their step sister.\r\n\r\nThe two babies are Marshie's babies.\r\n\r\nBoar: [[Patches]]	\N	1647	\N
1608	Section	wiki page	2008-07-06 16:38:14	2009-03-20 15:13:24.860242	1607	\r\nh2. Links to piggies\r\n\r\n[[>]]\r\n\r\nh2. Table of piggies\r\n\r\n||>||\r\n	\N	1608	\N
1541	Section	wiki page	2008-07-01 19:38:52	2009-02-27 04:02:30.395911	1540	!>fred.jpg!\r\n\r\nh2. Welcome to OntoRave!\r\n\r\nHello and welcome to OntoRave!  \r\n\r\nOn first inspection, OntoRave looks like a WiKi. In fact, it is meant to be used like a WiKi and offers features that are familiar to WiKi users, but there's more... it is more useful than your run-of-the-mill WiKi... \r\n\r\nOntoRave brings together a number of interesting things that make the WiKi style much more useful.  Among the things that OntoRave does that you won't find [yet] in other WiKi-like information capture environments are these:\r\n* Tagging \r\n* Attributes\r\n* Hierarchies of topics\r\n\r\nThis is a [[Sample topic]] - at one time it was a red-link ... following a red link will create a topic with that title.\r\n\r\nTo add pages of your own, please see the [[OntoRave Reference]] and then start adding your own topics under [[User areas]] - and don't worry if your pages end up somewhere else; things are easily re-arranged later if needed. \r\n\r\nYou are now in a given Domain called "TestOntoRave" ... OntoRave is a multi-tenant application, able to host any number of domains in a single server.  As a member of this domain, you can see and edit its pages, but others belonging to different domains can not.  \r\n\r\n\r\nh2. More information\r\n\r\nSee these topics for more:\r\n* See the markup of this page as an example by clicking the Edit button\r\n* Browse the "Textile Markup Reference":http://hobix.com/textile/ \r\n\r\nSee also:\r\n[[@onto_help]]\r\n\r\n... and here is a tabular list of those same items with their attributes.\r\n\r\n||@onto_help||\r\n	\N	1541	\N
1881	Attribute	Star Quality	2009-03-20 15:12:26.419319	2009-03-20 15:12:26.475487	1613	\N	5	1881	\N
1882	InfoNode	Smart Card Research	2009-06-01 03:19:04.645057	2009-06-01 03:19:04.652633	1559	\N	\N	1882	\N
1884	InfoNode	Articles	2009-06-01 03:19:20.378069	2009-06-01 03:19:20.385017	1882	\N	\N	1884	\N
1885	InfoNode	Contacts	2009-06-01 03:19:28.394443	2009-06-01 03:19:28.396992	1882	\N	\N	1885	\N
1886	InfoNode	Ecebs	2009-06-01 03:19:49.875242	2009-06-01 03:19:49.919892	1882	\N	\N	1886	\N
1889	InfoNode	Prospective Customers	2009-06-01 03:20:37.480074	2009-06-01 03:20:37.483002	1882	\N	\N	1889	\N
1898	Section	wiki page	2009-06-01 03:23:55.076584	2009-06-01 03:23:55.128729	1885	Empty...	\N	1898	\N
1900	Section	wiki page	2009-06-01 03:24:41.808914	2009-06-01 03:25:24.055259	1899	www.mikehendry.co.uk\r\n\r\n	\N	1900	\N
1903	Section	wiki page	2009-06-01 03:26:33.606084	2009-06-01 03:28:03.178079	1902	http://www.actividentity.com/solutions/market/\r\n\r\nActivIdentity Market Solutions\r\n\r\nActivIdentity's strong authentication and credential management solutions are addressing the key "ID 360 market-driving sectors": Employer-to-Employee, Business-to-Customer, and Government-to-Citizen. Organizations in all these market segments can leverage ActivIdentity's strong authentication platform and credential management system to apply a common approach to registration / enrollment, authentication, authorization, auditing, credential issuance / management, and use of credentials across each of the ID 360 market segments. This approach takes into account that organizations in all ID 360 market segments require the assurance of a trusted chain of identity that allows them to conduct their day-to-day business in the digital age with the same level of confidence as face-to-face transactions.\r\n	\N	1903	\N
1906	Section	wiki page	2009-06-01 03:32:14.199145	2009-06-01 03:34:52.134629	1905	http://www.oti.co.il/\r\n\r\nSecured Contactless Solutions\r\n\r\nSite does not mention Healthcare as a target.	\N	1906	\N
1908	Section	wiki page	2009-06-01 03:35:18.071399	2009-06-01 03:35:42.398638	1907	*Article in BusinessWeek*\r\nhttp://investing.businessweek.com/research/stocks/private/snapshot.asp?privcapId=29446	\N	1908	\N
1911	Section	wiki page	2009-06-01 04:02:33.735337	2009-06-01 04:02:38.165889	1910	international standards ISO/IEC 7816 and ISO/IEC 14443	\N	1911	\N
1919	Section	wiki page	2009-06-01 12:04:07.329506	2009-06-01 12:04:07.378478	1918	Empty...	\N	1919	\N
1921	Section	wiki page	2009-06-01 12:04:20.038824	2009-06-01 12:04:20.10446	1920	Empty...	\N	1921	\N
1924	InfoNode	BI Tools	2009-06-01 14:59:34.171696	2009-06-01 14:59:34.174512	1559	\N	\N	1924	\N
1926	InfoNode	Relational Solutions	2009-06-01 14:59:45.105548	2009-06-01 14:59:45.108638	1923	\N	\N	1926	\N
1890	Section	wiki page	2009-06-01 03:20:39.540399	2009-06-01 15:46:33.973929	1889	"Epic Systems":http://www.epicsystems.com/\r\n\r\n"Companies already partnering with Epic Systems":http://www.epicsystems.com/relationships-vendors.php	\N	1890	\N
1913	Section	wiki page	2009-06-01 04:06:10.863109	2009-06-01 18:03:50.073586	1912	"Health Insurance Portability and Accountability Act of 1996 (HIPAA)":http://en.wikipedia.org/wiki/HIPAA\r\n\r\n"US Compliance Requirements for Effectively Securing Vital Digital and Physical Assets":http://www.nextgov.com/the_basics/tb_20080610_8037.php\r\n	\N	1913	\N
1894	Section	wiki page	2009-06-01 03:21:10.353092	2009-06-01 03:21:10.362332	1891	Empty...	\N	1894	\N
1897	Section	wiki page	2009-06-01 03:22:14.359995	2009-06-01 03:25:37.958597	1896	This paper provides an introduction to Smart Card Management Systems (SCMS). It is written primarily for organizations that are considering issuing cards to their customers, employees, members or citizens. Smart cards offer more functionality and more security than other card types (such as magnetic stripe cards).\r\n\r\nThe paper describes the main functions of an SCMS, and in particular the special functions needed by each user sector; as one of the advantages of smart cards is their ability to carry multiple applications. It is therefore important that any SCMS being considered can handle the functions needed by all different application types on the card. Following a review of the specific needs of a SCMS by a variety of industry sectors, the paper continues with a review of the issues involved in procuring an SCMS.\r\n\r\nReproduced with permission from Mike Hendry MA (Cantab) MBA CEng MIEE: www.mikehendry.co.uk	\N	1897	\N
1910	InfoNode	Standards	2009-06-01 04:02:30.028326	2009-06-01 04:02:30.031018	1882	\N	\N	1910	\N
1912	InfoNode	Regulation	2009-06-01 04:06:08.748183	2009-06-01 04:06:08.750659	1882	\N	\N	1912	\N
1915	Section	wiki page	2009-06-01 04:08:46.497779	2009-06-01 04:08:52.07491	1914	http://www.lifemedid.com/how.aspx	\N	1915	\N
1917	Section	wiki page	2009-06-01 04:17:43.665807	2009-06-01 04:17:49.792578	1916	http://www.lifenexus.com/about.php	\N	1917	\N
1918	InfoNode	Enterprise Architecture	2009-06-01 12:04:04.753269	2009-06-01 12:04:04.757564	1559	\N	\N	1918	\N
1920	InfoNode	Tools - Free	2009-06-01 12:04:15.624312	2009-06-01 12:04:15.626756	1918	\N	\N	1920	\N
1923	InfoNode	Applimatics Competition	2009-06-01 14:59:20.852731	2009-06-01 14:59:20.855203	1559	\N	\N	1923	\N
1899	InfoNode	Mike Hendry	2009-06-01 03:24:36.097072	2009-06-01 03:24:36.099607	1885	\N	\N	1899	\N
1904	Section	wiki page	2009-06-01 03:30:33.785552	2009-06-01 03:31:12.06796	1893	http://www.epicsystems.com/\r\n\r\n*Epic Partners*\r\n\r\nhttp://www.epicsystems.com/relationships-vendors.php\r\n	\N	1904	\N
1922	InfoNode	iteraplan	2009-06-01 12:04:37.429505	2009-06-01 12:04:37.432188	1920	\N	\N	1922	\N
1925	Section	wiki page	2009-06-01 14:59:37.208085	2009-06-01 14:59:37.243097	1923	Empty...	\N	1925	\N
1927	Section	wiki page	2009-06-01 14:59:48.153922	2009-06-01 14:59:54.564066	1926	http://www.relationalsolutions.com	\N	1927	\N
1930	Section	wiki page	2009-06-01 15:45:14.645771	2009-06-01 18:20:18.315835	1888	"Smart Card Alliance":http://www.smartcardalliance.org/\r\n\r\nThe Smart Card Alliance is a not-for-profit, multi-industry association working to stimulate the understanding, adoption, use and widespread application of smart card technology. Through specific projects such as education programs, market research, advocacy, industry relations and open forums, the Alliance keeps its members connected to industry leaders and innovative thought. The Alliance is the single industry voice for smart cards, leading industry discussion on the impact and value of smart cards in the U.S. and Latin America. 	\N	1930	\N
1883	Section	wiki page	2009-06-01 03:19:07.145765	2009-06-01 18:34:15.513386	1882	"Glossary of Security Related Terms":http://www.rsa.com/glossary/default.asp?id=1050\r\n\r\n"Smart Card Alliance":http://www.smartcardalliance.org/\r\n\r\nThe Smart Card Alliance is a not-for-profit, multi-industry association working to stimulate the understanding, adoption, use and widespread application of smart card technology. Through specific projects such as education programs, market research, advocacy, industry relations and open forums, the Alliance keeps its members connected to industry leaders and innovative thought. The Alliance is the single industry voice for smart cards, leading industry discussion on the impact and value of smart cards in the U.S. and Latin America. \r\n\r\n"May 2009 Smart Card Conference":http://www.ctst.com/CTST09/agenda.html\r\nsponsored by the Smart Card Alliance	\N	1883	\N
1928	Section	wiki page	2009-06-01 15:43:29.894759	2009-06-01 15:43:29.929429	1909	Empty...	\N	1928	\N
1895	Section	wiki page	2009-06-01 03:21:50.072566	2009-06-01 18:15:38.064344	1884	"Smart Card Management Systems An overview by Mike Hendry":http://www.actividentity.com/whitepapers/scms/SCMS_Overview_and_Survey.pdf\r\n\r\n"Healthcare Identity Management Is Necessary First Step to Electronic Health Record Interchange, Says Smart Card Alliance Healthcare Council":http://findarticles.com/p/articles/mi_pwwi/is_200904/ai_n31490128/?tag=content;col1\r\n\r\n"RFID Tags and Contactless Smart Card Technology: Comparing and Contrasting Applications and Capabilities":http://www.hidglobal.com/documents/tagsVsSmartcards_wp_en.pdf\r\n\r\n"RSA (EMC) Security Unveils Smart Card Management System & Infrastructure for Governments and Enterprises Worldwide":http://www.rsa.com/press_release.aspx?id=6254	\N	1895	\N
1931	Section	wiki page	2009-06-01 15:46:36.765019	2009-06-01 15:46:36.813073	1892	Empty...	\N	1931	\N
1887	InfoNode	Players	2009-06-01 03:19:59.265831	2009-06-01 15:53:09.080549	1882	\N	\N	1887	\N
1932	InfoNode	History	2009-06-01 18:13:47.794598	2009-06-01 18:13:47.797319	1884	\N	\N	1932	\N
1933	Section	wiki page	2009-06-01 18:13:51.388284	2009-06-01 18:14:19.741429	1932	*Smarter than you think: although many European and Asian countries embrace smart cards with personal health information, U.S. healthcare organizations are slow to adopt them.* (Authentication/Biometrics)\r\n\r\nArticle from:Health Management Technology Article date:December 1, 2003 Author: Reynolds, Phil\r\nDaily life is becoming more mobile, including in healthcare. It seems like everyone carries his own cellphone, and laptops and personal digital assistants (PDAs) allow physicians to get anytime, anywhere access to patient information.\r\n\r\nComfortable with the mobility and efficiency that new technologies offer, many European and Asian countries have provided smart cards with personal health information to their citizens, but U.S. healthcare organizations (HCOs) have been slow to get onboard with the secure, portable devices (Figure 1). It's unusual behavior for a country that considers itself to be a technology leader.\r\n\r\nThe Grass Is Always Greener ...\r\n\r\nThe standard healthcare smart card is a credit card-size plastic card that contains an embedded microprocessor chip and memory, so compressed, encrypted data can be written to and read from the card. Memory size is as high as 64 KB, which permits storage of about 500 pages of text, but no significant graphical information. Larger memory allows additional functionality such as making copayments or verifying a stored personal identification number, and some cards display a photograph or a biometric thumbprint to help identify the cardholder.\r\n\r\nAll of the cards, though, contain some kind of basic health information such as a person's name, allergies and an emergency contact--data extracted by card software from a healthcare information system or entered directly into the application.\r\n\r\nEarly this summer, Taiwan issued a 32 KB card with personal health information to more than 22 million citizens. The European Commission has proposed June 1, 2004, as the launch date for a common health insurance smart card to facilitate health treatment that European Union citizens might need during a temporary stay in a member country. France got an early start with smart cards in 1993 with its Sesam-Vitale card that began as a health insurance card containing only administrative data, but later became a health card also holding personal health information.\r\n\r\nIn contrast, there have been a number of U.S. healthcare smart card deployments in the past decade, but most were government or pilot programs of limited scope. The Department of Defense began issuing MARCs (Multi-Technology Automated Reader Cards) as multifunctional IDs in 1994 to nearly 200,000 troops. The Western Governor's Association distributed cards to about 25,000 pregnant women, mothers and children in public health programs during the first phase of its 1999 pilot Health Passport Project. In January, The New England Partners Project awarded a contract for its pilot that includes about 10,000 people participating in public health and human services programs.\r\n\r\nOn the private side, Precis Smart Card Systems conducted a 1994 pilot in Oklahoma City that involved physician practices, hospitals, ambulances, pharmacies and about 3,000 patients, but it suffered from a lack of computer-based patient record data. The University of Pittsburgh Medical Center rolled out its Healthcare Passport card to 300 UPMC Health Plan members in 2001; it has since issued 10 times that number of cards to other patients.\r\n\r\n"Our federal government is investing in an infrastructure initially being used as an ID card, but it's establishing a platform to take the costs out of services such as healthcare that it provides to its employees," says Randy Vanderhoof, executive director of the Smart Card Alliance. "The major challenge in healthcare is that the motivations for patients, doctors and insurance companies are not going to benefits everyone at the same level."\r\n\r\nWhy Not Healthcare?\r\n\r\nAs in other countries, smart cards are more widely used for finance, transportation and mobile communications in the U.S., so why not healthcare? There are several factors:\r\n\r\nGovernment. Unlike many European and Asian countries, the U.S. has no national healthcare system. U.S. healthcare is provided primarily by private, manage care organizations with competing interests. "Our government took the first step in healthcare with HIPAA regulations, but that's far from the type of influence the Taiwanes and French governments have had," Vanderhoof says.\r\n\r\nProfessional culture. HCOs want to remove inefficiencies to be more profitable, but there is no over-seeing entity driving them to implement smart cards. One theory is that if payers don't endorse smart cards, it discourages HCOs from using them. "If smart cards facilitate faster claims processing, insurance companies would have to pay off doctors more quickly," Vanderhoof says.\r\n\r\nCost. Typically, the costs of smart cards and readers have been prohibitive for anything but a government program or the smallest pilot, but as technology advances, the cost of cards decreases and their price-to-performance ratios improve. The typical card now costs about $1 and a USB-connectible reader costs about $10. HCOs that don't want to foot the bills themselves for a wide-scale deployment will have to seek government or private funding--or charge consumers directly.\r\n\r\nInfrastructure. Smart cards require readers, and few healthcare providers have them. Given the popularity of both desktop and mobile computers, some vendors now manufacture PCs, laptops and PDAs with built-in card readers. "Connectivity and getting users to use readers was an overwhelming obstacle, but this will become less of a problem as time goes on," Vanderhoof says.\r\n\r\nInteroperability. Since vendors are utilizing different operating systems for their smart cards, it is difficult to ensure that the cards can be used at varied sites, which is crucial for wide-scale deployments. However, industry executives have formed committees to discuss setting standards for smart cards, including a common application programming interface such as Java--perhaps the most widely used operating system worldwide.\r\n\r\nPrivacy. Americans are much more concerned about privacy than Europeans and Asians, so anything that challenges their privacy is considered threatening. "The privacy advocates are a very strong voice, and they're all against the government being able to identify us. They want anonymity, which is considered to be a basic right of our society," Vanderhoof says.\r\n\r\nSocial culture. Smart card technology use is prevalent in Europe, so Europeans are used to it and they understand it. Americans aren't, and they haven't been provided with a logical case of what smart cards would offer them. "You don't sell the customer on the technology, but on the benefits of the technology. That's the approach healthcare providers should be making to their customers." Vanderhoof says.\r\n\r\nDespite these challenges, HCOs and providers across the nation continue to demonstrate their interest in and dedication to smart cards.\r\n\r\nShowing One Cares\r\n\r\nWhen Dan Dietrich, M.D., was diagnosed with cancer in 2000, he experienced what many patients experience when they visit different physicians and facilities: repeatedly filling out paperwork to provide his medical history, including an allergy to penicillin.\r\n\r\nFrustrated with having to answer the same questions over and over again, Dietrich co-founded the company Health Data Card (HDC) in Omaha, Neb., in June 2001 to provide a smart card of the same name with basic but important health information on a secure, portable device that people could present to healthcare providers.\r\n\r\nLast year, HDC began a pilot program involving Dietrich's Alegent Health Family Care Clinic in Omaha. Dietrich bought the cards for about 500 of his patients and charged them nothing. He entered the patient's demographics, immunizations, allergies, emergency information and current medications into the HDC system. Dietrich printed all of this information for the patient to verify before he issued a 16 KB card with the encrypted, compressed data.\r\n\r\nPhysicians in his consultant group get the read/write software and readers free. "It gives nurses a jumpstart in getting information from a patient," he says. "From a doctor's standpoint, it's a way of saying that they really care about their patients by giving the cards to them free."\r\n\r\nHowever, many cardholders were disappointed when they learned that most of Omaha's emergency rooms (ERs) could not read the cards, so HDC began providing the ERs with free read-only software and card readers. HDC also gave the software and readers gratis to local emergency response units, which knew when someone had a card by a sticker on that person's home or vehicle window. Also, HDC offered the software and readers to physicians outside of the Omaha area such as those who treat cardholders spending the winter in Florida.\r\n\r\nUse of the card meets HIPAA regulations, since its information is not moving directly from doctor to doctor. "As a physician, it took a big worry out of my hands because the patient is in control of his own information. There's a blind consent when giving the card to another doctor," Dietrich says.\r\n\r\nSince the software and readers are licensed only to medical professionals, the card does not require user authentication, according to Dietrich. "I think people have trust in our system," he says. "The chip is much more secure than paper records, and we didn't want to put any more responsibilty on doctors. Patients are more concerned about people hacking into Internet-based information rather than a card in their possession."\r\n\r\nMaking Information Mobile\r\n\r\nTo provide better care for more than 1 million ER and ambulatory care visits by many patients who do not speak English, Queens Health Network (QHN) in New York City began issuing smart cards with health information in August. QHN comprises Elmhurst and Queens Hospital Centers, 15 community-based medical centers and practices, and six school-based health centers.\r\n\r\nElmhurst Health Connection Cards will be issued to about 10,000 patients of the Adult Primary Care service at Elmhurst Hospital during the next year, as the first phase of a pilot program, it is the first step in trying to share more patient information with physicians in the NYC Health and Hospitals Corp., of which QHN is a member, so that smart cards become part of the organization's information infrastructure, according to Al Marino, QHN's CIO.\r\n\r\nThe health network has provided free read-only software and card readers to the ERs at 10 other NYC hospitals, and it hopes to work with local hospitals as well as ambulance systems so they get the software and readers. QHN has spent about $200,000 on the program since July 2002, and it hopes to get grant money to expand the program to areas such as Women's Health services.\r\n\r\n"We're trying to change our focus to improving health outcomes by moving information better," Marino says. "We want to be able to share information not just within our own health system, but within the community, and so patients have access to their information. We're excited about a patient being able to provide their information in an emergency situation."\r\n\r\nEach card, manufactured by Redwood City, Calif.-based Gemplus Corp., consists of the patient's photo ID and a 64 KB chip that contains compressed text data such as name, address, emergency contact, allergies, current medications and recent lab results. The cards are updated automatically each patient visit through Elmhurst's adult mary Care service.\r\n\r\nQHN complies with HIPAA regulations by patients that their cards contain personal health information and that they need to take caution in using the cards. "Patients can choose to give their card to whomever they want," Marino says. "That's their permission being granted when they give it to someone."\r\n\r\nAlthough the cards do not require user authentication at participating hospitals, additional security measures could be developed for other settings such as a community health clinic or a kiosk, where a patient could access his card directly. Potentially, read/write software and readers could be given free to patients for use in their homes as part of a home healthcare program. "Patients are interested in the cards, and they can see a benefit in them," Marino says. "So far, the program looks positive."\r\n\r\nImproving Community Health\r\n\r\nMunroe Regional Medical Center (VRMC), a not-for-profit, 422-bed acute care hospital in Ocala, Fla., started using smart cards in 2000 to promote a healthier community. MRMC partnered with Grand Rapids, Mich.-based Conduit Healthcare Solutions as a beta site to provide the Medical Data Card to members of its Prestige 55 program, which offers vascular, cholesterol and diabetes screenings, mammograms and other preventative tests to seniors. The program began with more than 2,000 participants, but now almost 16,500 Prestige 55 members carry the card.\r\n\r\n"Prestige 55 is the largest program at Munroe, and it was the easiest way to get a group into a pilot program," says Jennifer Wood, executive director of Volunteer and Senior Services at MRMC. "I was looking for something that could decrease staff workload and increase members' interaction with us. I felt smart cards would be the best way to go in the long run to provide services and information. They're certainly better than using bar codes or magnetic strip cards."\r\n\r\nThe 8 KB microprocessor chip card uses text files to store the last three results of each screening, as well as the member's MRMC medical records number, health plan information, primary care doctor, chronic medical history, allergies, emergency directives and living will contact. Prestige 55's annual $8 membership fees exclusively fund the card program.\r\n\r\nAlthough the cards can be read only via her staff's laptops, Wood is working on getting readers into MRMC's ER and a local ambulance service. She also is considering implementing a kiosk system, perhaps at satellite locations, so that cardholders can read designated information on their cards.\r\n\r\n"One of the troublesome areas for us is portability. Until smart cards are being used extensively in other parts of the country, ours are only good in our area," Wood says. "Smart card technology is not as prevalent in our country compared to other countries, but I'd like to see it happen here."\r\n\r\nMembers voiced their displeasure in not being able to use their cards during the 18-month period beginning in early 2002 when Wood suspended the cards' use while she investigated their compliance with HIPAA regulations. Now, if a member wants to give his card's information to a physician, the member must first sign a permission form before the card's information is printed.\r\n\r\nWood has experienced frustration with the smart card program, but only because she and her staff have been unable to devote a sufficient amount of time to improving it further. "We didn't realize it would grow so far," she says. "Our progress would have gone faster if we had a team devoted to implementing it, but we don't have the time to plan and market it."\r\n\r\nRealizing the Future\r\n\r\nFor smart cards to become a commonplace healthcare device in the U.S., it will require the cooperation of diverse, competitive and complementary interests.\r\n\r\n"We will see healthcare consortiums such as regional entities moving to this technology and implementations on an individual basis. They will become models for other groups to follow suit. If they control all of the pieces, then they can get a quicker ROI, but if they have to go outside of the homogenous system, it could be more difficult for them due to possible different technology being used," Vanderhoof says. "Healthcare providers could have individual health information on a national ID card that serves other purposes, using the U.S. government as a model, but there isn't a political will to do so."\r\n\r\n \r\nFigure 1: Healthcare Smart Cards, Worldwide \r\n \r\n   North America \r\n \r\nMillions of % of \r\nYear   Units Shipped Revenues \r\n \r\n2000   0.02 0.1 \r\n2001   0.08 0.5 \r\n2002 * 0.22 1.6 \r\n2003 * 1.08 8.0 \r\n2004 * 2.6612.3 \r\n2005 * 5.1214.0 \r\n \r\n Europe \r\n \r\nMillions of   % of \r\nYear   Units Shipped Revenues \r\n \r\n2000   41.10   98.3 \r\n2001   19.70   88.1 \r\n2002 * 15.20   80.7 \r\n2003 * 12.30   67.4 \r\n2004 * 17.50   60.8 \r\n2005 * 26.60   53.6 \r\n \r\n  Asia/Pacific \r\n \r\nMillions of   % of \r\nYear   Units Shipped Revenues \r\n \r\n2000   0.65 1.6 \r\n2001   3.1411.4 \r\n2002 * 5.3917.7 \r\n2003 * 9.6824.5 \r\n2004 *18.2226.8 \r\n2005 *38.3132.4 \r\n \r\nAll figures are rounded. Base year is 2001. * = projected. \r\nSource: Frost & Sullivan, 2002 Study. \r\nFor more information about smart cards from Conduit. www.rsleads.com/312ht-201\r\n\r\nFor more information about smart cards from Gemplus, www.rsleads.com/312ht-202\r\n\r\nFor more information about smart cards from HDC, www.rsleads.com/312ht-203	\N	1933	\N
1901	Section	wiki page	2009-06-01 03:25:49.069139	2009-06-01 18:28:42.783852	1887	"For Patient Records*\r\n\r\n"Almex Ltd. Smartcard Solutions":http://www.smartcardsource.com/health.html?gclid=COKY1q-T6JoCFSAhDQodjXNGBw\r\n\r\n"ActivIdentity Market Solutions":http://www.actividentity.com/solutions/market/\r\n\r\nActivIdentity’s strong authentication and credential management solutions are addressing the key “ID 360 market-driving sectors”: Employer-to-Employee, Business-to-Customer, and Government-to-Citizen. Organizations in all these market segments can leverage ActivIdentity’s strong authentication platform and credential management system to apply a common approach to registration / enrollment, authentication, authorization, auditing, credential issuance / management, and use of credentials across each of the ID 360 market segments. This approach takes into account that organizations in all ID 360 market segments require the assurance of a trusted chain of identity that allows them to conduct their day-to-day business in the digital age with the same level of confidence as face-to-face transactions.\r\n\r\n"LifeMed":http://www.lifemedid.com/how.aspx\r\n\r\n"LIfeNexus":http://www.lifenexus.com/about.php\r\n\r\n"On Track Innovations LTD":http://www.oti.co.il/\r\nSecured Contactless Solutions.  Site does not mention Healthcare as a target.\r\n\r\n"ZeitControl Card System":http://www.basiccard.com\r\n\r\n"HID Global":http://www.hidglobal.com/\r\nMakes the Omnikey Smartcard Reader\r\nEMC RSA uses the Omnikey Smart Card Reader\r\n\r\n"Intercede":http://www.intercede.com/products.aspx\r\nIntercede has a strategic partnership with EMC RSA for Smart Card technology.  In fact, EMC RSA bought "MyID"\r\n\r\n"Trust Bearer Digital Identity":http://www.trustbearer.com/health/\r\n"Video":http://www.youtube.com/watch?v=smLcOxRM4MQ\r\n\r\n*Pharmaceutical etc.*\r\n"Gemalto":http://www.gemalto.com/php/pr_view.php?id=538	\N	1901	\N
1929	Section	wiki page	2009-06-01 15:45:10.632613	2009-06-18 02:27:48.395774	1886	"Ecebs":http://www.ecebs.com/index.asp\r\n\r\n"Multifile Description":http://www.ecebs.com/multefile.asp\r\n\r\n"Multifile Brochure":http://www.ecebs.com/downloads/Multefile.pdf\r\n\r\n"Multifile for Healthcare Brochure":http://www.ecebs.com/downloads/healthcards.pdf\r\n\r\n"Introducing Multifile":http://www.ecebs.com/downloads/IntroducingMultefilewhitepaper.pdf\r\n\r\n"CTO - Barry Hochfield":http://www.linkedin.com/profile?viewProfile=&key=861449&authToken=XRI_&authType=name&trk=coprofile_popular&goback=.cps_1245290352195_1	\N	1929	\N
1934	InfoNode	Information Strategy	2009-06-20 12:56:19.297797	2009-06-20 12:56:19.32277	1559	\N	\N	1934	\N
1936	InfoNode	The Value of Information	2009-06-20 13:10:23.415978	2009-06-20 13:10:23.418472	1934	\N	\N	1936	\N
1937	Section	wiki page	2009-06-20 13:10:40.460777	2009-06-20 13:12:43.365052	1936	Current regulations do not permit capitalization of internally generated intangible assets such as information and knowledge, although encouraging progress has been made. Two notions which are gaining increasing clarity and credence in this area are the concepts of structural capital and customer capital. \r\n\r\n*Structural Capital* is what's left in the company when the employees go home at night. This includes the information, systems and processes that are built into the company's operations, patents and other intellectual property. \r\n\r\n*Customer capital* is the value locked up in brands, customer databases and the quality of relationships. \r\n\r\nSome leading organizations are considering these new types of capital within the context of "performance statements." These are attachments to their annual reports which may potentially improve the view of their equity base by placing value on these intangible assets. Performance statements attempt to quantify the impact on business results which is attributable to information utilization that would allow traditional financial calculations such as return on assets (ROA) to include a company's information capital. This particular mechanism may or may not ultimately succeed, but rest assured that some similar instrument will soon be used to drive explicit valuations of a company's information capital. \r\n\r\n*Formulate and execute your information strategy with a valuation method in mind to put your organization ahead of the competition.*	\N	1937	\N
1938	Attribute	Author Name	2009-06-20 13:25:37.171497	2009-06-20 13:25:37.194839	1934	\N	John Destefano	1938	\N
1939	Attribute	Author Description	2009-06-20 13:25:37.260932	2009-06-20 13:25:37.263758	1934	\N	John Distefano is a vice president with Cap Gemini Ernst & Young and is practice leader for the firm's business intellig	1939	\N
1935	Section	wiki page	2009-06-20 12:56:25.443151	2009-06-20 13:27:47.01916	1934	An effective information strategy should \r\n* Vision: of connecting the corporate strategy, the e-business strategy and the information asset. \r\n* Scope: \r\n** what is needed to achieve the mission of the enterprise. \r\n** encompass all types of business information including: \r\n*** transaction system data, \r\n*** customer contact data, \r\n*** Web data, \r\n*** decision support data and \r\n*** external syndicated data. \r\n* Road Map: for building the information asset over time. \r\n* Business priorities and budget realities will likely require an infrastructure which evolves. \r\n* Capturing, managing and administering data is neither trivial nor inexpensive. The appropriate data-governing processes must be described in the information strategy. \r\n* Specifying information architecture and enabling technologies is essential, and an ongoing process for information valuation should be provided.\r\n\r\nImplementation\r\nTwo separate perspectives must be balanced when approaching the information strategy. First, design and build the information strategy and related infrastructure from the customer value point. Information content, access needs, security parameters, management protocols, timeliness and inter-enterprise exchanges can all be derived when dissecting the business strategy. Use this to guide the development of the information strategy. Second, recognize that the information strategy will be put into motion from the information forward. This means that an effective information strategy will serve as a catalyst for improving business operations and competitive advantage through information leverage. At some level, either implicitly or explicitly, it should challenge the organization to perform better. To keep the information strategy germane and impactful, organizational processes, dedicated resources, effectiveness measurement criteria and ongoing executive commitment are critical. The following steps (illustrated in Figure 1) summarize the process for developing and implementing an information strategy.\r\n\r\nAlign the information strategy with the business imperatives.\r\nDefine communities of information producers and consumers (both external and internal).\r\nMap usage requirements, access needs and business applications.\r\nDefine the information content model.\r\nIdentify cost-effective data sources and storage structures.\r\nEstablish data stewardship functions.\r\nInitiate value measurement processes.\r\nImplement refinements for continuous improvement.\r\n\r\nThe Value of Information\r\nPlacing value on a company's information asset has significant implications for shareholder wealth measurement. An information strategy is an appropriate, if not the only, avenue to address this key issue. \r\nCurrent regulations do not permit capitalization of internally generated intangible assets such as information and knowledge, although encouraging progress has been made. Two notions which are gaining increasing clarity and credence in this area are the concepts of structural capital and customer capital. Structural capital is what's left in the company when the employees go home at night. This includes the information, systems and processes that are built into the company's operations, patents and other intellectual property. Customer capital is the value locked up in brands, customer databases and the quality of relationships. Some leading organizations are considering these new types of capital within the context of "performance statements." These are attachments to their annual reports which may potentially improve the view of their equity base by placing value on these intangible assets. Performance statements attempt to quantify the impact on business results which is attributable to information utilization that would allow traditional financial calculations such as return on assets (ROA) to include a company's information capital. This particular mechanism may or may not ultimately succeed, but rest assured that some similar instrument will soon be used to drive explicit valuations of a company's information capital. Formulate and execute your information strategy with a valuation method in mind to put your organization ahead of the competition.\r\n\r\n	\N	1935	\N
1940	InfoNode	Smart Card Management System	2009-06-24 12:46:22.01259	2009-06-24 12:46:22.076801	1882	\N	\N	1940	\N
1941	Section	wiki page	2009-06-24 12:47:49.825497	2009-06-24 20:02:26.584281	1940	a SCMS must be able \r\n"taken from this page":http://pierreheuze.blogspot.com/2008_08_01_archive.html\r\n\r\n"A system is a set of objects together with relationships between the objects and between their attributes." (in 'Definition of System' by Hall and Fagen, 1956).\r\n\r\n* to provide information on the different applications present on a card. \r\n** application’s expiration, \r\n** application’s access for a particular project, \r\n** type of data that can be viewed by individuals \r\n** and so on. \r\n* to provide post issuance capabilities. This allows for other applications to be added on to a card.\r\n\r\nA SCMS is a set of objects: \r\n* Card Image Database[1], \r\n* Card Personalisation System[2], \r\n* Data Preparation[3] and \r\n* Key Management[4], \r\n* Post-Issuance Server[5], \r\n* Card Management Server[6]... \r\n\r\n*Muddy Definition*\r\n*Paradox*\r\nWe are using the SCMS terminology for the whole system and one of its part - the Card Management Server. \r\nThe next *controversial aspect* is the application data, this often handled inconsistently. For example, in the above quote, consideration is given in terms of application data that can be viewed but post-issuance is limited to adding application on the card and not data application update. Then depending on the market where such SCMS are deployed, other features such as cardholder data or EMV parameters might be included. Those topics subject to interpretation have created the situation in which there isn't a clear definition of a SCMS.\r\n\r\n	\N	1941	\N
1942	Section	wiki page	2009-07-23 02:00:44.668263	2009-07-23 02:00:44.76667	1924	Empty...	\N	1942	\N
1943	Section	wiki page	2009-07-23 02:13:04.351553	2009-07-23 02:13:04.359776	1822	Empty...	\N	1943	\N
1944	Section	wiki page	2009-07-23 02:13:10.335214	2009-07-23 02:13:10.345076	1841	Empty...	\N	1944	\N
1945	Section	wiki page	2009-07-23 02:13:17.669418	2009-07-23 02:13:17.680783	1828	Empty...	\N	1945	\N
1946	Section	wiki page	2009-07-23 02:14:16.715221	2009-07-23 02:14:16.721293	1807	Empty...	\N	1946	\N
1947	Section	wiki page	2009-07-23 02:14:22.846797	2009-07-23 02:14:23.063219	1808	Empty...	\N	1947	\N
1948	Section	wiki page	2009-07-23 02:14:34.769714	2009-07-23 02:14:34.786807	1922	Empty...	\N	1948	\N
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY properties (id, name, value, item_item_id) FROM stdin;
9	derived_from	436	462
10	derived_from	437	463
11	derived_from	436	469
12	derived_from	437	470
13	derived_from	425	473
14	derived_from	474	475
45	derived_from	652	647
46	derived_from	653	648
48	derived_from	654	656
55	derived_from	672	693
56	derived_from	671	694
57	derived_from	685	695
58	derived_from	673	696
59	derived_from	688	697
60	derived_from	689	698
61	derived_from	699	700
62	derived_from	699	701
63	derived_from	672	702
64	derived_from	671	703
65	derived_from	685	704
66	derived_from	673	705
67	derived_from	688	706
68	derived_from	689	707
70	derived_from	724	725
71	derived_from	749	746
72	derived_from	752	750
73	derived_from	755	757
75	derived_from	753	759
76	derived_from	756	760
77	derived_from	761	762
78	derived_from	749	764
79	derived_from	755	768
80	derived_from	761	769
81	derived_from	753	770
82	derived_from	756	771
83	derived_from	752	772
84	derived_from	755	773
85	derived_from	761	774
86	derived_from	753	775
87	derived_from	756	776
88	derived_from	752	777
89	derived_from	749	780
93	derived_from	795	801
94	derived_from	787	802
95	derived_from	788	803
96	derived_from	795	804
97	derived_from	787	805
98	derived_from	788	806
99	derived_from	795	810
100	derived_from	787	811
101	derived_from	788	812
102	derived_from	813	814
103	derived_from	813	815
104	derived_from	816	807
105	derived_from	816	824
106	derived_from	795	825
107	derived_from	787	826
108	derived_from	788	827
109	derived_from	813	828
110	derived_from	816	829
111	derived_from	795	830
112	derived_from	787	831
113	derived_from	788	832
114	derived_from	813	833
115	derived_from	816	838
116	derived_from	795	839
117	derived_from	787	840
118	derived_from	788	841
119	derived_from	813	842
120	derived_from	816	843
121	derived_from	795	844
122	derived_from	787	845
123	derived_from	788	846
124	derived_from	813	847
125	derived_from	816	848
126	derived_from	795	849
127	derived_from	787	850
128	derived_from	788	851
129	derived_from	813	852
130	derived_from	816	854
131	derived_from	795	855
132	derived_from	787	856
133	derived_from	788	857
134	derived_from	813	858
135	derived_from	816	859
136	derived_from	795	860
137	derived_from	787	861
138	derived_from	788	862
139	derived_from	813	863
140	derived_from	816	864
141	derived_from	795	865
142	derived_from	787	866
143	derived_from	788	867
144	derived_from	813	868
145	derived_from	816	869
146	derived_from	795	870
147	derived_from	787	871
148	derived_from	788	872
149	derived_from	813	873
150	derived_from	816	874
151	derived_from	795	875
152	derived_from	787	876
153	derived_from	788	877
154	derived_from	813	878
155	derived_from	816	879
156	derived_from	795	880
157	derived_from	787	881
158	derived_from	788	882
159	derived_from	813	883
160	derived_from	816	887
161	derived_from	795	888
162	derived_from	787	889
163	derived_from	788	890
164	derived_from	813	891
165	derived_from	816	892
166	derived_from	795	893
167	derived_from	787	894
168	derived_from	788	895
169	derived_from	813	896
170	derived_from	816	897
171	derived_from	795	898
172	derived_from	787	899
173	derived_from	788	900
174	derived_from	813	901
175	derived_from	816	902
176	derived_from	795	903
177	derived_from	787	904
178	derived_from	788	905
179	derived_from	813	906
180	derived_from	816	919
181	derived_from	795	920
182	derived_from	787	921
183	derived_from	788	922
184	derived_from	813	923
185	derived_from	816	924
186	derived_from	795	925
187	derived_from	787	926
188	derived_from	788	927
189	derived_from	813	928
190	derived_from	816	929
191	derived_from	795	930
192	derived_from	787	931
193	derived_from	788	932
194	derived_from	813	933
195	derived_from	816	934
196	derived_from	795	935
197	derived_from	787	936
198	derived_from	788	937
199	derived_from	813	938
200	derived_from	816	939
201	derived_from	795	940
202	derived_from	787	941
203	derived_from	788	942
204	derived_from	813	943
205	derived_from	816	944
206	derived_from	795	945
207	derived_from	787	946
208	derived_from	788	947
209	derived_from	813	948
210	derived_from	816	949
211	derived_from	795	950
212	derived_from	787	951
213	derived_from	788	952
214	derived_from	813	953
215	derived_from	816	954
216	derived_from	795	955
217	derived_from	787	956
218	derived_from	788	957
219	derived_from	813	958
220	derived_from	816	959
221	derived_from	795	960
222	derived_from	787	961
223	derived_from	788	962
224	derived_from	813	963
225	derived_from	816	964
226	derived_from	795	965
227	derived_from	787	966
228	derived_from	788	967
229	derived_from	813	968
230	derived_from	816	969
231	derived_from	795	970
232	derived_from	787	971
233	derived_from	788	972
234	derived_from	813	973
235	derived_from	816	974
236	derived_from	795	975
237	derived_from	787	976
238	derived_from	788	977
239	derived_from	813	978
240	derived_from	816	983
241	derived_from	795	984
242	derived_from	787	985
243	derived_from	788	986
244	derived_from	813	987
245	derived_from	816	988
246	derived_from	795	989
247	derived_from	787	990
248	derived_from	788	991
249	derived_from	813	992
250	derived_from	816	993
251	derived_from	795	994
252	derived_from	787	995
253	derived_from	788	996
254	derived_from	813	997
255	derived_from	816	998
256	derived_from	795	999
257	derived_from	787	1000
258	derived_from	788	1001
259	derived_from	813	1002
260	derived_from	816	1016
261	derived_from	795	1017
262	derived_from	787	1018
263	derived_from	788	1019
264	derived_from	813	1020
270	derived_from	816	1026
271	derived_from	795	1027
272	derived_from	787	1028
273	derived_from	788	1029
274	derived_from	813	1030
275	derived_from	816	1031
276	derived_from	795	1032
277	derived_from	787	1033
278	derived_from	788	1034
279	derived_from	813	1035
280	derived_from	816	1036
281	derived_from	795	1037
282	derived_from	787	1038
283	derived_from	788	1039
284	derived_from	813	1040
285	derived_from	816	1041
286	derived_from	795	1042
287	derived_from	787	1043
288	derived_from	788	1044
289	derived_from	813	1045
290	derived_from	816	1046
291	derived_from	795	1047
292	derived_from	787	1048
293	derived_from	788	1049
294	derived_from	813	1050
295	derived_from	816	1051
296	derived_from	795	1052
297	derived_from	787	1053
298	derived_from	788	1054
299	derived_from	813	1055
300	derived_from	816	1056
301	derived_from	795	1057
302	derived_from	787	1058
303	derived_from	788	1059
304	derived_from	813	1060
305	derived_from	816	1061
306	derived_from	795	1062
307	derived_from	787	1063
308	derived_from	788	1064
309	derived_from	813	1065
310	derived_from	816	1066
311	derived_from	795	1067
312	derived_from	787	1068
313	derived_from	788	1069
314	derived_from	813	1070
315	derived_from	816	1072
316	derived_from	795	1073
317	derived_from	787	1074
318	derived_from	788	1075
319	derived_from	813	1076
320	derived_from	816	1077
321	derived_from	795	1078
322	derived_from	787	1079
323	derived_from	788	1080
324	derived_from	813	1081
325	derived_from	816	1095
326	derived_from	795	1096
327	derived_from	787	1097
328	derived_from	788	1098
329	derived_from	813	1099
330	derived_from	816	1101
331	derived_from	795	1102
332	derived_from	787	1103
333	derived_from	788	1104
334	derived_from	813	1105
335	derived_from	816	1106
336	derived_from	795	1107
337	derived_from	787	1108
338	derived_from	788	1109
339	derived_from	813	1110
340	derived_from	816	1111
341	derived_from	795	1112
342	derived_from	787	1113
343	derived_from	788	1114
344	derived_from	813	1115
345	derived_from	816	1116
346	derived_from	795	1117
347	derived_from	787	1118
348	derived_from	788	1119
349	derived_from	813	1120
353	derived_from	1092	1124
354	derived_from	1094	1125
355	derived_from	1093	1126
356	derived_from	816	1127
357	derived_from	795	1128
358	derived_from	787	1129
359	derived_from	788	1130
360	derived_from	813	1131
361	derived_from	1092	1132
362	derived_from	1094	1133
363	derived_from	1093	1134
364	derived_from	816	1135
365	derived_from	795	1136
366	derived_from	787	1137
367	derived_from	788	1138
368	derived_from	813	1139
369	derived_from	816	1140
370	derived_from	795	1141
371	derived_from	787	1142
372	derived_from	788	1143
373	derived_from	813	1144
374	derived_from	1092	1146
375	derived_from	1094	1147
376	derived_from	1093	1148
377	derived_from	1092	1156
378	derived_from	1094	1157
379	derived_from	1093	1158
380	derived_from	816	1159
381	derived_from	795	1160
382	derived_from	787	1161
383	derived_from	788	1162
384	derived_from	813	1163
385	derived_from	816	1164
386	derived_from	795	1165
387	derived_from	787	1166
388	derived_from	788	1167
389	derived_from	813	1168
390	derived_from	816	1169
391	derived_from	795	1170
392	derived_from	787	1171
393	derived_from	788	1172
394	derived_from	813	1173
395	derived_from	816	1174
396	derived_from	795	1175
397	derived_from	787	1176
398	derived_from	788	1177
399	derived_from	813	1178
400	derived_from	816	1179
401	derived_from	795	1180
402	derived_from	787	1181
403	derived_from	788	1182
404	derived_from	813	1183
405	derived_from	1092	1185
406	derived_from	1094	1186
407	derived_from	1093	1187
408	derived_from	816	1188
409	derived_from	795	1189
410	derived_from	787	1190
411	derived_from	788	1191
412	derived_from	813	1192
413	derived_from	1092	1195
414	derived_from	1094	1196
415	derived_from	1093	1197
416	derived_from	1092	1203
417	derived_from	1094	1204
418	derived_from	1093	1205
419	derived_from	1092	1212
420	derived_from	1094	1213
421	derived_from	1093	1214
422	derived_from	1092	1217
423	derived_from	1094	1218
424	derived_from	1093	1219
425	derived_from	1092	1221
426	derived_from	1094	1222
427	derived_from	1093	1223
428	derived_from	816	1241
429	derived_from	813	1242
430	derived_from	816	1243
436	derived_from	1092	1255
437	derived_from	1094	1256
438	derived_from	1093	1257
439	derived_from	816	1258
440	derived_from	795	1259
441	derived_from	787	1260
442	derived_from	788	1261
443	derived_from	813	1262
444	derived_from	816	1263
445	derived_from	795	1264
446	derived_from	787	1265
447	derived_from	788	1266
448	derived_from	813	1267
449	derived_from	816	1268
450	derived_from	795	1269
451	derived_from	787	1270
452	derived_from	788	1271
453	derived_from	813	1272
454	derived_from	816	1273
455	derived_from	795	1274
456	derived_from	787	1275
457	derived_from	788	1276
458	derived_from	813	1277
459	derived_from	816	1278
460	derived_from	795	1279
461	derived_from	787	1280
462	derived_from	788	1281
463	derived_from	813	1282
473	derived_from	1309	1310
474	derived_from	1308	1311
475	derived_from	1309	1321
476	derived_from	1308	1322
479	derived_from	1334	1337
480	derived_from	1333	1338
481	derived_from	1334	1339
482	derived_from	1333	1340
483	derived_from	1342	1343
484	derived_from	1342	1344
485	derived_from	816	1412
486	derived_from	795	1413
487	derived_from	787	1414
488	derived_from	788	1415
489	derived_from	813	1416
490	derived_from	816	1418
491	derived_from	795	1419
492	derived_from	787	1420
493	derived_from	788	1421
494	derived_from	813	1422
495	derived_from	816	1424
496	derived_from	795	1425
497	derived_from	787	1426
498	derived_from	788	1427
499	derived_from	813	1428
500	derived_from	816	1430
501	derived_from	795	1431
502	derived_from	787	1432
503	derived_from	788	1433
504	derived_from	813	1434
510	derived_from	816	1442
511	derived_from	795	1443
512	derived_from	787	1444
513	derived_from	788	1445
514	derived_from	813	1446
515	derived_from	816	1448
516	derived_from	795	1449
517	derived_from	787	1450
518	derived_from	788	1451
519	derived_from	813	1452
520	derived_from	1345	1347
521	derived_from	816	1774
522	derived_from	795	1775
523	derived_from	787	1776
524	derived_from	788	1777
525	derived_from	813	1778
526	derived_from	816	1779
527	derived_from	795	1780
528	derived_from	787	1781
529	derived_from	788	1782
530	derived_from	813	1783
531	derived_from	816	1784
532	derived_from	795	1785
533	derived_from	787	1786
534	derived_from	788	1787
535	derived_from	813	1788
537	derived_from	1796	1797
546	passcode	Friend!	1540
547	passcode	LDS!	781
548	passcode	FHC!	1789
549	passcode	G2User!	1745
539	derived_from	1796	1585
538	derived_from	1795	1798
536	derived_from	1794	1566
431	derived_from	816	1244
432	derived_from	795	1245
433	derived_from	787	1246
434	derived_from	788	1247
435	derived_from	813	1248
265	derived_from	816	1021
266	derived_from	795	1022
267	derived_from	787	1023
268	derived_from	788	1024
269	derived_from	813	1025
553	passcode	fhw3	1848
550	derived_from	1796	1811
551	derived_from	1795	1812
552	derived_from	1794	1813
557	derived_from	1796	1872
558	derived_from	1795	1873
559	derived_from	1794	1874
554	derived_from	1796	1861
555	derived_from	1795	1862
556	derived_from	1794	1863
540	derived_from	1796	1584
542	derived_from	1795	1799
541	derived_from	1794	1567
69	derived_from	699	722
49	derived_from	672	680
50	derived_from	671	681
52	derived_from	685	686
51	derived_from	673	682
53	derived_from	688	690
54	derived_from	689	691
24	derived_from	479	496
27	derived_from	477	485
25	derived_from	481	497
26	derived_from	478	498
22	derived_from	488	494
28	derived_from	501	502
543	derived_from	1796	1583
545	derived_from	1795	1800
544	derived_from	1794	1561
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY schema_migrations (version) FROM stdin;
0
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY tags (id, name) FROM stdin;
59	friend
68	template
69	is_domain
70	as_domain
71	modeler
72	as_person
73	is_person
81	is_address
82	as_address
83	as_client
84	is_client
87	is_bus_word
88	as_bus_word
89	is_bus_term
90	as_bus_term
91	_apply_tag_is_person
92	as_person_list
93	is_person_list
94	is_unit
95	as_unit
96	_apply_tag_is_unit
98	as_action_item
99	_domain_398
100	_domain_667
101	_domain_733
102	_domain_765
103	_domain_781
105	_domain_1295
106	is_project
107	as_proj
108	as_project
109	_domain_1326
110	is_doctor
111	as_doctor
112	xyz
113	_domain_1352
114	_is_view
115	_as_wiki
116	_is_wiki
117	fred pic
118	fred
119	pic
120	summer
121	beach
122	example
123	help_info
124	test
125	alena
126	web_pages
128	home
129	_domain_1540
130	onto_help
131	_apply_tag_person
132	person
133	business
134	personal
135	family
136	guinea_pig
137	_apply_tag_guinea_pig
138	Toffee
140	Security
141	Finance
142	demo
143	list_example
144	atsg
145	_domain_1848
146	Healthcare
147	Healthcare_Facility_Access
\.


--
-- Data for Name: tags_items_items; Type: TABLE DATA; Schema: public; Owner: app35549
--

COPY tags_items_items (tag_src_id, item_dest_id) FROM stdin;
59	399
68	421
69	403
69	405
69	406
69	457
70	421
71	399
71	471
72	476
72	786
73	399
73	791
73	797
73	808
73	809
73	817
73	818
73	819
73	820
73	821
73	822
73	823
73	834
73	835
73	836
73	837
73	853
73	884
73	885
73	886
73	907
73	908
73	909
73	910
73	911
73	912
73	913
73	914
73	915
73	916
73	917
73	918
73	979
73	980
73	981
73	982
73	1003
73	1004
73	1005
73	1006
73	1007
73	1008
73	1009
73	1010
73	1011
73	1012
73	1013
73	1014
73	1015
73	1083
73	1084
73	1085
73	1086
73	1087
73	1088
73	1089
73	1091
73	1150
73	1151
73	1152
73	1153
73	1154
73	1155
73	1250
73	1251
73	1252
73	1253
73	1254
73	1411
73	1417
73	1423
73	1429
73	1441
73	1447
73	1771
73	1772
73	1773
81	595
82	650
83	669
84	677
84	678
84	679
87	736
87	737
87	778
87	779
88	748
89	735
89	766
89	767
90	751
91	784
91	792
92	792
94	1071
94	1100
94	1145
94	1149
94	1184
94	1194
94	1202
94	1211
94	1216
94	1220
94	1249
95	1082
96	782
98	1193
99	398
99	399
99	400
99	401
99	402
99	403
99	405
99	406
99	421
99	436
99	437
99	442
99	444
99	445
99	457
99	462
99	463
99	469
99	470
99	471
99	476
99	543
99	594
99	595
99	596
99	597
99	598
99	599
99	600
99	601
99	602
99	603
99	604
99	605
99	606
99	607
99	608
99	609
99	610
99	611
99	612
99	613
99	614
99	615
99	616
99	617
99	618
99	619
99	620
99	621
99	622
99	623
99	624
99	625
99	626
99	627
99	628
99	629
99	630
99	631
99	632
99	633
99	634
99	635
99	636
99	637
99	638
99	639
99	640
99	641
99	642
99	643
99	644
99	645
99	650
100	667
100	668
100	669
100	670
100	674
100	675
100	677
100	678
100	679
100	688
100	689
100	690
100	691
100	697
100	698
100	706
100	707
100	708
100	1466
100	1496
100	1507
100	1509
100	1511
100	1516
100	1521
100	1523
100	1528
100	1532
100	1536
100	1538
101	733
101	734
101	735
101	736
101	737
101	738
101	739
101	740
101	741
101	742
101	743
101	744
101	745
101	746
101	747
101	748
101	749
101	750
101	751
101	752
101	764
101	766
101	767
101	772
101	777
101	778
101	779
101	780
102	765
103	781
103	782
103	783
103	784
103	785
103	786
103	791
103	792
103	797
103	808
103	809
103	817
103	818
103	819
103	820
103	821
103	822
103	823
103	834
103	835
103	836
103	837
103	853
103	884
103	885
103	886
103	907
103	908
103	909
103	910
103	911
103	912
103	913
103	914
103	915
103	916
103	917
103	918
103	979
103	980
103	981
103	982
103	1003
103	1004
103	1005
103	1006
103	1007
103	1008
103	1009
103	1010
103	1011
103	1012
103	1013
103	1014
103	1015
103	1071
103	1082
103	1083
103	1084
103	1085
103	1086
103	1087
103	1088
103	1089
103	1091
103	1092
103	1093
103	1094
103	1100
103	1124
103	1125
103	1126
103	1132
103	1133
103	1134
103	1145
103	1146
103	1147
103	1148
103	1149
103	1150
103	1151
103	1152
103	1153
103	1154
103	1155
103	1156
103	1157
103	1158
103	1184
103	1185
103	1186
103	1187
103	1193
103	1194
103	1195
103	1196
103	1197
103	1202
103	1203
103	1204
103	1205
103	1206
103	1207
103	1211
103	1212
103	1213
103	1214
103	1216
103	1217
103	1218
103	1219
103	1220
103	1221
103	1222
103	1223
103	1225
103	1226
103	1227
103	1228
103	1229
103	1230
103	1231
103	1232
103	1236
103	1237
103	1238
103	1239
103	1240
103	1249
103	1250
103	1251
103	1252
103	1253
103	1254
103	1255
103	1256
103	1257
103	1313
103	1314
103	1319
103	1411
103	1417
103	1423
103	1429
103	1441
103	1447
103	1453
103	1454
103	1455
103	1771
103	1772
103	1773
105	1296
105	1297
105	1298
105	1299
105	1300
105	1301
105	1302
105	1303
105	1304
105	1305
105	1306
105	1307
105	1323
105	1324
105	1325
106	1296
106	1297
106	1298
106	1299
108	1301
109	1327
109	1328
109	1329
109	1331
109	1332
109	1345
109	1346
109	1347
110	1328
110	1329
111	1332
112	1328
112	1329
114	1453
114	1454
114	1455
116	667
116	1540
116	1745
118	667
118	1558
119	667
120	667
120	1523
121	667
122	1466
123	1496
124	667
124	1496
124	1509
124	1511
124	1516
124	1523
125	1528
125	1532
126	1528
129	1542
129	1544
129	1548
129	1558
129	1559
129	1560
129	1571
129	1573
129	1581
129	1593
129	1597
129	1607
129	1609
129	1610
129	1611
129	1612
129	1613
129	1614
129	1619
129	1632
129	1634
129	1636
129	1639
129	1641
129	1646
129	1678
129	1680
129	1681
129	1682
129	1689
129	1707
129	1708
129	1709
129	1713
129	1717
129	1723
129	1727
129	1732
129	1734
129	1738
129	1740
129	1741
129	1742
129	1747
129	1758
129	1759
129	1765
129	1766
129	1768
130	1542
130	1548
133	1573
134	1573
135	1573
136	1609
136	1610
136	1611
136	1612
136	1613
136	1614
136	1619
136	1632
137	1607
137	1632
140	1682
141	1680
129	1791
129	1793
72	1793
73	1559
73	1558
91	1544
73	1560
129	1801
129	1805
129	1807
129	1808
129	1817
129	1819
129	1821
129	1822
129	1824
129	1825
129	1826
129	1827
129	1828
129	1829
129	1830
129	1831
129	1832
129	1833
129	1834
129	1835
129	1836
129	1837
129	1838
129	1839
129	1840
129	1841
129	1842
129	1843
129	1844
129	1845
144	1558
116	1848
73	1860
129	1860
129	1864
129	1865
129	1866
129	1867
129	1869
129	1882
129	1884
129	1885
129	1886
129	1887
129	1889
129	1899
129	1910
129	1912
129	1918
129	1920
129	1922
129	1923
129	1924
129	1926
129	1932
129	1934
129	1936
129	1940
\.


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: app35549; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: properties_pkey; Type: CONSTRAINT; Schema: public; Owner: app35549; Tablespace: 
--

ALTER TABLE ONLY properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: app35549; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: fk_info_nodes_ref_targets_items_did; Type: INDEX; Schema: public; Owner: app35549; Tablespace: 
--

CREATE INDEX fk_info_nodes_ref_targets_items_did ON info_nodes_ref_targets_items USING btree (item_dest_id);


--
-- Name: fk_items_info_node_info_node_id; Type: INDEX; Schema: public; Owner: app35549; Tablespace: 
--

CREATE INDEX fk_items_info_node_info_node_id ON items USING btree (info_node_info_node_id);


--
-- Name: fk_properties_item_item_id; Type: INDEX; Schema: public; Owner: app35549; Tablespace: 
--

CREATE INDEX fk_properties_item_item_id ON properties USING btree (item_item_id);


--
-- Name: fk_tags_items_items_did; Type: INDEX; Schema: public; Owner: app35549; Tablespace: 
--

CREATE INDEX fk_tags_items_items_did ON tags_items_items USING btree (item_dest_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: app35549; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

