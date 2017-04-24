package com.techelevator.cukes.pageobject;

import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HomePage {

	private WebDriver webDriver;

	@Autowired
	public HomePage(WebDriver webDriver) {
		this.webDriver = webDriver;
	}
	
	public LoginPage clickLoginLink() {
		return new LoginPage(webDriver);
	}
	
}
