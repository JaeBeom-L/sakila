<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>getFilmOne</title>
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
	    <div>
		    <h1>FilmOne</h1>
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
		                <td>languageId :</td>
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
		                <td>actors :</td>
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
		   </div>
	   </div>
</body>
</html>