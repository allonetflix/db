-- -----------------------------------------------------
-- Table schema.User
-- -----------------------------------------------------

CREATE TABLE schema.user (

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
	rgpd BOOLEAN
);

-- -----------------------------------------------------
-- Table schema.Article
-- -----------------------------------------------------

CREATE TABLE schema.article (

	idArticle SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	content TEXT,
	creationDate DATE,
    img VARCHAR(255),
    background VARCHAR(255),
	note INT,
	fk_idAuteur INT REFERENCES schema.user ON DELETE CASCADE
);

-- -----------------------------------------------------
-- Table schema.Serie
-- -----------------------------------------------------

CREATE TABLE schema.serie (

	idSerie SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	tag VARCHAR(255),
	creator VARCHAR(100),
    background VARCHAR(255),
    img VARCHAR(255),
    note INT,
	creationDate DATE
);

-- -----------------------------------------------------
-- Table schema.Movie
-- -----------------------------------------------------

CREATE TABLE schema.movie (

	idMovie SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	releaseDate DATE,
	nationality VARCHAR(100),
    realisator VARCHAR(100),
    background VARCHAR(255),
    img VARCHAR(255),
    note INT,
	creationDate DATE    
);

-- -----------------------------------------------------
-- Table schema.Comment
-- -----------------------------------------------------

CREATE TABLE schema.comment (

	idComment SERIAL PRIMARY KEY,
	title VARCHAR(100),
	content TEXT,
	creationDate DATE,
	fk_idAuteur INT REFERENCES schema.user ON DELETE CASCADE,
	fk_idArticle INT REFERENCES schema.article ON DELETE CASCADE,
	fk_idSerie INT REFERENCES schema.serie,
	fk_idMovie INT REFERENCES schema.movie
);

-- LIKE --
-- -----------------------------------------------------
-- Table schema.Article_Like
-- -----------------------------------------------------

CREATE TABLE schema.article_like (

	idArticle_like SERIAL PRIMARY KEY,
	fk_idArticle INT REFERENCES schema.article ON DELETE CASCADE,
	fk_idUserlike INT REFERENCES schema.user
);

-- -----------------------------------------------------
-- Table schema.Serie_Like
-- -----------------------------------------------------

CREATE TABLE schema.serie_like (

	idSerie_like SERIAL PRIMARY KEY,
	fk_idSerie INT REFERENCES schema.serie,
	fk_idUserlike INT REFERENCES schema.user
);

-- -----------------------------------------------------
-- Table schema.Movie_Like
-- -----------------------------------------------------

CREATE TABLE schema.movie_like (

	idMovie_like SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES schema.movie,
	fk_idUserlike INT REFERENCES schema.user
);


-- Note --
-- -----------------------------------------------------
-- Table schema.Article_Note
-- -----------------------------------------------------

CREATE TABLE schema.article_note (

	idArticle_note SERIAL PRIMARY KEY,
	fk_idArticle INT REFERENCES schema.article ON DELETE CASCADE,
	fk_idUsernote INT REFERENCES schema.user,
	note INT
);

-- -----------------------------------------------------
-- Table schema.Serie_Note
-- -----------------------------------------------------

CREATE TABLE schema.serie_note (

	idSerie_note SERIAL PRIMARY KEY,
	fk_idSerie INT REFERENCES schema.serie,
	fk_idUsernote INT REFERENCES schema.user,
	note INT
);

-- -----------------------------------------------------
-- Table schema.Movie_Note
-- -----------------------------------------------------

CREATE TABLE schema.movie_note (

	idMovie_note SERIAL PRIMARY KEY,
	fk_idMovie INT REFERENCES schema.movie,
	fk_idUsernote INT REFERENCES schema.user,
	note INT
);

-- Insert user
INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd, likedArticles)
VALUES ('testPseudo', 'testEmail', 'testMdp', 'testLastName', 'testFirstName', 15, 'rue du clos d''en haut', 'Conflans', 78700, 'f', '23/02/1993', current_date, TRUE, ARRAY[1,2,3]);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd, likedArticles)
VALUES ('mewenPseudo', 'mewenEmail', 'mewenMdp', 'mewenLastName', 'mewenFirstName', 2, 'rue de mewenVille', 'mewenVille', 239, 'm', '22/02/1984', current_date, FALSE, ARRAY[6,5,6]);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd, likedArticles)
VALUES ('aliPseudo', 'aliEmail', 'aliMdp', 'aliLastName', 'aliFirstName', 56, 'rue de aliVille', 'aliVille', 098, 'm', '8/10/1990', current_date, FALSE, ARRAY[2,7,5]);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd, likedArticles)
VALUES ('davidPseudo', 'davidEmail', 'davidMdp', 'davidLastName', 'davidFirstName', 4, 'rue de davidVille', 'davidVille', 7089, 'm', '30/07/1988', current_date, TRUE, ARRAY[7,8,1]);

SELECT * FROM schema.user;

SELECT * FROM schema.user WHERE pseudo LIKE 'mew%';

-- Insert article
INSERT INTO schema.article ( title, synopsis, content, creationDate, img, note)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	current_date, 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 5);

INSERT INTO schema.article ( title, synopsis, content, creationDate, auteur, img, note, tag)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	current_date, 'John Doe', 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 2, ARRAY['relation humaine', 'humour']);

INSERT INTO schema.article ( title, synopsis, content, creationDate, auteur, img, note, tag)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	current_date, 'John Doe', 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 3, ARRAY['relation humaine', 'humour']);

INSERT INTO schema.article ( title, synopsis, content, creationDate, auteur, img, note, tag)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	current_date, 'John Doe', 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 4, ARRAY['relation humaine', 'humour']);


INSERT INTO schema.article ( title, synopsis, content, creationDate, auteur, img, note, tag)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	'06/11/2018', 'John Doe', 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 3, ARRAY['relation humaine', 'humour']);

INSERT INTO schema.article ( title, synopsis, content, creationDate, auteur, img, note, tag)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	'20/12/2018', 'John Doe', 'https://expat-03cdkbceglbjg.stackpathdns.com/upload/events/covers/74a081f0d705411255b17-events_cover.jpg', 4, ARRAY['relation humaine', 'humour']);

SELECT * FROM schema.article;


-- Insert serie
INSERT INTO schema.serie ( title, synopsis, nationality, distributor, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Récemment veuf, Tom est à l''aube d''une nouvelle vie avec ses deux filles, au sein d''une communauté privilégiée et protégée. Mais des secrets profondément enfouis vont venir bouleverser tout ce bel équilibre. Disparition mystérieuse, adultères, assassinat…',
	'américain', 'John Distributor', 'https://i.pinimg.com/originals/b3/2d/85/b32d853d4b93eb5add56b1b60b4eb190.jpg', 2, ARRAY['guerre', 'fantaisie'], current_date);

INSERT INTO schema.serie ( title, synopsis, nationality, distributor, img, note, tag, creationDate) 
VALUES ('Safe', 
	'Récemment veuf, Tom est à l''aube d''une nouvelle vie avec ses deux filles, au sein d''une communauté privilégiée et protégée. Mais des secrets profondément enfouis vont venir bouleverser tout ce bel équilibre. Disparition mystérieuse, adultères, assassinat…',
	'américain', 'John Distributor', 'https://i.pinimg.com/originals/b3/2d/85/b32d853d4b93eb5add56b1b60b4eb190.jpg', 5, ARRAY['guerre', 'fantaisie'], current_date);

INSERT INTO schema.serie ( title, synopsis, nationality, distributor, img, note, tag, creationDate) 
VALUES ('Safe', 
	'Récemment veuf, Tom est à l''aube d''une nouvelle vie avec ses deux filles, au sein d''une communauté privilégiée et protégée. Mais des secrets profondément enfouis vont venir bouleverser tout ce bel équilibre. Disparition mystérieuse, adultères, assassinat…',
	'américain', 'John Distributor', 'https://i.pinimg.com/originals/b3/2d/85/b32d853d4b93eb5add56b1b60b4eb190.jpg', 3, ARRAY['guerre', 'fantaisie'], current_date);

INSERT INTO schema.serie ( title, synopsis, nationality, distributor, img, note, tag, creationDate) 
VALUES ('Safe', 
	'Récemment veuf, Tom est à l''aube d''une nouvelle vie avec ses deux filles, au sein d''une communauté privilégiée et protégée. Mais des secrets profondément enfouis vont venir bouleverser tout ce bel équilibre. Disparition mystérieuse, adultères, assassinat…',
	'américain', 'John Distributor', 'https://i.pinimg.com/originals/b3/2d/85/b32d853d4b93eb5add56b1b60b4eb190.jpg', 1, ARRAY['guerre', 'fantaisie'], current_date);

SELECT * FROM schema.serie;


-- Insert saison
INSERT INTO schema.saison ( title, synopsis, img, note, creationDate, fk_idSerie) 
VALUES ('Safe : Saison 1', 'Synopsis Safe : Saison 1', 'https://pbs.twimg.com/media/DWNV3BUVQAAcxHr.jpg', 3, current_date, 1);

INSERT INTO schema.saison ( title, synopsis, img, note, creationDate, fk_idSerie) 
VALUES ('Safe : Saison 1', 'Synopsis Safe : Saison 1', 'https://pbs.twimg.com/media/DWNV3BUVQAAcxHr.jpg', 3, current_date, 2);

INSERT INTO schema.saison ( title, synopsis, img, note, creationDate, fk_idSerie) 
VALUES ('Safe : Saison 1', 'Synopsis Safe : Saison 1', 'https://pbs.twimg.com/media/DWNV3BUVQAAcxHr.jpg', 0, current_date, 3);

INSERT INTO schema.saison ( title, synopsis, img, note, creationDate, fk_idSerie) 
VALUES ('Safe : Saison 1', 'Synopsis Safe : Saison 1', 'https://pbs.twimg.com/media/DWNV3BUVQAAcxHr.jpg', 1, current_date, 1);

SELECT * FROM schema.saison;


-- Insert episode
	-- Safe
INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, actor, realisator, img, note, creationDate, fk_idSaison) 
VALUES ('S01E01 - UN QUARTIER PAISIBLE', 
	'Sans nouvelle de sa fille adolescente après une soirée un peu trop arrosée, Tom Delaney décide de se mettre à sa recherche, quitte à bouleverser la tranquille communauté dans laquelle vivent lui et sa famille. Tous ses résidents vont alors être eux aussi embarqués dans un véritable cauchemar.',
	'2018-05-10', 45, ARRAY['John Doe', 'Barry White'], 'Martin Gay', 'http://fr.web.img6.acsta.net/c_215_290/pictures/17/10/10/04/58/2061488.jpg', 0, current_date, 1);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, actor, realisator, img, note, creationDate, fk_idSaison) 
VALUES ('S01E01 - UN QUARTIER PAISIBLE', 
	'Sans nouvelle de sa fille adolescente après une soirée un peu trop arrosée, Tom Delaney décide de se mettre à sa recherche, quitte à bouleverser la tranquille communauté dans laquelle vivent lui et sa famille. Tous ses résidents vont alors être eux aussi embarqués dans un véritable cauchemar.',
	'2018-05-10', 45, ARRAY['John Doe', 'Barry White'], 'Martin Gay', 'http://fr.web.img6.acsta.net/c_215_290/pictures/17/10/10/04/58/2061488.jpg', 1, current_date, 1);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, actor, realisator, img, note, creationDate, fk_idSaison) 
VALUES ('S01E01 - UN QUARTIER PAISIBLE', 
	'Sans nouvelle de sa fille adolescente après une soirée un peu trop arrosée, Tom Delaney décide de se mettre à sa recherche, quitte à bouleverser la tranquille communauté dans laquelle vivent lui et sa famille. Tous ses résidents vont alors être eux aussi embarqués dans un véritable cauchemar.',
	'2018-05-10', 45, ARRAY['John Doe', 'Barry White'], 'Martin Gay', 'http://fr.web.img6.acsta.net/c_215_290/pictures/17/10/10/04/58/2061488.jpg', 3, current_date, 1);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, actor, realisator, img, note, creationDate, fk_idSaison) 
VALUES ('S01E01 - UN QUARTIER PAISIBLE', 
	'Sans nouvelle de sa fille adolescente après une soirée un peu trop arrosée, Tom Delaney décide de se mettre à sa recherche, quitte à bouleverser la tranquille communauté dans laquelle vivent lui et sa famille. Tous ses résidents vont alors être eux aussi embarqués dans un véritable cauchemar.',
	'2018-05-10', 45, ARRAY['John Doe', 'Barry White'], 'Martin Gay', 'http://fr.web.img6.acsta.net/c_215_290/pictures/17/10/10/04/58/2061488.jpg', 5, current_date, 1);



SELECT * FROM schema.episode;


-- Insert movie
INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	4, ARRAY['fantaisie', 'futuriste'], current_date);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	4, ARRAY['fantaisie', 'futuriste'], current_date);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	3, ARRAY['fantaisie', 'futuriste'], current_date);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	2, ARRAY['fantaisie', 'futuriste'], current_date);


INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	2, ARRAY['fantaisie', 'futuriste'], '20/09/2018');

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice, actor, realisator, img, note, tag, creationDate) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 'américain', 105,	100500,	ARRAY['John Doe', 'Gregor McKillan'], 'John Realisator',
	'http://fr.web.img5.acsta.net/r_1280_720/pictures/17/12/11/11/56/4200411.jpg',
	2, ARRAY['fantaisie', 'futuriste'], '25/12/2018');

SELECT * FROM schema.movie;


-- Insert comment
INSERT INTO schema.comment ( title, content, fk_idAuteur, fk_idArticle)
VALUES ('Comment 1' , ' Content 1', 1, 1);

INSERT INTO schema.comment ( title, content, fk_idAuteur, fk_idSerie)
VALUES ('Comment 2' , ' Content 2', 1, 1);

INSERT INTO schema.comment ( title, content, fk_idAuteur, fk_idSaison)
VALUES ('Comment 3' , ' Content 3', 1, 1);

INSERT INTO schema.comment ( title, content, fk_idAuteur, fk_idEpisode)
VALUES ('Comment 4' , ' Content 4', 1, 3);

INSERT INTO schema.comment ( title, content, fk_idAuteur, fk_idMovie)
VALUES ('Comment 5' , ' Content 5', 1, 1);

SELECT * FROM schema.comment;


-- Insert article_note
INSERT INTO schema.article_note ( fk_idArticle, fk_idUsernote, note) VALUES (1, 1, 4);

SELECT * FROM schema.article_note;