<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="/WEB-INF/jsp/common/header.jsp" />
<c:url value="/login" var="loginProcessingUrl"/>

<div class="fluid-container">
	<div class="row form-container">
		<div class="col-lg-8 col-lg-offset-2 text-center" id="top-margin">
			<h1>Login</h1>
			<form action="<c:out value=" ${loginProcessingUrl}"/>" method="post">
				<fieldset>
					<!-- <legend>Please Login</legend> -->
					<!-- use param.error assuming FormLoginConfigurer#failureUrl contains the query parameter error -->
					<c:if test="${param.error != null}">
						<div class="alert alert-danger">
							Incorrect username or password.
							<%-- <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                    		Reason: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
               			</c:if> --%>
						</div>
					</c:if>
					<!-- the configured LogoutConfigurer#logoutSuccessUrl is /login?logout and contains the query param logout -->
					<c:if test="${param.logout != null}">
						<div class="alert alert-warning">You have been logged out.</div>
					</c:if>
					<p>
						<label for="username">Username</label> <input type="text"
							id="username" name="username" />
					</p>
					<p>
						<label for="password">Password</label> <input type="password"
							id="password" name="password" />
					</p>
					<!--  <!-- if using RememberMeConfigurer make sure remember-me matches RememberMeConfigurer#rememberMeParameter -->
					<!--  <p>
     <label for="remember-me">Remember Me?</label>
     <input type="checkbox" id="remember-me" name="remember-me"/>
</p> -->
					<div>
						<button type="submit" class="btn btn-primary">Log in</button>
					</div>
					<sec:csrfInput />
				</fieldset>
			</form>
		</div>

	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />