<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />
<sec:authorize access="hasRole('ROLE_ADMIN')" var="admin"/>
<sec:authorize access="hasRole('ROLE_USER')" var="user" />
<div class = "fluid-container">
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 text-center" id="top-margin">
			<c:choose>
				<c:when test="${user}">
					<h3>Brewery Information Has Been Updated</h3>
					<sec:authentication property="principal.username" var="userName"/>
					<c:url value="/myBrewery" var="myBrewery">
						<c:param name="username" value="${userName}" />
					</c:url>
					<a href="<c:out value="${myBrewery}" />">
						<input type="button" value="Ok!" name="Ok!"/>
					</a>
				</c:when>
				<c:otherwise>
					<h3>User and Brewery Have Been Created</h3>
					<sec:authentication property="principal.username" var="userName"/>
					<c:url value="/myBrewery" var="myBrewery">
						<c:param name="username" value="${userName}" />
					</c:url>
					<a href="<c:out value="${myBrewery}" />">
						<input type="button" value="Ok" name="Ok"/>
					</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />