CREATE DATABASE kinopoiskHD;

USE kinopoiskHD;


DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	email VARCHAR(150) NOT NULL UNIQUE,
	phone CHAR(11) NOT NULL,
	password_hash CHAR(65) DEFAULT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	INDEX (phone),
	INDEX (email)
);



DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	gender ENUM('f', 'm', 'x') NOT NULL,
	birthday DATE NOT NULL,
	age INT, -- ��, ������������ ����������� �� ��� ����� ��� ����)
	photo_id BIGINT UNSIGNED,
	is_active BOOLEAN DEFAULT FALSE, -- ������������ �� ��������
	FOREIGN KEY(user_id) REFERENCES users(id)  
);



DROP TABLE IF EXISTS categories;
CREATE TABLE categories( -- ������, �������, �������
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);



DROP TABLE IF EXISTS geners;
CREATE TABLE geners( -- ����� �������, ������, �����
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);



DROP TABLE IF EXISTS movies;
CREATE TABLE movies( -- �������� � �������� �������
	id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	description text NOT NULL, -- ��������
	duration CHAR(3), -- ������������
	photo_id BIGINT UNSIGNED,
	created_at YEAR NOT NULL, -- ���� ������
	categories_id BIGINT UNSIGNED NOT NULL,
	INDEX(created_at),
	INDEX(rating),
	FOREIGN KEY (categories_id) REFERENCES categories(id)
);



DROP TABLE IF EXISTS movies_geners;
CREATE TABLE movies_geners( -- �������� ������ � �������
	movie_id BIGINT UNSIGNED NOT NULL,
	genere_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	FOREIGN KEY (genere_id) REFERENCES geners(id),
	PRIMARY KEY (movie_id,genere_id)
);



DROP TABLE IF EXISTS profiles_history;
CREATE TABLE profiles_history( -- ������� ������������� �������
	user_id BIGINT UNSIGNED NOT NULL,
	movie_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY KEY (movie_id,user_id)
);



DROP TABLE IF EXISTS profiles_favorites;
CREATE TABLE profiles_favorites( -- ��������� ������
	user_id BIGINT UNSIGNED NOT NULL,
	movie_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	PRIMARY KEY (movie_id,user_id)
);


DROP TABLE IF EXISTS serials_seasons;
CREATE TABLE serials_seasons( -- ������ ��������
	serial_id BIGINT UNSIGNED NOT NULL,
	num_season BIGINT UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (serial_id) REFERENCES movies(id),
	INDEX(num_season)
);



DROP TABLE IF EXISTS serials_series;
CREATE TABLE serials_series( -- ����� ������� ��������
	serial_id BIGINT UNSIGNED NOT NULL,
	seasons_id BIGINT UNSIGNED NOT NULL,
	num_series BIGINT UNSIGNED NOT NULL,
	description text, -- ��������
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (seasons_id) REFERENCES serials_seasons(num_season),
	FOREIGN KEY (serial_id) REFERENCES movies(id)
);


DROP TABLE IF EXISTS serials_series_test;
CREATE TABLE serials_series_test( -- ����� ������� ��������
	serial_id BIGINT UNSIGNED NOT NULL,
	seasons_id BIGINT UNSIGNED NOT NULL,
	num_series BIGINT UNSIGNED NOT NULL,
	description text, -- ��������
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (seasons_id) REFERENCES serials_seasons(num_season),
	FOREIGN KEY (serial_id) REFERENCES movies(id)
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (  -- �������� ������������ � ������
	id INT(15) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	movie_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL, 
	rating INT(2) UNSIGNED NOT NULL,
	created_at DATETIME NOT NULL DEFAULT NOW(),
	updated_at DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (movie_id) REFERENCES movies(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
); 



















