<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addActors</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>   
	    
	    <form method="post" action="${pageContext.request.contextPath}/admin/addActors">
	    	<h1>
	    		&nbsp;addActors&nbsp;
	    		<button id="btn" class="btn btn-secondary">
	    			modify actors
	    		</button>
	    	</h1>
	    	<input type="hidden" name="FID" value="${FID}">
	    		<h1>A</h1>
			   	<c:forEach  var="i" begin="0" end="${list.size()-1}" step="1">
			   		<c:if test="${list[i].exist == 'T' }"><!-- film_actor에 있을 때 -->
			   			<input type="checkbox" value="${list[i].actorId}" name="ck" checked="checked">${list[i].name}
			   		</c:if>
			   		<c:if test="${list[i].exist == 'F' }"><!-- film_actor에 없을 때 -->
			   			<input type="checkbox" value="${list[i].actorId}" name="ck">${list[i].name}
			   		</c:if>
			   		<c:if test="${list[i].name.substring(0,1) != list[i+1].name.substring(0,1)}">
			   			<br><br><hr><h1>${list[i+1].name.substring(0,1)}</h1>
			   		</c:if>
			   	</c:forEach>	    	
	    </form>	    	
	</div>
</body>
</html>