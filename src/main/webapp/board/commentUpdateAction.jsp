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

int result = bdao.update(comment.getCommentid(), comment.getRef(), comment.getContent());
if(result == -1){
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('댓글 수정에 실패했습니다.')");
	script.println("history.back()");
	script.println("</script>");
}else{
	PrintWriter script=response.getWriter();
	int ref = comment.getRef();
	script.println("<script>");
	script.println("location.href = \"qnaBoard?num="+ref+"\"");
	script.println("</script>");
}
	
%>

</body>
</html>