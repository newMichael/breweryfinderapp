<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
	<div class="container">
		<div class="row">
			<h1>Register</h1>
		</div>
		<c:url value="/brewInfo" var="formAction"/>
		<sec:authorize access="hasRole('ROLE_ADMIN')" var="admin"/>
		<form id="applicationForm" action="${formAction}" method="POST">
		
		<c:choose>
			<c:when test="${admin}">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" name="username" id="username" class="form-control"/>
				</div>
			</c:when>
		</c:choose>
		
		<div class="form-group">
				<label for="breweryName">Name of Brewery</label>
				<input type="text" name="breweryName" id="breweryName" class="form-control" placeholder=""/>
			</div>
			<div class="form-group">
				<label for="address">Address</label>
				<input type="text" name="address" id="address" class="form-control" placeholder="<c:out value="${brewery.address}" />"/>
			</div>
			<div class="form-group">
				<label for="breweryPhone">Phone Number of Brewery</label>
				<input type="text" name="breweryPhone" id="breweryPhone" class="form-control" placeholder="<c:out value="${brewery.breweryNumber}"/>" />
			</div>
			<div class="form-group">
				<label for="email">Contact Email</label>
				<input type="text" name="email" id="email" class="form-control" placeholder="<c:out value="${brewery.email}"/>"/>
			</div>
			<div class="form-group">
				<label for="website">Website</label>
				<input type="text" name="website" id="website" class="form-control" placeholder="<c:out value="${brewery.website}"/>"/>
			</div>
			<div class="form-group">
				<label for="firstName">Contact First Name</label>
				<input type="text" name="firstName" id="firstName" class="form-control" placeholder="<c:out value="${brewery.contactFirstName}"/>">
			</div>
			<div class="form-group">
				<label for="lastName">Contact Last Name</label>
				<input type="text" name="lastName" id="lastName" class="form-control"placeholder="<c:out value="${brewery.contactLastName}"/>"/>
			</div>
			<div class="form-group">
				<label for="foundedYear">Year Founded</label>
				<input type="text" name="foundedYear" id="foundedYear" class="form-control"placeholder="<c:out value="${brewery.foundedYear}"/>"/>
			</div>
			<div class="form-group">
				<label for="description">Description</label>
				<input type="text" name="description" id="description" class="form-control"placeholder="<c:out value="${brewery.description}"/>"/>
			</div>
			
			
			
			
			<sec:csrfInput/>

			<button type="submit" id="registerButton" class="btn btn-primary">Register</button>
		</form>
	</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />