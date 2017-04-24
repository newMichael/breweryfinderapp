package com.techelevator.model;

public class Image {
	private int type;
	private long imageId;
	private long beerId;
	private long breweryId;
	private String url;
	
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public long getImageId() {
		return imageId;
	}
	public void setImageId(long imageId) {
		this.imageId = imageId;
	}
	public long getBeerId() {
		return beerId;
	}
	public void setBeerId(long beerId) {
		this.beerId = beerId;
	}
	public long getBreweryId() {
		return breweryId;
	}
	public void setBreweryId(long breweryId) {
		this.breweryId = breweryId;
	}
	public String getPublicId() {
		return url;
	}
	public void setPublicId(String url) {
		this.url = url;
	}
	

}
