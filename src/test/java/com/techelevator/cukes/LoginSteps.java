package com.techelevator.cukes;

import org.openqa.selenium.WebDriver;
import org.springframework.beans.factory.annotation.Autowired;

import com.techelevator.cukes.pageobject.HomePage;
import com.techelevator.cukes.pageobject.LoginPage;

import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class LoginSteps {

	private WebDriver webDriver;
	private HomePage homePage;
	private LoginPage loginPage;
	
	@Autowired
	public LoginSteps(HomePage homePage, LoginPage loginPage) {
		this.homePage = homePage;
		this.loginPage = loginPage;
	}
	
	@Given("^I am a brewer logging in$")
	public void i_am_a_brewer_logging_in() throws Throwable {
		homePage.clickLoginLink();
	}

	@Given("^I type in my username$")
	public void i_type_in_my_username() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}
	
	@Given("^I type in my password$")
	public void i_type_in_my_password() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}
	
	@When("^I click the login button$")
	public void i_click_the_login_button() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}

	@Then("^I am logged in$")
	public void i_am_logged_in() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}
	
}
