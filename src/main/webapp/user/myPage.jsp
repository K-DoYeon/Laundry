<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserBean"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/myPage.css">
	
	<%
	UserBean ubean = new UserBean();
	String uid = (String) session.getAttribute("uid");
	String img = (String) session.getAttribute("img");
	%>
	<div class="userInfo-my">
		<div class="userInfoBox-my">
			<div class="userImg-my">
				<div class="userImgTop-my">
					<img alt="userImg" src="<%=img %>" class="userImgScale-my">
					<h3 class="userName-my"> <span><%= uid %></span> 님</h3>
				</div>
				<div class="userBtn-my">
					<a href="updatePw.jsp" class="updatePw-my">비밀번호 수정</a>
					<a onclick="pwCheck()" class="updateUser-my">회원정보 수정</a>
				</div>
			</div>
			<div class="stamp-my">
				<a class="Title-my" href="stamp.jsp">
					<h2>스탬프</h2> <i class="ri-arrow-right-s-line"></i>
				</a>
				<p><span class="Count-my">0</span>개</p>
			</div>
			<div class="coupon-my">
				<a class="Title-my">
					<h2>무료배송 쿠폰</h2>
				</a>
				<p><span class="Count-my">0</span>개</p>
			</div>
			<div class="vip-my">
			</div>
		</div>
	</div>
	<div class="container-my">
		<div class="banner-my">
		</div>
		
		<div class="reservationList-my">
		</div>
	</div>

</body>
</html>