<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    $(document).ready(function() {
       	$('#addButton').click(function() {
           console.log('배우 저장 button click!');
           if($('#firstName').val() == ''){
        	   alert('firstName을 작성하세요')
        	   $('#firstName').focus();
           }else if($('#lastName').val() == ''){
        	   alert('lastName을 작성하세요')
        	   $('#lasttName').focus();
           }else{
        	   $('#addForm').submit();
           }
        });     
    });
</script>
<title>addActor</title>
</head>
<body>
	<div class="container">
    	<jsp:include page="/WEB-INF/view/nav.jsp"/>
        <h1>add actor</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addActor" method="post">        
            <div class="form-group">
                <label for="boardPw">firstName :</label> <input class="form-control" name="firstName" id="firstName" type="text" />
            </div>
            <div class="form-group">
                <label for="boardPw">lastName :</label> <input class="form-control" name="lastName" id="lastName" type="text" />
            </div>
            <div>
                <input class="btn btn-default" id="addButton" type="button" value="배우 저장" /> 
                <input class="btn btn-default" type="reset" value="초기화" /> 
            </div>
        </form>
    </div>
</body>
</html>