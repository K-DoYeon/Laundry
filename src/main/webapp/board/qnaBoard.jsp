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

<title>Q&A Board</title>

<%
	String num = request.getParameter("num");
	String uid = request.getParameter("uid");
	String wdate = request.getParameter("wdate");
	String readcount = request.getParameter("readcount");
	String content = request.getParameter("content");
	String subject = request.getParameter("subject");
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
	<article>
		<div class="container" role="main">
			<h2 class = "text-center">QnA</h2>
			<form name="form" id="form" role="form" method="post" action="qnaWriteProc.jsp">
				<div class="mb-3 mt-4 subject">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=subject %>">
				</div>
				<div class="mb-3 d-flex menu">
					<div>
						<label for="reg_id"><%=num %> /</label>
						<label for="reg_id"><%=uid %></label>
					</div>
					<div>
						<label for="reg_id"><%=wdate %> /</label>
						<label for="reg_id"><%=readcount %></label>
					</div>
				</div>	
				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content"><%=content %></textarea>
				</div>		
				
			</form>
			<div class ="choi-qna">
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">수정</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList" onclick="dodel();">삭제</a></button>
			</div>			
		</form>
		
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
                            <textarea class="form-control" rows="3" name="content" id="content"></textarea>
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