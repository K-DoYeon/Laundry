<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">
</head>
<body>
	<%
	String uid = (String) session.getAttribute("uid");
	String img = (String) session.getAttribute("img");
	%>
	<header>
		<div class="container-header">
				<a href="../main/main.jsp"> <img src="../img/logo.png" alt="logo">
				</a>

				<ul class="gnb-header">
					<li><a href="#">예약</a></li>
					<li><a href="#">PR</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">회사소개</a></li>
				</ul>

				<%
				if (uid == null) {
				%>
				<div class="member">

					<a href="../user/login.jsp">Login <i class="ri-login-box-line"></i></a>
					<a href="../user/register.jsp">Join <i class="ri-user-add-line"></i></a>

				</div>
				<%
				} else {
				%>
				
					<div class="welcome-header">
						<p class="user-header">
							<img class="userImg-header" src="<%=img %>">
							<span><%=uid%></span>
						</p>
						<a href="../user/logout.jsp">Logout <i class="ri-login-box-line"></i></a>
					</div>
				
				<%
				}
				%>


		</div>
	</header>