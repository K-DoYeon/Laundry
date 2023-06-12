<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/userInfo.css">
	<%
		UserBean ubean = new UserBean();
		String uid = (String) session.getAttribute("uid");
		String img = (String) session.getAttribute("img");
		Integer level = (Integer) session.getAttribute("level");
	%>
	<div class="container-info">
		<h1 class="title-info">회원수정</h1>
		
		<div class="userImgBox-info">
			<img alt="userImg" src="<%=img %>" class="userImg-info" id="imgFile">
			<label for="img" class="imgBox-info">
				<i class="ri-settings-3-fill"></i>
			</label>
			<input type="file" name="img" id="img" accept="image/*" onchange="fileName()">
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="../js/userInfo.js"></script>
</body>
</html>