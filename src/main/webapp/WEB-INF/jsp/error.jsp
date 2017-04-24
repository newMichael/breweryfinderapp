<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    
    <title>Belch</title>
    <c:url value="/js" var="jsHref" />
    <c:url value="/vendor" var="vendor" />
    <c:url value="/css" var="cssHref" />

    <link href="${cssHref}/validation.css" rel="stylesheet" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <script src="${jsHref}/jquery-3.1.1.js"></script>
    <script src="${jsHref}/jquery.validate.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script src="${jsHref}/validation.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	   	
   	<!-- Custom Fonts -->
    <link href="${vendor}/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
   	
   	<!-- Plugin CSS -->
    <link href="${vendor}/magnific-popup/magnific-popup.css" rel="stylesheet">
   	
	 <!-- Theme CSS -->
    <link href="${cssHref}/creative.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
    <link rel="stylesheet" href="${cssHref}/style.css"/>
	<script src="${jsHref}/global.js"></script>
    

    
<%--     <!-- BOOTSTRAPPER -->
    <script src="${jsHref}/bootstrapper.js"></script> --%>
    
</head>
<body>
	<h1>Uh oh, something broke</h1>
	<h3>Go back or try again later</h3>
</body>
</html>