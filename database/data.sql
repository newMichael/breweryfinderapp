-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO users(username, password, enabled, pending, email, firstname, lastname, breweryname, breweryphone)
VALUES('sparky123','746b44d6634f18863121b9b67daf1925b2e7b429ed05fd645c8e7b68573a343514df186f095a5e84',
true, false, 'sparky123@aol.com', 'Sparky', 'Dog','Sparky Dog Brewing Co','12345689');
INSERT INTO users(username, password, enabled, pending, email, firstname, lastname, breweryname, breweryphone)
VALUES('jellybean','746b44d6634f18863121b9b67daf1925b2e7b429ed05fd645c8e7b68573a343514df186f095a5e84',
true, false, 'jelly@gmail.com', 'Jelly', 'Bean','Midnight Meteor Brewing Co.','2169582743');
INSERT INTO users(username, password, enabled, pending, email, firstname, lastname, breweryname, breweryphone)
VALUES('paddy','746b44d6634f18863121b9b67daf1925b2e7b429ed05fd645c8e7b68573a343514df186f095a5e84',
true, false, 'paddy@aol.com', 'Paddy', 'Paddington','Planet Paddys','3309821234');
INSERT INTO users(username, password, enabled, pending, email, firstname, lastname, breweryname, breweryphone)
VALUES('shorty','746b44d6634f18863121b9b67daf1925b2e7b429ed05fd645c8e7b68573a343514df186f095a5e84',
true, false, 'shorty@gmail.com', 'Shorty', 'Hamilton','Short Shorts Brewing','4401265344');
INSERT INTO users(username, password, enabled, pending, email, firstname, lastname, breweryname, breweryphone)
VALUES('testAdmin','0acf370ecd8d66fbac4b0ecb8f43fa939af95ae2033e01cdeedef6491598f31dfc2b506fe49063c3',
true, false, 'admin@belch.com', 'Barry', 'Manilow', 'Sparky Dog Brewing Co', '12345689');

INSERT INTO images(public_id,type,brewery_id)
VALUES('dfdjo5oxjl3i0pabg3vo','1','1');
INSERT INTO images(public_id,type,brewery_id)
VALUES('hcn57rgqjo1afpy0hdwi','1','2');
INSERT INTO images(public_id,type,brewery_id)
VALUES('t8ddkfx8rreqfxqjc1wx','1','3');
INSERT INTO images(public_id,type,brewery_id)
VALUES('szymv1rdqurxf4tt4k1j','1','4');

INSERT INTO breweries (breweryname, address, description, foundedyear, username, brewerynumber, contactfirstname, contactlastname, contactemail, website, public_id) 
VALUES('Sparky Dog Brewing Co', '5231 Main St', 'Sparky Dog Brewing Co is the first and most magical brewery in Cleveland.  It only exists if you believe in it.', 1812, 'sparky123', '123456789', 'Sparky', 'Dog', 'sparky123@aol.com', 'www.test.com', 'b2j8i2cnqbxrzmnwirq4');
INSERT INTO breweries (breweryname, address, description, foundedyear, username, brewerynumber, contactfirstname, contactlastname, contactemail, website, public_id) 
VALUES('Midnight Meteor Brewing Co.', '7345 Euclid Ave', 'Midnight Meteor Brewing Co was built over a crater that hit Cleveland in 1974.  Rumor has it their beer is brewed with space rocks.', 1974, 'jellybean', '123456789', 'Jelly', 'Bean', 'jelly@gmail.com','www.test.com', 'hcn57rgqjo1afpy0hdwi');
INSERT INTO breweries (breweryname, address, description, foundedyear, username, brewerynumber, contactfirstname, contactlastname, contactemail, website, public_id)
VALUES('Planet Paddys', '1234 Awesum St', 'Planet Paddys is the second space themed brewery in Cleveland.  It is the most low class brewery in the entire world.', 2010, 'paddy', '123456789', 'Sparky', 'Dog', 'sparky123@aol.com','www.test.com', 't8ddkfx8rreqfxqjc1wx');
INSERT INTO breweries (breweryname, address, description, foundedyear, username, brewerynumber, contactfirstname, contactlastname, contactemail, website, public_id) 
VALUES('Short Shorts Brewing', '9083 Pants Way', 'We only serve beer in short mugs here.  Discounts for those who wear short shorts and for those under 5 foot 2 inches.', 2017, 'shorty', '123456789', 'Sparky', 'Dog', 'sparky123@aol.com','www.test.com', 'szymv1rdqurxf4tt4k1j');

INSERT INTO beers(brewery_id, description, name, type, rating, abv, public_id)
VALUES ('1','Very green, very mean', 'Pattys Pilsner', 'Pilsner', '0', '4.5', 'bjo4qrgcjgidukoc0qlr');
INSERT INTO beers(brewery_id, description, name, type, rating, abv, public_id)
VALUES ('1','Mucho Strong One', 'Pattys Pale-Ale', 'IPA', '0', '5', 'bjo4qrgcjgidukoc0qlr');
INSERT INTO beers(brewery_id, description, name, type, rating, abv, public_id)
VALUES ('1','Dark and dreamy', 'Pattys Stout', 'Stout', '0', '6.2', 'bjo4qrgcjgidukoc0qlr');
INSERT INTO beers(brewery_id, description, name, type, rating, abv, public_id)
VALUES ('1','Dark and peanut-buttery', 'Pattys Porter', 'Porter', '0', '6', 'bjo4qrgcjgidukoc0qlr');

INSERT INTO authorities(username, authority)
VALUES('sparky123','ROLE_USER');
INSERT INTO authorities(username, authority)
VALUES('jellybean','ROLE_USER');
INSERT INTO authorities(username, authority)
VALUES('paddy','ROLE_USER');
INSERT INTO authorities(username, authority)
VALUES('shorty','ROLE_USER');
INSERT INTO authorities (username, authority)
VALUES ('testAdmin', 'ROLE_ADMIN');

COMMIT;