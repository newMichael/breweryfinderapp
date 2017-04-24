package com.techelevator;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.techelevator.model.ImageDAO;



@Controller
@Transactional
public class ImageUploadController {
	
	private ImageDAO imageDAO;
	
	
	@Autowired
	public ImageUploadController(ImageDAO imageDAO){
		this.imageDAO = imageDAO;
	}


	
	
	
	@RequestMapping(path="/imageUpload", method=RequestMethod.POST)
		public String handleFormUpload(final RedirectAttributes redirectAttributes, @RequestParam("file") MultipartFile file, MultipartHttpServletRequest imgRequest, 
										@RequestParam("username") String username, @RequestParam("type") int type, @RequestParam("beerId") long beerId, @RequestParam("breweryId") long breweryId){
			
			String publicId= imageDAO.getImage(beerId, breweryId, type);
			if(publicId == null){
				imageDAO.uploadInsertImage(file, beerId, breweryId, type);
			}else
				imageDAO.uploadUpdateImage(file, beerId, breweryId, type, publicId);
				
			
			
			return "redirect:/controlPanel?username="+username;
			
		
	}
	
	

}



