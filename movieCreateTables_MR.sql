DROP TABLE IF EXISTS customer Cascade;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name varchar(50),
	last_name varchar(50),
	email varchar (150),
	billing_info varchar(225)
);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	billing_info 
)Values(
	'bruce',
	'lee',
	'brucelee@bestfigher.com',
	'4242-4242-4242-4242'
);

DROP TABLE IF EXISTS payment Cascade;
CREATE TABLE payment(
	payment_id SERIAL PRIMARY KEY,
	customer_id integer,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	amount integer
);

INSERT INTO payment(
	customer_id 
)VALUES(
	1
); 

DROP TABLE IF EXISTS concession Cascade;
CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	payment_id integer,
	FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
	concession_product_id integer,
	FOREIGN KEY (concession_product_id) REFERENCES concession_product(concession_product_id),
	orders integer
);

INSERT INTO concession(
	concession_id,
	payment_id,
	concession_product_id,
	orders
)VALUES(
	1,
	1,
	1,
	1
);

DROP TABLE IF EXISTS concession_product Cascade;	
CREATE TABLE concession_product(
	concession_product_id SERIAL PRIMARY KEY,
	inventory integer,
	price float
);

INSERT INTO concession_product(
	concession_product_id,
	inventory,
	price
)VALUES(
	1,
	1,
	6.50
),(
	2,
	2,
	7.00
);

DROP TABLE IF EXISTS ticket Cascade;
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	payment_id integer NOT NULL,
	FOREIGN KEY (payment_id) REFERENCES payment(payment_id),
	screen_rm_id integer,
	FOREIGN KEY (screen_rm_id) REFERENCES screen_rm(screen_rm_id),
	movie_id integer,
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
	price float 	
);

INSERT INTO ticket(
	payment_id,
	screen_rm_id,
	movie_id,
	price 
)VALUES(

	1,
	1,
	1,
	1
),(

	2,
	2,
	2,
	2
);

DROP TABLE IF EXISTS screen_rm Cascade;
CREATE TABLE screen_rm(
	screen_rm_id SERIAL PRIMARY KEY,
	screen_time_id integer,
	FOREIGN KEY (screen_time_id) REFERENCES screen_time(screen_time_id),
	movie_id varchar(255)
);

INSERT INTO screen_rm(
	screen_rm_id,
	screen_time_id,
	movie_id
)VALUES(
	1,
	1,
	1
);

DROP TABLE IF EXISTS screen_time Cascade;
CREATE TABLE screen_time(
	screen_time_id SERIAL PRIMARY KEY,
	movie_id integer,
	FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

INSERT INTO screen_time(
	movie_id
)VALUES(
	1
);



DROP TABLE IF EXISTS movie Cascade;
CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	title varchar (255),
	description varchar (255),
	length_ varchar(50),
	rating varchar(20)
);

INSERT INTO movie(
	title,
	description,
	length_,
	rating
)VALUES(
	'Grandmas Boy',
	'software engineer lives becomes roommates with his grandma',
	'90mins',
	'R'
	
);


