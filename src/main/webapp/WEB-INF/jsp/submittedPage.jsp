<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />

<div class = "fluid-container" >
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2 text-center" id="top-margin">
			<h3>Thank you for submitting your request. Your user account is pending approval</h3>
			
			<c:url value="/" var="home" />
			<a href="<c:out value="${home}" />">
				<input type="button" value="Ok!" name="Ok!"/>
			</a>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/common/footer.jsp" />