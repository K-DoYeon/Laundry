<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="board.BoardBean, board.BoardDAO" %>

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


<title>Q&A Write</title>

<%
	String uid = request.getParameter("uid");
%>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family: 'IM_Hyemin-Bold';
}

button a{
	color : #fff;
	border : none;
}
.choi-qna{
	text-align : right;
}
.choi-qna-btn{
	background-color : #58A3BC;
	color : #fff;
	font-family: 'IM_Hyemin-Bold';
}
.choi-qna-btn:hover{
	background-color : #3E83A8;
	color : #fff;
	font-family: 'IM_Hyemin-Bold';	
}

</style>
</head>
<body class = "choi-body">
	<article>
		<div class="container">
			<h2 class = "text-center">QnA</h2>
			<form action="qnaWriteProc.jsp" name="form" id="form" role="form" method="post">
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
			<div class ="choi-qna">
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">저장</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList"><a href = "boardlist.jsp">목록</a></button>
			</div>
			</form>
		</div>
	</article>
</body>
</html>