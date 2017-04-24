package com.techelevator.model;

import java.util.List;

public interface ReviewDAO {
	
	public void saveReview(Review review);

	Boolean reviewValidation(Review review);
	List<Review> getBeerReviews(Long beerId);
	public double getAverageRatingFromBeerId(Long beerId);
	
}
