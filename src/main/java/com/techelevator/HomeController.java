package com.techelevator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.techelevator.model.BreweryDAO;

@Controller
public class HomeController {
	
	private BreweryDAO breweryDAO;
	
	@Autowired
	public HomeController (BreweryDAO breweryDAO) {
		this.breweryDAO = breweryDAO;
	}

	@RequestMapping("/")
	public String displayHome(Model model) {
		model.addAttribute("breweries", breweryDAO.getAllBreweries());
		return "breweries";
	}

}