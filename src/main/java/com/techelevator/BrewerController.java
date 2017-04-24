package com.techelevator;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.Beer;
import com.techelevator.model.BeerDAO;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.Image;
import com.techelevator.model.ImageDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;
import com.techelevator.security.PasswordEncoder;

@Transactional
@SessionAttributes("username")
@Controller
public class BrewerController {

	private BreweryDAO breweryDAO;
	private UserDAO userDAO; 
	private BeerDAO beerDAO;
	private ImageDAO imageDAO;
	
	@Autowired
	public BrewerController(BreweryDAO breweryDAO, UserDAO userDAO, BeerDAO beerDAO, ImageDAO imageDAO) {
		this.userDAO = userDAO;
		this.breweryDAO = breweryDAO;
		this.beerDAO = beerDAO;
		this.imageDAO = imageDAO;
	}
	
	@RequestMapping("/updateConfirmation")
	 public String displayUpdateConfirmationPage(){
		return "updateConfirmation";
	}
	
	@RequestMapping("/myBrewery") 
	public String displayBrewInfoPage(ModelMap model, HttpServletRequest request, @RequestParam String username) {
		Brewery brewery = breweryDAO.getBreweryFromUser(username);
		
		brewery.setUserName(username);
		model.addAttribute("username",username);
		model.addAttribute("brewery", brewery);
		Boolean doesExist = false;
		if(brewery.getName()!=null){
			doesExist = true;
			}
		
		model.addAttribute("doesExist", doesExist);
		
		
		return "myBrewery";
	}
	
	@RequestMapping(path={"/myBrewery"}, method = RequestMethod.POST)
		public String updateOrCreateBreweryInfo(HttpServletRequest request, Brewery theBrewery, User user, ModelMap model){
			String username = (String)model.get("username");
			Boolean doesExist = (Boolean)model.get("doesExist");
			Brewery userBrewery = (Brewery)model.get("brewery");
			
			if(user.getPassword()!=null){
				user.setUserFromBrewery(theBrewery);
				userDAO.save(user);
				theBrewery.setUserName(user.getUsername());
				breweryDAO.createNewBrewery(theBrewery);
			}else if(doesExist == true){
				theBrewery.setBreweryId(userBrewery.getBreweryId());
				breweryDAO.updateBreweryInfo(theBrewery);
			}else{
				theBrewery.setUserName(username);
				breweryDAO.createNewBrewery(theBrewery);
			}
			
				return "redirect:/updateConfirmation";					
		}

		
	@RequestMapping(path={"/controlPanel"}, method = RequestMethod.GET)
		public String viewBreweryControlPanel(HttpServletRequest request, @RequestParam String username){
			String logo = null;
			List<Image> beerImages = null;
			Brewery brewery =  breweryDAO.getBreweryFromUser(username);
			if(brewery.getName() != null){
				logo = imageDAO.getImage(0, brewery.getBreweryId(), 1);
				beerImages = imageDAO.getAllBreweryBeerPhotos(brewery.getBreweryId());
			}
			request.setAttribute("beer", beerDAO.getBeersByUsername(username));
			request.setAttribute("brewery", brewery);
			request.setAttribute("username", username);
			request.setAttribute("logo", logo);
			request.setAttribute("beerImages",beerImages);
		return "controlPanel";			
	}
	
	
	@RequestMapping(path={"/controlPanel"}, method = RequestMethod.POST)
		public String displayControlPanel(final RedirectAttributes redirectAttributes, HttpServletRequest request, String button, Long beerId, Brewery brewery, String username){
			
			if (button.equals("delete")){
				Beer beer = beerDAO.getBeerById(beerId);
				String publicId = beer.getImg();
				imageDAO.deleteImage(publicId);
				beerDAO.deleteBeer(beerId);
			} if (button.equals("update")){
				Brewery checkBrewery = breweryDAO.getBreweryFromUser(username);
					if(checkBrewery.getName()==null){
						brewery.setUserName(username);
						breweryDAO.createNewBrewery(brewery);
					}else{
						breweryDAO.updateBreweryInfo(brewery);
					}
					
			}
			return "redirect:/controlPanel?username=" + username;
	}
	
	@RequestMapping(path={"/addBeer"}, method = RequestMethod.POST)
	public String addBeer(@RequestParam("phototype") int type, MultipartFile file, String username, Beer beer){
		System.out.println(beer.getBreweryId()+" "+beer.getName()+" "+beer.getDescription()+" "+beer.getType()+" "+beer.getAbv());
		beerDAO.addBeer(beer);
		Beer newBeer = beerDAO.getBeerByName(beer.getBreweryId(), beer.getName());
		Long beerId = newBeer.getBeerId();
		Long breweryId = newBeer.getBreweryId();
		String url = imageDAO.uploadInsertImage(file, beerId,breweryId, type);
		newBeer.setImg(url);
		beerDAO.addBeer(newBeer);
		beerDAO.deleteBeer(newBeer.getBeerId());
		
		return "redirect:/controlPanel?username="+username;
	}
	
	
}
