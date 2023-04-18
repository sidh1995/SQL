CREATE TABLE media_line(
   media_type_id INTEGER  NOT NULL PRIMARY KEY 
  ,name          VARCHAR(27) NOT NULL
);
INSERT INTO media_line(media_type_id,name) VALUES (1,'MPEG audio file');
INSERT INTO media_line(media_type_id,name) VALUES (2,'Protected AAC audio file');
INSERT INTO media_line(media_type_id,name) VALUES (3,'Protected MPEG-4 video file');
INSERT INTO media_line(media_type_id,name) VALUES (4,'Purchased AAC audio file');
INSERT INTO media_line(media_type_id,name) VALUES (5,'AAC audio file');
