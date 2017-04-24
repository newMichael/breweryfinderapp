$(document).ready(function(){
      $('.beer-display').slick({
    	  centerMode: true,
    	  centerPadding: '60px',
    	  slidesToShow: 3,
    	  responsive: [
    	    {
    	      breakpoint: 900,
    	      settings: {
    	        arrows: false,
    	        centerMode: true,
    	        centerPadding: '40px',
    	        slidesToShow: 2
    	      }
    	    },
    	    {
    	      breakpoint: 500,
    	      settings: {
    	        arrows: false,
    	        centerMode: true,
    	        centerPadding: '40px',
    	        slidesToShow: 1
    	      }
    	    }
    	  ]
      });
    });