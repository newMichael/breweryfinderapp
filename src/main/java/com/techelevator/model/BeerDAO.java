package com.techelevator.model;

import java.util.List;

public interface BeerDAO {

	List<Beer> getBeerOptionsByBrewery(Long breweryId);

	Beer getBeerById(Long beerId);
	
	List<Beer> getBeersByUsername(String username);

	void deleteBeer(Long beerId);
	
	public void updateAverageBeerRating(double averageRating, Long beerId);

	void addBeer(Beer beer);

	public Beer getBeerByName(Long breweryId, String name);

}
