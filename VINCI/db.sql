CREATE DATABASE vinci_v1;

USE vinci_v1;

CREATE TABLE categories(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE tags(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE users(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(255) NOT NULL,
	password VARCHAR(50) NOT NULL,
	about TEXT,
	about_image VARCHAR,
	perfil_photo VARCHAR
);

CREATE TABLE projects(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	title VARCHAR(255) NOT NULL,
	image VARCHAR NOT NULL,
	likes INT,
	user_id INT FOREIGN KEY REFERENCES users(id)
);

CREATE TABLE social_medias(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	name VARCHAR(50) NOT NULL,
	icon VARCHAR,
	url VARCHAR,
	user_id INT FOREIGN KEY REFERENCES users(id)
);

CREATE TABLE testimonials(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	content TEXT NOT NULL,
	autor_id INT FOREIGN KEY REFERENCES users(id) NOT NULL,
	user_id INT FOREIGN KEY REFERENCES users(id) NOT NULL
);

CREATE TABLE comments(
	id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	content TEXT NOT NULL,
	autor_id INT FOREIGN KEY REFERENCES users(id),
	project_id INT FOREIGN KEY REFERENCES projects(id),
);

-- TABLAS DE ROMPIMIENTO

CREATE TABLE project_tag(
	project_id INT FOREIGN KEY REFERENCES projects(id),
	tag_id INT FOREIGN KEY REFERENCES tags(id)
);

CREATE TABLE project_category(
	project_id INT FOREIGN KEY REFERENCES projects(id),
	category_id INT FOREIGN KEY REFERENCES categories(id)
);

SELECT * FROM categories;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM projects;
SELECT * FROM social_medias;
SELECT * FROM testimonials;
SELECT * FROM comments;
SELECT * FROM project_category;
SELECT * FROM project_tag;