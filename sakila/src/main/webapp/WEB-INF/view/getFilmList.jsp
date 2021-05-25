<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getFilmList</title>
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
	   
	    	<h1>&nbsp;FilmList&nbsp;</h1>
	    	
	    	<!-- 카테 고리별 검색 폼 -->
	    	<form action="${pageContext.request.contextPath}/admin/getFilmList">
	    		 <div class="row">
	    		 	<div class="col-sm-3"><!-- 콤보 박스 공간 -->
				    	<!--  category 콤보박스  -->
				    	<select name="category" class="custom-select-lg" id="category">
				    		<option value="">category</option>
			 				<c:forEach var="name" items="${categoryList}">
			 					<c:if test="${name == category}">
			 						<option value="${name}" selected="selected">${name}</option>
			 					</c:if>
			 					<c:if test="${name != category}">
			 						<option value="${name}">${name}</option>
			 					</c:if>
			 				</c:forEach>
				    	</select>
				    	
				    	<!-- price 콤보박스 -->
				    	<select name="price" class="custom-select-lg" id="price">
				    		<option value ="" ${price == '' ? 'selected="selected"' : '' }>price</option>
				    		<option value="0.99" ${price == '0.99' ? 'selected="selected"' : '' }>0.99</option>
				    		<option value="2.99" ${price == '2.99' ? 'selected="selected"' : '' }>2.99</option>
				    		<option value="4.99" ${price == '4.99' ? 'selected="selected"' : '' }>4.99</option>
				    	</select>
				    	
				    	<!-- rating 콤보박스 -->
				    	<select name="rating" class="custom-select-lg" id="rating">
				    		<option value ="" ${rating == '' ? 'selected="selected"' : '' }>rating</option>
				    		<option value="G" ${rating == 'G' ? 'selected="selected"' : '' }>G</option>
				    		<option value="PG" ${rating == 'PG' ? 'selected="selected"' : '' }>PG</option>
				    		<option value="PG-13" ${rating == 'PG-13' ? 'selected="selected"' : '' }>PG-13</option>
				    		<option value="R" ${rating == 'R' ? 'selected="selected"' : '' }>R</option>
				    		<option value="NC-17" ${rating == 'NC-17' ? 'selected="selected"' : '' }>NC-17</option>
				    	</select>							    
				    </div>
				    <div class="col-sm-1"><!-- 제목 검색 공간 -->
				   		<label>title search :</label>
				   	</div>
				   	<div class="col-sm-2">
				   		<input type="text" name="titleSearch" class="form-control">
				    </div>
				    <div class="col-sm-1"><!-- 배우 검색 공간 -->
				    	<label>actor search :</label>
				    </div>
				    <div class="col-sm-2">
				   		<input type="text" name="actorSearch" class="form-control">
				    </div>
				    <div class="col-sm-2"><!-- 버튼 공간 -->
			    		<button class="btn btn-default">검색</button>
			    	</div>
	    		</div>
	    	</form>
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
	    	
	    	<ul class="pager">
		        <c:if test="${currentPage > 1}">
		            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage-1}&titleSearch=${titleSearch}&price=${price}&category=${category}&rating=${rating}&actorSearch=${actorSearch}">이전</a></li>
		        </c:if>
		        <c:if test="${currentPage < lastPage}">
		            <li class="next"><a href="${pageContext.request.contextPath}/admin/getFilmList?currentPage=${currentPage+1}&titleSearch=${titleSearch}&price=${price}&category=${category}&rating=${rating}&actorSearch=${actorSearch}">다음</a></li>
		        </c:if>
    		</ul>
	</div>
</body>
</html>