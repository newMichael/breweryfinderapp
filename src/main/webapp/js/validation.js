//<reference path="/jquery-3.1.1.js" />
//<reference path="/jquery.validate.js" />

$(document).ready(function () {
 
	$("#applicationForm").validate({
		
		
		rules:{
			username:{
				required:true,
				minlength: 6,
			},
			
			email: {
					email: true,
			},
	
			password: {
				required: true,
				minlength: 8,
				strongpassword: true
				
			},
			
			confirmPassword: {
				equalTo:'#password'
			},
			
			firstName:{
				required: true,
				minlength: 2,           //requires min length of 2 characters
                lettersonly: true
			},
			lastName:{
				required: true,
				minlength: 2,           //requires min length of 2 characters
                lettersonly: true
			},
			breweryName:{
				required: true,
				minlength: 4,           //requires min length of 2 characters
			},
			breweryPhone:{
				required: true,
				minlength: 10,           //requires  length of 11 characters
			},
			
			
		},
		messages:{
			
			email:{
				required: "You must provide an email address." },
				
			password:{
				required: "You must provide a password.",
				format: "Password must be at least 8 characters in length, contain one uppercase and lowercase." 
					},
			fName: {
			    required: "You must provide a first name"
			        },
			lName: {
			    required: "You must provide a last name",
			    minlength: "Last name can't be less than 2 characters"
			       }, 
			breweryPhone: {
		                required: "You must provide a phone number",
		                length: "Phone number must include 1 and area code, no spaces"
		            },
		    breweryName: {
		                required: "You must provide your Business Name",
		                minlength: "Last name can't be less than 2 characters"
		            }			        
			
		},
		errorClass: "error",
		validClass: "valid",
		
		});
});
	
	$.validator.addMethod("strongpassword", function (value, index) {
	    return value.match(/[A-Z]/) && value.match(/[a-z]/) && value.match(/\d/);  //check for one capital letter, one lower case letter, one num
	}, "Please enter a strong password (one capital, one lower case, and one number");


	
	
	
