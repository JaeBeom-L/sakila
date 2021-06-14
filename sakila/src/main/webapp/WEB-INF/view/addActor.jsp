<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="${pageContext.request.contextPath}/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>