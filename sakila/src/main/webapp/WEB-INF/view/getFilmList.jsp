<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
                <h3>FilmList</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>	    	
				    	<!-- 카테 고리별 검색 폼 -->
				    	<div class="row">
					    	<form action="${pageContext.request.contextPath}/admin/getFilmList" class="form-inline">				    		 
				    		 	<div class="col-sm-3.5"><!-- 콤보 박스 공간 -->
							    	<!--  category 콤보박스  -->
							    	<select name="category" class="custom-select" id="category">
							    		<option value="">category</option>
						 				<c:forEach var="c" items="${categoryList}">
						 					<c:if test="${c.name == category}">
						 						<option value="${c.name}" selected="selected">${c.name}</option>
						 					</c:if>
						 					<c:if test="${c.name != category}">
						 						<option value="${c.name}">${c.name}</option>
						 					</c:if>
						 				</c:forEach>
							    	</select>
							    	
							    	<!-- price 콤보박스 -->
							    	<select name="price" class="custom-select" id="price">
							    		<option value ="" ${price == '' ? 'selected="selected"' : '' }>price</option>
							    		<option value="0.99" ${price == '0.99' ? 'selected="selected"' : '' }>0.99</option>
							    		<option value="2.99" ${price == '2.99' ? 'selected="selected"' : '' }>2.99</option>
							    		<option value="4.99" ${price == '4.99' ? 'selected="selected"' : '' }>4.99</option>
							    	</select>
							    	
							    	<!-- rating 콤보박스 -->
							    	<select name="rating" class="custom-select" id="rating">
							    		<option value ="" ${rating == '' ? 'selected="selected"' : '' }>rating</option>
							    		<option value="G" ${rating == 'G' ? 'selected="selected"' : '' }>G</option>
							    		<option value="PG" ${rating == 'PG' ? 'selected="selected"' : '' }>PG</option>
							    		<option value="PG-13" ${rating == 'PG-13' ? 'selected="selected"' : '' }>PG-13</option>
							    		<option value="R" ${rating == 'R' ? 'selected="selected"' : '' }>R</option>
							    		<option value="NC-17" ${rating == 'NC-17' ? 'selected="selected"' : '' }>NC-17</option>
							    	</select>							    
							    </div>
							    <div class="col-sm-1"><!-- 제목 검색 공간 -->
							   		<label>title :</label>
							   	</div>
							   	<div class="col-sm-2">
							   		<input type="text" name="titleSearch" class="form-control">
							    </div>
							    <div class="col-sm-1"></div>
							    <div class="col-sm-1"><!-- 배우 검색 공간 -->
							    	<label>actor :</label>
							    </div>
							    <div class="col-sm-2">
							   		<input type="text" name="actorSearch" class="form-control">
							    </div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							    <div class="col-sm-1"><!-- 버튼 공간 -->
						    		<button class="btn btn-secondary">검색</button>
						    	</div>				    		
					    	</form>
				    	</div>
				    	<br>
				    	<div><!-- 검색단어가 있으면 출력 -->
				    		<c:if test="${titleSearch != null }">	    		
				    			<h5>titleSearch : ${titleSearch}</h5>
				    		</c:if>
				    		<c:if test="${actorSearch != null }">	    		
				    			<h5> actorSearch : ${actorSearch}</h5>
				    		</c:if>    		
				    	</div>
				    	 <table class="table table-hover">
					        <thead class="thead-light">
					            <tr>
					            	<th>FID</th>
					            	<th>category</th>
					                <th>title</th>		                
					                <th>price</th>
					                <th>length</th>
					                <th>rating</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:forEach var="f" items="${getFilmList}">
					                <tr>
					                	<td>${f.FID}</td>
					                	<td>${f.category}</td>
						            	<td><a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${f.FID}">${f.title}</a></td>			            	
						            	<td>${f.price}</td>
						            	<td>${f.length}</td>
						            	<td>${f.rating}</td>
					                </tr>
					          	</c:forEach>
					        </tbody>
				    	</table>
				    	<div class="row">
				    		<div class="col-10"></div>
				    		<div class="col-2">
						        <c:if test="${currentPage > 1}">
						           <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&titleSearch=${titleSearch}&price=${price}&category=${category}&rating=${rating}&actorSearch=${actorSearch}" class="btn btn-light rounded-pill">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}">
						            <a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&titleSearch=${titleSearch}&price=${price}&category=${category}&rating=${rating}&actorSearch=${actorSearch}" class="btn btn-light rounded-pill">다음</a>
						        </c:if>
						     </div>
					    </div>
					    <br>
					    <div>
			    			<a href="${pageContext.request.contextPath}/admin/addFilm" class="btn btn-outline-dark">add film</a>			    		
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