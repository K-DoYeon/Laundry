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

<div class="do-list-title">
	<h1>게시판</h1>
</div>

<div class="top-tab">
	<ul class="tab">
		<a href="#" class="active" data-idx="#QA"><li>Q&A</li></a>
		<a href="#" data-idx ="#notice"><li>NOTICE</li></a>
	</ul>
</div>
	<div class="do-container">
    <div class="faq-container">
      	
 	<div class="active" id="QA">
      <div class="faq">
      	<div class="do-title">
	      	<div class="do-day">
	      		<span class="big">01</span>
	      		<span>2023.10.10</span>
	      	</div>
	      	<div><h3 class="faq-title">이게머에요?</h3></div>
      	</div>

        <p class="faq-text">이게 먼지 머르겠어여 헤헤</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
		
		<div class="faq">
      	<div class="do-title">
	      	<div class="do-day">
	      		<span class="big">01</span>
	      		<span>2023.10.10</span>
	      	</div>
	      	<div><h3 class="faq-title">이게머에요?</h3></div>
      	</div>

        <p class="faq-text">이게 먼지 머르겠어여 헤헤</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	   <div class="write-button">
	        <button onclick="location.href='qnaWrite.jsp'">글쓰기</button>
	   </div>
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