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
<script>
$(document).ready(function(){
	
	let numberCode = /^[0-9]+$/;
	
	$('#btn').click(function(){
		if($('#title').val() == ''){
			$('#labelTitle').empty();
			$('#labelTitle').append('제목을 입력하세요');
			$('#title').focus();
		}else if($('#releaseYear').val() == ''){
			$('#labelReleaseYear').empty();
			$('#labelReleaseYear').append('발매년도를 입력하세요');
			$('#releaseYear').focus();
		}else if($('#rentalDuration').val() == ''){
			$('#labelRentalDuration').empty();
			$('#labelRentalDuration').append('대여기간을 입력하세요')
			$('#rentalDuration').focus();
		}else if($('#length').val() == ''){
			$('#labelLength').empty();
			$('#labelLength').append('영화 상영시간을 입력하세요')
			$('#length').focus();
		}else if($('#replacementCost').val() == ''){
			$('#labelReplacementCost').empty();
			$('#labelReplacementCost').append('배상 금액을 입력하세요')
			$('#replacementCost').focus();
		}else if(!numberCode.test($('#releaseYear').val())){
			$('#labelReleaseYear').empty();
			$('#labelReleaseYear').append('숫자를 입력하세요');
			$('#releaseYear').focus();
		}else if(!numberCode.test($('#rentalDuration').val())){
			$('#labelRentalDuration').empty();
			$('#labelRentalDuration').append('숫자를 입력하세요')
			$('#rentalDuration').focus();		
		}else if(!numberCode.test($('#length').val())){
			$('#labelLength').empty();
			$('#labelLength').append('숫자를 입력하세요')
			$('#length').focus();
		}else if(!numberCode.test($('#replacementCost').val())){
			$('#labelReplacementCost').empty();
			$('#labelReplacementCost').append('숫자를 입력하세요')
			$('#replacementCost').focus();
		}else{
			$('#addForm').submit();
		}
	});
});
</script>
<title>addFilm</title>
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
                <h3>add Film</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
						<form method="post" action="${pageContext.request.contextPath}/admin/addFilm" id="addForm">
							<table class="table table-hover">
								<tr>
									<td>
										title
										<span class="span"><label id="labelTitle"></label></span>
									</td>
									<td>
										<input type="text" name="film.title" id="title" class="form-control">
									</td>
								</tr>
								<tr>
									<td>category</td>
									<td>
										<select name="category.categoryId" id ="categoryId" class="form-control">
											<c:forEach var="c" items="${categoryList}">
												<option value="${c.categoryId}">${c.name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>description</td>
									<td>
										<textarea rows="5" cols="100" name="film.description" id="description" class="form-control"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										releaseYear
										<span class="span"><label id="labelReleaseYear"></label></span>
									</td>
									<td>
										<input type="text" name="film.releaseYear" id="releaseYear" class="form-control">
									</td>
								</tr>
								<tr>
									<td>language</td>
									<td>
										<select name="film.languageId" id ="language" class="form-control">
											<c:forEach var="lang" items="${languageList}">
												<option value="${lang.languageId}">${lang.name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>originalLanguage</td>
									<td>
										<select name="film.originalLanguageId" id ="originalLanguage" class="form-control">
											<c:forEach var="lang" items="${languageList}">
												<option value="${lang.languageId}">${lang.name}</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										rentalDuration
										<span class="span"><label id="labelRentalDuration"></label></span>
									</td>
									<td>
										<input type="text" name="film.rentalDuration" id="rentalDuration" class="form-control" value="3">					
									</td>
								</tr>
								<tr>
									<td>rentalRate</td>
									<td>
										<select name="film.rentalRate" class="form-control">
											<option value="0.99">0.99</option>
											<option value="2.99">2.99</option>
											<option value="4.99">4.99</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										length
										<span class="span"><label id="labelLength"></label></span>
									</td>
									<td>
										<input type="text" name="film.length" id="length" class="form-control">
									</td>
								</tr>
								<tr>
									<td>
										replacementCost
										<span class="span"><label id="labelReplacementCost"></label></span>
									</td>
									<td>
										<input type="text" name="film.replacementCost" id="replacementCost" class="form-control" value="19.99">
									</td>
								</tr>
								<tr>
									<td>rating</td>
									<td>
										<select name="film.rating" id ="rating" class="form-control">
											<option value="G">G</option>
											<option value="PG">PG</option>
											<option value="PG-13">PG-13</option>
											<option value="R">R</option>
											<option value="NC-17">NC-17</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>specialFeatures</td>
									<td>
										<input type="checkbox" name="specialFeatures" value="Trailers">Trailers&nbsp;
										<input type="checkbox" name="specialFeatures" value="Commentaries">Commentaries&nbsp;
										<input type="checkbox" name="specialFeatures" value="Deleted Scenes">Deleted Scenes&nbsp;
										<input type="checkbox" name="specialFeatures" value="Behind the Scenes">Behind the Scenes
									</td>
								</tr>
							</table>							
							<button id="btn" class="btn btn-secondary" type="button">등록</button>
						</form>
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