<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script>
    $(document).ready(function() {
       	$('#addButton').click(function() {
           	let ck = false;
       		let boardfile = $('.boardfile');
       		for(let item of boardfile){// break를 사용하기위해 each 사용 x boardfile 첨부한게 없다면 break
       			if($(item).val()== ''){
       				ck = true;
       				console.log('첨부되지 않은 파일이 있습니다.');
       				break;
       			}
       		}
           			
       		if(ck){
       			alert('첨부되지 않은 파일이 있습니다.');
       		} else if ($('#boardPw').val().length < 4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if ($('#boardTitle').val() == '') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if ($('#boardContent').val() == '') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else {
                $('#addForm').submit();
            }
        });
        // #inputFile에 input type='file'추가
        $('#addFileBtn').click(function(){
        	console.log('addFileBtn click');
        	$('#inputFile').append('<input type="file" name="boardfile" class="form-control">');
        });
        // #inputFile에 input type='file' 마지막 태그 삭제
        $('#delFileBtn').click(function(){
        	$('#inputFile').children().last().remove();
        });
    });
</script>
<title>ADD BOARD</title>
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
                <h3>add Board</h3>
            </div>
            <div class="page-content">
            	<section class="row">
            		<div class="card">
            			<br>
				        <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
				            <div class="form-group">
				                <div>
				                	<button id="addFileBtn" type="button" class="btn btn-secondary">파일추가</button>
				                	<button id="delFileBtn" type="button" class="btn btn-secondary">파일삭제</button>
				                </div>
				                <div id="inputFile">
				                </div>
				            </div>         
				            <div class="form-group">
				                <label for="boardPw">boardPw :</label> <input class="form-control" name="board.boardPw" id="boardPw" type="password" />
				            </div>
				            <div class="form-group">
				                <label for="boardPw">boardTitle :</label> <input class="form-control" name="board.boardTitle" id="boardTitle" type="text" />
				            </div>
				            <div class="form-group">
				                <label for="boardContent">boardContent :</label>
				                <textarea class="form-control" name="board.boardContent" id="boardContent" rows="5" cols="80"></textarea>
				            </div>
				            <div>
				                <input class="btn btn-outline-dark" id="addButton" type="button" value="글입력" /> <input class="btn btn-outline-dark" type="reset" value="초기화" /> <a class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
				            </div>
				        </form>
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