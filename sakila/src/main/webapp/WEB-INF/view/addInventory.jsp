<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>addInventory</title>
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
	
	// 정규식
	let numberCode = /^[0-9]+$/;
	
	$('#btn').click(function(){
		if($('#count').val() == ''){
			$('#countLabel').empty();
       		$('#countLabel').append('수량을 입력하세요');
       		$('#count').focus();
		}else if(!numberCode.test($('#count').val())){
			$('#countLabel').empty();
       		$('#countLabel').append('숫자를 입력하세요');
       		$('#count').focus();
		}else{
			$('#addForm').submit();
		}
	});
});
</script>
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
                <h3>addInventory</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
					    <form method="post" action="${pageContext.request.contextPath}/admin/addInventory" id="addForm">
					    	<input type="hidden" name="filmId" value="${getFilmOneMap.filmId}">
						     <table class="table">
						         <tbody>
						           	<tr>
						                <td>filmId :</td>
						                <td>${getFilmOneMap.filmId}</td>
						            </tr>
						            <tr>
						                <td>category :</td>
						                <td>${getFilmOneMap.category}</td>
						            </tr>
						        	<tr>
						                <td>title :</td>
						                <td>${getFilmOneMap.title}</td>
						            </tr>
						            <tr>
						                <td>description :</td>
						                <td>${getFilmOneMap.description}</td>
						            </tr>
						            <tr>
						                <td>releaseYear :</td>
						                <td>${getFilmOneMap.releaseYear}</td>
						            </tr>
						            <tr>
						                <td>language :</td>
						                <td>${getFilmOneMap.language}</td>
						            </tr>
						            <tr>
						                <td>rentalDuration :</td>
						                <td>${getFilmOneMap.rentalDuration}</td>
						            </tr>
						            <tr>
						                <td>rentalRate :</td>
						                <td>${getFilmOneMap.rentalRate}</td>
						            </tr>
						             <tr>
						                <td>length :</td>
						                <td>${getFilmOneMap.length}</td>
						            </tr>
						             <tr>
						                <td>replacementCost :</td>
						                <td>${getFilmOneMap.replacementCost}</td>
						            </tr>
						             <tr>
						                <td>rating :</td>
						                <td>${getFilmOneMap.rating}</td>
						            </tr>
						            <tr>
						                <td>
						                	actors :
						                </td>
						                <td>${getFilmOneMap.actors}</td>
						            </tr>
						             <tr>
						                <td>specialFeatures :</td>
						                <td>
						                	${getFilmOneMap.specialFeautres}
						                </td>
						            </tr>
						             <tr>
						                <td>lastUpdate :</td>
						                <td>${getFilmOneMap.lastUpdate}</td>
						            </tr>
						            
								    	
								    	<tr>
								    		<td>storeId</td>
								    		<td>
								    			<select name="storeId" class="form-control">
										    		<option value="1">1</option>
										    		<option value="2">2</option>
								    			</select>
								    		</td>
								    	</tr>
								    	<tr>
								    		<td>
								    			count
								    			<label id="countLabel" style="color:red"></label>
								    		</td>
								    		<td>
								    			<input type="text" name="count" class="form-control" id="count">
								    		</td>
								    	</tr>
						        </tbody>
						    </table>
						    <button class="btn btn-secondary" id="btn" type="button">add</button>
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