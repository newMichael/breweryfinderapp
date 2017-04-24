INSERT INTO users(username, password, role)
VALUES('testUser','testPassword', 'brewer');

INSERT INTO breweries(user_id, name, address, description, founded_year)
VALUES('1', 'testBrewery','1234 Address','exlkjasdlfkjas;ldfkja;sldkfjas;lkdfjas;lkfdjasdl;fkjdfsalsdfasldkfj','1990');

INSERT INTO beers(brewery_id, name, type, description)
VALUES('1', 'Pattys Pilsner', 'pislner', 'very green, very mean');

