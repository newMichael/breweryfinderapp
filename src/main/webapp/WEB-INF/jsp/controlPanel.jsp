<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://cloudinary.com/jsp/taglib" prefix="cl" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class="brewery-details-container container-fluid" id="top-margin">

	<div class="row">
		<div class="brewery-details-image col-md-3 col-lg-3">
			<c:choose>
				<c:when test="${empty brewery.img}">
					<img src="img/placeholder.jpg" class="center-block" />
				</c:when>
				<c:otherwise>
					<img
						src="<c:out value="http://res.cloudinary.com/addijhaq/image/upload/v1491950403/${logo}"/>">
				</c:otherwise>
			</c:choose>

			<div>
				<c:url value="/imageUpload" var="imageUpload" />
				<form class="form cpanelImageForm" action="${imageUpload}"
					method="POST" enctype="multipart/form-data">
					<div class="form-group">

						<sec:authentication property="principal.username" var="username" />
						<label for="file">Upload Photo</label> <input type="file"
							class="file" name="file" /> <input type="hidden" name="username"
							value="${username}" /> <input type="hidden" name="type" value="1" />
						<input type="hidden" name="breweryId" value="${brewery.breweryId}" />
						<input type="hidden" name="beerId" value="0" />
						<sec:csrfInput />
					</div>
					<button type="submit" id="registerButton" class="btn-primary">Upload</button>
				</form>
			</div>
		</div>
		<div class="brewery-details-box col-md-9 col-lg-9">
			<h2 class="details-header">
				<c:out value="${brewery.name}" />
			</h2>
			<p class="breweries-ptag">Founded:</p>
			<p>
				<c:out value="${brewery.foundedYear}" />
			</p>
			<p class="breweries-ptag">Address:</p>
			<p>
				<c:out value="${brewery.address}" />
			</p>
			<p>
				<c:out value="${brewery.description}" />
			</p>
			<p class="beer-list-ptag">
				<c:out value="${brewery.breweryNumber}" />
				&nbsp;&nbsp;&nbsp;
				<c:url value="#" var="breweryWebsite">
					<c:param name="website" value="${brewery.website}" />
				</c:url>
				<a href="${breweryWebsite}"><c:out value="${brewery.website}" /></a>
			</p>


			<!-- Trigger the modal with a button -->
			<p class="edit-button">
				<button type="button" class="btn-primary" data-toggle="modal"
					data-target="#myModal">Edit Brewery Information</button>

				<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content centered-edit-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Edit Brewery Information</h4>
						</div>
						<div class="modal-body">
							<sec:authentication property="principal.username" var="username" />
							<c:url value="/controlPanel" var="formAction"></c:url>
							<form id="myBreweryInfo" method="POST" action="${formAction}">
								<fieldset>
									<p class="beer-list-ptag-name">Name:</p>
									<div class="form-group">
										<input type="text" name="name" id="name"
											value="<c:out value="${brewery.name}" />"
											placeholder="<c:out value="${brewery.name}" />" />
									</div>
									<p class="beer-list-ptag-name">Contact First Name:</p>
									<div class="form-group">
										<input type="text" name="contactFirstName"
											id="contactFirstName"
											value="<c:out value="${brewery.contactFirstName}" />"
											placeholder="<c:out value="${brewery.contactFirstName}"/>">
									</div>
									<p class="beer-list-ptag-name">Contact Last Name:</p>
									<div class="form-group">
										<input type="text" name="contactLastName" id="contactLastName"
											value="<c:out value="${brewery.contactLastName}"/>"
											placeholder="<c:out value="${brewery.contactLastName}"/>" />
									</div>
									<p class="beer-list-ptag-name">Contact Email:</p>
									<div class="form-group">
										<input type="text" name="email" id="email"
											value="<c:out value="${brewery.email}" />"
											placeholder="<c:out value="${brewery.email}"/>" />
									</div>
									<p class="beer-list-ptag-name">Phone:</p>
									<div class="form-group">
										<input type="text" name="breweryNumber" id="breweryNumber"
											value="<c:out value="${brewery.breweryNumber}" />"
											placeholder="<c:out value="${brewery.breweryNumber}"/>" />
									</div>
									<p class="beer-list-ptag-name">Founded:</p>
									<div class="form-group">
										<input type="text" name="foundedYear" id="foundedYear"
											value="<c:out value="${brewery.foundedYear}"/>"
											placeholder="<c:out value="${brewery.foundedYear}"/>" />
									</div>
									<p class="beer-list-ptag-name">Address:</p>
									<div class="form-group">
										<input type="text" name="address" id="address"
											value="<c:out value="${brewery.address}" />"
											placeholder="<c:out value="${brewery.address}" />" />
									</div>
									<p class="beer-list-ptag-name">Website:</p>
									<div class="form-group">
										<input type="text" name="website" id="website"
											value="<c:out value="${brewery.website}" />"
											placeholder="<c:out value="${brewery.website}"/>" />
									</div>
									<p class="beer-list-ptag-name">Description:</p>
									<div class="form-group">
										<textarea name="description" id="description"
											form="myBreweryInfo" placeholder="${brewery.description}"
											rows="4"><c:out value="${brewery.description}" /></textarea>
									</div>

									<input type="hidden" name="breweryId"
										value="${brewery.breweryId}"> <input type="hidden"
										name="button" value="update"> <input type="hidden"
										name="username" value="${username}"> <input
										class="btn-primary" type="submit" value="Update Info">
									<sec:csrfInput />
								</fieldset>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
			<%--End of Edit Brewery Modal --%>


			<!-- Trigger the modal with a button -->
			<button type="button" class="btn-primary" data-toggle="modal"
				data-target="#myModal2">Add A Beer</button>

			<!-- Modal -->
			<div id="myModal2" class="modal fade" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content centered-edit-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add A Beer</h4>
						</div>
						<div class="modal-body">
							<sec:authentication property="principal.username" var="username" />
							<c:url value="/addBeer" var="addBeer"></c:url>
							<form id="addNewBeer" method="POST" action="${addBeer}"
								enctype="multipart/form-data">
								<fieldset>
									<p class="beer-list-ptag-name">Name:</p>
									<div class="form-group">
										<input type="text" name="name" id="name" />
									</div>
									<p class="beer-list-ptag-name">Type:</p>
									<div class="form-group">
										<input type="text" name="type" id="type" />
									</div>
									<p class="beer-list-ptag-name">ABV:</p>
									<div class="form-group">
										<input type="text" name="abv" id="abv" />
									</div>
									<p class="beer-list-ptag-name">Description:</p>
									<div class="form-group">
										<input type="text" name="description" id="description" />
									</div>
									<p class="beer-list-ptag-name">Upload Photo:</p>
									<div class="form-group centered-edit-info">
										<label class="fileContainer"> Select Image <input
											type="file" name="file" />
										</label>
									</div>
									<input type="hidden" name="breweryId"
										value="${brewery.breweryId}"> <input type="hidden"
										name="button" value="addBeer"> <input type="hidden"
										name="phototype" value="2"> <input type="hidden"
										name="username" value="${username}"> <input
										class="btn-primary" type="submit" value="Add Beer">
									<sec:csrfInput />
								</fieldset>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
			<%--End of Add Beer Modal --%>


		</div>
	</div>


	<div class="brewery-details-container container-fluid">
		<div class="brewery-details-box container-fluid">

			<h3 class="details-header">Beer List</h3>




			<div class="container-fluid beer-list-boxes">
				<c:forEach var="beer" items="${beer}">
					<div class="beer-list-details-container col-md-3">
						<c:url value="/beerPage" var="beerPageURL">
							<c:param name="beerId" value="${beer.beerId}" />
						</c:url>
						<div class="beer-list-images">
							<a href="${beerPageURL}" title="View Details and Rate"> <img
								src="<c:out value="http://res.cloudinary.com/addijhaq/image/upload/v1491950403/${beer.img}"/>">
							</a>
						</div>
						<p class="beer-list-ptag-name">
							<c:out value="${beer.name}" />
						</p>
						<p class="breweries-ptag">Type:</p>
						<p class="beer-list-ptag">
							<c:out value="${beer.type}" />
						</p>
						<p class="breweries-ptag">Rating:</p>
						<div class="rating-box rate-mugs-beerList">
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
						</div>
						<sec:authentication property="principal.username" var="username" />
						<c:url value="/controlPanel" var="formAction">
						</c:url>
						<form method="POST" action="${formAction}">
							<input type="hidden" name="beerId" value="${beer.beerId}">
							<input type="hidden" name="button" value="delete"> <input
								type="hidden" name="username" value="${username}"> <input
								class="btn-primary" type="submit" value="Delete">
							<sec:csrfInput />
						</form>
					</div>
				</c:forEach>

			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />