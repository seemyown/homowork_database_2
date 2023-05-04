-- Database: homework_2

-- DROP DATABASE IF EXISTS homework_2;

-- CREATE DATABASE homework_2
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;
	
CREATE TABLE IF NOT EXISTS genres(
	genre_id SERIAL PRIMARY KEY,
	name_of_genre VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS artists(
	artist_id SERIAL PRIMARY KEY,
	alias VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS albums(
	album_id SERIAL PRIMARY KEY,
	name_of_album VARCHAR(30) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS tracks(
	track_id SERIAL PRIMARY KEY,
	name_of_track VARCHAR(30) NOT NULL,
	duration INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS collections(
	collection_id SERIAL PRIMARY KEY,
	name_of_collection VARCHAR(30) NOT NULL,
	release_year DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS artists_genre(
	id SERIAL PRIMARY KEY,
	artist_id INTEGER REFERENCES artists(artist_id),
	genre_id INTEGER REFERENCES genres(genre_id)
);

CREATE TABLE IF NOT EXISTS artists_album(
	id SERIAL PRIMARY KEY,
	artist_id INTEGER REFERENCES artists(artist_id),
	album_id INTEGER REFERENCES albums(album_id)
);

CREATE TABLE IF NOT EXISTS collection_track(
	id SERIAL PRIMARY KEY,
	collection_id INTEGER REFERENCES collections(collection_id),
	track_id INTEGER REFERENCES tracks(track_id)
);

CREATE TABLE IF NOT EXISTS albums_tracks(
	id SERIAL PRIMARY KEY,
	album_id INTEGER REFERENCES albums(album_id),
	track_id INTEGER REFERENCES tracks(track_id)
);
 
