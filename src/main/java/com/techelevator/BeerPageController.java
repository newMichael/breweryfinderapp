package com.techelevator;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerDAO;
import com.techelevator.model.Review;
import com.techelevator.model.ReviewDAO;

@Controller
@Transactional
public class BeerPageController {
	
	private BeerDAO beerDAO;
	private ReviewDAO reviewDAO;
	
	@Autowired
	public BeerPageController (BeerDAO beerDAO, ReviewDAO reviewDAO) {
		this.beerDAO = beerDAO;
		this.reviewDAO = reviewDAO;
	}
	
	@RequestMapping(path={"/beerPage"}, method=RequestMethod.GET)
	public String displayBeerPage(HttpServletRequest request, Long beerId) {
		Beer beer = beerDAO.getBeerById(beerId);
		request.setAttribute("beer", beer);
		request.setAttribute("reviewList", reviewDAO.getBeerReviews(beerId));
		request.setAttribute("averageRating", reviewDAO.getAverageRatingFromBeerId(beerId));
		
		return "/beerPage";
	}
	@RequestMapping(path={"/reviewError"}, method=RequestMethod.GET)
		String displayErrorPage(){
		return "reviewError";
	}
	
	@RequestMapping(path={"/reviewConfirm"}, method=RequestMethod.GET)
		String displayReviewConfirmation(){
		return "reviewConfirm";
	}
	
	@RequestMapping(path={"/beerPage"}, method=RequestMethod.POST)
	public String postBeerReview(final RedirectAttributes redirectAttributes, HttpServletRequest request, Review theReview) {
		String ipAddress = request.getRemoteAddr();
		theReview.setIpAddress(ipAddress);
		Boolean doesExist = reviewDAO.reviewValidation(theReview);
			
//		if(doesExist ==false){
			reviewDAO.saveReview(theReview);
			redirectAttributes.addFlashAttribute("message", "Review Submitted");
			redirectAttributes.addFlashAttribute("beerId", theReview.getBeerId());
			beerDAO.updateAverageBeerRating(reviewDAO.getAverageRatingFromBeerId(theReview.getBeerId()), theReview.getBeerId());
			return "redirect:/reviewConfirm";
//		}else{
//			redirectAttributes.addFlashAttribute("message", "Rating Already Exists, please choose another beer.");
//			redirectAttributes.addFlashAttribute("beerId", theReview.getBeerId());
//			return "redirect:/reviewError";
//		}
		
		
	}
	
	private static String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }

        return remoteAddr;
    }
	
	
}