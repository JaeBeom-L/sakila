<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>staffList</title>
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
    <div class="row">
    	<h1>&nbsp;staffList&nbsp;</h1>
    	<form action="${pageContext.request.contextPath}/admin/staffList">
	    	<select name="staffSID" class="custom-select-lg" id="staffSID">
	    		<option value="" id="total" >전체</option>
	    		<option value="1" id="1">1</option>
	    		<option value="2" id="2">2</option>
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
	            	<td></td>
	            	<td>${b.phone}</td>
	            	<td>${b.city}</td>
	            	<td>${b.country}</td>
	            	<td>${b.SID}</td>
                </tr>
          	</c:forEach>
        </tbody>
    </table>
    
</div>
</body>
</html>