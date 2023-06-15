<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/reservation.css">
<link rel="stylesheet" href="../css/datetimepicker.css">
<body>
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
					<label class="infoName-reser">연락처</label>
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
					<label class="infoName-reser">특이사항</label>
					<textarea name="comment" id="commentTextarea" class="infoVal-reser" placeholder="ex:청바지 물빠짐이 있어요" required oninput="showText()"></textarea>
				</div>
			</div>
		
		<div class="do-calendar">
			
		</div>
		<div class="do-confirm">
			<h1>"<span><%= uname %></span>"님 예약 상세 정보</h1>
			<p class="do-res">예약 날짜</p>
			<input name="selectdate" class="datetimepicker" type="text" id="inputValue" onchange="inputValueChange()">
			<div class="do-information">
				<p><%= addr %></p> 
				<p><%= detailaddr %></p>
				<p><%= tel %></p>
				<span>특이사항 :  </span><p id="commentText"></p>
			</div>
			<button type="button" class="do-reser" value ="submit">예약하기</button>
		</div>
		</form>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/build/jquery.datetimepicker.full.min.js"></script>
	<script src="../js/datetimepicker.js"></script>
	<script>
        function showText() {
            var commentTextarea = document.getElementById("commentTextarea");
            var commentText = document.getElementById("commentText");
            commentText.textContent = commentTextarea.value;
        }
    </script>
</body>
</html>	