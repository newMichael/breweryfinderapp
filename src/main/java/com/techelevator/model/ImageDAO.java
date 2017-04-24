package com.techelevator.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface ImageDAO {


	String uploadInsertImage(MultipartFile multiPartFile, Long beerId, Long breweryId, int type);

	String uploadUpdateImage(MultipartFile multiPartFile, long beerId, long breweryId, int type, String oldImage);

	String getImage(long beerId, long breweryId, int type);
	
	public List<Image> getAllBreweryBeerPhotos(Long breweryId);

	void deleteImage(String publicId);
}
