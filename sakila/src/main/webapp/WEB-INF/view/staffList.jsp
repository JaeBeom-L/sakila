<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>staffList</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
    <div class="row">
    	<h1>&nbsp;staffList&nbsp;</h1>
    	<form action="${pageContext.request.contextPath}/admin/staffList">
	    	<select name="staffSID" class="custom-select-lg" id="staffSID">
	    		<option value="" ${staffSID == '' ? 'selected="selected"' : '' }>전체</option>
	    		<option value="1" ${staffSID == '1' ? 'selected="selected"' : '' }>1</option>
	    		<option value="2" ${staffSID == '2' ? 'selected="selected"' : '' }>2</option>
	    	</select>
    		<button class="btn btn-default">보기</button>
    	</form>
    </div>
    <table class="table table-hover">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>name</th>
                <th>address</th>
                <th>ZIP CODE</th>
                <th>phone</th>
                <th>city</th>
                <th>country</th>
                <th>SID</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="b" items="${staffList}">
                <tr>
	            	<td>${b.ID}</td>
	            	<td>${b.name}</td>
	            	<td>${b.address}</td>
	            	<td>${b.zipcode}</td>
	            	<td>${b.phone}</td>
	            	<td>${b.city}</td>
	            	<td>${b.country}</td>
	            	<td>${b.SID}</td>
                </tr>
          	</c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/admin/addStaff" class="btn btn-secondary">add staff</a>
</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>