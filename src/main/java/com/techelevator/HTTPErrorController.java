package com.techelevator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HTTPErrorController {
	
	String path = "/error";
	  
	 @RequestMapping(value="/400")
	 public String error400(){
	  System.out.println("custom error handler");
	  return "error";
	 }
	  
	 @RequestMapping(value="/404")
	 public String error404(){
	  System.out.println("custom error handler");
	  return "error";
	 }
	  
	 @RequestMapping(value="/500")
	 public String error500(){
	  System.out.println("custom error handler");
	  return "error";
	 }

}
