<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/reservation.css">
	<%
		String uid = (String) session.getAttribute("uid");
		if(uid == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용해 주세요')");
			script.println("location.href='../user/login.jsp'");
			script.println("</script>");
		}
		
		String img = (String) session.getAttribute("img");
		String uname = (String) session.getAttribute("uname");
		String tel = (String) session.getAttribute("tel");
		Integer postcode = (Integer) session.getAttribute("postcode");
		String addr = (String) session.getAttribute("addr");
		String detailaddr = (String) session.getAttribute("detailaddr");
	%>
	<div class="container-reser">
		<form class="reservation-reser">
			<div class="userInfo-reser">
				<h2>정보를 입력해 주세요</h2>
				<div class="userID-reser">
					<img alt="user" src="../img/<%= img%>" class="userImg-reser">
					<p><%= uid %></p>
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">이름</label>
					<input type="text" name="uname" class="infoVal-reser" value="<%= uname %>"  placeholder="이름을 입력해주세요" required />
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">휴대폰</label>
					<input type="text" name="tel" class="infoVal-reser" value="<%= tel %>" placeholder="숫자만 입력해주세요" required />
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">우편번호</label>
					<input type="number" name="postcode" class="infoVal-reser" value="<%= postcode %>" id="postcode" readonly >
	                <button type="button" onclick="Postcode();" class="searchBtn-reser"><i class="ri-search-line"></i> 찾기</button>
				</div>
				
				<div class="infoBox-reser addr-reser">
					<label class="infoName-reser addrName-reser">주소</label>
					<div class="infoValBox-reser">
						<input type="text" name="addr" class="infoVal-reser addrVal-reser" value="<%= addr %>" id="address" readonly />
						<input type="text" name="detailaddr" class="infoVal-reser" value="<%= detailaddr %>" id="detailaddr" placeholder="상세주소를 입력해주세요" required />
					</div>
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">세탁물 정보</label>
					<textarea name="comment" class="infoVal-reser" placeholder="세탁물 갯수 및 정보를 입력해주세요" required></textarea>
				</div>
			</div>
		</form>
	</div>