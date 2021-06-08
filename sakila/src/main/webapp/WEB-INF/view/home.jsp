<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('btn click');
		$('#loginForm').submit();
		console.log('submit');
	});
	
	let categoryX = new Array();
	let categoryY = new Array();
	
	$.ajax({
		type:'get',
		url:'/filmCategory',
		success: function(jsonData){
			$(jsonData).each(function(index, item){
				categoryX.push(item.category);
				categoryY.push(item.totalSales);	
			});
			
			let categoryChart = new Chart(document.getElementById('categoryChart'),config);	
		}
		
	});
	

	let data = {
			  labels: categoryX,
			  datasets: [{
			    label: '카테고리 별 매출',
			    data: categoryY,
			    fill: false,
			    backgroundColor: [
			        'rgba(255, 99, 132, 0.2)',
			        'rgba(255, 159, 64, 0.2)',
			        'rgba(255, 205, 86, 0.2)',
			        'rgba(75, 192, 192, 0.2)',
			        'rgba(54, 162, 235, 0.2)',
			        'rgba(153, 102, 255, 0.2)',
			        'rgba(201, 203, 207, 0.2)',
			        'rgba(221, 12, 125, 0.2)',
			        'rgba(12, 66, 164, 0.2)',
			        'rgba(38, 102, 66, 0.2)',
			        'rgba(10, 20, 30, 0.2)',
			        'rgba(100, 20, 30, 0.2)',
			        'rgba(50, 20, 80, 0.2)',
			        'rgba(10, 20, 100, 0.2)',
			        'rgba(50, 200, 30, 0.2)',
			        'rgba(200, 200, 100, 0.2)'
			      ],
			      borderColor: [
			        'rgb(255, 99, 132)',
			        'rgb(255, 159, 64)',
			        'rgb(255, 205, 86)',
			        'rgb(75, 192, 192)',
			        'rgb(54, 162, 235)',
			        'rgb(153, 102, 255)',
			        'rgb(201, 203, 207)',
			        'rgb(221, 12, 125)',
			        'rgb(12, 66, 164)',
			        'rgb(38, 102, 66)',
			        'rgb(10, 20, 30)',
			        'rgb(100, 20, 30)',
			        'rgb(50, 20, 80)',
			        'rgb(10, 20, 100)',
			        'rgb(50, 200, 30)',
			        'rgb(200, 200, 100)'
			      ]
			  }]
			};
	
	const config = {
			  type: 'bar',
			  data: data,
			};
	
	let paymentX = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	let paymentY = [0,0,0,0,0,0,0,0,0,0,0,0];
	
	
	$.ajax({
		type:'get',
		url:'/sumPayment',
		data:{year : $('#year').val()},
		success: function(jsonData){
			$(jsonData).each(function(index, item){
				paymentY[item.month-1]=item.count;
				console.log(paymentY[item.month]);
			});
			console.log(paymentY);
			let paymentChart = new Chart(document.getElementById('paymentChart'),config2);	
		}
		
	});
	
	let data2 = {
			  labels: paymentX,
			  datasets: [{
			    label: '대여 수',
			    data: paymentY,
			    fill: false			
			  }]
			};
	
	let config2 = {
			  type: 'line',
			  data: data2,
			};
	
	$('#btn').click(function(){
		paymentY = [0,0,0,0,0,0,0,0,0,0,0,0];
		
		$('#paymentChart').remove();
		$('#paymentChartSpan').append('<canvas id="paymentChart"></canvas>');
		
		if($('#year').val() != ""){
			console.log($('#year').val());
			$.ajax({
				type:'get',
				url:'/sumPayment',
				data:{year : $('#year').val()},
				success: function(jsonData){
					$(jsonData).each(function(index, item){
						paymentY[item.month-1]=item.count;
						console.log(paymentY[item.month]);
					});
					console.log(paymentY);
					let paymentChart = new Chart(document.getElementById('paymentChart'),config2);	
				}
				
			});
			
			let data2 = {
					  labels: paymentX,
					  datasets: [{
					    label: '대여 수',
					    data: paymentY,
					    fill: false			
					  }]
					};
			
			let config2 = {
					  type: 'line',
					  data: data2,
					};
		}
		
	});
});
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/view/nav.jsp"/>
		<h1>Home</h1>

		<!-- 로그 오프 시 -->
		<c:if test="${loginStaff == null}">
			<form id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
				<div>email : </div>
				<div><input type="text" id="email" name="email"></div>
				<div>password : </div>
				<div><input type="password" id="password" name="password"></div>
				<div>
					<button type="button" id="btn" class="btn btn-secondary">로그인</button>
				</div>
			</form>
		</c:if>
		
		<!-- 로그 인 시 -->
		<c:if test="${loginStaff != null}">
			<a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
			<div>
 				<canvas id="categoryChart"></canvas>
			</div>
			<hr>
			<div>				
				<label>연도</label> <input type="text" name="year" id="year">
				<button id="btn" type="button">보기</button>
 				<span id="paymentChartSpan"><canvas id="paymentChart"></canvas></span>
			</div>
		</c:if>
		
	
	</div>
</body>
</html>