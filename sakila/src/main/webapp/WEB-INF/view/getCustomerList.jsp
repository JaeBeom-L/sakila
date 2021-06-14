<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerList</title>
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
    	<h1>&nbsp;customerList&nbsp;</h1>
    	<form action="${pageContext.request.contextPath}/admin/getCustomerList">
	    	<select name="storeId" class="custom-select-lg" id="storeId">
	    		<option value="" ${storeId == '' ? 'selected="selected"' : '' }>전체</option>
	    		<option value="1" ${storeId == '1' ? 'selected="selected"' : '' }>1</option>
	    		<option value="2" ${storeId == '2' ? 'selected="selected"' : '' }>2</option>
	    	</select>
    		<button class="btn btn-default">보기</button>
    	</form>
    </div>
    <table class="table table-hover">
        <thead class="thead-light">
            <tr>
                <th>customerId</th>
                <th>storeId</th>
                <th>name</th>
                <th>email</th>                
                <th>rental</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="c" items="${customerList}">
                <tr>
	            	<td>${c.customerId}</td>
	            	<td>${c.storeId}</td> 
	            	<td>
	            		<a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.customerId}">${c.name}</a>
	            		<c:if test="${c.blackList == 'BLACK'}">
	            			<i class="bi bi-bootstrap-fill"></i>
	            		</c:if>
	            		<c:if test="${c.VIP == 'VIP' && c.blackList != 'BLACK'}">
	            			<i class="bi bi-heart"></i>
	            		</c:if>
	            	</td>
	            	<td>${c.email}</td>	            	  
	            	<td><a href="${pageContext.request.contextPath}/admin/addRental?customerId=${c.customerId}&storeId=${c.storeId}" class="btn btn-secondary">rental</a></td>
                </tr>
          	</c:forEach>
        </tbody>
    </table>
     
     <!-- 검색어 입력창 -->
    <form action="/admin/getCustomerList" method="get">
        <div class="row">
	        <div class="col-sm-1"><label for="searchWord">검색어 :</label> </div>
	        <div class="col-sm-3"><input name="searchWord" type="text" class="form-control"></div>
	       	<div class="col-sm-2"><button type="submit" class="btn btn-default">검색</button></div>
        </div>
    </form>
    
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addCustomer">add customer</a>
    </div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>  
</div>
</body>
</html>