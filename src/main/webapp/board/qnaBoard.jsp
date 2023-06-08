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

	int num = Integer.parseInt(request.getParameter("num"));

	BoardDAO dao = new BoardDAO();
	BoardBean bean = dao.getOneBoard(num);

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
   
   <%

   String id = (String) session.getAttribute("uid");
   String pw = (String) session.getAttribute("upass");
   Integer levelObj = (Integer) session.getAttribute("level");
   int level = (levelObj != null) ? levelObj.intValue() : 0;

%>
      <div class="container" role="main">
         <h2 class = "text-center">QnA</h2>
            <div class="mb-3 mt-4 subject">
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
                  <label for="reg_readcount"><%=bean.getReadcount() %></label>
               </div>
            </div>   
            
            <div class="mb-3">
               <label for="content">내용</label>
               <textarea class="form-control" rows="5" name="content" id="content" readonly><%=bean.getContent() %></textarea>
            </div>      
            
         <div class ="choi-qna">
            <button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit" onclick="location.href='qnaUpdate.jsp?num=<%=bean.getNum() %>'">수정</button>
            <button type="button" class="btn btn-sm choi-qna-btn" id="btnList" onclick="dodel();">삭제</button>
         </div>         
      
      
      <!-- 댓글  -->
   <div class="container">
    <form id="commentForm" name="commentForm" method="post" action="submitAction.jsp">
    <br><br>
        <div>
            <div class="do-comment">
                <span>Comments</span>
            </div>

<%

   if(level == 99){
   
%>
   <input type="hidden" name="id" value="<%=id %>">
            <div class="do-commentbox">
                <div class="do-left">
               <p>ID : <span class="id"><%=id%></span></p>
                   <p>PW : <span class="pw"><%=pw%></span></p>
                </div>
                <div class="do-right">
                   <textarea rows="3" cols="120" placeholder="관리자만 쓸수있습니다." maxlength="100"></textarea>
                </div>
            </div>
            
            <div class ="choi-qna">
            <button type="submit" class="btn btn-sm choi-qna-btn" id="btnSave">등록</button>
         </div>
        </div>       
    </form>
</div>
<%
   }
%>

      </div>
   </article>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>
</body>
</html>