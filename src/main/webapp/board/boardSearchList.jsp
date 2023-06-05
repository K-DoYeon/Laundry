<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	BoardDAO bbsDAO = new BoardDAO();
	BoardBean bean = new BoardBean();
	ArrayList<BoardBean> list = bbsDAO.getSearch(request.getParameter("searchField"),
		request.getParameter("searchText"));
			if (list.size() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('검색결과가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
			for(int i = 0; i < list.size(); i++){
				String wdateStr = bean.getWdate();

				SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd"); // 현재 형식
				Date wdate = sdfInput.parse(wdateStr); // 문자열을 Date 객체로 변환

				SimpleDateFormat sdfOutput = new SimpleDateFormat("yyyy.MM.dd"); // 변경하고자 하는 형식
				String formattedWdate = sdfOutput.format(wdate); // 변경된 형식으로 날짜를 문자열로 변환
%>
 	<div class="active" id="QA">
      <div class="faq">
      	<div class="do-title">
	      	<div class="do-day">
	      		<span class="big">01</span>
	      		<span><%=formattedWdate%></span>
	      	</div>
	      	<div><h3 class="faq-title"><%=bean.getSubject() %></h3></div>
      	</div>
		
		<div>
        	<p class="faq-text"><%=bean.getContent() %></p>
			<p class="faq-plus"><a href="">더보기..</a></p>
		</div>
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	</div>
	
<%
	}
%>	

	
</body>
</html>