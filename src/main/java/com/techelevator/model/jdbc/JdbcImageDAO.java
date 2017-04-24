package com.techelevator.model.jdbc;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;

import com.cloudinary.utils.ObjectUtils;
import com.techelevator.model.Beer;
import com.techelevator.model.Image;
import com.techelevator.model.ImageDAO;

@Component
public class JdbcImageDAO implements ImageDAO{
	 Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
			  "cloud_name", "addijhaq",
			  "api_key", "578697262966457",
			  "api_secret", "_pV3JOvRtHdN3EHT5qg8uwjGmsg"));
	 JdbcTemplate jdbcTemplate;
	 
	 @Autowired
		public JdbcImageDAO(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
		}
	 
	@Override
	public String uploadInsertImage(MultipartFile multiPartFile, Long beerId, Long breweryId, int type){
			switch (type) {
			 case 1: {
				 
				 try {
						
						Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(), ObjectUtils.emptyMap());
						String publicId = (String)uploadResult.get("public_id")+"."+(String)uploadResult.get("format");
						String sqlStatement  = "INSERT INTO images(type, brewery_id, public_id) VALUES(?,?,?)";
						jdbcTemplate.update(sqlStatement, type, breweryId, publicId);
						sqlStatement = "UPDATE breweries SET public_id = ? WHERE brewery_id = ?";
						jdbcTemplate.update(sqlStatement, publicId, breweryId);
						return publicId;
						
						
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} break;
				 
			 }
			 case 2: {
				 try {
						 
						 Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(), ObjectUtils.emptyMap());
						String publicId = (String)uploadResult.get("public_id")+"."+ (String)uploadResult.get("format");
						String sqlStatement  = "INSERT INTO images(type, beer_id, brewery_id, public_id)"+
													"VALUES(?,?,?,?)";
							jdbcTemplate.update(sqlStatement, type, beerId, breweryId, publicId);
							return publicId;
				 } catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				 } break;
			 }
			 case 3: {
				 try {
					 	
					 	Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(),ObjectUtils.emptyMap());
					 	String publicId = (String)uploadResult.get("public_id")+"."+(String)uploadResult.get("format");
						String sqlStatement  = "INSERT INTO images(type, brewery_id, public_id) "+
												"VALUES(?,?,?)";
						jdbcTemplate.update(sqlStatement, type, breweryId, publicId);
						return publicId;
						
				} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				} break;
			 }
		 }return null;
	}
		
	@Override
	public String uploadUpdateImage(MultipartFile multiPartFile, long beerId, long breweryId, int type, String oldImage){
			switch (type) {
			 case 1: {
				 
				 try {
						
						Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(),ObjectUtils.emptyMap());
						String publicId = (String)uploadResult.get("public_id")+"."+(String)uploadResult.get("format");
						String sqlStatement  = "UPDATE images SET public_id = ? WHERE brewery_id = ? AND type = ?";
						jdbcTemplate.update(sqlStatement, publicId, breweryId, type);
						sqlStatement = "UPDATE breweries SET public_id = ? WHERE brewery_id = ?";
						jdbcTemplate.update(sqlStatement, publicId, breweryId);
						cloudinary.uploader().destroy(oldImage, ObjectUtils.asMap("invalidate", true));
						return publicId;
						
						
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} break;
				 
			 }
			 case 2: {
				 try {
						 
						 Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(), ObjectUtils.emptyMap());
						 	String publicId = (String)uploadResult.get("public_id")+"."+(String)uploadResult.get("format");
							String sqlStatement  = "UPDATE images SET public_id = ? WHERE beer_id = ? AND type = ?";					
							jdbcTemplate.update(sqlStatement, publicId, beerId, type);
							cloudinary.uploader().destroy(oldImage, ObjectUtils.asMap("invalidate", true));
							return publicId;
							
				 } catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				 } break;
			 }
			 case 3: {
				 try {
					 	
					 Map uploadResult = cloudinary.uploader().upload(multiPartFile.getBytes(),ObjectUtils.emptyMap());
						String publicId = (String)uploadResult.get("public_id")+"."+(String)uploadResult.get("format");
						String sqlStatement  = "UPDATE images SET public_id = ? WHERE brewery_id = ? AND type = ?";
						jdbcTemplate.update(sqlStatement, publicId, breweryId, type);
						cloudinary.uploader().destroy(oldImage, ObjectUtils.asMap("invalidate", true));
						return publicId;
						
						
				} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
				} break;
			 }
		 }
			return null;
	}
	
	@Override
	public String getImage(long beerId,long breweryId, int type){
		switch(type) {
		case 1: {
					String sqlStatement = "SELECT * FROM images WHERE brewery_id= ? AND type= ?";
					SqlRowSet result = jdbcTemplate.queryForRowSet(sqlStatement,breweryId, type);
		
					while(result.next()){
						if(result.getString("public_id")!=null){
							return result.getString("public_id");
						}
					} break;
				}
		case 2: {
					String sqlStatement = "SELECT * FROM images WHERE beer_id= ? AND type= ?";
					SqlRowSet result = jdbcTemplate.queryForRowSet(sqlStatement,beerId, type);
	
					while(result.next()){
						if(result.getString("public_id")!=null){
							return result.getString("public_id");
						}	
					} break;
		}
		
		}
		return null;
	}
	
	@Override
	public List<Image> getAllBreweryBeerPhotos(Long breweryId){
		List<Image>beerPhotos = new ArrayList<Image>();
		Image img = new Image();
		String getAllBeers = "SELECT * FROM images WHERE brewery_id=? AND type=?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(getAllBeers, breweryId,2);
		while(results.next()){
			img = mapRowToResult(results);
			beerPhotos.add(img);
		}
		return beerPhotos;
	} 
	
	@Override
	public void deleteImage(String publicId){
		try {
		cloudinary.uploader().destroy(publicId, ObjectUtils.asMap("invalidate", true));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
} 
		
	}
	
	
	
	private Image mapRowToResult(SqlRowSet result){
		Image image = new Image();
		image.setBeerId(result.getLong("beer_id"));
		image.setBreweryId(result.getLong("brewery_id"));
		image.setType(result.getInt("type"));
		image.setImageId(result.getLong("image_id"));
		image.setPublicId(result.getString("public_id"));
		
		return image;
	}
	
	
	public static void main(String[] args){
		
		
	}
	
	
}



