<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/favicon.svg" type="image/x-icon">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>modifyFilm</title>
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
                <h3>modify Film</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
						<form method="post" action="${pageContext.request.contextPath}/admin/modifyFilm">
							<input type="hidden" name="film.filmId" value="${filmId}">
							<table class="table table-hover">
								<tr>
									<td>title</td>
									<td>
										<input type="text" name="film.title" id="title" class="form-control" value="${filmOneMap.title}">
									</td>
								</tr>
								<tr>
									<td>category</td>
									<td>
										<select name="category.categoryId" id ="categoryId" class="form-control">
											<c:forEach var="c" items="${categoryList}">
												<c:if test="${filmOneMap.category == c.name}">
													<option value="${c.categoryId}" selected="selected">${c.name}</option>
												</c:if>
												<c:if test="${filmOneMap.category != c.name}">
													<option value="${c.categoryId}">${c.name}</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>description</td>
									<td>
										<textarea rows="5" cols="100" name="film.description" id="description" class="form-control">${filmOneMap.description}</textarea>
									</td>
								</tr>
								<tr>
									<td>releaseYear</td>
									<td>
										<input type="text" name="film.releaseYear" id="releaseYear" class="form-control" readonly="readonly" value="${filmOneMap.releaseYear}">
									</td>
								</tr>
								<tr>
									<td>language</td>
									<td>
										<input type="text" name="language" id="language" class="form-control" readonly="readonly" value="${filmOneMap.language}">
									</td>
								</tr>
								<tr>
									<td>originalLanguage</td>
									<td>
										<input type="text" name="originalLanguage" id="originalLanguage" class="form-control" readonly="readonly" value="${filmOneMap.originalLanguage}">
									</td>
								</tr>
								<tr>
									<td>rentalDuration</td>
									<td>
										<input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control" value="3" readonly="readonly" value="${filmOneMap.rentalDuration}">					
									</td>
								</tr>
								<tr>
									<td>rentalRate</td>
									<td>
										<select name="film.rentalRate" id ="rentalRate" class="form-control">
											<option value="0.99" ${filmOneMap.rentalRate == '0.99' ? 'selected="selected"' : '' }>0.99</option>
											<option value="2.99" ${filmOneMap.rentalRate == '2.99' ? 'selected="selected"' : '' }>2.99</option>
											<option value="4.99" ${filmOneMap.rentalRate == '4.99' ? 'selected="selected"' : '' }>4.99</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>length</td>
									<td>
										<input type="text" name="film.length" id="length" class="form-control" value="${filmOneMap.length}">
									</td>
								</tr>
								<tr>
									<td>replacementCost</td>
									<td>
										<input type="text" name="film.replacementCost" id="replacementCost" class="form-control" value="19.99" readonly="readonly" value="${filmOneMap.replacementCost}">
									</td>
								</tr>
								<tr>
									<td>rating</td>
									<td>
										<select name="film.rating" id ="rating" class="form-control">
											<option value="G" ${filmOneMap.rating == 'G' ? 'selected="selected"' : '' }>G</option>
											<option value="PG" ${filmOneMap.rating == 'PG' ? 'selected="selected"' : '' }>PG</option>
											<option value="PG-13" ${filmOneMap.rating == 'PG-13' ? 'selected="selected"' : '' }>PG-13</option>
											<option value="R" ${filmOneMap.rating == 'R' ? 'selected="selected"' : '' }>R</option>
											<option value="NC-17" ${filmOneMap.rating == 'NC-17' ? 'selected="selected"' : '' }>NC-17</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>specialFeatures</td>
									<td>
										<input type="text" name="specialFeatures" id="specialFeatures" class="form-control" readonly="readonly" value="${filmOneMap.specialFeautres}">
									</td>
								</tr>
							</table>
							
							<button id="btn" class="btn btn-secondary">수정</button>
						</form>
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