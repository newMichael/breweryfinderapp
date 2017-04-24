<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<img src="${imageTest}" />
<div class="text-center register-form" id="top-margin">
	
	
	<form action="${formAction}" method="POST" enctype="multipart/form-data">
		<div class="form-group">
			<c:url value="/fileUpload" var="formAction" />
			<sec:authentication property="principal.username" var="username"/>
					<label for="file">Upload Photo</label> 
					<input type="file" class="file" name="file"/>
					<input type="hidden" name="username" value="${username}"/>
					<input type="hidden" name="type" value="1" />
					<input type="hidden" name = "identifier" value="${brewery.breweryId}" />
					<sec:csrfInput />
			<button type="submit" id="registerButton" class="btn btn-primary">Upload</button>
		</div>
	</form>
</div>



<c:import url="/WEB-INF/jsp/common/footer.jsp" />