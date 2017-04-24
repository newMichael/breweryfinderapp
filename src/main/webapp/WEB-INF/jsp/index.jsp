<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:import url="/WEB-INF/jsp/common/header.jsp" />


<div class="row background col-centered">
	<div class="col-xs-12 landing-page container-fluid center-block">
	<c:url var="logo" value ="img/belch.png"></c:url>
	<div class="container-fluid col-centered">
		<img src="${logo}" class="logo" />
	</div>
		<div class="user-login feature col-md-4 col-xs-offset-1">
			<div class="center-block">
				<h3>User Login</h3>
				<c:url var="formAction" value="" />
				<form action="${formAction}" id="user-login" method="post">	
					<p>Username</p>
					<input id="user-name" name="user-name" placeholder="username" type="text" value="" /><br/>
					<p>Password</p>
					<input id="user-password" name="user-password" placeholder="password" type="text" value="" /><br/>
					<button class="btn btn-sx btn-md">Submit</button>
				</form> 
			</div>
		</div>
		<div class="brewer-login feature col-md-4 col-xs-offset-1">
			<div class="center-block">
				<h3>Brewery Login</h3>
				<c:url var="formAction" value="" />
				<form action="${formAction}" id="brewert-login" method="post">	
					<p>Username</p>
					<input id="brewery-name" name="brewery-name" placeholder="username" type="text" value="" /><br/>
					<p>Password</p>
					<input id="brewery-password" name="brewery-password" placeholder="password" type="text" value="" /><br/>
					<button class="btn btn-sx btn-md">Submit</button>
				</form> 
			</div>
		</div>
	</div>
</div>


<c:import url="/WEB-INF/jsp/common/footer.jsp" />