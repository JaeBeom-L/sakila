<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getInventoryList</title>
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
	   
	    	<h1>&nbsp;InventoryList&nbsp;</h1>
	    	
	    	<!-- 카테 고리별 검색 폼 -->
	    	<form action="${pageContext.request.contextPath}/admin/getInventoryList">
	    		 <div class="row">
	    		 	<div class="col-sm-1"><!-- 콤보 박스 공간 -->
				    	<select name="storeId" class="custom-select-lg" id="storeId">
				    		<option value="" ${storeId == '' ? 'selected="selected"' : '' }>전체</option>
				    		<option value="1" ${storeId == '1' ? 'selected="selected"' : '' }>1</option>
				    		<option value="2" ${storeId == '2' ? 'selected="selected"' : '' }>2</option>
	    				</select>					    
				    </div>
				    <div class="col-sm-1"><!-- 제목 검색 공간 -->
				   		<label>title search :</label>
				   	</div>
				   	<div class="col-sm-2">
				   		<input type="text" name="searchWord" class="form-control">
				    </div>
				    <div class="col-sm-1.5"><!-- 제목 검색 공간 -->
				   		<label>inventoryId search :</label>
				   	</div>
				    <div class="col-sm-2">
				   		<input type="text" name="inventoryId" class="form-control">
				    </div>
				    <div class="col-sm-2"><!-- 버튼 공간 -->
			    		<button class="btn btn-default">검색</button>
			    	</div>
	    		</div>
	    	</form>
	    	<br>
	    	<div><!-- 검색단어가 있으면 출력 -->
	    		<c:if test="${searchWord != null }">	    		
	    			<h5>titleSearch : ${searchWord}</h5>
	    		</c:if>
	    		<c:if test="${inventoryId != null }">	    		
	    			<h5> inventoryId : ${inventoryId}</h5>
	    		</c:if>    		
	    	</div>
	    	 <table class="table table-hover">
		        <thead class="thead-light">
		            <tr>
		            	<th>inventoryId</th>
		            	<th>storeId</th>
		            	<th>title</th>		                
		                <th>rentalRate</th>
		                <th>rating</th>
		                <th>반납</th>	
		                <th>연체(DAY)</th>		                
		            </tr>
		        </thead>
		        <tbody>
		        	<c:forEach var="inventory" items="${inventoryList}">
		                <c:if test="${inventory.returnDate == 'T' && inventory.rentalDate != 'T' }">
			                <tr style="color:red">
			                	<td>${inventory.inventoryId}</td>
			                	<td>${inventory.storeId}</td>
			                	<td>
			                		${inventory.title}
			                		<a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${inventory.filmId}" style="color:red">[filmInfo]</a>
			                		<a href="${pageContext.request.contextPath}/admin/getRentalListByInventoryId?inventoryId=${inventory.inventoryId}&title=${inventory.title}" style="color:red">[rentalInfo]</a>
			                	</td>								
								<td>${inventory.rentalRate}</td>
								<td>${inventory.rating}</td>
								<td>
									<a href="${pageContext.request.contextPath}/admin/modifyReturnDate?inventoryId=${inventory.inventoryId}&amount=${inventory.rentalRate}&overdue=${inventory.overdue}" class="btn btn-secondary">반납</a>
								</td>
								<td>${inventory.overdue}</td>
			                </tr>
			            </c:if>
			            <c:if test="${inventory.returnDate != 'T' || (inventory.returnDate == 'T' && inventory.rentalDate == 'T')}">
			                <tr>
			                	<td>${inventory.inventoryId}</td>
			                	<td>${inventory.storeId}</td>
			                	<td>
			                		${inventory.title}
			                		<a href="${pageContext.request.contextPath}/admin/getFilmOne?FID=${inventory.filmId}">[filmInfo]</a>
			                		<a href="${pageContext.request.contextPath}/admin/getRentalListByInventoryId?inventoryId=${inventory.inventoryId}&title=${inventory.title}">[rentalInfo]</a>
			                	</td>								
								<td>${inventory.rentalRate}</td>
								<td>${inventory.rating}</td>
								<td></td>
								<td></td>
			                </tr>
			            </c:if>
		          	</c:forEach>
		        </tbody>
	    	</table>
	    	
	    	<ul class="pager">
		        <c:if test="${currentPage > 1}">
		            <li class="previous"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}&inventoryId=${inventoryId}">이전</a></li>
		        </c:if>
		        <c:if test="${currentPage < lastPage}">
		            <li class="next"><a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}&inventoryId=${inventoryId}">다음</a></li>
		        </c:if>
    		</ul>
	</div>
</body>
</html>