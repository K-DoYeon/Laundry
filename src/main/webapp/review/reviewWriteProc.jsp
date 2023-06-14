<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class = "review.ReviewBean" />
<jsp:setProperty property = "*"  name = "bean" />
<%
	ReviewDAO dao = new ReviewDAO();
	dao.insertReview(bean);
	response.sendRedirect("review.jsp");

%>
</body>
</html>