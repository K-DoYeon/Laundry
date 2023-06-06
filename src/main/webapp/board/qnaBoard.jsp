<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO, board.BoardBean"%>
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

<title>Q&A Board</title>

<%

	String num = getInitParameter("num");
	String uid = getInitParameter("uid");
	String wdate = getInitParameter("wdate");
	String readcount = getInitParameter("readcount");
	String content = getInitParameter("content");
	String subject = getInitParameter("subject");
%>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
.choi-body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family: 'IM_Hyemin-Bold';
}
.form-control:disabled, .form-control[readonly]{
	backgrond-color : #fff;
	opacity : 1;
}
button a{
	color : #fff;
	border : none;
}
button a:hover{
	color : #fff;
	text-decoration:none;
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
.menu{
	justify-content : space-between;
}
</style>
</head>
<body class = "choi-body">
<jsp:include page="/include/header.jsp" />
	<article>
		<div class="container" role="main">
			<h2 class = "text-center">QnA</h2>
				<div class="mb-3 mt-4 subject">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=subject%>" readonly>
				</div>
				<div class="mb-3 d-flex menu">
					<div>
						<label for="reg_num"><%=num %> /</label>
						<label for="reg_id"><%=uid %></label>
					</div>
					<div>
						<label for="reg_wdate"><%=wdate %> /</label>
						<label for="reg_readcount"><%=readcount%></label>
					</div>
				</div>	
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" readonly><%=content%></textarea>
				</div>		
				
			<div class ="choi-qna">
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">수정</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList" onclick="dodel();">삭제</button>
			</div>			
		
		
		<!-- 댓글  -->
	<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea class="form-control" rows="1" name="content" id="content" placeholder = "관리자만 사용 가능합니다."></textarea>
                            <br>
                            <div class ="choi-qna">
								<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">등록</button>
							</div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden"  />        
    </form>
</div>
<div class="container">
    <form id="comment" name="comment" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
		</div>
	</article>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>
</body>
</html>