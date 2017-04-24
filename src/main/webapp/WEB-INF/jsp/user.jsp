<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<div class="container" id="top-margin">
<div class="row">
	<h2><c:out value="${user.username}" /></h2>
	<p>First Name: <c:out value="${user.firstName}" /></p>
	<p>Last Name: <c:out value="${user.lastName}" /></p>
	<p>Email: <c:out value="${user.email}" /></p>
	<p>Brewery Name: <c:out value="${user.breweryName}" /></p>
	<p>Brwery Phone: <c:out value="${user.breweryPhone}" /></p>
	<p>Enabled: <c:out value="${user.isEnabled}" /></p>	
	<p>Pending: <c:out value="${user.isPending}" /></p>
</div>
<div class="row">
<form method="POST" action="${formAction}">
	<input type="hidden" name="username" value="${user.username}">
<c:choose>
	<c:when test="${user.isEnabled == true}">
	<button class="btn-primary">
		Disable User
	</button>
	</c:when>
	<c:otherwise>
		
		<button class="btn-primary">	
			Enable User
		</button>
	</c:otherwise>
</c:choose>
<sec:csrfInput/>
</</form>
</div>

</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />
