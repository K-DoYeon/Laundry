<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/login.css">
	<div class="container-login">
		<h1 class="title-login">로그인</h1>
		<form action="loginProc.jsp" method="post" name="loginFrom">
			<div class="Box-login">
				<label class="Title-login">아이디</label>
				<input type="text" id="uid" name="uid" maxlength="16" placeholder="아이디를 입력해주세요" />
			</div>
			<div class="Box-login">
				<label class="Title-login">비밀번호</label>
				<input type="password" id="upass" name="upass" maxlength="16" placeholder="비밀번호를 입력해주세요" />
			</div>
			
			<div class="findIdPw-login">
				<a href="idFind.jsp" class="find-login">아이디찾기</a> |
				<a href="pwFind.jsp" class="find-login">비밀번호찾기</a>
			</div>
			
			<div class="submitBtnBox-login">
				<input type="submit" class="submitBtn-login" value="로그인" />
			</div>
		</form>
		<div class="regiBox-login">
			<a href="register.jsp" class="register-login">회원가입</a>
		</div>
	</div>
</body>
</html>