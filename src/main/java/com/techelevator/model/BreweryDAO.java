package com.techelevator.model;

import java.util.List;

import org.springframework.security.core.userdetails.User;

public interface BreweryDAO {
	
	public List<Brewery> getAllBreweries();
	public Brewery getBreweryById(Long breweryId);
	public Brewery getBreweryFromUser(String username);
	public void createNewBrewery(Brewery userBrewery);
	public void updateBreweryInfo(Brewery userBrewery);
	
}
