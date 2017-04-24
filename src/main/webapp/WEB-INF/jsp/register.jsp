<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="fluid-container">
	<div class="row">
		<div class="text-center register-form" id="top-margin">
			<h1>Register</h1>
			<c:url value="/register" var="formAction" />
			<form id="applicationForm" action="${formAction}" method="POST" enctype="multipart/form-data">

				<div class="form-group">
					<label for="username">Username</label> <input type="text"
						name="username" id="username" />
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						name="password" id="password" />
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password</label> <input
						type="password" name="confirmPassword" id="confirmPassword" />
				</div>
				<div class="form-group">
					<label for="email">Email</label> <input type="text" name="email"
						id="email" />
				</div>
				<div class="form-group">
					<label for="firstName">First Name</label> <input type="text"
						name="firstName" id="firstName">
				</div>
				<div class="form-group">
					<label for="lastName">Last Name</label> <input type="text"
						name="lastName" id="lastName" />
				</div>
				<div class="form-group">
					<label for="breweryName">Name of Brewery</label> <input type="text"
						name="breweryName" id="breweryName" />
				</div>
				<div class="form-group">
					<label for="breweryPhone">Phone Number of Brewery</label> <input
						type="text" name="breweryPhone" id="breweryPhone" />
				</div>


				<sec:csrfInput />

				<button type="submit" id="registerButton" class="btn btn-primary">Register</button>
			</form>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/jsp/common/footer.jsp" />
