package com.techelevator;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.User;
import com.techelevator.model.UserDAO;

	@Controller
	@Transactional
	public class RegistrationController {
		private UserDAO userDao;
		private User user;
		
		@Autowired
		public RegistrationController(UserDAO userDAO) {
			this.userDao = userDAO;
		}

		@RequestMapping("/register")
		public String displayRegistrationPage() {
			return "register";
		}
		
		@RequestMapping("/submittedPage")
			public String displaySubmitPage(){
			return "submittedPage";
		}
		

		@RequestMapping(path = { "/register" }, method = RequestMethod.POST)
		public String addUser(final RedirectAttributes redirectAttributes, User theUser){
			theUser.setIsEnabled(false);
			theUser.setIsPending(true);
			Boolean userName = userDao.userNameValidation(theUser);
			Boolean userEmail = userDao.userEmailValidation(theUser);
			if(userName == true){
				redirectAttributes.addFlashAttribute("message", "UserName Already Exists, please try again.");
				return "redirect:/registrationError";
			}else if(userEmail == true){
				redirectAttributes.addFlashAttribute("message", "Email Already Exists, please try again.");
				return "redirect:/registrationError";
			} else {
				userDao.save(theUser);	
				return "redirect:/submittedPage";
			}
		}
		
		@RequestMapping(path = {"/registrationError"}, method = RequestMethod.GET)
			public String displayError(){
			return "registrationError";
			
		}
	}


