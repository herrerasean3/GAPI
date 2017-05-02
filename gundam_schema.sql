DROP DATABASE IF EXISTS gandamu;
CREATE DATABASE gandamu;

\c gandamu;

/* DROP CAST, WEAPONS, ACTORS, MANUFACTURERS, AND FACTIONS*/

DROP TABLE IF EXISTS castmember;
DROP TABLE IF EXISTS mobileweapon;
DROP TABLE IF EXISTS voiceactor;
DROP TABLE IF EXISTS manufacturer;
DROP TABLE IF EXISTS factionList;

/* DROP SERIES AND ERA */

DROP TABLE IF EXISTS serieslist;
DROP TABLE IF EXISTS seriesEra;


/* DROP VIEW */

DROP VIEW IF EXISTS compiled;


/* CREATE SERIES AND ERAS */

CREATE TABLE seriesEra (
	era_id SERIAL PRIMARY KEY,
	era_name VARCHAR NOT NULL
);

CREATE TABLE serieslist (
	series_id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL,
	series_era INTEGER REFERENCES seriesEra(era_id) NOT NULL
);

/* CREATE FACTIONS */

CREATE TABLE factionList (
	faction_id SERIAL PRIMARY KEY,
	faction_name VARCHAR NOT NULL
);


/* CREATE MANUFACTURERS */

CREATE TABLE manufacturer (
	manufacturer_id SERIAL PRIMARY KEY,
	manufacturer_name VARCHAR NOT NULL
);

/* CREATE MOBILE WEAPONS */

CREATE TABLE mobileweapon (
	mobileweapon_id SERIAL PRIMARY KEY,
	model VARCHAR NOT NULL,
	manufacturer INTEGER REFERENCES manufacturer(manufacturer_id) NOT NULL
);

/* CREATE VOICE ACTORS */

CREATE TABLE voiceactor (
	voice_id SERIAL PRIMARY KEY,
	english VARCHAR NOT NULL,
	japanese VARCHAR NOT NULL
);

/* CREATE CAST */

CREATE TABLE castmember (
	cast_id SERIAL PRIMARY KEY,
	cast_name VARCHAR NOT NULL, 
	faction INTEGER REFERENCES factionList(faction_id) NOT NULL,
	mobile_weapon INTEGER REFERENCES mobileweapon(mobileweapon_id) NOT NULL,
	voice_actor INTEGER REFERENCES voiceactor(voice_id) NOT NULL,
	appears_in INTEGER REFERENCES serieslist(series_id) NOT NULL
	);