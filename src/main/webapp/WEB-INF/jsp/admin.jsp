<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class = "fluid-container" >
	<div class = "row text-center" id="top-margin">
		<h2>Admin Page</h2>
	</div>
	<div class="row">
		<div class="col-lg-8 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
			<h3>Pending Users</h3>

				<c:forEach var="user" items="${pendingUsers}">
					<c:url value="/user" var="userPage">
						<c:param name="userName" value="${user.username}" />
					</c:url>
					<div class="row brewery-details-container">
						<div class="col-lg-8">
							<p>Username: <a href="<c:out value="${userPage}"/>"><c:out value="${user.username}" /></a></p>
							<p>Brewery: <c:out value="${user.breweryName}" /></p>
							<p>Enabled: <c:out value="${user.isEnabled}" /> </p>
							<p>Click On UserName to Access Details </p>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-8 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
			<h3>Active Users</h3>

				<c:forEach var="user" items="${activeUsers}">
					<c:url value="/user" var="userPage">
						<c:param name="userName" value="${user.username}" />
					</c:url>
					<div class="row brewery-details-container">
						<div class="col-lg-8">
							<p>Username: <a href="<c:out value="${userPage}"/>"><c:out value="${user.username}" /></a></p>
							<p>Brewery: <c:out value="${user.breweryName}" /></p>
							<p>Enabled: <c:out value="${user.isEnabled}" /> </p>
							<p>Click On UserName to Access Details </p>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-8 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
			<h3>Disabled Users</h3>

				<c:forEach var="user" items="${disabledUsers}">
					<c:url value="/user" var="userPage">
						<c:param name="userName" value="${user.username}" />
					</c:url>
					<div class="row brewery-details-container">
						<div class="col-lg-8">
							<p>Username: <a href="<c:out value="${userPage}"/>"><c:out value="${user.username}" /></a></p>
							<p>Brewery: <c:out value="${user.breweryName}" /></p>
							<p>Enabled: <c:out value="${user.isEnabled}" /> </p>
							<p>Click On UserName to Access Details </p>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	
	<br/>
	<br/>
</div>
<%-- <c:param name="userName" value="${user.username}" /> --%>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />