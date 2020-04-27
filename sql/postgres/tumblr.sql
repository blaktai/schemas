DROP DATABASE IF EXISTS tumblr;
CREATE DATABASE tumblr;

\c tumblr;

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  salted_password VARCHAR (250) NOT NULL,
  first_name VARCHAR (250) NOT NULL,
  last_name VARCHAR (250) NOT NULL,
  last_ip VARCHAR (30) NOT NULL,
  token VARCHAR (16),
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL
 );

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  author INT REFERENCES users(id) NOT NULL,
  title VARCHAR (100) NOT NULL,
  body TEXT NOT NULL
);

CREATE TABLE images (

);


CREATE TABLE post_images (
 id SERIAL PRIMARY KEY,
 post_id INT REFERENCES posts(id) NOT NULL,
 image_id INT REFERENCES images(id) NOT NULL
);

CREATE TABLE post_comments (
  id SERIAL PRIMARY KEY,
  author INT REFERENCES comments(id) NOT NULL,
  post_id INT REFERENCES posts(id) NOT NULL,
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author INT REFERENCES users(id) NOT NULL,
  post_id INT REFERENCES posts(id) NOT NULL,
  title VARCHAR (100) NOT NULL,
  body TEXT NOT NULL
);