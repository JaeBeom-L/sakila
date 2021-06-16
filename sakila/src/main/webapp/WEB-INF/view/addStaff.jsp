<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
	.span{color: red}
</style>
<script>
$(document).ready(function(){
	$.ajax({
		type:'get',
		url:'/country',
		success: function(jsonData) {
			$('#country').empty();
			$(jsonData).each(function(index, item) {
				$('#country').append(
					'<option value="'+item.countryId+'">'+item.country+'</option>'
				);
			});
		}
	});
	
	$('#country').change(function(){
		$.ajax({
			type:'get',
			url:'/city',
			data:{countryId : $('#country').val()},
			success: function(jsonData) {
				$('#city').empty();
				$(jsonData).each(function(index, item) {
					$('#city').append(
						'<option value="'+item.cityId+'">'+item.city+'</option>'
					);
				});
			}
		}); 
	});
	
	// 정규식
	let numberCode = /^[0-9]+$/;
	let emailCode = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	
	$('#btn').click(function() {
		console.log(numberCode.test($('#postalCode').val()));
       	if($('#firstName').val() == ''){
       		$('#firstNameCheck').empty();
       		$('#firstNameCheck').append('firstName을 입력해주세요');
       		$('#fisrtName').focus();
       	}else if($('#lastName').val() == ''){
       		$('#lastNameCheck').empty();
       		$('#lastNameCheck').append('lastName을 입력해주세요');
       		$('#lastName').focus();
       	}else if($('#picture').val() == ''){
       		$('#pictureCheck').empty();
       		$('#pictureCheck').append('picture를 등록해주세요');
       		$('#picture').focus();
       	}else if($('#email').val() == ''){
       		$('#emailCheck').empty();
       		$('#emailCheck').append('email을 입력해주세요');
       		$('#picture').focus();
       	}else if(!emailCode.test($('#email').val())){
       		$('#emailCheck').empty();
       		$('#emailCheck').append('email을 정확히 입력해주세요');
       		$('#picture').focus();       	
		}else if($('#password').val() == ''){
			$('#passwordCheck').empty();
       		$('#passwordCheck').append('password를 입력해주세요');
       		$('#password').focus();
       	}else if($('#password').val().length < 8){
       		$('#passwordCheck').empty();
       		$('#passwordCheck').append('password를 8자 이상 작성하세요');
       		$('#password').focus();      	       	
		}else if($('#username').val() == ''){
			$('#usernameCheck').empty();
       		$('#usernameCheck').append('username을 입력해주세요');
       		$('#username').focus();
       	}else if($('#city').text() == ''){
       		$('#addressCheck').empty();
       		$('#addressCheck').append('city를 입력해주세요');
       	}else if($('#district').val() == ''){
       		$('#districtCheck').empty();
       		$('#districtCheck').append('district를 입력해주세요');
       		$('#district').focus();
       	}else if($('#postalCode').val() == ''){
       		$('#postalCodeCheck').empty();
       		$('#postalCodeCheck').append('postalCode를 입력해주세요');
       		$('#postalCode').focus();
       	}else if(!numberCode.test($('#postalCode').val())){
       		$('#postalCodeCheck').empty();
       		$('#postalCodeCheck').append('postalCode를 정확하게 입력해주세요');
       		$('#postalCode').focus();      	
		}else if($('#phone').val() == ''){
			$('#phoneCheck').empty();
       		$('#phoneCheck').append('phone를 입력해주세요');
       		$('#phone').focus();
       	}else if(!numberCode.test($('#phone').val())){
       		$('#phoneCheck').empty();
       		$('#phoneCheck').append('phone를 정확히 입력해주세요');
       		$('#phone').focus();		
		}else{
       		$('#addForm').submit();
       	}
       	
       	
    });
});
</script>
<title>add staff</title>
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
                <h3>add staff</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
				        <form id="addForm" action="${pageContext.request.contextPath}/admin/addStaff" method="post">    
				            <div class="form-group">
				                <label for="firstName">firstName :</label><span id="firstNameCheck" class="span"></span> <input class="form-control" name="staff.firstName" id="firstName" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="lastName">lastName :</label><span id="lastNameCheck" class="span"></span> <input class="form-control" name="staff.lastName" id="lastName" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="lastName">picture :</label><span id="pictureCheck" class="span"></span> <input name="staff.picture" id="picture" type="file" class="form-control"/>
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="email">email :<span id="emailCheck" class="span"></span></label> <input class="form-control" name="staff.email" id="email" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="password">password :</label> <span id="passwordCheck" class="span"></span><input class="form-control" name="staff.password" id="password" type="password" />
				            </div>
				            <br>
				            <div class="form-group">
				            	<label for="storeId">storeId :</label>
				                <select name="staff.storeId" id="storeId" class="form-control">               	
				                	<option value="1">1</option>
				                	<option value="2">2</option>
				                </select>
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="username">username :</label><span id="usernameCheck" class="span"></span> <input class="form-control" name="staff.username" id="username" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="username">select Adress :</label>
				                <select name="country" id="country" class="form-control"></select>
				                <br>
								<select name="address.cityId" id="city" class="form-control"></select>
								<br>
								<span id="addressCheck" class="span"></span>
								<input class="form-control" name="address.address" id="address" type="text" value="adress" />
								<br>
								<input class="form-control" name="address.address2" id="address2" type="text" value="adress2" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="district">district :</label> <span id="districtCheck" class="span"></span><input class="form-control" name="address.district" id="district" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="postalCode">postalCode :</label> <span id="postalCodeCheck" class="span"></span><input class="form-control" name="address.postalCode" id="postalCode" type="text" />
				            </div>
				            <br>
				            <div class="form-group">
				                <label for="phone">phone :</label> <span id="phoneCheck" class="span"></span><input class="form-control" name="address.phone" id="phone" type="text" />
				            </div>
				            <br>
				            <button id="btn" class="btn btn-secondary" type="button">add</button>
				        </form>
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