<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/js" var="jsHref" />
    <c:url value="/css/style.css" var="cssStyle" />
    <c:url value="/vendor" var="vendor" />
    <c:url value="/css" var="cssHref" />

    <div class="navbar-fixed-bottom">
    		<footer>
			<p class="copyright">&copy; Team Alpha</p>
    		</footer>
	</div>
	
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="${vendor}/scrollreveal/scrollreveal.min.js"></script>
    <script src="${vendor}/magnific-popup/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
    <script type="text/javascript" src="${jsHref}/slick.js"></script>

    <!-- Theme JavaScript -->
    <script src="${jsHref}/creative.js"></script>

</body>

</html>