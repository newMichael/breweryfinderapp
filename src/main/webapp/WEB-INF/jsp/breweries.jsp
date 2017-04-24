<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<c:url var="logo" value="img/belch.png"></c:url>
<div class="feature-img">
	<div class="header-content header-content-inner">
		<img src="${logo}" class="container-fluid" />
		<hr>
		<p>Belch - Rate, review, and follow your favorite breweries in
			Cleveland.</p>
		<a href="#portfolio" class="btn btn-primary btn-xl page-scroll">TAKE
			A LOOK</a>
	</div>
</div>


<section class="no-padding" id="portfolio">
	<div class="container-fluid">
		<div class="row no-gutter popup-gallery">

			<c:forEach var="brewery" items="${breweries}">
				<c:url value="/breweryDetail" var="breweryURL">
					<c:param name="breweryId" value="${brewery.breweryId}" />
				</c:url>
				<div class="col-lg-4 col-sm-6 remove-bootstrap-padding">
					<c:choose>
						<c:when test="${empty brewery.img}">
							<a href="${breweryURL}" class="portfolio-box"><img
								src="img/placeholder.jpg" class="img-responsive" />
						</c:when>
						<c:otherwise>
							<a href="${breweryURL}" class="portfolio-box"> <img
								src="<c:out value="http://res.cloudinary.com/addijhaq/image/upload/v1491950403/${brewery.img}"/>"
								class="img-responsive" alt="">
						</c:otherwise>
					</c:choose>
					<div class="portfolio-box-caption">
						<div class="portfolio-box-caption-content">
							<div class="project-category text-faded">
								<c:out value="${brewery.address}" />
							</div>
							<div class="project-name">
								<c:out value="${brewery.name}" />
							</div>
						</div>
					</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>
</section>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />