<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<sec:authorize access="hasRole('ROLE_ADMIN')" var="admin" />

<div class="fluid-container">
	<div class="row form-container">
		<div class="col-lg-8 col-lg-offset-2 text-center" id="top-margin">
			<c:choose>
					<c:when test="${admin}">
						<h1>Create Brewery</h1>
					</c:when>
					<c:otherwise>
						<h1>My Brewery</h1>
					</c:otherwise>
			</c:choose>
			<c:url value="/myBrewery" var="formAction" />
			<form id="myBreweryInfo" action="${formAction}" method="POST">
				<fieldset>
				<c:choose>
					<c:when test="${admin}">
						<div class="form-group">
					<label for="username">Username</label> <input type="text"
						name="username" id="username" />
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						name="password" id="password" />
				</div>
					</c:when>
				</c:choose>

				<div class="form-group">
					<label for="name">Name of Brewery</label> <input type="text"
						name="name" id="name" value="<c:out value="${brewery.name}" />" 
						placeholder="<c:out value="${brewery.name}" />" />
				</div>
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						name="address" id="address" value="<c:out value="${brewery.address}" />"
						placeholder="<c:out value="${brewery.address}" />" />
				</div>
				<div class="form-group">
					<label for="breweryNumber">Phone Number</label> <input
						type="text" name="breweryNumber" id="breweryNumber" value="<c:out value="${brewery.breweryNumber}" />"
						placeholder="<c:out value="${brewery.breweryNumber}"/>" />
				</div>
				<div class="form-group">
					<label for="email">Contact Email</label> <input type="text"
						name="email" id="email" value="<c:out value="${brewery.email}" />" 
						placeholder="<c:out value="${brewery.email}"/>" />
				</div>
				<div class="form-group">
					<label for="website">Website</label> <input type="text"
						name="website" id="website" value="<c:out value="${brewery.website}" />"
						placeholder="<c:out value="${brewery.website}"/>" />
				</div>
				<div class="form-group">
					<label for="contactFirstName">Contact First Name</label> <input
						type="text" name="contactFirstName" id="contactFirstName" value="<c:out value="${brewery.contactFirstName}" />" 
						placeholder="<c:out value="${brewery.contactFirstName}"/>">
				</div>
				<div class="form-group">
					<label for="contactLastName">Contact Last Name</label> <input type="text"
						name="contactLastName" id="contactLastName" value="<c:out value="${brewery.contactLastName}"/>" 
						placeholder="<c:out value="${brewery.contactLastName}"/>" />
				</div>
					<div class="form-group">
						<label for="foundedYear">Year Founded</label> <input type="text"
							name="foundedYear" id="foundedYear" value="<c:out value="${brewery.foundedYear}"/>"
							placeholder="<c:out value="${brewery.foundedYear}"/>" />
					</div>
					<div class="form-group">
						<label for="description">Description</label>
						<textarea name="description" id ="description" form="myBreweryInfo"
							placeholder="${brewery.description}" 
							rows="4" ><c:out value="${brewery.description}"/></textarea>
					</div>
					<sec:csrfInput />

					<button type="submit" id="registerButton" class="btn btn-primary">Update Info</button>
				</fieldset>
			</form>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />