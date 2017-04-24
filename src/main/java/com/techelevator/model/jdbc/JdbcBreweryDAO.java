package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDAO;

@Component
public class JdbcBreweryDAO implements BreweryDAO {
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcBreweryDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Brewery> getAllBreweries() {
		List<Brewery> breweries = new ArrayList<>();
		String sqlSelectBreweries = "SELECT * FROM breweries";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBreweries);
		while (results.next()) {
			breweries.add(mapRowToBrewery(results));
		}
		return breweries;
	}
	
	
	@Override
	public Brewery getBreweryById(Long breweryId) {
		Brewery brewery = new Brewery();
		String sqlSelectBrewery = "SELECT * FROM breweries WHERE brewery_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectBrewery, breweryId);
		if(results.next()) {
			return mapRowToBrewery(results);
		}
		return brewery;
	}
	
	@Override
	public Brewery getBreweryFromUser(String username) {
		Brewery brewery = new Brewery();
		String sqlStatement = "SELECT * FROM breweries  WHERE username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlStatement, username);
		if(results.next()){
			brewery = mapRowToBrewery(results);
		}
		
		return brewery;
	}
	@Override
	public void updateBreweryInfo(Brewery userBrewery){
		String sqlStatement = "UPDATE breweries "
								+ "SET breweryname = ?, "
								+ "address = ?, "
								+ "description = ?, "
								+ "foundedyear = ?, "
								+ "contactemail = ?, "
								+ "brewerynumber = ?, "
								+ "contactfirstname = ?, "
								+ "contactlastname = ?, "
								+ "website = ? "
								+ "WHERE brewery_id = ?";
		jdbcTemplate.update(sqlStatement, userBrewery.getName(), userBrewery.getAddress(),
							userBrewery.getDescription(), userBrewery.getFoundedYear(),
							userBrewery.getEmail(), userBrewery.getBreweryNumber(),
							userBrewery.getContactFirstName(), userBrewery.getContactLastName(),
							userBrewery.getWebsite(), userBrewery.getBreweryId());
	}
	@Override
	public void createNewBrewery(Brewery userBrewery){
		String sqlStatement = "INSERT INTO breweries(breweryname, address, description,foundedyear,contactemail,"
								+ "brewerynumber,contactfirstname,contactlastname,website,username) "
								+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sqlStatement, userBrewery.getName(), userBrewery.getAddress(),
							userBrewery.getDescription(), userBrewery.getFoundedYear(),
							userBrewery.getEmail(), userBrewery.getBreweryNumber(),
							userBrewery.getContactFirstName(), userBrewery.getContactLastName(),
							userBrewery.getWebsite(), userBrewery.getUserName());
	
	}
	private Brewery mapRowToBrewery(SqlRowSet row) {
		Brewery brewery = new Brewery();
		brewery.setBreweryId(row.getLong("brewery_id"));
		brewery.setName(row.getString("breweryname"));
		brewery.setAddress(row.getString("address"));
		brewery.setDescription(row.getString("description"));
		brewery.setFoundedYear(row.getString("foundedyear"));
		brewery.setUserName(row.getString("username"));
		brewery.setEmail(row.getString("contactemail"));
		brewery.setBreweryNumber(row.getString("brewerynumber"));
		brewery.setContactFirstName(row.getString("contactfirstname"));
		brewery.setContactLastName(row.getString("contactlastname"));
		brewery.setWebsite(row.getString("website"));
		brewery.setImg(row.getString("public_id"));
	
		return brewery;
	}
	



}
