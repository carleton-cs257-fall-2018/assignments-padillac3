--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: agegroup; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE agegroup AS ENUM (
    '18 - 29',
    '30 - 44',
    '45 - 59',
    '60+'
);


--
-- Name: density; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE density AS ENUM (
    'rural',
    'suburban',
    'urban',
    ''
);


--
-- Name: dish; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE dish AS ENUM (
    'brussel sprouts',
    'carrots',
    'cauliflower',
    'corn',
    'cornbread',
    'fruit salad',
    'green beans/green bean casserole',
    'macaroni and cheese',
    'mashed potatoes',
    'rolls/biscuits',
    'vegetable salad',
    'yams/sweet potato casserole',
    'squash',
    'other'
);


--
-- Name: dist; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE dist AS ENUM (
    'home',
    'local',
    'near',
    'far',
    ''
);


--
-- Name: flavor; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE flavor AS ENUM (
    'apple',
    'buttermilk',
    'cherry',
    'chocolate',
    'coconut cream',
    'key lime',
    'peach',
    'pecan',
    'pumpkin',
    'sweet potato',
    'none',
    'other'
);


--
-- Name: main; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE main AS ENUM (
    'turkey',
    'tofurkey',
    'ham/pork',
    'turducken',
    'roast beef',
    'chicken',
    'other',
    'i don''t know'
);


--
-- Name: method; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE method AS ENUM (
    'baked',
    'roasted',
    'fried',
    'other',
    'i don''t know'
);


--
-- Name: money; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE money AS ENUM (
    '$0 to $9,999',
    '$10,000 to $24,999',
    '$25,000 to $49,999',
    '$50,000 to $74,999',
    '$75,000 to $99,999',
    '$100,000 to $124,999',
    '$125,000 to $149,999',
    '$150,000 to $174,999',
    '$175,000 to $199,999',
    '$200,000 and up',
    'prefer not to answer'
);


--
-- Name: place; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE place AS ENUM (
    'west north central',
    'southeast',
    'middle atlantic',
    'east south central',
    'mountain',
    'east north central',
    'new england',
    'south atlantic',
    'west south central',
    'pacific',
    ''
);


--
-- Name: sauce; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE sauce AS ENUM (
    'canned',
    'homemade',
    'none',
    'other'
);


--
-- Name: sex; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE sex AS ENUM (
    'male',
    'female'
);


--
-- Name: stuff; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE stuff AS ENUM (
    'bread-based',
    'rice-based',
    'none',
    'other'
);


--
-- Name: sweet; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE sweet AS ENUM (
    'apple cobbler',
    'blondies',
    'brownies',
    'carrot cake',
    'cheesecake',
    'cookies',
    'fudge',
    'ice cream',
    'peach cobbler',
    'none',
    'other'
);


--
-- Name: wealth; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE wealth AS ENUM (
    '"$0 to $9,999"',
    '"$10,000 to $24,999"',
    '"$25,000 to $49,999"',
    '"$50,000 to $74,999"',
    '"$75,000 to $99,999"',
    '"$100,000 to $124,999"',
    '"$125,000 to $149,999"',
    '"$150,000 to $174,999"',
    '"$175,000 to $199,999"',
    '"$200,000 and up"',
    'prefer not to answer'
);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cooked_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cooked_other (
    id bigint,
    cooked_other text
);


--
-- Name: cranberry_sauce_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cranberry_sauce_other (
    id bigint,
    cranberry_sauce_other text
);


--
-- Name: demographics; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE demographics (
    id bigint,
    region place,
    pray boolean,
    travel dist,
    macys_parade boolean,
    age_cutoff integer,
    friendsgiving boolean,
    black_friday_shop boolean,
    work_retail boolean,
    work_black_friday boolean,
    population_density density,
    age agegroup,
    gender sex,
    income text
);


--
-- Name: dessert; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dessert (
    id bigint,
    dessert_type sweet
);


--
-- Name: dessert_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE dessert_other (
    id bigint,
    dessert_other text
);


--
-- Name: main_dish_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_dish_other (
    id bigint,
    main_dish_other text
);


--
-- Name: main_food; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE main_food (
    id bigint,
    main_dish main,
    cooked method,
    stuffing stuff,
    cranberry_sauce sauce,
    gravy boolean
);


--
-- Name: pie; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pie (
    id bigint,
    pie_type flavor
);


--
-- Name: pie_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pie_other (
    id bigint,
    pie_other text
);


--
-- Name: side_dish; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE side_dish (
    id bigint,
    side dish
);


--
-- Name: side_dish_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE side_dish_other (
    id bigint,
    side_dish_other text
);


--
-- Name: stuffing_other; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stuffing_other (
    id bigint,
    stuffing_other text
);


--
-- Data for Name: cooked_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cooked_other (id, cooked_other) FROM stdin;
4337772882	stovetop
4337380720	Barbeque
4337188006	always different
4337074360	Restaurant with various choices.
4337064141	like soup
4337044348	various ways
4337031019	BBQ'd
4337019287	smoked
4336988874	roulade
4336986755	smoked
4336961030	Grilled on the Weber
4336956397	Try a new technique yearly.
4336949331	smoked
4336931306	Ronco
4336901039	1 fried 1 roasted
4336892388	Grilled
4336876798	Smoked
4336856298	on the grill
4336838630	Grilled
4336827783	Broiled
4336819043	grilled 
4336797746	Having a Smoked Turkey this year
4336790523	fried
4336774641	Smoked
4336761290	Cooked on a Weber Charcoal Grill
4336760341	Grilled
4336752112	Varies
4336714072	Smoked
4336660839	Grilled
4336643722	Fried and one baked
4336626273	We eat out
4336512650	Smoked
4336495665	 Cooked in bourbon and then smokes
4336482823	O
4336471362	grilled
4336405712	Smoked
4336366345	store smoked
4336346355	Smoked
4336326250	baked, grilled, fried
4336312523	Grilled
4336189898	Slow cooked
4336146440	grilled
4336062672	grilled
4336001546	smoked
4335998934	smoked
4335973714	Smoked
4335965542	Barbecue
4335960847	Grilled
4335960288	Varies as per above
4335959857	Smoked 
4335954394	Rotisserie 
\.


--
-- Data for Name: cranberry_sauce_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cranberry_sauce_other (id, cranberry_sauce_other) FROM stdin;
4337951949	Homemade cranberry gelatin ring
4337899817	Both Canned and Homemade
4337164060	Fresh cranberry/orange salad!
4337083360	home made and canned
4337074360	Restaurant with various choices.
4337056155	Sorbet
4337032009	Homemade and canned
4337008702	Canned and homemade
4336977349	Both Canned and Homemade
4336949659	canned with added ingredients 
4336902332	cranberries
4336868990	wine
4336860498	Cranberry Salad
4336857530	cdsb
4336807635	Publix Supermarket brand(fresh)
4336772456	stuffing
4336465404	Specialty store bought
4336465104	Publix deli brand orange-cran spread
4336368343	Relish, Sauce, cooked whole
4336301847	Both canned and homemade
4336121663	freshly made at a deli counter
4336101470	Jar
4336057426	trader joe's fresh cranberry relish and whole cranberry sauce
4335967669	both canned and homemade
4335965542	canned and homemade
\.


--
-- Data for Name: demographics; Type: TABLE DATA; Schema: public; Owner: -
--

COPY demographics (id, region, pray, travel, macys_parade, age_cutoff, friendsgiving, black_friday_shop, work_retail, work_black_friday, population_density, age, gender, income) FROM stdin;
4337954960	middle atlantic	t	local	f	12	f	f	f	f	suburban	18 - 29	male	$75,000 to $99,999
4337951949	east south central	t	near	f	19	f	t	f	f	rural	18 - 29	female	$50,000 to $74,999
4337935621	mountain	t	local	f	13	t	t	f	f	suburban	18 - 29	male	$0 to $9,999
4337933040	pacific	f	local	f	10	f	f	f	f	urban	30 - 44	male	$200,000 and up
4337931983	pacific	f	near	f	10	f	f	f	f	urban	30 - 44	male	$100,000 to $124,999
4337929779	pacific	t	home	f	20	t	t	f	f	urban	18 - 29	male	$0 to $9,999
4337924420	east north central	f	near	f	12	f	t	t	f	rural	18 - 29	male	$25,000 to $49,999
4337916002	mountain	f	far	f	21	t	t	t	t	rural	18 - 29	male	prefer not to answer
4337914977	middle atlantic	f	home	t	21	f	f	f	f	urban	30 - 44	male	$75,000 to $99,999
4337899817	east south central	t	home	t	10	f	f	t	t	suburban	30 - 44	male	$25,000 to $49,999
4337893416	middle atlantic	t	near	f	12	f	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4337888291	east north central	t	near	f	21	f	f	f	f	suburban	18 - 29	male	$0 to $9,999
4337878450	middle atlantic	t	local	f	12	t	t	f	f	urban	18 - 29	male	$0 to $9,999
4337878351	west north central	f	local	f	10	f	f	f	f	rural	60+	male	$50,000 to $74,999
4337857295	pacific	t	local	f	12	t	f	f	f	suburban	30 - 44	male	$200,000 and up
4337856362	pacific	t	local	t	10	t	t	t	f	suburban	30 - 44	male	$200,000 and up
4337854106	east north central	f	home	f	15	t	t	f	f	urban	18 - 29	male	$75,000 to $99,999
4337844879	mountain	t	near	f	10	f	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4337823612	east north central	t	local	t	10	f	f	f	f	rural	30 - 44	male	$75,000 to $99,999
4337820281	pacific	f	far	t	10	t	f	f	f	urban	30 - 44	male	$75,000 to $99,999
4337813502	pacific	f	home	f	15	t	t	t	t	urban	18 - 29	male	$0 to $9,999
4337793158	pacific	t	home	f	10	f	f	f	f	urban	18 - 29	male	$0 to $9,999
4337792130	west south central	t	far	t	15	t	t	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337790002	middle atlantic	f	near	t	10	f	f	f	f	rural	18 - 29	male	$200,000 and up
4337783794	south atlantic	f	local	f	10	f	f	f	f	urban	30 - 44	male	$50,000 to $74,999
4337779071	east north central	t	local	f	10	t	t	t	t	suburban	18 - 29	male	$100,000 to $124,999
4337778119	pacific	f	home	t	10	t	f	f	f	urban	30 - 44	female	prefer not to answer
4337774090	pacific	t	home	t	10	f	f	f	f	urban	30 - 44	male	$75,000 to $99,999
4337772882	pacific	f	local	f	10	f	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4337772193	pacific	f	local	t	10	f	t	f	f	urban	18 - 29	male	prefer not to answer
4337771439	middle atlantic	f	near	f	10	f	f	f	f	suburban	30 - 44	male	$50,000 to $74,999
4337763296	south atlantic	t	local	f	12	f	t	f	f	urban	30 - 44	male	$25,000 to $49,999
4337758789	east south central	t	far	t	10	t	f	f	f	urban	30 - 44	male	$50,000 to $74,999
4337747968	new england	f	local	f	14	f	f	t	t	suburban	18 - 29	male	prefer not to answer
4337743121	pacific	t	local	t	18	f	f	f	f	suburban	18 - 29	male	$25,000 to $49,999
4337732348	west south central	t	home	f	10	f	f	f	f	rural	18 - 29	male	$200,000 and up
4337731242	west north central	t	near	f	13	f	f	t	f	urban	18 - 29	male	$200,000 and up
4337719588	middle atlantic	t	near	f	16	f	f	t	t	suburban	30 - 44	male	$75,000 to $99,999
4337698969	mountain	t	home	t	12	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4337698743	middle atlantic	t	far	f	12	f	f	f	f	rural	18 - 29	male	$50,000 to $74,999
4337660047	pacific	t	local	f	10	t	f	t	t	suburban	18 - 29	male	$10,000 to $24,999
4337655425	west north central	t	near	f	10	t	f	f	f	rural	18 - 29	male	$25,000 to $49,999
4337653684	pacific	f	home	t	10	t	t	f	f	urban	18 - 29	female	$25,000 to $49,999
4337646565	south atlantic	t	far	t	12	f	t	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337629524	west south central	t	near	f	10	f	f	f	f	rural	45 - 59	male	$75,000 to $99,999
4337627331	middle atlantic	t	home	f	10	f	f	f	f	suburban	45 - 59	male	$200,000 and up
4337626849	east south central	t	far	t	10	t	f	f	f	rural	45 - 59	male	$10,000 to $24,999
4337611941	west north central	f	far	f	13	f	t	f	f	rural	18 - 29	male	$50,000 to $74,999
4337600726	west south central	f	local	f	13	f	f	f	f	rural	45 - 59	male	$100,000 to $124,999
4337598069	new england	t	local	t	13	t	f	f	f	rural	30 - 44	male	$25,000 to $49,999
4337597044	east north central	t	home	t	21	f	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4337589613	south atlantic	t	local	t	10	t	t	f	f	rural	30 - 44	male	$50,000 to $74,999
4337586061	east south central	t	home	t	21	f	t	f	f	urban	45 - 59	male	$75,000 to $99,999
4337583393	new england	f	far	t	10	t	f	f	f	rural	18 - 29	male	$75,000 to $99,999
4337583245	east north central	f	home	f	10	f	f	f	f	suburban	45 - 59	male	$175,000 to $199,999
4337582845	middle atlantic	t	local	t	13	f	t	f	f	suburban	45 - 59	male	$175,000 to $199,999
4337577784	south atlantic	f	local	t	18	t	f	f	f	rural	45 - 59	male	prefer not to answer
4337569645	pacific	t	home	f	10	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4337569057	middle atlantic	f	home	f	10	f	f	f	f	urban	45 - 59	male	$75,000 to $99,999
4337568074	middle atlantic	f	home	t	10	f	f	t	f	urban	30 - 44	male	$25,000 to $49,999
4337553422	west south central	f	home	f	10	t	f	f	f	urban	18 - 29	male	$10,000 to $24,999
4337550299	east north central	t	home	t	17	t	t	f	f	suburban	18 - 29	male	$50,000 to $74,999
4337545841	middle atlantic	f	home	t	18	f	f	f	f	suburban	18 - 29	male	$100,000 to $124,999
4337540484	pacific	f	home	f	21	f	t	f	f	suburban	18 - 29	male	prefer not to answer
4337531521	west south central	f	far	f	12	t	f	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337528775	west south central	t	local	t	12	t	t	f	f	urban	18 - 29	male	$0 to $9,999
4337512214	east north central	f	home	f	12	t	f	f	f	rural	45 - 59	male	prefer not to answer
4337490067	east north central	f	local	f	18	f	f	f	f	urban	30 - 44	male	prefer not to answer
4337489617	west north central	t	home	f	10	f	f	t	f	rural	18 - 29	male	prefer not to answer
4337487759	west north central	t	near	t	10	t	t	f	f	suburban	18 - 29	male	$150,000 to $174,999
4337484305	south atlantic	f	home	f	21	f	f	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337475288	west north central	f	home	f	10	f	f	f	f	suburban	45 - 59	male	prefer not to answer
4337468268	mountain	f	far	t	10	t	f	f	f	urban	18 - 29	male	$75,000 to $99,999
4337467677	pacific	f	home	f	10	t	f	f	f	urban	30 - 44	female	$75,000 to $99,999
4337448181	middle atlantic	t	far	t	17	f	t	f	f	suburban	45 - 59	male	$175,000 to $199,999
4337442451	east south central	t	local	f	10	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4337441164	middle atlantic	t	local	t	10	f	f	f	f	suburban	30 - 44	male	$150,000 to $174,999
4337441070	pacific	t	local	f	12	t	t	f	f	suburban	30 - 44	male	$25,000 to $49,999
4337435277	new england	t	home	f	10	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4337432686	east north central	t	local	f	18	f	t	f	f	suburban	45 - 59	male	prefer not to answer
4337429102	west north central	t	home	f	10	t	f	f	f	urban	18 - 29	male	$0 to $9,999
4337423740	east south central	f	home	f	10	f	f	t	t	urban	45 - 59	male	$150,000 to $174,999
4337421462	west south central	t	home	f	10	t	f	f	f	suburban	30 - 44	male	$125,000 to $149,999
4337412056	west north central	t	home	f	10	f	f	f	f	urban	30 - 44	male	$25,000 to $49,999
4337409281	pacific	t	home	f	10	t	t	f	f	rural	30 - 44	male	$0 to $9,999
4337400534	west south central	f	home	t	14	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4337395533	pacific	f	home	f	10	t	f	f	f	urban	45 - 59	male	prefer not to answer
4337391263	west south central	t	home	f	12	t	t	f	f	rural	30 - 44	male	$100,000 to $124,999
4337390930	south atlantic	t	home	f	18	f	t	f	f	rural	18 - 29	male	prefer not to answer
4337390728	east north central	t	far	f	16	f	t	f	f	rural	30 - 44	male	$75,000 to $99,999
4337386038	south atlantic	f	home	t	21	f	f	f	f	urban	18 - 29	male	$75,000 to $99,999
4337384089	south atlantic	t	local	f	10	t	t	f	f	urban	45 - 59	male	$50,000 to $74,999
4337382350	south atlantic	f	far	t	16	t	f	f	f	urban	18 - 29	male	$150,000 to $174,999
4337380720	pacific	f	home	t	21	t	f	f	f	urban	45 - 59	male	$125,000 to $149,999
4337369789	east south central	t	far	f	14	f	t	f	f	urban	45 - 59	male	$100,000 to $124,999
4337365738	pacific	t	home	f	10	f	t	f	f	suburban	45 - 59	male	$10,000 to $24,999
4337360752	\N	f	local	f	21	t	f	f	f	urban	18 - 29	male	$10,000 to $24,999
4337360389	middle atlantic	t	near	t	15	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4337356672	west south central	f	near	f	10	f	t	f	f	suburban	45 - 59	male	$75,000 to $99,999
4337347655	middle atlantic	t	local	t	10	f	t	f	f	suburban	18 - 29	female	prefer not to answer
4337346312	east south central	t	near	f	10	f	f	f	f	rural	30 - 44	male	$25,000 to $49,999
4337343090	pacific	t	home	t	11	t	t	t	f	suburban	30 - 44	male	$10,000 to $24,999
4337336787	south atlantic	t	near	t	10	t	t	f	f	suburban	18 - 29	male	$75,000 to $99,999
4337336262	south atlantic	t	home	t	21	t	f	f	f	urban	45 - 59	male	$10,000 to $24,999
4337333159	west south central	t	far	t	10	t	f	f	f	suburban	30 - 44	male	prefer not to answer
4337324697	south atlantic	t	near	t	10	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4337323392	middle atlantic	t	near	t	21	f	f	f	f	rural	18 - 29	male	$25,000 to $49,999
4337319123	new england	f	home	t	10	f	f	f	f	suburban	45 - 59	male	$175,000 to $199,999
4337318895	south atlantic	f	home	f	14	f	f	f	f	suburban	30 - 44	male	$200,000 and up
4337311256	east north central	t	near	t	14	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4337310361	west north central	f	near	f	10	f	f	f	f	suburban	18 - 29	male	$10,000 to $24,999
4337309060	east north central	t	near	t	15	f	f	f	f	suburban	18 - 29	female	$100,000 to $124,999
4337296029	pacific	f	home	t	10	f	f	f	f	rural	30 - 44	male	$10,000 to $24,999
4337292895	mountain	t	home	f	10	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4337288630	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4337287733	east north central	t	near	f	10	f	f	f	f	suburban	18 - 29	male	$0 to $9,999
4337284552	west north central	t	near	f	10	f	t	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337275528	west north central	t	far	t	10	f	f	f	f	rural	18 - 29	male	$25,000 to $49,999
4337262725	west south central	t	home	t	12	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4337256857	west north central	f	local	f	21	f	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4337249904	east north central	f	home	f	21	f	f	f	f	suburban	30 - 44	male	$50,000 to $74,999
4337247953	south atlantic	t	home	t	10	t	f	f	f	suburban	18 - 29	male	$50,000 to $74,999
4337235972	middle atlantic	t	near	t	21	f	f	f	f	rural	45 - 59	male	$75,000 to $99,999
4337235398	south atlantic	t	near	t	12	f	t	f	f	suburban	18 - 29	male	$50,000 to $74,999
4337229414	middle atlantic	t	local	t	18	t	t	f	f	urban	45 - 59	male	$100,000 to $124,999
4337225703	east south central	t	far	t	10	t	f	f	f	urban	18 - 29	male	$100,000 to $124,999
4337220006	south atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4337217411	west south central	t	local	f	10	t	f	f	f	suburban	45 - 59	male	$25,000 to $49,999
4337202264	middle atlantic	t	far	f	13	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4337201482	middle atlantic	f	near	t	10	f	f	f	f	urban	45 - 59	male	$50,000 to $74,999
4337195940	mountain	f	home	f	10	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4337191550	west south central	t	home	t	10	f	f	f	f	urban	30 - 44	female	$125,000 to $149,999
4337190953	west south central	f	local	t	12	t	t	f	f	suburban	18 - 29	male	prefer not to answer
4337188006	new england	f	home	f	10	t	f	f	f	urban	30 - 44	female	$75,000 to $99,999
4337184092	east north central	f	home	f	10	f	f	f	f	urban	30 - 44	female	$0 to $9,999
4337183363	new england	f	near	t	10	t	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4337168468	west north central	f	local	f	10	f	f	f	f	urban	60+	female	$200,000 and up
4337165710	east north central	f	local	f	21	f	f	f	f	urban	60+	female	$25,000 to $49,999
4337164060	east north central	f	home	f	10	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4337163790	south atlantic	t	local	t	12	t	f	t	t	suburban	60+	female	$25,000 to $49,999
4337162131	middle atlantic	t	far	t	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4337161591	middle atlantic	t	near	f	10	t	t	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337160605	pacific	t	local	t	21	f	f	f	f	suburban	60+	female	$200,000 and up
4337160531	east north central	t	home	f	10	f	f	f	f	suburban	60+	female	prefer not to answer
4337160291	west south central	t	local	f	10	t	t	f	f	urban	30 - 44	female	prefer not to answer
4337159183	east south central	t	local	f	10	t	f	f	f	suburban	30 - 44	male	$100,000 to $124,999
4337155647	mountain	t	home	t	13	t	f	f	f	rural	60+	female	$75,000 to $99,999
4337153385	west north central	t	local	f	18	t	f	t	t	suburban	30 - 44	female	$50,000 to $74,999
4337153198	south atlantic	f	near	f	21	f	f	f	f	rural	18 - 29	male	$25,000 to $49,999
4337153195	south atlantic	t	home	f	21	t	f	t	f	urban	18 - 29	male	$25,000 to $49,999
4337150198	new england	f	local	t	12	t	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4337149818	south atlantic	t	home	f	10	f	t	t	t	rural	30 - 44	female	$25,000 to $49,999
4337147145	south atlantic	t	near	t	10	t	f	f	f	suburban	60+	female	$50,000 to $74,999
4337145918	south atlantic	f	far	t	10	f	t	f	f	suburban	60+	female	$75,000 to $99,999
4337143515	new england	t	near	t	16	f	f	f	f	suburban	60+	female	prefer not to answer
4337142309	west south central	t	far	f	10	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4337139981	pacific	f	far	t	10	t	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4337139366	west south central	t	home	t	14	t	f	t	f	rural	30 - 44	male	$75,000 to $99,999
4337139327	west north central	t	local	f	12	f	f	f	f	rural	30 - 44	female	$75,000 to $99,999
4337139127	west south central	t	local	t	10	f	f	f	f	rural	60+	female	$100,000 to $124,999
4337138407	middle atlantic	t	local	f	21	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4337137158	east south central	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$200,000 and up
4337136775	east north central	t	local	t	21	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4337136301	new england	t	near	t	21	t	f	f	f	rural	30 - 44	female	prefer not to answer
4337135261	east north central	t	local	t	13	f	t	t	t	suburban	30 - 44	male	$75,000 to $99,999
4337131392	east north central	t	local	f	10	f	f	f	f	rural	45 - 59	male	$125,000 to $149,999
4337127124	east north central	t	near	t	10	f	t	f	f	suburban	30 - 44	female	$100,000 to $124,999
4337120626	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4337117868	west north central	t	local	t	10	f	f	f	f	rural	60+	female	$25,000 to $49,999
4337117491	south atlantic	t	far	t	10	f	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4337117150	east north central	t	local	f	10	f	t	f	f	urban	30 - 44	female	$50,000 to $74,999
4337114976	south atlantic	t	home	t	10	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4337114697	south atlantic	f	home	t	16	t	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4337114484	west south central	t	home	t	10	f	f	f	f	rural	60+	female	$200,000 and up
4337113072	east north central	t	near	f	13	f	f	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337112360	south atlantic	t	home	f	10	f	f	f	f	urban	60+	female	$75,000 to $99,999
4337111695	south atlantic	t	local	t	10	f	f	f	f	suburban	60+	female	prefer not to answer
4337110217	middle atlantic	f	local	t	21	t	f	f	f	urban	18 - 29	female	$25,000 to $49,999
4337109688	mountain	t	near	f	10	t	f	f	f	suburban	18 - 29	female	$25,000 to $49,999
4337108113	south atlantic	t	near	t	13	f	f	f	f	suburban	18 - 29	male	$50,000 to $74,999
4337107692	east south central	t	home	t	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4337107492	south atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$25,000 to $49,999
4337107135	south atlantic	t	near	t	12	f	t	f	f	rural	30 - 44	female	$25,000 to $49,999
4337106266	south atlantic	f	local	f	10	f	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4337100681	east north central	t	far	t	10	f	f	f	f	suburban	60+	female	$200,000 and up
4337100638	middle atlantic	f	near	f	21	t	f	f	f	urban	60+	female	$200,000 and up
4337098925	west north central	t	local	t	10	f	f	f	f	rural	30 - 44	female	$50,000 to $74,999
4337097777	middle atlantic	t	near	t	10	f	f	f	f	suburban	45 - 59	male	$10,000 to $24,999
4337096669	east north central	t	home	t	21	f	f	f	f	suburban	18 - 29	female	$50,000 to $74,999
4337094254	pacific	t	far	t	16	f	f	f	f	rural	60+	female	$200,000 and up
4337091880	east south central	f	near	f	10	f	f	f	f	rural	30 - 44	female	$25,000 to $49,999
4337089256	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4337087412	east north central	f	near	f	10	f	f	f	f	urban	18 - 29	female	$75,000 to $99,999
4337087325	east north central	t	home	f	20	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4337086635	pacific	t	local	f	21	f	f	f	f	urban	45 - 59	male	$150,000 to $174,999
4337084799	south atlantic	t	near	t	10	f	f	f	f	suburban	30 - 44	female	$0 to $9,999
4337083360	mountain	t	home	t	21	t	t	f	f	suburban	60+	female	$50,000 to $74,999
4337083128	middle atlantic	f	local	f	10	t	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4337078951	mountain	f	local	t	16	t	f	f	f	suburban	30 - 44	female	$200,000 and up
4337078449	mountain	f	home	t	10	f	f	f	f	urban	60+	female	$25,000 to $49,999
4337075743	east north central	t	local	f	10	f	f	f	f	urban	45 - 59	male	$75,000 to $99,999
4337074360	south atlantic	f	near	f	21	f	f	f	f	rural	45 - 59	male	$125,000 to $149,999
4337074187	east south central	t	home	t	10	f	t	f	f	urban	60+	female	$50,000 to $74,999
4337073874	east north central	t	far	f	12	f	t	f	f	urban	30 - 44	male	$100,000 to $124,999
4337071166	south atlantic	t	local	t	12	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4337070275	pacific	t	local	t	12	t	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337069914	east north central	t	far	t	15	f	t	f	f	suburban	30 - 44	female	$175,000 to $199,999
4337068413	west north central	f	home	t	10	f	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337064141	west south central	t	local	f	10	f	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4337063427	south atlantic	t	home	t	10	f	t	f	f	rural	45 - 59	male	$100,000 to $124,999
4337061732	new england	t	local	f	10	f	f	f	f	suburban	60+	female	$10,000 to $24,999
4337061177	east south central	t	local	f	16	t	f	f	f	urban	60+	female	$175,000 to $199,999
4337058651	south atlantic	t	near	t	10	t	f	f	f	suburban	18 - 29	female	$150,000 to $174,999
4337056155	east north central	t	local	f	21	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4337053889	middle atlantic	t	local	f	10	f	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4337053842	south atlantic	f	near	f	16	f	f	f	f	rural	30 - 44	female	$75,000 to $99,999
4337053465	mountain	f	near	f	21	f	t	t	t	suburban	18 - 29	female	$25,000 to $49,999
4337053135	south atlantic	t	near	f	10	f	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337050973	pacific	f	local	f	21	t	f	f	f	urban	60+	female	$10,000 to $24,999
4337050187	south atlantic	t	near	f	13	f	f	t	t	rural	45 - 59	male	$25,000 to $49,999
4337049485	east north central	f	near	t	10	f	t	f	f	rural	30 - 44	male	$25,000 to $49,999
4337044640	new england	t	home	t	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4337044628	west north central	t	home	f	10	f	f	f	f	rural	60+	female	$25,000 to $49,999
4337044348	south atlantic	f	home	t	10	f	f	f	f	urban	60+	female	$100,000 to $124,999
4337043853	pacific	t	local	f	15	t	f	f	f	suburban	18 - 29	female	$50,000 to $74,999
4337043565	west south central	f	near	f	12	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4337040587	pacific	f	home	f	16	f	f	f	f	rural	18 - 29	male	prefer not to answer
4337040405	east south central	t	local	f	12	f	f	f	f	rural	18 - 29	female	$10,000 to $24,999
4337032039	south atlantic	t	local	t	10	t	t	f	f	suburban	18 - 29	male	$25,000 to $49,999
4337032009	east north central	t	local	f	10	f	f	f	f	rural	60+	male	$200,000 and up
4337031019	mountain	t	local	t	10	f	f	f	f	suburban	18 - 29	female	$10,000 to $24,999
4337029500	east north central	f	local	f	12	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4337027180	east south central	f	home	f	12	f	f	f	f	suburban	60+	female	$10,000 to $24,999
4337025357	west north central	f	home	t	10	f	f	f	f	urban	60+	female	$25,000 to $49,999
4337024057	east south central	t	local	f	12	f	f	f	f	suburban	60+	male	$0 to $9,999
4337023697	middle atlantic	f	home	t	10	f	f	f	f	suburban	60+	male	$125,000 to $149,999
4337022132	west south central	f	home	t	10	t	f	f	f	suburban	60+	female	$150,000 to $174,999
4337021828	pacific	t	home	t	21	f	f	f	f	rural	60+	male	prefer not to answer
4337021725	east north central	f	home	t	21	f	f	f	f	rural	60+	male	$25,000 to $49,999
4337019638	new england	t	near	t	21	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4337019287	middle atlantic	f	home	f	10	f	f	f	f	suburban	60+	male	$175,000 to $199,999
4337019220	middle atlantic	f	home	f	21	t	t	t	f	urban	18 - 29	male	$75,000 to $99,999
4337019080	east south central	f	home	f	10	t	f	f	f	suburban	30 - 44	male	$75,000 to $99,999
4337013286	middle atlantic	t	home	t	21	t	f	f	f	suburban	18 - 29	female	$0 to $9,999
4337008702	new england	f	local	f	21	f	f	f	f	suburban	18 - 29	female	$200,000 and up
4337008598	middle atlantic	f	near	t	21	t	t	f	f	suburban	18 - 29	male	$25,000 to $49,999
4337008258	mountain	f	home	t	10	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4337006937	west south central	f	local	t	10	f	f	f	f	rural	60+	male	$50,000 to $74,999
4337004476	east north central	t	home	t	14	t	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4337002367	new england	f	home	t	10	f	f	f	f	urban	30 - 44	female	$0 to $9,999
4337002262	east south central	t	near	t	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4336999913	south atlantic	t	near	t	13	f	f	f	f	urban	18 - 29	female	$75,000 to $99,999
4336998647	east south central	t	far	t	16	f	t	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336998552	west north central	t	local	t	12	f	t	f	f	urban	18 - 29	male	$125,000 to $149,999
4336997445	middle atlantic	t	local	t	10	f	f	f	f	urban	30 - 44	male	$100,000 to $124,999
4336997200	south atlantic	t	local	f	10	t	f	f	f	rural	30 - 44	female	$25,000 to $49,999
4336996479	middle atlantic	t	local	t	10	f	f	f	f	urban	30 - 44	female	$200,000 and up
4336995888	south atlantic	f	home	f	10	f	f	f	f	suburban	60+	male	$150,000 to $174,999
4336995004	west north central	t	local	t	10	f	f	f	f	rural	30 - 44	male	$50,000 to $74,999
4336994435	new england	t	local	f	16	f	t	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336994408	\N	t	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336993856	south atlantic	t	local	t	13	t	f	f	f	suburban	45 - 59	male	$150,000 to $174,999
4336993552	south atlantic	t	local	f	12	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336993307	west north central	t	local	f	21	f	f	f	f	rural	18 - 29	female	$50,000 to $74,999
4336993268	south atlantic	t	home	t	10	t	t	t	t	rural	60+	male	$10,000 to $24,999
4336989544	middle atlantic	t	near	t	10	f	f	f	f	urban	60+	male	$25,000 to $49,999
4336988874	east north central	f	home	t	12	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4336986755	west south central	t	home	f	10	f	t	f	f	rural	30 - 44	female	$75,000 to $99,999
4336986628	mountain	t	home	f	10	f	f	f	f	urban	45 - 59	male	$200,000 and up
4336985910	south atlantic	f	home	t	21	f	t	f	f	suburban	30 - 44	female	prefer not to answer
4336985361	south atlantic	t	far	f	10	f	t	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336984164	new england	f	far	f	21	t	f	f	f	rural	30 - 44	male	prefer not to answer
4336983931	middle atlantic	f	local	f	10	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4336983885	middle atlantic	t	local	t	10	f	t	f	f	urban	45 - 59	male	$25,000 to $49,999
4336983528	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336983016	south atlantic	t	near	t	14	f	f	f	f	suburban	30 - 44	female	$25,000 to $49,999
4336982929	east south central	t	local	t	10	f	t	f	f	rural	60+	female	$200,000 and up
4336982760	mountain	f	home	t	21	t	f	f	f	rural	30 - 44	female	$75,000 to $99,999
4336978225	mountain	t	far	t	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4336977349	middle atlantic	t	local	f	21	f	f	f	f	suburban	30 - 44	female	$25,000 to $49,999
4336977032	east north central	t	local	t	10	t	t	f	f	suburban	18 - 29	female	$75,000 to $99,999
4336975251	south atlantic	t	local	f	12	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336975010	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	male	$200,000 and up
4336973830	pacific	t	home	t	10	t	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336973231	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336972729	middle atlantic	f	near	t	10	f	f	f	f	suburban	30 - 44	female	$200,000 and up
4336972039	middle atlantic	t	home	t	10	f	f	t	t	suburban	45 - 59	male	$200,000 and up
4336971897	middle atlantic	t	far	f	21	f	t	f	f	rural	18 - 29	female	prefer not to answer
4336970208	\N	f	home	t	10	f	t	f	f	suburban	60+	female	$75,000 to $99,999
4336969969	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	male	$150,000 to $174,999
4336967374	middle atlantic	t	home	t	14	f	f	f	f	suburban	60+	male	$175,000 to $199,999
4336965632	south atlantic	f	home	f	12	f	f	f	f	urban	30 - 44	female	$200,000 and up
4336965464	middle atlantic	t	local	t	14	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4336964971	south atlantic	f	local	f	13	f	f	f	f	rural	60+	female	$100,000 to $124,999
4336963992	middle atlantic	t	far	t	13	f	f	f	f	suburban	60+	female	$200,000 and up
4336963314	south atlantic	t	local	t	10	f	t	f	f	suburban	30 - 44	male	$50,000 to $74,999
4336963112	middle atlantic	f	home	f	21	f	f	f	f	urban	60+	female	$200,000 and up
4336962719	south atlantic	f	local	f	21	t	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4336962641	east north central	t	home	t	21	f	f	f	f	rural	18 - 29	female	$0 to $9,999
4336962476	middle atlantic	t	near	t	12	t	f	f	f	rural	60+	female	$50,000 to $74,999
4336961100	new england	t	near	t	21	f	f	f	f	urban	30 - 44	female	$50,000 to $74,999
4336961030	east north central	f	home	f	10	t	f	f	f	rural	60+	female	$75,000 to $99,999
4336960240	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336959845	south atlantic	t	local	f	12	f	f	f	f	suburban	30 - 44	female	$25,000 to $49,999
4336957549	south atlantic	f	local	f	12	f	t	f	f	urban	30 - 44	male	$25,000 to $49,999
4336957375	east north central	t	local	t	10	t	f	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336956397	south atlantic	f	local	f	21	f	f	f	f	rural	30 - 44	female	$25,000 to $49,999
4336955887	\N	t	home	t	21	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336953375	south atlantic	t	home	t	10	t	t	f	f	rural	18 - 29	female	$0 to $9,999
4336952446	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336950642	middle atlantic	t	home	t	16	f	t	f	f	rural	30 - 44	female	$50,000 to $74,999
4336950342	west north central	t	local	f	10	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4336949841	new england	f	home	f	10	f	f	f	f	rural	60+	female	$175,000 to $199,999
4336949659	middle atlantic	t	local	f	15	f	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4336949331	east north central	t	home	f	10	f	f	f	f	rural	30 - 44	male	$75,000 to $99,999
4336945764	south atlantic	t	far	t	21	f	t	f	f	suburban	30 - 44	female	$10,000 to $24,999
4336945012	east south central	t	near	t	21	t	f	f	f	rural	60+	female	$0 to $9,999
4336944934	mountain	t	home	f	10	t	f	f	f	suburban	30 - 44	female	prefer not to answer
4336941325	east north central	t	near	f	10	f	t	f	f	suburban	18 - 29	male	$50,000 to $74,999
4336940774	pacific	f	home	t	10	t	f	f	f	urban	45 - 59	male	$200,000 and up
4336940486	south atlantic	t	near	t	10	f	t	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336937701	west north central	f	home	f	16	t	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336935604	south atlantic	f	local	f	14	t	f	f	f	urban	18 - 29	male	$0 to $9,999
4336934948	east south central	t	local	t	10	f	t	f	f	urban	60+	male	$10,000 to $24,999
4336934120	middle atlantic	t	home	f	10	t	f	f	f	urban	30 - 44	female	$100,000 to $124,999
4336933938	pacific	t	home	f	13	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336932386	south atlantic	t	home	t	10	f	t	f	f	urban	30 - 44	female	$75,000 to $99,999
4336932195	pacific	t	local	t	10	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336931306	west south central	t	home	f	12	f	f	f	f	urban	30 - 44	male	$100,000 to $124,999
4336929784	middle atlantic	t	local	t	21	f	f	f	f	rural	45 - 59	female	$100,000 to $124,999
4336928175	west north central	f	home	f	10	f	f	f	f	urban	60+	female	prefer not to answer
4336928076	south atlantic	t	local	f	10	t	t	f	f	urban	30 - 44	female	$10,000 to $24,999
4336927723	new england	f	home	f	21	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336925780	east north central	t	local	f	21	t	f	f	f	urban	45 - 59	male	$10,000 to $24,999
4336925485	west north central	t	local	f	18	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336923533	south atlantic	t	home	f	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4336923177	south atlantic	t	local	f	10	t	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336922793	east north central	t	far	t	10	f	t	f	f	suburban	30 - 44	female	$50,000 to $74,999
4336922086	west south central	f	home	t	10	f	f	f	f	suburban	18 - 29	male	$50,000 to $74,999
4336921564	south atlantic	t	home	f	14	t	t	f	f	rural	45 - 59	female	$50,000 to $74,999
4336919993	east south central	f	near	t	10	t	f	f	f	suburban	30 - 44	male	$50,000 to $74,999
4336917509	east north central	f	home	t	10	f	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336917274	south atlantic	f	local	f	10	t	f	f	f	rural	30 - 44	male	$100,000 to $124,999
4336917270	middle atlantic	t	local	f	21	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336916047	south atlantic	t	local	f	21	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4336915660	middle atlantic	t	home	f	12	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4336915137	west south central	t	local	t	16	t	t	f	f	urban	18 - 29	female	$100,000 to $124,999
4336909691	east south central	t	home	t	21	f	f	f	f	rural	60+	female	$75,000 to $99,999
4336908416	west south central	t	local	t	10	f	f	f	f	suburban	18 - 29	female	$50,000 to $74,999
4336908351	middle atlantic	t	home	t	11	f	f	f	f	urban	30 - 44	female	$50,000 to $74,999
4336907249	south atlantic	t	local	t	10	f	f	t	t	suburban	45 - 59	male	$50,000 to $74,999
4336905433	mountain	t	local	f	21	f	t	f	f	rural	45 - 59	female	$100,000 to $124,999
4336905258	east north central	t	near	f	14	f	f	f	f	urban	30 - 44	male	$25,000 to $49,999
4336905103	west south central	t	local	f	10	f	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4336902332	middle atlantic	t	home	t	10	f	f	t	f	suburban	45 - 59	female	$75,000 to $99,999
4336901843	south atlantic	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336901444	east south central	t	local	f	21	t	t	f	f	suburban	45 - 59	female	$200,000 and up
4336901246	south atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336901039	south atlantic	t	local	f	10	t	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4336900009	west north central	t	home	f	12	f	t	f	f	urban	60+	male	$75,000 to $99,999
4336898888	east north central	f	local	t	10	t	t	f	f	urban	60+	male	$200,000 and up
4336898281	south atlantic	t	far	t	10	f	f	f	f	suburban	45 - 59	female	$175,000 to $199,999
4336897370	middle atlantic	t	near	t	21	f	f	f	f	suburban	30 - 44	female	$175,000 to $199,999
4336897268	east north central	t	local	t	16	t	t	f	f	suburban	18 - 29	female	prefer not to answer
4336896050	pacific	f	local	t	15	t	f	f	f	urban	60+	female	$50,000 to $74,999
4336894987	east north central	f	home	t	10	f	f	f	f	rural	45 - 59	female	$75,000 to $99,999
4336894811	middle atlantic	t	local	f	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336894719	new england	f	home	t	10	f	t	f	f	rural	18 - 29	female	$25,000 to $49,999
4336894663	new england	t	local	f	21	f	f	f	f	suburban	60+	male	prefer not to answer
4336893852	west north central	t	near	t	16	f	f	f	f	suburban	45 - 59	female	prefer not to answer
4336892910	east north central	t	near	t	12	f	f	f	f	urban	18 - 29	male	$100,000 to $124,999
4336892388	south atlantic	t	home	f	21	f	f	f	f	suburban	60+	male	$25,000 to $49,999
4336891075	south atlantic	t	home	f	21	f	f	f	f	suburban	60+	female	$125,000 to $149,999
4336890668	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336890666	west south central	t	local	t	13	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4336888973	east north central	t	home	t	20	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336888425	new england	f	near	t	10	f	f	f	f	urban	30 - 44	male	prefer not to answer
4336887954	middle atlantic	t	home	t	10	f	t	f	f	suburban	30 - 44	female	$150,000 to $174,999
4336887917	middle atlantic	f	home	f	15	t	f	f	f	suburban	30 - 44	male	$50,000 to $74,999
4336887807	west north central	t	local	f	14	f	t	t	t	suburban	45 - 59	female	$25,000 to $49,999
4336885748	east north central	f	home	t	12	f	f	f	f	urban	60+	female	$25,000 to $49,999
4336885693	south atlantic	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336884042	south atlantic	f	home	t	16	f	t	f	f	rural	45 - 59	male	$100,000 to $124,999
4336884019	west north central	f	home	f	10	f	f	f	f	rural	60+	male	$200,000 and up
4336883054	east north central	t	home	t	14	f	f	f	f	suburban	60+	male	$175,000 to $199,999
4336882230	west north central	t	local	f	10	f	t	f	f	urban	30 - 44	female	$50,000 to $74,999
4336881221	east north central	f	near	t	12	f	f	f	f	suburban	45 - 59	male	$200,000 and up
4336881198	south atlantic	t	local	t	15	f	t	f	f	suburban	45 - 59	female	prefer not to answer
4336880828	\N	t	local	t	10	f	t	f	f	urban	30 - 44	male	$25,000 to $49,999
4336879968	south atlantic	t	local	t	10	t	t	t	t	rural	30 - 44	female	$100,000 to $124,999
4336879592	east north central	f	home	f	10	f	f	f	f	rural	18 - 29	female	$10,000 to $24,999
4336879579	east north central	t	near	t	10	f	f	f	f	suburban	18 - 29	male	$75,000 to $99,999
4336879316	south atlantic	t	home	t	14	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336878978	middle atlantic	t	local	f	10	f	t	f	f	suburban	18 - 29	female	prefer not to answer
4336878183	east south central	f	home	t	10	f	t	f	f	rural	45 - 59	male	prefer not to answer
4336876798	south atlantic	f	local	f	10	f	t	f	f	suburban	60+	female	$25,000 to $49,999
4336876529	east north central	t	home	t	10	t	f	f	f	rural	30 - 44	female	$75,000 to $99,999
4336876457	south atlantic	t	local	f	10	f	f	f	f	rural	45 - 59	female	$10,000 to $24,999
4336876402	south atlantic	t	far	t	10	f	f	f	f	rural	45 - 59	female	$125,000 to $149,999
4336875194	west north central	t	local	f	10	f	f	f	f	suburban	60+	female	prefer not to answer
4336874555	middle atlantic	f	home	t	21	f	f	f	f	urban	45 - 59	female	$100,000 to $124,999
4336874265	east north central	f	near	f	10	f	f	f	f	rural	60+	male	$50,000 to $74,999
4336871606	middle atlantic	f	home	t	10	f	t	t	t	suburban	30 - 44	female	$0 to $9,999
4336871204	east south central	t	near	f	21	t	t	f	f	urban	45 - 59	female	$10,000 to $24,999
4336870813	south atlantic	t	home	t	10	f	t	f	f	suburban	18 - 29	female	$50,000 to $74,999
4336870370	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4336870006	west south central	t	home	f	10	t	t	f	f	rural	45 - 59	female	$200,000 and up
4336869926	east north central	t	local	f	13	f	f	f	f	urban	30 - 44	female	$10,000 to $24,999
4336868990	east north central	t	near	f	10	t	t	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336867812	middle atlantic	t	near	f	11	f	f	f	f	urban	30 - 44	male	$25,000 to $49,999
4336867797	east north central	f	home	t	10	f	f	f	f	rural	45 - 59	female	$100,000 to $124,999
4336867715	east south central	t	home	f	10	t	f	f	f	urban	45 - 59	female	$25,000 to $49,999
4336866361	middle atlantic	f	home	f	10	f	f	t	t	suburban	18 - 29	female	$25,000 to $49,999
4336863649	middle atlantic	t	home	t	15	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336861802	south atlantic	t	near	t	10	f	t	f	f	urban	18 - 29	female	$25,000 to $49,999
4336861435	middle atlantic	f	far	f	10	t	f	f	f	suburban	60+	female	$200,000 and up
4336860680	east north central	f	home	f	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4336860498	south atlantic	t	near	t	10	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336860029	\N	t	local	f	21	t	f	f	f	rural	18 - 29	male	$10,000 to $24,999
4336857693	south atlantic	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336857530	east north central	f	home	f	11	f	f	f	f	rural	30 - 44	female	prefer not to answer
4336857362	new england	t	home	t	10	f	f	f	f	rural	45 - 59	female	prefer not to answer
4336856298	west north central	t	home	f	10	f	f	f	f	suburban	60+	male	prefer not to answer
4336855177	south atlantic	t	local	t	12	f	f	f	f	rural	60+	female	$50,000 to $74,999
4336853880	south atlantic	t	local	f	13	t	f	f	f	rural	45 - 59	female	prefer not to answer
4336851292	middle atlantic	f	near	t	16	f	t	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336851260	west south central	t	near	t	16	t	t	f	f	suburban	18 - 29	female	$150,000 to $174,999
4336848038	middle atlantic	f	home	t	10	t	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4336847523	middle atlantic	f	local	f	10	f	t	t	f	suburban	30 - 44	male	$75,000 to $99,999
4336844557	east south central	f	local	t	10	f	f	f	f	urban	60+	female	$25,000 to $49,999
4336843665	west north central	f	home	t	10	f	f	f	f	urban	45 - 59	female	$125,000 to $149,999
4336841567	east north central	f	home	t	21	f	f	f	f	urban	30 - 44	male	$100,000 to $124,999
4336841484	east north central	t	near	f	10	f	f	f	f	suburban	60+	female	$175,000 to $199,999
4336840954	south atlantic	t	home	t	21	t	f	f	f	suburban	60+	female	$75,000 to $99,999
4336840612	south atlantic	t	home	t	10	f	t	f	f	urban	18 - 29	female	$10,000 to $24,999
4336839687	east north central	t	home	t	11	f	f	f	f	rural	60+	male	$100,000 to $124,999
4336838632	south atlantic	f	near	t	10	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336838630	south atlantic	f	home	f	21	f	f	f	f	rural	45 - 59	female	$200,000 and up
4336838317	east north central	t	home	t	10	t	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336837943	east north central	t	home	t	10	f	t	f	f	suburban	30 - 44	female	$50,000 to $74,999
4336837306	east north central	f	home	f	10	t	t	t	f	urban	30 - 44	female	prefer not to answer
4336836328	\N	t	home	f	14	f	f	f	f	urban	30 - 44	male	$25,000 to $49,999
4336836078	east south central	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336835004	west north central	f	near	f	16	f	f	f	f	suburban	18 - 29	female	$100,000 to $124,999
4336834730	new england	t	local	t	16	f	t	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336834473	south atlantic	t	home	t	10	f	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4336833478	south atlantic	t	local	t	10	t	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4336832951	east south central	t	near	t	12	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336832129	\N	t	far	f	14	t	t	f	f	urban	30 - 44	female	$0 to $9,999
4336830596	pacific	t	far	f	18	t	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336829875	south atlantic	f	home	t	10	f	f	t	t	urban	45 - 59	female	$200,000 and up
4336829721	east south central	f	home	f	21	t	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336829185	pacific	t	far	t	10	f	f	f	f	urban	60+	female	$100,000 to $124,999
4336828331	south atlantic	t	local	f	10	t	f	f	f	urban	60+	male	prefer not to answer
4336827783	middle atlantic	t	home	f	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4336827663	middle atlantic	t	home	t	10	f	t	f	f	urban	45 - 59	female	$50,000 to $74,999
4336826560	south atlantic	t	local	t	10	f	f	f	f	rural	30 - 44	female	$10,000 to $24,999
4336825506	east north central	f	local	f	10	f	t	f	f	urban	30 - 44	female	$50,000 to $74,999
4336825281	mountain	t	home	f	10	t	f	f	f	suburban	60+	male	prefer not to answer
4336825000	mountain	t	home	t	10	t	t	f	f	suburban	18 - 29	male	prefer not to answer
4336823441	west north central	t	home	t	11	t	f	f	f	rural	45 - 59	female	$25,000 to $49,999
4336823172	west south central	t	near	f	21	f	f	f	f	urban	45 - 59	male	$150,000 to $174,999
4336822252	middle atlantic	t	home	t	10	f	f	f	f	rural	45 - 59	female	prefer not to answer
4336821807	west north central	t	local	f	10	f	f	f	f	rural	45 - 59	female	$25,000 to $49,999
4336821332	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336819191	south atlantic	t	far	f	10	f	f	f	f	suburban	45 - 59	male	prefer not to answer
4336819043	east south central	t	home	f	12	f	t	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336816440	middle atlantic	t	local	t	10	f	f	f	f	urban	45 - 59	female	$75,000 to $99,999
4336815648	east north central	f	local	t	10	t	f	f	f	suburban	60+	male	prefer not to answer
4336815463	south atlantic	t	near	f	10	f	f	f	f	rural	60+	female	$75,000 to $99,999
4336815399	south atlantic	t	home	f	10	f	t	f	f	rural	60+	male	$50,000 to $74,999
4336814310	new england	t	far	t	12	f	f	f	f	rural	30 - 44	male	$200,000 and up
4336813874	middle atlantic	f	home	t	21	f	f	f	f	rural	45 - 59	female	$150,000 to $174,999
4336812402	east north central	t	local	t	10	t	f	f	f	urban	30 - 44	male	$125,000 to $149,999
4336811982	east north central	t	local	t	21	f	t	f	f	rural	45 - 59	female	$150,000 to $174,999
4336811877	west south central	f	local	t	10	f	f	f	f	suburban	30 - 44	male	$100,000 to $124,999
4336811565	south atlantic	t	home	t	10	t	f	f	f	suburban	60+	male	$100,000 to $124,999
4336811492	west south central	t	home	t	10	f	t	f	f	suburban	45 - 59	male	$200,000 and up
4336810566	new england	t	near	t	10	f	f	f	f	rural	60+	female	$25,000 to $49,999
4336809276	new england	t	near	t	10	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4336809111	south atlantic	t	near	t	10	t	t	f	f	rural	60+	male	$50,000 to $74,999
4336808397	middle atlantic	t	local	t	10	f	f	f	f	suburban	18 - 29	male	$25,000 to $49,999
4336808238	middle atlantic	t	near	t	10	f	t	f	f	urban	45 - 59	female	prefer not to answer
4336808019	south atlantic	t	local	f	10	f	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336807635	south atlantic	t	home	t	21	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4336806751	middle atlantic	f	home	f	10	f	t	f	f	suburban	30 - 44	female	prefer not to answer
4336804174	south atlantic	t	far	t	10	t	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336804003	east north central	t	local	t	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336802942	east north central	t	local	f	10	f	t	f	f	suburban	60+	female	prefer not to answer
4336802030	east north central	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336801887	east north central	t	local	t	10	t	f	f	f	urban	60+	female	prefer not to answer
4336800334	middle atlantic	f	far	t	12	f	f	f	f	rural	45 - 59	female	$175,000 to $199,999
4336800274	new england	f	near	f	21	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336799773	new england	f	home	f	10	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336799337	east north central	f	near	f	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4336799126	east north central	f	local	f	10	t	f	f	f	suburban	60+	male	$50,000 to $74,999
4336799058	east north central	t	near	f	10	f	f	f	f	suburban	45 - 59	male	$150,000 to $174,999
4336797746	east north central	t	home	t	10	f	f	f	f	suburban	60+	male	$175,000 to $199,999
4336795509	middle atlantic	f	home	t	10	f	t	f	f	rural	18 - 29	female	prefer not to answer
4336794143	east north central	t	home	t	10	f	f	f	f	rural	45 - 59	female	$10,000 to $24,999
4336794044	new england	t	home	t	13	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336793943	south atlantic	t	near	t	10	f	f	t	t	suburban	18 - 29	female	$75,000 to $99,999
4336793870	east south central	f	local	t	10	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4336792331	east north central	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336792302	east south central	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336790523	middle atlantic	t	home	t	21	t	f	f	f	suburban	45 - 59	female	prefer not to answer
4336789188	south atlantic	t	local	f	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336788022	east north central	f	home	t	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336787017	south atlantic	t	near	f	10	f	f	f	f	suburban	60+	male	$125,000 to $149,999
4336785978	east north central	t	home	t	10	f	f	f	f	suburban	60+	female	$75,000 to $99,999
4336785048	west south central	t	home	t	21	f	f	f	f	suburban	60+	female	$200,000 and up
4336784825	east north central	t	home	f	17	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336783082	mountain	t	far	t	10	t	f	f	f	urban	45 - 59	female	$25,000 to $49,999
4336780483	west south central	t	home	t	10	f	f	f	f	rural	60+	female	prefer not to answer
4336779288	middle atlantic	t	near	t	10	f	f	t	f	urban	30 - 44	male	$75,000 to $99,999
4336776734	south atlantic	t	home	t	21	f	t	f	f	urban	60+	female	$10,000 to $24,999
4336775444	west south central	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336775416	middle atlantic	f	near	t	10	f	t	f	f	suburban	45 - 59	male	$200,000 and up
4336774641	south atlantic	t	home	t	10	t	f	f	f	suburban	45 - 59	female	prefer not to answer
4336772456	south atlantic	t	home	f	10	t	t	f	f	urban	45 - 59	female	$25,000 to $49,999
4336772452	middle atlantic	t	home	t	16	f	f	f	f	suburban	60+	male	$200,000 and up
4336771206	east north central	f	home	f	21	f	f	f	f	rural	60+	male	$100,000 to $124,999
4336770959	middle atlantic	t	home	t	10	f	f	f	f	rural	30 - 44	female	$10,000 to $24,999
4336768956	south atlantic	t	local	f	10	f	f	f	f	urban	60+	male	$100,000 to $124,999
4336768662	middle atlantic	t	near	t	15	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336768149	east north central	t	near	f	10	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4336767119	middle atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336766876	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336764121	west south central	t	near	t	10	f	f	f	f	rural	18 - 29	female	$75,000 to $99,999
4336764087	south atlantic	t	local	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336763694	middle atlantic	t	near	f	21	f	f	f	f	rural	45 - 59	female	$200,000 and up
4336763416	west south central	f	home	t	21	f	f	f	f	suburban	18 - 29	male	prefer not to answer
4336763302	east south central	t	local	f	14	f	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4336762600	east south central	t	local	t	21	f	f	f	f	suburban	60+	female	$175,000 to $199,999
4336762458	middle atlantic	t	near	t	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336762096	pacific	f	far	f	10	t	f	f	f	urban	45 - 59	male	$125,000 to $149,999
4336761799	pacific	f	near	f	10	f	f	f	f	suburban	45 - 59	male	$25,000 to $49,999
4336761290	middle atlantic	t	home	f	13	t	t	f	f	rural	45 - 59	male	prefer not to answer
4336760341	new england	t	far	f	21	f	f	f	f	rural	18 - 29	female	prefer not to answer
4336760110	south atlantic	t	near	f	21	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4336759353	east north central	t	near	f	10	t	f	f	f	suburban	60+	male	$25,000 to $49,999
4336758840	mountain	f	near	t	21	f	f	f	f	urban	30 - 44	male	$50,000 to $74,999
4336756589	middle atlantic	t	home	t	20	t	t	f	f	suburban	45 - 59	female	$200,000 and up
4336756075	east north central	t	home	f	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336754872	south atlantic	t	home	t	21	f	f	f	f	suburban	60+	male	$125,000 to $149,999
4336754457	south atlantic	f	home	f	10	t	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336754179	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336752791	middle atlantic	f	local	f	10	f	f	f	f	suburban	60+	male	$200,000 and up
4336752314	west north central	f	local	f	10	t	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336752112	west north central	t	home	t	10	f	f	f	f	urban	60+	female	$75,000 to $99,999
4336749249	new england	f	home	f	11	t	f	f	f	rural	45 - 59	female	$150,000 to $174,999
4336748097	south atlantic	t	local	f	10	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4336747306	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336746217	middle atlantic	t	near	f	21	f	f	f	f	urban	45 - 59	male	$0 to $9,999
4336746110	east south central	t	home	t	21	f	t	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336746002	west south central	f	home	t	10	f	t	f	f	suburban	60+	female	$10,000 to $24,999
4336745373	south atlantic	t	home	t	12	f	t	f	f	urban	60+	female	$25,000 to $49,999
4336744632	middle atlantic	f	near	f	10	f	f	f	f	urban	60+	male	$50,000 to $74,999
4336743563	east north central	t	near	f	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336738591	middle atlantic	f	far	t	17	t	t	f	f	rural	30 - 44	male	prefer not to answer
4336738214	south atlantic	t	local	f	10	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336736562	middle atlantic	f	home	f	10	f	f	f	f	rural	45 - 59	female	$175,000 to $199,999
4336733948	pacific	f	local	f	21	f	f	f	f	urban	45 - 59	male	$75,000 to $99,999
4336731531	east north central	t	home	f	15	f	t	f	f	rural	45 - 59	male	$100,000 to $124,999
4336728581	east south central	t	home	t	21	f	t	f	f	rural	60+	female	prefer not to answer
4336728147	west north central	f	near	t	16	f	t	f	f	rural	30 - 44	female	prefer not to answer
4336727141	south atlantic	t	home	f	10	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4336726910	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336726144	south atlantic	t	home	t	21	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336725284	new england	f	local	f	10	f	f	f	f	urban	60+	male	$75,000 to $99,999
4336722668	south atlantic	t	home	t	10	f	t	t	t	rural	30 - 44	female	$25,000 to $49,999
4336722051	east north central	t	near	t	10	f	t	f	f	urban	60+	female	$50,000 to $74,999
4336721418	east north central	t	local	f	13	f	f	f	f	suburban	45 - 59	female	$125,000 to $149,999
4336719997	south atlantic	t	far	t	21	f	f	f	f	suburban	45 - 59	female	$0 to $9,999
4336719266	new england	f	near	f	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336717891	middle atlantic	t	local	f	10	t	f	f	f	suburban	30 - 44	male	$150,000 to $174,999
4336717466	east north central	t	local	f	10	f	t	t	f	urban	60+	male	$25,000 to $49,999
4336717454	south atlantic	f	local	f	10	f	t	f	f	suburban	30 - 44	female	$125,000 to $149,999
4336714289	south atlantic	t	home	t	18	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336714072	south atlantic	t	home	t	10	f	f	f	f	rural	30 - 44	female	$25,000 to $49,999
4336713367	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336711671	west north central	t	near	f	10	f	f	f	f	rural	30 - 44	male	$50,000 to $74,999
4336707912	east south central	t	local	f	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336706821	new england	t	home	t	21	f	f	f	f	rural	45 - 59	male	$200,000 and up
4336702108	south atlantic	t	local	t	10	f	t	f	f	rural	18 - 29	male	$25,000 to $49,999
4336702007	west north central	f	home	f	10	f	f	f	f	urban	30 - 44	male	$150,000 to $174,999
4336701807	west south central	f	local	t	15	f	f	f	f	suburban	45 - 59	male	$150,000 to $174,999
4336701591	new england	f	near	t	20	f	f	f	f	urban	60+	female	$75,000 to $99,999
4336700179	south atlantic	f	home	t	13	t	f	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336699442	pacific	f	home	f	10	f	f	f	f	suburban	60+	female	$150,000 to $174,999
4336699080	middle atlantic	f	home	t	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336698057	south atlantic	f	local	f	10	f	f	f	f	suburban	60+	male	$150,000 to $174,999
4336697274	west north central	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336696561	new england	t	near	f	10	f	f	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336692873	middle atlantic	f	home	t	10	f	t	f	f	suburban	60+	female	$25,000 to $49,999
4336692199	east north central	t	home	t	21	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336690603	east north central	t	near	f	12	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336689196	south atlantic	f	local	t	10	f	f	f	f	rural	45 - 59	female	$50,000 to $74,999
4336688947	middle atlantic	f	home	t	10	f	t	f	f	suburban	45 - 59	male	$150,000 to $174,999
4336681909	east north central	f	home	f	10	f	f	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336681398	south atlantic	f	home	t	21	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336679323	south atlantic	t	home	f	10	f	f	f	f	rural	60+	male	$100,000 to $124,999
4336678787	west north central	t	local	f	10	f	f	f	f	suburban	18 - 29	male	$50,000 to $74,999
4336675538	west north central	t	home	f	10	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4336674655	east north central	t	home	f	11	f	f	f	f	rural	45 - 59	female	$100,000 to $124,999
4336671419	south atlantic	t	home	t	17	t	t	f	f	suburban	60+	female	$25,000 to $49,999
4336670313	east north central	f	home	f	10	f	f	f	f	suburban	45 - 59	male	$50,000 to $74,999
4336670027	east north central	f	local	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336665828	mountain	f	local	t	21	f	t	f	f	suburban	60+	female	$75,000 to $99,999
4336665636	south atlantic	f	home	t	21	f	f	f	f	rural	60+	female	$75,000 to $99,999
4336665537	new england	f	near	t	10	f	f	f	f	rural	60+	male	$200,000 and up
4336665417	middle atlantic	f	home	t	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336662967	\N	t	home	f	11	t	t	t	t	rural	30 - 44	male	$0 to $9,999
4336660983	west south central	t	home	f	21	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336660839	middle atlantic	f	home	f	21	f	f	f	f	suburban	60+	male	$200,000 and up
4336657464	south atlantic	t	near	t	10	f	f	f	f	suburban	60+	female	prefer not to answer
4336654576	west north central	t	home	f	10	f	f	f	f	suburban	60+	female	prefer not to answer
4336653814	east south central	f	home	f	10	f	t	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336651539	south atlantic	f	near	f	12	t	t	t	f	rural	60+	male	$25,000 to $49,999
4336646584	middle atlantic	f	home	f	13	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336644693	west south central	t	far	t	21	t	t	f	f	urban	45 - 59	female	$25,000 to $49,999
4336643754	south atlantic	t	local	f	10	t	f	f	f	urban	18 - 29	male	prefer not to answer
4336643722	west south central	t	far	t	14	t	f	f	f	suburban	30 - 44	female	$150,000 to $174,999
4336643107	east north central	f	home	t	10	f	f	f	f	rural	45 - 59	female	$25,000 to $49,999
4336640736	south atlantic	f	near	f	21	t	f	f	f	suburban	30 - 44	male	$100,000 to $124,999
4336640541	south atlantic	t	near	t	10	t	f	f	f	rural	30 - 44	male	prefer not to answer
4336639517	south atlantic	t	local	f	16	f	f	f	f	rural	45 - 59	male	prefer not to answer
4336638494	middle atlantic	f	far	f	10	f	f	f	f	suburban	60+	male	$25,000 to $49,999
4336637202	new england	t	near	t	10	t	t	f	f	suburban	30 - 44	male	prefer not to answer
4336636152	middle atlantic	t	local	f	15	f	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4336634372	west south central	t	local	t	10	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4336626273	west north central	f	local	t	10	f	f	f	f	suburban	60+	female	$200,000 and up
4336625061	south atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336623766	south atlantic	f	home	f	11	f	f	f	f	suburban	60+	male	$175,000 to $199,999
4336620413	south atlantic	t	near	t	21	f	f	f	f	suburban	18 - 29	male	$0 to $9,999
4336618877	south atlantic	t	local	f	10	f	f	f	f	rural	45 - 59	male	$50,000 to $74,999
4336618002	new england	f	home	t	10	f	f	f	f	rural	45 - 59	male	$125,000 to $149,999
4336614170	south atlantic	f	far	t	21	t	f	f	f	suburban	30 - 44	female	$25,000 to $49,999
4336612504	east north central	t	local	t	15	t	t	f	f	urban	18 - 29	female	$125,000 to $149,999
4336611982	south atlantic	t	near	f	10	f	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336611199	east south central	t	local	f	10	f	t	f	f	suburban	30 - 44	female	$125,000 to $149,999
4336603089	new england	f	near	t	12	f	f	f	f	suburban	60+	male	$150,000 to $174,999
4336602707	west south central	t	near	t	13	f	t	t	f	rural	18 - 29	male	$0 to $9,999
4336601397	west north central	f	home	t	21	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4336596402	mountain	f	near	t	16	f	t	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336594873	south atlantic	t	near	t	12	f	f	f	f	rural	60+	female	prefer not to answer
4336594744	south atlantic	t	near	t	21	t	f	f	f	suburban	18 - 29	female	$75,000 to $99,999
4336594299	east north central	f	local	f	11	f	f	f	f	rural	60+	male	$100,000 to $124,999
4336593880	new england	f	near	f	21	f	f	f	f	suburban	45 - 59	female	prefer not to answer
4336592653	south atlantic	t	home	t	10	f	f	f	f	suburban	60+	female	$125,000 to $149,999
4336586686	west south central	t	near	f	10	f	f	f	f	suburban	18 - 29	male	$75,000 to $99,999
4336581703	new england	f	far	t	10	t	f	f	f	rural	45 - 59	male	$125,000 to $149,999
4336580777	south atlantic	t	near	t	12	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336574897	south atlantic	t	local	t	10	f	f	f	f	rural	60+	male	$50,000 to $74,999
4336574336	east north central	t	near	f	10	t	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4336574124	west north central	f	local	f	10	f	f	f	f	urban	60+	male	$10,000 to $24,999
4336570007	south atlantic	t	home	t	10	f	f	f	f	rural	60+	male	$200,000 and up
4336559810	west north central	t	local	f	10	f	f	f	f	suburban	45 - 59	female	prefer not to answer
4336557451	middle atlantic	t	home	t	21	t	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336554350	new england	t	home	f	10	f	f	f	f	suburban	45 - 59	male	$200,000 and up
4336549169	east north central	t	local	t	12	f	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336548962	west south central	t	local	f	12	t	t	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336547916	south atlantic	f	local	t	12	f	f	f	f	rural	30 - 44	female	$125,000 to $149,999
4336547275	middle atlantic	t	home	t	17	t	f	f	f	rural	60+	female	$25,000 to $49,999
4336546028	west south central	f	home	t	10	f	t	f	f	suburban	30 - 44	female	$200,000 and up
4336544071	west south central	t	far	f	21	f	t	f	f	urban	45 - 59	female	$50,000 to $74,999
4336543220	east north central	f	home	t	10	f	t	f	f	rural	45 - 59	female	$200,000 and up
4336541332	south atlantic	t	local	t	21	f	f	f	f	suburban	60+	female	$10,000 to $24,999
4336540513	middle atlantic	t	local	t	13	f	f	f	f	suburban	45 - 59	female	$175,000 to $199,999
4336535098	south atlantic	t	home	t	10	f	t	f	f	suburban	60+	female	$100,000 to $124,999
4336533400	west south central	t	near	f	10	f	f	f	f	rural	45 - 59	male	$150,000 to $174,999
4336527571	east north central	t	local	t	10	f	f	f	f	suburban	60+	male	$25,000 to $49,999
4336527545	south atlantic	t	home	f	10	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336524165	middle atlantic	f	local	f	21	f	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4336522973	\N	f	local	f	14	f	f	f	f	urban	45 - 59	female	prefer not to answer
4336520950	middle atlantic	t	home	t	10	f	f	f	f	suburban	30 - 44	male	prefer not to answer
4336518573	east north central	t	local	f	10	f	f	f	f	urban	30 - 44	male	$10,000 to $24,999
4336516793	new england	f	home	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336512650	east north central	t	far	t	10	f	f	f	f	rural	45 - 59	female	$75,000 to $99,999
4336510658	west south central	t	home	t	10	f	f	f	f	rural	45 - 59	male	$125,000 to $149,999
4336509936	east north central	t	home	f	10	f	f	f	f	rural	45 - 59	male	$200,000 and up
4336505029	south atlantic	f	home	f	21	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4336500591	new england	f	near	f	10	f	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4336498949	east north central	t	local	f	12	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336497964	middle atlantic	t	local	f	20	t	f	t	t	rural	45 - 59	female	prefer not to answer
4336497833	east north central	t	home	t	14	f	f	f	f	rural	60+	female	$75,000 to $99,999
4336496891	south atlantic	t	far	t	13	f	t	f	f	rural	45 - 59	male	$200,000 and up
4336495665	east north central	f	home	f	10	t	f	t	f	urban	60+	female	$50,000 to $74,999
4336490883	south atlantic	t	far	t	21	f	t	f	f	suburban	45 - 59	male	$75,000 to $99,999
4336490784	east north central	t	near	f	13	f	f	f	f	rural	45 - 59	female	$50,000 to $74,999
4336490014	pacific	f	local	f	13	t	f	f	f	suburban	30 - 44	female	$0 to $9,999
4336487804	south atlantic	f	far	t	10	t	f	f	f	suburban	45 - 59	male	$200,000 and up
4336486285	west south central	f	home	f	10	f	f	f	f	urban	45 - 59	male	$75,000 to $99,999
4336482823	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336480011	pacific	f	home	f	10	f	f	f	f	rural	30 - 44	male	$0 to $9,999
4336479126	new england	f	near	t	11	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336478617	east north central	f	near	f	10	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336477366	south atlantic	t	near	f	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336471362	middle atlantic	t	local	f	10	t	t	f	f	suburban	60+	male	$25,000 to $49,999
4336471066	east north central	f	home	f	10	f	f	f	f	rural	45 - 59	female	$125,000 to $149,999
4336467288	\N	f	local	f	16	t	f	f	f	urban	18 - 29	female	$50,000 to $74,999
4336465723	south atlantic	f	local	f	10	f	f	t	f	suburban	60+	male	$50,000 to $74,999
4336465404	middle atlantic	t	local	t	10	f	t	f	f	urban	60+	male	$75,000 to $99,999
4336465104	south atlantic	t	near	t	19	f	t	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336464178	middle atlantic	t	local	t	10	f	f	f	f	suburban	60+	male	prefer not to answer
4336463294	middle atlantic	t	home	t	10	t	t	t	t	urban	30 - 44	female	$10,000 to $24,999
4336460536	pacific	t	local	f	12	t	t	f	f	urban	30 - 44	male	$25,000 to $49,999
4336459298	east north central	t	home	t	14	f	f	f	f	suburban	60+	male	$50,000 to $74,999
4336457715	east north central	t	near	f	17	f	f	f	f	rural	60+	male	$200,000 and up
4336452468	west south central	t	local	t	12	f	f	f	f	rural	18 - 29	female	$75,000 to $99,999
4336449973	east north central	t	far	f	21	f	f	f	f	suburban	45 - 59	male	$0 to $9,999
4336448779	south atlantic	f	home	f	21	t	f	f	f	urban	60+	male	$175,000 to $199,999
4336445862	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336442018	middle atlantic	f	home	t	10	t	f	f	f	urban	18 - 29	male	$75,000 to $99,999
4336433694	west north central	t	home	t	21	t	f	f	f	suburban	30 - 44	female	$100,000 to $124,999
4336426326	south atlantic	f	home	f	12	f	t	f	f	rural	60+	female	$125,000 to $149,999
4336426077	east north central	t	home	t	10	f	t	f	f	rural	30 - 44	female	$75,000 to $99,999
4336422509	west north central	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336420032	middle atlantic	t	near	f	15	f	f	f	f	suburban	60+	female	$175,000 to $199,999
4336414511	mountain	t	local	t	18	t	f	f	f	urban	45 - 59	female	$200,000 and up
4336405712	south atlantic	t	local	t	18	f	f	f	f	rural	30 - 44	male	$100,000 to $124,999
4336403950	pacific	t	home	f	15	f	f	f	f	urban	45 - 59	female	$75,000 to $99,999
4336403233	new england	f	near	t	10	f	t	t	f	urban	18 - 29	male	$0 to $9,999
4336400854	mountain	f	near	f	10	t	f	t	t	suburban	45 - 59	female	$75,000 to $99,999
4336391382	pacific	t	home	f	21	f	f	f	f	rural	60+	male	$10,000 to $24,999
4336387798	east south central	t	far	t	21	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336381595	mountain	t	local	t	21	f	f	f	f	urban	60+	female	prefer not to answer
4336379876	middle atlantic	t	far	f	10	t	f	f	f	urban	30 - 44	female	prefer not to answer
4336376803	middle atlantic	t	far	t	10	t	f	f	f	suburban	45 - 59	male	$125,000 to $149,999
4336376443	east north central	t	home	f	12	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4336371555	mountain	f	far	t	10	f	f	f	f	rural	45 - 59	female	$125,000 to $149,999
4336368343	middle atlantic	t	home	t	21	f	f	f	f	rural	45 - 59	male	$10,000 to $24,999
4336368281	west south central	t	local	t	10	f	t	f	f	urban	60+	female	$0 to $9,999
4336366345	south atlantic	f	home	f	21	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4336365763	south atlantic	f	home	f	10	t	f	f	f	suburban	45 - 59	female	$200,000 and up
4336351539	west north central	f	local	f	10	f	f	t	f	urban	18 - 29	female	prefer not to answer
4336351224	pacific	t	near	f	12	t	f	f	f	urban	45 - 59	male	$25,000 to $49,999
4336348590	east south central	t	near	t	10	t	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4336346355	south atlantic	f	home	f	18	t	t	f	f	suburban	45 - 59	female	$125,000 to $149,999
4336337183	south atlantic	t	home	t	14	f	f	f	f	suburban	45 - 59	male	$25,000 to $49,999
4336336129	east north central	t	home	t	10	f	t	f	f	rural	45 - 59	female	$25,000 to $49,999
4336333982	east south central	t	home	f	10	f	f	f	f	rural	60+	female	$25,000 to $49,999
4336326250	middle atlantic	t	far	t	10	f	f	f	f	suburban	45 - 59	male	prefer not to answer
4336324874	middle atlantic	t	local	f	10	f	f	f	f	suburban	45 - 59	female	prefer not to answer
4336322606	south atlantic	t	home	f	10	t	t	f	f	urban	30 - 44	male	prefer not to answer
4336321558	south atlantic	f	local	f	10	f	f	t	t	suburban	45 - 59	female	$200,000 and up
4336317891	west south central	t	near	t	21	f	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4336313453	new england	f	near	f	10	f	f	f	f	rural	60+	male	$25,000 to $49,999
4336313021	east north central	f	local	f	10	t	f	f	f	suburban	60+	male	$100,000 to $124,999
4336312523	west south central	f	near	t	21	t	f	f	f	urban	18 - 29	female	prefer not to answer
4336306664	east north central	t	local	f	11	f	f	f	f	urban	30 - 44	female	$0 to $9,999
4336302631	mountain	t	home	f	10	t	f	f	f	rural	30 - 44	female	$200,000 and up
4336301847	east north central	t	far	f	21	t	f	f	f	urban	45 - 59	male	$50,000 to $74,999
4336299882	west south central	t	near	t	10	f	t	t	t	rural	18 - 29	female	$25,000 to $49,999
4336298829	east north central	t	home	t	10	f	t	f	f	rural	45 - 59	male	$50,000 to $74,999
4336288339	mountain	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336288217	pacific	f	local	f	10	f	f	f	f	suburban	30 - 44	male	$10,000 to $24,999
4336276238	middle atlantic	f	home	t	21	f	f	f	f	suburban	60+	female	$125,000 to $149,999
4336271469	west north central	t	home	f	10	f	f	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336258240	\N	t	local	f	14	t	t	t	t	urban	18 - 29	male	$0 to $9,999
4336255036	south atlantic	f	far	f	10	t	f	f	f	suburban	60+	male	prefer not to answer
4336249082	west north central	t	near	t	21	f	t	f	f	urban	30 - 44	female	$25,000 to $49,999
4336248435	\N	t	local	f	10	t	f	f	f	urban	18 - 29	male	$0 to $9,999
4336238126	pacific	f	local	f	21	f	f	f	f	urban	18 - 29	female	$10,000 to $24,999
4336235428	\N	t	near	f	20	t	f	f	f	suburban	18 - 29	female	$200,000 and up
4336232691	south atlantic	f	local	t	10	f	f	f	f	suburban	45 - 59	male	prefer not to answer
4336231459	pacific	t	local	t	10	f	t	f	f	rural	45 - 59	female	$50,000 to $74,999
4336227131	south atlantic	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4336224500	east north central	f	home	t	13	t	f	f	f	suburban	18 - 29	female	prefer not to answer
4336221484	south atlantic	t	far	t	10	f	f	f	f	suburban	60+	female	$125,000 to $149,999
4336215705	\N	t	near	f	10	t	f	f	f	suburban	18 - 29	male	$0 to $9,999
4336208942	west south central	t	near	f	17	t	t	f	f	urban	18 - 29	male	$0 to $9,999
4336203800	west south central	t	near	f	10	f	f	f	f	suburban	45 - 59	female	$75,000 to $99,999
4336199133	pacific	t	home	t	10	f	t	f	f	urban	30 - 44	male	$25,000 to $49,999
4336194345	middle atlantic	t	near	t	10	t	t	f	f	suburban	30 - 44	female	$175,000 to $199,999
4336189898	south atlantic	f	near	f	12	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4336189473	middle atlantic	t	home	t	10	f	f	f	f	suburban	30 - 44	male	$125,000 to $149,999
4336185735	pacific	t	near	t	10	f	f	f	f	suburban	60+	female	$25,000 to $49,999
4336181226	pacific	f	far	t	10	t	f	f	f	suburban	18 - 29	male	prefer not to answer
4336176902	pacific	f	home	t	10	f	f	f	f	urban	60+	male	$50,000 to $74,999
4336175740	west north central	t	local	t	14	f	t	t	f	suburban	18 - 29	female	$25,000 to $49,999
4336175699	pacific	t	home	f	19	t	f	f	f	suburban	18 - 29	female	$0 to $9,999
4336175345	pacific	f	home	t	12	f	f	f	f	urban	18 - 29	female	$100,000 to $124,999
4336168292	west south central	t	far	t	10	f	t	f	f	urban	18 - 29	female	$0 to $9,999
4336164056	pacific	f	near	f	12	t	f	f	f	suburban	30 - 44	female	$150,000 to $174,999
4336163908	middle atlantic	t	near	t	10	t	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336161556	pacific	f	home	f	15	f	f	f	f	suburban	18 - 29	female	$50,000 to $74,999
4336146440	south atlantic	t	home	t	10	f	t	f	f	rural	45 - 59	female	$75,000 to $99,999
4336144357	middle atlantic	f	local	t	21	f	f	f	f	urban	60+	male	$50,000 to $74,999
4336142896	\N	f	home	f	10	f	f	f	f	\N	\N	\N	\N
4336137995	west south central	t	home	t	10	t	f	f	f	urban	30 - 44	female	$0 to $9,999
4336137435	pacific	t	local	f	13	t	t	f	f	urban	30 - 44	male	$75,000 to $99,999
4336137098	west south central	t	local	t	21	t	f	t	t	urban	18 - 29	female	$25,000 to $49,999
4336134461	west south central	t	near	f	21	f	f	f	f	rural	30 - 44	male	$75,000 to $99,999
4336133522	west south central	f	near	f	15	t	t	t	f	suburban	18 - 29	male	$0 to $9,999
4336133454	pacific	f	local	t	10	f	f	f	f	urban	18 - 29	female	prefer not to answer
4336131533	pacific	f	near	t	10	t	f	f	f	urban	18 - 29	female	$10,000 to $24,999
4336131319	mountain	f	near	f	21	t	f	f	f	suburban	60+	female	$100,000 to $124,999
4336128578	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336126090	pacific	t	local	t	21	t	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336125524	mountain	t	home	t	10	f	f	f	f	urban	60+	female	prefer not to answer
4336121663	pacific	f	home	f	10	t	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4336120894	west north central	f	home	f	10	f	f	f	f	rural	18 - 29	female	$50,000 to $74,999
4336119647	pacific	f	home	f	10	f	f	f	f	suburban	18 - 29	female	$100,000 to $124,999
4336117281	pacific	f	near	t	10	f	t	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336117179	pacific	f	home	t	13	f	f	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336111339	pacific	t	local	t	10	t	t	f	f	urban	45 - 59	female	$100,000 to $124,999
4336108209	new england	t	local	f	14	t	t	t	t	urban	30 - 44	male	$100,000 to $124,999
4336106089	west north central	f	home	f	21	f	f	f	f	suburban	18 - 29	male	$25,000 to $49,999
4336106041	east north central	t	local	f	21	f	t	f	f	urban	60+	female	$50,000 to $74,999
4336104179	south atlantic	t	home	t	13	t	f	f	f	suburban	60+	female	prefer not to answer
4336103434	east north central	f	home	f	21	t	f	f	f	urban	30 - 44	male	$50,000 to $74,999
4336103319	east north central	t	home	t	21	f	f	f	f	rural	60+	female	$100,000 to $124,999
4336101470	pacific	f	local	f	10	t	f	f	f	urban	45 - 59	female	$175,000 to $199,999
4336099044	pacific	f	far	f	13	t	f	f	f	suburban	18 - 29	male	$25,000 to $49,999
4336098809	west south central	t	near	t	10	t	f	f	f	rural	60+	male	prefer not to answer
4336093974	west north central	t	home	f	21	t	f	f	f	rural	30 - 44	male	$10,000 to $24,999
4336092370	south atlantic	t	local	t	14	t	t	t	t	suburban	45 - 59	female	$10,000 to $24,999
4336091474	pacific	t	home	f	19	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4336090652	pacific	t	home	t	15	t	t	f	f	suburban	18 - 29	female	$175,000 to $199,999
4336090647	pacific	t	near	f	11	t	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4336090552	south atlantic	t	local	f	21	f	f	f	f	rural	45 - 59	female	$10,000 to $24,999
4336086559	middle atlantic	f	home	t	10	f	f	f	f	rural	30 - 44	female	$25,000 to $49,999
4336085504	south atlantic	t	home	f	11	t	f	f	f	rural	18 - 29	female	prefer not to answer
4336085020	\N	t	home	f	10	f	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4336083561	west north central	f	near	t	21	f	t	f	f	rural	18 - 29	female	prefer not to answer
4336083443	east north central	t	near	t	10	f	t	f	f	urban	45 - 59	female	$25,000 to $49,999
4336081481	pacific	t	far	t	21	f	f	f	f	urban	60+	male	$25,000 to $49,999
4336080517	south atlantic	f	home	t	16	t	t	f	f	suburban	45 - 59	female	$100,000 to $124,999
4336078959	mountain	t	home	t	12	f	f	f	f	urban	30 - 44	female	$50,000 to $74,999
4336078481	pacific	t	home	f	10	f	f	f	f	suburban	60+	male	$50,000 to $74,999
4336076367	middle atlantic	f	local	f	10	f	f	f	f	urban	45 - 59	female	$50,000 to $74,999
4336076365	pacific	f	local	f	11	f	f	f	f	suburban	30 - 44	male	$75,000 to $99,999
4336076323	west south central	t	local	f	15	f	t	f	f	suburban	18 - 29	female	$0 to $9,999
4336074858	pacific	t	near	f	10	f	f	f	f	suburban	18 - 29	female	$25,000 to $49,999
4336073613	pacific	f	near	t	10	f	f	f	f	urban	45 - 59	female	prefer not to answer
4336073270	middle atlantic	f	home	f	12	f	f	f	f	suburban	60+	female	$200,000 and up
4336070791	east north central	t	near	t	18	f	t	f	f	suburban	18 - 29	female	prefer not to answer
4336068292	middle atlantic	f	near	f	21	f	f	f	f	suburban	45 - 59	female	$50,000 to $74,999
4336066162	pacific	t	home	t	10	f	t	f	f	urban	18 - 29	female	$0 to $9,999
4336065006	east north central	t	near	t	21	t	t	f	f	urban	18 - 29	female	$10,000 to $24,999
4336062672	pacific	f	home	f	10	f	f	f	f	rural	60+	female	$200,000 and up
4336058499	pacific	f	home	f	21	f	f	f	f	urban	60+	female	$150,000 to $174,999
4336057426	pacific	t	home	t	10	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4336056145	south atlantic	t	local	t	12	t	t	f	f	rural	18 - 29	female	$0 to $9,999
4336055904	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336048135	middle atlantic	t	local	t	13	t	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4336047575	west south central	t	home	t	18	t	t	f	f	rural	30 - 44	female	$25,000 to $49,999
4336047405	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336041912	west south central	f	local	f	10	t	f	f	f	urban	18 - 29	male	$25,000 to $49,999
4336040902	south atlantic	t	home	f	10	f	f	f	f	urban	18 - 29	female	$25,000 to $49,999
4336040679	pacific	f	far	f	10	f	f	f	f	suburban	60+	male	$200,000 and up
4336040464	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4336038370	pacific	t	near	f	18	f	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336037944	new england	t	near	f	21	f	f	f	f	urban	60+	female	$75,000 to $99,999
4336037337	west south central	t	local	t	14	t	f	f	f	urban	18 - 29	female	$150,000 to $174,999
4336036960	pacific	f	home	f	21	f	f	f	f	rural	60+	female	$150,000 to $174,999
4336034694	pacific	t	home	t	10	t	t	f	f	suburban	18 - 29	female	$0 to $9,999
4336033443	west south central	t	home	f	10	t	f	t	f	urban	18 - 29	female	$0 to $9,999
4336030046	west north central	t	near	t	10	f	t	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336029825	east south central	t	local	t	18	f	f	f	f	rural	18 - 29	female	$50,000 to $74,999
4336027932	pacific	f	local	f	14	f	f	f	f	suburban	18 - 29	female	$10,000 to $24,999
4336023531	pacific	t	far	f	21	t	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4336022983	new england	t	local	t	21	f	t	f	f	urban	60+	male	$25,000 to $49,999
4336022372	middle atlantic	t	home	t	10	f	f	f	f	suburban	45 - 59	female	$25,000 to $49,999
4336022096	middle atlantic	t	home	t	16	f	t	f	f	suburban	18 - 29	female	$200,000 and up
4336021883	middle atlantic	t	local	t	10	f	f	f	f	suburban	30 - 44	female	$75,000 to $99,999
4336021180	west south central	t	home	t	12	f	f	f	f	suburban	60+	male	$125,000 to $149,999
4336018601	mountain	f	home	f	21	f	f	f	f	urban	60+	female	$200,000 and up
4336017089	\N	t	local	f	13	t	f	t	f	rural	18 - 29	male	$0 to $9,999
4336016535	middle atlantic	f	near	t	12	f	t	t	t	urban	30 - 44	female	$10,000 to $24,999
4336015865	middle atlantic	f	home	t	10	t	f	f	f	suburban	18 - 29	female	prefer not to answer
4336015017	south atlantic	f	home	f	10	f	f	f	f	suburban	18 - 29	male	$0 to $9,999
4336014587	west north central	f	local	t	12	f	f	f	f	suburban	18 - 29	female	$0 to $9,999
4336014104	east south central	t	home	f	12	f	f	f	f	rural	45 - 59	female	prefer not to answer
4336012118	pacific	t	home	t	21	f	f	f	f	suburban	60+	female	$125,000 to $149,999
4336012003	west south central	t	home	t	12	t	f	f	f	urban	45 - 59	female	$75,000 to $99,999
4336011166	pacific	f	local	f	10	t	f	f	f	suburban	60+	female	$100,000 to $124,999
4336006784	west north central	f	far	t	10	f	f	f	f	suburban	60+	male	$50,000 to $74,999
4336005220	middle atlantic	t	near	t	21	f	f	f	f	suburban	30 - 44	male	$0 to $9,999
4336002999	west north central	t	home	f	12	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4336002487	middle atlantic	t	near	f	11	t	t	t	f	urban	45 - 59	female	prefer not to answer
4336001840	west south central	t	home	t	10	f	t	f	f	rural	45 - 59	female	$50,000 to $74,999
4336001546	west south central	f	home	f	21	f	f	f	f	rural	60+	male	$10,000 to $24,999
4335999720	pacific	f	home	f	10	f	f	f	f	suburban	30 - 44	male	$100,000 to $124,999
4335998934	pacific	f	near	f	21	f	f	f	f	urban	60+	male	$50,000 to $74,999
4335996765	pacific	t	home	f	15	f	f	f	f	urban	18 - 29	female	$0 to $9,999
4335996482	pacific	t	home	t	10	f	f	f	f	suburban	30 - 44	female	$50,000 to $74,999
4335992962	pacific	t	local	t	10	t	f	f	f	urban	60+	male	$200,000 and up
4335992074	pacific	t	local	f	21	t	f	f	f	urban	45 - 59	male	$50,000 to $74,999
4335990669	south atlantic	f	far	t	10	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4335990002	east north central	f	local	t	10	t	f	t	t	suburban	18 - 29	female	$10,000 to $24,999
4335989591	east north central	f	home	f	13	f	f	f	f	suburban	18 - 29	female	$75,000 to $99,999
4335988879	pacific	f	local	f	10	t	f	f	f	urban	30 - 44	female	$50,000 to $74,999
4335988400	east south central	t	local	f	10	f	f	f	f	suburban	60+	male	$50,000 to $74,999
4335988391	mountain	t	far	f	21	t	f	f	f	urban	60+	female	$50,000 to $74,999
4335988189	middle atlantic	t	near	t	10	f	f	f	f	rural	60+	male	$100,000 to $124,999
4335987976	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4335987642	south atlantic	t	near	t	21	f	f	f	f	suburban	18 - 29	female	prefer not to answer
4335987129	west south central	t	home	t	21	t	f	f	f	rural	30 - 44	female	$100,000 to $124,999
4335986817	pacific	t	home	f	12	f	f	t	t	urban	60+	male	$125,000 to $149,999
4335985936	south atlantic	f	local	t	10	f	t	f	f	urban	30 - 44	female	$0 to $9,999
4335983992	pacific	f	home	t	10	t	f	f	f	urban	60+	female	$25,000 to $49,999
4335983559	west north central	t	near	t	10	f	f	f	f	rural	18 - 29	female	$50,000 to $74,999
4335982114	west south central	f	home	f	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4335981269	pacific	f	home	t	21	f	f	f	f	rural	60+	female	prefer not to answer
4335981057	pacific	t	home	f	10	f	f	f	f	urban	30 - 44	male	$200,000 and up
4335979596	mountain	t	near	t	10	t	f	f	f	suburban	60+	female	$200,000 and up
4335979419	pacific	t	home	t	10	f	f	t	t	suburban	45 - 59	male	$150,000 to $174,999
4335978870	pacific	t	home	t	12	t	f	f	f	urban	60+	male	$75,000 to $99,999
4335977956	new england	t	near	t	10	t	f	f	f	urban	30 - 44	female	$10,000 to $24,999
4335977899	east south central	t	local	t	12	f	t	f	f	rural	30 - 44	female	$50,000 to $74,999
4335977124	south atlantic	t	home	t	12	f	f	f	f	rural	60+	female	$50,000 to $74,999
4335976340	west south central	t	local	f	10	f	f	t	t	suburban	45 - 59	female	$100,000 to $124,999
4335975961	pacific	f	near	f	12	f	f	f	f	urban	18 - 29	female	$25,000 to $49,999
4335974428	middle atlantic	f	home	t	14	t	f	t	t	urban	18 - 29	female	$0 to $9,999
4335974363	pacific	f	local	t	21	f	f	f	f	urban	60+	female	$25,000 to $49,999
4335973959	west north central	t	home	f	10	f	f	f	f	suburban	45 - 59	female	$200,000 and up
4335973714	west south central	t	home	t	10	f	f	f	f	rural	45 - 59	female	$100,000 to $124,999
4335972801	middle atlantic	f	far	f	10	f	f	f	f	suburban	60+	female	$100,000 to $124,999
4335971349	pacific	t	local	t	21	f	f	f	f	suburban	45 - 59	female	$150,000 to $174,999
4335970729	east south central	t	near	t	10	f	f	f	f	urban	18 - 29	male	$25,000 to $49,999
4335970072	east north central	t	home	t	16	f	f	f	f	rural	60+	male	$25,000 to $49,999
4335969513	south atlantic	t	home	t	21	f	t	f	f	rural	30 - 44	male	$10,000 to $24,999
4335967669	pacific	t	home	t	10	f	f	f	f	suburban	18 - 29	male	prefer not to answer
4335967013	east north central	f	home	t	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4335966421	pacific	t	home	f	21	t	f	f	f	rural	30 - 44	female	$50,000 to $74,999
4335966121	pacific	f	home	f	11	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4335965739	\N	f	home	f	10	f	f	f	f	suburban	\N	\N	\N
4335965542	pacific	t	home	t	14	f	f	f	f	suburban	45 - 59	female	$100,000 to $124,999
4335964313	middle atlantic	t	near	t	10	t	t	f	f	suburban	60+	female	$125,000 to $149,999
4335963222	mountain	t	far	t	21	f	f	f	f	rural	45 - 59	female	$100,000 to $124,999
4335962733	west south central	t	near	t	10	f	t	f	f	suburban	30 - 44	male	$50,000 to $74,999
4335961782	east south central	t	local	f	10	f	f	f	f	suburban	60+	female	$10,000 to $24,999
4335961440	pacific	t	home	f	10	f	f	t	t	suburban	30 - 44	female	$25,000 to $49,999
4335960847	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4335960288	pacific	f	local	f	10	f	f	t	f	urban	45 - 59	male	$175,000 to $199,999
4335960105	pacific	f	near	t	17	t	f	f	f	urban	30 - 44	female	$125,000 to $149,999
4335959876	pacific	t	local	t	14	f	f	f	f	urban	60+	female	$50,000 to $74,999
4335959857	pacific	t	near	f	21	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4335958653	south atlantic	t	local	t	21	f	f	f	f	urban	60+	female	$25,000 to $49,999
4335958292	pacific	t	local	t	10	t	f	f	f	rural	60+	male	prefer not to answer
4335958005	pacific	t	home	t	17	f	f	f	f	urban	45 - 59	female	$10,000 to $24,999
4335957772	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4335957365	west south central	f	home	t	10	f	f	f	f	suburban	45 - 59	male	$100,000 to $124,999
4335957179	pacific	f	near	f	12	t	f	f	f	urban	60+	female	$75,000 to $99,999
4335957096	east north central	t	local	f	10	f	f	f	f	suburban	45 - 59	male	$175,000 to $199,999
4335957072	middle atlantic	t	home	t	12	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4335955478	south atlantic	t	near	t	10	f	f	f	f	suburban	60+	male	$50,000 to $74,999
4335955206	pacific	f	home	f	10	f	f	f	f	suburban	45 - 59	male	$10,000 to $24,999
4335955152	west north central	f	local	t	10	f	t	f	f	suburban	45 - 59	female	$75,000 to $99,999
4335954681	east south central	t	local	t	10	f	t	f	f	urban	30 - 44	male	$75,000 to $99,999
4335954394	pacific	t	home	f	13	f	f	f	f	suburban	30 - 44	female	prefer not to answer
4335954376	east north central	f	home	f	10	t	f	f	f	suburban	30 - 44	male	$25,000 to $49,999
4335954207	pacific	f	home	t	10	f	f	f	f	suburban	30 - 44	female	$10,000 to $24,999
4335954131	pacific	t	local	f	10	f	f	f	f	suburban	60+	male	$100,000 to $124,999
4335953888	east south central	t	local	f	10	t	f	f	f	suburban	18 - 29	female	$75,000 to $99,999
4335952833	new england	f	home	t	10	t	f	t	t	suburban	30 - 44	female	$50,000 to $74,999
4335951505	west south central	t	home	t	10	f	t	f	f	rural	45 - 59	female	$25,000 to $49,999
4335951437	mountain	t	near	t	10	f	f	f	f	rural	45 - 59	female	$125,000 to $149,999
4335951082	east north central	t	local	f	10	f	f	f	f	suburban	45 - 59	male	$75,000 to $99,999
4335950917	west north central	t	home	t	10	f	t	f	f	suburban	60+	male	$25,000 to $49,999
4335950654	pacific	t	far	f	10	t	t	f	f	suburban	30 - 44	male	$75,000 to $99,999
4335949486	south atlantic	t	home	t	13	t	t	t	f	urban	18 - 29	male	$10,000 to $24,999
4335949169	pacific	t	home	t	10	t	f	f	f	urban	30 - 44	female	$25,000 to $49,999
4335949112	west north central	t	home	t	10	f	f	f	f	suburban	60+	male	$75,000 to $99,999
4335947496	\N	f	\N	f	\N	f	f	f	f	\N	\N	\N	\N
4335945415	south atlantic	t	home	t	10	f	f	f	f	rural	60+	male	$125,000 to $149,999
4335944854	pacific	t	near	f	10	f	f	f	f	suburban	60+	male	$125,000 to $149,999
4335944082	mountain	f	local	f	10	t	f	f	f	rural	30 - 44	female	$100,000 to $124,999
4335943173	pacific	f	local	t	10	f	f	f	f	suburban	60+	female	$50,000 to $74,999
4335943060	pacific	t	near	t	21	t	t	f	f	urban	60+	male	$100,000 to $124,999
4335934708	\N	t	local	t	13	f	t	t	t	\N	\N	\N	\N
4335894916	\N	t	near	t	16	t	t	f	f	\N	\N	\N	\N
\.


--
-- Data for Name: dessert; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dessert (id, dessert_type) FROM stdin;
4337954960	cheesecake
4337954960	cookies
4337954960	ice cream
4337951949	cheesecake
4337951949	cookies
4337951949	other
4337935621	brownies
4337935621	carrot cake
4337935621	cookies
4337935621	fudge
4337935621	ice cream
4337933040	none
4337931983	none
4337929779	cheesecake
4337924420	cookies
4337916002	cookies
4337914977	cookies
4337899817	none
4337893416	other
4337888291	peach cobbler
4337878450	brownies
4337878450	cookies
4337878351	none
4337857295	carrot cake
4337856362	none
4337854106	apple cobbler
4337854106	cookies
4337854106	ice cream
4337844879	none
4337823612	none
4337820281	none
4337813502	apple cobbler
4337813502	blondies
4337813502	brownies
4337793158	brownies
4337793158	cheesecake
4337792130	peach cobbler
4337790002	apple cobbler
4337790002	brownies
4337790002	carrot cake
4337790002	cheesecake
4337790002	cookies
4337790002	fudge
4337790002	ice cream
4337783794	brownies
4337779071	ice cream
4337779071	other
4337778119	none
4337774090	none
4337772882	none
4337772193	apple cobbler
4337772193	brownies
4337772193	cookies
4337772193	peach cobbler
4337771439	apple cobbler
4337763296	peach cobbler
4337758789	none
4337747968	blondies
4337747968	brownies
4337747968	carrot cake
4337747968	cheesecake
4337747968	cookies
4337747968	fudge
4337747968	ice cream
4337747968	peach cobbler
4337743121	apple cobbler
4337743121	cheesecake
4337743121	peach cobbler
4337732348	apple cobbler
4337732348	brownies
4337732348	ice cream
4337732348	peach cobbler
4337731242	cookies
4337731242	peach cobbler
4337719588	cookies
4337698969	ice cream
4337698743	cheesecake
4337698743	cookies
4337698743	ice cream
4337660047	apple cobbler
4337660047	cheesecake
4337660047	cookies
4337660047	fudge
4337660047	peach cobbler
4337655425	other
4337653684	apple cobbler
4337646565	carrot cake
4337646565	cookies
4337646565	ice cream
4337629524	apple cobbler
4337629524	peach cobbler
4337627331	other
4337626849	apple cobbler
4337626849	brownies
4337626849	carrot cake
4337626849	cookies
4337626849	peach cobbler
4337611941	cookies
4337611941	other
4337600726	none
4337598069	none
4337597044	none
4337589613	cheesecake
4337589613	peach cobbler
4337586061	none
4337583393	blondies
4337583393	brownies
4337583393	cookies
4337583245	brownies
4337583245	cheesecake
4337583245	other
4337582845	none
4337577784	none
4337569645	other
4337569057	none
4337568074	none
4337568074	other
4337553422	cheesecake
4337550299	brownies
4337550299	carrot cake
4337550299	cheesecake
4337550299	cookies
4337550299	ice cream
4337545841	brownies
4337545841	carrot cake
4337545841	cheesecake
4337545841	cookies
4337540484	none
4337531521	none
4337528775	apple cobbler
4337528775	ice cream
4337528775	peach cobbler
4337512214	ice cream
4337490067	other
4337489617	brownies
4337489617	cookies
4337487759	cookies
4337487759	ice cream
4337484305	ice cream
4337475288	none
4337468268	none
4337467677	cookies
4337448181	ice cream
4337442451	none
4337441164	carrot cake
4337441164	cheesecake
4337441070	cheesecake
4337441070	cookies
4337441070	peach cobbler
4337435277	cookies
4337435277	ice cream
4337432686	cheesecake
4337432686	cookies
4337432686	fudge
4337432686	ice cream
4337429102	peach cobbler
4337423740	apple cobbler
4337423740	peach cobbler
4337421462	none
4337412056	apple cobbler
4337412056	brownies
4337412056	carrot cake
4337412056	cookies
4337409281	apple cobbler
4337409281	ice cream
4337400534	none
4337395533	apple cobbler
4337395533	carrot cake
4337395533	cookies
4337391263	brownies
4337391263	cookies
4337390930	carrot cake
4337390930	cheesecake
4337390728	fudge
4337386038	carrot cake
4337386038	cookies
4337386038	ice cream
4337384089	apple cobbler
4337384089	cheesecake
4337384089	ice cream
4337382350	brownies
4337382350	cookies
4337380720	none
4337369789	blondies
4337369789	cheesecake
4337365738	apple cobbler
4337365738	ice cream
4337360752	ice cream
4337360389	brownies
4337360389	cheesecake
4337360389	cookies
4337360389	ice cream
4337356672	none
4337347655	cheesecake
4337347655	other
4337346312	none
4337343090	apple cobbler
4337336787	cookies
4337336787	ice cream
4337336262	carrot cake
4337333159	cookies
4337333159	peach cobbler
4337324697	apple cobbler
4337324697	brownies
4337324697	cheesecake
4337324697	cookies
4337324697	ice cream
4337324697	peach cobbler
4337323392	apple cobbler
4337323392	cookies
4337323392	fudge
4337323392	ice cream
4337319123	none
4337318895	other
4337311256	apple cobbler
4337311256	ice cream
4337310361	other
4337309060	apple cobbler
4337309060	cookies
4337296029	cookies
4337292895	cookies
4337287733	none
4337284552	cheesecake
4337275528	brownies
4337275528	cookies
4337275528	fudge
4337275528	ice cream
4337262725	cookies
4337256857	none
4337249904	other
4337247953	other
4337235972	carrot cake
4337235972	cheesecake
4337235972	cookies
4337235972	ice cream
4337235398	carrot cake
4337235398	ice cream
4337235398	peach cobbler
4337229414	apple cobbler
4337229414	carrot cake
4337225703	brownies
4337225703	fudge
4337225703	ice cream
4337220006	other
4337217411	ice cream
4337202264	apple cobbler
4337202264	cookies
4337202264	ice cream
4337201482	apple cobbler
4337201482	brownies
4337201482	cheesecake
4337201482	cookies
4337201482	ice cream
4337195940	none
4337191550	ice cream
4337190953	apple cobbler
4337190953	blondies
4337190953	brownies
4337190953	cookies
4337190953	fudge
4337190953	ice cream
4337190953	peach cobbler
4337188006	none
4337184092	brownies
4337184092	cheesecake
4337184092	cookies
4337184092	ice cream
4337183363	none
4337168468	other
4337165710	other
4337164060	none
4337163790	cheesecake
4337162131	cheesecake
4337161591	apple cobbler
4337160605	other
4337160531	cookies
4337160291	peach cobbler
4337159183	none
4337155647	other
4337153385	other
4337153198	none
4337153195	brownies
4337153195	carrot cake
4337153195	cheesecake
4337153195	cookies
4337153195	fudge
4337153195	ice cream
4337153195	peach cobbler
4337150198	none
4337149818	carrot cake
4337147145	cookies
4337147145	other
4337145918	cookies
4337143515	brownies
4337142309	none
4337139981	none
4337139366	brownies
4337139327	other
4337139127	cheesecake
4337139127	ice cream
4337139127	peach cobbler
4337138407	none
4337137158	other
4337136775	brownies
4337136775	ice cream
4337136775	peach cobbler
4337136301	none
4337135261	apple cobbler
4337131392	none
4337127124	other
4337120626	brownies
4337120626	carrot cake
4337120626	cheesecake
4337120626	cookies
4337117868	cheesecake
4337117491	other
4337117150	ice cream
4337114976	ice cream
4337114697	cheesecake
4337114484	ice cream
4337114484	peach cobbler
4337113072	none
4337112360	none
4337111695	ice cream
4337110217	other
4337109688	none
4337108113	cookies
4337107692	none
4337107492	ice cream
4337107135	other
4337106266	carrot cake
4337106266	ice cream
4337100681	none
4337100638	ice cream
4337098925	none
4337097777	none
4337096669	blondies
4337094254	ice cream
4337094254	other
4337091880	none
4337089256	apple cobbler
4337089256	cookies
4337089256	ice cream
4337089256	peach cobbler
4337087412	ice cream
4337087325	none
4337086635	other
4337084799	cheesecake
4337084799	cookies
4337083360	none
4337083128	ice cream
4337078951	cookies
4337078951	ice cream
4337078449	none
4337075743	none
4337074360	other
4337074187	none
4337073874	none
4337071166	cookies
4337071166	ice cream
4337070275	carrot cake
4337069914	none
4337068413	none
4337064141	none
4337063427	peach cobbler
4337061732	ice cream
4337061177	cheesecake
4337058651	other
4337056155	other
4337053889	none
4337053842	none
4337053465	apple cobbler
4337053135	other
4337050973	none
4337050187	cookies
4337050187	ice cream
4337049485	none
4337044640	ice cream
4337044628	other
4337044348	other
4337043853	brownies
4337043853	cookies
4337043853	fudge
4337043565	ice cream
4337040587	apple cobbler
4337040587	brownies
4337040587	cookies
4337040405	peach cobbler
4337032039	peach cobbler
4337032009	none
4337031019	cookies
4337031019	ice cream
4337029500	cookies
4337029500	other
4337027180	none
4337025357	none
4337024057	none
4337023697	ice cream
4337022132	ice cream
4337021828	none
4337021725	other
4337019638	apple cobbler
4337019638	blondies
4337019638	brownies
4337019638	carrot cake
4337019638	cheesecake
4337019638	cookies
4337019638	ice cream
4337019287	none
4337019220	ice cream
4337019080	none
4337013286	none
4337008702	cookies
4337008598	peach cobbler
4337008258	none
4337006937	none
4337004476	ice cream
4337002367	cookies
4337002367	ice cream
4337002367	other
4337002262	apple cobbler
4337002262	peach cobbler
4336999913	brownies
4336999913	cookies
4336998647	cookies
4336998552	apple cobbler
4336998552	cookies
4336997445	other
4336997200	brownies
4336997200	cheesecake
4336997200	ice cream
4336996479	cookies
4336995888	peach cobbler
4336995004	none
4336994435	apple cobbler
4336994435	ice cream
4336994408	none
4336993856	brownies
4336993856	ice cream
4336993552	cheesecake
4336993552	ice cream
4336993552	peach cobbler
4336993307	ice cream
4336993268	brownies
4336993268	ice cream
4336989544	cheesecake
4336989544	peach cobbler
4336988874	none
4336986755	none
4336986628	ice cream
4336985910	ice cream
4336985361	none
4336984164	ice cream
4336983931	cheesecake
4336983931	cookies
4336983931	ice cream
4336983885	cheesecake
4336983885	other
4336983016	apple cobbler
4336983016	blondies
4336983016	brownies
4336983016	carrot cake
4336983016	cheesecake
4336983016	cookies
4336983016	fudge
4336983016	ice cream
4336983016	peach cobbler
4336982929	ice cream
4336982760	none
4336978225	ice cream
4336977349	none
4336977032	none
4336975251	apple cobbler
4336975251	brownies
4336975251	carrot cake
4336975251	cheesecake
4336975010	other
4336973830	none
4336972729	other
4336972039	none
4336971897	ice cream
4336971897	other
4336970208	none
4336969969	none
4336967374	apple cobbler
4336967374	brownies
4336967374	cookies
4336967374	peach cobbler
4336965632	none
4336965464	cheesecake
4336965464	ice cream
4336964971	none
4336963992	ice cream
4336963314	carrot cake
4336963112	other
4336962719	ice cream
4336962641	cheesecake
4336962476	ice cream
4336961100	ice cream
4336961030	ice cream
4336961030	other
4336959845	cookies
4336957549	none
4336957375	cheesecake
4336957375	cookies
4336957375	other
4336956397	fudge
4336955887	none
4336953375	brownies
4336952446	cheesecake
4336952446	cookies
4336952446	ice cream
4336950642	cookies
4336950642	fudge
4336950342	ice cream
4336949841	none
4336949659	brownies
4336949659	cheesecake
4336949659	cookies
4336949659	ice cream
4336949659	other
4336949331	brownies
4336945764	brownies
4336945764	peach cobbler
4336945764	other
4336945012	apple cobbler
4336944934	none
4336941325	carrot cake
4336940774	ice cream
4336940486	brownies
4336940486	cookies
4336937701	apple cobbler
4336935604	ice cream
4336934948	apple cobbler
4336934948	cheesecake
4336934120	none
4336933938	none
4336932386	none
4336932195	none
4336931306	other
4336929784	carrot cake
4336929784	other
4336928175	other
4336928076	apple cobbler
4336928076	brownies
4336928076	cheesecake
4336928076	cookies
4336928076	ice cream
4336928076	peach cobbler
4336927723	none
4336925780	cookies
4336925780	peach cobbler
4336925485	none
4336923533	none
4336923177	apple cobbler
4336923177	cheesecake
4336923177	peach cobbler
4336922793	ice cream
4336922086	cheesecake
4336922086	ice cream
4336921564	brownies
4336921564	cookies
4336919993	none
4336917509	none
4336917274	apple cobbler
4336917274	peach cobbler
4336917270	apple cobbler
4336917270	carrot cake
4336917270	cheesecake
4336917270	peach cobbler
4336916047	other
4336915660	none
4336915137	brownies
4336915137	cheesecake
4336915137	cookies
4336915137	fudge
4336915137	ice cream
4336915137	peach cobbler
4336909691	none
4336908416	brownies
4336908416	cheesecake
4336908416	ice cream
4336908351	none
4336907249	apple cobbler
4336905433	none
4336905258	brownies
4336905258	cheesecake
4336905258	ice cream
4336905103	none
4336902332	cookies
4336901843	cheesecake
4336901444	cheesecake
4336901444	other
4336901246	cheesecake
4336901039	brownies
4336901039	cheesecake
4336901039	cookies
4336900009	none
4336898888	ice cream
4336898281	none
4336897370	ice cream
4336897268	none
4336896050	blondies
4336896050	carrot cake
4336894987	none
4336894811	none
4336894719	cookies
4336894719	ice cream
4336894663	none
4336893852	none
4336892910	none
4336892388	none
4336891075	none
4336890666	none
4336888973	none
4336888425	blondies
4336888425	brownies
4336888425	carrot cake
4336888425	cheesecake
4336888425	cookies
4336888425	ice cream
4336887954	brownies
4336887954	carrot cake
4336887954	cheesecake
4336887954	cookies
4336887954	ice cream
4336887917	apple cobbler
4336887917	cookies
4336887917	fudge
4336887807	cookies
4336885748	none
4336885693	cheesecake
4336884042	cheesecake
4336884019	none
4336883054	none
4336882230	none
4336881221	brownies
4336881221	cookies
4336881198	apple cobbler
4336881198	brownies
4336881198	cheesecake
4336881198	cookies
4336880828	brownies
4336880828	carrot cake
4336880828	cheesecake
4336879968	cheesecake
4336879968	peach cobbler
4336879592	apple cobbler
4336879592	ice cream
4336879592	peach cobbler
4336879579	brownies
4336879579	cookies
4336879579	ice cream
4336879316	ice cream
4336878978	apple cobbler
4336878978	cheesecake
4336878978	ice cream
4336878978	other
4336878183	none
4336876798	brownies
4336876798	other
4336876529	none
4336876457	none
4336876402	cheesecake
4336876402	cookies
4336876402	fudge
4336875194	none
4336874555	cheesecake
4336874265	ice cream
4336871606	none
4336871204	apple cobbler
4336871204	cheesecake
4336871204	peach cobbler
4336870813	brownies
4336870813	cheesecake
4336870813	cookies
4336870370	none
4336870006	apple cobbler
4336870006	cheesecake
4336870006	cookies
4336870006	peach cobbler
4336869926	brownies
4336869926	cookies
4336869926	ice cream
4336869926	peach cobbler
4336868990	cookies
4336867812	apple cobbler
4336867812	brownies
4336867812	cookies
4336867812	fudge
4336867812	ice cream
4336867812	peach cobbler
4336867797	apple cobbler
4336867797	none
4336867715	other
4336866361	brownies
4336866361	ice cream
4336863649	cheesecake
4336863649	cookies
4336861802	ice cream
4336861435	none
4336860680	ice cream
4336860680	other
4336860498	apple cobbler
4336860029	none
4336857693	fudge
4336857530	cheesecake
4336857362	other
4336856298	cheesecake
4336855177	none
4336853880	brownies
4336851292	brownies
4336851292	cookies
4336851292	ice cream
4336851260	cheesecake
4336848038	ice cream
4336847523	carrot cake
4336847523	fudge
4336844557	cheesecake
4336844557	other
4336843665	none
4336841567	other
4336841484	fudge
4336840954	carrot cake
4336840954	cheesecake
4336840954	cookies
4336840954	peach cobbler
4336840612	ice cream
4336840612	other
4336839687	apple cobbler
4336838632	ice cream
4336838630	brownies
4336838630	carrot cake
4336838630	cookies
4336838317	cheesecake
4336838317	ice cream
4336837943	other
4336837306	cookies
4336837306	ice cream
4336836328	other
4336836078	cookies
4336835004	brownies
4336835004	cheesecake
4336834730	brownies
4336834730	carrot cake
4336834730	cookies
4336834473	ice cream
4336833478	none
4336832951	carrot cake
4336832951	ice cream
4336832129	apple cobbler
4336832129	cookies
4336832129	ice cream
4336830596	other
4336829875	none
4336829721	ice cream
4336829185	other
4336828331	cheesecake
4336827783	cookies
4336827663	brownies
4336827663	cheesecake
4336827663	cookies
4336827663	ice cream
4336826560	cookies
4336826560	ice cream
4336825506	none
4336825281	brownies
4336825281	carrot cake
4336825281	cheesecake
4336825000	carrot cake
4336825000	cheesecake
4336825000	ice cream
4336823441	none
4336823172	none
4336822252	cookies
4336821807	none
4336821332	ice cream
4336819191	brownies
4336819191	cheesecake
4336819191	cookies
4336819043	other
4336816440	other
4336815648	carrot cake
4336815648	cheesecake
4336815648	cookies
4336815463	ice cream
4336815399	none
4336814310	ice cream
4336813874	other
4336812402	brownies
4336812402	cheesecake
4336811982	none
4336811877	brownies
4336811877	cheesecake
4336811877	cookies
4336811877	fudge
4336811877	ice cream
4336811565	ice cream
4336811492	apple cobbler
4336810566	other
4336809276	other
4336809111	carrot cake
4336809111	ice cream
4336808397	ice cream
4336808238	ice cream
4336808019	cookies
4336808019	ice cream
4336807635	ice cream
4336806751	brownies
4336804174	cheesecake
4336804003	cheesecake
4336804003	cookies
4336802942	cheesecake
4336802030	cheesecake
4336801887	ice cream
4336801887	other
4336800334	none
4336800274	other
4336799773	cheesecake
4336799337	none
4336799126	none
4336799058	brownies
4336799058	cookies
4336799058	ice cream
4336797746	carrot cake
4336797746	cookies
4336797746	fudge
4336795509	none
4336794143	peach cobbler
4336794044	brownies
4336794044	cheesecake
4336794044	cookies
4336793943	apple cobbler
4336793943	cookies
4336793870	none
4336792331	none
4336792302	none
4336790523	ice cream
4336789188	other
4336788022	none
4336787017	other
4336785978	other
4336785048	none
4336784825	cheesecake
4336783082	none
4336780483	none
4336779288	carrot cake
4336779288	cheesecake
4336776734	none
4336775444	cheesecake
4336775444	cookies
4336775444	ice cream
4336775416	none
4336774641	other
4336772456	blondies
4336772456	carrot cake
4336772456	cheesecake
4336772456	peach cobbler
4336772452	cookies
4336771206	none
4336770959	other
4336768956	none
4336768662	cheesecake
4336768662	ice cream
4336768149	none
4336767119	cookies
4336766876	ice cream
4336766876	peach cobbler
4336764121	none
4336764087	none
4336763694	cookies
4336763416	none
4336763302	apple cobbler
4336763302	brownies
4336763302	cheesecake
4336763302	peach cobbler
4336762600	cookies
4336762458	cheesecake
4336762096	cookies
4336762096	ice cream
4336761799	cheesecake
4336761799	cookies
4336761799	ice cream
4336761290	apple cobbler
4336761290	brownies
4336761290	carrot cake
4336761290	cheesecake
4336761290	ice cream
4336760341	brownies
4336760341	ice cream
4336760110	apple cobbler
4336759353	ice cream
4336758840	cookies
4336758840	ice cream
4336756589	apple cobbler
4336756589	ice cream
4336756075	cookies
4336754872	apple cobbler
4336754457	none
4336754179	ice cream
4336752791	ice cream
4336752314	carrot cake
4336752112	none
4336749249	other
4336748097	apple cobbler
4336748097	brownies
4336748097	carrot cake
4336748097	cookies
4336747306	cheesecake
4336746217	none
4336746110	carrot cake
4336746002	cheesecake
4336745373	apple cobbler
4336745373	carrot cake
4336745373	cheesecake
4336744632	cookies
4336743563	ice cream
4336738591	none
4336738214	cheesecake
4336738214	ice cream
4336738214	peach cobbler
4336736562	cheesecake
4336733948	none
4336731531	ice cream
4336728581	cheesecake
4336728147	none
4336727141	cheesecake
4336726910	none
4336726144	none
4336725284	carrot cake
4336722668	none
4336722051	cheesecake
4336721418	cookies
4336721418	ice cream
4336719997	brownies
4336719997	carrot cake
4336719997	cheesecake
4336719997	cookies
4336719997	ice cream
4336719266	ice cream
4336719266	other
4336717891	apple cobbler
4336717466	apple cobbler
4336717454	none
4336714289	none
4336714072	brownies
4336714072	other
4336713367	cookies
4336713367	ice cream
4336711671	apple cobbler
4336711671	brownies
4336711671	cheesecake
4336711671	cookies
4336711671	ice cream
4336707912	other
4336706821	cheesecake
4336702108	none
4336702007	cookies
4336702007	ice cream
4336701807	ice cream
4336701591	cheesecake
4336700179	carrot cake
4336700179	cheesecake
4336700179	ice cream
4336700179	peach cobbler
4336699442	none
4336699080	apple cobbler
4336699080	ice cream
4336698057	none
4336697274	none
4336696561	cookies
4336692873	ice cream
4336692199	none
4336690603	ice cream
4336690603	other
4336689196	none
4336688947	brownies
4336688947	carrot cake
4336681909	ice cream
4336681398	none
4336679323	none
4336678787	ice cream
4336678787	none
4336675538	ice cream
4336674655	cookies
4336674655	ice cream
4336671419	cheesecake
4336671419	peach cobbler
4336670313	none
4336670027	none
4336665828	none
4336665636	apple cobbler
4336665636	ice cream
4336665537	peach cobbler
4336665417	none
4336662967	peach cobbler
4336660983	none
4336660839	none
4336657464	cheesecake
4336657464	cookies
4336654576	none
4336653814	cheesecake
4336651539	cookies
4336646584	ice cream
4336644693	cheesecake
4336644693	peach cobbler
4336643754	cheesecake
4336643722	cookies
4336643107	other
4336640736	none
4336640541	cheesecake
4336639517	cheesecake
4336639517	other
4336638494	none
4336637202	other
4336636152	cookies
4336636152	ice cream
4336634372	cookies
4336626273	none
4336625061	none
4336623766	none
4336620413	brownies
4336620413	cookies
4336620413	ice cream
4336618877	none
4336618002	ice cream
4336614170	none
4336612504	brownies
4336612504	cookies
4336611982	none
4336611199	brownies
4336611199	cookies
4336603089	cookies
4336603089	peach cobbler
4336602707	apple cobbler
4336602707	cheesecake
4336602707	peach cobbler
4336601397	none
4336596402	none
4336594873	other
4336594744	cookies
4336594299	none
4336593880	cookies
4336593880	ice cream
4336592653	ice cream
4336586686	fudge
4336586686	peach cobbler
4336581703	none
4336580777	cookies
4336574897	apple cobbler
4336574897	fudge
4336574897	ice cream
4336574336	cheesecake
4336574336	ice cream
4336574124	none
4336570007	none
4336559810	none
4336557451	apple cobbler
4336557451	brownies
4336557451	carrot cake
4336557451	cookies
4336557451	fudge
4336557451	ice cream
4336554350	none
4336549169	cheesecake
4336548962	brownies
4336548962	peach cobbler
4336547916	none
4336547275	apple cobbler
4336547275	carrot cake
4336547275	cheesecake
4336547275	cookies
4336547275	ice cream
4336546028	cheesecake
4336544071	peach cobbler
4336544071	other
4336543220	ice cream
4336541332	none
4336540513	none
4336535098	other
4336533400	none
4336527571	none
4336527545	apple cobbler
4336527545	peach cobbler
4336524165	none
4336522973	none
4336520950	none
4336518573	cheesecake
4336518573	peach cobbler
4336516793	brownies
4336516793	cookies
4336516793	ice cream
4336512650	other
4336510658	other
4336509936	none
4336505029	other
4336500591	none
4336498949	none
4336497964	cheesecake
4336497964	cookies
4336497833	ice cream
4336496891	ice cream
4336495665	apple cobbler
4336490883	brownies
4336490883	cookies
4336490883	ice cream
4336490784	brownies
4336490784	cheesecake
4336490784	ice cream
4336490014	other
4336487804	none
4336486285	other
4336480011	none
4336479126	none
4336478617	none
4336477366	apple cobbler
4336477366	cheesecake
4336477366	peach cobbler
4336471362	none
4336471066	brownies
4336467288	none
4336465723	other
4336465404	none
4336465104	brownies
4336465104	cheesecake
4336465104	cookies
4336464178	apple cobbler
4336464178	cookies
4336464178	ice cream
4336464178	peach cobbler
4336463294	apple cobbler
4336463294	carrot cake
4336463294	peach cobbler
4336460536	apple cobbler
4336460536	brownies
4336460536	carrot cake
4336460536	cheesecake
4336460536	cookies
4336460536	ice cream
4336460536	peach cobbler
4336459298	none
4336457715	apple cobbler
4336452468	none
4336449973	none
4336448779	other
4336442018	apple cobbler
4336442018	cheesecake
4336442018	cookies
4336442018	ice cream
4336442018	peach cobbler
4336433694	brownies
4336433694	carrot cake
4336433694	cheesecake
4336433694	cookies
4336433694	ice cream
4336426326	none
4336426077	brownies
4336426077	cookies
4336426077	peach cobbler
4336422509	other
4336420032	none
4336414511	none
4336405712	blondies
4336405712	cheesecake
4336405712	peach cobbler
4336403950	none
4336403233	brownies
4336403233	cookies
4336403233	ice cream
4336400854	ice cream
4336391382	peach cobbler
4336387798	other
4336381595	cheesecake
4336381595	fudge
4336381595	ice cream
4336379876	none
4336376803	cookies
4336376803	ice cream
4336376443	other
4336371555	other
4336368343	cookies
4336368281	cheesecake
4336366345	cheesecake
4336365763	ice cream
4336351539	brownies
4336351539	cookies
4336351539	ice cream
4336351224	cookies
4336351224	peach cobbler
4336348590	carrot cake
4336346355	ice cream
4336337183	none
4336336129	cookies
4336333982	cheesecake
4336326250	none
4336324874	none
4336322606	apple cobbler
4336322606	brownies
4336322606	cheesecake
4336322606	cookies
4336322606	ice cream
4336322606	peach cobbler
4336321558	cheesecake
4336317891	none
4336313453	cheesecake
4336313453	peach cobbler
4336313021	none
4336312523	cheesecake
4336306664	other
4336302631	ice cream
4336301847	none
4336299882	brownies
4336299882	cookies
4336299882	fudge
4336299882	peach cobbler
4336298829	ice cream
4336288339	none
4336288217	cookies
4336276238	carrot cake
4336276238	cheesecake
4336276238	ice cream
4336271469	other
4336258240	cookies
4336258240	ice cream
4336255036	apple cobbler
4336255036	ice cream
4336255036	peach cobbler
4336249082	brownies
4336249082	cookies
4336249082	fudge
4336249082	ice cream
4336249082	other
4336248435	carrot cake
4336248435	ice cream
4336238126	cookies
4336238126	ice cream
4336235428	ice cream
4336232691	none
4336231459	none
4336227131	other
4336224500	cheesecake
4336224500	ice cream
4336221484	none
4336215705	none
4336208942	apple cobbler
4336208942	brownies
4336208942	carrot cake
4336208942	cookies
4336203800	cheesecake
4336199133	cheesecake
4336199133	ice cream
4336199133	peach cobbler
4336194345	none
4336189898	brownies
4336189898	cookies
4336189473	ice cream
4336185735	cheesecake
4336185735	cookies
4336185735	ice cream
4336181226	other
4336176902	other
4336175740	ice cream
4336175699	none
4336175345	ice cream
4336168292	apple cobbler
4336168292	cookies
4336168292	ice cream
4336164056	none
4336163908	none
4336161556	ice cream
4336146440	ice cream
4336144357	other
4336142896	other
4336137995	cheesecake
4336137995	ice cream
4336137435	cheesecake
4336137098	brownies
4336137098	cookies
4336137098	other
4336134461	apple cobbler
4336134461	brownies
4336134461	carrot cake
4336134461	cheesecake
4336134461	cookies
4336134461	fudge
4336134461	peach cobbler
4336133522	ice cream
4336133454	other
4336131533	apple cobbler
4336131533	brownies
4336131533	cookies
4336131319	carrot cake
4336131319	cheesecake
4336131319	cookies
4336131319	peach cobbler
4336126090	ice cream
4336125524	other
4336121663	other
4336120894	brownies
4336120894	fudge
4336119647	ice cream
4336117281	ice cream
4336117179	brownies
4336117179	cookies
4336111339	cheesecake
4336111339	other
4336108209	blondies
4336108209	carrot cake
4336108209	fudge
4336108209	ice cream
4336106089	none
4336106041	peach cobbler
4336106041	other
4336104179	ice cream
4336103434	cookies
4336103434	ice cream
4336103319	none
4336101470	cheesecake
4336099044	none
4336098809	ice cream
4336093974	cheesecake
4336092370	apple cobbler
4336091474	carrot cake
4336090652	apple cobbler
4336090652	brownies
4336090652	carrot cake
4336090652	cheesecake
4336090652	cookies
4336090652	fudge
4336090652	ice cream
4336090652	peach cobbler
4336090647	none
4336090552	peach cobbler
4336086559	none
4336085504	ice cream
4336085020	cookies
4336083561	brownies
4336083443	ice cream
4336081481	ice cream
4336080517	cheesecake
4336078959	brownies
4336078481	ice cream
4336076367	other
4336076365	apple cobbler
4336076365	blondies
4336076365	cheesecake
4336076365	fudge
4336076323	other
4336074858	cookies
4336074858	ice cream
4336074858	other
4336073613	ice cream
4336073270	ice cream
4336070791	apple cobbler
4336068292	none
4336066162	brownies
4336065006	apple cobbler
4336065006	cheesecake
4336062672	other
4336058499	none
4336057426	none
4336056145	cookies
4336056145	peach cobbler
4336048135	cheesecake
4336048135	ice cream
4336048135	peach cobbler
4336047575	none
4336047405	fudge
4336047405	other
4336041912	none
4336040902	cheesecake
4336040679	none
4336040464	none
4336038370	none
4336037944	ice cream
4336037337	none
4336037337	other
4336036960	other
4336034694	none
4336033443	none
4336030046	cookies
4336030046	ice cream
4336029825	peach cobbler
4336027932	brownies
4336027932	cookies
4336027932	ice cream
4336023531	none
4336022983	ice cream
4336022372	cheesecake
4336022096	cookies
4336022096	ice cream
4336021883	ice cream
4336021180	none
4336018601	none
4336017089	cheesecake
4336017089	ice cream
4336016535	apple cobbler
4336016535	brownies
4336016535	cheesecake
4336016535	cookies
4336016535	fudge
4336016535	peach cobbler
4336015865	ice cream
4336015017	ice cream
4336014587	cheesecake
4336014587	cookies
4336014104	none
4336012118	none
4336012003	cheesecake
4336011166	none
4336006784	ice cream
4336005220	none
4336002999	apple cobbler
4336002487	apple cobbler
4336002487	cheesecake
4336002487	ice cream
4336001840	ice cream
4336001546	cheesecake
4335999720	none
4335998934	other
4335996765	apple cobbler
4335996765	brownies
4335996765	peach cobbler
4335996482	cheesecake
4335992962	ice cream
4335992962	peach cobbler
4335992074	none
4335990669	ice cream
4335990002	none
4335989591	apple cobbler
4335988879	peach cobbler
4335988879	none
4335988400	none
4335988391	none
4335988189	other
4335987976	other
4335987642	other
4335987129	ice cream
4335986817	cheesecake
4335986817	cookies
4335985936	apple cobbler
4335983992	none
4335983559	none
4335982114	none
4335981269	cheesecake
4335981269	ice cream
4335981057	brownies
4335981057	cheesecake
4335981057	cookies
4335981057	fudge
4335981057	ice cream
4335979596	brownies
4335979596	cheesecake
4335979419	none
4335978870	apple cobbler
4335978870	carrot cake
4335978870	cheesecake
4335977956	blondies
4335977956	brownies
4335977956	cheesecake
4335977956	cookies
4335977956	other
4335977899	apple cobbler
4335977899	brownies
4335977899	cookies
4335977899	fudge
4335977899	peach cobbler
4335977124	peach cobbler
4335976340	fudge
4335975961	none
4335974428	brownies
4335974363	none
4335973959	other
4335973714	none
4335972801	none
4335971349	ice cream
4335970729	brownies
4335970729	peach cobbler
4335970072	none
4335969513	apple cobbler
4335969513	cheesecake
4335969513	ice cream
4335967669	none
4335967013	none
4335966421	none
4335966121	brownies
4335966121	cheesecake
4335966121	fudge
4335966121	ice cream
4335966121	peach cobbler
4335965739	none
4335965542	other
4335964313	carrot cake
4335963222	none
4335962733	cookies
4335962733	ice cream
4335962733	peach cobbler
4335961782	cheesecake
4335961782	ice cream
4335961440	other
4335960288	ice cream
4335960288	other
4335960105	ice cream
4335959876	cookies
4335959876	other
4335959857	fudge
4335958653	carrot cake
4335958653	cheesecake
4335958292	cookies
4335958292	ice cream
4335958005	apple cobbler
4335958005	cheesecake
4335957772	brownies
4335957772	cookies
4335957772	ice cream
4335957365	apple cobbler
4335957365	ice cream
4335957365	peach cobbler
4335957179	none
4335957096	none
4335957072	none
4335955478	other
4335955206	apple cobbler
4335955152	apple cobbler
4335955152	cheesecake
4335955152	cookies
4335955152	peach cobbler
4335954681	other
4335954394	fudge
4335954376	ice cream
4335954207	ice cream
4335954131	ice cream
4335954131	peach cobbler
4335953888	apple cobbler
4335953888	blondies
4335953888	cheesecake
4335953888	cookies
4335952833	cheesecake
4335951505	peach cobbler
4335951437	none
4335951082	brownies
4335951082	cookies
4335951082	ice cream
4335950917	apple cobbler
4335950917	carrot cake
4335950654	cheesecake
4335950654	ice cream
4335949486	brownies
4335949486	ice cream
4335949169	none
4335949112	none
4335947496	cheesecake
4335947496	ice cream
4335947496	peach cobbler
4335945415	brownies
4335944854	other
4335944082	cheesecake
4335943173	brownies
4335943173	cookies
4335943060	cheesecake
4335934708	cookies
4335894916	brownies
\.


--
-- Data for Name: dessert_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dessert_other (id, dessert_other) FROM stdin;
4337951949	jelly roll, sweet cheeseball, chocolate dipped berries
4337893416	pie
4337779071	sparkling apple cider
4337655425	pumpkin pie
4337627331	pies
4337611941	lefse
4337583245	eclair
4337569645	as above
4337568074	pie is dessert
4337490067	chocolate mousse
4337347655	pie
4337318895	pine nut cake 
4337310361	pumpkin pie.
4337249904	pie, pumpkin
4337247953	we stick to pie
4337220006	choc. cake
4337168468	pumpkin pie
4337165710	pie
4337160605	pies and dream whip
4337155647	pumpkin pie
4337153385	lefse or krumkakke
4337147145	pie
4337139327	pumpkin bars
4337137158	banana pudding
4337127124	pumpkin roll
4337117491	chocolate cake
4337110217	the pie you just asked about. 
4337107135	pies: pumpkin with cie cream vanilla, apple, pecan
4337094254	with pie listed above
4337086635	cheesecake.
4337074360	restaurant with various choices.
4337058651	pumpkin pie. why ask this twice?
4337056155	pie
4337053135	chocolate cake with marshmellows, caremal cake
4337044628	triple treat (butterscotch, cream cheese mix, and nut crust
4337044348	just pie
4337029500	pumpkin roll 
4337021725	pumpkin and pecan pies
4337002367	pies
4336997445	pecan pie
4336983885	flan
4336975010	pies
4336972729	pies selected in previous question (apple, pumpkin)
4336971897	pie
4336963112	pumpkin roll
4336961030	pumpkin log
4336957375	berry cobbler
4336949659	whipped cream
4336945764	chocolate cake
4336931306	pistachio ambrosia salad
4336929784	choc cake
4336928175	pie
4336916047	banana bread
4336901444	german chocolate cake
4336878978	ethnic desserts
4336876798	pie-spple & pecan
4336867715	pies
4336860680	pumpkin pie
4336857362	pies
4336844557	german chocolate cake
4336841567	chocolate oreo pudding cake
4336840612	pies
4336837943	pumpkin pie
4336836328	pumpkin pie, of course
4336830596	pie
4336829185	see above
4336819043	chocolate cake or coconut cake
4336816440	pie
4336813874	pumpkin pie
4336810566	pie
4336809276	pie
4336801887	whipped cream for pie
4336800274	pie
4336789188	a variety of pies
4336787017	watergate salad
4336785978	pumpkin
4336774641	just pie
4336770959	cake
4336749249	pies
4336719266	whipped cream for the pies
4336714072	blueberry cream cheese cake
4336707912	lemon pound, sour cream pound, rum cake
4336690603	pie
4336643107	pie only
4336639517	pound cake
4336637202	pie
4336594873	banana pudding
4336544071	cake (not carrot)
4336535098	pecan and pumpkin pie
4336512650	pies
4336510658	pies will do
4336505029	pie
4336490014	pumpkin pie
4336486285	pie
4336465723	pumpkin pie
4336448779	varies
4336422509	pies as noted above
4336387798	pie
4336376443	cake
4336371555	pies above
4336306664	banana pudding 
4336271469	sometimes other things too
4336249082	other bars
4336227131	pie
4336181226	i don't know
4336176902	pie
4336144357	pies....look at #8 answer!
4336142896	pumpkin chiffon pie
4336137098	date balls
4336133454	chocolate cake
4336125524	homemade pumpkin pie  and pecan pie
4336121663	pumpkin pie
4336111339	bread pudding
4336106041	pound cake
4336076367	fruit salad
4336076323	pies
4336074858	flan
4336062672	pies
4336047405	chocolate cake
4336037337	pie is the dessert
4336036960	lemon cake
4335998934	pie
4335988189	pie
4335987976	pie
4335987642	green cake
4335977956	chocolate trifle, bread pudding 
4335973959	pumpkin and pecan pie
4335965542	some sort of chocolate dessert
4335961440	pie
4335960288	usually plus another non-pie desert
4335959876	pumpkin pie
4335955478	pie
4335954681	jam cake
4335944854	pie
\.


--
-- Data for Name: main_dish_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_dish_other (id, main_dish_other) FROM stdin;
4337899817	Turkey and Ham
4337778119	Varies
4337772882	some kind of lentil or vegetable stew
4337600726	Prime Rib
4337583245	fish
4337395533	A wild game bird which changes every year.
4337380720	Prime Rib
4337188006	always different
4337074360	Restaurant with various choices.
4337064141	gumbo
4337044628	alternate turkey & ham
4337032009	Turkey and Ham
4336921564	seafood
4336871204	Chicken Dressing
4336841567	Both turkey and a vegetarian nut loaf
4336829721	This year we are having baked lasagna, diff every year
4336827783	Steak
4336819043	seafood
4336789188	It varies, ham or turkey or boston butt
4336752112	No predictable main dish
4336714072	Venison
4336541332	turkey, ham. vegetarian for me.
4336524165	Homemade vegan entree
4336509936	head cheese
4336478617	Lentil Loaf
4336471362	changes every year
4336464178	Turkey and Vegetarian Turkey
4336249082	Turkey & Ham or Seafood Hotdish (a secret family recipe).
4336146440	steak
4336137098	A turkey and a ham. Always.
4336133454	prime rib
4336036960	goose
4335960288	Varies significantly by year as one group of people we tend to be with are vegetarian
4335954207	salmon
4335943060	Duck
\.


--
-- Data for Name: main_food; Type: TABLE DATA; Schema: public; Owner: -
--

COPY main_food (id, main_dish, cooked, stuffing, cranberry_sauce, gravy) FROM stdin;
4337954960	turkey	baked	bread-based	none	t
4337951949	turkey	baked	bread-based	other	t
4337935621	turkey	roasted	rice-based	homemade	t
4337933040	turkey	baked	bread-based	homemade	t
4337931983	tofurkey	baked	bread-based	canned	t
4337929779	turkey	roasted	rice-based	homemade	t
4337924420	turkey	baked	bread-based	canned	t
4337916002	turkey	baked	rice-based	homemade	t
4337914977	turkey	roasted	bread-based	canned	t
4337899817	other	baked	bread-based	other	t
4337893416	turkey	baked	bread-based	canned	f
4337888291	ham/pork	roasted	bread-based	canned	t
4337878450	turkey	baked	rice-based	homemade	t
4337878351	turkey	roasted	bread-based	homemade	t
4337857295	turkey	roasted	rice-based	canned	t
4337856362	turducken	roasted	bread-based	homemade	t
4337854106	turkey	baked	bread-based	none	t
4337844879	turkey	baked	bread-based	canned	t
4337823612	turkey	roasted	bread-based	canned	t
4337820281	turkey	baked	bread-based	homemade	t
4337813502	turkey	fried	none	homemade	t
4337793158	turkey	baked	rice-based	homemade	t
4337792130	turkey	baked	bread-based	none	t
4337790002	turkey	roasted	bread-based	homemade	t
4337783794	turkey	roasted	bread-based	canned	t
4337779071	turkey	roasted	bread-based	canned	t
4337778119	other	baked	bread-based	homemade	t
4337774090	turkey	baked	bread-based	none	t
4337772882	other	other	none	homemade	t
4337772193	turkey	baked	none	homemade	t
4337771439	tofurkey	baked	bread-based	homemade	t
4337763296	turkey	baked	bread-based	none	t
4337758789	turkey	roasted	bread-based	none	t
4337747968	turkey	i don't know	bread-based	homemade	t
4337743121	turkey	baked	bread-based	canned	t
4337732348	ham/pork	roasted	bread-based	homemade	t
4337731242	turkey	baked	bread-based	none	t
4337719588	turkey	baked	bread-based	homemade	t
4337698969	turkey	baked	bread-based	canned	t
4337698743	turkey	baked	bread-based	homemade	t
4337660047	turkey	baked	none	homemade	t
4337655425	turkey	baked	bread-based	none	t
4337653684	turkey	baked	bread-based	canned	f
4337646565	turkey	baked	bread-based	none	t
4337629524	turkey	fried	bread-based	none	t
4337627331	turkey	roasted	bread-based	homemade	t
4337626849	turkey	baked	bread-based	canned	t
4337611941	turkey	fried	bread-based	homemade	t
4337600726	other	roasted	none	none	f
4337598069	turkey	roasted	bread-based	homemade	t
4337597044	turkey	baked	bread-based	homemade	t
4337589613	turkey	baked	bread-based	canned	t
4337586061	turkey	roasted	bread-based	canned	t
4337583393	turkey	baked	bread-based	canned	t
4337583245	other	baked	none	none	t
4337582845	turkey	roasted	bread-based	homemade	t
4337577784	turkey	baked	bread-based	homemade	t
4337569645	turkey	baked	bread-based	homemade	t
4337569057	turkey	roasted	none	none	t
4337568074	turkey	roasted	bread-based	canned	t
4337553422	tofurkey	baked	bread-based	canned	f
4337550299	turkey	baked	bread-based	homemade	t
4337545841	turkey	roasted	bread-based	canned	t
4337540484	tofurkey	i don't know	bread-based	none	f
4337531521	ham/pork	baked	bread-based	none	t
4337528775	turkey	baked	bread-based	canned	t
4337512214	turkey	baked	bread-based	canned	t
4337490067	tofurkey	roasted	none	none	t
4337489617	turkey	i don't know	bread-based	none	t
4337487759	turkey	baked	bread-based	canned	t
4337484305	turkey	baked	bread-based	canned	t
4337475288	turkey	baked	bread-based	none	t
4337468268	turkey	roasted	bread-based	homemade	t
4337467677	turkey	roasted	bread-based	homemade	t
4337448181	turkey	baked	bread-based	homemade	t
4337442451	turkey	baked	bread-based	canned	t
4337441164	turkey	baked	bread-based	canned	t
4337441070	turkey	roasted	rice-based	homemade	t
4337435277	turkey	roasted	other	canned	t
4337432686	turkey	baked	bread-based	canned	t
4337429102	turkey	baked	bread-based	canned	f
4337423740	roast beef	baked	bread-based	none	t
4337421462	turkey	roasted	other	homemade	t
4337412056	ham/pork	baked	bread-based	homemade	t
4337409281	turkey	baked	bread-based	homemade	t
4337400534	turkey	roasted	bread-based	canned	t
4337395533	other	roasted	bread-based	homemade	t
4337391263	turkey	fried	bread-based	none	t
4337390930	turkey	baked	none	none	f
4337390728	turkey	baked	bread-based	homemade	t
4337386038	turkey	baked	bread-based	homemade	t
4337384089	turkey	baked	bread-based	canned	t
4337382350	turkey	baked	bread-based	none	t
4337380720	other	other	none	none	f
4337369789	turkey	baked	bread-based	canned	t
4337365738	turkey	baked	bread-based	canned	t
4337360752	turkey	roasted	none	homemade	t
4337360389	turkey	baked	bread-based	canned	t
4337356672	turkey	fried	bread-based	homemade	t
4337347655	turkey	baked	bread-based	homemade	t
4337346312	turkey	roasted	bread-based	homemade	t
4337343090	turkey	baked	bread-based	homemade	t
4337336787	turkey	baked	bread-based	canned	t
4337336262	turkey	baked	bread-based	canned	t
4337333159	turkey	baked	bread-based	none	t
4337324697	turkey	baked	bread-based	canned	t
4337323392	turkey	baked	bread-based	canned	t
4337319123	turkey	roasted	bread-based	homemade	t
4337318895	turkey	roasted	bread-based	none	t
4337311256	turkey	baked	bread-based	homemade	t
4337310361	turkey	baked	bread-based	canned	t
4337309060	turkey	roasted	bread-based	none	t
4337296029	ham/pork	baked	bread-based	none	t
4337292895	turkey	roasted	bread-based	canned	t
4337288630	turkey	roasted	bread-based	homemade	t
4337287733	turkey	roasted	bread-based	canned	t
4337284552	turkey	baked	bread-based	canned	t
4337275528	turkey	baked	none	none	t
4337262725	turkey	baked	bread-based	canned	t
4337256857	turkey	roasted	bread-based	none	t
4337249904	turkey	roasted	rice-based	homemade	t
4337247953	turkey	roasted	bread-based	canned	t
4337235972	turkey	baked	bread-based	canned	t
4337235398	turkey	roasted	bread-based	canned	t
4337229414	turkey	roasted	bread-based	homemade	t
4337225703	turkey	fried	bread-based	homemade	t
4337220006	turkey	baked	bread-based	canned	t
4337217411	turkey	baked	bread-based	canned	t
4337202264	turkey	roasted	bread-based	none	t
4337201482	turkey	roasted	bread-based	canned	t
4337195940	turkey	roasted	bread-based	canned	t
4337191550	tofurkey	baked	bread-based	canned	t
4337190953	turkey	baked	rice-based	none	t
4337188006	other	other	none	none	f
4337184092	turkey	baked	bread-based	none	t
4337183363	turkey	roasted	bread-based	canned	t
4337168468	turkey	roasted	bread-based	homemade	t
4337165710	turkey	baked	bread-based	canned	t
4337164060	turkey	baked	bread-based	other	t
4337163790	turkey	baked	bread-based	canned	t
4337162131	turkey	roasted	bread-based	canned	t
4337161591	turkey	roasted	bread-based	canned	t
4337160605	turkey	baked	bread-based	canned	t
4337160531	turkey	roasted	bread-based	canned	t
4337160291	turkey	baked	bread-based	none	t
4337159183	turkey	baked	bread-based	canned	t
4337155647	turkey	roasted	bread-based	canned	t
4337153385	turkey	roasted	bread-based	canned	t
4337153198	turkey	roasted	bread-based	none	t
4337153195	turkey	fried	bread-based	homemade	t
4337150198	turkey	roasted	bread-based	canned	t
4337149818	turkey	baked	bread-based	canned	t
4337147145	turkey	roasted	bread-based	canned	t
4337145918	turkey	roasted	bread-based	canned	t
4337143515	turkey	roasted	bread-based	homemade	t
4337142309	turkey	roasted	bread-based	homemade	t
4337139981	turkey	roasted	bread-based	canned	t
4337139366	turkey	baked	bread-based	homemade	t
4337139327	tofurkey	baked	bread-based	homemade	t
4337139127	turkey	baked	bread-based	homemade	t
4337138407	turkey	roasted	bread-based	homemade	t
4337137158	turkey	fried	bread-based	homemade	t
4337136775	turkey	roasted	bread-based	canned	t
4337136301	turkey	fried	none	canned	f
4337135261	turkey	baked	bread-based	canned	t
4337131392	turkey	baked	bread-based	canned	t
4337127124	turkey	roasted	bread-based	homemade	t
4337120626	turkey	baked	bread-based	canned	t
4337117868	turkey	baked	bread-based	none	t
4337117491	turkey	baked	bread-based	canned	t
4337117150	turkey	roasted	bread-based	none	t
4337114976	turkey	baked	bread-based	homemade	t
4337114697	turkey	roasted	bread-based	homemade	t
4337114484	turkey	fried	bread-based	canned	t
4337113072	turkey	baked	bread-based	none	t
4337112360	turkey	roasted	other	canned	t
4337111695	turkey	roasted	bread-based	canned	t
4337110217	turkey	baked	bread-based	homemade	t
4337109688	turkey	baked	bread-based	canned	t
4337108113	turkey	fried	bread-based	none	t
4337107692	turkey	i don't know	bread-based	canned	t
4337107492	turkey	baked	bread-based	canned	t
4337107135	turkey	baked	bread-based	canned	t
4337106266	turkey	baked	rice-based	homemade	t
4337100681	turkey	baked	bread-based	homemade	t
4337100638	turkey	baked	bread-based	homemade	t
4337098925	turkey	baked	bread-based	canned	t
4337097777	turkey	roasted	bread-based	canned	t
4337096669	turkey	baked	bread-based	canned	t
4337094254	turducken	roasted	bread-based	homemade	t
4337091880	turkey	roasted	bread-based	canned	t
4337089256	turkey	baked	bread-based	canned	t
4337087412	turkey	baked	bread-based	canned	t
4337087325	turkey	roasted	bread-based	canned	t
4337086635	turkey	roasted	bread-based	canned	t
4337084799	turkey	baked	bread-based	canned	t
4337083360	turkey	roasted	bread-based	other	t
4337083128	turkey	baked	bread-based	canned	t
4337078951	tofurkey	baked	bread-based	canned	f
4337078449	turkey	roasted	bread-based	homemade	t
4337075743	turkey	roasted	bread-based	canned	t
4337074360	other	other	other	other	t
4337074187	turkey	roasted	bread-based	canned	t
4337073874	turkey	baked	bread-based	homemade	t
4337071166	turkey	roasted	bread-based	canned	t
4337070275	turkey	roasted	bread-based	homemade	t
4337069914	turkey	baked	bread-based	canned	t
4337068413	turkey	roasted	none	none	t
4337064141	other	other	none	none	f
4337063427	turkey	baked	bread-based	canned	t
4337061732	turkey	baked	bread-based	canned	t
4337061177	turkey	baked	bread-based	canned	t
4337058651	turkey	baked	none	homemade	t
4337056155	turkey	roasted	bread-based	other	t
4337053889	turkey	roasted	bread-based	homemade	t
4337053842	turkey	baked	bread-based	homemade	t
4337053465	turkey	baked	bread-based	homemade	t
4337053135	turkey	fried	bread-based	none	t
4337050973	turkey	roasted	bread-based	homemade	t
4337050187	turkey	i don't know	bread-based	canned	t
4337049485	turkey	roasted	bread-based	none	t
4337044640	turkey	roasted	bread-based	homemade	t
4337044628	other	baked	other	homemade	t
4337044348	tofurkey	other	bread-based	canned	t
4337043853	turkey	baked	bread-based	homemade	t
4337043565	turkey	fried	bread-based	canned	t
4337040587	turkey	roasted	bread-based	homemade	t
4337040405	turkey	baked	bread-based	canned	t
4337032039	ham/pork	baked	bread-based	homemade	t
4337032009	other	baked	none	other	t
4337031019	turkey	other	bread-based	canned	t
4337029500	turkey	roasted	bread-based	canned	t
4337027180	turkey	roasted	none	canned	f
4337025357	turkey	roasted	bread-based	homemade	t
4337024057	turkey	roasted	bread-based	homemade	t
4337023697	turkey	roasted	bread-based	homemade	t
4337022132	turkey	roasted	bread-based	canned	t
4337021828	turkey	baked	bread-based	canned	t
4337021725	turkey	baked	bread-based	homemade	t
4337019638	turkey	roasted	bread-based	canned	t
4337019287	turkey	other	bread-based	homemade	t
4337019220	turkey	baked	bread-based	homemade	t
4337019080	turkey	fried	bread-based	homemade	t
4337013286	turkey	roasted	bread-based	homemade	t
4337008702	turkey	roasted	bread-based	other	t
4337008598	turkey	baked	bread-based	canned	f
4337008258	turkey	roasted	bread-based	canned	t
4337006937	turkey	baked	bread-based	homemade	t
4337004476	turkey	baked	bread-based	canned	t
4337002367	turkey	roasted	bread-based	canned	t
4337002262	turkey	baked	bread-based	canned	t
4336999913	turkey	baked	bread-based	canned	t
4336998647	turkey	roasted	bread-based	canned	t
4336998552	turkey	baked	bread-based	none	t
4336997445	tofurkey	baked	bread-based	none	f
4336997200	turkey	roasted	bread-based	canned	t
4336996479	turkey	roasted	bread-based	canned	t
4336995888	turkey	roasted	bread-based	canned	t
4336995004	turkey	baked	bread-based	canned	t
4336994435	turkey	roasted	bread-based	canned	t
4336994408	turkey	roasted	bread-based	homemade	t
4336993856	turkey	baked	bread-based	canned	t
4336993552	turkey	fried	bread-based	canned	t
4336993307	turkey	baked	bread-based	canned	t
4336993268	turkey	baked	bread-based	homemade	f
4336989544	turkey	roasted	other	homemade	t
4336988874	turkey	other	bread-based	homemade	t
4336986755	turkey	other	bread-based	canned	t
4336986628	turkey	baked	bread-based	canned	t
4336985910	turkey	baked	bread-based	homemade	t
4336985361	turkey	baked	bread-based	homemade	t
4336984164	turkey	roasted	other	homemade	t
4336983931	turkey	baked	bread-based	canned	t
4336983885	turkey	baked	bread-based	canned	t
4336983528	turkey	roasted	bread-based	homemade	t
4336983016	turkey	baked	bread-based	canned	t
4336982929	turkey	baked	bread-based	canned	t
4336982760	turkey	baked	bread-based	homemade	t
4336978225	turkey	baked	bread-based	homemade	t
4336977349	turkey	roasted	bread-based	other	t
4336977032	turkey	roasted	rice-based	homemade	t
4336975251	turkey	roasted	bread-based	homemade	t
4336975010	turkey	roasted	bread-based	canned	t
4336973830	turkey	baked	bread-based	canned	t
4336973231	turkey	roasted	bread-based	homemade	t
4336972729	ham/pork	baked	bread-based	canned	t
4336972039	turkey	roasted	bread-based	canned	t
4336971897	turkey	roasted	bread-based	canned	t
4336970208	ham/pork	roasted	bread-based	canned	t
4336969969	turkey	roasted	bread-based	homemade	t
4336967374	turkey	fried	other	homemade	t
4336965632	turkey	roasted	bread-based	homemade	t
4336965464	turkey	baked	bread-based	canned	t
4336964971	turkey	baked	bread-based	homemade	t
4336963992	turkey	roasted	bread-based	canned	t
4336963314	turkey	baked	bread-based	canned	t
4336963112	turkey	baked	bread-based	none	t
4336962719	turkey	roasted	bread-based	canned	t
4336962641	turkey	baked	none	none	f
4336962476	turkey	roasted	bread-based	canned	t
4336961100	turkey	baked	bread-based	homemade	t
4336961030	turkey	other	bread-based	homemade	t
4336960240	turkey	roasted	bread-based	canned	t
4336959845	turkey	baked	bread-based	canned	t
4336957549	turkey	baked	bread-based	homemade	t
4336957375	turkey	baked	bread-based	homemade	t
4336956397	turkey	other	bread-based	none	t
4336955887	turkey	roasted	bread-based	canned	t
4336953375	turkey	baked	rice-based	homemade	t
4336952446	turkey	fried	rice-based	homemade	f
4336950642	turkey	roasted	bread-based	homemade	t
4336950342	turkey	roasted	bread-based	canned	t
4336949841	turkey	roasted	bread-based	canned	t
4336949659	turkey	baked	bread-based	other	t
4336949331	ham/pork	other	none	none	t
4336945764	ham/pork	baked	bread-based	canned	t
4336945012	turkey	baked	bread-based	canned	t
4336944934	turkey	baked	bread-based	canned	t
4336941325	turkey	baked	bread-based	canned	t
4336940774	turkey	roasted	bread-based	homemade	t
4336940486	turkey	baked	bread-based	canned	t
4336937701	turkey	roasted	bread-based	homemade	t
4336935604	turkey	baked	bread-based	homemade	t
4336934948	turkey	fried	bread-based	canned	t
4336934120	turkey	roasted	bread-based	canned	t
4336933938	turkey	baked	bread-based	canned	t
4336932386	turkey	roasted	bread-based	homemade	t
4336932195	turkey	roasted	bread-based	homemade	t
4336931306	turkey	other	other	canned	t
4336929784	turkey	baked	bread-based	canned	t
4336928175	turkey	baked	bread-based	canned	t
4336928076	turkey	baked	bread-based	canned	t
4336927723	turkey	baked	bread-based	homemade	t
4336925780	turkey	baked	bread-based	canned	t
4336925485	turkey	baked	bread-based	homemade	t
4336923533	turkey	roasted	bread-based	homemade	t
4336923177	turkey	baked	bread-based	homemade	t
4336922793	turkey	roasted	bread-based	none	t
4336922086	turkey	baked	bread-based	homemade	t
4336921564	other	fried	bread-based	canned	t
4336919993	turkey	roasted	bread-based	canned	t
4336917509	turkey	baked	bread-based	canned	t
4336917274	turkey	roasted	bread-based	homemade	t
4336917270	turkey	baked	bread-based	homemade	t
4336916047	turkey	roasted	rice-based	none	t
4336915660	turkey	roasted	bread-based	canned	t
4336915137	turkey	fried	none	canned	t
4336909691	ham/pork	baked	bread-based	canned	t
4336908416	turkey	baked	bread-based	canned	t
4336908351	turkey	baked	bread-based	canned	t
4336907249	turkey	roasted	bread-based	canned	t
4336905433	turkey	baked	bread-based	none	t
4336905258	turkey	fried	bread-based	canned	f
4336905103	turkey	fried	bread-based	canned	t
4336902332	turkey	fried	bread-based	other	t
4336901843	turkey	baked	bread-based	homemade	t
4336901444	turkey	roasted	bread-based	canned	t
4336901246	turkey	baked	bread-based	canned	t
4336901039	turkey	other	bread-based	homemade	t
4336900009	turkey	baked	bread-based	canned	t
4336898888	turkey	baked	bread-based	canned	t
4336898281	turkey	baked	bread-based	canned	t
4336897370	turkey	baked	bread-based	canned	t
4336897268	turkey	i don't know	bread-based	homemade	t
4336896050	turkey	roasted	bread-based	homemade	t
4336894987	turkey	roasted	bread-based	none	t
4336894811	turkey	roasted	bread-based	homemade	t
4336894719	tofurkey	roasted	bread-based	canned	t
4336894663	turkey	roasted	bread-based	homemade	t
4336893852	turkey	baked	bread-based	none	t
4336892910	turkey	baked	bread-based	canned	t
4336892388	chicken	other	bread-based	canned	t
4336891075	tofurkey	roasted	bread-based	homemade	t
4336890668	turkey	baked	other	canned	t
4336890666	turkey	roasted	rice-based	homemade	t
4336888973	turkey	baked	rice-based	homemade	t
4336888425	turkey	roasted	bread-based	canned	t
4336887954	turkey	roasted	bread-based	canned	t
4336887917	turkey	roasted	bread-based	canned	t
4336887807	turkey	roasted	bread-based	none	t
4336885748	turkey	roasted	bread-based	homemade	t
4336885693	turkey	roasted	bread-based	homemade	t
4336884042	turkey	baked	bread-based	none	t
4336884019	turkey	baked	bread-based	canned	t
4336883054	turkey	roasted	bread-based	canned	t
4336882230	turkey	baked	bread-based	canned	t
4336881221	turkey	roasted	bread-based	homemade	t
4336881198	turkey	roasted	bread-based	none	t
4336880828	turkey	baked	bread-based	homemade	t
4336879968	turkey	baked	bread-based	canned	t
4336879592	turkey	roasted	bread-based	none	t
4336879579	turkey	baked	bread-based	canned	t
4336879316	turkey	baked	bread-based	canned	t
4336878978	turkey	baked	bread-based	homemade	t
4336878183	turkey	roasted	bread-based	none	t
4336876798	turkey	other	bread-based	canned	t
4336876529	turkey	roasted	bread-based	canned	t
4336876457	turkey	roasted	bread-based	canned	t
4336876402	turkey	roasted	bread-based	homemade	f
4336875194	turkey	baked	bread-based	homemade	t
4336874555	turkey	roasted	other	homemade	f
4336874265	turkey	baked	bread-based	canned	t
4336871606	turkey	roasted	bread-based	homemade	t
4336871204	other	baked	bread-based	canned	t
4336870813	turkey	baked	bread-based	canned	t
4336870370	turkey	roasted	bread-based	canned	t
4336870006	turkey	roasted	bread-based	homemade	t
4336869926	turkey	baked	bread-based	canned	t
4336868990	turkey	baked	bread-based	other	t
4336867812	turkey	roasted	bread-based	homemade	t
4336867797	turkey	roasted	bread-based	none	t
4336867715	turkey	roasted	bread-based	homemade	t
4336866361	turkey	baked	bread-based	none	t
4336863649	turkey	roasted	bread-based	canned	t
4336861802	turkey	baked	bread-based	canned	t
4336861435	turkey	baked	bread-based	homemade	t
4336860680	turkey	roasted	bread-based	homemade	t
4336860498	turkey	roasted	bread-based	other	t
4336860029	chicken	roasted	rice-based	homemade	t
4336857693	ham/pork	baked	none	canned	t
4336857530	turkey	roasted	none	other	f
4336857362	turkey	roasted	bread-based	homemade	t
4336856298	turkey	other	bread-based	canned	t
4336855177	turkey	baked	bread-based	canned	t
4336853880	turkey	baked	bread-based	canned	t
4336851292	turkey	roasted	bread-based	canned	t
4336851260	turkey	roasted	bread-based	homemade	t
4336848038	turkey	roasted	bread-based	homemade	t
4336847523	turkey	roasted	rice-based	homemade	t
4336844557	turkey	baked	bread-based	canned	t
4336843665	turkey	baked	bread-based	canned	t
4336841567	other	baked	other	homemade	t
4336841484	turkey	roasted	bread-based	homemade	t
4336840954	turkey	baked	bread-based	homemade	t
4336840612	turkey	baked	bread-based	canned	t
4336839687	turkey	baked	bread-based	canned	t
4336838632	turkey	roasted	bread-based	canned	t
4336838630	turkey	other	bread-based	none	t
4336838317	turkey	baked	bread-based	canned	t
4336837943	turkey	roasted	bread-based	canned	t
4336837306	turkey	baked	bread-based	canned	t
4336836328	turkey	roasted	bread-based	canned	t
4336836078	turkey	roasted	bread-based	canned	t
4336835004	ham/pork	baked	bread-based	homemade	t
4336834730	turkey	baked	bread-based	homemade	t
4336834473	turkey	baked	rice-based	canned	t
4336833478	turkey	baked	bread-based	canned	t
4336832951	turkey	roasted	bread-based	canned	t
4336832129	chicken	roasted	bread-based	homemade	f
4336830596	turkey	roasted	bread-based	homemade	t
4336829875	turkey	baked	other	canned	t
4336829721	other	baked	none	none	f
4336829185	turkey	roasted	bread-based	homemade	t
4336828331	turkey	roasted	bread-based	canned	t
4336827783	other	other	bread-based	canned	t
4336827663	turkey	roasted	other	canned	t
4336826560	turkey	baked	bread-based	canned	t
4336825506	turkey	baked	bread-based	canned	t
4336825281	turkey	roasted	bread-based	homemade	t
4336825000	turkey	roasted	bread-based	homemade	t
4336823441	turkey	fried	bread-based	homemade	t
4336823172	turkey	roasted	bread-based	homemade	t
4336822252	turkey	baked	bread-based	none	t
4336821807	turkey	baked	bread-based	none	t
4336821332	turkey	roasted	bread-based	homemade	t
4336819191	turkey	fried	rice-based	homemade	t
4336819043	other	other	bread-based	none	f
4336816440	turkey	roasted	bread-based	canned	t
4336815648	turkey	roasted	bread-based	homemade	t
4336815463	turkey	baked	bread-based	homemade	t
4336815399	turkey	fried	bread-based	canned	t
4336814310	turkey	roasted	bread-based	homemade	t
4336813874	turkey	baked	bread-based	canned	f
4336812402	turkey	baked	bread-based	canned	t
4336811982	turkey	baked	bread-based	homemade	t
4336811877	turkey	baked	bread-based	canned	t
4336811565	turkey	roasted	bread-based	none	f
4336811492	turkey	baked	bread-based	homemade	t
4336810566	turkey	roasted	bread-based	canned	t
4336809276	turkey	roasted	bread-based	canned	t
4336809111	turkey	baked	bread-based	canned	t
4336808397	turkey	roasted	rice-based	homemade	t
4336808238	turkey	baked	bread-based	canned	t
4336808019	turkey	baked	other	canned	t
4336807635	turkey	roasted	other	other	t
4336806751	turkey	baked	bread-based	none	t
4336804174	ham/pork	baked	bread-based	canned	f
4336804003	turkey	baked	bread-based	canned	t
4336802942	turkey	baked	bread-based	canned	t
4336802030	turkey	roasted	bread-based	canned	t
4336801887	turkey	baked	bread-based	homemade	t
4336800334	turkey	roasted	bread-based	canned	t
4336800274	turkey	roasted	bread-based	homemade	t
4336799773	turkey	roasted	bread-based	canned	t
4336799337	turkey	roasted	bread-based	homemade	t
4336799126	turkey	roasted	bread-based	none	t
4336799058	turkey	roasted	bread-based	canned	t
4336797746	turkey	other	bread-based	homemade	t
4336795509	turkey	baked	bread-based	none	t
4336794143	turkey	baked	bread-based	canned	t
4336794044	turkey	baked	bread-based	homemade	t
4336793943	turkey	roasted	bread-based	none	t
4336793870	turkey	baked	bread-based	canned	t
4336792331	turkey	baked	bread-based	homemade	f
4336792302	turkey	fried	bread-based	canned	t
4336790523	turkey	other	none	homemade	f
4336789188	other	baked	bread-based	none	t
4336788022	turkey	roasted	bread-based	canned	t
4336787017	turkey	baked	bread-based	canned	t
4336785978	turkey	baked	none	none	t
4336785048	turkey	roasted	bread-based	canned	t
4336784825	turkey	roasted	bread-based	canned	t
4336783082	turkey	roasted	bread-based	canned	t
4336780483	turkey	roasted	bread-based	canned	t
4336779288	turkey	baked	rice-based	canned	t
4336776734	turkey	baked	other	canned	t
4336775444	turkey	baked	bread-based	homemade	t
4336775416	turkey	roasted	bread-based	homemade	t
4336774641	turkey	other	bread-based	canned	t
4336772456	turkey	baked	bread-based	other	t
4336772452	turkey	roasted	bread-based	canned	t
4336771206	turkey	baked	bread-based	canned	t
4336770959	ham/pork	baked	bread-based	none	t
4336768956	turkey	baked	bread-based	canned	t
4336768662	turkey	baked	bread-based	homemade	t
4336768149	turkey	baked	bread-based	canned	t
4336767119	turkey	roasted	bread-based	homemade	t
4336766876	turkey	baked	bread-based	canned	t
4336764121	turkey	roasted	bread-based	none	f
4336764087	turkey	baked	bread-based	canned	t
4336763694	turkey	baked	bread-based	canned	t
4336763416	turkey	roasted	bread-based	homemade	f
4336763302	turkey	fried	bread-based	none	t
4336762600	turkey	baked	bread-based	canned	t
4336762458	turkey	roasted	bread-based	homemade	f
4336762096	turkey	baked	bread-based	canned	t
4336761799	ham/pork	baked	none	canned	t
4336761290	turkey	other	other	canned	t
4336760341	turkey	other	bread-based	homemade	t
4336760110	tofurkey	roasted	bread-based	none	t
4336759353	turkey	baked	bread-based	canned	t
4336758840	ham/pork	baked	bread-based	none	t
4336756589	turkey	baked	bread-based	canned	t
4336756075	turkey	baked	bread-based	canned	f
4336754872	turkey	baked	bread-based	homemade	t
4336754457	turkey	roasted	bread-based	canned	t
4336754179	turkey	baked	rice-based	homemade	t
4336752791	turkey	roasted	bread-based	homemade	t
4336752314	ham/pork	baked	bread-based	none	f
4336752112	other	other	none	canned	f
4336749249	turkey	baked	bread-based	homemade	t
4336748097	turkey	baked	rice-based	canned	t
4336747306	turkey	baked	bread-based	none	t
4336746217	turkey	roasted	bread-based	canned	f
4336746110	turkey	roasted	bread-based	canned	t
4336746002	turkey	baked	bread-based	canned	t
4336745373	turkey	roasted	bread-based	canned	t
4336744632	turkey	baked	none	canned	t
4336743563	turkey	baked	bread-based	canned	t
4336738591	turducken	roasted	none	none	f
4336738214	turkey	fried	bread-based	canned	t
4336736562	tofurkey	baked	bread-based	none	t
4336733948	ham/pork	i don't know	bread-based	canned	f
4336731531	turkey	baked	bread-based	canned	t
4336728581	turkey	baked	bread-based	homemade	t
4336728147	turkey	baked	bread-based	none	t
4336727141	turkey	roasted	bread-based	canned	t
4336726910	turkey	baked	bread-based	canned	t
4336726144	turkey	roasted	bread-based	canned	t
4336725284	turkey	roasted	bread-based	none	t
4336722668	turkey	baked	bread-based	canned	t
4336722051	turkey	roasted	bread-based	canned	t
4336721418	turkey	baked	other	none	t
4336719997	turkey	baked	bread-based	none	f
4336719266	turkey	roasted	bread-based	homemade	t
4336717891	turkey	baked	bread-based	canned	t
4336717466	turkey	baked	bread-based	none	t
4336717454	turkey	roasted	bread-based	none	t
4336714289	turkey	roasted	bread-based	canned	t
4336714072	other	other	bread-based	canned	t
4336713367	ham/pork	baked	bread-based	canned	t
4336711671	turkey	baked	bread-based	canned	t
4336707912	turkey	roasted	bread-based	canned	t
4336706821	turkey	baked	bread-based	canned	t
4336702108	turkey	i don't know	bread-based	none	t
4336702007	turkey	roasted	bread-based	canned	t
4336701807	turkey	roasted	bread-based	canned	t
4336701591	turkey	roasted	bread-based	canned	t
4336700179	turkey	baked	bread-based	canned	t
4336699442	turkey	roasted	bread-based	canned	t
4336699080	turkey	baked	bread-based	canned	t
4336698057	turkey	baked	bread-based	canned	t
4336697274	turkey	baked	bread-based	none	t
4336696561	turkey	roasted	bread-based	canned	t
4336692873	tofurkey	baked	none	homemade	f
4336692199	turkey	roasted	bread-based	homemade	t
4336690603	turkey	baked	bread-based	canned	t
4336689196	turkey	roasted	bread-based	none	t
4336688947	turkey	baked	bread-based	homemade	t
4336681909	turkey	roasted	bread-based	canned	t
4336681398	turkey	baked	bread-based	canned	t
4336679323	turkey	baked	bread-based	canned	t
4336678787	turkey	baked	bread-based	canned	t
4336675538	turkey	baked	bread-based	homemade	t
4336674655	turkey	baked	bread-based	none	t
4336671419	turkey	baked	bread-based	canned	t
4336670313	turkey	roasted	bread-based	homemade	t
4336670027	turkey	roasted	bread-based	canned	t
4336665828	turkey	roasted	bread-based	canned	t
4336665636	turkey	baked	bread-based	canned	t
4336665537	turkey	roasted	bread-based	canned	t
4336665417	turkey	roasted	bread-based	canned	t
4336662967	i don't know	i don't know	none	none	t
4336660983	turkey	roasted	bread-based	homemade	t
4336660839	chicken	other	bread-based	canned	t
4336657464	turkey	roasted	bread-based	canned	t
4336654576	turkey	baked	bread-based	canned	t
4336653814	turkey	roasted	bread-based	homemade	t
4336651539	roast beef	roasted	rice-based	canned	t
4336646584	turkey	roasted	bread-based	homemade	t
4336644693	turkey	baked	bread-based	none	f
4336643754	turkey	baked	none	canned	t
4336643722	turkey	other	bread-based	homemade	t
4336643107	turkey	roasted	bread-based	homemade	t
4336640736	turkey	baked	bread-based	homemade	t
4336640541	turkey	roasted	bread-based	canned	t
4336639517	turkey	baked	bread-based	canned	t
4336638494	turkey	roasted	bread-based	homemade	t
4336637202	turkey	roasted	bread-based	canned	t
4336636152	turkey	roasted	rice-based	canned	f
4336634372	turkey	fried	bread-based	canned	t
4336626273	turkey	other	bread-based	canned	t
4336625061	turkey	roasted	bread-based	canned	t
4336623766	turkey	roasted	bread-based	canned	t
4336620413	turkey	fried	other	none	t
4336618877	turkey	fried	bread-based	none	t
4336618002	turkey	roasted	bread-based	homemade	t
4336614170	turkey	baked	bread-based	canned	t
4336612504	turkey	i don't know	bread-based	homemade	t
4336611982	ham/pork	baked	none	canned	f
4336611199	turkey	roasted	other	homemade	t
4336603089	turkey	roasted	bread-based	canned	t
4336602707	turkey	roasted	bread-based	homemade	t
4336601397	turkey	roasted	bread-based	canned	t
4336596402	turkey	baked	bread-based	homemade	t
4336594873	turkey	baked	bread-based	canned	t
4336594744	turkey	baked	bread-based	none	t
4336594299	turkey	baked	bread-based	canned	t
4336593880	turkey	baked	bread-based	canned	t
4336592653	turkey	baked	other	canned	t
4336586686	turkey	baked	bread-based	homemade	t
4336581703	turkey	roasted	bread-based	homemade	t
4336580777	turkey	baked	none	canned	t
4336574897	turkey	roasted	bread-based	canned	t
4336574336	turkey	roasted	bread-based	homemade	t
4336574124	turkey	roasted	bread-based	canned	f
4336570007	turkey	baked	bread-based	homemade	t
4336559810	turkey	roasted	bread-based	canned	t
4336557451	turkey	fried	bread-based	homemade	t
4336554350	turkey	roasted	other	none	t
4336549169	turkey	baked	bread-based	none	t
4336548962	turkey	fried	other	canned	t
4336547916	turkey	roasted	bread-based	homemade	t
4336547275	turkey	baked	bread-based	canned	t
4336546028	turkey	baked	bread-based	canned	t
4336544071	turkey	baked	bread-based	canned	t
4336543220	turkey	baked	bread-based	canned	t
4336541332	other	baked	bread-based	canned	t
4336540513	turkey	roasted	bread-based	homemade	t
4336535098	turkey	roasted	bread-based	canned	t
4336533400	turkey	baked	bread-based	homemade	t
4336527571	turkey	roasted	bread-based	canned	t
4336527545	turkey	baked	rice-based	none	t
4336524165	other	baked	bread-based	none	f
4336522973	turkey	roasted	none	none	f
4336520950	turkey	roasted	bread-based	canned	t
4336518573	turkey	baked	bread-based	canned	t
4336516793	turkey	baked	bread-based	canned	t
4336512650	turkey	other	bread-based	homemade	t
4336510658	turkey	baked	bread-based	homemade	t
4336509936	other	i don't know	none	none	f
4336505029	roast beef	roasted	none	canned	t
4336500591	turkey	roasted	bread-based	canned	t
4336498949	turkey	baked	bread-based	canned	t
4336497964	turkey	roasted	none	homemade	t
4336497833	turkey	roasted	bread-based	canned	t
4336496891	turkey	roasted	other	canned	t
4336495665	turkey	other	other	homemade	f
4336490883	turkey	baked	bread-based	none	t
4336490784	turkey	roasted	bread-based	canned	t
4336490014	turkey	baked	bread-based	canned	t
4336487804	turkey	roasted	bread-based	canned	t
4336486285	turkey	baked	bread-based	canned	t
4336482823	turkey	other	other	homemade	f
4336480011	turkey	baked	bread-based	none	t
4336479126	turkey	roasted	bread-based	homemade	t
4336478617	other	baked	bread-based	homemade	t
4336477366	turkey	fried	bread-based	canned	t
4336471362	other	other	none	homemade	t
4336471066	ham/pork	baked	bread-based	canned	t
4336467288	turkey	i don't know	bread-based	none	f
4336465723	turkey	baked	bread-based	canned	t
4336465404	turkey	roasted	bread-based	other	t
4336465104	ham/pork	baked	bread-based	other	t
4336464178	other	roasted	bread-based	homemade	t
4336463294	turkey	baked	bread-based	canned	t
4336460536	ham/pork	baked	bread-based	canned	t
4336459298	turkey	roasted	bread-based	canned	t
4336457715	turkey	baked	bread-based	canned	t
4336452468	turkey	baked	bread-based	canned	f
4336449973	turkey	roasted	bread-based	none	t
4336448779	turkey	roasted	bread-based	canned	t
4336445862	turkey	fried	bread-based	canned	t
4336442018	turkey	roasted	bread-based	canned	t
4336433694	turkey	baked	bread-based	canned	f
4336426326	turkey	roasted	none	homemade	t
4336426077	turkey	baked	bread-based	homemade	t
4336422509	turkey	baked	bread-based	canned	t
4336420032	turkey	roasted	bread-based	canned	t
4336414511	turkey	baked	bread-based	homemade	t
4336405712	turkey	other	bread-based	canned	t
4336403950	turkey	baked	bread-based	canned	t
4336403233	turkey	baked	bread-based	none	t
4336400854	tofurkey	baked	bread-based	canned	f
4336391382	turkey	baked	bread-based	canned	t
4336387798	turkey	roasted	bread-based	none	f
4336381595	chicken	baked	rice-based	homemade	t
4336379876	turkey	baked	bread-based	canned	t
4336376803	turkey	roasted	bread-based	canned	t
4336376443	turkey	baked	bread-based	homemade	t
4336371555	turkey	roasted	bread-based	homemade	t
4336368343	turkey	roasted	bread-based	other	t
4336368281	turkey	baked	bread-based	homemade	t
4336366345	turkey	other	other	canned	t
4336365763	turkey	roasted	bread-based	homemade	t
4336351539	chicken	fried	rice-based	canned	t
4336351224	turkey	baked	bread-based	canned	t
4336348590	turkey	roasted	bread-based	canned	t
4336346355	turkey	other	bread-based	canned	t
4336337183	turkey	baked	bread-based	canned	t
4336336129	turkey	baked	bread-based	canned	t
4336333982	turkey	roasted	other	homemade	t
4336326250	turkey	other	bread-based	homemade	t
4336324874	turkey	baked	bread-based	canned	t
4336322606	turkey	fried	rice-based	homemade	t
4336321558	turkey	baked	bread-based	canned	t
4336317891	turkey	fried	bread-based	canned	t
4336313453	turkey	baked	bread-based	canned	t
4336313021	turkey	roasted	bread-based	none	f
4336312523	turkey	other	bread-based	canned	t
4336306664	turkey	baked	bread-based	canned	t
4336302631	turkey	baked	bread-based	none	t
4336301847	turkey	roasted	bread-based	other	t
4336299882	turkey	baked	bread-based	none	t
4336298829	ham/pork	roasted	bread-based	canned	t
4336288339	turkey	baked	bread-based	canned	t
4336288217	turkey	baked	bread-based	canned	t
4336276238	turkey	roasted	bread-based	homemade	t
4336271469	turkey	baked	bread-based	homemade	t
4336258240	roast beef	roasted	rice-based	canned	t
4336255036	turkey	baked	bread-based	canned	t
4336249082	other	baked	bread-based	homemade	t
4336248435	roast beef	roasted	rice-based	homemade	t
4336238126	tofurkey	baked	bread-based	homemade	f
4336235428	turkey	baked	bread-based	homemade	t
4336232691	turkey	baked	bread-based	canned	t
4336231459	turkey	baked	none	none	t
4336227131	turkey	roasted	bread-based	canned	t
4336224500	turkey	baked	bread-based	homemade	t
4336221484	turkey	roasted	bread-based	canned	t
4336215705	roast beef	fried	rice-based	canned	f
4336208942	chicken	roasted	bread-based	none	t
4336203800	turkey	baked	bread-based	canned	t
4336199133	turkey	baked	bread-based	canned	t
4336194345	turkey	fried	bread-based	canned	t
4336189898	roast beef	other	bread-based	canned	f
4336189473	turkey	baked	bread-based	canned	t
4336185735	turkey	baked	bread-based	homemade	t
4336181226	turkey	i don't know	none	none	t
4336176902	turkey	roasted	bread-based	canned	t
4336175740	tofurkey	baked	none	none	t
4336175699	turkey	baked	bread-based	canned	t
4336175345	turkey	baked	bread-based	canned	t
4336168292	turkey	baked	bread-based	homemade	t
4336164056	turkey	baked	bread-based	homemade	f
4336163908	turkey	roasted	bread-based	canned	t
4336161556	i don't know	roasted	other	none	f
4336146440	other	other	none	canned	f
4336144357	roast beef	roasted	none	homemade	f
4336142896	turkey	roasted	bread-based	homemade	t
4336137995	turkey	baked	rice-based	canned	t
4336137435	turkey	roasted	bread-based	canned	t
4336137098	other	baked	bread-based	homemade	t
4336134461	turkey	baked	bread-based	canned	t
4336133522	turkey	baked	bread-based	canned	t
4336133454	other	roasted	none	none	f
4336131533	turkey	roasted	bread-based	canned	t
4336131319	turkey	roasted	bread-based	homemade	t
4336128578	roast beef	baked	rice-based	homemade	f
4336126090	turkey	roasted	bread-based	homemade	t
4336125524	turkey	roasted	other	homemade	t
4336121663	tofurkey	baked	rice-based	other	f
4336120894	turkey	fried	bread-based	canned	t
4336119647	turkey	roasted	bread-based	canned	t
4336117281	ham/pork	baked	bread-based	none	t
4336117179	turkey	baked	none	homemade	t
4336111339	turkey	roasted	other	homemade	t
4336108209	chicken	roasted	bread-based	canned	t
4336106089	turkey	baked	bread-based	canned	t
4336106041	turkey	baked	bread-based	canned	f
4336104179	turkey	roasted	bread-based	canned	t
4336103434	turkey	baked	bread-based	canned	t
4336103319	turkey	baked	bread-based	canned	t
4336101470	turkey	baked	bread-based	other	t
4336099044	turkey	baked	bread-based	homemade	t
4336098809	turkey	baked	bread-based	canned	t
4336093974	turkey	baked	bread-based	none	t
4336092370	chicken	baked	none	none	f
4336091474	turkey	roasted	bread-based	canned	t
4336090652	turkey	roasted	bread-based	homemade	t
4336090647	turkey	roasted	bread-based	homemade	t
4336090552	chicken	baked	bread-based	canned	t
4336086559	turkey	roasted	bread-based	none	t
4336085504	turkey	roasted	bread-based	none	t
4336085020	chicken	fried	rice-based	homemade	t
4336083561	i don't know	i don't know	none	homemade	t
4336083443	turkey	roasted	bread-based	canned	t
4336081481	turkey	roasted	bread-based	canned	t
4336080517	turkey	roasted	bread-based	canned	t
4336078959	turkey	baked	bread-based	canned	t
4336078481	turkey	roasted	bread-based	canned	t
4336076367	turkey	roasted	bread-based	canned	t
4336076365	turkey	baked	bread-based	homemade	t
4336076323	turkey	fried	bread-based	canned	f
4336074858	turkey	baked	bread-based	none	f
4336073613	turkey	baked	bread-based	canned	t
4336073270	turkey	roasted	bread-based	homemade	t
4336070791	turkey	roasted	bread-based	canned	t
4336068292	turkey	roasted	bread-based	canned	t
4336066162	turkey	baked	bread-based	canned	t
4336065006	turkey	baked	bread-based	homemade	t
4336062672	turkey	other	bread-based	homemade	t
4336058499	turkey	roasted	bread-based	homemade	t
4336057426	turkey	roasted	bread-based	other	t
4336056145	turkey	fried	bread-based	homemade	t
4336055904	turkey	baked	none	homemade	t
4336048135	turkey	baked	bread-based	canned	t
4336047575	turkey	baked	bread-based	canned	t
4336047405	turkey	roasted	bread-based	none	t
4336041912	turkey	baked	bread-based	homemade	t
4336040902	turkey	baked	bread-based	canned	t
4336040679	turkey	baked	bread-based	homemade	t
4336040464	turkey	roasted	bread-based	homemade	t
4336038370	turkey	baked	bread-based	canned	t
4336037944	turkey	roasted	bread-based	homemade	t
4336037337	turkey	baked	bread-based	canned	t
4336036960	other	roasted	bread-based	none	t
4336034694	turkey	baked	rice-based	canned	t
4336033443	turkey	baked	bread-based	none	t
4336030046	turkey	baked	bread-based	homemade	t
4336029825	turkey	baked	bread-based	canned	t
4336027932	turkey	baked	bread-based	homemade	t
4336023531	turkey	baked	bread-based	homemade	t
4336022983	chicken	baked	bread-based	canned	t
4336022372	turkey	baked	bread-based	canned	t
4336022096	turkey	baked	bread-based	canned	t
4336021883	turkey	baked	bread-based	canned	t
4336021180	turkey	roasted	bread-based	canned	t
4336018601	turkey	roasted	bread-based	homemade	t
4336017089	i don't know	fried	bread-based	canned	f
4336016535	turkey	baked	bread-based	canned	t
4336015865	turkey	baked	bread-based	homemade	t
4336015017	turkey	roasted	bread-based	homemade	t
4336014587	turkey	baked	bread-based	none	t
4336014104	turkey	baked	bread-based	canned	t
4336012118	turkey	baked	bread-based	canned	t
4336012003	turkey	baked	bread-based	canned	t
4336011166	turkey	roasted	bread-based	homemade	t
4336006784	turkey	roasted	bread-based	canned	t
4336005220	tofurkey	baked	bread-based	homemade	t
4336002999	turkey	roasted	bread-based	canned	t
4336002487	roast beef	fried	bread-based	canned	t
4336001840	turkey	baked	bread-based	canned	t
4336001546	turkey	other	other	canned	t
4335999720	turkey	baked	bread-based	homemade	t
4335998934	turkey	other	bread-based	homemade	t
4335996765	turkey	baked	none	none	f
4335996482	turkey	roasted	bread-based	canned	t
4335992962	turkey	roasted	bread-based	canned	t
4335992074	turkey	roasted	bread-based	none	t
4335990669	turkey	roasted	bread-based	canned	t
4335990002	turkey	baked	bread-based	canned	t
4335989591	turkey	baked	none	none	t
4335988879	turkey	roasted	none	none	f
4335988400	turkey	baked	other	canned	t
4335988391	turkey	roasted	bread-based	canned	t
4335988189	turkey	baked	bread-based	canned	t
4335987976	turkey	i don't know	none	none	t
4335987642	ham/pork	roasted	none	none	t
4335987129	turkey	roasted	bread-based	canned	t
4335986817	turkey	roasted	bread-based	homemade	t
4335985936	turkey	baked	bread-based	none	f
4335983992	turkey	baked	bread-based	canned	t
4335983559	turkey	roasted	bread-based	none	t
4335982114	turkey	baked	bread-based	none	t
4335981269	turkey	baked	bread-based	none	t
4335981057	turkey	baked	bread-based	canned	t
4335979596	turkey	baked	bread-based	homemade	t
4335979419	turkey	baked	bread-based	homemade	t
4335978870	turkey	baked	bread-based	canned	t
4335977956	turkey	roasted	bread-based	canned	t
4335977899	turkey	baked	bread-based	canned	t
4335977124	turkey	baked	bread-based	canned	t
4335976340	turkey	baked	bread-based	canned	t
4335975961	turkey	baked	bread-based	canned	t
4335974428	turkey	baked	bread-based	canned	t
4335974363	turkey	roasted	bread-based	canned	t
4335973959	turkey	roasted	bread-based	homemade	t
4335973714	turkey	other	bread-based	canned	t
4335972801	turkey	roasted	bread-based	canned	t
4335971349	turkey	baked	bread-based	homemade	t
4335970729	turkey	baked	bread-based	none	t
4335970072	turkey	roasted	bread-based	canned	t
4335969513	turkey	roasted	bread-based	canned	t
4335967669	turkey	roasted	bread-based	other	t
4335967013	turkey	roasted	rice-based	canned	t
4335966421	turkey	baked	bread-based	canned	t
4335966121	turkey	baked	bread-based	canned	t
4335965739	turkey	roasted	bread-based	canned	t
4335965542	turkey	other	bread-based	other	t
4335964313	turkey	roasted	bread-based	homemade	t
4335963222	turkey	roasted	bread-based	canned	t
4335962733	turkey	baked	bread-based	homemade	t
4335961782	turkey	baked	bread-based	homemade	t
4335961440	ham/pork	baked	bread-based	canned	f
4335960847	turkey	other	bread-based	homemade	f
4335960288	other	other	bread-based	none	f
4335960105	turkey	baked	bread-based	homemade	t
4335959876	turkey	baked	bread-based	homemade	t
4335959857	turkey	other	rice-based	none	t
4335958653	turkey	baked	other	canned	t
4335958292	turkey	baked	bread-based	canned	t
4335958005	roast beef	baked	bread-based	canned	t
4335957772	i don't know	i don't know	bread-based	canned	f
4335957365	turkey	baked	bread-based	canned	f
4335957179	turkey	roasted	bread-based	homemade	t
4335957096	turkey	roasted	bread-based	canned	t
4335957072	turkey	roasted	bread-based	homemade	t
4335955478	turkey	roasted	bread-based	canned	t
4335955206	turkey	roasted	bread-based	homemade	t
4335955152	ham/pork	baked	rice-based	none	t
4335954681	turkey	baked	bread-based	canned	t
4335954394	turkey	other	bread-based	homemade	t
4335954376	turkey	baked	bread-based	canned	t
4335954207	other	baked	none	none	f
4335954131	turkey	baked	bread-based	canned	t
4335953888	turkey	baked	bread-based	canned	t
4335952833	turkey	baked	bread-based	canned	t
4335951505	turkey	roasted	other	canned	t
4335951437	turkey	baked	bread-based	canned	t
4335951082	turkey	roasted	bread-based	none	t
4335950917	turkey	roasted	none	canned	t
4335950654	turkey	i don't know	bread-based	canned	t
4335949486	turkey	baked	bread-based	canned	t
4335949169	turkey	roasted	bread-based	canned	t
4335949112	turkey	baked	bread-based	homemade	f
4335947496	turkey	roasted	bread-based	homemade	t
4335945415	turkey	roasted	bread-based	none	t
4335944854	turkey	roasted	bread-based	canned	t
4335944082	turkey	roasted	bread-based	homemade	t
4335943173	turkey	baked	bread-based	canned	t
4335943060	other	baked	rice-based	none	f
4335934708	turkey	baked	none	homemade	t
4335894916	turkey	baked	bread-based	canned	t
\.


--
-- Data for Name: pie; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pie (id, pie_type) FROM stdin;
4337954960	apple
4337951949	apple
4337951949	chocolate
4337951949	pumpkin
4337951949	other
4337935621	apple
4337935621	cherry
4337935621	peach
4337935621	pecan
4337935621	pumpkin
4337935621	sweet potato
4337933040	pecan
4337933040	pumpkin
4337931983	apple
4337931983	pumpkin
4337929779	sweet potato
4337929779	other
4337924420	apple
4337924420	pumpkin
4337916002	chocolate
4337914977	apple
4337914977	buttermilk
4337914977	pumpkin
4337914977	sweet potato
4337899817	buttermilk
4337899817	pumpkin
4337899817	sweet potato
4337893416	apple
4337893416	chocolate
4337893416	pecan
4337888291	cherry
4337888291	peach
4337888291	pumpkin
4337878450	apple
4337878450	cherry
4337878450	chocolate
4337878450	pumpkin
4337878351	chocolate
4337878351	pecan
4337878351	pumpkin
4337857295	sweet potato
4337856362	cherry
4337856362	pecan
4337854106	pumpkin
4337844879	apple
4337844879	pecan
4337844879	pumpkin
4337823612	apple
4337823612	pumpkin
4337820281	pumpkin
4337813502	buttermilk
4337813502	cherry
4337813502	chocolate
4337813502	coconut cream
4337793158	apple
4337793158	buttermilk
4337793158	cherry
4337792130	pecan
4337792130	pumpkin
4337790002	apple
4337790002	cherry
4337790002	chocolate
4337790002	coconut cream
4337790002	key lime
4337790002	peach
4337790002	pecan
4337790002	pumpkin
4337790002	sweet potato
4337783794	apple
4337783794	pumpkin
4337779071	apple
4337779071	pumpkin
4337778119	apple
4337778119	chocolate
4337778119	pumpkin
4337774090	apple
4337774090	pumpkin
4337772882	pumpkin
4337772193	apple
4337772193	peach
4337772193	pumpkin
4337771439	pumpkin
4337763296	apple
4337763296	chocolate
4337763296	pecan
4337758789	pecan
4337758789	pumpkin
4337747968	apple
4337747968	chocolate
4337747968	coconut cream
4337747968	key lime
4337747968	pecan
4337747968	pumpkin
4337747968	sweet potato
4337743121	apple
4337743121	coconut cream
4337743121	pecan
4337743121	pumpkin
4337743121	sweet potato
4337732348	apple
4337732348	chocolate
4337732348	peach
4337732348	pumpkin
4337731242	buttermilk
4337731242	pecan
4337719588	chocolate
4337719588	pecan
4337719588	pumpkin
4337698969	pumpkin
4337698969	other
4337698743	apple
4337698743	pumpkin
4337698743	sweet potato
4337660047	apple
4337660047	cherry
4337660047	pecan
4337660047	pumpkin
4337660047	sweet potato
4337655425	pumpkin
4337653684	pecan
4337653684	pumpkin
4337646565	pumpkin
4337629524	pecan
4337629524	pumpkin
4337627331	apple
4337627331	pumpkin
4337626849	chocolate
4337626849	pecan
4337626849	pumpkin
4337626849	sweet potato
4337611941	pecan
4337611941	pumpkin
4337600726	apple
4337600726	pumpkin
4337598069	apple
4337598069	chocolate
4337598069	pumpkin
4337597044	apple
4337597044	pumpkin
4337589613	pecan
4337589613	sweet potato
4337586061	buttermilk
4337583393	apple
4337583393	chocolate
4337583393	pumpkin
4337583245	coconut cream
4337582845	apple
4337582845	pumpkin
4337577784	pecan
4337577784	pumpkin
4337569645	apple
4337569645	pumpkin
4337569057	none
4337568074	apple
4337568074	chocolate
4337568074	pumpkin
4337568074	other
4337553422	pecan
4337550299	apple
4337550299	cherry
4337550299	chocolate
4337550299	pecan
4337550299	pumpkin
4337550299	sweet potato
4337545841	apple
4337545841	pumpkin
4337540484	pumpkin
4337531521	pecan
4337531521	other
4337528775	apple
4337528775	pumpkin
4337512214	apple
4337512214	pumpkin
4337512214	sweet potato
4337490067	none
4337489617	none
4337487759	pumpkin
4337484305	apple
4337475288	apple
4337475288	pumpkin
4337468268	apple
4337468268	pumpkin
4337467677	apple
4337467677	pumpkin
4337448181	pecan
4337448181	pumpkin
4337442451	chocolate
4337442451	pecan
4337442451	sweet potato
4337441164	apple
4337441070	apple
4337441070	cherry
4337441070	coconut cream
4337441070	pecan
4337441070	pumpkin
4337435277	pumpkin
4337432686	cherry
4337432686	chocolate
4337429102	key lime
4337429102	pecan
4337429102	sweet potato
4337423740	apple
4337423740	cherry
4337423740	peach
4337421462	pecan
4337421462	sweet potato
4337412056	apple
4337412056	sweet potato
4337409281	apple
4337409281	pumpkin
4337400534	apple
4337400534	pecan
4337400534	pumpkin
4337395533	apple
4337395533	pecan
4337391263	apple
4337391263	cherry
4337391263	pecan
4337391263	pumpkin
4337390930	apple
4337390930	cherry
4337390930	chocolate
4337390930	key lime
4337390930	pecan
4337390930	pumpkin
4337390728	pecan
4337390728	pumpkin
4337386038	pumpkin
4337384089	apple
4337384089	pumpkin
4337384089	sweet potato
4337382350	chocolate
4337382350	pecan
4337382350	pumpkin
4337380720	none
4337369789	pecan
4337369789	pumpkin
4337365738	apple
4337360752	apple
4337360752	pecan
4337360752	pumpkin
4337360389	apple
4337356672	apple
4337356672	pecan
4337356672	pumpkin
4337347655	apple
4337347655	chocolate
4337347655	pumpkin
4337346312	apple
4337346312	pumpkin
4337343090	apple
4337343090	pumpkin
4337336787	chocolate
4337336787	pumpkin
4337336262	pumpkin
4337333159	apple
4337333159	cherry
4337333159	pecan
4337333159	pumpkin
4337324697	apple
4337323392	apple
4337323392	chocolate
4337323392	pumpkin
4337319123	apple
4337319123	pumpkin
4337318895	none
4337318895	other
4337311256	apple
4337311256	cherry
4337311256	pecan
4337311256	pumpkin
4337310361	pumpkin
4337309060	apple
4337309060	pumpkin
4337296029	apple
4337296029	pumpkin
4337292895	pumpkin
4337287733	pumpkin
4337284552	pecan
4337284552	pumpkin
4337275528	apple
4337275528	cherry
4337275528	pumpkin
4337262725	key lime
4337262725	pecan
4337262725	pumpkin
4337256857	pecan
4337256857	pumpkin
4337249904	pumpkin
4337247953	chocolate
4337247953	pecan
4337247953	pumpkin
4337235972	apple
4337235972	cherry
4337235972	pumpkin
4337235972	other
4337235398	apple
4337235398	key lime
4337235398	pecan
4337235398	pumpkin
4337235398	sweet potato
4337229414	apple
4337229414	pumpkin
4337225703	pumpkin
4337225703	sweet potato
4337220006	none
4337217411	chocolate
4337217411	pecan
4337217411	pumpkin
4337217411	sweet potato
4337202264	apple
4337202264	pumpkin
4337201482	apple
4337201482	cherry
4337201482	chocolate
4337201482	pumpkin
4337195940	apple
4337195940	pumpkin
4337191550	apple
4337191550	pumpkin
4337190953	apple
4337190953	cherry
4337190953	pumpkin
4337190953	sweet potato
4337188006	none
4337184092	buttermilk
4337184092	chocolate
4337184092	pumpkin
4337184092	sweet potato
4337183363	apple
4337183363	chocolate
4337183363	pumpkin
4337168468	pumpkin
4337165710	pumpkin
4337165710	other
4337164060	pumpkin
4337163790	apple
4337163790	cherry
4337163790	pumpkin
4337162131	apple
4337162131	cherry
4337162131	pumpkin
4337161591	apple
4337160605	pecan
4337160605	pumpkin
4337160531	pecan
4337160531	pumpkin
4337160291	buttermilk
4337160291	pecan
4337160291	sweet potato
4337159183	pecan
4337159183	pumpkin
4337155647	apple
4337155647	cherry
4337155647	pecan
4337155647	pumpkin
4337153385	chocolate
4337153385	pumpkin
4337153198	pecan
4337153198	pumpkin
4337153195	key lime
4337153195	pecan
4337153195	pumpkin
4337153195	sweet potato
4337150198	apple
4337150198	pumpkin
4337149818	sweet potato
4337147145	apple
4337147145	chocolate
4337145918	apple
4337145918	pumpkin
4337145918	sweet potato
4337143515	apple
4337143515	pumpkin
4337142309	apple
4337142309	pumpkin
4337139981	apple
4337139981	chocolate
4337139981	pumpkin
4337139366	buttermilk
4337139366	coconut cream
4337139327	apple
4337139327	pumpkin
4337139127	apple
4337139127	buttermilk
4337139127	chocolate
4337139127	coconut cream
4337139127	pecan
4337139127	pumpkin
4337138407	pecan
4337137158	buttermilk
4337137158	pumpkin
4337136775	apple
4337136775	pecan
4337136775	pumpkin
4337136301	pumpkin
4337135261	apple
4337135261	pumpkin
4337131392	pecan
4337131392	pumpkin
4337127124	pumpkin
4337120626	buttermilk
4337120626	chocolate
4337120626	pumpkin
4337117868	apple
4337117868	pecan
4337117868	pumpkin
4337117491	sweet potato
4337117150	apple
4337114976	apple
4337114976	key lime
4337114976	sweet potato
4337114697	other
4337114484	apple
4337114484	chocolate
4337114484	coconut cream
4337114484	pecan
4337114484	pumpkin
4337114484	sweet potato
4337113072	apple
4337113072	cherry
4337113072	pumpkin
4337112360	pumpkin
4337112360	other
4337111695	pumpkin
4337111695	sweet potato
4337110217	pecan
4337110217	pumpkin
4337109688	apple
4337109688	pumpkin
4337109688	other
4337108113	none
4337107692	pecan
4337107492	apple
4337107492	pumpkin
4337107135	pumpkin
4337106266	pumpkin
4337106266	sweet potato
4337100681	pecan
4337100681	pumpkin
4337100638	apple
4337100638	pumpkin
4337098925	apple
4337098925	pecan
4337098925	pumpkin
4337097777	apple
4337097777	coconut cream
4337097777	pumpkin
4337096669	buttermilk
4337094254	apple
4337094254	pumpkin
4337091880	apple
4337091880	chocolate
4337091880	pumpkin
4337089256	apple
4337089256	pumpkin
4337087412	apple
4337087412	pecan
4337087325	apple
4337087325	pumpkin
4337086635	apple
4337086635	chocolate
4337086635	pumpkin
4337084799	pecan
4337083360	apple
4337083360	pumpkin
4337083128	pumpkin
4337078951	pecan
4337078951	pumpkin
4337078449	pecan
4337078449	pumpkin
4337075743	cherry
4337075743	pumpkin
4337074360	apple
4337074360	pecan
4337074360	pumpkin
4337074360	sweet potato
4337074187	pecan
4337074187	pumpkin
4337073874	pumpkin
4337073874	other
4337071166	apple
4337071166	cherry
4337071166	chocolate
4337071166	coconut cream
4337071166	key lime
4337071166	pumpkin
4337070275	apple
4337070275	pecan
4337070275	pumpkin
4337069914	apple
4337069914	pumpkin
4337068413	cherry
4337068413	pumpkin
4337064141	none
4337063427	peach
4337063427	pecan
4337061732	apple
4337061732	pecan
4337061732	pumpkin
4337061177	apple
4337061177	pumpkin
4337058651	pumpkin
4337056155	cherry
4337056155	pecan
4337056155	pumpkin
4337053889	pumpkin
4337053842	pumpkin
4337053465	pecan
4337053465	pumpkin
4337053135	chocolate
4337053135	pecan
4337050973	pumpkin
4337050187	apple
4337050187	pumpkin
4337050187	sweet potato
4337049485	pecan
4337049485	pumpkin
4337044640	chocolate
4337044640	pecan
4337044640	pumpkin
4337044628	none
4337044348	pumpkin
4337043853	apple
4337043853	cherry
4337043853	pumpkin
4337043565	buttermilk
4337043565	pecan
4337043565	pumpkin
4337040587	apple
4337040587	pumpkin
4337040405	pumpkin
4337040405	sweet potato
4337032039	apple
4337032039	pumpkin
4337032039	sweet potato
4337032009	peach
4337032009	pumpkin
4337031019	pecan
4337031019	pumpkin
4337029500	chocolate
4337029500	pumpkin
4337027180	cherry
4337027180	pumpkin
4337025357	apple
4337025357	cherry
4337025357	pumpkin
4337025357	other
4337024057	chocolate
4337024057	key lime
4337024057	pecan
4337024057	pumpkin
4337024057	sweet potato
4337023697	apple
4337023697	pecan
4337023697	pumpkin
4337023697	sweet potato
4337022132	pecan
4337022132	pumpkin
4337021828	pecan
4337021828	pumpkin
4337021828	other
4337021725	pecan
4337021725	pumpkin
4337019638	apple
4337019638	pecan
4337019638	pumpkin
4337019287	none
4337019220	apple
4337019080	apple
4337019080	pecan
4337019080	pumpkin
4337013286	pumpkin
4337013286	other
4337008702	apple
4337008702	pumpkin
4337008598	cherry
4337008598	pumpkin
4337008258	pumpkin
4337006937	apple
4337006937	chocolate
4337006937	pumpkin
4337004476	pumpkin
4337002367	apple
4337002367	chocolate
4337002367	pumpkin
4337002262	apple
4337002262	peach
4337002262	pecan
4337002262	sweet potato
4336999913	pecan
4336998647	pecan
4336998647	pumpkin
4336998647	sweet potato
4336998552	pumpkin
4336997445	pecan
4336997200	apple
4336997200	sweet potato
4336996479	apple
4336996479	pumpkin
4336995888	pecan
4336995888	pumpkin
4336995888	sweet potato
4336995004	apple
4336995004	pumpkin
4336994435	apple
4336994435	sweet potato
4336994408	pumpkin
4336993856	apple
4336993856	pecan
4336993856	pumpkin
4336993552	coconut cream
4336993552	pumpkin
4336993552	sweet potato
4336993307	apple
4336993307	pumpkin
4336993268	apple
4336993268	cherry
4336993268	peach
4336989544	pecan
4336989544	sweet potato
4336988874	apple
4336988874	pumpkin
4336988874	sweet potato
4336988874	other
4336986755	pecan
4336986755	pumpkin
4336986628	apple
4336986628	cherry
4336986628	pumpkin
4336985910	apple
4336985910	pumpkin
4336985361	buttermilk
4336985361	chocolate
4336984164	apple
4336984164	pecan
4336984164	pumpkin
4336983931	apple
4336983885	apple
4336983885	coconut cream
4336983885	pumpkin
4336983016	apple
4336983016	buttermilk
4336983016	chocolate
4336983016	key lime
4336983016	pecan
4336983016	pumpkin
4336983016	sweet potato
4336982929	pumpkin
4336982929	sweet potato
4336982760	pecan
4336982760	pumpkin
4336978225	pumpkin
4336977349	pecan
4336977349	pumpkin
4336977032	none
4336975251	apple
4336975251	key lime
4336975251	pumpkin
4336975251	sweet potato
4336975010	apple
4336975010	chocolate
4336975010	pecan
4336973830	coconut cream
4336973830	pumpkin
4336972729	apple
4336972729	pumpkin
4336972039	pumpkin
4336971897	apple
4336971897	cherry
4336971897	chocolate
4336971897	peach
4336971897	pumpkin
4336971897	other
4336970208	pumpkin
4336969969	pecan
4336969969	pumpkin
4336967374	apple
4336967374	pumpkin
4336967374	sweet potato
4336965632	pumpkin
4336965464	apple
4336965464	pumpkin
4336964971	cherry
4336964971	chocolate
4336963992	apple
4336963992	pumpkin
4336963314	apple
4336963314	pumpkin
4336963112	apple
4336963112	pumpkin
4336962719	apple
4336962719	pecan
4336962719	pumpkin
4336962719	other
4336962641	none
4336962476	pecan
4336962476	pumpkin
4336961100	apple
4336961100	pumpkin
4336961030	apple
4336961030	pumpkin
4336959845	apple
4336959845	cherry
4336959845	pumpkin
4336957549	pumpkin
4336957375	pumpkin
4336957375	other
4336956397	chocolate
4336956397	pecan
4336955887	pumpkin
4336953375	apple
4336953375	cherry
4336953375	pumpkin
4336952446	apple
4336952446	buttermilk
4336952446	cherry
4336952446	coconut cream
4336952446	sweet potato
4336950642	pumpkin
4336950342	apple
4336950342	peach
4336950342	pecan
4336950342	pumpkin
4336949841	pumpkin
4336949659	apple
4336949659	pumpkin
4336949331	pecan
4336949331	pumpkin
4336949331	sweet potato
4336945764	apple
4336945764	sweet potato
4336945764	other
4336945012	apple
4336945012	pecan
4336945012	pumpkin
4336944934	apple
4336944934	cherry
4336944934	pecan
4336941325	apple
4336941325	pecan
4336941325	pumpkin
4336940774	apple
4336940774	pumpkin
4336940486	pecan
4336940486	pumpkin
4336937701	apple
4336937701	cherry
4336935604	apple
4336935604	pecan
4336935604	pumpkin
4336934948	pecan
4336934948	pumpkin
4336934948	sweet potato
4336934120	apple
4336934120	pumpkin
4336933938	apple
4336932386	pecan
4336932386	sweet potato
4336932195	apple
4336932195	pumpkin
4336931306	pecan
4336931306	pumpkin
4336931306	other
4336929784	pumpkin
4336928175	apple
4336928175	pumpkin
4336928076	apple
4336928076	peach
4336928076	pecan
4336928076	pumpkin
4336928076	sweet potato
4336927723	apple
4336927723	pecan
4336927723	pumpkin
4336925780	cherry
4336925780	pecan
4336925780	pumpkin
4336925780	sweet potato
4336925485	chocolate
4336925485	pecan
4336925485	pumpkin
4336923533	pumpkin
4336923177	apple
4336923177	peach
4336923177	sweet potato
4336922793	pecan
4336922793	pumpkin
4336922086	apple
4336922086	cherry
4336921564	chocolate
4336921564	pecan
4336921564	other
4336919993	pecan
4336917509	pecan
4336917509	pumpkin
4336917274	apple
4336917274	cherry
4336917274	peach
4336917274	pumpkin
4336917270	apple
4336917270	chocolate
4336917270	coconut cream
4336917270	pecan
4336917270	pumpkin
4336916047	apple
4336915660	none
4336915137	pecan
4336915137	pumpkin
4336915137	sweet potato
4336909691	pecan
4336909691	pumpkin
4336908416	apple
4336908416	buttermilk
4336908416	cherry
4336908416	chocolate
4336908416	pecan
4336908416	pumpkin
4336908351	apple
4336908351	pumpkin
4336908351	sweet potato
4336907249	pumpkin
4336905433	none
4336905258	apple
4336905258	cherry
4336905258	pumpkin
4336905103	buttermilk
4336905103	pecan
4336905103	pumpkin
4336902332	apple
4336902332	pumpkin
4336902332	other
4336901843	none
4336901444	pecan
4336901246	apple
4336901246	cherry
4336901246	pumpkin
4336901246	other
4336901039	apple
4336901039	pumpkin
4336900009	apple
4336900009	pumpkin
4336898888	apple
4336898888	pumpkin
4336898281	pecan
4336898281	pumpkin
4336897370	apple
4336897370	pumpkin
4336897268	apple
4336897268	pecan
4336897268	pumpkin
4336897268	sweet potato
4336896050	apple
4336896050	pumpkin
4336896050	sweet potato
4336894987	pumpkin
4336894987	sweet potato
4336894811	apple
4336894811	pumpkin
4336894719	pecan
4336894719	pumpkin
4336894663	apple
4336894663	pumpkin
4336893852	pumpkin
4336892910	apple
4336892910	pumpkin
4336892388	none
4336891075	pumpkin
4336890666	key lime
4336890666	pecan
4336890666	pumpkin
4336888973	chocolate
4336888973	pecan
4336888973	pumpkin
4336888973	other
4336888425	apple
4336888425	pumpkin
4336887954	apple
4336887954	pumpkin
4336887954	sweet potato
4336887917	apple
4336887917	pumpkin
4336887807	apple
4336887807	chocolate
4336887807	pumpkin
4336885748	apple
4336885748	pumpkin
4336885693	apple
4336885693	pumpkin
4336885693	sweet potato
4336884042	pumpkin
4336884019	pumpkin
4336883054	pumpkin
4336882230	apple
4336882230	chocolate
4336882230	pumpkin
4336881221	apple
4336881221	pecan
4336881221	sweet potato
4336881198	apple
4336881198	chocolate
4336880828	pumpkin
4336880828	sweet potato
4336879968	pumpkin
4336879968	sweet potato
4336879592	apple
4336879592	peach
4336879592	pumpkin
4336879579	chocolate
4336879579	pecan
4336879579	pumpkin
4336879316	apple
4336879316	pecan
4336879316	pumpkin
4336878978	apple
4336878978	cherry
4336878978	pumpkin
4336878183	pumpkin
4336876798	apple
4336876798	pecan
4336876529	pumpkin
4336876457	apple
4336876457	pecan
4336876457	pumpkin
4336876457	sweet potato
4336876402	apple
4336876402	buttermilk
4336876402	cherry
4336876402	chocolate
4336876402	coconut cream
4336876402	pecan
4336876402	pumpkin
4336876402	other
4336875194	apple
4336875194	pumpkin
4336875194	other
4336874555	pecan
4336874265	apple
4336874265	pecan
4336871606	apple
4336871606	pumpkin
4336871204	apple
4336871204	buttermilk
4336871204	pecan
4336871204	sweet potato
4336870813	apple
4336870813	key lime
4336870813	pecan
4336870813	pumpkin
4336870370	apple
4336870370	sweet potato
4336870006	pumpkin
4336870006	sweet potato
4336869926	apple
4336869926	cherry
4336869926	sweet potato
4336868990	pumpkin
4336867812	cherry
4336867812	pecan
4336867812	pumpkin
4336867812	sweet potato
4336867797	other
4336867715	apple
4336867715	pumpkin
4336866361	apple
4336866361	pumpkin
4336863649	apple
4336863649	cherry
4336863649	chocolate
4336863649	pumpkin
4336863649	sweet potato
4336861802	pecan
4336861802	pumpkin
4336861802	sweet potato
4336861435	pecan
4336861435	pumpkin
4336860680	apple
4336860680	pumpkin
4336860498	apple
4336860029	none
4336857693	apple
4336857693	pecan
4336857693	sweet potato
4336857530	buttermilk
4336857362	apple
4336857362	pumpkin
4336856298	apple
4336856298	chocolate
4336856298	pecan
4336855177	pecan
4336855177	pumpkin
4336853880	pumpkin
4336853880	other
4336851292	apple
4336851260	buttermilk
4336851260	pecan
4336851260	pumpkin
4336848038	apple
4336848038	chocolate
4336848038	pumpkin
4336848038	sweet potato
4336847523	pumpkin
4336844557	pumpkin
4336843665	pumpkin
4336841567	apple
4336841567	pumpkin
4336841484	apple
4336841484	chocolate
4336840954	apple
4336840954	sweet potato
4336840612	apple
4336840612	chocolate
4336840612	pumpkin
4336840612	sweet potato
4336839687	pumpkin
4336838632	apple
4336838632	chocolate
4336838630	apple
4336838630	chocolate
4336838630	pecan
4336838317	apple
4336838317	pecan
4336838317	pumpkin
4336837943	pumpkin
4336837306	apple
4336837306	pumpkin
4336836328	apple
4336836328	cherry
4336836328	pecan
4336836328	pumpkin
4336836078	pumpkin
4336836078	other
4336835004	none
4336834730	apple
4336834730	pumpkin
4336834473	none
4336833478	none
4336832951	pecan
4336832129	apple
4336832129	chocolate
4336830596	apple
4336830596	pecan
4336830596	pumpkin
4336829875	pumpkin
4336829721	pecan
4336829721	sweet potato
4336829185	apple
4336829185	pecan
4336829185	pumpkin
4336829185	other
4336828331	apple
4336828331	pumpkin
4336827783	apple
4336827783	pumpkin
4336827663	apple
4336827663	coconut cream
4336827663	pecan
4336826560	apple
4336826560	pumpkin
4336825506	apple
4336825506	cherry
4336825506	chocolate
4336825506	pumpkin
4336825281	pecan
4336825281	pumpkin
4336825000	apple
4336825000	key lime
4336825000	pumpkin
4336823441	apple
4336823441	cherry
4336823441	other
4336823172	pecan
4336823172	pumpkin
4336822252	apple
4336822252	pumpkin
4336821807	apple
4336821807	pumpkin
4336821332	pecan
4336821332	pumpkin
4336821332	other
4336819191	chocolate
4336819191	pecan
4336819191	sweet potato
4336819043	pecan
4336816440	apple
4336816440	chocolate
4336816440	pecan
4336816440	pumpkin
4336815648	apple
4336815648	pumpkin
4336815463	apple
4336815463	pumpkin
4336815399	sweet potato
4336814310	apple
4336814310	pumpkin
4336814310	other
4336813874	pumpkin
4336812402	apple
4336812402	chocolate
4336812402	pumpkin
4336811982	apple
4336811982	pecan
4336811877	apple
4336811877	pecan
4336811877	pumpkin
4336811877	sweet potato
4336811565	none
4336811492	chocolate
4336811492	pecan
4336811492	pumpkin
4336810566	apple
4336810566	chocolate
4336810566	pumpkin
4336809276	apple
4336809276	pumpkin
4336809111	apple
4336809111	sweet potato
4336808397	apple
4336808397	pumpkin
4336808238	apple
4336808238	pumpkin
4336808019	chocolate
4336808019	pumpkin
4336807635	apple
4336807635	pecan
4336806751	apple
4336806751	pumpkin
4336804174	apple
4336804174	cherry
4336804003	apple
4336804003	pecan
4336804003	pumpkin
4336802942	apple
4336802942	cherry
4336802030	apple
4336802030	pumpkin
4336802030	other
4336801887	apple
4336801887	pumpkin
4336800334	apple
4336800334	pumpkin
4336800274	pecan
4336800274	pumpkin
4336799773	apple
4336799773	pecan
4336799773	pumpkin
4336799337	pumpkin
4336799337	other
4336799126	apple
4336799126	pumpkin
4336799058	apple
4336797746	apple
4336797746	key lime
4336797746	pumpkin
4336795509	apple
4336795509	pumpkin
4336794143	pumpkin
4336794044	apple
4336794044	chocolate
4336794044	pumpkin
4336793943	apple
4336793943	pecan
4336793943	pumpkin
4336793870	apple
4336793870	pecan
4336793870	pumpkin
4336792331	pecan
4336792331	pumpkin
4336792302	pecan
4336792302	pumpkin
4336790523	apple
4336790523	pumpkin
4336789188	peach
4336789188	sweet potato
4336788022	pumpkin
4336787017	none
4336785978	none
4336785048	apple
4336785048	pecan
4336785048	pumpkin
4336784825	cherry
4336784825	key lime
4336783082	apple
4336783082	pumpkin
4336780483	sweet potato
4336779288	apple
4336779288	coconut cream
4336779288	pumpkin
4336776734	apple
4336776734	chocolate
4336776734	pecan
4336776734	pumpkin
4336775444	pecan
4336775444	pumpkin
4336775444	sweet potato
4336775416	apple
4336775416	chocolate
4336775416	pecan
4336775416	pumpkin
4336774641	apple
4336774641	pumpkin
4336772456	apple
4336772456	key lime
4336772456	pecan
4336772456	pumpkin
4336772452	apple
4336772452	pumpkin
4336771206	pumpkin
4336770959	none
4336768956	apple
4336768956	pecan
4336768662	apple
4336768662	pumpkin
4336768149	apple
4336768149	cherry
4336768149	coconut cream
4336768149	pecan
4336768149	pumpkin
4336767119	pecan
4336767119	pumpkin
4336766876	apple
4336766876	cherry
4336766876	pumpkin
4336764121	pecan
4336764121	pumpkin
4336764087	apple
4336764087	pumpkin
4336763694	apple
4336763694	cherry
4336763694	pumpkin
4336763694	sweet potato
4336763416	key lime
4336763416	pecan
4336763416	pumpkin
4336763416	sweet potato
4336763302	apple
4336763302	pecan
4336763302	pumpkin
4336763302	sweet potato
4336762600	pecan
4336762600	pumpkin
4336762458	apple
4336762458	cherry
4336762458	pumpkin
4336762096	apple
4336762096	pumpkin
4336761799	apple
4336761290	apple
4336760341	apple
4336760341	pecan
4336760341	pumpkin
4336760110	apple
4336760110	pecan
4336760110	pumpkin
4336759353	apple
4336759353	cherry
4336759353	pumpkin
4336759353	sweet potato
4336758840	pecan
4336758840	pumpkin
4336756589	apple
4336756589	pumpkin
4336756075	pumpkin
4336754872	pumpkin
4336754457	apple
4336754457	pecan
4336754457	pumpkin
4336754179	pumpkin
4336752791	apple
4336752791	other
4336752314	pumpkin
4336752112	pumpkin
4336749249	pecan
4336749249	pumpkin
4336749249	other
4336748097	apple
4336748097	chocolate
4336748097	pumpkin
4336747306	apple
4336747306	cherry
4336747306	pumpkin
4336746217	apple
4336746217	pumpkin
4336746110	apple
4336746110	cherry
4336746110	pumpkin
4336746002	apple
4336746002	pecan
4336746002	pumpkin
4336745373	apple
4336745373	pecan
4336745373	pumpkin
4336745373	sweet potato
4336744632	pumpkin
4336743563	pumpkin
4336738591	cherry
4336738214	coconut cream
4336738214	pecan
4336738214	sweet potato
4336736562	none
4336733948	cherry
4336733948	pecan
4336731531	pumpkin
4336728581	pecan
4336728581	pumpkin
4336728147	apple
4336728147	pumpkin
4336727141	apple
4336727141	chocolate
4336727141	other
4336726910	pecan
4336726910	pumpkin
4336726144	apple
4336726144	cherry
4336726144	pumpkin
4336726144	other
4336725284	apple
4336722668	apple
4336722668	cherry
4336722668	pecan
4336722668	pumpkin
4336722668	sweet potato
4336722051	pumpkin
4336721418	apple
4336721418	cherry
4336721418	pecan
4336721418	pumpkin
4336719997	apple
4336719997	pumpkin
4336719997	sweet potato
4336719266	apple
4336719266	key lime
4336719266	pumpkin
4336717891	apple
4336717891	pumpkin
4336717466	apple
4336717454	pumpkin
4336714289	apple
4336714289	pecan
4336714289	pumpkin
4336714072	apple
4336714072	pecan
4336714072	pumpkin
4336714072	sweet potato
4336713367	cherry
4336713367	pumpkin
4336711671	apple
4336711671	pecan
4336711671	pumpkin
4336707912	sweet potato
4336706821	apple
4336706821	pecan
4336706821	pumpkin
4336706821	sweet potato
4336702108	pumpkin
4336702007	apple
4336702007	pumpkin
4336701807	apple
4336701591	apple
4336701591	pumpkin
4336700179	apple
4336700179	pecan
4336700179	pumpkin
4336699442	pumpkin
4336699080	apple
4336698057	pumpkin
4336698057	sweet potato
4336697274	apple
4336697274	pumpkin
4336696561	apple
4336696561	pumpkin
4336692873	pecan
4336692873	pumpkin
4336692199	apple
4336692199	pumpkin
4336690603	apple
4336690603	pecan
4336690603	pumpkin
4336689196	pecan
4336689196	pumpkin
4336688947	apple
4336688947	cherry
4336681909	apple
4336681909	cherry
4336681909	pecan
4336681909	pumpkin
4336681398	pumpkin
4336679323	cherry
4336679323	pumpkin
4336678787	apple
4336678787	key lime
4336678787	pumpkin
4336675538	apple
4336675538	pecan
4336675538	pumpkin
4336674655	apple
4336674655	pumpkin
4336671419	pumpkin
4336671419	sweet potato
4336670313	apple
4336670313	pecan
4336670313	pumpkin
4336670027	apple
4336670027	pecan
4336670027	pumpkin
4336665828	pumpkin
4336665636	apple
4336665636	sweet potato
4336665537	apple
4336665537	peach
4336665537	pumpkin
4336665417	apple
4336665417	pumpkin
4336662967	sweet potato
4336660983	pumpkin
4336660983	sweet potato
4336660839	pumpkin
4336657464	apple
4336657464	pecan
4336657464	pumpkin
4336657464	other
4336654576	apple
4336654576	chocolate
4336654576	pumpkin
4336653814	buttermilk
4336653814	pecan
4336653814	pumpkin
4336651539	key lime
4336646584	apple
4336646584	pumpkin
4336644693	other
4336643754	chocolate
4336643722	chocolate
4336643722	pecan
4336643722	other
4336643107	pumpkin
4336643107	other
4336640736	pecan
4336640736	pumpkin
4336640541	apple
4336640541	pumpkin
4336639517	apple
4336639517	cherry
4336639517	chocolate
4336639517	pecan
4336639517	pumpkin
4336639517	other
4336638494	pecan
4336638494	pumpkin
4336637202	apple
4336637202	chocolate
4336637202	pecan
4336637202	pumpkin
4336636152	apple
4336636152	peach
4336634372	chocolate
4336634372	pecan
4336626273	pecan
4336626273	pumpkin
4336625061	pumpkin
4336623766	apple
4336623766	key lime
4336620413	apple
4336620413	key lime
4336620413	pecan
4336620413	pumpkin
4336620413	sweet potato
4336618877	pecan
4336618002	pumpkin
4336614170	none
4336612504	apple
4336612504	pecan
4336611982	pumpkin
4336611199	apple
4336611199	chocolate
4336611199	coconut cream
4336611199	pecan
4336611199	pumpkin
4336603089	peach
4336602707	coconut cream
4336602707	pumpkin
4336601397	pumpkin
4336596402	cherry
4336596402	pecan
4336596402	pumpkin
4336596402	other
4336594873	pumpkin
4336594744	apple
4336594744	cherry
4336594744	pumpkin
4336594299	pumpkin
4336593880	apple
4336593880	pumpkin
4336593880	other
4336592653	apple
4336592653	pecan
4336592653	other
4336586686	apple
4336586686	pecan
4336586686	pumpkin
4336581703	pecan
4336580777	cherry
4336580777	pecan
4336580777	sweet potato
4336574897	pecan
4336574897	pumpkin
4336574336	none
4336574124	none
4336570007	apple
4336570007	pecan
4336570007	pumpkin
4336559810	pumpkin
4336557451	apple
4336554350	none
4336549169	cherry
4336549169	pecan
4336549169	pumpkin
4336548962	buttermilk
4336548962	chocolate
4336548962	pecan
4336548962	pumpkin
4336547916	apple
4336547916	pumpkin
4336547275	apple
4336547275	cherry
4336547275	coconut cream
4336547275	pecan
4336547275	pumpkin
4336547275	sweet potato
4336546028	chocolate
4336546028	pumpkin
4336544071	pecan
4336544071	sweet potato
4336543220	apple
4336543220	pecan
4336541332	chocolate
4336541332	coconut cream
4336541332	pumpkin
4336540513	pumpkin
4336540513	other
4336535098	pecan
4336535098	pumpkin
4336533400	apple
4336533400	cherry
4336533400	pecan
4336533400	pumpkin
4336527571	pecan
4336527571	pumpkin
4336527545	pumpkin
4336524165	apple
4336524165	pumpkin
4336522973	none
4336520950	apple
4336520950	pecan
4336520950	pumpkin
4336518573	pumpkin
4336518573	sweet potato
4336516793	apple
4336516793	coconut cream
4336516793	pumpkin
4336512650	apple
4336512650	pumpkin
4336510658	apple
4336510658	coconut cream
4336510658	pumpkin
4336509936	sweet potato
4336505029	pumpkin
4336500591	apple
4336500591	other
4336498949	apple
4336498949	pumpkin
4336497964	apple
4336497964	pecan
4336497964	pumpkin
4336497833	apple
4336497833	pumpkin
4336496891	coconut cream
4336496891	pecan
4336496891	sweet potato
4336495665	apple
4336495665	pecan
4336490883	apple
4336490883	chocolate
4336490883	coconut cream
4336490883	key lime
4336490883	pecan
4336490883	pumpkin
4336490784	pecan
4336490784	pumpkin
4336490014	pumpkin
4336487804	pumpkin
4336486285	pumpkin
4336486285	sweet potato
4336480011	apple
4336480011	cherry
4336479126	apple
4336479126	pumpkin
4336478617	pecan
4336478617	pumpkin
4336477366	apple
4336477366	pecan
4336477366	sweet potato
4336471362	apple
4336471362	pumpkin
4336471066	apple
4336467288	pumpkin
4336465723	pecan
4336465723	pumpkin
4336465404	apple
4336465404	pumpkin
4336465104	chocolate
4336465104	pecan
4336465104	pumpkin
4336464178	apple
4336464178	pecan
4336464178	pumpkin
4336463294	apple
4336463294	pumpkin
4336463294	sweet potato
4336460536	apple
4336460536	pumpkin
4336459298	apple
4336459298	cherry
4336459298	pumpkin
4336457715	pumpkin
4336452468	pumpkin
4336452468	sweet potato
4336449973	sweet potato
4336448779	apple
4336448779	key lime
4336448779	pecan
4336442018	apple
4336442018	cherry
4336442018	chocolate
4336442018	pecan
4336442018	pumpkin
4336442018	sweet potato
4336433694	apple
4336433694	chocolate
4336433694	pecan
4336433694	pumpkin
4336426326	pecan
4336426326	other
4336426077	apple
4336426077	pumpkin
4336422509	chocolate
4336422509	pumpkin
4336420032	apple
4336420032	coconut cream
4336420032	pumpkin
4336414511	pecan
4336414511	pumpkin
4336405712	key lime
4336405712	pecan
4336405712	sweet potato
4336403950	pumpkin
4336403233	apple
4336403233	pumpkin
4336400854	apple
4336400854	pumpkin
4336391382	apple
4336391382	cherry
4336391382	chocolate
4336391382	coconut cream
4336391382	peach
4336391382	pecan
4336391382	sweet potato
4336387798	pecan
4336387798	pumpkin
4336381595	sweet potato
4336379876	apple
4336379876	pumpkin
4336376803	pecan
4336376803	pumpkin
4336376803	other
4336376443	pumpkin
4336376443	other
4336371555	apple
4336371555	pumpkin
4336368343	apple
4336368343	cherry
4336368343	pumpkin
4336368281	buttermilk
4336368281	key lime
4336368281	sweet potato
4336366345	apple
4336366345	pumpkin
4336365763	apple
4336365763	pumpkin
4336351539	buttermilk
4336351539	chocolate
4336351224	apple
4336351224	cherry
4336351224	peach
4336351224	pecan
4336351224	pumpkin
4336351224	sweet potato
4336348590	pecan
4336348590	sweet potato
4336348590	other
4336346355	apple
4336346355	chocolate
4336346355	key lime
4336346355	pecan
4336346355	pumpkin
4336337183	apple
4336337183	pumpkin
4336336129	apple
4336336129	pumpkin
4336333982	apple
4336333982	pumpkin
4336326250	apple
4336326250	pumpkin
4336324874	pumpkin
4336322606	chocolate
4336322606	peach
4336322606	pecan
4336322606	pumpkin
4336322606	sweet potato
4336321558	pumpkin
4336317891	chocolate
4336317891	pumpkin
4336313453	apple
4336313453	pumpkin
4336313021	none
4336312523	pumpkin
4336306664	cherry
4336306664	pumpkin
4336302631	cherry
4336301847	pecan
4336301847	pumpkin
4336301847	other
4336299882	apple
4336299882	pecan
4336299882	pumpkin
4336299882	sweet potato
4336298829	apple
4336298829	key lime
4336298829	pecan
4336298829	pumpkin
4336298829	sweet potato
4336288339	pumpkin
4336288217	apple
4336288217	pecan
4336288217	pumpkin
4336276238	apple
4336276238	coconut cream
4336276238	peach
4336271469	apple
4336271469	pumpkin
4336271469	other
4336258240	apple
4336258240	cherry
4336255036	apple
4336255036	buttermilk
4336255036	key lime
4336255036	pumpkin
4336249082	apple
4336249082	chocolate
4336249082	pecan
4336249082	pumpkin
4336249082	other
4336248435	chocolate
4336248435	peach
4336248435	sweet potato
4336238126	apple
4336238126	pecan
4336238126	pumpkin
4336235428	pecan
4336235428	pumpkin
4336232691	apple
4336232691	pumpkin
4336231459	chocolate
4336231459	pecan
4336231459	pumpkin
4336227131	pecan
4336227131	pumpkin
4336224500	apple
4336224500	pumpkin
4336221484	apple
4336221484	pumpkin
4336215705	none
4336208942	cherry
4336208942	key lime
4336208942	peach
4336208942	pumpkin
4336203800	buttermilk
4336203800	pecan
4336203800	pumpkin
4336199133	pumpkin
4336194345	pumpkin
4336194345	sweet potato
4336189898	apple
4336189898	pecan
4336189898	pumpkin
4336189473	apple
4336189473	pumpkin
4336185735	apple
4336185735	pumpkin
4336185735	sweet potato
4336181226	other
4336176902	pecan
4336176902	pumpkin
4336176902	other
4336175740	cherry
4336175740	pumpkin
4336175699	pumpkin
4336175345	apple
4336175345	pecan
4336175345	pumpkin
4336175345	sweet potato
4336168292	apple
4336168292	chocolate
4336168292	pecan
4336168292	pumpkin
4336164056	apple
4336164056	pumpkin
4336163908	apple
4336163908	pumpkin
4336163908	sweet potato
4336161556	apple
4336161556	pumpkin
4336146440	none
4336144357	apple
4336144357	pumpkin
4336142896	other
4336137995	pumpkin
4336137435	pumpkin
4336137098	pecan
4336137098	pumpkin
4336134461	apple
4336134461	chocolate
4336134461	key lime
4336134461	pecan
4336134461	pumpkin
4336134461	sweet potato
4336133522	pumpkin
4336133454	none
4336131533	apple
4336131533	pumpkin
4336131319	apple
4336131319	chocolate
4336131319	peach
4336131319	pecan
4336131319	pumpkin
4336131319	sweet potato
4336126090	apple
4336126090	pumpkin
4336125524	pecan
4336125524	other
4336121663	pumpkin
4336120894	apple
4336120894	key lime
4336120894	pumpkin
4336119647	apple
4336119647	pecan
4336119647	pumpkin
4336117281	apple
4336117281	pumpkin
4336117179	pecan
4336117179	pumpkin
4336111339	pecan
4336111339	pumpkin
4336111339	sweet potato
4336108209	buttermilk
4336108209	chocolate
4336108209	coconut cream
4336106089	pumpkin
4336106041	chocolate
4336106041	sweet potato
4336104179	pumpkin
4336103434	apple
4336103434	pumpkin
4336103319	apple
4336103319	cherry
4336103319	pecan
4336103319	pumpkin
4336101470	apple
4336101470	key lime
4336101470	pecan
4336101470	pumpkin
4336099044	pumpkin
4336098809	pumpkin
4336098809	other
4336093974	apple
4336093974	cherry
4336093974	pumpkin
4336092370	apple
4336092370	cherry
4336091474	cherry
4336090652	apple
4336090652	cherry
4336090652	chocolate
4336090652	key lime
4336090652	peach
4336090652	pecan
4336090652	pumpkin
4336090652	sweet potato
4336090652	other
4336090647	apple
4336090647	cherry
4336090647	pumpkin
4336090552	sweet potato
4336086559	apple
4336086559	pumpkin
4336085504	apple
4336085504	cherry
4336085504	pumpkin
4336085020	sweet potato
4336083561	chocolate
4336083443	apple
4336083443	pecan
4336083443	pumpkin
4336081481	chocolate
4336081481	pecan
4336081481	pumpkin
4336080517	pecan
4336080517	pumpkin
4336078959	apple
4336078959	pecan
4336078959	pumpkin
4336078481	apple
4336078481	pumpkin
4336078481	other
4336076367	apple
4336076367	pumpkin
4336076367	sweet potato
4336076365	chocolate
4336076365	peach
4336076323	buttermilk
4336076323	pecan
4336076323	pumpkin
4336074858	apple
4336074858	pumpkin
4336073613	apple
4336073613	pumpkin
4336073613	sweet potato
4336073270	apple
4336073270	pecan
4336070791	apple
4336070791	cherry
4336070791	pecan
4336070791	pumpkin
4336068292	apple
4336068292	pecan
4336068292	pumpkin
4336066162	cherry
4336066162	chocolate
4336065006	apple
4336065006	pecan
4336065006	pumpkin
4336062672	apple
4336062672	pumpkin
4336058499	pumpkin
4336057426	apple
4336057426	pumpkin
4336056145	apple
4336056145	chocolate
4336056145	pecan
4336056145	pumpkin
4336048135	pumpkin
4336048135	sweet potato
4336047575	pecan
4336047575	pumpkin
4336047405	pumpkin
4336041912	chocolate
4336041912	pumpkin
4336040902	none
4336040679	pecan
4336040679	none
4336040464	pumpkin
4336038370	apple
4336038370	pumpkin
4336037944	apple
4336037944	pecan
4336037944	pumpkin
4336037337	apple
4336037337	chocolate
4336036960	chocolate
4336036960	pumpkin
4336034694	apple
4336034694	pumpkin
4336033443	pecan
4336033443	pumpkin
4336030046	apple
4336030046	cherry
4336030046	chocolate
4336030046	pecan
4336030046	pumpkin
4336029825	apple
4336029825	chocolate
4336029825	pecan
4336029825	sweet potato
4336027932	pecan
4336027932	pumpkin
4336023531	pumpkin
4336022983	pecan
4336022372	none
4336022096	apple
4336022096	pecan
4336022096	pumpkin
4336021883	apple
4336021883	pumpkin
4336021180	pecan
4336021180	pumpkin
4336018601	other
4336017089	apple
4336017089	chocolate
4336016535	apple
4336016535	pumpkin
4336015865	apple
4336015865	pumpkin
4336015017	pumpkin
4336014587	pumpkin
4336014104	chocolate
4336014104	pecan
4336014104	sweet potato
4336012118	apple
4336012118	pumpkin
4336012118	other
4336012003	apple
4336012003	chocolate
4336012003	key lime
4336012003	pecan
4336012003	pumpkin
4336011166	pumpkin
4336006784	apple
4336006784	pumpkin
4336005220	apple
4336005220	pumpkin
4336002999	apple
4336002999	pumpkin
4336002487	apple
4336002487	buttermilk
4336002487	pumpkin
4336002487	sweet potato
4336001840	apple
4336001840	cherry
4336001840	pecan
4336001840	pumpkin
4336001546	apple
4335999720	apple
4335999720	pumpkin
4335998934	apple
4335998934	pecan
4335998934	pumpkin
4335996765	apple
4335996765	cherry
4335996765	pumpkin
4335996482	pumpkin
4335992962	pumpkin
4335992074	pecan
4335992074	pumpkin
4335990669	pumpkin
4335990002	apple
4335990002	pecan
4335990002	pumpkin
4335989591	apple
4335989591	pecan
4335988879	none
4335988400	pecan
4335988400	other
4335988391	apple
4335988391	pecan
4335988391	pumpkin
4335988189	apple
4335988189	chocolate
4335988189	pumpkin
4335987976	pumpkin
4335987642	pumpkin
4335987129	apple
4335987129	cherry
4335987129	chocolate
4335987129	pecan
4335987129	pumpkin
4335986817	apple
4335986817	pumpkin
4335985936	pumpkin
4335983992	cherry
4335983992	pumpkin
4335983559	apple
4335983559	cherry
4335983559	pecan
4335983559	pumpkin
4335982114	pumpkin
4335981269	pumpkin
4335981057	apple
4335981057	peach
4335981057	pecan
4335981057	pumpkin
4335979596	apple
4335979596	pumpkin
4335979419	apple
4335979419	pumpkin
4335978870	apple
4335978870	cherry
4335978870	pumpkin
4335977956	apple
4335977956	chocolate
4335977956	coconut cream
4335977956	pecan
4335977956	pumpkin
4335977956	other
4335977899	apple
4335977899	buttermilk
4335977899	peach
4335977899	pecan
4335977899	sweet potato
4335977124	other
4335976340	apple
4335976340	chocolate
4335976340	pecan
4335976340	pumpkin
4335975961	pumpkin
4335974428	apple
4335974363	chocolate
4335974363	pumpkin
4335974363	sweet potato
4335973959	pecan
4335973959	pumpkin
4335973714	buttermilk
4335973714	pumpkin
4335972801	apple
4335972801	pecan
4335971349	pumpkin
4335970729	coconut cream
4335970729	pecan
4335970729	pumpkin
4335970072	apple
4335970072	pecan
4335969513	pecan
4335969513	pumpkin
4335969513	sweet potato
4335967669	apple
4335967669	peach
4335967669	pumpkin
4335967669	other
4335967013	apple
4335967013	pumpkin
4335966421	apple
4335966421	pumpkin
4335966121	apple
4335966121	cherry
4335966121	chocolate
4335966121	peach
4335966121	pumpkin
4335965739	apple
4335965739	pecan
4335965542	pumpkin
4335964313	apple
4335964313	pumpkin
4335963222	apple
4335963222	pecan
4335963222	pumpkin
4335962733	buttermilk
4335962733	pecan
4335962733	pumpkin
4335961782	apple
4335961782	peach
4335961440	apple
4335960288	apple
4335960288	other
4335960105	apple
4335960105	pecan
4335960105	pumpkin
4335959876	pumpkin
4335959857	apple
4335959857	cherry
4335959857	pumpkin
4335958653	apple
4335958653	pecan
4335958653	pumpkin
4335958292	pumpkin
4335958005	apple
4335958005	pumpkin
4335957772	chocolate
4335957772	pumpkin
4335957772	sweet potato
4335957365	pecan
4335957179	apple
4335957179	pecan
4335957179	pumpkin
4335957096	apple
4335957096	chocolate
4335957096	pumpkin
4335957072	pumpkin
4335957072	sweet potato
4335955478	apple
4335955478	pumpkin
4335955206	apple
4335955152	apple
4335954681	pumpkin
4335954394	pumpkin
4335954376	pumpkin
4335954207	cherry
4335954207	key lime
4335954131	apple
4335954131	pecan
4335954131	pumpkin
4335953888	apple
4335953888	cherry
4335953888	chocolate
4335953888	pumpkin
4335952833	apple
4335952833	chocolate
4335952833	pumpkin
4335951505	apple
4335951505	pecan
4335951505	pumpkin
4335951505	sweet potato
4335951437	apple
4335951437	cherry
4335951437	pecan
4335951437	pumpkin
4335951082	none
4335950917	apple
4335950654	pecan
4335950654	pumpkin
4335949486	apple
4335949486	pecan
4335949486	pumpkin
4335949169	apple
4335949169	pecan
4335949169	pumpkin
4335949112	pumpkin
4335947496	apple
4335947496	key lime
4335945415	apple
4335945415	pumpkin
4335944854	pecan
4335944854	pumpkin
4335944082	pecan
4335944082	pumpkin
4335944082	sweet potato
4335943173	pumpkin
4335943060	apple
4335934708	coconut cream
4335894916	chocolate
\.


--
-- Data for Name: pie_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pie_other (id, pie_other) FROM stdin;
4337951949	derby, japanese fruit
4337929779	blueberry pie
4337698969	strawberry rhubarb
4337568074	lemon mirangue
4337531521	chess
4337318895	we serve pine nut cake not pie
4337235972	lemon maraigne, minch meat
4337165710	mincemeat
4337114697	cheesecak
4337112360	pecan, mincemeat
4337109688	peanut butter
4337073874	grass hopper
4337025357	rhubarb
4337021828	minced meat
4337013286	shoo fly pie 
4336988874	squash
4336971897	raspberry
4336962719	minced meat
4336957375	berry
4336945764	custard
4336931306	mincemeat 
4336921564	lemon
4336902332	peanut butter
4336901246	pumpkin cheesecake
4336888973	mint torte
4336876402	mincemeat 
4336875194	blueberry
4336867797	chess
4336853880	pecan 
4336836078	peanut butter
4336829185	pie with ice cream and whipped cream
4336823441	lemon merang
4336821332	lemon meringue
4336814310	pecan
4336802030	cherry
4336799337	mince meat
4336752791	rhubarb strawberry
4336749249	apricot
4336727141	banana cream
4336726144	german chocolate pecan
4336657464	cheesecake 
4336644693	sweet potato pie
4336643722	strawberry cream
4336643107	concord grape
4336639517	chess 
4336596402	lemon meringue 
4336593880	shoo fly
4336592653	lemon
4336540513	mincemeat
4336500591	blueberry
4336426326	cherry cheescake
4336376803	shoo fly
4336376443	mince meat
4336348590	cocunut custard
4336301847	mincemeat
4336271469	blueberry pie, banana cream pie
4336249082	french silk
4336181226	i don't know
4336176902	mince meat
4336142896	pumpkin chiffon
4336125524	homemade pumpkin pie
4336098809	chess
4336090652	ice box pie
4336078481	walnut
4336018601	pumpkin pecan
4336012118	jumbleberry
4335988400	custard
4335977956	pineapple cream pie 
4335977124	blueberry or peach cobbler
4335967669	berry
4335960288	usually some other pie along with an apple pie
\.


--
-- Data for Name: side_dish; Type: TABLE DATA; Schema: public; Owner: -
--

COPY side_dish (id, side) FROM stdin;
4337954960	carrots
4337954960	green beans/green bean casserole
4337954960	macaroni and cheese
4337954960	mashed potatoes
4337954960	yams/sweet potato casserole
4337951949	corn
4337951949	green beans/green bean casserole
4337951949	macaroni and cheese
4337951949	mashed potatoes
4337951949	rolls/biscuits
4337951949	vegetable salad
4337951949	yams/sweet potato casserole
4337951949	other
4337935621	brussel sprouts
4337935621	carrots
4337935621	cauliflower
4337935621	corn
4337935621	cornbread
4337935621	mashed potatoes
4337935621	rolls/biscuits
4337935621	vegetable salad
4337933040	brussel sprouts
4337933040	cornbread
4337933040	mashed potatoes
4337933040	rolls/biscuits
4337933040	vegetable salad
4337933040	yams/sweet potato casserole
4337931983	brussel sprouts
4337931983	cornbread
4337931983	mashed potatoes
4337931983	rolls/biscuits
4337931983	squash
4337931983	vegetable salad
4337931983	yams/sweet potato casserole
4337929779	brussel sprouts
4337929779	carrots
4337929779	cauliflower
4337929779	corn
4337929779	cornbread
4337929779	fruit salad
4337929779	green beans/green bean casserole
4337929779	macaroni and cheese
4337929779	mashed potatoes
4337929779	rolls/biscuits
4337929779	squash
4337929779	vegetable salad
4337929779	yams/sweet potato casserole
4337924420	fruit salad
4337924420	green beans/green bean casserole
4337924420	mashed potatoes
4337924420	rolls/biscuits
4337924420	yams/sweet potato casserole
4337916002	carrots
4337914977	brussel sprouts
4337914977	corn
4337914977	cornbread
4337914977	green beans/green bean casserole
4337914977	mashed potatoes
4337914977	rolls/biscuits
4337914977	squash
4337899817	brussel sprouts
4337899817	carrots
4337899817	green beans/green bean casserole
4337899817	mashed potatoes
4337899817	rolls/biscuits
4337899817	yams/sweet potato casserole
4337893416	corn
4337893416	macaroni and cheese
4337893416	mashed potatoes
4337893416	rolls/biscuits
4337888291	corn
4337888291	cornbread
4337888291	mashed potatoes
4337888291	rolls/biscuits
4337888291	yams/sweet potato casserole
4337878450	mashed potatoes
4337878450	rolls/biscuits
4337878450	vegetable salad
4337878351	corn
4337878351	green beans/green bean casserole
4337878351	mashed potatoes
4337878351	rolls/biscuits
4337878351	vegetable salad
4337878351	yams/sweet potato casserole
4337857295	green beans/green bean casserole
4337857295	macaroni and cheese
4337857295	yams/sweet potato casserole
4337856362	corn
4337856362	cornbread
4337856362	green beans/green bean casserole
4337856362	mashed potatoes
4337856362	rolls/biscuits
4337856362	squash
4337856362	yams/sweet potato casserole
4337854106	carrots
4337854106	corn
4337854106	mashed potatoes
4337854106	rolls/biscuits
4337854106	vegetable salad
4337844879	fruit salad
4337844879	vegetable salad
4337844879	yams/sweet potato casserole
4337823612	corn
4337823612	green beans/green bean casserole
4337823612	mashed potatoes
4337823612	rolls/biscuits
4337820281	brussel sprouts
4337820281	corn
4337820281	cornbread
4337820281	green beans/green bean casserole
4337820281	mashed potatoes
4337820281	rolls/biscuits
4337820281	yams/sweet potato casserole
4337813502	cauliflower
4337813502	corn
4337813502	cornbread
4337793158	carrots
4337793158	cauliflower
4337792130	green beans/green bean casserole
4337792130	mashed potatoes
4337792130	rolls/biscuits
4337790002	brussel sprouts
4337790002	carrots
4337790002	cauliflower
4337790002	corn
4337790002	cornbread
4337790002	green beans/green bean casserole
4337790002	mashed potatoes
4337790002	rolls/biscuits
4337790002	squash
4337790002	yams/sweet potato casserole
4337783794	brussel sprouts
4337783794	carrots
4337783794	green beans/green bean casserole
4337783794	mashed potatoes
4337783794	rolls/biscuits
4337779071	cornbread
4337779071	green beans/green bean casserole
4337779071	macaroni and cheese
4337779071	mashed potatoes
4337779071	rolls/biscuits
4337779071	yams/sweet potato casserole
4337778119	brussel sprouts
4337778119	carrots
4337778119	green beans/green bean casserole
4337778119	mashed potatoes
4337778119	yams/sweet potato casserole
4337774090	corn
4337774090	green beans/green bean casserole
4337774090	mashed potatoes
4337774090	rolls/biscuits
4337774090	vegetable salad
4337772882	mashed potatoes
4337772882	rolls/biscuits
4337772882	squash
4337772882	vegetable salad
4337772193	brussel sprouts
4337772193	corn
4337772193	cornbread
4337772193	green beans/green bean casserole
4337772193	mashed potatoes
4337772193	rolls/biscuits
4337772193	vegetable salad
4337772193	yams/sweet potato casserole
4337771439	brussel sprouts
4337771439	carrots
4337771439	corn
4337771439	cornbread
4337771439	green beans/green bean casserole
4337771439	mashed potatoes
4337771439	rolls/biscuits
4337771439	squash
4337771439	vegetable salad
4337771439	yams/sweet potato casserole
4337763296	green beans/green bean casserole
4337763296	macaroni and cheese
4337763296	rolls/biscuits
4337763296	yams/sweet potato casserole
4337758789	green beans/green bean casserole
4337758789	mashed potatoes
4337758789	rolls/biscuits
4337758789	yams/sweet potato casserole
4337747968	carrots
4337747968	cauliflower
4337747968	corn
4337747968	cornbread
4337747968	green beans/green bean casserole
4337747968	macaroni and cheese
4337747968	mashed potatoes
4337747968	rolls/biscuits
4337747968	squash
4337747968	vegetable salad
4337747968	yams/sweet potato casserole
4337743121	brussel sprouts
4337743121	corn
4337743121	macaroni and cheese
4337743121	mashed potatoes
4337743121	rolls/biscuits
4337732348	carrots
4337732348	corn
4337732348	cornbread
4337732348	mashed potatoes
4337732348	rolls/biscuits
4337732348	squash
4337732348	yams/sweet potato casserole
4337731242	carrots
4337731242	cornbread
4337731242	fruit salad
4337719588	corn
4337719588	green beans/green bean casserole
4337719588	macaroni and cheese
4337719588	mashed potatoes
4337719588	squash
4337719588	yams/sweet potato casserole
4337698969	mashed potatoes
4337698969	rolls/biscuits
4337698969	yams/sweet potato casserole
4337698743	cauliflower
4337698743	corn
4337698743	green beans/green bean casserole
4337698743	rolls/biscuits
4337698743	yams/sweet potato casserole
4337660047	carrots
4337660047	cauliflower
4337660047	corn
4337660047	cornbread
4337660047	fruit salad
4337660047	green beans/green bean casserole
4337660047	macaroni and cheese
4337660047	mashed potatoes
4337660047	rolls/biscuits
4337660047	vegetable salad
4337660047	yams/sweet potato casserole
4337655425	cornbread
4337655425	green beans/green bean casserole
4337655425	mashed potatoes
4337655425	rolls/biscuits
4337653684	brussel sprouts
4337653684	cornbread
4337653684	fruit salad
4337653684	green beans/green bean casserole
4337653684	mashed potatoes
4337653684	rolls/biscuits
4337653684	vegetable salad
4337646565	brussel sprouts
4337646565	green beans/green bean casserole
4337646565	mashed potatoes
4337646565	rolls/biscuits
4337629524	corn
4337629524	green beans/green bean casserole
4337629524	mashed potatoes
4337629524	yams/sweet potato casserole
4337627331	brussel sprouts
4337627331	mashed potatoes
4337627331	yams/sweet potato casserole
4337626849	carrots
4337626849	green beans/green bean casserole
4337626849	rolls/biscuits
4337626849	yams/sweet potato casserole
4337611941	corn
4337611941	fruit salad
4337611941	green beans/green bean casserole
4337611941	mashed potatoes
4337611941	rolls/biscuits
4337611941	yams/sweet potato casserole
4337600726	carrots
4337600726	corn
4337600726	green beans/green bean casserole
4337600726	mashed potatoes
4337600726	rolls/biscuits
4337600726	vegetable salad
4337598069	carrots
4337598069	corn
4337598069	fruit salad
4337598069	green beans/green bean casserole
4337598069	mashed potatoes
4337598069	rolls/biscuits
4337598069	squash
4337598069	vegetable salad
4337598069	yams/sweet potato casserole
4337597044	green beans/green bean casserole
4337597044	mashed potatoes
4337597044	rolls/biscuits
4337597044	yams/sweet potato casserole
4337589613	green beans/green bean casserole
4337589613	macaroni and cheese
4337589613	yams/sweet potato casserole
4337586061	cauliflower
4337586061	cornbread
4337586061	green beans/green bean casserole
4337586061	macaroni and cheese
4337586061	mashed potatoes
4337586061	rolls/biscuits
4337586061	yams/sweet potato casserole
4337583393	carrots
4337583393	corn
4337583393	green beans/green bean casserole
4337583393	mashed potatoes
4337583393	rolls/biscuits
4337583393	squash
4337583393	yams/sweet potato casserole
4337583245	mashed potatoes
4337583245	rolls/biscuits
4337583245	other
4337582845	corn
4337582845	mashed potatoes
4337582845	rolls/biscuits
4337582845	squash
4337582845	yams/sweet potato casserole
4337577784	corn
4337577784	green beans/green bean casserole
4337577784	mashed potatoes
4337577784	yams/sweet potato casserole
4337569645	corn
4337569645	green beans/green bean casserole
4337569645	macaroni and cheese
4337569645	mashed potatoes
4337569645	rolls/biscuits
4337569645	yams/sweet potato casserole
4337569645	other
4337569057	carrots
4337569057	corn
4337569057	mashed potatoes
4337568074	fruit salad
4337568074	green beans/green bean casserole
4337568074	mashed potatoes
4337568074	rolls/biscuits
4337568074	other
4337553422	green beans/green bean casserole
4337553422	macaroni and cheese
4337553422	mashed potatoes
4337553422	rolls/biscuits
4337550299	carrots
4337550299	corn
4337550299	cornbread
4337550299	green beans/green bean casserole
4337550299	macaroni and cheese
4337550299	mashed potatoes
4337550299	rolls/biscuits
4337550299	squash
4337550299	vegetable salad
4337550299	yams/sweet potato casserole
4337545841	brussel sprouts
4337545841	carrots
4337545841	cauliflower
4337545841	corn
4337545841	green beans/green bean casserole
4337545841	macaroni and cheese
4337545841	mashed potatoes
4337545841	rolls/biscuits
4337545841	vegetable salad
4337545841	yams/sweet potato casserole
4337540484	carrots
4337540484	mashed potatoes
4337531521	corn
4337531521	green beans/green bean casserole
4337531521	mashed potatoes
4337531521	rolls/biscuits
4337531521	yams/sweet potato casserole
4337528775	corn
4337528775	cornbread
4337528775	green beans/green bean casserole
4337528775	macaroni and cheese
4337528775	mashed potatoes
4337528775	rolls/biscuits
4337528775	yams/sweet potato casserole
4337512214	corn
4337512214	cornbread
4337512214	mashed potatoes
4337512214	rolls/biscuits
4337512214	yams/sweet potato casserole
4337490067	brussel sprouts
4337490067	mashed potatoes
4337490067	squash
4337490067	yams/sweet potato casserole
4337489617	corn
4337489617	green beans/green bean casserole
4337489617	macaroni and cheese
4337489617	mashed potatoes
4337489617	rolls/biscuits
4337487759	corn
4337487759	cornbread
4337487759	green beans/green bean casserole
4337487759	macaroni and cheese
4337487759	mashed potatoes
4337487759	rolls/biscuits
4337484305	brussel sprouts
4337484305	corn
4337484305	green beans/green bean casserole
4337484305	mashed potatoes
4337484305	rolls/biscuits
4337484305	yams/sweet potato casserole
4337475288	carrots
4337475288	green beans/green bean casserole
4337475288	mashed potatoes
4337475288	vegetable salad
4337468268	mashed potatoes
4337468268	squash
4337468268	vegetable salad
4337467677	cauliflower
4337467677	mashed potatoes
4337467677	rolls/biscuits
4337467677	vegetable salad
4337448181	corn
4337448181	fruit salad
4337448181	green beans/green bean casserole
4337448181	mashed potatoes
4337448181	rolls/biscuits
4337442451	corn
4337442451	fruit salad
4337442451	green beans/green bean casserole
4337442451	mashed potatoes
4337442451	rolls/biscuits
4337442451	yams/sweet potato casserole
4337441164	cauliflower
4337441164	corn
4337441164	green beans/green bean casserole
4337441164	mashed potatoes
4337441164	rolls/biscuits
4337441164	yams/sweet potato casserole
4337441070	corn
4337441070	cornbread
4337441070	green beans/green bean casserole
4337441070	mashed potatoes
4337441070	rolls/biscuits
4337441070	yams/sweet potato casserole
4337435277	corn
4337435277	green beans/green bean casserole
4337435277	mashed potatoes
4337435277	squash
4337432686	corn
4337432686	mashed potatoes
4337432686	rolls/biscuits
4337432686	yams/sweet potato casserole
4337429102	corn
4337429102	cornbread
4337429102	green beans/green bean casserole
4337429102	macaroni and cheese
4337429102	mashed potatoes
4337429102	rolls/biscuits
4337429102	yams/sweet potato casserole
4337423740	brussel sprouts
4337423740	corn
4337423740	cornbread
4337423740	green beans/green bean casserole
4337423740	squash
4337421462	brussel sprouts
4337421462	fruit salad
4337421462	green beans/green bean casserole
4337421462	rolls/biscuits
4337421462	squash
4337421462	vegetable salad
4337421462	yams/sweet potato casserole
4337412056	carrots
4337412056	corn
4337412056	cornbread
4337412056	green beans/green bean casserole
4337412056	mashed potatoes
4337412056	rolls/biscuits
4337412056	yams/sweet potato casserole
4337409281	corn
4337409281	cornbread
4337409281	green beans/green bean casserole
4337409281	mashed potatoes
4337409281	rolls/biscuits
4337409281	yams/sweet potato casserole
4337400534	green beans/green bean casserole
4337400534	mashed potatoes
4337400534	rolls/biscuits
4337400534	yams/sweet potato casserole
4337395533	carrots
4337395533	cauliflower
4337395533	corn
4337395533	macaroni and cheese
4337395533	mashed potatoes
4337395533	rolls/biscuits
4337395533	squash
4337391263	brussel sprouts
4337391263	carrots
4337391263	corn
4337391263	cornbread
4337391263	green beans/green bean casserole
4337391263	mashed potatoes
4337391263	rolls/biscuits
4337391263	vegetable salad
4337391263	yams/sweet potato casserole
4337390930	corn
4337390930	green beans/green bean casserole
4337390930	macaroni and cheese
4337390930	mashed potatoes
4337390930	rolls/biscuits
4337390930	yams/sweet potato casserole
4337390728	corn
4337390728	green beans/green bean casserole
4337390728	mashed potatoes
4337390728	rolls/biscuits
4337390728	squash
4337386038	corn
4337386038	green beans/green bean casserole
4337386038	mashed potatoes
4337386038	rolls/biscuits
4337386038	squash
4337384089	corn
4337384089	cornbread
4337384089	green beans/green bean casserole
4337384089	macaroni and cheese
4337384089	mashed potatoes
4337384089	yams/sweet potato casserole
4337382350	corn
4337382350	green beans/green bean casserole
4337382350	mashed potatoes
4337382350	rolls/biscuits
4337380720	corn
4337380720	mashed potatoes
4337369789	corn
4337369789	green beans/green bean casserole
4337369789	macaroni and cheese
4337369789	mashed potatoes
4337369789	rolls/biscuits
4337369789	vegetable salad
4337369789	yams/sweet potato casserole
4337365738	fruit salad
4337365738	mashed potatoes
4337365738	rolls/biscuits
4337365738	yams/sweet potato casserole
4337360752	brussel sprouts
4337360752	cornbread
4337360752	green beans/green bean casserole
4337360752	mashed potatoes
4337360752	rolls/biscuits
4337360752	yams/sweet potato casserole
4337360389	brussel sprouts
4337360389	carrots
4337360389	mashed potatoes
4337360389	rolls/biscuits
4337360389	yams/sweet potato casserole
4337356672	mashed potatoes
4337356672	rolls/biscuits
4337356672	yams/sweet potato casserole
4337347655	corn
4337347655	green beans/green bean casserole
4337347655	mashed potatoes
4337347655	rolls/biscuits
4337347655	squash
4337346312	corn
4337346312	cornbread
4337346312	fruit salad
4337346312	green beans/green bean casserole
4337346312	macaroni and cheese
4337346312	mashed potatoes
4337346312	rolls/biscuits
4337346312	yams/sweet potato casserole
4337343090	mashed potatoes
4337343090	yams/sweet potato casserole
4337336787	carrots
4337336787	cauliflower
4337336787	green beans/green bean casserole
4337336787	macaroni and cheese
4337336787	mashed potatoes
4337336787	rolls/biscuits
4337336787	yams/sweet potato casserole
4337336262	vegetable salad
4337333159	corn
4337333159	cornbread
4337333159	fruit salad
4337333159	green beans/green bean casserole
4337333159	mashed potatoes
4337333159	rolls/biscuits
4337333159	yams/sweet potato casserole
4337324697	cornbread
4337324697	mashed potatoes
4337324697	rolls/biscuits
4337323392	carrots
4337323392	corn
4337323392	green beans/green bean casserole
4337323392	mashed potatoes
4337323392	rolls/biscuits
4337323392	yams/sweet potato casserole
4337319123	green beans/green bean casserole
4337319123	mashed potatoes
4337319123	yams/sweet potato casserole
4337318895	green beans/green bean casserole
4337318895	mashed potatoes
4337318895	yams/sweet potato casserole
4337311256	carrots
4337311256	corn
4337311256	fruit salad
4337311256	green beans/green bean casserole
4337311256	rolls/biscuits
4337311256	vegetable salad
4337311256	yams/sweet potato casserole
4337310361	green beans/green bean casserole
4337310361	mashed potatoes
4337310361	rolls/biscuits
4337310361	yams/sweet potato casserole
4337309060	brussel sprouts
4337309060	carrots
4337309060	corn
4337309060	cornbread
4337309060	green beans/green bean casserole
4337309060	mashed potatoes
4337309060	rolls/biscuits
4337309060	vegetable salad
4337296029	cauliflower
4337296029	green beans/green bean casserole
4337296029	mashed potatoes
4337296029	rolls/biscuits
4337296029	yams/sweet potato casserole
4337292895	corn
4337292895	mashed potatoes
4337292895	rolls/biscuits
4337287733	green beans/green bean casserole
4337287733	mashed potatoes
4337287733	rolls/biscuits
4337284552	green beans/green bean casserole
4337284552	macaroni and cheese
4337284552	mashed potatoes
4337284552	rolls/biscuits
4337275528	carrots
4337275528	corn
4337275528	cornbread
4337275528	fruit salad
4337275528	green beans/green bean casserole
4337275528	macaroni and cheese
4337275528	mashed potatoes
4337275528	rolls/biscuits
4337275528	yams/sweet potato casserole
4337262725	brussel sprouts
4337262725	green beans/green bean casserole
4337262725	mashed potatoes
4337262725	rolls/biscuits
4337262725	yams/sweet potato casserole
4337256857	corn
4337256857	green beans/green bean casserole
4337256857	mashed potatoes
4337256857	rolls/biscuits
4337256857	other
4337249904	brussel sprouts
4337249904	carrots
4337249904	cauliflower
4337249904	cornbread
4337249904	green beans/green bean casserole
4337249904	mashed potatoes
4337249904	yams/sweet potato casserole
4337249904	other
4337247953	carrots
4337247953	corn
4337247953	green beans/green bean casserole
4337247953	mashed potatoes
4337247953	rolls/biscuits
4337247953	yams/sweet potato casserole
4337235972	carrots
4337235972	corn
4337235972	fruit salad
4337235972	green beans/green bean casserole
4337235972	mashed potatoes
4337235972	rolls/biscuits
4337235972	yams/sweet potato casserole
4337235398	carrots
4337235398	corn
4337235398	cornbread
4337235398	green beans/green bean casserole
4337235398	macaroni and cheese
4337235398	mashed potatoes
4337235398	rolls/biscuits
4337235398	yams/sweet potato casserole
4337229414	brussel sprouts
4337229414	carrots
4337229414	fruit salad
4337229414	mashed potatoes
4337229414	rolls/biscuits
4337229414	squash
4337229414	vegetable salad
4337225703	carrots
4337225703	corn
4337225703	green beans/green bean casserole
4337225703	macaroni and cheese
4337225703	mashed potatoes
4337225703	squash
4337220006	carrots
4337220006	corn
4337220006	macaroni and cheese
4337220006	mashed potatoes
4337220006	rolls/biscuits
4337220006	vegetable salad
4337217411	carrots
4337217411	corn
4337217411	fruit salad
4337217411	green beans/green bean casserole
4337217411	mashed potatoes
4337217411	rolls/biscuits
4337217411	yams/sweet potato casserole
4337202264	corn
4337202264	fruit salad
4337202264	mashed potatoes
4337202264	rolls/biscuits
4337202264	yams/sweet potato casserole
4337201482	green beans/green bean casserole
4337201482	mashed potatoes
4337201482	rolls/biscuits
4337201482	vegetable salad
4337201482	yams/sweet potato casserole
4337195940	corn
4337195940	fruit salad
4337195940	green beans/green bean casserole
4337195940	mashed potatoes
4337195940	rolls/biscuits
4337195940	yams/sweet potato casserole
4337191550	carrots
4337191550	green beans/green bean casserole
4337191550	macaroni and cheese
4337191550	mashed potatoes
4337191550	rolls/biscuits
4337190953	corn
4337190953	cornbread
4337190953	fruit salad
4337190953	macaroni and cheese
4337190953	mashed potatoes
4337190953	rolls/biscuits
4337190953	yams/sweet potato casserole
4337188006	vegetable salad
4337184092	brussel sprouts
4337184092	cauliflower
4337184092	rolls/biscuits
4337183363	green beans/green bean casserole
4337183363	mashed potatoes
4337183363	rolls/biscuits
4337183363	squash
4337183363	yams/sweet potato casserole
4337168468	brussel sprouts
4337168468	fruit salad
4337168468	green beans/green bean casserole
4337168468	mashed potatoes
4337168468	rolls/biscuits
4337168468	vegetable salad
4337168468	yams/sweet potato casserole
4337165710	corn
4337165710	mashed potatoes
4337165710	rolls/biscuits
4337165710	yams/sweet potato casserole
4337164060	mashed potatoes
4337164060	rolls/biscuits
4337164060	squash
4337164060	yams/sweet potato casserole
4337164060	other
4337163790	green beans/green bean casserole
4337163790	vegetable salad
4337163790	yams/sweet potato casserole
4337163790	other
4337162131	fruit salad
4337162131	green beans/green bean casserole
4337162131	mashed potatoes
4337162131	rolls/biscuits
4337162131	vegetable salad
4337162131	yams/sweet potato casserole
4337161591	corn
4337161591	green beans/green bean casserole
4337161591	macaroni and cheese
4337161591	mashed potatoes
4337161591	rolls/biscuits
4337161591	vegetable salad
4337160605	mashed potatoes
4337160605	rolls/biscuits
4337160605	other
4337160531	brussel sprouts
4337160531	corn
4337160531	green beans/green bean casserole
4337160531	mashed potatoes
4337160531	vegetable salad
4337160531	yams/sweet potato casserole
4337160291	corn
4337160291	cornbread
4337160291	green beans/green bean casserole
4337160291	macaroni and cheese
4337160291	mashed potatoes
4337160291	rolls/biscuits
4337160291	vegetable salad
4337160291	yams/sweet potato casserole
4337159183	corn
4337159183	green beans/green bean casserole
4337159183	mashed potatoes
4337159183	rolls/biscuits
4337159183	yams/sweet potato casserole
4337155647	brussel sprouts
4337155647	carrots
4337155647	corn
4337155647	fruit salad
4337155647	green beans/green bean casserole
4337155647	mashed potatoes
4337155647	rolls/biscuits
4337155647	squash
4337153385	fruit salad
4337153385	green beans/green bean casserole
4337153385	mashed potatoes
4337153385	rolls/biscuits
4337153385	vegetable salad
4337153385	yams/sweet potato casserole
4337153198	corn
4337153198	green beans/green bean casserole
4337153198	mashed potatoes
4337153198	rolls/biscuits
4337153198	yams/sweet potato casserole
4337153195	carrots
4337153195	corn
4337153195	cornbread
4337153195	fruit salad
4337153195	green beans/green bean casserole
4337153195	macaroni and cheese
4337153195	mashed potatoes
4337153195	rolls/biscuits
4337153195	yams/sweet potato casserole
4337150198	brussel sprouts
4337150198	green beans/green bean casserole
4337150198	mashed potatoes
4337150198	rolls/biscuits
4337150198	squash
4337150198	vegetable salad
4337149818	green beans/green bean casserole
4337149818	macaroni and cheese
4337149818	mashed potatoes
4337149818	rolls/biscuits
4337149818	yams/sweet potato casserole
4337149818	other
4337147145	green beans/green bean casserole
4337147145	macaroni and cheese
4337147145	mashed potatoes
4337147145	rolls/biscuits
4337147145	yams/sweet potato casserole
4337145918	brussel sprouts
4337145918	green beans/green bean casserole
4337145918	mashed potatoes
4337145918	rolls/biscuits
4337145918	yams/sweet potato casserole
4337143515	cornbread
4337143515	green beans/green bean casserole
4337143515	mashed potatoes
4337143515	rolls/biscuits
4337143515	squash
4337143515	yams/sweet potato casserole
4337142309	green beans/green bean casserole
4337142309	mashed potatoes
4337142309	rolls/biscuits
4337142309	yams/sweet potato casserole
4337139981	green beans/green bean casserole
4337139981	mashed potatoes
4337139981	rolls/biscuits
4337139981	yams/sweet potato casserole
4337139366	cornbread
4337139366	fruit salad
4337139327	corn
4337139327	cornbread
4337139327	fruit salad
4337139327	green beans/green bean casserole
4337139327	macaroni and cheese
4337139327	mashed potatoes
4337139327	rolls/biscuits
4337139127	corn
4337139127	green beans/green bean casserole
4337139127	rolls/biscuits
4337139127	yams/sweet potato casserole
4337138407	brussel sprouts
4337138407	mashed potatoes
4337138407	rolls/biscuits
4337138407	yams/sweet potato casserole
4337137158	corn
4337137158	cornbread
4337137158	green beans/green bean casserole
4337137158	mashed potatoes
4337137158	rolls/biscuits
4337137158	yams/sweet potato casserole
4337137158	other
4337136775	fruit salad
4337136775	mashed potatoes
4337136775	vegetable salad
4337136301	brussel sprouts
4337136301	carrots
4337136301	green beans/green bean casserole
4337136301	mashed potatoes
4337136301	rolls/biscuits
4337135261	fruit salad
4337135261	green beans/green bean casserole
4337135261	macaroni and cheese
4337135261	mashed potatoes
4337135261	rolls/biscuits
4337135261	yams/sweet potato casserole
4337131392	carrots
4337131392	corn
4337131392	green beans/green bean casserole
4337131392	mashed potatoes
4337131392	rolls/biscuits
4337131392	vegetable salad
4337131392	yams/sweet potato casserole
4337127124	cauliflower
4337127124	corn
4337127124	green beans/green bean casserole
4337127124	mashed potatoes
4337127124	rolls/biscuits
4337127124	vegetable salad
4337127124	yams/sweet potato casserole
4337120626	brussel sprouts
4337120626	corn
4337120626	fruit salad
4337120626	green beans/green bean casserole
4337120626	mashed potatoes
4337120626	rolls/biscuits
4337120626	vegetable salad
4337117868	corn
4337117868	fruit salad
4337117868	green beans/green bean casserole
4337117868	mashed potatoes
4337117868	rolls/biscuits
4337117868	vegetable salad
4337117868	yams/sweet potato casserole
4337117491	macaroni and cheese
4337117491	mashed potatoes
4337117491	rolls/biscuits
4337117491	yams/sweet potato casserole
4337117491	other
4337117150	corn
4337117150	cornbread
4337117150	mashed potatoes
4337117150	rolls/biscuits
4337114976	green beans/green bean casserole
4337114976	macaroni and cheese
4337114976	mashed potatoes
4337114976	rolls/biscuits
4337114976	vegetable salad
4337114697	carrots
4337114697	green beans/green bean casserole
4337114697	mashed potatoes
4337114697	rolls/biscuits
4337114697	yams/sweet potato casserole
4337114484	carrots
4337114484	fruit salad
4337114484	green beans/green bean casserole
4337114484	macaroni and cheese
4337114484	mashed potatoes
4337114484	rolls/biscuits
4337114484	yams/sweet potato casserole
4337113072	corn
4337113072	mashed potatoes
4337113072	rolls/biscuits
4337113072	yams/sweet potato casserole
4337112360	fruit salad
4337112360	green beans/green bean casserole
4337112360	rolls/biscuits
4337112360	yams/sweet potato casserole
4337111695	rolls/biscuits
4337110217	green beans/green bean casserole
4337110217	mashed potatoes
4337110217	yams/sweet potato casserole
4337109688	fruit salad
4337109688	green beans/green bean casserole
4337109688	mashed potatoes
4337109688	rolls/biscuits
4337109688	vegetable salad
4337109688	yams/sweet potato casserole
4337108113	corn
4337108113	green beans/green bean casserole
4337108113	macaroni and cheese
4337108113	mashed potatoes
4337108113	rolls/biscuits
4337108113	yams/sweet potato casserole
4337107692	cauliflower
4337107692	green beans/green bean casserole
4337107692	mashed potatoes
4337107692	rolls/biscuits
4337107492	green beans/green bean casserole
4337107492	mashed potatoes
4337107492	yams/sweet potato casserole
4337107135	corn
4337107135	green beans/green bean casserole
4337107135	mashed potatoes
4337107135	rolls/biscuits
4337107135	yams/sweet potato casserole
4337106266	corn
4337106266	green beans/green bean casserole
4337106266	mashed potatoes
4337106266	vegetable salad
4337106266	yams/sweet potato casserole
4337100681	green beans/green bean casserole
4337100681	mashed potatoes
4337100681	rolls/biscuits
4337100638	brussel sprouts
4337100638	green beans/green bean casserole
4337100638	mashed potatoes
4337100638	squash
4337098925	fruit salad
4337098925	green beans/green bean casserole
4337098925	mashed potatoes
4337098925	rolls/biscuits
4337098925	yams/sweet potato casserole
4337097777	corn
4337097777	green beans/green bean casserole
4337097777	mashed potatoes
4337097777	rolls/biscuits
4337097777	vegetable salad
4337097777	yams/sweet potato casserole
4337096669	brussel sprouts
4337096669	cauliflower
4337094254	brussel sprouts
4337094254	vegetable salad
4337094254	yams/sweet potato casserole
4337091880	carrots
4337091880	corn
4337091880	green beans/green bean casserole
4337091880	mashed potatoes
4337091880	rolls/biscuits
4337091880	yams/sweet potato casserole
4337089256	corn
4337089256	fruit salad
4337089256	rolls/biscuits
4337089256	vegetable salad
4337087412	carrots
4337087412	cauliflower
4337087412	mashed potatoes
4337087412	rolls/biscuits
4337087412	yams/sweet potato casserole
4337087325	green beans/green bean casserole
4337087325	rolls/biscuits
4337087325	yams/sweet potato casserole
4337086635	carrots
4337086635	cauliflower
4337086635	corn
4337086635	green beans/green bean casserole
4337086635	mashed potatoes
4337086635	rolls/biscuits
4337086635	squash
4337086635	yams/sweet potato casserole
4337084799	corn
4337084799	fruit salad
4337084799	green beans/green bean casserole
4337084799	macaroni and cheese
4337084799	mashed potatoes
4337084799	rolls/biscuits
4337084799	yams/sweet potato casserole
4337083360	green beans/green bean casserole
4337083360	mashed potatoes
4337083360	vegetable salad
4337083128	corn
4337083128	green beans/green bean casserole
4337083128	mashed potatoes
4337083128	rolls/biscuits
4337083128	yams/sweet potato casserole
4337078951	brussel sprouts
4337078951	carrots
4337078951	cauliflower
4337078951	corn
4337078951	green beans/green bean casserole
4337078951	mashed potatoes
4337078951	rolls/biscuits
4337078449	corn
4337078449	green beans/green bean casserole
4337078449	mashed potatoes
4337078449	rolls/biscuits
4337078449	yams/sweet potato casserole
4337075743	fruit salad
4337075743	green beans/green bean casserole
4337075743	mashed potatoes
4337075743	rolls/biscuits
4337075743	yams/sweet potato casserole
4337074360	carrots
4337074360	corn
4337074360	fruit salad
4337074360	green beans/green bean casserole
4337074360	mashed potatoes
4337074360	rolls/biscuits
4337074360	squash
4337074187	cornbread
4337074187	fruit salad
4337074187	green beans/green bean casserole
4337074187	mashed potatoes
4337074187	rolls/biscuits
4337074187	yams/sweet potato casserole
4337073874	green beans/green bean casserole
4337073874	mashed potatoes
4337073874	rolls/biscuits
4337073874	squash
4337073874	yams/sweet potato casserole
4337071166	brussel sprouts
4337071166	corn
4337071166	fruit salad
4337071166	mashed potatoes
4337071166	rolls/biscuits
4337071166	yams/sweet potato casserole
4337070275	fruit salad
4337070275	green beans/green bean casserole
4337070275	mashed potatoes
4337070275	rolls/biscuits
4337070275	yams/sweet potato casserole
4337069914	fruit salad
4337069914	green beans/green bean casserole
4337069914	mashed potatoes
4337069914	rolls/biscuits
4337069914	yams/sweet potato casserole
4337068413	corn
4337068413	green beans/green bean casserole
4337068413	mashed potatoes
4337068413	rolls/biscuits
4337064141	vegetable salad
4337064141	other
4337063427	corn
4337063427	cornbread
4337063427	green beans/green bean casserole
4337063427	macaroni and cheese
4337063427	mashed potatoes
4337063427	rolls/biscuits
4337063427	yams/sweet potato casserole
4337061732	cornbread
4337061732	macaroni and cheese
4337061732	mashed potatoes
4337061732	rolls/biscuits
4337061732	yams/sweet potato casserole
4337061177	brussel sprouts
4337061177	corn
4337061177	green beans/green bean casserole
4337061177	mashed potatoes
4337061177	rolls/biscuits
4337061177	vegetable salad
4337061177	yams/sweet potato casserole
4337061177	other
4337058651	fruit salad
4337058651	green beans/green bean casserole
4337058651	macaroni and cheese
4337058651	mashed potatoes
4337058651	rolls/biscuits
4337058651	yams/sweet potato casserole
4337056155	brussel sprouts
4337056155	carrots
4337056155	corn
4337056155	mashed potatoes
4337056155	rolls/biscuits
4337056155	yams/sweet potato casserole
4337053889	corn
4337053889	green beans/green bean casserole
4337053889	mashed potatoes
4337053889	rolls/biscuits
4337053889	yams/sweet potato casserole
4337053842	corn
4337053842	cornbread
4337053842	mashed potatoes
4337053842	rolls/biscuits
4337053842	squash
4337053842	yams/sweet potato casserole
4337053465	cornbread
4337053465	green beans/green bean casserole
4337053465	macaroni and cheese
4337053465	mashed potatoes
4337053465	rolls/biscuits
4337053135	green beans/green bean casserole
4337053135	mashed potatoes
4337053135	rolls/biscuits
4337053135	squash
4337053135	yams/sweet potato casserole
4337050973	brussel sprouts
4337050973	cornbread
4337050973	green beans/green bean casserole
4337050973	mashed potatoes
4337050973	rolls/biscuits
4337050973	vegetable salad
4337050187	carrots
4337050187	corn
4337050187	macaroni and cheese
4337050187	mashed potatoes
4337050187	rolls/biscuits
4337050187	vegetable salad
4337050187	yams/sweet potato casserole
4337049485	carrots
4337049485	corn
4337049485	green beans/green bean casserole
4337049485	mashed potatoes
4337049485	rolls/biscuits
4337049485	vegetable salad
4337049485	yams/sweet potato casserole
4337044640	fruit salad
4337044640	mashed potatoes
4337044640	rolls/biscuits
4337044640	yams/sweet potato casserole
4337044640	other
4337044628	cauliflower
4337044628	green beans/green bean casserole
4337044628	mashed potatoes
4337044628	rolls/biscuits
4337044628	vegetable salad
4337044628	other
4337044348	green beans/green bean casserole
4337044348	mashed potatoes
4337044348	yams/sweet potato casserole
4337043853	cornbread
4337043853	fruit salad
4337043853	green beans/green bean casserole
4337043853	mashed potatoes
4337043853	rolls/biscuits
4337043853	squash
4337043853	yams/sweet potato casserole
4337043565	cornbread
4337043565	green beans/green bean casserole
4337043565	mashed potatoes
4337043565	rolls/biscuits
4337043565	other
4337040587	corn
4337040587	cornbread
4337040587	fruit salad
4337040587	mashed potatoes
4337040587	rolls/biscuits
4337040405	carrots
4337040405	corn
4337040405	green beans/green bean casserole
4337040405	macaroni and cheese
4337040405	mashed potatoes
4337040405	rolls/biscuits
4337040405	squash
4337040405	yams/sweet potato casserole
4337032039	carrots
4337032039	corn
4337032039	cornbread
4337032039	green beans/green bean casserole
4337032039	macaroni and cheese
4337032039	mashed potatoes
4337032039	rolls/biscuits
4337032009	corn
4337032009	green beans/green bean casserole
4337032009	mashed potatoes
4337032009	rolls/biscuits
4337032009	yams/sweet potato casserole
4337032009	other
4337031019	carrots
4337031019	corn
4337031019	cornbread
4337031019	green beans/green bean casserole
4337031019	mashed potatoes
4337031019	rolls/biscuits
4337031019	squash
4337031019	vegetable salad
4337029500	corn
4337029500	fruit salad
4337029500	mashed potatoes
4337029500	rolls/biscuits
4337029500	vegetable salad
4337029500	yams/sweet potato casserole
4337027180	fruit salad
4337027180	mashed potatoes
4337027180	squash
4337027180	yams/sweet potato casserole
4337025357	brussel sprouts
4337025357	corn
4337025357	green beans/green bean casserole
4337025357	mashed potatoes
4337025357	rolls/biscuits
4337025357	yams/sweet potato casserole
4337024057	brussel sprouts
4337024057	carrots
4337024057	fruit salad
4337024057	green beans/green bean casserole
4337024057	macaroni and cheese
4337024057	mashed potatoes
4337024057	rolls/biscuits
4337024057	vegetable salad
4337024057	yams/sweet potato casserole
4337024057	other
4337023697	corn
4337023697	cornbread
4337023697	green beans/green bean casserole
4337023697	mashed potatoes
4337023697	vegetable salad
4337023697	yams/sweet potato casserole
4337022132	carrots
4337022132	corn
4337022132	green beans/green bean casserole
4337022132	mashed potatoes
4337022132	rolls/biscuits
4337022132	yams/sweet potato casserole
4337021828	green beans/green bean casserole
4337021828	mashed potatoes
4337021828	rolls/biscuits
4337021828	yams/sweet potato casserole
4337021725	corn
4337021725	mashed potatoes
4337021725	rolls/biscuits
4337021725	yams/sweet potato casserole
4337019638	brussel sprouts
4337019638	carrots
4337019638	cauliflower
4337019638	corn
4337019638	cornbread
4337019638	fruit salad
4337019638	green beans/green bean casserole
4337019638	mashed potatoes
4337019638	rolls/biscuits
4337019638	yams/sweet potato casserole
4337019287	corn
4337019287	green beans/green bean casserole
4337019287	mashed potatoes
4337019287	yams/sweet potato casserole
4337019220	brussel sprouts
4337019220	mashed potatoes
4337019220	rolls/biscuits
4337019220	squash
4337019080	corn
4337019080	mashed potatoes
4337019080	rolls/biscuits
4337019080	vegetable salad
4337013286	corn
4337013286	fruit salad
4337013286	green beans/green bean casserole
4337013286	mashed potatoes
4337013286	rolls/biscuits
4337013286	vegetable salad
4337013286	yams/sweet potato casserole
4337008702	mashed potatoes
4337008702	rolls/biscuits
4337008702	other
4337008598	cauliflower
4337008598	corn
4337008598	green beans/green bean casserole
4337008598	mashed potatoes
4337008598	yams/sweet potato casserole
4337008598	other
4337008258	green beans/green bean casserole
4337008258	mashed potatoes
4337008258	rolls/biscuits
4337008258	vegetable salad
4337008258	yams/sweet potato casserole
4337006937	corn
4337006937	fruit salad
4337006937	green beans/green bean casserole
4337006937	macaroni and cheese
4337006937	vegetable salad
4337006937	yams/sweet potato casserole
4337004476	cornbread
4337004476	green beans/green bean casserole
4337004476	mashed potatoes
4337004476	rolls/biscuits
4337004476	squash
4337002367	carrots
4337002367	corn
4337002367	green beans/green bean casserole
4337002367	mashed potatoes
4337002367	other
4337002262	corn
4337002262	cornbread
4337002262	fruit salad
4337002262	green beans/green bean casserole
4337002262	macaroni and cheese
4337002262	mashed potatoes
4337002262	rolls/biscuits
4337002262	squash
4337002262	yams/sweet potato casserole
4336999913	cornbread
4336999913	green beans/green bean casserole
4336999913	macaroni and cheese
4336999913	mashed potatoes
4336999913	rolls/biscuits
4336999913	yams/sweet potato casserole
4336998647	carrots
4336998647	corn
4336998647	green beans/green bean casserole
4336998647	mashed potatoes
4336998647	rolls/biscuits
4336998647	yams/sweet potato casserole
4336998552	cornbread
4336998552	green beans/green bean casserole
4336998552	mashed potatoes
4336998552	rolls/biscuits
4336997445	green beans/green bean casserole
4336997445	squash
4336997445	yams/sweet potato casserole
4336997200	corn
4336997200	cornbread
4336997200	green beans/green bean casserole
4336997200	macaroni and cheese
4336997200	mashed potatoes
4336997200	rolls/biscuits
4336997200	yams/sweet potato casserole
4336997200	other
4336996479	carrots
4336996479	green beans/green bean casserole
4336996479	mashed potatoes
4336996479	rolls/biscuits
4336995888	corn
4336995888	cornbread
4336995888	green beans/green bean casserole
4336995888	macaroni and cheese
4336995888	mashed potatoes
4336995888	rolls/biscuits
4336995888	yams/sweet potato casserole
4336995004	carrots
4336995004	corn
4336995004	green beans/green bean casserole
4336995004	mashed potatoes
4336995004	rolls/biscuits
4336994435	cornbread
4336994435	macaroni and cheese
4336994435	mashed potatoes
4336994435	rolls/biscuits
4336994408	fruit salad
4336994408	green beans/green bean casserole
4336994408	mashed potatoes
4336994408	rolls/biscuits
4336994408	vegetable salad
4336994408	yams/sweet potato casserole
4336993856	carrots
4336993856	corn
4336993856	fruit salad
4336993856	green beans/green bean casserole
4336993856	mashed potatoes
4336993856	rolls/biscuits
4336993856	vegetable salad
4336993856	yams/sweet potato casserole
4336993552	brussel sprouts
4336993552	green beans/green bean casserole
4336993552	mashed potatoes
4336993552	rolls/biscuits
4336993552	yams/sweet potato casserole
4336993307	mashed potatoes
4336993307	rolls/biscuits
4336993268	brussel sprouts
4336993268	carrots
4336993268	cauliflower
4336993268	corn
4336993268	cornbread
4336993268	fruit salad
4336993268	green beans/green bean casserole
4336993268	mashed potatoes
4336993268	rolls/biscuits
4336993268	vegetable salad
4336989544	brussel sprouts
4336989544	fruit salad
4336989544	macaroni and cheese
4336989544	mashed potatoes
4336989544	yams/sweet potato casserole
4336988874	brussel sprouts
4336988874	mashed potatoes
4336988874	rolls/biscuits
4336988874	yams/sweet potato casserole
4336986755	corn
4336986755	fruit salad
4336986755	green beans/green bean casserole
4336986755	mashed potatoes
4336986755	rolls/biscuits
4336986628	corn
4336986628	green beans/green bean casserole
4336986628	mashed potatoes
4336986628	rolls/biscuits
4336986628	yams/sweet potato casserole
4336985910	carrots
4336985910	mashed potatoes
4336985361	fruit salad
4336985361	green beans/green bean casserole
4336985361	macaroni and cheese
4336985361	mashed potatoes
4336985361	vegetable salad
4336985361	yams/sweet potato casserole
4336984164	carrots
4336984164	cornbread
4336984164	mashed potatoes
4336984164	squash
4336984164	yams/sweet potato casserole
4336984164	other
4336983931	corn
4336983931	cornbread
4336983931	green beans/green bean casserole
4336983931	yams/sweet potato casserole
4336983885	carrots
4336983885	corn
4336983885	cornbread
4336983885	fruit salad
4336983885	green beans/green bean casserole
4336983885	macaroni and cheese
4336983885	mashed potatoes
4336983885	rolls/biscuits
4336983885	vegetable salad
4336983885	yams/sweet potato casserole
4336983016	carrots
4336983016	cauliflower
4336983016	cornbread
4336983016	fruit salad
4336983016	green beans/green bean casserole
4336983016	macaroni and cheese
4336983016	mashed potatoes
4336983016	rolls/biscuits
4336983016	squash
4336983016	vegetable salad
4336983016	yams/sweet potato casserole
4336982929	brussel sprouts
4336982929	cauliflower
4336982929	green beans/green bean casserole
4336982929	mashed potatoes
4336982929	rolls/biscuits
4336982929	squash
4336982929	yams/sweet potato casserole
4336982760	brussel sprouts
4336982760	mashed potatoes
4336982760	yams/sweet potato casserole
4336982760	other
4336978225	corn
4336978225	cornbread
4336978225	green beans/green bean casserole
4336978225	mashed potatoes
4336978225	rolls/biscuits
4336978225	vegetable salad
4336978225	yams/sweet potato casserole
4336977349	green beans/green bean casserole
4336977349	mashed potatoes
4336977349	rolls/biscuits
4336977349	yams/sweet potato casserole
4336977032	brussel sprouts
4336977032	cauliflower
4336977032	green beans/green bean casserole
4336977032	mashed potatoes
4336977032	rolls/biscuits
4336977032	vegetable salad
4336977032	yams/sweet potato casserole
4336975251	corn
4336975251	cornbread
4336975251	mashed potatoes
4336975251	rolls/biscuits
4336975251	vegetable salad
4336975251	yams/sweet potato casserole
4336975010	corn
4336975010	green beans/green bean casserole
4336975010	mashed potatoes
4336975010	rolls/biscuits
4336973830	green beans/green bean casserole
4336973830	mashed potatoes
4336973830	rolls/biscuits
4336973830	yams/sweet potato casserole
4336972729	brussel sprouts
4336972729	cauliflower
4336972729	vegetable salad
4336972729	other
4336972039	corn
4336972039	mashed potatoes
4336972039	rolls/biscuits
4336972039	yams/sweet potato casserole
4336971897	other
4336970208	cornbread
4336970208	green beans/green bean casserole
4336970208	mashed potatoes
4336970208	rolls/biscuits
4336970208	yams/sweet potato casserole
4336969969	carrots
4336969969	green beans/green bean casserole
4336969969	mashed potatoes
4336969969	rolls/biscuits
4336969969	vegetable salad
4336969969	yams/sweet potato casserole
4336967374	brussel sprouts
4336967374	carrots
4336967374	corn
4336967374	green beans/green bean casserole
4336967374	squash
4336967374	yams/sweet potato casserole
4336965632	green beans/green bean casserole
4336965632	mashed potatoes
4336965632	rolls/biscuits
4336965464	corn
4336965464	mashed potatoes
4336965464	rolls/biscuits
4336965464	yams/sweet potato casserole
4336964971	mashed potatoes
4336964971	rolls/biscuits
4336964971	yams/sweet potato casserole
4336964971	other
4336963992	green beans/green bean casserole
4336963992	mashed potatoes
4336963992	yams/sweet potato casserole
4336963992	other
4336963314	corn
4336963314	fruit salad
4336963314	green beans/green bean casserole
4336963314	mashed potatoes
4336963314	rolls/biscuits
4336963314	yams/sweet potato casserole
4336963112	cornbread
4336963112	green beans/green bean casserole
4336963112	mashed potatoes
4336963112	rolls/biscuits
4336962719	brussel sprouts
4336962719	fruit salad
4336962719	green beans/green bean casserole
4336962719	mashed potatoes
4336962719	rolls/biscuits
4336962719	yams/sweet potato casserole
4336962641	other
4336962476	fruit salad
4336962476	green beans/green bean casserole
4336962476	mashed potatoes
4336962476	rolls/biscuits
4336961100	carrots
4336961100	cornbread
4336961100	green beans/green bean casserole
4336961100	mashed potatoes
4336961100	rolls/biscuits
4336961100	squash
4336961100	vegetable salad
4336961100	yams/sweet potato casserole
4336961030	carrots
4336961030	green beans/green bean casserole
4336961030	mashed potatoes
4336961030	rolls/biscuits
4336961030	vegetable salad
4336961030	yams/sweet potato casserole
4336959845	carrots
4336959845	fruit salad
4336959845	green beans/green bean casserole
4336959845	mashed potatoes
4336959845	rolls/biscuits
4336957549	brussel sprouts
4336957549	corn
4336957549	green beans/green bean casserole
4336957549	mashed potatoes
4336957549	rolls/biscuits
4336957375	carrots
4336957375	mashed potatoes
4336957375	rolls/biscuits
4336957375	vegetable salad
4336956397	brussel sprouts
4336956397	green beans/green bean casserole
4336956397	macaroni and cheese
4336956397	mashed potatoes
4336956397	rolls/biscuits
4336956397	yams/sweet potato casserole
4336956397	other
4336955887	green beans/green bean casserole
4336955887	mashed potatoes
4336955887	rolls/biscuits
4336955887	yams/sweet potato casserole
4336953375	macaroni and cheese
4336953375	rolls/biscuits
4336953375	yams/sweet potato casserole
4336952446	carrots
4336952446	fruit salad
4336952446	green beans/green bean casserole
4336952446	rolls/biscuits
4336952446	vegetable salad
4336952446	yams/sweet potato casserole
4336950642	cauliflower
4336950642	corn
4336950642	fruit salad
4336950642	green beans/green bean casserole
4336950642	mashed potatoes
4336950642	rolls/biscuits
4336950642	yams/sweet potato casserole
4336950342	fruit salad
4336950342	green beans/green bean casserole
4336950342	mashed potatoes
4336950342	rolls/biscuits
4336950342	yams/sweet potato casserole
4336949841	mashed potatoes
4336949841	yams/sweet potato casserole
4336949659	corn
4336949659	cornbread
4336949659	green beans/green bean casserole
4336949659	macaroni and cheese
4336949659	mashed potatoes
4336949659	rolls/biscuits
4336949659	yams/sweet potato casserole
4336949331	corn
4336949331	cornbread
4336949331	green beans/green bean casserole
4336949331	mashed potatoes
4336949331	rolls/biscuits
4336949331	yams/sweet potato casserole
4336945764	corn
4336945764	cornbread
4336945764	green beans/green bean casserole
4336945764	macaroni and cheese
4336945764	rolls/biscuits
4336945764	yams/sweet potato casserole
4336945764	other
4336945012	carrots
4336945012	fruit salad
4336945012	mashed potatoes
4336945012	rolls/biscuits
4336945012	vegetable salad
4336945012	yams/sweet potato casserole
4336944934	green beans/green bean casserole
4336944934	mashed potatoes
4336944934	rolls/biscuits
4336941325	brussel sprouts
4336941325	carrots
4336941325	green beans/green bean casserole
4336941325	mashed potatoes
4336941325	rolls/biscuits
4336941325	yams/sweet potato casserole
4336940774	green beans/green bean casserole
4336940774	mashed potatoes
4336940774	yams/sweet potato casserole
4336940486	brussel sprouts
4336940486	fruit salad
4336940486	green beans/green bean casserole
4336940486	macaroni and cheese
4336940486	mashed potatoes
4336940486	yams/sweet potato casserole
4336937701	carrots
4336937701	corn
4336937701	cornbread
4336937701	green beans/green bean casserole
4336937701	mashed potatoes
4336937701	rolls/biscuits
4336935604	green beans/green bean casserole
4336935604	macaroni and cheese
4336935604	mashed potatoes
4336935604	rolls/biscuits
4336935604	vegetable salad
4336935604	yams/sweet potato casserole
4336934948	corn
4336934948	green beans/green bean casserole
4336934948	mashed potatoes
4336934948	rolls/biscuits
4336934948	yams/sweet potato casserole
4336934120	mashed potatoes
4336934120	rolls/biscuits
4336934120	squash
4336934120	vegetable salad
4336933938	fruit salad
4336933938	green beans/green bean casserole
4336933938	mashed potatoes
4336933938	rolls/biscuits
4336933938	yams/sweet potato casserole
4336932386	brussel sprouts
4336932386	corn
4336932386	fruit salad
4336932386	green beans/green bean casserole
4336932386	macaroni and cheese
4336932386	mashed potatoes
4336932386	rolls/biscuits
4336932386	yams/sweet potato casserole
4336932195	brussel sprouts
4336932195	green beans/green bean casserole
4336932195	mashed potatoes
4336932195	squash
4336932195	vegetable salad
4336931306	green beans/green bean casserole
4336931306	mashed potatoes
4336931306	rolls/biscuits
4336931306	yams/sweet potato casserole
4336929784	corn
4336929784	mashed potatoes
4336929784	rolls/biscuits
4336929784	vegetable salad
4336929784	yams/sweet potato casserole
4336928175	corn
4336928175	green beans/green bean casserole
4336928175	mashed potatoes
4336928175	rolls/biscuits
4336928175	yams/sweet potato casserole
4336928076	carrots
4336928076	corn
4336928076	cornbread
4336928076	green beans/green bean casserole
4336928076	macaroni and cheese
4336928076	mashed potatoes
4336928076	rolls/biscuits
4336928076	yams/sweet potato casserole
4336927723	green beans/green bean casserole
4336927723	mashed potatoes
4336927723	rolls/biscuits
4336927723	squash
4336927723	yams/sweet potato casserole
4336925780	corn
4336925780	cornbread
4336925780	green beans/green bean casserole
4336925780	macaroni and cheese
4336925780	mashed potatoes
4336925780	rolls/biscuits
4336925485	green beans/green bean casserole
4336925485	mashed potatoes
4336925485	rolls/biscuits
4336925485	yams/sweet potato casserole
4336923533	mashed potatoes
4336923533	rolls/biscuits
4336923177	carrots
4336923177	corn
4336923177	cornbread
4336923177	fruit salad
4336923177	green beans/green bean casserole
4336923177	macaroni and cheese
4336923177	mashed potatoes
4336923177	rolls/biscuits
4336923177	vegetable salad
4336923177	yams/sweet potato casserole
4336922793	corn
4336922793	macaroni and cheese
4336922793	mashed potatoes
4336922793	rolls/biscuits
4336922793	other
4336922086	carrots
4336922086	corn
4336922086	cornbread
4336922086	fruit salad
4336922086	green beans/green bean casserole
4336922086	macaroni and cheese
4336922086	mashed potatoes
4336922086	rolls/biscuits
4336922086	vegetable salad
4336922086	yams/sweet potato casserole
4336921564	corn
4336921564	green beans/green bean casserole
4336921564	mashed potatoes
4336921564	rolls/biscuits
4336921564	yams/sweet potato casserole
4336919993	cornbread
4336919993	fruit salad
4336919993	green beans/green bean casserole
4336919993	macaroni and cheese
4336919993	mashed potatoes
4336919993	rolls/biscuits
4336917509	green beans/green bean casserole
4336917509	mashed potatoes
4336917509	rolls/biscuits
4336917509	yams/sweet potato casserole
4336917274	cornbread
4336917274	mashed potatoes
4336917274	rolls/biscuits
4336917270	carrots
4336917270	corn
4336917270	cornbread
4336917270	green beans/green bean casserole
4336917270	mashed potatoes
4336917270	rolls/biscuits
4336917270	yams/sweet potato casserole
4336916047	cornbread
4336916047	fruit salad
4336916047	green beans/green bean casserole
4336916047	mashed potatoes
4336916047	rolls/biscuits
4336916047	vegetable salad
4336915660	mashed potatoes
4336915660	rolls/biscuits
4336915660	yams/sweet potato casserole
4336915660	other
4336915137	corn
4336915137	cornbread
4336915137	green beans/green bean casserole
4336915137	macaroni and cheese
4336915137	rolls/biscuits
4336915137	yams/sweet potato casserole
4336909691	fruit salad
4336909691	green beans/green bean casserole
4336909691	rolls/biscuits
4336909691	yams/sweet potato casserole
4336908416	corn
4336908416	green beans/green bean casserole
4336908416	mashed potatoes
4336908416	rolls/biscuits
4336908416	yams/sweet potato casserole
4336908351	macaroni and cheese
4336908351	mashed potatoes
4336908351	rolls/biscuits
4336908351	yams/sweet potato casserole
4336907249	corn
4336907249	green beans/green bean casserole
4336907249	yams/sweet potato casserole
4336905433	green beans/green bean casserole
4336905433	mashed potatoes
4336905433	rolls/biscuits
4336905258	corn
4336905258	green beans/green bean casserole
4336905258	macaroni and cheese
4336905258	mashed potatoes
4336905258	rolls/biscuits
4336905258	yams/sweet potato casserole
4336905103	fruit salad
4336905103	green beans/green bean casserole
4336905103	mashed potatoes
4336905103	rolls/biscuits
4336905103	vegetable salad
4336905103	yams/sweet potato casserole
4336905103	other
4336902332	brussel sprouts
4336902332	cauliflower
4336902332	corn
4336902332	fruit salad
4336902332	green beans/green bean casserole
4336902332	mashed potatoes
4336902332	rolls/biscuits
4336902332	vegetable salad
4336902332	yams/sweet potato casserole
4336901843	corn
4336901843	green beans/green bean casserole
4336901843	mashed potatoes
4336901843	rolls/biscuits
4336901843	yams/sweet potato casserole
4336901444	green beans/green bean casserole
4336901444	macaroni and cheese
4336901444	rolls/biscuits
4336901444	squash
4336901444	yams/sweet potato casserole
4336901246	carrots
4336901246	cauliflower
4336901246	corn
4336901246	fruit salad
4336901246	green beans/green bean casserole
4336901246	mashed potatoes
4336901246	rolls/biscuits
4336901246	yams/sweet potato casserole
4336901039	carrots
4336901039	cauliflower
4336901039	corn
4336901039	fruit salad
4336901039	green beans/green bean casserole
4336901039	macaroni and cheese
4336901039	mashed potatoes
4336901039	rolls/biscuits
4336901039	yams/sweet potato casserole
4336901039	other
4336900009	corn
4336900009	green beans/green bean casserole
4336900009	mashed potatoes
4336900009	rolls/biscuits
4336900009	vegetable salad
4336900009	yams/sweet potato casserole
4336898888	corn
4336898888	green beans/green bean casserole
4336898888	mashed potatoes
4336898888	rolls/biscuits
4336898281	green beans/green bean casserole
4336898281	macaroni and cheese
4336898281	mashed potatoes
4336898281	rolls/biscuits
4336898281	yams/sweet potato casserole
4336898281	other
4336897370	carrots
4336897370	green beans/green bean casserole
4336897370	mashed potatoes
4336897370	rolls/biscuits
4336897370	yams/sweet potato casserole
4336897268	corn
4336897268	cornbread
4336897268	green beans/green bean casserole
4336897268	macaroni and cheese
4336897268	mashed potatoes
4336897268	rolls/biscuits
4336897268	yams/sweet potato casserole
4336896050	carrots
4336896050	green beans/green bean casserole
4336896050	mashed potatoes
4336896050	rolls/biscuits
4336896050	vegetable salad
4336896050	yams/sweet potato casserole
4336894987	green beans/green bean casserole
4336894987	mashed potatoes
4336894987	rolls/biscuits
4336894811	brussel sprouts
4336894811	carrots
4336894811	corn
4336894811	green beans/green bean casserole
4336894811	mashed potatoes
4336894811	yams/sweet potato casserole
4336894719	carrots
4336894719	corn
4336894719	green beans/green bean casserole
4336894719	mashed potatoes
4336894719	rolls/biscuits
4336894719	squash
4336894719	vegetable salad
4336894663	brussel sprouts
4336894663	carrots
4336894663	mashed potatoes
4336894663	squash
4336894663	yams/sweet potato casserole
4336893852	corn
4336893852	fruit salad
4336893852	green beans/green bean casserole
4336893852	mashed potatoes
4336893852	rolls/biscuits
4336893852	yams/sweet potato casserole
4336892910	corn
4336892910	green beans/green bean casserole
4336892910	mashed potatoes
4336892910	rolls/biscuits
4336892910	vegetable salad
4336892910	yams/sweet potato casserole
4336892388	cornbread
4336892388	squash
4336892388	vegetable salad
4336891075	rolls/biscuits
4336891075	squash
4336891075	yams/sweet potato casserole
4336890666	green beans/green bean casserole
4336890666	rolls/biscuits
4336890666	other
4336888973	carrots
4336888973	corn
4336888973	fruit salad
4336888973	mashed potatoes
4336888973	vegetable salad
4336888973	yams/sweet potato casserole
4336888425	corn
4336888425	mashed potatoes
4336888425	rolls/biscuits
4336888425	squash
4336887954	carrots
4336887954	green beans/green bean casserole
4336887954	mashed potatoes
4336887954	rolls/biscuits
4336887954	squash
4336887954	vegetable salad
4336887954	yams/sweet potato casserole
4336887917	corn
4336887917	cornbread
4336887917	fruit salad
4336887917	mashed potatoes
4336887917	rolls/biscuits
4336887917	yams/sweet potato casserole
4336887807	green beans/green bean casserole
4336887807	mashed potatoes
4336887807	rolls/biscuits
4336885748	mashed potatoes
4336885748	vegetable salad
4336885693	macaroni and cheese
4336885693	mashed potatoes
4336885693	rolls/biscuits
4336885693	yams/sweet potato casserole
4336884042	carrots
4336884042	cornbread
4336884042	green beans/green bean casserole
4336884042	mashed potatoes
4336884042	rolls/biscuits
4336884042	yams/sweet potato casserole
4336884019	green beans/green bean casserole
4336884019	mashed potatoes
4336883054	cauliflower
4336883054	green beans/green bean casserole
4336883054	mashed potatoes
4336883054	rolls/biscuits
4336882230	green beans/green bean casserole
4336882230	mashed potatoes
4336882230	rolls/biscuits
4336882230	yams/sweet potato casserole
4336881221	brussel sprouts
4336881221	carrots
4336881221	corn
4336881221	green beans/green bean casserole
4336881221	mashed potatoes
4336881221	yams/sweet potato casserole
4336881198	corn
4336881198	green beans/green bean casserole
4336881198	mashed potatoes
4336881198	rolls/biscuits
4336881198	squash
4336881198	yams/sweet potato casserole
4336881198	other
4336880828	mashed potatoes
4336880828	squash
4336880828	vegetable salad
4336879968	carrots
4336879968	corn
4336879968	cornbread
4336879968	green beans/green bean casserole
4336879968	macaroni and cheese
4336879968	mashed potatoes
4336879968	rolls/biscuits
4336879968	squash
4336879968	yams/sweet potato casserole
4336879592	corn
4336879592	mashed potatoes
4336879592	rolls/biscuits
4336879592	other
4336879579	corn
4336879579	green beans/green bean casserole
4336879579	mashed potatoes
4336879579	rolls/biscuits
4336879316	corn
4336879316	green beans/green bean casserole
4336879316	mashed potatoes
4336879316	rolls/biscuits
4336879316	vegetable salad
4336879316	yams/sweet potato casserole
4336878978	corn
4336878978	mashed potatoes
4336878978	rolls/biscuits
4336878978	vegetable salad
4336878183	corn
4336878183	green beans/green bean casserole
4336878183	mashed potatoes
4336878183	rolls/biscuits
4336878183	other
4336876798	rolls/biscuits
4336876798	yams/sweet potato casserole
4336876798	other
4336876529	green beans/green bean casserole
4336876529	macaroni and cheese
4336876529	mashed potatoes
4336876529	rolls/biscuits
4336876457	carrots
4336876457	corn
4336876457	cornbread
4336876457	green beans/green bean casserole
4336876457	mashed potatoes
4336876457	rolls/biscuits
4336876457	yams/sweet potato casserole
4336876402	cauliflower
4336876402	corn
4336876402	fruit salad
4336876402	green beans/green bean casserole
4336876402	mashed potatoes
4336876402	rolls/biscuits
4336876402	squash
4336876402	vegetable salad
4336876402	yams/sweet potato casserole
4336876402	other
4336875194	green beans/green bean casserole
4336875194	mashed potatoes
4336875194	rolls/biscuits
4336875194	vegetable salad
4336875194	yams/sweet potato casserole
4336874555	brussel sprouts
4336874555	green beans/green bean casserole
4336874555	mashed potatoes
4336874555	squash
4336874555	yams/sweet potato casserole
4336874265	corn
4336874265	cornbread
4336874265	green beans/green bean casserole
4336874265	mashed potatoes
4336874265	rolls/biscuits
4336871606	carrots
4336871606	cornbread
4336871606	green beans/green bean casserole
4336871606	mashed potatoes
4336871606	rolls/biscuits
4336871606	squash
4336871606	yams/sweet potato casserole
4336871204	corn
4336871204	cornbread
4336871204	fruit salad
4336871204	green beans/green bean casserole
4336871204	macaroni and cheese
4336871204	mashed potatoes
4336871204	yams/sweet potato casserole
4336870813	carrots
4336870813	corn
4336870813	cornbread
4336870813	fruit salad
4336870813	green beans/green bean casserole
4336870813	macaroni and cheese
4336870813	mashed potatoes
4336870813	rolls/biscuits
4336870813	vegetable salad
4336870370	green beans/green bean casserole
4336870370	mashed potatoes
4336870370	rolls/biscuits
4336870370	other
4336870006	cornbread
4336870006	fruit salad
4336870006	mashed potatoes
4336869926	corn
4336869926	green beans/green bean casserole
4336869926	macaroni and cheese
4336869926	mashed potatoes
4336869926	rolls/biscuits
4336869926	yams/sweet potato casserole
4336868990	corn
4336868990	green beans/green bean casserole
4336868990	mashed potatoes
4336868990	rolls/biscuits
4336868990	yams/sweet potato casserole
4336867812	carrots
4336867812	corn
4336867812	cornbread
4336867812	green beans/green bean casserole
4336867812	macaroni and cheese
4336867812	mashed potatoes
4336867812	rolls/biscuits
4336867812	squash
4336867812	vegetable salad
4336867812	yams/sweet potato casserole
4336867797	corn
4336867797	green beans/green bean casserole
4336867797	mashed potatoes
4336867797	rolls/biscuits
4336867797	vegetable salad
4336867715	green beans/green bean casserole
4336867715	mashed potatoes
4336867715	rolls/biscuits
4336867715	yams/sweet potato casserole
4336867715	other
4336866361	carrots
4336866361	corn
4336866361	cornbread
4336866361	mashed potatoes
4336866361	rolls/biscuits
4336863649	carrots
4336863649	corn
4336863649	green beans/green bean casserole
4336863649	mashed potatoes
4336863649	rolls/biscuits
4336863649	squash
4336863649	yams/sweet potato casserole
4336861802	cornbread
4336861802	green beans/green bean casserole
4336861802	macaroni and cheese
4336861802	yams/sweet potato casserole
4336861435	mashed potatoes
4336861435	yams/sweet potato casserole
4336860680	brussel sprouts
4336860680	carrots
4336860680	rolls/biscuits
4336860680	yams/sweet potato casserole
4336860498	corn
4336860498	green beans/green bean casserole
4336860498	macaroni and cheese
4336860498	rolls/biscuits
4336860029	fruit salad
4336860029	green beans/green bean casserole
4336860029	vegetable salad
4336860029	yams/sweet potato casserole
4336857693	carrots
4336857693	cauliflower
4336857693	corn
4336857693	green beans/green bean casserole
4336857693	mashed potatoes
4336857693	rolls/biscuits
4336857530	green beans/green bean casserole
4336857362	green beans/green bean casserole
4336857362	mashed potatoes
4336857362	rolls/biscuits
4336857362	yams/sweet potato casserole
4336856298	mashed potatoes
4336856298	squash
4336856298	vegetable salad
4336856298	yams/sweet potato casserole
4336855177	corn
4336855177	green beans/green bean casserole
4336855177	mashed potatoes
4336855177	rolls/biscuits
4336855177	vegetable salad
4336853880	corn
4336853880	green beans/green bean casserole
4336853880	macaroni and cheese
4336853880	mashed potatoes
4336853880	rolls/biscuits
4336853880	yams/sweet potato casserole
4336851292	carrots
4336851292	cauliflower
4336851292	corn
4336851292	green beans/green bean casserole
4336851292	mashed potatoes
4336851292	rolls/biscuits
4336851292	yams/sweet potato casserole
4336851260	corn
4336851260	cornbread
4336851260	fruit salad
4336851260	green beans/green bean casserole
4336851260	mashed potatoes
4336851260	rolls/biscuits
4336851260	squash
4336851260	vegetable salad
4336851260	yams/sweet potato casserole
4336848038	brussel sprouts
4336848038	corn
4336848038	cornbread
4336848038	green beans/green bean casserole
4336848038	mashed potatoes
4336848038	rolls/biscuits
4336848038	squash
4336848038	yams/sweet potato casserole
4336848038	other
4336847523	carrots
4336847523	cauliflower
4336847523	corn
4336847523	mashed potatoes
4336844557	green beans/green bean casserole
4336844557	yams/sweet potato casserole
4336843665	green beans/green bean casserole
4336843665	mashed potatoes
4336843665	rolls/biscuits
4336841567	mashed potatoes
4336841567	rolls/biscuits
4336841484	corn
4336841484	mashed potatoes
4336841484	rolls/biscuits
4336841484	vegetable salad
4336840954	brussel sprouts
4336840954	carrots
4336840954	corn
4336840954	fruit salad
4336840954	macaroni and cheese
4336840954	mashed potatoes
4336840954	rolls/biscuits
4336840954	squash
4336840954	vegetable salad
4336840954	yams/sweet potato casserole
4336840954	other
4336840612	brussel sprouts
4336840612	carrots
4336840612	corn
4336840612	green beans/green bean casserole
4336840612	macaroni and cheese
4336840612	mashed potatoes
4336840612	rolls/biscuits
4336840612	yams/sweet potato casserole
4336839687	corn
4336839687	green beans/green bean casserole
4336839687	mashed potatoes
4336838632	green beans/green bean casserole
4336838632	mashed potatoes
4336838632	rolls/biscuits
4336838632	squash
4336838632	vegetable salad
4336838632	yams/sweet potato casserole
4336838630	green beans/green bean casserole
4336838630	mashed potatoes
4336838630	vegetable salad
4336838317	green beans/green bean casserole
4336838317	macaroni and cheese
4336838317	rolls/biscuits
4336838317	yams/sweet potato casserole
4336838317	other
4336837943	cauliflower
4336837943	corn
4336837943	green beans/green bean casserole
4336837943	mashed potatoes
4336837943	rolls/biscuits
4336837943	yams/sweet potato casserole
4336837943	other
4336837306	brussel sprouts
4336837306	green beans/green bean casserole
4336837306	mashed potatoes
4336837306	rolls/biscuits
4336837306	vegetable salad
4336837306	yams/sweet potato casserole
4336836328	carrots
4336836328	corn
4336836328	cornbread
4336836328	fruit salad
4336836328	green beans/green bean casserole
4336836328	macaroni and cheese
4336836328	mashed potatoes
4336836328	rolls/biscuits
4336836328	vegetable salad
4336836328	yams/sweet potato casserole
4336836078	carrots
4336836078	corn
4336836078	cornbread
4336836078	fruit salad
4336836078	green beans/green bean casserole
4336836078	mashed potatoes
4336836078	rolls/biscuits
4336836078	squash
4336836078	vegetable salad
4336836078	yams/sweet potato casserole
4336835004	green beans/green bean casserole
4336835004	mashed potatoes
4336835004	rolls/biscuits
4336835004	yams/sweet potato casserole
4336834730	carrots
4336834730	green beans/green bean casserole
4336834730	mashed potatoes
4336834730	rolls/biscuits
4336834730	squash
4336834730	yams/sweet potato casserole
4336834473	carrots
4336834473	corn
4336834473	vegetable salad
4336833478	green beans/green bean casserole
4336833478	mashed potatoes
4336833478	rolls/biscuits
4336832951	carrots
4336832951	green beans/green bean casserole
4336832951	rolls/biscuits
4336832951	yams/sweet potato casserole
4336832129	carrots
4336832129	cornbread
4336832129	rolls/biscuits
4336830596	green beans/green bean casserole
4336830596	mashed potatoes
4336830596	rolls/biscuits
4336830596	squash
4336830596	vegetable salad
4336830596	yams/sweet potato casserole
4336829875	mashed potatoes
4336829875	rolls/biscuits
4336829875	yams/sweet potato casserole
4336829875	other
4336829721	brussel sprouts
4336829721	carrots
4336829721	cauliflower
4336829721	corn
4336829721	fruit salad
4336829185	green beans/green bean casserole
4336829185	mashed potatoes
4336829185	rolls/biscuits
4336829185	vegetable salad
4336829185	yams/sweet potato casserole
4336829185	other
4336828331	mashed potatoes
4336827783	green beans/green bean casserole
4336827783	mashed potatoes
4336827783	rolls/biscuits
4336827663	carrots
4336827663	corn
4336827663	fruit salad
4336827663	green beans/green bean casserole
4336827663	mashed potatoes
4336827663	rolls/biscuits
4336827663	yams/sweet potato casserole
4336826560	corn
4336826560	green beans/green bean casserole
4336826560	macaroni and cheese
4336826560	mashed potatoes
4336826560	rolls/biscuits
4336825506	corn
4336825506	green beans/green bean casserole
4336825506	macaroni and cheese
4336825506	mashed potatoes
4336825506	rolls/biscuits
4336825506	yams/sweet potato casserole
4336825281	corn
4336825281	cornbread
4336825281	fruit salad
4336825281	green beans/green bean casserole
4336825281	mashed potatoes
4336825281	rolls/biscuits
4336825281	yams/sweet potato casserole
4336825000	brussel sprouts
4336825000	cauliflower
4336825000	cornbread
4336825000	green beans/green bean casserole
4336825000	mashed potatoes
4336825000	rolls/biscuits
4336825000	yams/sweet potato casserole
4336823441	green beans/green bean casserole
4336823441	mashed potatoes
4336823441	rolls/biscuits
4336823441	yams/sweet potato casserole
4336823172	brussel sprouts
4336823172	green beans/green bean casserole
4336823172	mashed potatoes
4336823172	rolls/biscuits
4336823172	yams/sweet potato casserole
4336822252	carrots
4336822252	green beans/green bean casserole
4336822252	mashed potatoes
4336822252	rolls/biscuits
4336822252	squash
4336821807	corn
4336821807	fruit salad
4336821807	mashed potatoes
4336821807	rolls/biscuits
4336821332	brussel sprouts
4336821332	carrots
4336821332	green beans/green bean casserole
4336821332	mashed potatoes
4336819191	cauliflower
4336819191	fruit salad
4336819191	green beans/green bean casserole
4336819191	macaroni and cheese
4336819191	rolls/biscuits
4336819191	yams/sweet potato casserole
4336819043	carrots
4336819043	green beans/green bean casserole
4336819043	macaroni and cheese
4336819043	rolls/biscuits
4336816440	mashed potatoes
4336816440	rolls/biscuits
4336816440	other
4336815648	mashed potatoes
4336815463	brussel sprouts
4336815463	carrots
4336815463	green beans/green bean casserole
4336815463	rolls/biscuits
4336815463	yams/sweet potato casserole
4336815399	macaroni and cheese
4336815399	yams/sweet potato casserole
4336814310	carrots
4336814310	corn
4336814310	green beans/green bean casserole
4336814310	mashed potatoes
4336814310	rolls/biscuits
4336813874	corn
4336813874	mashed potatoes
4336813874	other
4336812402	carrots
4336812402	corn
4336812402	green beans/green bean casserole
4336812402	mashed potatoes
4336812402	rolls/biscuits
4336812402	yams/sweet potato casserole
4336811982	corn
4336811982	cornbread
4336811982	green beans/green bean casserole
4336811982	macaroni and cheese
4336811982	mashed potatoes
4336811982	rolls/biscuits
4336811982	yams/sweet potato casserole
4336811877	corn
4336811877	cornbread
4336811877	green beans/green bean casserole
4336811877	macaroni and cheese
4336811877	mashed potatoes
4336811877	rolls/biscuits
4336811877	yams/sweet potato casserole
4336811565	carrots
4336811565	green beans/green bean casserole
4336811565	squash
4336811492	corn
4336811492	fruit salad
4336811492	green beans/green bean casserole
4336811492	mashed potatoes
4336811492	rolls/biscuits
4336811492	yams/sweet potato casserole
4336810566	corn
4336810566	mashed potatoes
4336810566	rolls/biscuits
4336810566	squash
4336809276	green beans/green bean casserole
4336809276	mashed potatoes
4336809276	rolls/biscuits
4336809276	squash
4336809276	yams/sweet potato casserole
4336809276	other
4336809111	cornbread
4336809111	green beans/green bean casserole
4336809111	macaroni and cheese
4336809111	rolls/biscuits
4336809111	yams/sweet potato casserole
4336808397	carrots
4336808397	corn
4336808397	green beans/green bean casserole
4336808397	mashed potatoes
4336808397	rolls/biscuits
4336808397	other
4336808238	brussel sprouts
4336808238	carrots
4336808238	corn
4336808238	green beans/green bean casserole
4336808238	mashed potatoes
4336808238	rolls/biscuits
4336808238	yams/sweet potato casserole
4336808019	green beans/green bean casserole
4336808019	mashed potatoes
4336808019	rolls/biscuits
4336808019	yams/sweet potato casserole
4336807635	brussel sprouts
4336807635	green beans/green bean casserole
4336807635	macaroni and cheese
4336807635	mashed potatoes
4336807635	rolls/biscuits
4336806751	carrots
4336806751	cauliflower
4336806751	corn
4336806751	cornbread
4336806751	green beans/green bean casserole
4336806751	macaroni and cheese
4336806751	mashed potatoes
4336806751	rolls/biscuits
4336806751	squash
4336806751	vegetable salad
4336806751	yams/sweet potato casserole
4336804174	green beans/green bean casserole
4336804174	yams/sweet potato casserole
4336804003	corn
4336804003	fruit salad
4336804003	green beans/green bean casserole
4336804003	mashed potatoes
4336804003	rolls/biscuits
4336804003	squash
4336804003	yams/sweet potato casserole
4336802942	green beans/green bean casserole
4336802942	mashed potatoes
4336802942	rolls/biscuits
4336802942	yams/sweet potato casserole
4336802030	corn
4336802030	fruit salad
4336802030	green beans/green bean casserole
4336802030	mashed potatoes
4336802030	rolls/biscuits
4336802030	vegetable salad
4336802030	yams/sweet potato casserole
4336801887	green beans/green bean casserole
4336801887	mashed potatoes
4336801887	rolls/biscuits
4336801887	yams/sweet potato casserole
4336800334	cauliflower
4336800334	green beans/green bean casserole
4336800334	mashed potatoes
4336800334	rolls/biscuits
4336800334	squash
4336800334	yams/sweet potato casserole
4336800274	mashed potatoes
4336800274	squash
4336799773	brussel sprouts
4336799773	green beans/green bean casserole
4336799773	mashed potatoes
4336799773	rolls/biscuits
4336799773	yams/sweet potato casserole
4336799337	mashed potatoes
4336799337	squash
4336799337	other
4336799126	carrots
4336799126	corn
4336799126	mashed potatoes
4336799126	rolls/biscuits
4336799058	brussel sprouts
4336799058	carrots
4336799058	cauliflower
4336799058	corn
4336799058	mashed potatoes
4336799058	rolls/biscuits
4336799058	yams/sweet potato casserole
4336797746	carrots
4336797746	fruit salad
4336797746	green beans/green bean casserole
4336797746	mashed potatoes
4336797746	rolls/biscuits
4336797746	yams/sweet potato casserole
4336795509	corn
4336795509	green beans/green bean casserole
4336795509	mashed potatoes
4336795509	rolls/biscuits
4336795509	yams/sweet potato casserole
4336794143	corn
4336794143	green beans/green bean casserole
4336794143	mashed potatoes
4336794143	rolls/biscuits
4336794044	carrots
4336794044	corn
4336794044	green beans/green bean casserole
4336794044	mashed potatoes
4336794044	squash
4336794044	yams/sweet potato casserole
4336793943	corn
4336793943	green beans/green bean casserole
4336793943	mashed potatoes
4336793943	rolls/biscuits
4336793870	fruit salad
4336793870	green beans/green bean casserole
4336793870	mashed potatoes
4336793870	rolls/biscuits
4336793870	yams/sweet potato casserole
4336792331	green beans/green bean casserole
4336792331	mashed potatoes
4336792331	rolls/biscuits
4336792331	yams/sweet potato casserole
4336792302	corn
4336792302	fruit salad
4336792302	green beans/green bean casserole
4336792302	mashed potatoes
4336792302	rolls/biscuits
4336792302	yams/sweet potato casserole
4336790523	brussel sprouts
4336790523	corn
4336790523	cornbread
4336790523	green beans/green bean casserole
4336790523	yams/sweet potato casserole
4336789188	cornbread
4336789188	macaroni and cheese
4336789188	other
4336788022	green beans/green bean casserole
4336788022	mashed potatoes
4336788022	rolls/biscuits
4336788022	yams/sweet potato casserole
4336787017	corn
4336787017	green beans/green bean casserole
4336787017	mashed potatoes
4336787017	rolls/biscuits
4336787017	yams/sweet potato casserole
4336785978	cauliflower
4336785978	corn
4336785978	green beans/green bean casserole
4336785978	other
4336785048	corn
4336785048	mashed potatoes
4336785048	rolls/biscuits
4336785048	yams/sweet potato casserole
4336784825	mashed potatoes
4336784825	rolls/biscuits
4336784825	other
4336783082	carrots
4336783082	corn
4336783082	cornbread
4336783082	fruit salad
4336783082	green beans/green bean casserole
4336783082	mashed potatoes
4336783082	rolls/biscuits
4336783082	vegetable salad
4336783082	yams/sweet potato casserole
4336780483	carrots
4336780483	green beans/green bean casserole
4336780483	mashed potatoes
4336780483	rolls/biscuits
4336779288	carrots
4336779288	cauliflower
4336779288	corn
4336779288	cornbread
4336779288	macaroni and cheese
4336779288	mashed potatoes
4336779288	rolls/biscuits
4336779288	yams/sweet potato casserole
4336776734	fruit salad
4336776734	green beans/green bean casserole
4336776734	macaroni and cheese
4336776734	mashed potatoes
4336776734	rolls/biscuits
4336776734	other
4336775444	corn
4336775444	fruit salad
4336775444	mashed potatoes
4336775444	rolls/biscuits
4336775416	brussel sprouts
4336775416	carrots
4336775416	corn
4336775416	green beans/green bean casserole
4336775416	mashed potatoes
4336775416	rolls/biscuits
4336775416	squash
4336775416	yams/sweet potato casserole
4336774641	corn
4336774641	green beans/green bean casserole
4336774641	mashed potatoes
4336774641	rolls/biscuits
4336774641	yams/sweet potato casserole
4336772456	cornbread
4336772456	green beans/green bean casserole
4336772456	macaroni and cheese
4336772456	mashed potatoes
4336772456	rolls/biscuits
4336772456	squash
4336772456	yams/sweet potato casserole
4336772452	brussel sprouts
4336772452	green beans/green bean casserole
4336772452	mashed potatoes
4336772452	yams/sweet potato casserole
4336771206	corn
4336771206	fruit salad
4336771206	green beans/green bean casserole
4336771206	mashed potatoes
4336771206	rolls/biscuits
4336770959	cornbread
4336770959	macaroni and cheese
4336770959	mashed potatoes
4336770959	vegetable salad
4336768956	corn
4336768956	cornbread
4336768956	green beans/green bean casserole
4336768956	mashed potatoes
4336768956	rolls/biscuits
4336768662	brussel sprouts
4336768662	carrots
4336768662	corn
4336768662	rolls/biscuits
4336768662	squash
4336768149	brussel sprouts
4336768149	green beans/green bean casserole
4336768149	mashed potatoes
4336768149	rolls/biscuits
4336768149	yams/sweet potato casserole
4336767119	brussel sprouts
4336767119	corn
4336767119	mashed potatoes
4336767119	rolls/biscuits
4336767119	yams/sweet potato casserole
4336766876	fruit salad
4336766876	green beans/green bean casserole
4336766876	mashed potatoes
4336766876	rolls/biscuits
4336766876	yams/sweet potato casserole
4336764121	green beans/green bean casserole
4336764121	macaroni and cheese
4336764121	mashed potatoes
4336764121	rolls/biscuits
4336764087	corn
4336764087	green beans/green bean casserole
4336764087	mashed potatoes
4336764087	squash
4336764087	yams/sweet potato casserole
4336763694	carrots
4336763694	corn
4336763694	green beans/green bean casserole
4336763694	mashed potatoes
4336763694	yams/sweet potato casserole
4336763694	other
4336763416	carrots
4336763416	macaroni and cheese
4336763416	mashed potatoes
4336763416	rolls/biscuits
4336763416	yams/sweet potato casserole
4336763302	corn
4336763302	cornbread
4336763302	green beans/green bean casserole
4336763302	mashed potatoes
4336763302	rolls/biscuits
4336762600	mashed potatoes
4336762600	squash
4336762600	yams/sweet potato casserole
4336762600	other
4336762458	carrots
4336762458	corn
4336762458	mashed potatoes
4336762458	rolls/biscuits
4336762458	yams/sweet potato casserole
4336762096	carrots
4336762096	fruit salad
4336762096	green beans/green bean casserole
4336762096	mashed potatoes
4336762096	rolls/biscuits
4336762096	squash
4336762096	vegetable salad
4336761799	brussel sprouts
4336761799	green beans/green bean casserole
4336761799	mashed potatoes
4336761799	rolls/biscuits
4336761799	yams/sweet potato casserole
4336761290	green beans/green bean casserole
4336761290	mashed potatoes
4336760341	brussel sprouts
4336760341	carrots
4336760341	corn
4336760341	fruit salad
4336760341	green beans/green bean casserole
4336760341	mashed potatoes
4336760341	rolls/biscuits
4336760341	vegetable salad
4336760341	yams/sweet potato casserole
4336760110	brussel sprouts
4336760110	corn
4336760110	cornbread
4336760110	green beans/green bean casserole
4336760110	mashed potatoes
4336760110	squash
4336759353	cornbread
4336759353	green beans/green bean casserole
4336759353	mashed potatoes
4336759353	rolls/biscuits
4336759353	vegetable salad
4336758840	carrots
4336758840	corn
4336758840	green beans/green bean casserole
4336758840	mashed potatoes
4336758840	rolls/biscuits
4336758840	yams/sweet potato casserole
4336756589	green beans/green bean casserole
4336756589	mashed potatoes
4336756589	rolls/biscuits
4336756589	vegetable salad
4336756589	yams/sweet potato casserole
4336756075	corn
4336756075	green beans/green bean casserole
4336756075	mashed potatoes
4336756075	rolls/biscuits
4336756075	yams/sweet potato casserole
4336754872	corn
4336754872	cornbread
4336754872	fruit salad
4336754872	green beans/green bean casserole
4336754457	brussel sprouts
4336754457	fruit salad
4336754457	green beans/green bean casserole
4336754457	mashed potatoes
4336754457	rolls/biscuits
4336754457	yams/sweet potato casserole
4336754179	mashed potatoes
4336752791	brussel sprouts
4336752791	cauliflower
4336752791	rolls/biscuits
4336752791	squash
4336752791	yams/sweet potato casserole
4336752314	corn
4336752314	green beans/green bean casserole
4336752314	macaroni and cheese
4336752314	mashed potatoes
4336752314	rolls/biscuits
4336752112	corn
4336752112	mashed potatoes
4336752112	vegetable salad
4336749249	carrots
4336749249	green beans/green bean casserole
4336749249	mashed potatoes
4336749249	rolls/biscuits
4336749249	squash
4336749249	other
4336748097	carrots
4336748097	corn
4336748097	cornbread
4336748097	green beans/green bean casserole
4336748097	mashed potatoes
4336747306	carrots
4336747306	green beans/green bean casserole
4336747306	mashed potatoes
4336747306	rolls/biscuits
4336747306	squash
4336747306	vegetable salad
4336746217	mashed potatoes
4336746217	rolls/biscuits
4336746110	macaroni and cheese
4336746110	mashed potatoes
4336746110	rolls/biscuits
4336746110	vegetable salad
4336746110	yams/sweet potato casserole
4336746002	fruit salad
4336746002	macaroni and cheese
4336746002	rolls/biscuits
4336746002	yams/sweet potato casserole
4336746002	other
4336745373	green beans/green bean casserole
4336745373	macaroni and cheese
4336745373	mashed potatoes
4336745373	rolls/biscuits
4336745373	squash
4336745373	yams/sweet potato casserole
4336744632	green beans/green bean casserole
4336744632	mashed potatoes
4336744632	rolls/biscuits
4336744632	vegetable salad
4336743563	mashed potatoes
4336743563	rolls/biscuits
4336743563	yams/sweet potato casserole
4336738591	green beans/green bean casserole
4336738214	corn
4336738214	cornbread
4336738214	green beans/green bean casserole
4336738214	macaroni and cheese
4336738214	yams/sweet potato casserole
4336736562	brussel sprouts
4336736562	cornbread
4336736562	mashed potatoes
4336736562	rolls/biscuits
4336733948	brussel sprouts
4336733948	green beans/green bean casserole
4336733948	mashed potatoes
4336733948	rolls/biscuits
4336733948	yams/sweet potato casserole
4336731531	carrots
4336731531	corn
4336731531	green beans/green bean casserole
4336731531	mashed potatoes
4336731531	rolls/biscuits
4336731531	vegetable salad
4336728581	fruit salad
4336728581	green beans/green bean casserole
4336728581	mashed potatoes
4336728581	rolls/biscuits
4336728581	yams/sweet potato casserole
4336728147	corn
4336728147	green beans/green bean casserole
4336728147	mashed potatoes
4336728147	rolls/biscuits
4336727141	green beans/green bean casserole
4336727141	mashed potatoes
4336727141	rolls/biscuits
4336727141	squash
4336727141	yams/sweet potato casserole
4336726910	green beans/green bean casserole
4336726910	mashed potatoes
4336726910	rolls/biscuits
4336726144	green beans/green bean casserole
4336726144	mashed potatoes
4336726144	rolls/biscuits
4336726144	squash
4336726144	vegetable salad
4336726144	yams/sweet potato casserole
4336726144	other
4336725284	carrots
4336725284	mashed potatoes
4336722668	green beans/green bean casserole
4336722668	macaroni and cheese
4336722668	mashed potatoes
4336722668	rolls/biscuits
4336722668	yams/sweet potato casserole
4336722051	mashed potatoes
4336722051	rolls/biscuits
4336722051	yams/sweet potato casserole
4336721418	corn
4336721418	fruit salad
4336721418	green beans/green bean casserole
4336721418	mashed potatoes
4336721418	rolls/biscuits
4336721418	squash
4336721418	yams/sweet potato casserole
4336719997	corn
4336719997	cornbread
4336719997	fruit salad
4336719997	mashed potatoes
4336719997	vegetable salad
4336719997	yams/sweet potato casserole
4336719266	brussel sprouts
4336719266	mashed potatoes
4336719266	rolls/biscuits
4336719266	yams/sweet potato casserole
4336717891	green beans/green bean casserole
4336717891	mashed potatoes
4336717891	rolls/biscuits
4336717466	cauliflower
4336717466	green beans/green bean casserole
4336717466	mashed potatoes
4336717466	rolls/biscuits
4336717466	vegetable salad
4336717454	cornbread
4336717454	green beans/green bean casserole
4336717454	macaroni and cheese
4336717454	mashed potatoes
4336717454	rolls/biscuits
4336717454	yams/sweet potato casserole
4336714289	carrots
4336714289	mashed potatoes
4336714289	rolls/biscuits
4336714289	yams/sweet potato casserole
4336714072	corn
4336714072	fruit salad
4336714072	green beans/green bean casserole
4336714072	macaroni and cheese
4336714072	rolls/biscuits
4336714072	yams/sweet potato casserole
4336714072	other
4336713367	green beans/green bean casserole
4336713367	mashed potatoes
4336713367	rolls/biscuits
4336713367	yams/sweet potato casserole
4336711671	corn
4336711671	green beans/green bean casserole
4336711671	mashed potatoes
4336711671	rolls/biscuits
4336711671	yams/sweet potato casserole
4336707912	green beans/green bean casserole
4336707912	macaroni and cheese
4336707912	rolls/biscuits
4336707912	squash
4336707912	yams/sweet potato casserole
4336707912	other
4336706821	carrots
4336706821	corn
4336706821	fruit salad
4336706821	green beans/green bean casserole
4336706821	mashed potatoes
4336706821	rolls/biscuits
4336706821	squash
4336706821	yams/sweet potato casserole
4336702108	corn
4336702108	mashed potatoes
4336702108	rolls/biscuits
4336702108	yams/sweet potato casserole
4336702007	green beans/green bean casserole
4336702007	mashed potatoes
4336702007	rolls/biscuits
4336701807	mashed potatoes
4336701591	green beans/green bean casserole
4336701591	mashed potatoes
4336701591	rolls/biscuits
4336701591	yams/sweet potato casserole
4336700179	carrots
4336700179	corn
4336700179	cornbread
4336700179	green beans/green bean casserole
4336700179	mashed potatoes
4336700179	rolls/biscuits
4336700179	squash
4336700179	yams/sweet potato casserole
4336699442	carrots
4336699442	vegetable salad
4336699442	yams/sweet potato casserole
4336699080	corn
4336699080	fruit salad
4336699080	green beans/green bean casserole
4336699080	mashed potatoes
4336699080	yams/sweet potato casserole
4336698057	green beans/green bean casserole
4336698057	mashed potatoes
4336698057	rolls/biscuits
4336698057	yams/sweet potato casserole
4336697274	green beans/green bean casserole
4336697274	mashed potatoes
4336696561	brussel sprouts
4336696561	carrots
4336696561	cauliflower
4336696561	mashed potatoes
4336696561	rolls/biscuits
4336696561	squash
4336692873	brussel sprouts
4336692873	carrots
4336692873	mashed potatoes
4336692873	squash
4336692199	carrots
4336692199	corn
4336692199	green beans/green bean casserole
4336692199	mashed potatoes
4336692199	rolls/biscuits
4336692199	squash
4336692199	yams/sweet potato casserole
4336690603	corn
4336690603	green beans/green bean casserole
4336690603	mashed potatoes
4336690603	rolls/biscuits
4336690603	yams/sweet potato casserole
4336689196	corn
4336689196	mashed potatoes
4336689196	rolls/biscuits
4336688947	brussel sprouts
4336688947	carrots
4336688947	cauliflower
4336688947	cornbread
4336688947	mashed potatoes
4336681909	corn
4336681909	cornbread
4336681909	green beans/green bean casserole
4336681909	mashed potatoes
4336681909	rolls/biscuits
4336681398	mashed potatoes
4336681398	rolls/biscuits
4336681398	vegetable salad
4336679323	corn
4336679323	green beans/green bean casserole
4336679323	rolls/biscuits
4336679323	yams/sweet potato casserole
4336678787	corn
4336678787	fruit salad
4336678787	green beans/green bean casserole
4336678787	macaroni and cheese
4336678787	mashed potatoes
4336678787	rolls/biscuits
4336678787	yams/sweet potato casserole
4336675538	carrots
4336675538	corn
4336675538	mashed potatoes
4336675538	rolls/biscuits
4336675538	squash
4336675538	vegetable salad
4336674655	rolls/biscuits
4336674655	vegetable salad
4336671419	cornbread
4336671419	macaroni and cheese
4336671419	yams/sweet potato casserole
4336670313	green beans/green bean casserole
4336670313	mashed potatoes
4336670313	rolls/biscuits
4336670313	squash
4336670313	yams/sweet potato casserole
4336670027	green beans/green bean casserole
4336670027	mashed potatoes
4336670027	rolls/biscuits
4336665828	cornbread
4336665828	green beans/green bean casserole
4336665828	mashed potatoes
4336665828	yams/sweet potato casserole
4336665636	cornbread
4336665636	green beans/green bean casserole
4336665636	macaroni and cheese
4336665636	mashed potatoes
4336665636	rolls/biscuits
4336665636	vegetable salad
4336665636	yams/sweet potato casserole
4336665636	other
4336665537	brussel sprouts
4336665537	green beans/green bean casserole
4336665537	mashed potatoes
4336665537	rolls/biscuits
4336665537	squash
4336665537	yams/sweet potato casserole
4336665417	carrots
4336665417	green beans/green bean casserole
4336665417	mashed potatoes
4336665417	rolls/biscuits
4336665417	yams/sweet potato casserole
4336662967	green beans/green bean casserole
4336660983	carrots
4336660983	cauliflower
4336660983	cornbread
4336660983	green beans/green bean casserole
4336660983	mashed potatoes
4336660983	rolls/biscuits
4336660983	yams/sweet potato casserole
4336660839	green beans/green bean casserole
4336660839	mashed potatoes
4336660839	rolls/biscuits
4336660839	squash
4336657464	carrots
4336657464	green beans/green bean casserole
4336657464	mashed potatoes
4336657464	rolls/biscuits
4336657464	yams/sweet potato casserole
4336654576	carrots
4336654576	cornbread
4336654576	fruit salad
4336654576	green beans/green bean casserole
4336654576	macaroni and cheese
4336654576	mashed potatoes
4336654576	rolls/biscuits
4336654576	vegetable salad
4336653814	brussel sprouts
4336653814	carrots
4336653814	green beans/green bean casserole
4336653814	macaroni and cheese
4336653814	mashed potatoes
4336653814	rolls/biscuits
4336653814	squash
4336653814	yams/sweet potato casserole
4336651539	cornbread
4336646584	corn
4336646584	fruit salad
4336646584	mashed potatoes
4336646584	rolls/biscuits
4336646584	yams/sweet potato casserole
4336644693	other
4336643754	macaroni and cheese
4336643722	corn
4336643722	cornbread
4336643722	fruit salad
4336643722	green beans/green bean casserole
4336643722	mashed potatoes
4336643722	rolls/biscuits
4336643722	squash
4336643722	yams/sweet potato casserole
4336643107	green beans/green bean casserole
4336643107	mashed potatoes
4336643107	rolls/biscuits
4336643107	yams/sweet potato casserole
4336640736	carrots
4336640736	green beans/green bean casserole
4336640736	mashed potatoes
4336640736	rolls/biscuits
4336640736	yams/sweet potato casserole
4336640541	corn
4336640541	macaroni and cheese
4336640541	mashed potatoes
4336640541	rolls/biscuits
4336640541	yams/sweet potato casserole
4336639517	corn
4336639517	cornbread
4336639517	green beans/green bean casserole
4336639517	macaroni and cheese
4336639517	rolls/biscuits
4336639517	squash
4336639517	vegetable salad
4336639517	yams/sweet potato casserole
4336639517	other
4336638494	mashed potatoes
4336638494	rolls/biscuits
4336638494	yams/sweet potato casserole
4336637202	carrots
4336637202	corn
4336637202	mashed potatoes
4336637202	rolls/biscuits
4336637202	squash
4336636152	cauliflower
4336636152	mashed potatoes
4336636152	vegetable salad
4336634372	cornbread
4336634372	fruit salad
4336634372	green beans/green bean casserole
4336634372	mashed potatoes
4336634372	rolls/biscuits
4336634372	vegetable salad
4336634372	yams/sweet potato casserole
4336626273	green beans/green bean casserole
4336626273	rolls/biscuits
4336626273	yams/sweet potato casserole
4336625061	brussel sprouts
4336625061	mashed potatoes
4336625061	rolls/biscuits
4336625061	yams/sweet potato casserole
4336623766	corn
4336623766	rolls/biscuits
4336623766	yams/sweet potato casserole
4336620413	brussel sprouts
4336620413	cauliflower
4336620413	corn
4336620413	green beans/green bean casserole
4336620413	macaroni and cheese
4336620413	mashed potatoes
4336620413	rolls/biscuits
4336620413	squash
4336620413	yams/sweet potato casserole
4336618877	corn
4336618877	fruit salad
4336618877	macaroni and cheese
4336618877	mashed potatoes
4336618002	green beans/green bean casserole
4336618002	mashed potatoes
4336618002	rolls/biscuits
4336618002	vegetable salad
4336618002	yams/sweet potato casserole
4336614170	brussel sprouts
4336614170	carrots
4336614170	cauliflower
4336614170	corn
4336614170	cornbread
4336614170	green beans/green bean casserole
4336614170	mashed potatoes
4336614170	rolls/biscuits
4336614170	yams/sweet potato casserole
4336612504	corn
4336612504	cornbread
4336612504	green beans/green bean casserole
4336612504	macaroni and cheese
4336612504	mashed potatoes
4336612504	rolls/biscuits
4336612504	yams/sweet potato casserole
4336611982	green beans/green bean casserole
4336611982	rolls/biscuits
4336611982	yams/sweet potato casserole
4336611199	green beans/green bean casserole
4336611199	macaroni and cheese
4336611199	mashed potatoes
4336611199	rolls/biscuits
4336611199	yams/sweet potato casserole
4336611199	other
4336603089	brussel sprouts
4336603089	carrots
4336603089	corn
4336603089	green beans/green bean casserole
4336603089	macaroni and cheese
4336603089	mashed potatoes
4336603089	rolls/biscuits
4336603089	vegetable salad
4336603089	yams/sweet potato casserole
4336602707	carrots
4336602707	fruit salad
4336602707	green beans/green bean casserole
4336602707	macaroni and cheese
4336602707	yams/sweet potato casserole
4336601397	green beans/green bean casserole
4336601397	mashed potatoes
4336596402	brussel sprouts
4336596402	corn
4336596402	cornbread
4336596402	green beans/green bean casserole
4336596402	mashed potatoes
4336596402	rolls/biscuits
4336596402	yams/sweet potato casserole
4336596402	other
4336594873	corn
4336594873	macaroni and cheese
4336594873	rolls/biscuits
4336594873	squash
4336594744	green beans/green bean casserole
4336594744	macaroni and cheese
4336594744	mashed potatoes
4336594744	rolls/biscuits
4336594744	yams/sweet potato casserole
4336594299	corn
4336594299	green beans/green bean casserole
4336594299	mashed potatoes
4336594299	rolls/biscuits
4336594299	yams/sweet potato casserole
4336593880	carrots
4336593880	green beans/green bean casserole
4336593880	mashed potatoes
4336593880	rolls/biscuits
4336593880	squash
4336593880	yams/sweet potato casserole
4336592653	corn
4336592653	cornbread
4336592653	green beans/green bean casserole
4336592653	mashed potatoes
4336592653	rolls/biscuits
4336592653	vegetable salad
4336592653	yams/sweet potato casserole
4336592653	other
4336586686	carrots
4336586686	cornbread
4336586686	mashed potatoes
4336586686	rolls/biscuits
4336586686	yams/sweet potato casserole
4336581703	brussel sprouts
4336581703	carrots
4336581703	corn
4336581703	mashed potatoes
4336581703	rolls/biscuits
4336581703	yams/sweet potato casserole
4336580777	corn
4336580777	macaroni and cheese
4336580777	rolls/biscuits
4336580777	yams/sweet potato casserole
4336574897	cornbread
4336574897	fruit salad
4336574897	green beans/green bean casserole
4336574897	macaroni and cheese
4336574897	mashed potatoes
4336574897	rolls/biscuits
4336574897	yams/sweet potato casserole
4336574897	other
4336574336	fruit salad
4336574336	green beans/green bean casserole
4336574336	mashed potatoes
4336574336	rolls/biscuits
4336574336	yams/sweet potato casserole
4336574124	green beans/green bean casserole
4336574124	yams/sweet potato casserole
4336570007	green beans/green bean casserole
4336570007	mashed potatoes
4336570007	rolls/biscuits
4336570007	squash
4336570007	vegetable salad
4336570007	yams/sweet potato casserole
4336559810	green beans/green bean casserole
4336559810	mashed potatoes
4336559810	rolls/biscuits
4336557451	brussel sprouts
4336557451	carrots
4336557451	cauliflower
4336557451	corn
4336557451	cornbread
4336557451	fruit salad
4336557451	green beans/green bean casserole
4336557451	macaroni and cheese
4336557451	mashed potatoes
4336557451	rolls/biscuits
4336557451	squash
4336557451	vegetable salad
4336557451	yams/sweet potato casserole
4336554350	cauliflower
4336554350	corn
4336554350	mashed potatoes
4336554350	rolls/biscuits
4336554350	squash
4336549169	corn
4336549169	green beans/green bean casserole
4336549169	mashed potatoes
4336549169	rolls/biscuits
4336549169	yams/sweet potato casserole
4336548962	corn
4336548962	fruit salad
4336548962	green beans/green bean casserole
4336548962	mashed potatoes
4336548962	rolls/biscuits
4336548962	squash
4336548962	yams/sweet potato casserole
4336547916	brussel sprouts
4336547916	mashed potatoes
4336547916	yams/sweet potato casserole
4336547275	brussel sprouts
4336547275	carrots
4336547275	corn
4336547275	cornbread
4336547275	fruit salad
4336547275	mashed potatoes
4336547275	rolls/biscuits
4336547275	yams/sweet potato casserole
4336546028	green beans/green bean casserole
4336546028	mashed potatoes
4336546028	yams/sweet potato casserole
4336544071	corn
4336544071	cornbread
4336544071	green beans/green bean casserole
4336544071	macaroni and cheese
4336544071	mashed potatoes
4336544071	rolls/biscuits
4336544071	yams/sweet potato casserole
4336543220	carrots
4336543220	fruit salad
4336543220	green beans/green bean casserole
4336543220	rolls/biscuits
4336541332	corn
4336541332	cornbread
4336541332	green beans/green bean casserole
4336541332	mashed potatoes
4336541332	rolls/biscuits
4336541332	squash
4336541332	yams/sweet potato casserole
4336540513	brussel sprouts
4336540513	cornbread
4336540513	green beans/green bean casserole
4336540513	mashed potatoes
4336540513	rolls/biscuits
4336540513	yams/sweet potato casserole
4336535098	fruit salad
4336535098	mashed potatoes
4336535098	rolls/biscuits
4336535098	squash
4336535098	yams/sweet potato casserole
4336533400	carrots
4336533400	corn
4336533400	green beans/green bean casserole
4336533400	mashed potatoes
4336533400	rolls/biscuits
4336533400	yams/sweet potato casserole
4336527571	corn
4336527571	fruit salad
4336527571	green beans/green bean casserole
4336527571	rolls/biscuits
4336527571	yams/sweet potato casserole
4336527545	corn
4336527545	green beans/green bean casserole
4336527545	mashed potatoes
4336527545	rolls/biscuits
4336524165	corn
4336524165	mashed potatoes
4336524165	other
4336522973	mashed potatoes
4336520950	brussel sprouts
4336520950	green beans/green bean casserole
4336520950	mashed potatoes
4336520950	rolls/biscuits
4336520950	yams/sweet potato casserole
4336518573	corn
4336518573	cornbread
4336518573	macaroni and cheese
4336518573	rolls/biscuits
4336518573	yams/sweet potato casserole
4336516793	corn
4336516793	green beans/green bean casserole
4336516793	mashed potatoes
4336512650	green beans/green bean casserole
4336512650	mashed potatoes
4336512650	rolls/biscuits
4336512650	yams/sweet potato casserole
4336510658	fruit salad
4336510658	green beans/green bean casserole
4336510658	rolls/biscuits
4336510658	yams/sweet potato casserole
4336509936	other
4336505029	carrots
4336505029	cauliflower
4336505029	mashed potatoes
4336505029	rolls/biscuits
4336500591	corn
4336500591	green beans/green bean casserole
4336500591	mashed potatoes
4336500591	rolls/biscuits
4336498949	corn
4336498949	green beans/green bean casserole
4336498949	mashed potatoes
4336498949	squash
4336497964	fruit salad
4336497964	mashed potatoes
4336497964	rolls/biscuits
4336497964	squash
4336497964	vegetable salad
4336497964	yams/sweet potato casserole
4336497833	brussel sprouts
4336497833	corn
4336497833	green beans/green bean casserole
4336497833	mashed potatoes
4336497833	rolls/biscuits
4336497833	vegetable salad
4336496891	brussel sprouts
4336496891	carrots
4336496891	corn
4336496891	cornbread
4336496891	fruit salad
4336496891	green beans/green bean casserole
4336496891	squash
4336496891	vegetable salad
4336496891	yams/sweet potato casserole
4336495665	brussel sprouts
4336495665	cornbread
4336495665	green beans/green bean casserole
4336495665	macaroni and cheese
4336495665	mashed potatoes
4336495665	yams/sweet potato casserole
4336490883	carrots
4336490883	corn
4336490883	cornbread
4336490883	green beans/green bean casserole
4336490883	macaroni and cheese
4336490883	mashed potatoes
4336490883	rolls/biscuits
4336490883	yams/sweet potato casserole
4336490784	brussel sprouts
4336490784	corn
4336490784	green beans/green bean casserole
4336490784	mashed potatoes
4336490784	rolls/biscuits
4336490784	yams/sweet potato casserole
4336490014	green beans/green bean casserole
4336490014	mashed potatoes
4336490014	rolls/biscuits
4336487804	green beans/green bean casserole
4336487804	macaroni and cheese
4336487804	mashed potatoes
4336487804	rolls/biscuits
4336486285	corn
4336486285	cornbread
4336486285	green beans/green bean casserole
4336486285	mashed potatoes
4336486285	rolls/biscuits
4336486285	yams/sweet potato casserole
4336480011	corn
4336480011	cornbread
4336480011	mashed potatoes
4336480011	rolls/biscuits
4336479126	green beans/green bean casserole
4336479126	mashed potatoes
4336479126	rolls/biscuits
4336479126	squash
4336478617	brussel sprouts
4336478617	green beans/green bean casserole
4336478617	mashed potatoes
4336478617	vegetable salad
4336477366	corn
4336477366	green beans/green bean casserole
4336477366	macaroni and cheese
4336477366	rolls/biscuits
4336477366	yams/sweet potato casserole
4336471362	carrots
4336471362	green beans/green bean casserole
4336471362	mashed potatoes
4336471362	yams/sweet potato casserole
4336471066	green beans/green bean casserole
4336471066	mashed potatoes
4336471066	rolls/biscuits
4336471066	yams/sweet potato casserole
4336467288	corn
4336467288	green beans/green bean casserole
4336467288	mashed potatoes
4336467288	rolls/biscuits
4336467288	yams/sweet potato casserole
4336465723	corn
4336465723	cornbread
4336465723	green beans/green bean casserole
4336465723	macaroni and cheese
4336465723	mashed potatoes
4336465723	rolls/biscuits
4336465723	yams/sweet potato casserole
4336465404	brussel sprouts
4336465404	mashed potatoes
4336465404	squash
4336465104	carrots
4336465104	corn
4336465104	green beans/green bean casserole
4336465104	macaroni and cheese
4336465104	mashed potatoes
4336465104	rolls/biscuits
4336465104	squash
4336465104	yams/sweet potato casserole
4336464178	brussel sprouts
4336464178	carrots
4336464178	cauliflower
4336464178	corn
4336464178	cornbread
4336464178	fruit salad
4336464178	green beans/green bean casserole
4336464178	mashed potatoes
4336464178	rolls/biscuits
4336464178	squash
4336464178	vegetable salad
4336464178	yams/sweet potato casserole
4336463294	corn
4336463294	cornbread
4336463294	green beans/green bean casserole
4336463294	macaroni and cheese
4336463294	mashed potatoes
4336463294	rolls/biscuits
4336463294	squash
4336463294	yams/sweet potato casserole
4336460536	corn
4336460536	cornbread
4336460536	green beans/green bean casserole
4336460536	macaroni and cheese
4336460536	mashed potatoes
4336460536	rolls/biscuits
4336460536	yams/sweet potato casserole
4336459298	corn
4336459298	green beans/green bean casserole
4336459298	mashed potatoes
4336459298	rolls/biscuits
4336459298	yams/sweet potato casserole
4336457715	corn
4336457715	green beans/green bean casserole
4336457715	mashed potatoes
4336457715	rolls/biscuits
4336452468	corn
4336452468	cornbread
4336452468	green beans/green bean casserole
4336452468	yams/sweet potato casserole
4336449973	green beans/green bean casserole
4336449973	macaroni and cheese
4336449973	yams/sweet potato casserole
4336448779	mashed potatoes
4336448779	rolls/biscuits
4336448779	vegetable salad
4336442018	cauliflower
4336442018	corn
4336442018	cornbread
4336442018	fruit salad
4336442018	green beans/green bean casserole
4336442018	mashed potatoes
4336442018	rolls/biscuits
4336442018	yams/sweet potato casserole
4336433694	corn
4336433694	green beans/green bean casserole
4336433694	macaroni and cheese
4336433694	mashed potatoes
4336433694	rolls/biscuits
4336433694	yams/sweet potato casserole
4336433694	other
4336426326	fruit salad
4336426326	green beans/green bean casserole
4336426326	mashed potatoes
4336426326	yams/sweet potato casserole
4336426326	other
4336426077	carrots
4336426077	fruit salad
4336426077	green beans/green bean casserole
4336426077	mashed potatoes
4336426077	rolls/biscuits
4336426077	yams/sweet potato casserole
4336422509	green beans/green bean casserole
4336422509	mashed potatoes
4336422509	rolls/biscuits
4336420032	brussel sprouts
4336420032	corn
4336420032	green beans/green bean casserole
4336420032	mashed potatoes
4336420032	rolls/biscuits
4336420032	yams/sweet potato casserole
4336414511	fruit salad
4336414511	green beans/green bean casserole
4336414511	mashed potatoes
4336414511	rolls/biscuits
4336414511	squash
4336414511	yams/sweet potato casserole
4336405712	carrots
4336405712	corn
4336405712	green beans/green bean casserole
4336405712	macaroni and cheese
4336405712	squash
4336405712	yams/sweet potato casserole
4336403950	corn
4336403950	cornbread
4336403950	mashed potatoes
4336403950	rolls/biscuits
4336403950	yams/sweet potato casserole
4336403233	corn
4336403233	cornbread
4336403233	macaroni and cheese
4336403233	mashed potatoes
4336403233	rolls/biscuits
4336403233	yams/sweet potato casserole
4336400854	carrots
4336400854	cauliflower
4336400854	green beans/green bean casserole
4336400854	mashed potatoes
4336400854	rolls/biscuits
4336400854	yams/sweet potato casserole
4336391382	carrots
4336391382	corn
4336391382	cornbread
4336391382	green beans/green bean casserole
4336391382	macaroni and cheese
4336391382	mashed potatoes
4336391382	rolls/biscuits
4336391382	yams/sweet potato casserole
4336387798	corn
4336387798	mashed potatoes
4336387798	rolls/biscuits
4336387798	yams/sweet potato casserole
4336381595	carrots
4336381595	fruit salad
4336381595	green beans/green bean casserole
4336379876	corn
4336379876	green beans/green bean casserole
4336379876	mashed potatoes
4336379876	rolls/biscuits
4336379876	squash
4336379876	vegetable salad
4336376803	carrots
4336376803	cauliflower
4336376803	corn
4336376803	cornbread
4336376803	fruit salad
4336376803	green beans/green bean casserole
4336376803	mashed potatoes
4336376803	rolls/biscuits
4336376803	yams/sweet potato casserole
4336376443	brussel sprouts
4336376443	green beans/green bean casserole
4336376443	macaroni and cheese
4336376443	mashed potatoes
4336376443	rolls/biscuits
4336376443	yams/sweet potato casserole
4336371555	corn
4336371555	green beans/green bean casserole
4336371555	mashed potatoes
4336371555	rolls/biscuits
4336371555	other
4336368343	corn
4336368343	fruit salad
4336368343	mashed potatoes
4336368343	rolls/biscuits
4336368343	squash
4336368343	yams/sweet potato casserole
4336368281	cornbread
4336368281	macaroni and cheese
4336368281	mashed potatoes
4336368281	rolls/biscuits
4336368281	yams/sweet potato casserole
4336368281	other
4336366345	corn
4336366345	macaroni and cheese
4336366345	mashed potatoes
4336366345	yams/sweet potato casserole
4336366345	other
4336365763	brussel sprouts
4336365763	carrots
4336365763	green beans/green bean casserole
4336365763	mashed potatoes
4336365763	rolls/biscuits
4336365763	vegetable salad
4336365763	yams/sweet potato casserole
4336351539	corn
4336351539	fruit salad
4336351539	rolls/biscuits
4336351224	corn
4336351224	cornbread
4336351224	green beans/green bean casserole
4336351224	macaroni and cheese
4336351224	mashed potatoes
4336351224	rolls/biscuits
4336351224	yams/sweet potato casserole
4336348590	corn
4336348590	fruit salad
4336348590	green beans/green bean casserole
4336348590	mashed potatoes
4336348590	rolls/biscuits
4336348590	yams/sweet potato casserole
4336346355	brussel sprouts
4336346355	cornbread
4336346355	green beans/green bean casserole
4336346355	mashed potatoes
4336346355	rolls/biscuits
4336346355	squash
4336346355	yams/sweet potato casserole
4336337183	carrots
4336337183	green beans/green bean casserole
4336337183	mashed potatoes
4336337183	rolls/biscuits
4336337183	yams/sweet potato casserole
4336336129	green beans/green bean casserole
4336336129	mashed potatoes
4336336129	rolls/biscuits
4336336129	yams/sweet potato casserole
4336333982	corn
4336333982	cornbread
4336333982	fruit salad
4336333982	green beans/green bean casserole
4336333982	mashed potatoes
4336333982	rolls/biscuits
4336333982	yams/sweet potato casserole
4336326250	brussel sprouts
4336326250	green beans/green bean casserole
4336326250	mashed potatoes
4336326250	rolls/biscuits
4336326250	squash
4336326250	yams/sweet potato casserole
4336324874	mashed potatoes
4336324874	rolls/biscuits
4336324874	yams/sweet potato casserole
4336322606	corn
4336322606	cornbread
4336322606	green beans/green bean casserole
4336322606	macaroni and cheese
4336322606	mashed potatoes
4336322606	rolls/biscuits
4336321558	green beans/green bean casserole
4336321558	yams/sweet potato casserole
4336317891	green beans/green bean casserole
4336317891	mashed potatoes
4336317891	rolls/biscuits
4336317891	yams/sweet potato casserole
4336313453	brussel sprouts
4336313453	carrots
4336313453	green beans/green bean casserole
4336313453	mashed potatoes
4336313453	rolls/biscuits
4336313453	squash
4336313453	yams/sweet potato casserole
4336313021	corn
4336313021	mashed potatoes
4336313021	rolls/biscuits
4336313021	yams/sweet potato casserole
4336312523	corn
4336312523	cornbread
4336312523	mashed potatoes
4336312523	other
4336306664	green beans/green bean casserole
4336306664	mashed potatoes
4336306664	rolls/biscuits
4336306664	yams/sweet potato casserole
4336306664	other
4336302631	corn
4336302631	green beans/green bean casserole
4336302631	macaroni and cheese
4336302631	mashed potatoes
4336302631	rolls/biscuits
4336301847	green beans/green bean casserole
4336301847	mashed potatoes
4336301847	rolls/biscuits
4336301847	yams/sweet potato casserole
4336299882	corn
4336299882	cornbread
4336299882	green beans/green bean casserole
4336299882	macaroni and cheese
4336299882	rolls/biscuits
4336299882	vegetable salad
4336299882	yams/sweet potato casserole
4336298829	brussel sprouts
4336298829	corn
4336298829	fruit salad
4336298829	green beans/green bean casserole
4336298829	mashed potatoes
4336298829	rolls/biscuits
4336298829	yams/sweet potato casserole
4336288339	corn
4336288339	mashed potatoes
4336288339	rolls/biscuits
4336288339	yams/sweet potato casserole
4336288217	carrots
4336288217	fruit salad
4336288217	green beans/green bean casserole
4336288217	macaroni and cheese
4336288217	rolls/biscuits
4336288217	vegetable salad
4336288217	yams/sweet potato casserole
4336276238	corn
4336276238	mashed potatoes
4336276238	rolls/biscuits
4336276238	vegetable salad
4336271469	corn
4336271469	green beans/green bean casserole
4336271469	mashed potatoes
4336271469	rolls/biscuits
4336271469	yams/sweet potato casserole
4336271469	other
4336258240	fruit salad
4336255036	green beans/green bean casserole
4336255036	yams/sweet potato casserole
4336249082	carrots
4336249082	cauliflower
4336249082	corn
4336249082	cornbread
4336249082	fruit salad
4336249082	green beans/green bean casserole
4336249082	mashed potatoes
4336249082	rolls/biscuits
4336248435	carrots
4336248435	fruit salad
4336248435	mashed potatoes
4336248435	rolls/biscuits
4336248435	squash
4336248435	vegetable salad
4336248435	yams/sweet potato casserole
4336238126	brussel sprouts
4336238126	carrots
4336238126	green beans/green bean casserole
4336238126	mashed potatoes
4336238126	yams/sweet potato casserole
4336235428	brussel sprouts
4336235428	corn
4336235428	green beans/green bean casserole
4336235428	mashed potatoes
4336235428	rolls/biscuits
4336235428	squash
4336232691	green beans/green bean casserole
4336232691	mashed potatoes
4336232691	rolls/biscuits
4336231459	corn
4336231459	cornbread
4336231459	green beans/green bean casserole
4336231459	mashed potatoes
4336231459	rolls/biscuits
4336227131	brussel sprouts
4336227131	fruit salad
4336227131	green beans/green bean casserole
4336227131	mashed potatoes
4336227131	rolls/biscuits
4336227131	yams/sweet potato casserole
4336224500	brussel sprouts
4336224500	cauliflower
4336224500	corn
4336224500	cornbread
4336224500	green beans/green bean casserole
4336224500	macaroni and cheese
4336224500	mashed potatoes
4336224500	rolls/biscuits
4336221484	green beans/green bean casserole
4336221484	mashed potatoes
4336221484	rolls/biscuits
4336221484	squash
4336221484	vegetable salad
4336221484	yams/sweet potato casserole
4336215705	cauliflower
4336215705	corn
4336215705	fruit salad
4336215705	macaroni and cheese
4336215705	rolls/biscuits
4336215705	vegetable salad
4336208942	cauliflower
4336208942	corn
4336208942	fruit salad
4336208942	green beans/green bean casserole
4336208942	mashed potatoes
4336203800	corn
4336203800	green beans/green bean casserole
4336203800	mashed potatoes
4336203800	rolls/biscuits
4336199133	corn
4336199133	macaroni and cheese
4336199133	mashed potatoes
4336199133	rolls/biscuits
4336199133	vegetable salad
4336199133	yams/sweet potato casserole
4336194345	brussel sprouts
4336194345	carrots
4336194345	cauliflower
4336194345	corn
4336194345	cornbread
4336194345	fruit salad
4336194345	green beans/green bean casserole
4336194345	macaroni and cheese
4336194345	mashed potatoes
4336194345	rolls/biscuits
4336194345	squash
4336194345	vegetable salad
4336194345	yams/sweet potato casserole
4336189898	carrots
4336189898	green beans/green bean casserole
4336189898	macaroni and cheese
4336189898	mashed potatoes
4336189898	rolls/biscuits
4336189898	yams/sweet potato casserole
4336189473	corn
4336189473	green beans/green bean casserole
4336189473	mashed potatoes
4336189473	squash
4336189473	other
4336185735	cornbread
4336185735	fruit salad
4336185735	green beans/green bean casserole
4336185735	mashed potatoes
4336185735	rolls/biscuits
4336185735	squash
4336185735	vegetable salad
4336185735	yams/sweet potato casserole
4336185735	other
4336181226	carrots
4336181226	corn
4336181226	mashed potatoes
4336181226	rolls/biscuits
4336176902	green beans/green bean casserole
4336176902	mashed potatoes
4336176902	rolls/biscuits
4336176902	yams/sweet potato casserole
4336175740	green beans/green bean casserole
4336175740	mashed potatoes
4336175740	rolls/biscuits
4336175699	corn
4336175699	green beans/green bean casserole
4336175699	mashed potatoes
4336175699	rolls/biscuits
4336175345	brussel sprouts
4336175345	cornbread
4336175345	green beans/green bean casserole
4336175345	macaroni and cheese
4336175345	mashed potatoes
4336175345	rolls/biscuits
4336175345	yams/sweet potato casserole
4336168292	carrots
4336168292	cauliflower
4336168292	fruit salad
4336168292	green beans/green bean casserole
4336168292	mashed potatoes
4336168292	rolls/biscuits
4336168292	squash
4336168292	vegetable salad
4336168292	yams/sweet potato casserole
4336164056	green beans/green bean casserole
4336164056	mashed potatoes
4336164056	rolls/biscuits
4336164056	yams/sweet potato casserole
4336163908	green beans/green bean casserole
4336163908	mashed potatoes
4336163908	rolls/biscuits
4336163908	yams/sweet potato casserole
4336163908	other
4336161556	carrots
4336161556	cauliflower
4336161556	corn
4336146440	rolls/biscuits
4336146440	yams/sweet potato casserole
4336144357	brussel sprouts
4336144357	cauliflower
4336144357	mashed potatoes
4336144357	squash
4336144357	vegetable salad
4336144357	yams/sweet potato casserole
4336142896	mashed potatoes
4336142896	rolls/biscuits
4336142896	yams/sweet potato casserole
4336142896	other
4336137995	corn
4336137995	cornbread
4336137995	fruit salad
4336137995	mashed potatoes
4336137995	rolls/biscuits
4336137435	cauliflower
4336137435	cornbread
4336137435	green beans/green bean casserole
4336137435	mashed potatoes
4336137435	other
4336137098	carrots
4336137098	green beans/green bean casserole
4336137098	mashed potatoes
4336137098	rolls/biscuits
4336137098	vegetable salad
4336137098	yams/sweet potato casserole
4336134461	carrots
4336134461	corn
4336134461	cornbread
4336134461	fruit salad
4336134461	green beans/green bean casserole
4336134461	macaroni and cheese
4336134461	mashed potatoes
4336134461	rolls/biscuits
4336134461	squash
4336134461	vegetable salad
4336134461	yams/sweet potato casserole
4336133522	carrots
4336133522	corn
4336133522	cornbread
4336133522	green beans/green bean casserole
4336133522	mashed potatoes
4336133522	rolls/biscuits
4336133522	yams/sweet potato casserole
4336133454	macaroni and cheese
4336133454	mashed potatoes
4336133454	rolls/biscuits
4336133454	yams/sweet potato casserole
4336133454	other
4336131533	corn
4336131533	green beans/green bean casserole
4336131533	mashed potatoes
4336131533	rolls/biscuits
4336131533	yams/sweet potato casserole
4336131319	fruit salad
4336131319	green beans/green bean casserole
4336131319	mashed potatoes
4336131319	rolls/biscuits
4336131319	vegetable salad
4336131319	yams/sweet potato casserole
4336126090	brussel sprouts
4336126090	carrots
4336126090	corn
4336126090	green beans/green bean casserole
4336126090	mashed potatoes
4336126090	rolls/biscuits
4336126090	vegetable salad
4336126090	yams/sweet potato casserole
4336125524	fruit salad
4336125524	mashed potatoes
4336125524	rolls/biscuits
4336125524	vegetable salad
4336125524	yams/sweet potato casserole
4336125524	other
4336121663	green beans/green bean casserole
4336121663	yams/sweet potato casserole
4336120894	fruit salad
4336120894	green beans/green bean casserole
4336120894	mashed potatoes
4336120894	rolls/biscuits
4336120894	vegetable salad
4336120894	yams/sweet potato casserole
4336119647	brussel sprouts
4336119647	green beans/green bean casserole
4336119647	mashed potatoes
4336119647	rolls/biscuits
4336117281	corn
4336117281	fruit salad
4336117281	mashed potatoes
4336117281	rolls/biscuits
4336117281	yams/sweet potato casserole
4336117179	carrots
4336117179	corn
4336117179	cornbread
4336117179	fruit salad
4336117179	green beans/green bean casserole
4336117179	vegetable salad
4336117179	yams/sweet potato casserole
4336111339	brussel sprouts
4336111339	corn
4336111339	mashed potatoes
4336111339	rolls/biscuits
4336111339	yams/sweet potato casserole
4336108209	carrots
4336108209	corn
4336108209	cornbread
4336108209	squash
4336106089	green beans/green bean casserole
4336106089	mashed potatoes
4336106089	rolls/biscuits
4336106089	yams/sweet potato casserole
4336106041	green beans/green bean casserole
4336106041	macaroni and cheese
4336106041	yams/sweet potato casserole
4336106041	other
4336104179	corn
4336104179	mashed potatoes
4336104179	rolls/biscuits
4336103434	carrots
4336103434	corn
4336103434	fruit salad
4336103434	mashed potatoes
4336103434	rolls/biscuits
4336103319	corn
4336103319	fruit salad
4336103319	green beans/green bean casserole
4336103319	mashed potatoes
4336103319	rolls/biscuits
4336101470	carrots
4336101470	corn
4336101470	mashed potatoes
4336101470	vegetable salad
4336101470	yams/sweet potato casserole
4336099044	corn
4336099044	mashed potatoes
4336099044	rolls/biscuits
4336099044	vegetable salad
4336098809	carrots
4336098809	corn
4336098809	cornbread
4336098809	fruit salad
4336098809	green beans/green bean casserole
4336098809	rolls/biscuits
4336098809	yams/sweet potato casserole
4336093974	carrots
4336093974	corn
4336093974	fruit salad
4336093974	green beans/green bean casserole
4336093974	mashed potatoes
4336093974	rolls/biscuits
4336092370	carrots
4336092370	corn
4336092370	fruit salad
4336092370	yams/sweet potato casserole
4336091474	mashed potatoes
4336091474	vegetable salad
4336090652	brussel sprouts
4336090652	carrots
4336090652	cauliflower
4336090652	corn
4336090652	cornbread
4336090652	fruit salad
4336090652	green beans/green bean casserole
4336090652	macaroni and cheese
4336090652	mashed potatoes
4336090652	rolls/biscuits
4336090652	vegetable salad
4336090652	yams/sweet potato casserole
4336090647	green beans/green bean casserole
4336090647	mashed potatoes
4336090647	rolls/biscuits
4336090647	yams/sweet potato casserole
4336090552	cornbread
4336090552	macaroni and cheese
4336090552	yams/sweet potato casserole
4336086559	green beans/green bean casserole
4336086559	mashed potatoes
4336086559	rolls/biscuits
4336086559	squash
4336085504	carrots
4336085504	corn
4336085504	cornbread
4336085504	mashed potatoes
4336085504	rolls/biscuits
4336085504	vegetable salad
4336085504	yams/sweet potato casserole
4336085020	macaroni and cheese
4336083561	rolls/biscuits
4336083443	cornbread
4336083443	green beans/green bean casserole
4336083443	macaroni and cheese
4336083443	rolls/biscuits
4336083443	yams/sweet potato casserole
4336081481	carrots
4336081481	fruit salad
4336081481	rolls/biscuits
4336081481	yams/sweet potato casserole
4336080517	mashed potatoes
4336080517	rolls/biscuits
4336080517	yams/sweet potato casserole
4336078959	green beans/green bean casserole
4336078959	mashed potatoes
4336078959	rolls/biscuits
4336078959	yams/sweet potato casserole
4336078481	corn
4336078481	cornbread
4336078481	fruit salad
4336078481	mashed potatoes
4336078481	rolls/biscuits
4336076367	cauliflower
4336076367	cornbread
4336076367	green beans/green bean casserole
4336076367	macaroni and cheese
4336076367	rolls/biscuits
4336076367	yams/sweet potato casserole
4336076367	other
4336076365	carrots
4336076365	cornbread
4336076365	green beans/green bean casserole
4336076323	corn
4336076323	cornbread
4336076323	green beans/green bean casserole
4336076323	macaroni and cheese
4336076323	mashed potatoes
4336076323	rolls/biscuits
4336076323	yams/sweet potato casserole
4336074858	corn
4336074858	cornbread
4336074858	fruit salad
4336074858	mashed potatoes
4336074858	yams/sweet potato casserole
4336074858	other
4336073613	carrots
4336073613	fruit salad
4336073613	mashed potatoes
4336073613	rolls/biscuits
4336073613	vegetable salad
4336073613	yams/sweet potato casserole
4336073270	brussel sprouts
4336073270	carrots
4336073270	mashed potatoes
4336073270	rolls/biscuits
4336073270	yams/sweet potato casserole
4336070791	corn
4336070791	cornbread
4336070791	green beans/green bean casserole
4336070791	mashed potatoes
4336070791	rolls/biscuits
4336070791	yams/sweet potato casserole
4336068292	green beans/green bean casserole
4336068292	squash
4336068292	yams/sweet potato casserole
4336066162	corn
4336065006	carrots
4336065006	corn
4336065006	cornbread
4336065006	green beans/green bean casserole
4336065006	mashed potatoes
4336065006	rolls/biscuits
4336065006	yams/sweet potato casserole
4336065006	other
4336062672	green beans/green bean casserole
4336062672	mashed potatoes
4336062672	rolls/biscuits
4336062672	yams/sweet potato casserole
4336058499	green beans/green bean casserole
4336058499	mashed potatoes
4336058499	vegetable salad
4336057426	brussel sprouts
4336057426	corn
4336057426	green beans/green bean casserole
4336057426	mashed potatoes
4336057426	rolls/biscuits
4336056145	carrots
4336056145	corn
4336056145	cornbread
4336056145	green beans/green bean casserole
4336056145	macaroni and cheese
4336056145	mashed potatoes
4336056145	rolls/biscuits
4336056145	yams/sweet potato casserole
4336048135	brussel sprouts
4336048135	corn
4336048135	cornbread
4336048135	green beans/green bean casserole
4336048135	macaroni and cheese
4336048135	rolls/biscuits
4336048135	yams/sweet potato casserole
4336047575	corn
4336047575	green beans/green bean casserole
4336047575	mashed potatoes
4336047575	rolls/biscuits
4336047575	yams/sweet potato casserole
4336047405	corn
4336047405	green beans/green bean casserole
4336047405	mashed potatoes
4336047405	rolls/biscuits
4336041912	cornbread
4336041912	mashed potatoes
4336041912	rolls/biscuits
4336041912	yams/sweet potato casserole
4336040902	corn
4336040902	cornbread
4336040902	macaroni and cheese
4336040902	mashed potatoes
4336040902	vegetable salad
4336040679	carrots
4336040679	cauliflower
4336040679	corn
4336040679	cornbread
4336040679	fruit salad
4336040679	green beans/green bean casserole
4336040679	mashed potatoes
4336040679	rolls/biscuits
4336040679	squash
4336040679	yams/sweet potato casserole
4336040464	green beans/green bean casserole
4336040464	mashed potatoes
4336040464	rolls/biscuits
4336040464	yams/sweet potato casserole
4336038370	corn
4336038370	fruit salad
4336038370	green beans/green bean casserole
4336038370	mashed potatoes
4336038370	rolls/biscuits
4336038370	yams/sweet potato casserole
4336037944	corn
4336037944	mashed potatoes
4336037944	squash
4336037944	yams/sweet potato casserole
4336037337	mashed potatoes
4336037337	rolls/biscuits
4336036960	brussel sprouts
4336036960	fruit salad
4336036960	mashed potatoes
4336036960	other
4336034694	carrots
4336034694	corn
4336034694	cornbread
4336034694	mashed potatoes
4336034694	yams/sweet potato casserole
4336033443	corn
4336033443	cornbread
4336033443	mashed potatoes
4336033443	rolls/biscuits
4336033443	other
4336030046	corn
4336030046	green beans/green bean casserole
4336030046	macaroni and cheese
4336030046	mashed potatoes
4336030046	rolls/biscuits
4336030046	yams/sweet potato casserole
4336029825	carrots
4336029825	corn
4336029825	green beans/green bean casserole
4336029825	macaroni and cheese
4336029825	mashed potatoes
4336029825	rolls/biscuits
4336029825	yams/sweet potato casserole
4336027932	carrots
4336027932	corn
4336027932	fruit salad
4336027932	green beans/green bean casserole
4336027932	mashed potatoes
4336027932	rolls/biscuits
4336027932	yams/sweet potato casserole
4336023531	brussel sprouts
4336023531	green beans/green bean casserole
4336023531	mashed potatoes
4336023531	yams/sweet potato casserole
4336022983	carrots
4336022983	cornbread
4336022983	macaroni and cheese
4336022983	vegetable salad
4336022983	yams/sweet potato casserole
4336022372	macaroni and cheese
4336022372	rolls/biscuits
4336022372	vegetable salad
4336022372	yams/sweet potato casserole
4336022096	green beans/green bean casserole
4336022096	mashed potatoes
4336022096	rolls/biscuits
4336022096	squash
4336021883	corn
4336021883	cornbread
4336021883	green beans/green bean casserole
4336021883	mashed potatoes
4336021883	rolls/biscuits
4336021883	yams/sweet potato casserole
4336021180	carrots
4336021180	green beans/green bean casserole
4336021180	mashed potatoes
4336021180	rolls/biscuits
4336021180	yams/sweet potato casserole
4336021180	other
4336018601	green beans/green bean casserole
4336018601	mashed potatoes
4336018601	rolls/biscuits
4336018601	vegetable salad
4336017089	carrots
4336017089	cauliflower
4336017089	cornbread
4336016535	carrots
4336016535	cauliflower
4336016535	corn
4336016535	green beans/green bean casserole
4336016535	mashed potatoes
4336016535	rolls/biscuits
4336016535	yams/sweet potato casserole
4336015865	brussel sprouts
4336015865	carrots
4336015865	corn
4336015865	green beans/green bean casserole
4336015865	mashed potatoes
4336015865	rolls/biscuits
4336015865	squash
4336015865	yams/sweet potato casserole
4336015017	corn
4336015017	green beans/green bean casserole
4336015017	mashed potatoes
4336015017	rolls/biscuits
4336014587	brussel sprouts
4336014587	corn
4336014587	green beans/green bean casserole
4336014587	mashed potatoes
4336014587	rolls/biscuits
4336014587	yams/sweet potato casserole
4336014104	corn
4336014104	cornbread
4336014104	fruit salad
4336014104	green beans/green bean casserole
4336014104	macaroni and cheese
4336014104	mashed potatoes
4336014104	rolls/biscuits
4336012118	green beans/green bean casserole
4336012118	mashed potatoes
4336012118	rolls/biscuits
4336012118	vegetable salad
4336012003	fruit salad
4336012003	green beans/green bean casserole
4336012003	mashed potatoes
4336012003	rolls/biscuits
4336012003	vegetable salad
4336012003	yams/sweet potato casserole
4336011166	corn
4336011166	green beans/green bean casserole
4336011166	mashed potatoes
4336011166	rolls/biscuits
4336011166	yams/sweet potato casserole
4336006784	carrots
4336006784	cauliflower
4336006784	green beans/green bean casserole
4336006784	mashed potatoes
4336006784	rolls/biscuits
4336006784	vegetable salad
4336006784	yams/sweet potato casserole
4336005220	brussel sprouts
4336005220	corn
4336005220	fruit salad
4336005220	green beans/green bean casserole
4336005220	mashed potatoes
4336005220	rolls/biscuits
4336005220	squash
4336005220	yams/sweet potato casserole
4336002999	corn
4336002999	green beans/green bean casserole
4336002999	mashed potatoes
4336002999	rolls/biscuits
4336002487	carrots
4336002487	cauliflower
4336002487	corn
4336002487	fruit salad
4336002487	green beans/green bean casserole
4336002487	macaroni and cheese
4336002487	mashed potatoes
4336002487	squash
4336002487	vegetable salad
4336002487	yams/sweet potato casserole
4336001840	corn
4336001840	green beans/green bean casserole
4336001840	mashed potatoes
4336001840	rolls/biscuits
4336001546	cornbread
4336001546	green beans/green bean casserole
4336001546	mashed potatoes
4336001546	rolls/biscuits
4336001546	yams/sweet potato casserole
4335999720	brussel sprouts
4335999720	green beans/green bean casserole
4335999720	macaroni and cheese
4335999720	mashed potatoes
4335999720	rolls/biscuits
4335998934	brussel sprouts
4335998934	green beans/green bean casserole
4335998934	mashed potatoes
4335998934	rolls/biscuits
4335998934	yams/sweet potato casserole
4335996765	green beans/green bean casserole
4335996765	mashed potatoes
4335996765	rolls/biscuits
4335996765	vegetable salad
4335996482	cauliflower
4335996482	green beans/green bean casserole
4335996482	mashed potatoes
4335996482	rolls/biscuits
4335996482	yams/sweet potato casserole
4335992962	corn
4335992962	cornbread
4335992962	fruit salad
4335992962	mashed potatoes
4335992962	rolls/biscuits
4335992962	squash
4335992074	green beans/green bean casserole
4335992074	mashed potatoes
4335992074	rolls/biscuits
4335990669	green beans/green bean casserole
4335990669	mashed potatoes
4335990669	rolls/biscuits
4335990669	vegetable salad
4335990669	yams/sweet potato casserole
4335990002	corn
4335990002	mashed potatoes
4335990002	rolls/biscuits
4335990002	other
4335989591	carrots
4335989591	corn
4335989591	mashed potatoes
4335989591	squash
4335988879	brussel sprouts
4335988879	cauliflower
4335988879	fruit salad
4335988879	squash
4335988879	vegetable salad
4335988879	other
4335988400	corn
4335988400	cornbread
4335988400	green beans/green bean casserole
4335988400	macaroni and cheese
4335988400	rolls/biscuits
4335988400	squash
4335988400	yams/sweet potato casserole
4335988391	carrots
4335988391	green beans/green bean casserole
4335988391	mashed potatoes
4335988391	rolls/biscuits
4335988391	yams/sweet potato casserole
4335988189	mashed potatoes
4335988189	rolls/biscuits
4335987976	mashed potatoes
4335987976	rolls/biscuits
4335987976	vegetable salad
4335987642	cornbread
4335987642	green beans/green bean casserole
4335987642	other
4335987129	corn
4335987129	cornbread
4335987129	green beans/green bean casserole
4335987129	mashed potatoes
4335987129	rolls/biscuits
4335987129	squash
4335987129	yams/sweet potato casserole
4335986817	carrots
4335986817	corn
4335986817	cornbread
4335986817	green beans/green bean casserole
4335986817	mashed potatoes
4335986817	rolls/biscuits
4335986817	yams/sweet potato casserole
4335985936	green beans/green bean casserole
4335985936	mashed potatoes
4335985936	rolls/biscuits
4335983992	cauliflower
4335983992	fruit salad
4335983992	mashed potatoes
4335983992	rolls/biscuits
4335983992	yams/sweet potato casserole
4335983559	corn
4335983559	green beans/green bean casserole
4335983559	mashed potatoes
4335983559	rolls/biscuits
4335983559	vegetable salad
4335982114	corn
4335982114	green beans/green bean casserole
4335982114	mashed potatoes
4335982114	rolls/biscuits
4335982114	yams/sweet potato casserole
4335981269	cauliflower
4335981269	mashed potatoes
4335981269	rolls/biscuits
4335981269	vegetable salad
4335981057	brussel sprouts
4335981057	carrots
4335981057	cauliflower
4335981057	corn
4335981057	cornbread
4335981057	fruit salad
4335981057	green beans/green bean casserole
4335981057	macaroni and cheese
4335981057	mashed potatoes
4335981057	rolls/biscuits
4335981057	squash
4335981057	vegetable salad
4335981057	yams/sweet potato casserole
4335979596	fruit salad
4335979596	green beans/green bean casserole
4335979596	macaroni and cheese
4335979596	mashed potatoes
4335979596	rolls/biscuits
4335979596	yams/sweet potato casserole
4335979419	fruit salad
4335979419	green beans/green bean casserole
4335979419	mashed potatoes
4335979419	vegetable salad
4335979419	yams/sweet potato casserole
4335978870	corn
4335978870	cornbread
4335978870	fruit salad
4335978870	mashed potatoes
4335978870	rolls/biscuits
4335978870	squash
4335978870	yams/sweet potato casserole
4335977956	mashed potatoes
4335977956	rolls/biscuits
4335977956	squash
4335977956	vegetable salad
4335977956	yams/sweet potato casserole
4335977956	other
4335977899	corn
4335977899	cornbread
4335977899	green beans/green bean casserole
4335977899	rolls/biscuits
4335977899	yams/sweet potato casserole
4335977899	other
4335977124	carrots
4335977124	corn
4335977124	fruit salad
4335977124	green beans/green bean casserole
4335977124	yams/sweet potato casserole
4335976340	corn
4335976340	fruit salad
4335976340	green beans/green bean casserole
4335976340	mashed potatoes
4335976340	rolls/biscuits
4335976340	yams/sweet potato casserole
4335975961	cornbread
4335975961	mashed potatoes
4335975961	rolls/biscuits
4335974428	mashed potatoes
4335974428	rolls/biscuits
4335974363	corn
4335974363	fruit salad
4335974363	mashed potatoes
4335974363	rolls/biscuits
4335974363	yams/sweet potato casserole
4335973959	corn
4335973959	green beans/green bean casserole
4335973959	mashed potatoes
4335973959	rolls/biscuits
4335973959	yams/sweet potato casserole
4335973714	carrots
4335973714	fruit salad
4335973714	green beans/green bean casserole
4335973714	mashed potatoes
4335973714	rolls/biscuits
4335973714	yams/sweet potato casserole
4335972801	cornbread
4335972801	squash
4335972801	vegetable salad
4335972801	yams/sweet potato casserole
4335971349	fruit salad
4335971349	green beans/green bean casserole
4335971349	mashed potatoes
4335971349	rolls/biscuits
4335971349	yams/sweet potato casserole
4335971349	other
4335970729	corn
4335970729	cornbread
4335970729	fruit salad
4335970729	green beans/green bean casserole
4335970729	macaroni and cheese
4335970729	mashed potatoes
4335970729	rolls/biscuits
4335970729	yams/sweet potato casserole
4335970072	cornbread
4335970072	green beans/green bean casserole
4335970072	mashed potatoes
4335970072	rolls/biscuits
4335970072	squash
4335970072	yams/sweet potato casserole
4335969513	brussel sprouts
4335969513	fruit salad
4335969513	macaroni and cheese
4335969513	rolls/biscuits
4335969513	yams/sweet potato casserole
4335967669	green beans/green bean casserole
4335967669	mashed potatoes
4335967669	rolls/biscuits
4335967669	other
4335967013	green beans/green bean casserole
4335967013	yams/sweet potato casserole
4335966421	fruit salad
4335966421	green beans/green bean casserole
4335966421	mashed potatoes
4335966421	rolls/biscuits
4335966421	yams/sweet potato casserole
4335966121	carrots
4335966121	cauliflower
4335966121	corn
4335966121	fruit salad
4335966121	green beans/green bean casserole
4335966121	mashed potatoes
4335966121	rolls/biscuits
4335966121	yams/sweet potato casserole
4335965739	cornbread
4335965739	rolls/biscuits
4335965739	squash
4335965739	yams/sweet potato casserole
4335965542	green beans/green bean casserole
4335965542	rolls/biscuits
4335965542	vegetable salad
4335965542	yams/sweet potato casserole
4335964313	corn
4335964313	mashed potatoes
4335964313	rolls/biscuits
4335964313	yams/sweet potato casserole
4335964313	other
4335963222	carrots
4335963222	corn
4335963222	mashed potatoes
4335963222	rolls/biscuits
4335963222	yams/sweet potato casserole
4335962733	corn
4335962733	cornbread
4335962733	fruit salad
4335962733	green beans/green bean casserole
4335962733	rolls/biscuits
4335962733	yams/sweet potato casserole
4335961782	corn
4335961782	fruit salad
4335961782	green beans/green bean casserole
4335961782	mashed potatoes
4335961782	rolls/biscuits
4335961782	yams/sweet potato casserole
4335961440	green beans/green bean casserole
4335961440	mashed potatoes
4335961440	rolls/biscuits
4335961440	vegetable salad
4335960288	green beans/green bean casserole
4335960288	mashed potatoes
4335960288	rolls/biscuits
4335960288	yams/sweet potato casserole
4335960105	brussel sprouts
4335960105	corn
4335960105	green beans/green bean casserole
4335960105	mashed potatoes
4335960105	rolls/biscuits
4335960105	squash
4335960105	yams/sweet potato casserole
4335959876	cornbread
4335959876	fruit salad
4335959876	green beans/green bean casserole
4335959876	macaroni and cheese
4335959876	rolls/biscuits
4335959857	corn
4335959857	mashed potatoes
4335959857	rolls/biscuits
4335958653	fruit salad
4335958653	macaroni and cheese
4335958653	rolls/biscuits
4335958653	vegetable salad
4335958653	yams/sweet potato casserole
4335958653	other
4335958292	cornbread
4335958292	green beans/green bean casserole
4335958292	rolls/biscuits
4335958292	vegetable salad
4335958292	yams/sweet potato casserole
4335958005	corn
4335958005	green beans/green bean casserole
4335958005	macaroni and cheese
4335958005	mashed potatoes
4335958005	rolls/biscuits
4335958005	yams/sweet potato casserole
4335957772	fruit salad
4335957772	macaroni and cheese
4335957772	mashed potatoes
4335957772	squash
4335957365	corn
4335957365	green beans/green bean casserole
4335957365	mashed potatoes
4335957365	rolls/biscuits
4335957365	yams/sweet potato casserole
4335957179	brussel sprouts
4335957179	mashed potatoes
4335957179	yams/sweet potato casserole
4335957179	other
4335957096	carrots
4335957096	corn
4335957096	mashed potatoes
4335957096	rolls/biscuits
4335957096	squash
4335957096	yams/sweet potato casserole
4335957072	cornbread
4335957072	green beans/green bean casserole
4335957072	mashed potatoes
4335957072	rolls/biscuits
4335957072	yams/sweet potato casserole
4335955478	corn
4335955478	green beans/green bean casserole
4335955478	mashed potatoes
4335955478	rolls/biscuits
4335955478	yams/sweet potato casserole
4335955206	carrots
4335955206	corn
4335955206	green beans/green bean casserole
4335955206	mashed potatoes
4335955206	yams/sweet potato casserole
4335955152	macaroni and cheese
4335955152	mashed potatoes
4335955152	rolls/biscuits
4335954681	green beans/green bean casserole
4335954681	mashed potatoes
4335954681	rolls/biscuits
4335954394	green beans/green bean casserole
4335954394	mashed potatoes
4335954394	rolls/biscuits
4335954394	yams/sweet potato casserole
4335954376	corn
4335954376	green beans/green bean casserole
4335954376	mashed potatoes
4335954376	rolls/biscuits
4335954207	other
4335954131	fruit salad
4335954131	green beans/green bean casserole
4335954131	mashed potatoes
4335954131	rolls/biscuits
4335954131	vegetable salad
4335954131	yams/sweet potato casserole
4335953888	carrots
4335953888	cauliflower
4335953888	corn
4335953888	cornbread
4335953888	green beans/green bean casserole
4335953888	macaroni and cheese
4335953888	mashed potatoes
4335953888	rolls/biscuits
4335952833	green beans/green bean casserole
4335952833	mashed potatoes
4335952833	rolls/biscuits
4335952833	squash
4335952833	yams/sweet potato casserole
4335951505	corn
4335951505	cornbread
4335951505	fruit salad
4335951505	green beans/green bean casserole
4335951505	macaroni and cheese
4335951505	mashed potatoes
4335951505	rolls/biscuits
4335951505	yams/sweet potato casserole
4335951437	cornbread
4335951437	green beans/green bean casserole
4335951437	mashed potatoes
4335951437	yams/sweet potato casserole
4335951437	other
4335951082	carrots
4335951082	cauliflower
4335951082	corn
4335951082	green beans/green bean casserole
4335951082	macaroni and cheese
4335951082	mashed potatoes
4335951082	rolls/biscuits
4335950917	carrots
4335950917	corn
4335950917	cornbread
4335950917	mashed potatoes
4335950654	green beans/green bean casserole
4335950654	mashed potatoes
4335950654	rolls/biscuits
4335950654	yams/sweet potato casserole
4335949486	corn
4335949486	green beans/green bean casserole
4335949486	mashed potatoes
4335949486	rolls/biscuits
4335949169	brussel sprouts
4335949169	carrots
4335949169	corn
4335949169	green beans/green bean casserole
4335949169	mashed potatoes
4335949169	rolls/biscuits
4335949169	vegetable salad
4335949169	yams/sweet potato casserole
4335949112	corn
4335949112	fruit salad
4335949112	rolls/biscuits
4335949112	other
4335947496	cornbread
4335947496	green beans/green bean casserole
4335947496	macaroni and cheese
4335947496	mashed potatoes
4335947496	rolls/biscuits
4335945415	corn
4335945415	green beans/green bean casserole
4335945415	mashed potatoes
4335945415	rolls/biscuits
4335945415	yams/sweet potato casserole
4335944854	corn
4335944854	fruit salad
4335944854	mashed potatoes
4335944854	rolls/biscuits
4335944082	green beans/green bean casserole
4335944082	mashed potatoes
4335944082	rolls/biscuits
4335944082	squash
4335944082	yams/sweet potato casserole
4335943173	corn
4335943173	green beans/green bean casserole
4335943173	mashed potatoes
4335943173	rolls/biscuits
4335943173	yams/sweet potato casserole
4335943060	yams/sweet potato casserole
4335934708	fruit salad
4335894916	corn
4335894916	macaroni and cheese
\.


--
-- Data for Name: side_dish_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY side_dish_other (id, side_dish_other) FROM stdin;
4337951949	asian vinagrette salad
4337583245	broccoli/cheese sauce
4337569645	depends
4337568074	squash soufflet
4337256857	roasted vegatables
4337249904	okra!
4337164060	fresh green peas
4337163790	broccoli
4337160605	peas, sometimes cranberry jello mold
4337149818	rice pudding
4337137158	cajun cressing (crayfish, gorund beef & rice, etc.)
4337117491	collard greens
4337064141	potato salad
4337061177	pumpkin bisque
4337044640	peas with mushrooms. sparkly white wine. sweet gherkin pickles, pumpkin pie
4337044628	plain sweet potatoes, brocolli, relish tray, oyster dressing
4337043565	baked sweet potatoes, broccoli & cheese sauce
4337032009	asparagus
4337024057	turnip greens
4337008702	broccoli
4337008598	antipasta
4337002367	rice
4336997200	collard greens
4336984164	i love brussel sprouts, but my mother doesn't- so no brussels at thanksgiving.
4336982760	broccoli 
4336972729	baked potatoes
4336971897	yorkshire pudding, mixed vegetable, apple sauce or squash and apple casserole
4336964971	broccoli
4336963992	turnip
4336962641	rice
4336956397	salad
4336945764	 fried okra, broccoli casserole
4336922793	breaded dressing
4336915660	brocolli
4336905103	broccoli casserole 
4336901039	ham, cheesecake, pies
4336898281	oysters ham
4336890666	mashed cauliflower
4336881198	stuffing
4336879592	cheesy potatos
4336878183	broccoli
4336876798	green beans with almonds & brocolli rice casserole
4336876402	peas
4336870370	rice
4336867715	creamed onions
4336848038	asparagus
4336840954	roasted root vegetables
4336838317	kale and colored greens
4336837943	broccoli
4336829875	peas and a jello salad
4336829185	broccoli
4336816440	broccoli and cheese
4336813874	spinach
4336809276	creamed onions
4336808397	peas 
4336799337	root vegetables
4336789188	collard greens
4336785978	brocolli
4336784825	corn green beans
4336776734	rice
4336763694	oyster cassarole, home baked bread
4336762600	broccoli casserole
4336749249	green salad
4336746002	broccoli casserole
4336726144	fish
4336714072	deviled eggs
4336707912	turnip greens
4336665636	rutabaga
4336644693	greens
4336639517	banana croquets; dumplings
4336611199	broccoli
4336596402	jello salad, dressing
4336592653	fieldpeas or crowders
4336574897	chicken & dumplins
4336524165	sweet potatoes
4336509936	gizzards
4336433694	potato salad, wild rice & mushroom casserole
4336426326	other vegetable dishes
4336371555	b52 sweet potatoes 
4336368281	greens
4336366345	green peas with pearl onion
4336312523	salad
4336306664	banana pudding
4336271469	and then a different dish every so often
4336189473	pasta
4336185735	baked scallop potatoes, rice, sushi, chinese noodles, oter
4336163908	asparagus
4336142896	stuffing and creamed spinach
4336137435	rice
4336133454	broccoli
4336125524	brocolli & corn casserole and  homemade noodles
4336106041	potatoes salad 
4336076367	creamed onions, broccoli 
4336074858	rice, beans, tamales
4336065006	baked potato, cranberry 
4336036960	creamed onions
4336033443	rice
4336021180	celery sticks with cheese, olives
4335990002	celery
4335988879	rice or roasted potatoes
4335987642	collard greens
4335977956	peas with pearl onions 
4335977899	dumplings 
4335971349	sherbet
4335967669	cheeseball
4335964313	mushrooms, broccoli rabe, turnip
4335958653	broccoli
4335957179	pearl onions
4335954207	rice
4335951437	spinach souffl� 
4335949112	wild rice
\.


--
-- Data for Name: stuffing_other; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stuffing_other (id, stuffing_other) FROM stdin;
4337435277	Gluten-Free Bread Based
4337421462	cornbread based-I'm Southern
4337112360	Cornbread-based
4337074360	Restaurant with various choices.
4337044628	cornbread
4336989544	cornbread
4336984164	Fruit based
4336967374	Chestnuts, sausage 
4336931306	Corn bread dressing
4336890668	Potato based
4336874555	cornbread
4336841567	Either bread-based or none 
4336829875	Meat based
4336827663	GROUND MEAT 
4336808019	corn meal stuffing
4336807635	gluten free
4336776734	cornbread
4336761290	Family recipe
4336721418	Gluten free bread based
4336620413	Both bread and rice
4336611199	Fried Stuffing
4336592653	Cornbread
4336554350	meat
4336548962	Cornbread
4336496891	Oyster
4336495665	Don't to do stuffingin bourbon and then smokes
4336482823	NI I dont
4336366345	Cornbread of course...  ;)
4336333982	CORNBREAD AND BREAD MIX
4336161556	Asian styled
4336125524	Sausage, Apple and Bread  dressing
4336111339	cornbread
4336001546	corn bread
4335988400	corn bread base;  no light bread
4335958653	cornbread
4335951505	Cornbread
\.


--
-- PostgreSQL database dump complete
--

