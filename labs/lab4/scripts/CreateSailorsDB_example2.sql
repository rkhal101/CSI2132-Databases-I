CREATE SCHEMA sailors;

SET search_path = "sailors";

CREATE TABLE sailors
	(sid integer NOT NULL,
	sname character varying(20),
	age integer,
	rating character varying(20),
	CONSTRAINT sailors_pkey PRIMARY KEY (sid),
	CONSTRAINT sailors_rating CHECK (rating IN ('good','fair','poor'))
	);


CREATE TABLE boats
	(bid integer NOT NULL,
	color character varying(20),
	CONSTRAINT boats_pkey PRIMARY KEY (bid)
	);


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

INSERT INTO sailors VALUES (1,'Salvador',26,'good');	
INSERT INTO sailors VALUES (2,'Rafael',28,'good');	
INSERT INTO sailors VALUES (3,'John',10,'good');	
INSERT INTO sailors VALUES (4,'Bruce',18,'fair');	
INSERT INTO sailors VALUES (5,'James',17,'fair');	
INSERT INTO sailors VALUES (6,'Smith',18,'poor');	
INSERT INTO sailors VALUES (7,'Peter',22,'poor');	


INSERT INTO boats VALUES (1,'red');
INSERT INTO boats VALUES (2,'green');
INSERT INTO boats VALUES (3,'blue');


INSERT INTO reserves VALUES (1,1);
INSERT INTO reserves VALUES (1,2);
INSERT INTO reserves VALUES (2,1);
INSERT INTO reserves VALUES (7,1);
INSERT INTO reserves VALUES (7,2);
INSERT INTO reserves VALUES (7,3);
INSERT INTO reserves VALUES (4,1);
INSERT INTO reserves VALUES (3,3);

