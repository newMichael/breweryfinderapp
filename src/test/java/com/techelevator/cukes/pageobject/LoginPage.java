package com.techelevator.cukes.pageobject;

import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
	
	@Component
	public class LoginPage {

		private WebDriver webDriver;

		@Autowired
		public LoginPage(WebDriver webDriver) {
			this.webDriver = webDriver;
		}

}
