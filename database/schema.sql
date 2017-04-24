-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the database
-- *************************************************************************************************

BEGIN;

CREATE TABLE beers (
	beer_id bigserial NOT NULL,
	brewery_id bigint NOT NULL,
	description text NOT NULL,
	"name" text NOT NULL,
	"type" text NOT NULL,
	rating double precision,
	abv double precision NOT NULL,
	public_id text,
	CONSTRAINT beer_id PRIMARY KEY(beer_id)
);


--Table: Breweries
CREATE TABLE breweries (
	brewery_id bigserial NOT NULL,
	breweryname text NOT NULL,
	address text NOT NULL,
	description text NOT NULL,
	foundedyear text NOT NULL,
	username text NOT NULL,
	brewerynumber text,
	contactfirstname text,
	contactlastname text,
	contactemail text,
	website text,
	public_id text,
	CONSTRAINT brewery_id PRIMARY KEY(brewery_id)
);

CREATE TABLE images (
	image_id bigserial NOT NULL,
	public_id text,
	"type" integer,
	brewery_id bigint,
	beer_id bigint,
	CONSTRAINT image_id PRIMARY KEY(image_id)
);


-- Table: reviews
CREATE TABLE reviews (
	beer_id bigint NOT NULL,
	star_rating bigint NOT NULL,
	description text NOT NULL,
	review_id bigserial NOT NULL,
	ip_address character varying(20),
    CONSTRAINT review_id PRIMARY KEY (review_id)
);

-- Table: username
CREATE TABLE users (
		username character varying(50) NOT NULL,
		password character varying(256) NOT NULL,
		enabled boolean NOT NULL,
		pending boolean NOT NULL,
		email character varying(60) NOT NULL,
		firstname character varying(60) NOT NULL,
		lastname character varying(60) NOT NULL,
		breweryname character varying(60) NOT NULL,
		breweryphone character varying(60) NOT NULL,
		CONSTRAINT username PRIMARY KEY (username)
	);
	

-- Table: authorities
CREATE TABLE authorities (
    username varchar(50)  NOT NULL,
    authority varchar(50) NOT NULL,
	CONSTRAINT fk_authorities_users foreign key(username) references users(username)
);

create unique index ix_auth_username on authorities (username,authority);

-- foreign keys
-- Reference: beers_to_beers (table: reviews)
ALTER TABLE reviews ADD CONSTRAINT beers_to_beers
    FOREIGN KEY (beer_id)
    REFERENCES beers (beer_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: breweries_to_beer (table: beers)
ALTER TABLE beers ADD CONSTRAINT breweries_to_beer
    FOREIGN KEY (brewery_id)
    REFERENCES breweries (brewery_id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;



-- Reference: user_id_to_breweries (table: breweries)
ALTER TABLE breweries ADD CONSTRAINT username_to_breweries
    FOREIGN KEY (username)
    REFERENCES users (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;
COMMIT;