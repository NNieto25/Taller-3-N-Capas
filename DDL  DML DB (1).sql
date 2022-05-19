-- public.category definition

-- Drop table

-- DROP TABLE public.category;

CREATE TABLE public.category (
id varchar NOT NULL,
"name" varchar NOT NULL,
CONSTRAINT category_pk PRIMARY KEY (id)
);


-- public."user" definition

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE public."user" (
username varchar NOT NULL,
email varchar NOT NULL,
"password" varchar NULL,
"name" varchar NOT NULL,
id serial4 NOT NULL,
CONSTRAINT user_pk PRIMARY KEY (id),
CONSTRAINT user_unique_email UNIQUE (email),
CONSTRAINT user_unique_username UNIQUE (username)
);


-- public.book definition

-- Drop table

-- DROP TABLE public.book;

CREATE TABLE public.book (
isbn varchar NOT NULL,
title varchar NOT NULL,
publish_date date NOT NULL,
stock int4 NULL DEFAULT 0,
id_category varchar NULL,
CONSTRAINT book_pk PRIMARY KEY (isbn),
CONSTRAINT book_fk FOREIGN KEY (id_category) REFERENCES public.category(id) ON DELETE SET NULL ON UPDATE CASCADE
);


-- public.book_loan definition

-- Drop table

-- DROP TABLE public.book_loan;

CREATE TABLE public.book_loan (
loan_date date NOT NULL,
return_date date NULL,
id_user varchar NULL,
id_book varchar NULL,
id serial4 NOT NULL,
CONSTRAINT book_loan_pk PRIMARY KEY (id),
CONSTRAINT book_loan_fk FOREIGN KEY (id_book) REFERENCES public.book(isbn) ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT book_loan_fk_1 FOREIGN KEY (id_user) REFERENCES public."user"(username)
);

-- Populate

delete from category ;
insert into category  (id, name) values 
	('CT01', 'Action'),
    ('CT02', 'Drama'),
    ('CT03', 'Crime'),
    ('CT04', 'Comedy'),
    ('CT05', 'Horror'),
    ('CT06', 'Scyfy'),
    ('CT07', 'Mystery'),
    ('CT08', 'Action'),
    ('CT09', 'Adventure'),
    ('CT10', 'Fantasy');
    
delete from book;
insert into book (isbn, title, publish_date, id_category, stock) values ('023229140-3', 'War of the Shaolin Temple (Shao Lin shi san gun seng)', '1945-04-17', 'CT06', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('516162448-5', 'The War at Home', '2003-05-31', 'CT09', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('899931058-2', 'Flash Point (a.k.a. Flashpoint) (Dou fo sin)', '1966-12-25', 'CT01', 22);
insert into book (isbn, title, publish_date, id_category, stock) values ('826576817-6', 'Strange Magic', '2000-08-27', 'CT08', 24);
insert into book (isbn, title, publish_date, id_category, stock) values ('493606665-6', 'Underdog', '1952-08-28', 'CT06', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('408800373-X', 'Cold Showers (Douches froides)', '1951-11-05', 'CT02', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('187368784-2', 'Stanley Kubrick: A Life in Pictures', '2018-08-06', 'CT04', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('834712660-7', 'Beauty and the Beast (Belle et la bête, La)', '2001-10-20', 'CT05', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('997619320-3', 'Outlaw Josey Wales, The', '1948-07-04', 'CT08', 19);
insert into book (isbn, title, publish_date, id_category, stock) values ('819554513-0', 'Frozen Land (Paha maa)', '1962-05-24', 'CT04', 3);
insert into book (isbn, title, publish_date, id_category, stock) values ('112876322-2', 'Infinity', '2021-05-10', 'CT08', 1);
insert into book (isbn, title, publish_date, id_category, stock) values ('109632112-2', 'Storefront Hitchcock', '1945-08-15', 'CT10', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('240247127-1', 'Begotten', '1941-12-07', 'CT09', 18);
insert into book (isbn, title, publish_date, id_category, stock) values ('393311621-X', 'Gay Purr-ee', '1992-04-21', 'CT02', 16);
insert into book (isbn, title, publish_date, id_category, stock) values ('631009676-1', 'Walking with Monsters', '2007-03-09', 'CT01', 23);
insert into book (isbn, title, publish_date, id_category, stock) values ('777013408-0', 'Terror Train', '1954-06-25', 'CT03', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('463897427-9', 'Skellig', '2014-11-02', 'CT03', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('243638893-8', 'The Unexpected Love', '1958-03-27', 'CT09', 20);
insert into book (isbn, title, publish_date, id_category, stock) values ('633827186-X', 'One Tough Cop', '2007-05-16', 'CT10', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('989846297-3', 'The Man From The Alamo', '1984-10-10', 'CT10', 22);
insert into book (isbn, title, publish_date, id_category, stock) values ('011299826-7', 'Pekka ja Pätkä salapoliiseina', '1994-07-25', 'CT09', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('902171500-7', 'Here Comes Cookie', '1985-11-14', 'CT05', 19);
insert into book (isbn, title, publish_date, id_category, stock) values ('766347047-8', 'Welcome to the Jungle', '2002-12-30', 'CT02', 11);
insert into book (isbn, title, publish_date, id_category, stock) values ('331482067-4', 'Newsfront', '2015-01-15', 'CT10', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('626836309-4', '27 Dresses', '1930-08-25', 'CT09', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('424828176-7', 'Attack Force Z (a.k.a. The Z Men) (Z-tzu te kung tui)', '2016-01-20', 'CT06', 15);
insert into book (isbn, title, publish_date, id_category, stock) values ('836270779-8', 'Alive', '1982-02-11', 'CT01', 17);
insert into book (isbn, title, publish_date, id_category, stock) values ('902086072-0', 'Zombie (a.k.a. Zombie 2: The Dead Are Among Us) (Zombi 2)', '2016-02-03', 'CT01', 15);
insert into book (isbn, title, publish_date, id_category, stock) values ('095871048-1', 'American Werewolf in Paris, An', '2005-03-26', 'CT03', 16);
insert into book (isbn, title, publish_date, id_category, stock) values ('360830271-9', 'Schooled: The Price of College Sports ', '1974-01-07', 'CT08', 1);
insert into book (isbn, title, publish_date, id_category, stock) values ('272779595-5', 'Marty', '1996-09-10', 'CT08', 13);
insert into book (isbn, title, publish_date, id_category, stock) values ('793448503-4', 'King & Country', '1987-11-30', 'CT08', 7);
insert into book (isbn, title, publish_date, id_category, stock) values ('389153328-4', 'The Humanoid', '1948-07-06', 'CT06', 22);
insert into book (isbn, title, publish_date, id_category, stock) values ('874283284-5', 'Donnie Darko', '1952-02-28', 'CT03', 5);
insert into book (isbn, title, publish_date, id_category, stock) values ('051871115-3', 'All About Lily Chou-Chou (Riri Shushu no subete)', '1952-12-28', 'CT06', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('809242697-X', 'Mutiny on the Bounty', '1959-02-26', 'CT07', 3);
insert into book (isbn, title, publish_date, id_category, stock) values ('872204772-7', 'Mina Tannenbaum', '2001-01-02', 'CT06', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('890588132-7', 'Dr. Goldfoot and the Bikini Machine', '1997-08-29', 'CT05', 13);
insert into book (isbn, title, publish_date, id_category, stock) values ('528504439-1', 'Casanova''s Big Night', '2004-03-15', 'CT01', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('691842149-2', 'Coelacanth: The Fish That Time Forgot', '1978-01-03', 'CT03', 4);
insert into book (isbn, title, publish_date, id_category, stock) values ('659417370-7', 'Cialo', '1994-11-28', 'CT02', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('066926244-7', 'Kiki', '1981-08-07', 'CT08', 5);
insert into book (isbn, title, publish_date, id_category, stock) values ('116957959-0', 'Betty Blue (37°2 le matin)', '2009-01-10', 'CT10', 20);
insert into book (isbn, title, publish_date, id_category, stock) values ('977802977-6', 'Think Fast, Mr. Moto', '1992-12-29', 'CT06', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('326291267-0', 'The Shadow of the Eagle', '1959-02-19', 'CT05', 19);
insert into book (isbn, title, publish_date, id_category, stock) values ('244834717-4', 'Go Now', '2002-07-21', 'CT10', 4);
insert into book (isbn, title, publish_date, id_category, stock) values ('215435346-0', 'Santa''s Pocket Watch', '1944-08-31', 'CT01', 15);
insert into book (isbn, title, publish_date, id_category, stock) values ('310049592-6', 'Sleep Dealer', '1962-11-16', 'CT04', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('799284052-6', 'Romeo and Juliet', '1946-06-26', 'CT02', 6);
insert into book (isbn, title, publish_date, id_category, stock) values ('650222559-4', 'Ewok Adventure, The (a.k.a. Caravan of Courage: An Ewok Adventure)', '1989-08-31', 'CT06', 11);
insert into book (isbn, title, publish_date, id_category, stock) values ('543143563-9', 'Dreamer: Inspired by a True Story', '2022-04-02', 'CT02', 11);
insert into book (isbn, title, publish_date, id_category, stock) values ('193370373-3', 'Bad Milo (Bad Milo!)', '2013-02-04', 'CT07', 20);
insert into book (isbn, title, publish_date, id_category, stock) values ('220744334-5', 'Carts of Darkness', '2016-01-24', 'CT04', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('522393769-4', '11:14', '1947-11-03', 'CT02', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('130435796-1', 'Dom Hemingway', '1980-02-17', 'CT07', 6);
insert into book (isbn, title, publish_date, id_category, stock) values ('550752911-6', 'American Ninja 5', '1963-10-08', 'CT07', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('191733267-X', 'Rage of Angels', '2006-04-30', 'CT02', 1);
insert into book (isbn, title, publish_date, id_category, stock) values ('387368942-1', 'Roadracers', '1947-04-15', 'CT01', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('100464415-9', 'Volcano High (Whasango)', '1937-10-30', 'CT01', 22);
insert into book (isbn, title, publish_date, id_category, stock) values ('931174415-8', 'Motorama', '1953-08-31', 'CT09', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('267315523-6', 'Women of the Night (Yoru no onnatachi)', '1937-10-22', 'CT07', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('254451252-0', 'Into the Mind', '1938-08-12', 'CT02', 17);
insert into book (isbn, title, publish_date, id_category, stock) values ('879005812-7', '3 Penny Opera, The (Threepenny Opera, The) (3 Groschen-Oper, Die)', '2017-11-03', 'CT05', 16);
insert into book (isbn, title, publish_date, id_category, stock) values ('277730680-X', 'Swastika', '1933-02-22', 'CT09', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('063454872-7', 'Small Town in Texas, A', '2001-09-09', 'CT05', 21);
insert into book (isbn, title, publish_date, id_category, stock) values ('202303620-8', 'Veronica Guerin', '1938-11-15', 'CT03', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('944856016-8', 'Pledge This!', '1951-10-06', 'CT01', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('477895406-8', 'Black Eagle', '1968-08-16', 'CT07', 18);
insert into book (isbn, title, publish_date, id_category, stock) values ('104988711-5', 'Five, The (Gonin)', '2007-01-09', 'CT05', 1);
insert into book (isbn, title, publish_date, id_category, stock) values ('900196650-0', 'Who''s Afraid of Virginia Woolf?', '1988-03-04', 'CT05', 14);
insert into book (isbn, title, publish_date, id_category, stock) values ('247661652-4', 'Empire', '1932-08-02', 'CT01', 13);
insert into book (isbn, title, publish_date, id_category, stock) values ('794423595-2', 'Hangover Part II, The', '1978-08-09', 'CT06', 2);
insert into book (isbn, title, publish_date, id_category, stock) values ('681472620-3', 'Amazonia', '1971-05-30', 'CT01', 13);
insert into book (isbn, title, publish_date, id_category, stock) values ('053347243-1', 'Tis kakomoiras', '1973-02-28', 'CT03', 24);
insert into book (isbn, title, publish_date, id_category, stock) values ('288381178-4', 'Lady Jane', '2004-04-08', 'CT08', 15);
insert into book (isbn, title, publish_date, id_category, stock) values ('216816069-4', 'Desire: The Vampire', '1938-08-01', 'CT01', 5);
insert into book (isbn, title, publish_date, id_category, stock) values ('321803967-3', 'In Vanda''s Room (No Quarto da Vanda)', '1963-01-30', 'CT08', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('916032056-7', 'Perez.', '1968-09-28', 'CT08', 5);
insert into book (isbn, title, publish_date, id_category, stock) values ('106020638-2', 'Pornorama', '1961-09-23', 'CT04', 25);
insert into book (isbn, title, publish_date, id_category, stock) values ('664586256-3', 'Appaloosa, The', '1940-01-07', 'CT05', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('648922396-1', 'Seraphim Falls', '1966-03-03', 'CT10', 9);
insert into book (isbn, title, publish_date, id_category, stock) values ('876405482-9', 'Ann Carver''s Profession', '1939-04-27', 'CT08', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('039659518-9', 'Hellraiser: Deader', '2017-09-26', 'CT10', 3);
insert into book (isbn, title, publish_date, id_category, stock) values ('613325330-4', 'Scooby-Doo! Camp Scare', '1976-10-14', 'CT10', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('523291737-4', 'Ides of March, The', '1992-01-23', 'CT07', 16);
insert into book (isbn, title, publish_date, id_category, stock) values ('332085000-8', 'AKA', '1991-12-14', 'CT02', 6);
insert into book (isbn, title, publish_date, id_category, stock) values ('209956695-X', 'Natural Born Killers', '2015-09-27', 'CT02', 2);
insert into book (isbn, title, publish_date, id_category, stock) values ('413523163-2', 'Stoker', '2001-04-21', 'CT02', 11);
insert into book (isbn, title, publish_date, id_category, stock) values ('885129529-8', 'Knockaround Guys', '1944-04-25', 'CT10', 9);
insert into book (isbn, title, publish_date, id_category, stock) values ('587692818-6', 'Funny Lady', '1948-11-29', 'CT01', 5);
insert into book (isbn, title, publish_date, id_category, stock) values ('993657792-2', 'Fever', '1934-07-19', 'CT10', 19);
insert into book (isbn, title, publish_date, id_category, stock) values ('381155629-0', 'Sweet Nothing', '1960-04-25', 'CT03', 18);
insert into book (isbn, title, publish_date, id_category, stock) values ('492818768-7', 'Shall We Dance', '1946-02-20', 'CT05', 18);
insert into book (isbn, title, publish_date, id_category, stock) values ('390268975-7', 'Answers to Nothing', '1957-12-29', 'CT04', 6);
insert into book (isbn, title, publish_date, id_category, stock) values ('810577702-9', 'Saints and Soldiers: The Void', '2011-08-13', 'CT10', 8);
insert into book (isbn, title, publish_date, id_category, stock) values ('230719674-9', 'Sorority Row', '1947-06-25', 'CT07', 22);
insert into book (isbn, title, publish_date, id_category, stock) values ('132231469-1', 'Informant', '1992-07-13', 'CT02', 19);
insert into book (isbn, title, publish_date, id_category, stock) values ('289351818-4', 'August (Elokuu) ', '2007-11-01', 'CT06', 12);
insert into book (isbn, title, publish_date, id_category, stock) values ('063393385-6', 'Rocky V', '1984-06-13', 'CT05', 10);
insert into book (isbn, title, publish_date, id_category, stock) values ('130637951-2', 'Twins', '1999-07-23', 'CT06', 16);