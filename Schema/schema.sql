CREATE SCHEMA music_database;

DROP TABLE if exists music_database.spotify_df cascade;
CREATE TABLE music_database.spotify_df (
    id                   serial primary key not null,
    spotify_id           varchar(256) primary key not null,
    track_name           varchar(256) not null,
    artist_name          varchar(256) not null,
    album                varchar(256) not null,
    spotify_popularity   int not null,
    release_date         date not null,
    duration             int not null,
    explicit_content     boolean not null
);

DROP TABLE if exists music_database.youtube_df cascade;
CREATE TABLE music_database.youtube_df (
    id                   serial primary key not null,
    track_name           varchar(256) not null references music_database.spotify_df("track_name"),
    artist_name          varchar(256) not null,
    youtube_views        int not null,
    youtube_likes        int not null,
    youtube_favourites   int not null,
    youtube_comments     int not null
);

DROP TABLE if exists music_database.musixmatch_df cascade;
CREATE TABLE music_database.musixmatch_df (
    id                   serial primary key not null,
    track_name           varchar(256) not null references music_database.spotify_df("track_name"),
    artist_name          varchar(256) not null,
    lyrics               varchar(100000) not null
);


DROP TABLE if exists music_database.twitter_df cascade;
CREATE TABLE music_database.twitter_df (
    id                   serial primary key not null,
    track_name           varchar(256) not null references music_database.spotify_df("track_name"),
    artist_name          varchar(256) not null,
    tweets               varchar(100000) not null
);





