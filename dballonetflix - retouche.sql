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
    likedArticles INT[],
    likedSeries INT[],
    likedSaisons INT[],
    likedEpisodes INT[],
    likedMovies INT[],
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
	auteur VARCHAR(100),
    img VARCHAR(255),
	note INT,
    tag VARCHAR(100)[]
);

-- -----------------------------------------------------
-- Table schema.Serie
-- -----------------------------------------------------

CREATE TABLE schema.serie (

	idSerie SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	nationality VARCHAR(100),
	distributor VARCHAR(100),
    img VARCHAR(255),
    note INT,
    tag VARCHAR(100)[]
);

-- -----------------------------------------------------
-- Table schema.Saison
-- -----------------------------------------------------

CREATE TABLE schema.saison (

	idSaison SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
    img VARCHAR(255),
    note INT,
	fk_idSerie INT REFERENCES schema.serie
);

-- -----------------------------------------------------
-- Table schema.Episode
-- -----------------------------------------------------

CREATE TABLE schema.episode (

	idEpisode SERIAL PRIMARY KEY,
	title VARCHAR(100),
	synopsis TEXT,
	releaseDate DATE,
	duration INT,
    actor VARCHAR(100)[],
    realisator VARCHAR(100),
    note INT,
	fk_idSaison INT REFERENCES schema.saison
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
	duration INT,
	boxOffice INT,
    actor VARCHAR(100)[],
    realisator VARCHAR(100),
    note INT,
    tag VARCHAR(100)[]    
);

-- -----------------------------------------------------
-- Table schema.Comment
-- -----------------------------------------------------

CREATE TABLE schema.comment (

	idComment SERIAL PRIMARY KEY,
	title VARCHAR(100),
	content TEXT,
	creationDate DATE,
	fk_idAuteur INT REFERENCES schema.user,
	fk_idArticle INT REFERENCES schema.article,
	fk_idSerie INT REFERENCES schema.serie,
	fk_idSaison INT REFERENCES schema.saison,
	fk_idEpisode INT REFERENCES schema.episode,
	fk_idMovie INT REFERENCES schema.movie
);


-- Insert user
INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd)
VALUES ('testPseudo', 'testEmail', 'testMdp', 'testLastName', 'testFirstName', 15, 'rue du clos d''en haut', 'Conflans', 78700, 'f', '23/02/1993', current_date, TRUE);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd)
VALUES ('mewenPseudo', 'mewenEmail', 'mewenMdp', 'mewenLastName', 'mewenFirstName', 2, 'rue de mewenVille', 'mewenVille', 239, 'm', '22/02/1984', current_date, FALSE);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd)
VALUES ('aliPseudo', 'aliEmail', 'aliMdp', 'aliLastName', 'aliFirstName', 56, 'rue de aliVille', 'aliVille', 098, 'm', '8/10/1990', current_date, FALSE);

INSERT INTO schema.user ( pseudo, email, password, lastName, firstName, nbStreet, street, city, postalCode, sex, birthDay, inscriptionDate, rgpd)
VALUES ('davidPseudo', 'davidEmail', 'davidMdp', 'davidLastName', 'davidFirstName', 4, 'rue de davidVille', 'davidVille', 7089, 'm', '30/07/1988', current_date, TRUE);

SELECT * FROM schema.user;


-- Insert article
INSERT INTO schema.article ( title, description, content, creationDate, fk_idAuteur)
VALUES ('Siren : la série fantastique de Freeform', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	current_date, 1);

INSERT INTO schema.article ( title, description, content, creationDate, fk_idAuteur)
VALUES ('Cannes 2018 - BlacKkKlansman : Spike Lee insulte Donald Trump en conférence de presse', 
	'Lors de la conférence de presse de "BlacKkKlansman", Spike Lee a tenu à rappeler la valeur universelle de son film, l''importance d''éveiller les consciences à la question du racisme, tout en chargeant le Président Donald Trump. Morceaux choisis.',
	'Venu présenter son film BlacKkKlansman devant un parterre de journalistes, lors de traditionnelle conférence de presse, Spike Lee n''a pas mâché ses mots pour parler du Président américain Donald Trump, ouvertement pris pour cible dans le long métrage. "On a un type à la Maison Blanche, je n''ose même pas prononcer son nom, qui fait des déclarations devant les américains, devant le monde et cet enfoiré aurait dû parler d''amour et non pas de haine. Cet enfoiré n''a même pas osé dénoncer le Klan. C''était un moment important, il aurait pu dire au monde entier qu''on méritait mieux que cela. On parle de démocratie mais c''est vraiment des conneries."',
	current_date, 1);

INSERT INTO schema.article ( title, description, content, creationDate, fk_idAuteur)
VALUES ('Designated Survivor : bientôt sauvée de l''annulation par Netflix ?', 
	'Alors que la chaîne ABC vient d''annuler la série politique Designated Survivor après deux saisons, Netflix, qui est son diffuseur à l''international y compris chez nous, envisage de la sauver pour une saison 3 !',
	'Après 2 saisons et un record de 4 showrunners différents, la série politique thriller Designated Survivor était annulée par ABC. Une décision surprenante, même si les audiences live étaient en chute libre, car on pensait ses beaux scores en rattrapage et la diffusion de la série à l''international sur Netflix des raisons suffisantes pour lui donner une 3e chance. La présidente de la chaîne Channing Dungey a expliqué ce choix tout récemment lors de la présentation de sa nouvelle grille de programmes : "Ce fut une désision difficile à prendre pour nous. Les audiences en rattrapage étaient vraiment bonnes, mais celles en live étaient devenues trop basses pour continuer." Elle a par ailleurs reconnu qu''un 5e changement de showrunner ne leur inspirait pas confiance, "D''un point de vue créatif, le show a perdu de sa force avec toutes les problèmes rencontrés en coulisses."',
	current_date, 2);

INSERT INTO schema.article ( title, description, content, creationDate, fk_idAuteur)
VALUES ('L''Arme Fatale, Esprits Criminels... Ces séries qui ont viré leurs acteurs pour mauvais comportement', 
	'A l''instar de Clayne Crawford, qui vient d''être viré de L''Arme Fatale, voici d''autres cas d''acteurs qui ont été remerciés de leur série après de mauvais comportements sur le tournage...',
	'Sale ambiance sur le tournage de L''Arme Fatale : Clayne Crawford alias Martin Riggs est accusé d''être à l''origine de vives tensions sur le plateau et ce depuis le lancement de la série en 2016. Il aurait reçu plusieurs avertissements de la part de la production Warner Bros. après des plaintes des équipes l''accusant notamment de créer un environnement de travail hostile et de harcèlement moral. Les problèmes se seraient intensifiés dans les derniers derniers mois. Les autres comédiens ainsi que les techniciens refusant désormais de travailler avec lui. 
Le lendemain des accusations, Crawford publie sa version des faits sur son compte Instagram : "Il est vrai que j''ai été réprimandé à deux reprises au cours des saisons écoulées de L''Arme fatale. La première fois lorsque j''ai réagi sous le coup de la colère à des conditions de tournage qui ne me paraissaient pas sûres et propices à un travail de qualité (…) Le second incident est intervenu au cours d''un épisode que j''ai réalisé. Un acteur de la série ne s''est pas senti en sécurité après avoir été blessé par un éclat lors du tournage d''une cascade. (...) J''assume l''entière responsabilité de l''incident car ce jour-là, le plateau était placé sous ma responsabilité." L''acteur en question n''est autre que sa co-star, Damon Wayans, qui se lâche dans la foulée sur les réseaux sociaux.',
	current_date, 3);

INSERT INTO schema.article ( title, description, content, creationDate, fk_idAuteur)
VALUES ('Mewen Test', 
	'Lancée en mars sur Freeform, "Siren", avec Eline Powell et Alex Roe, sera de retour en 2019 puisque la chaîne américaine a annoncé hier le renouvellement de la série pour une deuxième saison qui comptera cette fois-ci 16 épisodes.',
	'Les sirènes badass de Siren n''ont pas fini de semer le chaos au sein de la petite ville de Bristol Cove ! La chaîne américaine Freeform a en effet annoncé hier, lors des Upfronts, avoir renouvelé la série fantastique emmenée par Eline Powell et Alex Roe pour une deuxième saison qui comptera 16 épisodes, contre 10 pour la première qui s achèvera le 24 mai aux Etats-Unis. Un renouvellement plutôt logique quand on sait que, selon TVLine, Siren est la série la plus vue de Freeform cette saison, devant The Fosters, et qu elle se paye même le luxe d être la série n°1, parmi toutes les nouveautés du câble lancées cette saison, sur la cible des femmes de 18-34 ans et de 12-34 ans.',
	'26/05/2018', 1);


SELECT * FROM schema.article;


-- Insert serie
INSERT INTO schema.serie ( title, synopsis, nationality, fk_idDistributor) 
VALUES ('Safe', 
	'Récemment veuf, Tom est à l''aube d''une nouvelle vie avec ses deux filles, au sein d''une communauté privilégiée et protégée. Mais des secrets profondément enfouis vont venir bouleverser tout ce bel équilibre. Disparition mystérieuse, adultères, assassinat…',
	'américain', 1);

INSERT INTO schema.serie ( title, synopsis, nationality, fk_idDistributor) 
VALUES ('La Casa de Papel', 
	'Huit voleurs font une prise d''otages dans la Maison royale de la Monnaie d''Espagne, tandis qu''un génie du crime manipule la police pour mettre son plan à exécution.',
	'espagnol', 4);

INSERT INTO schema.serie ( title, synopsis, nationality) 
VALUES ('The Rain', 
	'Six ans après l''apparition d''un virus mortel ayant éliminé plus de la moitié de la population, un frère et une sœur partent à la recherche d''un abri dans un monde devenu périlleux.',
	'américain');

INSERT INTO schema.serie ( title, synopsis, nationality, fk_idDistributor) 
VALUES ('The Handmaid''s Tale : la servante écarlate', 
	'Dans une société dystopique et totalitaire au très bas taux de natalité, les femmes sont divisées en trois catégories : les Epouses, qui dominent la maison, les Marthas, qui l''entretiennent, et les Servantes, dont le rôle est la reproduction.Tout sur la saison 2 et l''univers de la série sur thehandmaidstale.allocine.fr',
	'anglais', 2);

SELECT * FROM schema.serie;


-- Insert saison
INSERT INTO schema.saison ( title, synopsis, fk_idSerie) 
VALUES ('Safe : Saison 1', 
	'Synopsis Safe : Saison 1',
	1);

INSERT INTO schema.saison ( title, synopsis, fk_idSerie) 
VALUES ('La Casa de Papel : Saison 1', 
	'Synopsis La Casa de Papel : Saison 1',
	2);

INSERT INTO schema.saison ( title, synopsis, fk_idSerie) 
VALUES ('The Rain : Saison 1', 
	'The Rain Saison 1',
	3);

INSERT INTO schema.saison ( title, synopsis, fk_idSerie) 
VALUES ('The Handmaid''s Tale : Saison 1', 
	'Synopsis The Handmaid''s Saison 1',
	4);

INSERT INTO schema.saison ( title, synopsis, fk_idSerie) 
VALUES ('The Handmaid''s Tale : Saison 2', 
	'Synopsis The Handmaid''s Saison 2',
	4);

SELECT * FROM schema.saison;


-- Insert episode
	-- Safe
INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E01 - UN QUARTIER PAISIBLE', 
	'Sans nouvelle de sa fille adolescente après une soirée un peu trop arrosée, Tom Delaney décide de se mettre à sa recherche, quitte à bouleverser la tranquille communauté dans laquelle vivent lui et sa famille. Tous ses résidents vont alors être eux aussi embarqués dans un véritable cauchemar.',
	'2018-05-10', 
	45,	1);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E02 - HEAVEN', 
	'Depuis que Tom a appris que Pete était avec Jenny la nuit de sa disparition, il ne pense qu''à le retrouver. Pete clame son innocence et ne demande qu''à aider Tom. Une piste les mène dans un bar de la ville. Au même moment, Zoe Chahal et la famille des Mashall se retrouvent dans une situation délicate.',
	'2018-05-10',
	45,	1);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E03 - CHANTAGE', 
	'Tom reçoit un appel d''un inconnu qui lui propose un deal : de l''argent contre une information sur la disparition de Jenny. Son enquête le mène une nouvelle fois à Heaven Lounge où il découvre que Rachel, sa défunte femme, serait peut-être liée à l''affaire. Au même moment, Sophie et Emma sentent que l''affaire de Zoe Chahal va les mener à de terribles découvertes. Les Marshall, quant à eux, s''organisent pour se débarrasser du corps de Chris.',
	'2018-05-10', 
	45,	1);

	-- La Casa de Papel
INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E01 - EPISODE 1', 
	'Nous n''avons pas encore de synopsis disponible pour cet épisode',
	'02/05/2017', 
	55,	2);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E02 - EPISODE 2', 
	'Nous n''avons pas encore de synopsis disponible pour cet épisode',
	'09/05/2017',
	5,	2);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E01 - EPISODE 1', 
	'Nous n''avons pas encore de synopsis disponible pour cet épisode',
	'05/16/2017', 
	55,	2);

	-- The Handmaid's Tale - 1
INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E01 - DEFRED', 
	'Dans une société du futur, la République de Gilead, les femmes ont perdu tous leurs droits et sont entièrement soumises aux hommes. Mais le gouvernement, phallocratique, réactionnaire et totalitaire, est confronté à un défi : la pollution a rendu stériles la plupart des femmes. Pour tenter d''enrayer le déclin de la population, les femmes fertiles, membres de la caste des Servantes, sont réduites au rang d''esclaves sexuelles. Offred, l''une d''elles, est assignée comme reproductrice à un des dirigeants de la junte. Elle doit impérativement lui donner un enfant...',
	'04/26/2017', 
	70,	4);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E02 - JOUR DE NAISSANCE', 
	'Offred et trois autres femmes participent à l''accouchement d''une Servante, Janine. Lorsque la délivrance approche, l''Epouse est appelée auprès de Janine. Le bébé lui est aussitôt confié sans que Janine puisse le voir. Offred ne peut pas s''empêcher de se remémorer la naissance de sa fille et les moments heureux partagés avec sa famille. La jeune femme est inquiète : le commandant Waterford, qui l''a violée le matin, souhaite la revoir le soir même...',
	'04/26/2017',
	70,	4);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S01E03 - RETARD', 
	'En même temps que le reste de la maisonnée, où chacun de ses gestes est surveillé, Offred découvre qu''elle est peut-être enceinte. Emplie d''espoir, Serena Joy se montre pleine d''égards pour elle. Malheureusement, malgré son état supposé, Offred ne se voit pas épargner toutes les humiliations liées à son statut de Servante. Elle est interrogée sans ménagement par tante Lydia sur la nature de sa relation avec Ofglen, soupçonnée d''être homosexuelle. De son côté, Ofglen, redevenue Emily depuis qu''elle n''est plus utile à son Commandant, subit une terrible mutilation...',
	'04/26/2017', 
	70,	4);

	-- The Handmaid's Tale - 2
INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S02E01 - JUNE', 
	'Offred fait face aux conséquences d''une décision dangereuse alors qu''elle est hantée par les souvenirs de son passé et les débuts violents de Gilead.',
	'04/25/2018', 
	70,	5);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S02E02 - UNWOMEN', 
	'Offred s''adapte à un nouveau mode de vie; L''arrivée d''une personne inattendue perturbe les colonies; Une famille est déchirée par l''ascension de Gilead.',
	'04/25/2018', 
	70,	5);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S02E03 - BAGGAGE', 
	'June se pose des questions sur sa relation avec sa mère, alors qu''elle navigue à travers Gilead; Moira essaie de faire face au traumatisme qu''elle a enduré.',
	'02/05/2018', 
	70,	5);

INSERT INTO schema.episode ( title, synopsis, releaseDate, duration, fk_idSaison) 
VALUES ('S02E04 - OTHER WOMAN', 
	'Un changement troublant apparaît dans la relation de June et Serena Joy, et elle se rappelle du moment ou elle a fait le choix de devenir une servante.',
	'09/05/2018', 
	70,	4);

SELECT * FROM schema.episode;


-- Insert movie
INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice) 
VALUES ('Coco', 
	'Depuis déjà plusieurs générations, la musique est bannie dans la famille de Miguel. Un vrai déchirement pour le jeune garçon dont le rêve ultime est de devenir un musicien aussi accompli que son idole, Ernesto de la Cruz.',
	'2017-11-29', 
	'américain',
	105,
	100500);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice) 
VALUES ('Forrest Gump', 
	'Quelques décennies d''histoire américaine, des années 1940 à la fin du XXème siècle, à travers le regard et l''étrange odyssée d''un homme simple et pur, Forrest Gump.',
	'1994-10-05', 
	'américain',
	140,
	94200);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice) 
VALUES ('Le Parrain', 
	'En 1945, à New York, les Corleone sont une des cinq familles de la mafia. Don Vito Corleone marie sa fille à un bookmaker. Sollozzo, "parrain" de la famille Tattaglia, propose à Don Vito une association dans le trafic de drogue...',
	'1972-03-15', 
	'italien',
	175,
	230600);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice) 
VALUES ('Django Unchained', 
	'Le parcours d''un chasseur de prime allemand et d''un homme noir pour retrouver la femme de ce dernier retenue en esclavage par le propriétaire d''une plantation...',
	'2013-01-16', 
	'américain',
	165,
	10400);

INSERT INTO schema.movie ( title, synopsis, releaseDate, 
	nationality, duration, boxOffice) 
VALUES ('Gran Torino', 
	'Walt Kowalski est un ancien de la guerre de Corée, un homme inflexible, amer et pétri de préjugés surannés. Hormis sa chienne Daisy, il ne fait confiance qu''à son M-1, toujours propre, toujours prêt à l''usage...',
	'2009-02-25', 
	'américain',
	110,
	78000);

SELECT * FROM schema.movie;


-- Insert comment
INSERT INTO schema.comment ( title, content, creationDate, fk_idAuteur, fk_idArticle)
VALUES ('Comment 1' , ' Content 1', current_date, 1, 2);

INSERT INTO schema.comment ( title, content, creationDate, fk_idAuteur, fk_idSerie)
VALUES ('Comment 2' , ' Content 2', current_date, 4, 3);

INSERT INTO schema.comment ( title, content, creationDate, fk_idAuteur, fk_idSaison)
VALUES ('Comment 3' , ' Content 3', current_date, 2, 4);

INSERT INTO schema.comment ( title, content, creationDate, fk_idAuteur, fk_idEpisode)
VALUES ('Comment 4' , ' Content 4', current_date, 1, 3);

INSERT INTO schema.comment ( title, content, creationDate, fk_idAuteur, fk_idMovie)
VALUES ('Comment 5' , ' Content 5', current_date, 2, 3);

SELECT * FROM schema.comment;