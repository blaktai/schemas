DROP DATABASE IF EXISTS instagram;
CREATE DATABASE instagram;

\c instagram;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  salted_password VARCHAR (250) NOT NULL,
  first_name VARCHAR (250) NOT NULL,
  last_name VARCHAR (250) NOT NULL,
  last_ip VARCHAR (30) NOT NULL,
  token VARCHAR (16)
 );

CREATE TABLE comments (
  comment_id SERIAL PRIMARY KEY,
  author INT REFERENCES users(id) NOT NULL,
  photo_id INT REFERENCES photos(id) NOT NULL,
  body TEXT NOT NULL
);

CREATE TABLE photos (
  photo_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) NOT NULL,
  caption TEXT NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  image_path TEXT NOT NULL,
  image_size INT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL
)

CREATE TABLE hashtags (
  hashtag_id SERIAL PRIMARY KEY,
  hashtag TEXT NOT NULL,
  date_created TIMESTAMP NOT NULL
)

CREATE TABLE photos_hastags (
  photo_id INT REFERENCES photos(photo_id) NOT NULL,
  hashtag_id INT REFERENCES hashtags(hashtag_id) NOT NULL,
)

CREATE TABLE likes (
  user_id INT REFERENCES users(user_id) NOT NULL,
  photo_id INT REFERENCES photos(photo_id) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL
)

CREATE TABLE tags (
  tag_id SERIAL PRIMARY KEY,
  tag_name TEXT NOT NULL,
  date_created TIMESTAMP NOT NULL
)

CREATE TABLE photos_tags (
  photo_id INT REFERENCES photos(photo_id) NOT NULL,
  tag_id INT REFERENCES tags(tag_id) NOT NULL,
)