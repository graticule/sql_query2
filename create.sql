CREATE TABLE IF NOT EXISTS genre(
genre_id SERIAL PRIMARY KEY,
genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS artist(
artist_id SERIAL PRIMARY KEY,
artist_name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_of_artists(
artist_id INTEGER REFERENCES artist(artist_id),
genre_id INTEGER REFERENCES genre(genre_id),
PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS album(
album_id SERIAL PRIMARY KEY,
title VARCHAR(200) NOT NULL,
release_year INTEGER NOT NULL CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS albums_of_artists(
artist_id INTEGER REFERENCES artist(artist_id),
album_id INTEGER REFERENCES album(album_id),
PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS track(
track_id SERIAL PRIMARY KEY,
title VARCHAR(200) NOT NULL,
duration INTEGER NOT NULL CHECK (duration > 0),
album_id INTEGER REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS collection(
collection_id serial PRIMARY KEY,
title VARCHAR(200) NOT NULL UNIQUE,
release_year INTEGER NOT NULL CHECK (release_year > 1900)
);

create table if not exists tracks_in_collections(
track_id integer references track(track_id),
collection_id integer references collection(collection_id),
primary key (track_id, collection_id)
);