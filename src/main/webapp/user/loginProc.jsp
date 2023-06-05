<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO udao = new UserDAO();
		UserBean ubean = new UserBean();
		
		ubean.setUid((String) request.getParameter("uid"));
		ubean.setUpass((String) request.getParameter("upass"));
		ubean.setImg((String) request.getParameter("img"));
		
		int result = udao.login(ubean.getUid(), ubean.getUpass());
		String img = udao.userImg(ubean.getUid(), ubean.getUpass());
		if(result == 1){
			session.setAttribute("uid",ubean.getUid());//세션부여
			session.setAttribute("img", img);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='../main/main.jsp'");//로그인에 성공하면 main페이지로
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>