CREATE TABLE IF NOT EXISTS genre(
    PRIMARY KEY (genre_id),
    genre_id   SERIAL,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS artist(
    PRIMARY KEY (artist_id),
    artist_id   SERIAL,
    artist_name VARCHAR(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS genres_of_artists(
    PRIMARY KEY (artist_id, genre_id),
    artist_id INTEGER REFERENCES artist(artist_id),
    genre_id  INTEGER REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS album(
    PRIMARY KEY (album_id),
    album_id     SERIAL,
    title        VARCHAR(200) NOT NULL,
    release_year INTEGER NOT NULL CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS albums_of_artists(
    PRIMARY KEY (artist_id, album_id),
    artist_id INTEGER REFERENCES artist(artist_id),
    album_id  INTEGER REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS track(
    PRIMARY KEY (track_id),
    track_id SERIAL,
    title    VARCHAR(200) NOT NULL,
    duration INTEGER NOT NULL CHECK (duration > 0),
    album_id INTEGER REFERENCES album(album_id)
);

CREATE TABLE IF NOT EXISTS collection(
    PRIMARY KEY (collection_id),
    collection_id SERIAL,
    title         VARCHAR(200) NOT NULL UNIQUE,
    release_year  INTEGER NOT NULL CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS tracks_in_collections(
    PRIMARY KEY (track_id, collection_id),
    track_id      INTEGER REFERENCES track(track_id),
    collection_id INTEGER REFERENCES collection(collection_id)
);
