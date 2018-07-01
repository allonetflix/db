-- -----------------------------------------------------
-- Table Tag
-- -----------------------------------------------------

CREATE TABLE tag (

	idTag SERIAL PRIMARY KEY,
	tag VARCHAR(100)
);

-- -----------------------------------------------------
-- Table Note
-- -----------------------------------------------------

CREATE TABLE note (

	idNote SERIAL PRIMARY KEY,
	note INT
);

-- -----------------------------------------------------
-- Table User
-- -----------------------------------------------------

CREATE TABLE user (

	idUser SERIAL PRIMARY KEY,
	pseudo VARCHAR(100),
	email VARCHAR(100),
	password VARCHAR(100),
	lastName VARCHAR(100),
	firstName VARCHAR(100),
	nbStreet INT,
	street VARCHAR(100),
	city VARCHAR(100),
	postalCode INT,
	sex VARCHAR(100),
	birthDay DATE,
	inscriptionDate DATE,
	modifDate DATE,
	rgpd BOOLEAN
);

-- -----------------------------------------------------
-- Table Article
-- -----------------------------------------------------

CREATE TABLE article (

	idArticle SERIAL PRIMARY KEY,
	title VARCHAR(100),
	description TEXT,
	content TEXT,
	creationDate DATE,
	modifDate DATE,
	fk_idAuteur INT REFERENCES user
);

-- -----------------------------------------------------
-- Table Distributor
-- -----------------------------------------------------

CREATE TABLE distributor (

	idDistributor SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

-- -----------------------------------------------------
-- Table Realisator
-- -----------------------------------------------------

CREATE TABLE realisator (

	idRealisator SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

-- -----------------------------------------------------
-- Table Actor
-- -----------------------------------------------------

CREATE TABLE actor (

	idActor SERIAL PRIMARY KEY,
	lastName VARCHAR(100),
	firstName VARCHAR(100),
	nationality VARCHAR(100),
	birthDay DATE,
	age INT
);

-- -----------------------------------------------------
-- Table Serie
-- -----------------------------------------------------

CREATE TABLE serie (

	idSerie SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	nationality VARCHAR(100),
	fk_idDistributor INT REFERENCES distributor
);


-- -----------------------------------------------------
-- Table Saison
-- -----------------------------------------------------

CREATE TABLE saison (

	idSaison SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	fk_idSerie INT REFERENCES serie
);

-- -----------------------------------------------------
-- Table Episode
-- -----------------------------------------------------

CREATE TABLE episode (

	idEpisode SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	releaseDate DATE,
	duration INT,
	fk_idSaison INT REFERENCES saison
);

-- -----------------------------------------------------
-- Table Movie
-- -----------------------------------------------------

CREATE TABLE movie (

	idMovie SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	releaseDate DATE,
	nationality VARCHAR(100),
	duration INT,
	boxOffice INT
);

-- -----------------------------------------------------
-- Table Critic
-- -----------------------------------------------------

CREATE TABLE critic (

	idCritic SERIAL PRIMARY KEY,
	title VARCHAR(100),
	content TEXT,
	creationDate DATE,
	modifDate DATE,
	fk_idAuteur INT REFERENCES user,
	fk_idArticle INT REFERENCES article,
	fk_idSerie INT REFERENCES serie,
	fk_idSaison INT REFERENCES saison,
	fk_idEpisode INT REFERENCES episode,
	fk_idMovie INT REFERENCES movie
);

-- -----------------------------------------------------
-- Table Media
-- -----------------------------------------------------

CREATE TABLE media (

	idMedia SERIAL PRIMARY KEY,
	title VARCHAR(100),
	type VARCHAR(100),
	url TEXT,
	fk_idAuteur INT REFERENCES user,
	fk_idArticle INT REFERENCES article,
	fk_idSerie INT REFERENCES serie,
	fk_idSaison INT REFERENCES saison,	
	fk_idEpisode INT REFERENCES episode,
	fk_idMovie INT REFERENCES movie,
	fk_idActor INT REFERENCES actor
);

-- -----------------------------------------------------
-- Table Comment
-- -----------------------------------------------------

CREATE TABLE comment (

	idComment SERIAL PRIMARY KEY,
	title VARCHAR(100),
	content TEXT,
	creationDate DATE,
	modifDate DATE,
	fk_idAuteur INT REFERENCES user,
	fk_idArticle INT REFERENCES article,
	fk_idSerie INT REFERENCES serie,
	fk_idSaison INT REFERENCES saison,
	fk_idEpisode INT REFERENCES episode,
	fk_idMovie INT REFERENCES movie
);

-- TAG -- 
-- -----------------------------------------------------
-- Table Article_Tag
-- -----------------------------------------------------

CREATE TABLE article_tag (

	idArticle_tag SERIAL PRIMARY KEY,
	fk_idArticle INT REFERENCES article,
	fk_idTag INT REFERENCES tag
);

-- -----------------------------------------------------
-- Table Serie_Tag
-- -----------------------------------------------------

CREATE TABLE serie_tag (

	idSerie_tag SERIAL PRIMARY KEY,
	fk_idSerie INT REFERENCES serie,
	fk_idTag INT REFERENCES tag
);

-- -----------------------------------------------------
-- Table Saison_Tag
-- -----------------------------------------------------

CREATE TABLE saison_tag (

	idSaison_tag SERIAL PRIMARY KEY,
	fk_idSaison INT REFERENCES saison,
	fk_idTag INT REFERENCES tag
);

-- -----------------------------------------------------
-- Table Episode_Tag
-- -----------------------------------------------------

CREATE TABLE episode_tag (

	idEpisode_tag SERIAL PRIMARY KEY,
	fk_idEpisode INT REFERENCES episode,
	fk_idTag INT REFERENCES tag
);

-- -----------------------------------------------------
-- Table Movie_Tag
-- -----------------------------------------------------

CREATE TABLE movie_tag (

	idMovie_tag SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES movie,
	fk_idTag INT REFERENCES tag
);

-- NOTE --
-- -----------------------------------------------------
-- Table User_Note
-- -----------------------------------------------------

CREATE TABLE user_note (

	idUser_note SERIAL PRIMARY KEY,
	fk_idUser INT REFERENCES user,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Article_Note
-- -----------------------------------------------------

CREATE TABLE article_note (

	idArticle_note SERIAL PRIMARY KEY,
	fk_idArticle INT REFERENCES article,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Serie_Note
-- -----------------------------------------------------

CREATE TABLE serie_note (

	idSerie_note SERIAL PRIMARY KEY,
	fk_idSerie INT REFERENCES serie,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Saison_Note
-- -----------------------------------------------------

CREATE TABLE saison_note(

	idSaison_note SERIAL PRIMARY KEY,
	fk_idSaison INT REFERENCES saison,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Episode_Note
-- -----------------------------------------------------

CREATE TABLE episode_note (

	idEpisode_note SERIAL PRIMARY KEY,
	fk_idEpisode INT REFERENCES episode,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Movie_Note
-- -----------------------------------------------------

CREATE TABLE movie_note (

	idMovie_note SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES movie,
	fk_idNote INT REFERENCES note
);

-- -----------------------------------------------------
-- Table Critic_Note
-- -----------------------------------------------------

CREATE TABLE critic_note (

	idCritic_note SERIAL PRIMARY KEY,
	fk_idCritic INT REFERENCES critic,
	fk_idNote INT REFERENCES note
);

-- EPISODE --
-- -----------------------------------------------------
-- Table Episode_Actor
-- -----------------------------------------------------

CREATE TABLE episode_actor (

	idEpisode_actor SERIAL PRIMARY KEY,
	fk_idEpisode INT REFERENCES episode,
	fk_idActor INT REFERENCES actor
);

-- -----------------------------------------------------
-- Table Episode_Realisator
-- -----------------------------------------------------

CREATE TABLE episode_realisator (

	idEpisode_realisator SERIAL PRIMARY KEY,
	fk_idEpisode INT REFERENCES episode,
	fk_idRealisator INT REFERENCES realisator
);

-- MOVIE --
-- -----------------------------------------------------
-- Table Movie_Actor
-- -----------------------------------------------------

CREATE TABLE movie_actor (

	idMovie_actor SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES movie,
	fk_idActor INT REFERENCES actor
);

-- -----------------------------------------------------
-- Table Movie_Realisator
-- -----------------------------------------------------

CREATE TABLE movie_realisator (

	idMovie_realisator SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES movie,
	fk_idRealisator INT REFERENCES realisator
);

