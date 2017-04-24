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
	<header>

		<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
			
			<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
 					<span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
          	</div>
          		
           		<c:url value="/" var="home" />
				<c:url value="/register" var="register" />
				<c:url value="/admin" var="adminPage" />

          		<div class="collapse navbar-collapse" id="myNavbar">
          		
           			 <ul class="nav navbar-nav">
				 		<li><a class="page-scroll" href="<c:out value="${home}" />" class="home">Home</a> </li>
	                	
						
					</ul>
					
					<ul class="nav navbar-nav navbar-right nav-right">
					<sec:authorize access="authenticated" var="authenticated" />
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="admin"/>
					<sec:authorize access="hasRole('ROLE_USER')" var="user" />
						<c:choose>
							<c:when test="${admin}">
								<li><a class="page-scroll" href="<c:out value="${adminPage}"/>" >Admin</a></li>
							</c:when>
						</c:choose>
						<c:choose>
	                		<c:when test="${authenticated}">
	                			<li>
	                				<sec:authentication property="principal.username" var="userName"/>
	                				
	                				
	                			<c:choose>
	                					
										<c:when test="${admin}">
											<c:url value = "/myBrewery" var="BreweryInformation">
												<c:param name="username" value="${userName}" />
											</c:url>
											<a class="page-scroll" href="<c:out value="${BreweryInformation}" />">Create New Brewery</a>
										</c:when>
										<%-- <c:otherwise>
											<a class="page-scroll" href="<c:out value="${BreweryInformation}" />">My Brewery</a>
										</c:otherwise> --%>
								</c:choose>
	                				
	                			</li>
	                			<li>
	                				<c:url value="/controlPanel" var="BreweryControlPanel">
	                					<c:param name="username" value="${userName}" />
	                				</c:url>
	                				<c:choose>
	                				<c:when test="${user}">
	                					<a class="page-scroll" href="<c:out value="${BreweryControlPanel}" />">My Brewery</a>
	                				</c:when>
	                				</c:choose>
	                			</li>
	                			<li></li>				
								<li>
	                	  			<a id="logout" href="#">Logout</a>
						
									<form id="logout-form" action="<c:url value="/logout"/>" method="POST">
										<sec:csrfInput/>
									</form>
	                			</li>
	                			
							</c:when>
							<c:otherwise>	
								<c:url value="/login" var="login"/>
									<li> <a class="page-scroll" href="<c:out value="${login}"/>"class="login" >Login</a> </li>
									<li><a class="page-scroll" id="register" href="<c:out value="${register}"/>">Are You A Brewer?</a></li>
							</c:otherwise>
							</c:choose>
					</ul>
					
				</div>
			
		</nav>
	</header>
