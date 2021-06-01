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
                <label for="firstName">firstName :</label> <input class="form-control" name="customer.firstName" id="firstName" type="text" />
            </div>
            <div class="form-group">
                <label for="lastName">lastName :</label> <input class="form-control" name="customer.lastName" id="lastName" type="text" />
            </div>
            <div class="form-group">
                <label for="email">email :</label> <input class="form-control" name="customer.email" id="email" type="text" />
            </div>
            <div class="form-group">
            	<label for="storeId">storeId :</label>
                <select name="customer.storeId" id="storeId">               	
                	<option value="1">1</option>
                	<option value="2">2</option>
                </select>
            </div>
            <div class="form-group">
                <label for="username">select Adress :</label>
                <select name="country" id="country" class="select"></select>
				<select name="address.cityId" id="city" class="select"></select>
				<input class="form-control" name="address.address" id="address" type="text" value="adress" />
				<br>
				<input class="form-control" name="address.address2" id="address2" type="text" value="adress2" />
            </div>
            <div class="form-group">
                <label for="district">district :</label> <input class="form-control" name="address.district" id="district" type="text" />
            </div>
            <div class="form-group">
                <label for="postalCode">postalCode :</label> <input class="form-control" name="address.postalCode" id="postalCode" type="text" />
            </div>
            <div class="form-group">
                <label for="phone">phone :</label> <input class="form-control" name="address.phone" id="phone" type="text" />
            </div>
            <button id="btn" class="btn btn-secondary">add</button>
        </form>
    </div>
</body>
</html>