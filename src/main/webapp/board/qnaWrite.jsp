<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<title>Q&A</title>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="${pageContext.request.contextPath}/board/getBoardList";
	});
</script>
<%
	String uid = request.getParameter("uid");
%>
<style>

body {
  padding-top: 70px;
  padding-bottom: 30px;
}

button a{
	color : #28527A;
	border : none;
}
button a:hover{
	color : #fff;
	text-decoration:none;
}
.qna{
	text-align : center;
}
.qna-btn{
	background-color : #FAE57C;
	color : #28527A;
	font-weight : bold;
}
.qna-btn:hover{
	background-color : #28527A;
	color : #fff;
}

</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>QnA</h2>
			<form name="form" id="form" role="form" method="post" action="qnaWriteProc.jsp">
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="uid" id="uid" placeholder="<%=uid %>" readonly />
				</div>			
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>		
				
			</form>
			<div class ="qna">
				<button type="button" class="btn btn-sm qna-btn" id="btnSave" value ="submit">저장</button>
				<button type="button" class="btn btn-sm qna-btn" id="btnList"><a href = "boardlist.jsp">목록</a></button>
			</div>
		</div>
	</article>
</body>
</html>