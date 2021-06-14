<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getBoardList</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
	    <h1>actorList</h1>
	    <table class="table table-hover">
	        <thead class="thead-light">
	            <tr>
	                <th>actorId</th>
	                <th>name</th>
	                <th>filmInfo</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="a" items="${actorList}">
	                <tr>
	                    <td>${a.actorId}</td>
	                    <td>${a.name}</td>                  
	                    <td>${a.filmInfo}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    
	    <!-- 검색어 입력창 -->
	    <form action="/admin/getActorList" method="get">
	        <div class="row">
		        <div class="col-sm-1"><label for="searchWord">actor search :</label> </div>
		        <div class="col-sm-3"><input name="searchWord" type="text" class="form-control"></div>
		       	<div class="col-sm-2"><button type="submit" class="btn btn-default">검색</button></div>
	        </div>
	    </form>
	    
	    <ul class="pager">
	        <c:if test="${currentPage > 1}">
	            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a></li>
	        </c:if>
	        <c:if test="${currentPage < lastPage}">
	            <li class="next"><a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a></li>
	        </c:if>
   		 </ul>
	    <div>
	        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addActor">배우 입력</a>
	    </div>
	</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>