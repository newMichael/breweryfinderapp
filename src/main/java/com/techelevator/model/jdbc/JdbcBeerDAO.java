package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerDAO;

@Component
public class JdbcBeerDAO implements BeerDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcBeerDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Beer> getBeerOptionsByBrewery(Long breweryId) {
		List<Beer> beerFromBrewery = new ArrayList<>();
		String sqlSelectBeer = "SELECT * FROM beers JOIN breweries ON beers.brewery_id = breweries.brewery_id"
								+" WHERE breweries.brewery_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBeer, breweryId);
		while (results.next()) {
			beerFromBrewery.add(mapRowToBeer(results));
		}
		return beerFromBrewery;
	}
	
	
	
	@Override
	public Beer getBeerById(Long beerId) {
		Beer beer = new Beer();
		String sqlBeer = "SELECT * FROM beers WHERE beer_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlBeer, beerId);
		while(results.next()) {
			beer = mapRowToBeer(results);
		}
		return beer;
	}
	
	@Override 
	public Beer getBeerByName(Long breweryId, String name){
		Beer beer = new Beer();
		String sqlBeer = "SELECT * FROM beers WHERE brewery_id = ? AND name = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlBeer,breweryId, name);
		if(results.next()){
			beer = mapRowToBeer(results);
		}
		return beer;
	}
	
	@Override
	public List<Beer> getBeersByUsername(String username) {
		List<Beer> beerFromUsername = new ArrayList<>();
		String sqlBeerFromUser = "SELECT * FROM beers JOIN breweries ON beers.brewery_id = breweries.brewery_id"
				+" WHERE breweries.username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlBeerFromUser, username);
		while(results.next()) {
			beerFromUsername.add(mapRowToBeer(results));
		}
		return beerFromUsername;
	}
	
	public void deleteBeer(Long beerId) {
		String sqlDeleteBeerReviews = "DELETE FROM reviews WHERE beer_id = ?";
		jdbcTemplate.update(sqlDeleteBeerReviews, beerId);
		
		String sqlDeleteBeer = "DELETE FROM beers WHERE beer_id = ?";
		jdbcTemplate.update(sqlDeleteBeer, beerId);
		
		String sqlDeleteImage = "DELETE FROM images WHERE beer_id = ?";
		jdbcTemplate.update(sqlDeleteImage, beerId);
		
	}
	
	public void addBeer(Beer beer) {
		String sqlAddBeer = "INSERT INTO beers(brewery_id, description, name, type, rating, abv, public_id) VALUES(?, ?, ?, ?, ?, ?,?)";
		jdbcTemplate.update(sqlAddBeer, beer.getBreweryId(), beer.getDescription(), beer.getName(), beer.getType(), 0, beer.getAbv(), beer.getImg());
	}
	
	public void updateAverageBeerRating(double averageRating, Long beerId) {
		String sqlUpdateRating = "UPDATE beers SET rating = ? WHERE beer_id = ?";
		jdbcTemplate.update(sqlUpdateRating, averageRating, beerId);
	}
	
	private Beer mapRowToBeer(SqlRowSet row) {
		Beer beer = new Beer();
		beer.setBeerId(row.getLong("beer_id"));
		beer.setBreweryId(row.getLong("brewery_id"));
		beer.setDescription(row.getString("description"));
		beer.setName(row.getString("name"));
		beer.setType(row.getString("type"));
		beer.setRating(row.getDouble("rating"));
		beer.setAbv(row.getDouble("abv"));
		beer.setImg(row.getString("public_id"));
		return beer;
	}

}
