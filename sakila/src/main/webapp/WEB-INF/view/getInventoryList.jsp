<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getInventoryList</title>
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
                <h3>InventoryList</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>	    	
				    	<!-- 카테 고리별 검색 폼 -->
				    	<div class="row">
					    	<form action="${pageContext.request.contextPath}/admin/getInventoryList" class="form-inline">				  		 
				    		 	<div class="col-1"><!-- 콤보 박스 공간 -->
							    	<select name="storeId" class="custom-select-lg" id="storeId">
							    		<option value="" ${storeId == '' ? 'selected="selected"' : '' }>전체</option>
							    		<option value="1" ${storeId == '1' ? 'selected="selected"' : '' }>1</option>
							    		<option value="2" ${storeId == '2' ? 'selected="selected"' : '' }>2</option>
				    				</select>					    
							    </div>
							    <div class="col-2"><!-- 제목 검색 공간 -->
							   		<label>title search :</label>
							   	</div>
							   	<div class="col-3">
							   		<input type="text" name="searchWord" class="form-control">
							    </div>
							    <div class="col-2"><!-- 제목 검색 공간 -->
							   		<label>inventoryId search :</label>
							   	</div>
							    <div class="col-3">
							   		<input type="text" name="inventoryId" class="form-control">
							    </div>
							    <div class="col-1"><!-- 버튼 공간 -->
						    		<button class="btn btn-secondary">검색</button>
						    	</div>				    		
					    	</form>
				    	</div>
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
				    	<div class="row">
					    	<div class="col-10"></div>	
					    	<div class="col-2">				   				    	
						        <c:if test="${currentPage > 1}">
						            <a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage-1}&searchWord=${searchWord}&storeId=${storeId}&inventoryId=${inventoryId}" class="btn btn-light rounded-pill">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}">
						            <a href="${pageContext.request.contextPath}/admin/getInventoryList?currentPage=${currentPage+1}&searchWord=${searchWord}&storeId=${storeId}&inventoryId=${inventoryId}" class="btn btn-light rounded-pill">다음</a>
						        </c:if>
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