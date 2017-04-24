package com.techelevator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.ui.ModelMap;

import com.techelevator.model.BeerDAO;
import com.techelevator.model.BreweryDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserDAO;
	@Transactional
	@Controller
	
		public class AdminController {
		private UserDAO userDAO;
		
		@Autowired
		public AdminController (UserDAO userDAO) {
			this.userDAO = userDAO;
		}
		
			@RequestMapping(path={"/admin"}, method = RequestMethod.GET)
				public String getAdminPage(HttpServletRequest request){
				List<User> pendingList = userDAO.getPendingUsers();
				List<User> activeList = userDAO.getAllUsers();
				List<User> disabledList = userDAO.getDisabledUsers();
				request.setAttribute("pendingUsers", pendingList);
				request.setAttribute("activeUsers", activeList);
				request.setAttribute("disabledUsers", disabledList);
				return "admin";
			}
			
			@RequestMapping(path={"/user"}, method = RequestMethod.GET)
			public String getUserPage(HttpServletRequest request, @RequestParam (value="userName") String userName){
				User user = userDAO.getUserByUserName(userName);
				request.setAttribute("user", user );
				return "user";
			}
			
			@RequestMapping(path={"/user"}, method=RequestMethod.POST)
				public String setEnable(@RequestParam (value="username") String userName){
				User user = userDAO.getUserByUserName(userName);
				if(user.getIsEnabled()==false){
					user.setIsEnabled(true);
					user.setIsPending(false);
				}else {
					user.setIsEnabled(false);
				}
				
				userDAO.setIsEnabled(user);
				
				return "redirect:/admin";
			}

}
