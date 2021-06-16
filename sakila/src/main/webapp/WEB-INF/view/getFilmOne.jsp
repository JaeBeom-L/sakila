<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getFilmOne</title>
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
                <h3>FilmOne</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
					    <div>
					    	<div class="row">
						    	<h3><a href="${pageContext.request.contextPath}/admin/addInventory?filmId=${getFilmOneMap.filmId}" class="btn btn-secondary">add inventory</a></h3>
						    </div>
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
						                	<a href="${pageContext.request.contextPath}/admin/addActors?FID=${getFilmOneMap.filmId}"><button class="btn btn-secondary">modify actors</button></a>	
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
						                <td>SID1 stock :</td>
						                <td>${fisrtStoreFilmCount}</td>
						            </tr>
						            <tr>
						                <td>SID2 stock :</td>
						                <td>${secondStoreFilmCount}</td>
						            </tr>
						        </tbody>
						    </table>
						    <a href="${pageContext.request.contextPath}/admin/modifyFilm?filmId=${getFilmOneMap.filmId}" class="btn btn-secondary">수정</a>
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