<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerList</title>
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
                <th>name</th>
                <th>email</th>
                <th>storeId</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="c" items="${customerList}">
                <tr>
	            	<td>${c.customerId}</td>
	            	<td>
	            		<a href="${pageContext.request.contextPath}/admin/getCustomerOne?customerId=${c.customerId}">${c.name}</a>
	            		<c:if test="${c.blackList == 'BLACK'}">
	            			<i class="fas fa-file"></i>BLACK
	            		</c:if>
	            		<c:if test="${c.VIP == 'VIP'}">
	            			<i class="fas fa-file"></i>VIP
	            		</c:if>
	            	</td>
	            	<td>${c.email}</td>
	            	<td>${c.storeId}</td>   
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
        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/addBoard">add customer</a>
    </div>
    
</div>
</body>
</html>