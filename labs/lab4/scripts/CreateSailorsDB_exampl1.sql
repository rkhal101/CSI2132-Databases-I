
--Drop schema if it exists (avoids errors when the next query is executed)
DROP SCHEMA IF EXISTS sailors_example1 CASCADE;

--Create schema
CREATE SCHEMA sailors_example1;

--Set schema search path for the session
SET search_path = 'sailors_example1';

--Create sailors table
CREATE TABLE sailors
	(sid integer NOT NULL,
	sname character varying(20),
	CONSTRAINT sailors_pkey PRIMARY KEY (sid)
	);
	
--Create boats table
CREATE TABLE boats
	(bid integer NOT NULL,
	color character varying(20),
	CONSTRAINT boats_pkey PRIMARY KEY (bid)
	);
	
--Create reserves table
CREATE TABLE reserves
	(sid integer NOT NULL,
	bid integer NOT NULL,
	CONSTRAINT reserves_pkey PRIMARY KEY (sid,bid),
	CONSTRAINT reserves_sailors_fkey FOREIGN KEY (sid)
		REFERENCES sailors (sid)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT reserves_boats_fkey FOREIGN KEY (bid)
		REFERENCES boats (bid)
		ON UPDATE CASCADE ON DELETE CASCADE
	);	


--Insert values into sailors table
INSERT INTO sailors VALUES (1,'Salvador');	
INSERT INTO sailors VALUES (2,'Rafael');	

--Insert values into boats table
INSERT INTO boats VALUES (1,'red');
INSERT INTO boats VALUES (2,'green');

--Insert values into reserves table
INSERT INTO reserves VALUES (1,1);
INSERT INTO reserves VALUES (1,2);
INSERT INTO reserves VALUES (2,1);



