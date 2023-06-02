<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<section class="members">
        <div class="membersContent">
            <ul class="membersLogin">
                <div>
                    <form action="membersLogin.jsp" name="login" id="membersLogin" method="post">
                        
                        <li class="membersLogin-input">
                            <span>아이디</span>
                            <input type="text" id="uid" name="uid" maxlength="20" title="아이디">
                        </li>
                        <li class="membersLogin-input">
                            <span>비밀번호</span>
                            <input type="password" id="upass" name="upass" maxlength="12" title="비밀번호">
                        </li>
                        <li class="membersLogin-find">
                            <a href="#" onclick ="idFind();"><span>아이디 찾기</span></a>
                        </li>
                        <li class="membersLogin-find">
                            <a href="#" onclick ="pwFind();"><span>비밀번호 찾기</span></a>
                        </li>
                        <li class="membersLogin-Login">
                            <button type="submit">로그인<i class="fa-sharp fa-solid fa-arrow-right-long"></i></button>
                        </li>
                        
                    </form>
                </div>
            </ul>
        </div>
    </section>
</div>

<script src="../js/idfind.js"></script>
</body>
</html>