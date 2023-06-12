<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO, board.BoardBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class = "board.BoardBean">
	<jsp:setProperty name = "bean" property ="*" />
</jsp:useBean>

<%
	BoardDAO dao = new BoardDAO();
	
	String pass = dao.uPass(bean.getNum());
	
	if(pass.equals(bean.getUpass())){
		dao.updateBoard(bean);
		//수정되면 boardlist로 이동
		response.sendRedirect("boardlist.jsp");
	//비밀번호가 다르다면
	
%>
	<script type = "text/javascript">
		alert("패스워드가 일치하지 않습니다.")
		history.go(-1);
	</script>
<%
	}
%>

</body>
</html>