<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
       		$('#firstNameCheck').append('firstName을 입력해주세요');
       		$('#fisrtName').focus();
       	}else if($('#lastName').val() == ''){
       		$('#lastNameCheck').append('lastName을 입력해주세요');
       		$('#lastName').focus();
       	}else if($('#picture').val() == ''){
       		$('#pictureCheck').append('picture를 등록해주세요');
       		$('#picture').focus();
       	}else if($('#email').val() == ''){
       		$('#emailCheck').append('email을 입력해주세요');
       		$('#picture').focus();
       	}else if(!emailCode.test($('#email').val())){
       		$('#emailCheck').append('email을 정확히 입력해주세요');
       		$('#picture').focus();       	
		}else if($('#password').val() == ''){
       		$('#passwordCheck').append('password를 입력해주세요');
       		$('#password').focus();
       	}else if($('#password').val().length < 8){
       		$('#passwordCheck').append('password를 8자 이상 작성하세요');
       		$('#password').focus();      	       	
		}else if($('#username').val() == ''){
       		$('#usernameCheck').append('username을 입력해주세요');
       		$('#username').focus();
       	}else if($('#city').text() == ''){
       		$('#addressCheck').append('city를 입력해주세요');
       	}else if($('#district').val() == ''){
       		$('#districtCheck').append('district를 입력해주세요');
       		$('#district').focus();
       	}else if($('#postalCode').val() == ''){
       		$('#postalCodeCheck').append('postalCode를 입력해주세요');
       		$('#postalCode').focus();
       	}else if(!numberCode.test($('#postalCode').val())){
       		$('#postalCodeCheck').append('postalCode를 정확하게 입력해주세요');
       		$('#postalCode').focus();      	
		}else if($('#phone').val() == ''){
       		$('#phoneCheck').append('phone를 입력해주세요');
       		$('#phone').focus();
       	}else if(!numberCode.test($('#phone').val())){
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
    <div class="container">
    	<jsp:include page="/WEB-INF/view/nav.jsp"/>
        <h1>add staff</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addStaff" method="post">    
            <div class="form-group">
                <label for="firstName">firstName :</label><span id="firstNameCheck" class="span"></span> <input class="form-control" name="staff.firstName" id="firstName" type="text" />
            </div>
            <div class="form-group">
                <label for="lastName">lastName :</label><span id="lastNameCheck" class="span"></span> <input class="form-control" name="staff.lastName" id="lastName" type="text" />
            </div>
            <div class="form-group">
                <label for="lastName">picture :</label><span id="pictureCheck" class="span"></span> <input name="staff.picture" id="picture" type="file" />
            </div>
            <div class="form-group">
                <label for="email">email :<span id="emailCheck" class="span"></span></label> <input class="form-control" name="staff.email" id="email" type="text" />
            </div>
            <div class="form-group">
                <label for="password">password :</label> <span id="passwordCheck" class="span"></span><input class="form-control" name="staff.password" id="password" type="password" />
            </div>
            <div class="form-group">
            	<label for="storeId">storeId :</label>
                <select name="staff.storeId" id="storeId">               	
                	<option value="1">1</option>
                	<option value="2">2</option>
                </select>
            </div>
            <div class="form-group">
                <label for="username">username :</label><span id="usernameCheck" class="span"></span> <input class="form-control" name="staff.username" id="username" type="text" />
            </div>
            <div class="form-group">
                <label for="username">select Adress :</label>
                <select name="country" id="country" class="select"></select>
				<select name="address.cityId" id="city" class="select"></select>
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
</body>
</html>