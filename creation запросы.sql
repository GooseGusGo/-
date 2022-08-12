CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	yearalbum INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration INTEGER NOT NULL,
	album_id INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS genreartist (
	genre_id INTEGER REFERENCES genre(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS albumartist (
	album_id INTEGER REFERENCES album(id),
	artist_id INTEGER REFERENCES artist(id),
	CONSTRAINT aa_pk PRIMARY KEY (album_id , artist_id)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	yearcollection INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS trackcollections (
	track_id INTEGER REFERENCES track(id),
	collection_id INTEGER REFERENCES collection(id),
	CONSTRAINT tc_pk PRIMARY KEY (track_id , collection_id)
);
