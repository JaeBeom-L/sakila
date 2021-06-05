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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#amountBtn').click(function(){
		if($('#inventoryId').val() == ''){
			alert('inventoryId 입력');
		}else{
			$.ajax({
				type:'get',
				url:'/amount',
				data:{inventoryId : $('#inventoryId').val()},
				success: function(jsonData) {
					$('#amount').append('<input type="text" name="amount" value="'+jsonData+'" class="form-control">');
					$('#rentalBtn').append('<button id="btn" class="btn btn-secondary">대여</button>');
					$('#amountBtn').remove();
				}	
			});			
		}		
	});
	
	$('#btn').click(function(){
		$('#addForm').submit();
	});
	
	
});
</script>
<title>addRental</title>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<h1>add Rental</h1>
		<form method="post" action="${pageContext.request.contextPath}/admin/addRental" id="addForm">
			<input type="hidden" name="customerId" value="${customerId}">
			<table class="table table-hover">
				<tr>
					<td>staff</td>
					<td>
						<select name="staffId" id="staffId" class="form-control">
							<c:forEach var="s" items="${staffList}">
								<option value="${s.SID}">${s.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>inventoryId</td>
					<td>
						<input type="text" name="inventoryId" id="inventoryId" class="form-control">
					</td>
				</tr>
				<tr>
					<td>amount</td>
					<td>
						<span id="amount"></span>
					</td>
				</tr>
			</table>		
			<button id="amountBtn" class="btn btn-secondary" type="button">계산</button>
			<span id="rentalBtn"></span>
		</form>		
	</div>
</body>
</html>