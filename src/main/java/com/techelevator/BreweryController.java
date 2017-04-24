package com.techelevator;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.model.BeerDAO;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.Review;
import com.techelevator.model.ReviewDAO;

@Controller
@Transactional
public class BreweryController {
	
	private BreweryDAO breweryDAO;
	private BeerDAO beerDAO;
	private ReviewDAO reviewDAO;

	@Autowired
	public BreweryController (BreweryDAO breweryDAO, BeerDAO beerDAO, ReviewDAO reviewDAO) {
		this.breweryDAO = breweryDAO;
		this.beerDAO = beerDAO;
		this.reviewDAO = reviewDAO;
	}
	
	@RequestMapping("/breweries") //This is no longer being used; link removed from navbar
	public String displayBreweries(ModelMap model) {
		model.addAttribute("breweries", breweryDAO.getAllBreweries());
		return "breweries";
	}
	
	@RequestMapping("/breweryDetail")
	public String displayBreweryPage(ModelMap model, @RequestParam (value="breweryId")Long breweryId) {
		model.addAttribute("brewery", breweryDAO.getBreweryById(breweryId));
		model.addAttribute("beer", beerDAO.getBeerOptionsByBrewery(breweryId));
		return "breweryDetail";
	}
	
	@RequestMapping("/breweryDetail2")
	public String displayBreweryPage2(ModelMap model, @RequestParam (value="breweryId")Long breweryId) {
		model.addAttribute("brewery", breweryDAO.getBreweryById(breweryId));
		model.addAttribute("beer", beerDAO.getBeerOptionsByBrewery(breweryId));
		return "breweryDetail2";
	}
	
	@RequestMapping("/beerPage")
	public String displayBeerPage(ModelMap model, @RequestParam (value="beerId")Long beerId) {
		model.addAttribute("beerDetail", beerDAO.getBeerById(beerId));
		return "beerPage";
	}
	
}
