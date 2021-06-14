<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>getActorList</title>
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
	<div class="app">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<div id="main">
	    	<header class="mb-3">
	        	<a href="#" class="burger-btn d-block d-xl-none">
	      			<i class="bi bi-justify fs-3"></i>
	            </a>
	        </header>
	        <div class="page-heading">
                <h3>actorList</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
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
					    <div class="row">
						    <div class="col-7">
							    <form action="/admin/getActorList" method="get">
							        <div class="row">
								        <div class="col-sm-5"><input name="searchWord" type="text" class="form-control"></div>
								       	<div class="col-sm-2"><button type="submit" class="btn btn-light rounded-pill">검색</button></div>
							        </div>
							    </form>
							</div>
					    	<div class="col-3"></div>
					    	<div class="col-2">
						        <c:if test="${currentPage > 1}">
						            <a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage-1}&searchWord=${searchWord}" class="btn btn-light rounded-pill">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}">
						            <a href="${pageContext.request.contextPath}/admin/getActorList?currentPage=${currentPage+1}&searchWord=${searchWord}" class="btn btn-light rounded-pill">다음</a>
						        </c:if>
						    </div>
						    <br><br>						      				   		
						    <div>
						        <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/addActor">배우 입력</a>
						    </div>
						</div>
						<br>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>