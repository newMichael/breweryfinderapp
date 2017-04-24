package com.techelevator.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Beer;
import com.techelevator.model.Review;
import com.techelevator.model.ReviewDAO;

@Component
public class JdbcReviewDAO implements ReviewDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JdbcReviewDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public void saveReview(Review review) {
		String reviewSQL = "INSERT INTO reviews (beer_id, star_rating, description, ip_address) VALUES (?, ?, ?, ?)";
		jdbcTemplate.update(reviewSQL, review.getBeerId(), review.getStarRating(),
				review.getDescription(), review.getIpAddress());
	}
	@Override
	public Boolean reviewValidation(Review review){
		Review reviewCheck = new Review();
		String reviewSQL = "SELECT * FROM reviews WHERE ip_address = ? AND beer_id =?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(reviewSQL, review.getIpAddress(), review.getBeerId());
		while(result.next()){
			reviewCheck.setBeerId(result.getLong("beer_id"));
		}
			
		if(reviewCheck.getBeerId()==null){
			return false;
		} else{
			return true;
		}
	}
	
	@Override
	public List<Review> getBeerReviews(Long beerId){
		List<Review> reviewList = new ArrayList<Review>();
		String sqlQuery = "SELECT * FROM reviews WHERE beer_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, beerId);
		while(results.next()){
			Review review = mapRowToReview(results);
			reviewList.add(review);
		}
		return reviewList;
	}
	
	@Override
	public double getAverageRatingFromBeerId(Long beerId) {
		String sqlQuery = "SELECT avg(star_rating) FROM reviews WHERE beer_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlQuery, beerId);
		double average = 0;
		if(result.next()) {
			average = retrieveAverageReview(result);
		}
		return average;
	}
	
	private Review mapRowToReview(SqlRowSet row) {
		Review review = new Review();
		review.setBeerId(row.getLong("beer_id"));
		review.setStarRating(row.getLong("star_rating"));
		review.setDescription(row.getString("description"));
		review.setIpAddress(row.getString("ip_address"));
		review.setReviewId(row.getLong("review_id"));
		return review;
	}
	
	private double retrieveAverageReview(SqlRowSet row) {
		double average = row.getDouble("avg");
		return average;
	}

}
