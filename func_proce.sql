
-- matinee price adjuctment function



CREATE OR REPLACE PROCEDURE insertCustomer(
	fName varchar, 
	lName varchar,
	eMail varchar,
	billingInfo varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO customer(
		first_name,
		last_name,
		email,
		billing_info
	)VALUES(
		fName,
		lName,
		eMail,
		billingInfo
	);
	COMMIT;
END;
$$

SELECT *
FROM customer;

CALL insertCustomer('bob', 'dylan', 'bd@musicbd.com','6565-6565-6565-6565');

CREATE OR REPLACE PROCEDURE insertMovie(
	title_ varchar,
	description_ varchar,
	length_s varchar,
	rating_ varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO movie(
		title,
		description,
		length_,
		rating 
	)VALUES(
		title_,
		description_,
		length_s,
		rating_
	);
	COMMIT;
END;
$$

SELECT *
FROM movie;

CALL insertMovie('lock block and 2 smoking barrels', '3 movies in 1', '115mins','NC-17');





--- function

CREATE OR REPLACE FUNCTION noonPrice (
	noonId integer,
	newPrice float
)
RETURNS integer
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE ticket
	SET price = newPrice 
	WHERE ticket_id = noonID;
	RETURN noonId;
END;
$$

SELECT noonPrice(1, 18.00);


SELECT *
FROM ticket
WHERE ticket_id = (SELECT noonPrice(1, 12.00));





