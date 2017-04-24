package com.techelevator.model;

public class User {

	private String username;
	private String password;
	private String email;
	private String firstName;
	private String lastName;
	private String breweryName;
	private String breweryPhone;
	

	private Boolean isEnabled;
	private Boolean isPending;
	
	
	public String getEmail() {
		return email;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getBreweryName() {
		return breweryName;
	}
	public String getBreweryPhone() {
		return breweryPhone;
	}
	public Boolean getIsEnabled() {
		return isEnabled;
	}
	public Boolean getIsPending() {
		return isPending;
	}
	public String getPassword() {
		return password;
	}
	public String getUsername() {
		return username;
	}
	
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setBreweryName(String breweryName) {
		this.breweryName = breweryName;
	}
	public void setBreweryPhone(String breweryPhone) {
		this.breweryPhone = breweryPhone;
	}
	public void setIsPending(Boolean isPending) {
		this.isPending = isPending;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setIsEnabled(Boolean enabled) {
		this.isEnabled = enabled;
	}
	public void setEmail(String email){
		this.email = email;
	}
	
	public void setUserFromBrewery(Brewery theBrewery){
	setFirstName(theBrewery.getContactFirstName());
	setLastName(theBrewery.getContactLastName());
	setBreweryName(theBrewery.getName());
	setBreweryPhone(theBrewery.getBreweryNumber());
	setEmail(theBrewery.getEmail());
	setIsEnabled(true);
	setIsPending(false);
	}
}
