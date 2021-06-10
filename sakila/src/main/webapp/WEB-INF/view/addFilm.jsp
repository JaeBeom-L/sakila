<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jquery를 사용하기위한 CDN주소 -->
<style>
	.span{color: red}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<h1>add Film</h1>
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
</body>
</html>