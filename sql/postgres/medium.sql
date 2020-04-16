DROP DATABASE IF EXISTS medium;
CREATE DATABASE medium;

\c medium;

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

CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) NOT NULL,
  image_path TEXT NOT NULL,
  title TEXT NOT NULL,
  subtitle TEXT NOT NULL,
  content TEXT NOT NULL,
  post_status TEXT NOT NULL,
  views INT NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL
)

CREATE TABLE collections (
  collection_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) NOT NULL,
  image_path TEXT NOT NULL,
  collection_name TEXT NOT NULL,
  subtitle TEXT NOT NULL,
  slug TEXT NOT NULL
)

CREATE TABLE post_collections (
  collection_id REFERENCES collections(collection_id) NOT NULL,
  post_id INT REFERENCES posts(post_id) NOT NULL
);

CREATE TABLE users_users (
  user_id INT REFERENCES users(user_id) NOT NULL,
  follower_user_id INT REFERENCES users(user_id) NOT NULL
);

CREATE TABLE users_collections (
  user_id INT REFERENCES users(user_id) NOT NULL,
  collection_id REFERENCES collections(collection_id) NOT NULL
);

CREATE TABLE bookmarks (
  bookmark_id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(user_id) NOT NULL,
  post_id INT REFERENCES posts(post_id) NOT NULL
);

CREATE TABLE recommendations ( 
  user_id INT REFERENCES users(user_id) NOT NULL,
  post_id INT REFERENCES posts(post_id) NOT NULL,
  date_created TIMESTAMP NOT NULL
);

CREATE TABLE analytics ( 
  user_id INT REFERENCES users(user_id) NOT NULL,
  post_id INT REFERENCES posts(post_id) NOT NULL,
  date_created TIMESTAMP NOT NULL
);