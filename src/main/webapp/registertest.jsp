<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
<form action="registerProc" method="post">
	<div>
	<label>아이디</label>
	<input type="text" name="uid" />
	</div>
	
	<div>
	<label>비밀번호</label>
	<input type="password" name="upass" />
	</div>
	
	<div>
	<label>비밀번호확인</label>
	<input type="password" name="upasscheck" />
	</div>
	
	<div>
	<label>이름</label>
	<input type="text" name="uname" />
	</div>
	
	<div>
	<label>이메일</label>
	<input type="email" name="uemail" />
	</div>
	
	<div>
	<label>휴대폰</label>
	<input type="text" name="tel" />
	</div>
	
	<div>
	<label>우편번호</label>
	<input type="text" name="postcode" />
	</div>
	
	<div>
	<label>주소</label>
	<input type="text" name="addr" />
	</div>
	
	<div>
	<label>상세 주소</label>
	<input type="text" name="detailaddr" />
	</div>
	
	<div>
	<label>주소</label>
	<input type="text" name="addr" />
	</div>
	
	<div>
	<label>성별</label>
	<input type="checkbox" name="gender" />
	</div>
	
	<div>
	<label>생년월일</label>
	<input type="text" name="birth" />
	</div>
	
	<input type="submit" value="가입하기" />
</form>
</body>
</html>