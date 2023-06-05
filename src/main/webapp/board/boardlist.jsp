<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Laundry</title>
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="../css/boardlist.css">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<%
	BoardDAO bdao = new BoardDAO();
	Vector<BoardBean> vec = bdao.getAllBoard();
	
	int cnt = bdao.getBoardCount();
	
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	System.out.println(bdao.getBoardCount());
	
	ArrayList<BoardBean> boardlist = null;
	
	if(cnt != 0){
		boardlist = bdao.getBoardList(startRow, pageSize);
	}
%>

<div class="do-list-title">
	<h1>게시판</h1>
</div>

<div class="top-tab">
	<ul class="tab">
		<a href="#" id="tab-QA" class="active" data-idx="#QA"><li>Q&A</li></a>
		<a href="#" data-idx ="#notice"><li>NOTICE</li></a>
	</ul>
</div>

	<div class="do-container">
    <div class="faq-container">
	
	<div class="do-search active">
		<form name=form action="boardsearchlist.jsp" method="post">
			<div class="srch">
				<select class="select-no" name="searchField">
					<option>선택</option>
					<option value=subject>제목</option>
					<option value=content>내용</option>
					<option value=writer>작성자</option>
				</select>
				<input onmouseover="this.focus()" type="search" id="srch-no" placeholder="검색어를 입력하세요" class="srch_btn" name="searchText">
				<div onclick="srchDataCheck()">
	                검색	           	
	            </div>
				
			</div>
		</form>
	</div>
  
<% 
	for(int i = 0; i < boardlist.size(); i++){
		BoardBean bean = boardlist.get(i);
%>
<%
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

<%
	if(cnt != 0){
		int pageCount = cnt / pageSize + (cnt % pageSize == 0? 0:1);
		int pageBlock = 5;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
%>
	<div class="page txt-align active">
		<div class="btn">
		<%
			if(startPage > pageBlock){
		%>
			<a href="boardlist.jsp?pageNum=<%= startPage - pageBlock %>">
				<span class="prv"><i class="fa-solid fa-angle-left"></i></span>
			</a>
		<%
			}
		%>
			<div class="number">
		<%
			for(int i = startPage; i <= endPage; i++){
		%>
			<a class="number" href="boardlist.jsp?pageNum=<%= i %>"><span><%= i %></span></a>
		<%
			}
		%>
		</div>
		<%
			if(endPage < pageCount){
		%>
			<a href="boardlist.jsp?pageNum=<%= startPage + pageBlock %>">
				<span class="nxt"><i class="fa-solid fa-angle-right"></i></span>
			</a>
		<%
			}
		%>
	</div>
	</div>
<%
	}
%>
<div class="write-button active">
	<button onclick="location.href='qnaWrite.jsp'">글쓰기</button>
</div>

     <div id="notice">
      <div class="faq">
        <div class="do-title">
	      	<div class="do-day">
	      		<span class="big">01</span>
	      		<span>2023.10.10</span>
	      	</div>
	      	<div><h3 class="faq-title">공지사항</h3></div>
      	</div>

        <p class="faq-text">대답 1</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	  </div>
	</div>
 </div>
    

    
	<div class="">
    	<button onclick="dodel()">삭제</button>
	</div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>

</body>
</html>