CREATE VIEW view_artists(artist,birthdate,songs)
    AS SELECT name as artist, birth_date as birthdate, count(music) AS songs WHERE music.art_id = artist.id FROM artist;

CREATE VIEW view_albums(album,songs,duration)
    AS SELECT name as album, count(music) AS songs WHERE music.id IN SELECT INTO music_id FROM music_album WHERE alb_id = album.id, duration_to_string(SUM(music.duration)) AS duration WHERE music.id IN SELECT INTO music_id FROM music_album WHERE abl_id = album.id FROM album;

CREATE VIEW view_songs(music,artist,duration)
    AS SELECT title as music, artist.name AS artist WHERE artist.id = art_id, duration_to_string(duration) AS duration FROM music FROM music;
