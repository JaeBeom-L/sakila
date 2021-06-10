<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
        	$('#inputFile').append('<input type="file" name="boardfile" class="boardfile">');
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
    <div class="container">
    	<jsp:include page="/WEB-INF/view/nav.jsp"/>
        <h1>add board</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addBoard" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <div>
                	<button id="addFileBtn" type="button" class="btn btn-default">파일추가</button>
                	<button id="delFileBtn" type="button" class="btn btn-default">파일삭제</button>
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
                <textarea class="form-control" name="board.boardContent" id="boardContent" rows="5" cols="50"></textarea>
            </div>
            <div>
                <input class="btn btn-default" id="addButton" type="button" value="글입력" /> <input class="btn btn-default" type="reset" value="초기화" /> <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/getBoardList">글목록</a>
            </div>
        </form>
    </div>
</body>
</html>