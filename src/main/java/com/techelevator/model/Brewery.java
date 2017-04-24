package com.techelevator.model;

public class Brewery {
	
	private Long breweryId;
	private String name;
	private String address;
	private String description;
	private String foundedYear;
	private String userName;
	private String email;
	private String contactFirstName;
	private String contactLastName;
	private String breweryNumber;
	private String website;
	private String img;
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactFirstName() {
		return contactFirstName;
	}
	public void setContactFirstName(String contactFirstName) {
		this.contactFirstName = contactFirstName;
	}
	public String getContactLastName() {
		return contactLastName;
	}
	public void setContactLastName(String contactLastName) {
		this.contactLastName = contactLastName;
	}
	public String getBreweryNumber() {
		return breweryNumber;
	}
	public void setBreweryNumber(String breweryNumber) {
		this.breweryNumber = breweryNumber;
	}
	public Long getBreweryId() {
		return breweryId;
	}
	public void setBreweryId(Long breweryId) {
		this.breweryId = breweryId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFoundedYear() {
		return foundedYear;
	}
	public void setFoundedYear(String foundedYear) {
		this.foundedYear = foundedYear;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBrewLogoImgSrc() {
		return "brewlogo" + breweryId + ".jpg";
	}

}
