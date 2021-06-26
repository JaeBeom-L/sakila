<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<div class="app">
	<jsp:include page="/WEB-INF/view/nav.jsp"/>
	<div id="main">
	    	<header class="mb-3">
	        	<a href="#" class="burger-btn d-block d-xl-none">
	      			<i class="bi bi-justify fs-3"></i>
	            </a>
	        </header>
	        <div class="page-heading">
                <h3>customerList</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
					    <div class="row">
					    	<form action="${pageContext.request.contextPath}/admin/getCustomerList" class="form-inline">
						    	<div class="col-1">
							    	<select name="storeId" class="custom-select" id="storeId">
							    		<option value="" ${storeId == '' ? 'selected="selected"' : '' }>전체</option>
							    		<option value="1" ${storeId == '1' ? 'selected="selected"' : '' }>1</option>
							    		<option value="2" ${storeId == '2' ? 'selected="selected"' : '' }>2</option>
							    	</select>
							    </div>
					    		<div class="col-1">
					    			<button class="btn btn-secondary">보기</button>
					    		</div>
					    	</form>
					    </div>
					    <br>
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
					    <div class="row">
						    <div class="col-7">
							    <form action="${pageContext.request.contextPath}/admin/getCustomerList" method="get">
							        <div class="row">
								        <div class="col-sm-5"><input name="searchWord" type="text" class="form-control"></div>
								       	<div class="col-sm-2"><button type="submit" class="btn btn-light rounded-pill">검색</button></div>
							        </div>
							    </form>
							</div>
							<div class="col-3"></div>
						    <div class="col-2">					    
					        	<c:if test="${currentPage > 1}">
						            <a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}" class="btn btn-light rounded-pill">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}">
						            <a href="${pageContext.request.contextPath}/admin/getCustomerList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}" class="btn btn-light rounded-pill">다음</a>
						        </c:if>
						   	</div>			        
						    <br><br>
						    <div>
						        <a href="${pageContext.request.contextPath}/admin/addCustomer" class="btn btn-outline-dark">add customer</a>
						    </div>						   
						</div>
						<br>
					</div>
				</section>
			</div>
		</div>
					    
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>  
</div>
</body>
</html>