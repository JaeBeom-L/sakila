<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addCustomer</title>
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
       	}else if($('#email').val() == ''){
       		$('#emailCheck').empty();
       		$('#emailCheck').append('email을 입력해주세요');
       		$('#picture').focus();
       	}else if(!emailCode.test($('#email').val())){
       		$('#emailCheck').empty();
       		$('#emailCheck').append('email을 정확히 입력해주세요');
       		$('#picture').focus();       	
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
<title>add customer</title>
</head>
<body>
    <div class="container">
    	<jsp:include page="/WEB-INF/view/nav.jsp"/>
        <h1>add customer</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addCustomer" method="post">    
            <div class="form-group">
                <label for="firstName">firstName :</label><span id="firstNameCheck" class="span"></span> <input class="form-control" name="customer.firstName" id="firstName" type="text" />
            </div>
            <div class="form-group">
                <label for="lastName">lastName :</label><span id="lastNameCheck" class="span"></span> <input class="form-control" name="customer.lastName" id="lastName" type="text" />
            </div>
            <div class="form-group">
                <label for="email">email :</label><span id="emailCheck" class="span"></span> <input class="form-control" name="customer.email" id="email" type="text" />
            </div>
            <div class="form-group">
            	<label for="storeId">storeId :</label>
                <select name="customer.storeId" id="storeId" class="form-control">               	
                	<option value="1">1</option>
                	<option value="2">2</option>
                </select>
            </div>
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
            <div class="form-group">
                <label for="district">district :</label> <span id="districtCheck" class="span"></span><input class="form-control" name="address.district" id="district" type="text" />
            </div>
            <div class="form-group">
                <label for="postalCode">postalCode :</label> <span id="postalCodeCheck" class="span"></span><input class="form-control" name="address.postalCode" id="postalCode" type="text" />
            </div>
            <div class="form-group">
                <label for="phone">phone :</label> <span id="phoneCheck" class="span"></span><input class="form-control" name="address.phone" id="phone" type="text" />
            </div>
            <button id="btn" class="btn btn-secondary" type="button">add</button>
        </form>
    </div>
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>