CREATE TABLE music_albums (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publish_date DATE,
    on_spotify BOOLEAN,
);

CREATE TABLE genres (
    id SERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
);
