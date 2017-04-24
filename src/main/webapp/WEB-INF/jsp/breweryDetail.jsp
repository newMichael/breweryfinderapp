<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="container-fluid" id="top-margin">
	<div class="row">
		<div class="jumbotron sample-img no-margin">
			<div class="bg">
				<c:url var="backgroundURL" value="img/jumbotron-sample-img.jpg"></c:url>
				<img src="${backgroundURL}" />
			</div>
			<div class="row">
				<div class="col-md-3 brew-logo">
						<c:choose>
						<c:when test="${empty brewery.img}">
							<a href="${breweryURL}" class="portfolio-box"><img
								src="img/placeholder.jpg" class="img-circle center-block" />
						</c:when>
						<c:otherwise>
							<a href="${breweryURL}" class="portfolio-box"> <img
								src="<c:out value="http://res.cloudinary.com/addijhaq/image/upload/v1491950403/${brewery.img}"/>"
								class="img-circle center-block" alt="">
						</c:otherwise>
					</c:choose>
						</a>
				</div>
				<div class="col-md-9">
					<h1>
						<c:out value="${brewery.name}" />
					</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="row fake-jumbotron">
		<div class="col-md-4">
			<span class="glyphicon glyphicon-home icon-style"></span><c:out value="${brewery.address}" />
		</div>
		<div class="col-md-4">
			<span class="glyphicon glyphicon-earphone icon-style"></span><c:out value="${brewery.breweryNumber}" />
		</div>
		<div class="col-md-4">
			<span class="glyphicon glyphicon-link icon-style"></span><c:out value="${brewery.website}" />
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row description-container">
		<div class="col-md-offset-4 col-md-4 brewery-description">
			<p><c:out value="${brewery.description}" /><p>
		</div>
		<div class="col-md-offset-4"></div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="feature-img-half beer-container">
			<div id="grad1">
				<h1 class="beer-list-heading"><c:out value="${brewery.name}" /> Beer List</h1>
			</div>
			<div class="beer-display">
				<c:forEach var="beer" items="${beer}">
					<c:url value="/beerPage" var="beerPageURL">
						<c:param name="beerId" value="${beer.beerId}" />
					</c:url>
					<div class="beer-list-details-container col-sm-3">
						<h1><c:out value="${beer.name}" /></h1>
						<div class="beer-list-images">
							<%-- <a href="${beerPageURL}"> --%>
							<c:choose>
							<c:when test="${empty beer.img}">
								<a href="${beerPageURL}"><img src="img/placeholderbeer.jpg" /></a>
							</c:when>
							<c:otherwise>
							<a href="${beerPageURL}"> <img
								src="<c:out value="http://res.cloudinary.com/addijhaq/image/upload/v1491950403/${beer.img}"/>"
								title="View Details and Rate" class="slick-img"></a>
								</c:otherwise>
								</c:choose>
							<!-- </a> -->
						</div>
						<p class="breweries-ptag"><c:out value="${beer.type}" /></p>
						<p class="breweries-ptag">ABV: <c:out value="${beer.abv}" />%</p>
						<div class="rating-container">
						<p>User Rating:</p>
							<c:forEach var="i" begin="1" end="5">
								<c:choose>
									<c:when test="${beer.rating >= i}">
										<img src="img/mugFullicon.png">
									</c:when>
									<c:when test="${beer.rating < i && i - beer.rating <= .5}">
										<img src="img/mugHalfFullicon.png">
									</c:when>
									<c:otherwise>
										<img src="img/mugEmptyIcon.png">
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>





<%-- <div class="brewery-details-container container-fluid" id="top-margin">
	<div class="row">
		<div class="brewery-details-image col-md-3 col-lg-3">
			<img src="img/<c:out value="${brewery.brewLogoImgSrc}"/>">
		</div>
		<div class="brewery-details-box col-md-9 col-lg-9">		
				<h2 class="details-header"><c:out value="${brewery.name}" /></h2>
				<p class="breweries-ptag">Founded:</p> 
				<p><c:out value="${brewery.foundedYear}" /></p>
				<p class="breweries-ptag">Address:</p>
				<p><c:out value="${brewery.address}" /></p>
				<p><c:out value="${brewery.description}" /></p>
				<p class="beer-list-ptag"><c:out value="${brewery.breweryNumber}"/>&nbsp;&nbsp;&nbsp;
					<c:url value="#" var="breweryWebsite" >
						<c:param name="website" value="${brewery.website}" />
					</c:url><a href="${breweryWebsite}"><c:out value="${brewery.website}" /></a></p>	
		</div>
	</div>
</div>

<div class="brewery-details-container container-fluid">
	<div class="brewery-details-box container-fluid">
		<h3 class="details-header">Beer List</h3>
			<div class="container-fluid">
			<c:forEach var="beer" items="${beer}">
				<div class="beer-list-details-container col-md-3">
					<c:url value="/beerPage" var="beerPageURL">
						<c:param name="beerId" value="${beer.beerId}" />
					</c:url>
					<div class="beer-list-images">
					<a href="${beerPageURL}">
						<img src="img/<c:out value="${beer.beerLogoImgSrc}"/>" title="View Details and Rate">
					</a>
					</div>
					<p class="beer-list-ptag-name"><c:out value="${beer.name}" /></p>
					<p class="breweries-ptag">Type:</p>
					<p class="beer-list-ptag"><c:out value="${beer.type}" /></p>
					<p class="breweries-ptag">Rating:</p>
					<div class="rating-box">
					<c:forEach var="i" begin="1" end="5">
					<c:choose>
						<c:when test="${beer.rating >= i}">
							<img src="img/mugFullicon.png">
						</c:when>
						<c:when test="${beer.rating < i && i - beer.rating <= .5}">
							<img src="img/mugHalfFullicon.png">
						</c:when>
						<c:otherwise>
							<img src="img/mugEmptyIcon.png">
						</c:otherwise>
					</c:choose>
				</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div> --%>
	
<c:import url="/WEB-INF/jsp/common/footer.jsp" />