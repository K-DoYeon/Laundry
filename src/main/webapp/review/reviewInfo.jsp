<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean, review.ReviewDAO" %>
<%@ page import="java.util.*"%>
<%@ page import = "java.io.*" %>
<%
ReviewDAO rdao = new ReviewDAO();
ArrayList<ReviewBean> reviewlist = null;
reviewlist = rdao.getReviewList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();	
		$("#form").submit();
	});

	

</script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />


<title>Review Page</title>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	ReviewDAO dao = new ReviewDAO();
	ReviewBean bean = dao.getOneReview(num);
%>
<%
	String subject = bean.getSubject();
	String uid = bean.getUid();
%>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family:  'SUITE-Regular';
}
.container{
	margin-top : 50px;
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
	font-family:  'SUITE-Regular';
	text-align : right;
}
.choi-qna-btn:hover{
	background-color : #3E83A8;
	color : #fff;
	font-family:  'SUITE-Regular';	
}
.justify{
	justify-content : space-between;

}
.review textarea{
	resize : none;
}
.review-img img{
	width : 100%;
	height : auto;
	margin : 0 auto;
	padding : 0 auto;
}
input:read-only {
    background-color: #fff;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

	<article>
		<div class="container">
			<h2 class = "text-center">Review</h2>
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=bean.getSubject()%>" readonly>
				</div>
				
			<div class="mb-3 d-flex menu">
               <div>
                  <label for="reg_num"><%=bean.getNum() %> /</label>
                  <label for="reg_id"><%=bean.getUid() %></label>
               </div>
               <div>
                  <label for="reg_wdate"><%=bean.getWdate() %> /</label>
                  <label for="reg_readcount"><%=bean.getReadCount() %></label>
               </div>
            </div>  		
            
				<div class="mb-3 mt-4 review">
					<label for="content">내용</label>
					<div class = "mb-3 mt-4 review-img">
					<img src = "../imgs/<%=bean.getImg() %>" alt = "">
            	    <textarea class="form-control mt-3" rows="5" name="content" id="content" readonly><%=bean.getContent() %></textarea>
            	    </div>
				</div>
					
							
			<div class ="choi-qna">
					<input type = "hidden" name = "level" id="level" />
					<input type = "hidden" name = "img" id="img" />
					<input type = "hidden" name = "readcount" id="readcount" />
					<input type = "hidden" name = "replycount" id="replycount"/>
					<input type = "hidden" name = "like" id="like" />
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">수정</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList" value = "submit">삭제</a></button>
				<form action="LikeAction.jsp?num=<%= bean.getNum()%>" method="post">
				<input type="hidden" name="subject" value="<%=bean.getSubject() %>" />
				<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				<button type="submit" onclick="return confirm('추천하시겠습니까?')" class="btn btn-sm choi-qna-btn">좋아요</button>
				</form>
			</div>
		
		
<div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> COMMENT
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
				<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
				<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
				<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button type="button" class="btn choi-qna-btn mt-3" onClick="javascript:addReply();">댓글 등록</button>
		    </li>
		</ul>
	</div>
</div>
	</article>
</body>
</html>