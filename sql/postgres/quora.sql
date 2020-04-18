DROP DATABASE IF EXISTS quora;
CREATE DATABASE quora;

\c quora;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  email VARCHAR (100) UNIQUE NOT NULL,
  salted_password VARCHAR (250) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  token VARCHAR (16),
  credits INT 
);

CREATE TABLE questions (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) NOT NULL,
  title VARCHAR (100) NOT NULL,
  date_created TIMESTAMP NOT NULL,
  date_updated TIMESTAMP NOT NULL
  is_anonymous TINYINT NOT NULL
);

CREATE TABLE answers (
  id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id) NOT NULL,
  question_id INT REFERENCES questions(id) NOT NULL,
  answer_text TEXT NOT NULL
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  author INT REFERENCES users(id) NOT NULL,
  answer_id INT REFERENCES answers(id) NOT NULL,
  body TEXT NOT NULL
);