<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
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

	String uid = (String)session.getAttribute("uid");
	String upass = request.getParameter("upass");
	String uname = request.getParameter("uname");
	String uemail = request.getParameter("uemail");
	String tel = request.getParameter("tel");
	Integer postcode = (Integer) session.getAttribute("postcode");
	String addr = request.getParameter("addr");
	String detailaddr = request.getParameter("detailaddr");
	Integer birth = (Integer) session.getAttribute("birth");
	int level = udao.userLevel(ubean.getUid());
	int vip = udao.userVip(ubean.getUid());
	String gender = udao.userGender(ubean.getUid());
	
	if(udao.login(uid, upass) == 1) {
		
		boolean flag = udao.updateInfo(uname, uemail, tel, postcode, addr, detailaddr, birth, uid);
		if(flag) {
			session.setAttribute("level", level);
			session.setAttribute("vip", vip);
			session.setAttribute("uname", uname);
			session.setAttribute("uemail", uemail);
			session.setAttribute("tel", tel);
			session.setAttribute("postcode", postcode);
			session.setAttribute("addr", addr);
			session.setAttribute("detailaddr", detailaddr);
			session.setAttribute("gender", gender);
			session.setAttribute("birth", birth);
	%>
		<script>
			alert("회원정보가 정상적으로 변경되었습니다.");
			document.location.href="myPage.jsp";
		</script>
	<%
			}else {
	%>
			<script>
				alert("회원정보 변경에 실패했습니다.");
				history.back();
			</script>
	<%		
			}
		}
	%>
</body>
</html>