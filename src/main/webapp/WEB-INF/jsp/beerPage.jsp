<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="row brewery-details-container container-fluid"
	id="top-margin">
	<div class="col-md-3 col-lg-3 beer-detail-box">
		<h2 class="details-header">
			<c:out value="${beer.name}" />
		</h2>
		<p class="breweries-ptag">Type:</p>
		<p>
			<c:out value="${beer.type}" />
		</p>
		<p class="breweries-ptag">ABV:</p>
		<p>
			<c:out value="${beer.abv}" />%
		</p>
		<p class="breweries-ptag">Description:</p>
		<p>
			<c:out value="${beer.description}" />
		</p>
		<p class="breweries-ptag">Rating:</p>
		<div class="rating-box-beer-page">
		

				<c:forEach var="i" begin="1" end="5">
					<c:choose>
						<c:when test="${averageRating >= i}">
							<img src="img/mugFullicon.png">
						</c:when>
						<c:when test="${averageRating < i && i - averageRating <= .5}">
							<img src="img/mugHalfFullicon.png">
						</c:when>
						<c:otherwise>
							<img src="img/mugEmptyIcon.png">
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<%-- <c:choose>
				<c:when test="${averageRating > 4.5}">
					<c:forEach begin="1" end="5">
						<img src="img/mugFullicon.png">
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach begin="1" end="${averageRating}">
						<img src="img/mugFullicon.png">
					</c:forEach>
					<c:forEach begin="1" end="${5 - averageRating}">
						<img src="img/mugEmptyIcon.png">
					</c:forEach>
				</c:otherwise>
			</c:choose> --%>
		</div>
	</div>
	<sec:authorize access="authenticated" var="authenticated" />
					<sec:authorize access="hasRole('ROLE_ADMIN')" var="admin"/>
					<sec:authorize access="hasRole('ROLE_USER')" var="user" />
	<c:choose>
		<c:when test="${!user}">
			<div class="container-fluid col-md-9 col-lg-9">
				<h2 class="details-header">Review This Beer</h2>
				<c:url value="/beerPage" var="formAction" />
				<form id="reviewForm" action="${formAction}" method="POST">
					<div class="form-group">
						<label for="description">Review</label>
						<textarea name="description" form="reviewForm" rows="4"></textarea>
					</div>
					<div class="form-group">
						<label for="starRating">Rating</label>
						<select name="starRating">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
						</select>
					</div>
					<input type="hidden" name="beerId" value="${beer.beerId}" />
					<sec:csrfInput />
					<button type="submit" id="reviewForm" class="btn btn-primary">Submit</button>
				</form>
			</div>
	 	</c:when>
	</c:choose>
	<br/>
</div>

<div class="row container-fluid">
		<div class="container">
			<h3>Reviews</h3>

				<c:forEach var="review" items="${reviewList}">
					<div class="row brewery-details-container">
						<div class="col-lg-8">
							<p>Beer Rating: <c:out value="${review.starRating}" /></p>
							<p>Review: <c:out value="${review.description}" /></p>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />