<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="comment" class="board.CommentBean" scope="page"/>
<jsp:setProperty name="comment" property="content"/>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%	
	BoardBean bean = new BoardBean();
	BoardDAO bdao = new BoardDAO();
	String upass = (String)session.getAttribute("upass");
	String uid = (String)session.getAttribute("uid");
	
	if(uid == null){
		PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 후 이용해주세요.')");
        script.println("location.href = 'boardlist.jsp'");
        script.println("</script>");
	}else{
		if(comment.getRef() == 0){
			PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('유효하지 않은 글입니다.')");
	        script.println("history.back()");
	        script.println("</script>");
		}
		if(comment.getContent() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
	        script.println("alert('댓글을 입력해주세요.')");
	        script.println("history.back()");
	        script.println("</script>");
		}else{
			int rs = bdao.write(comment.getContent(), upass, uid, comment.getRef());	
			if(rs == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
	            script.println("alert('댓글 쓰기에 실패했습니다.')");
	            script.println("history.back()");
	            script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href=document.referrer;");
				script.println("</script>");
			}
		}
	}
	
	
%>

</body>
</html>