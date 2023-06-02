<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="css/boardlist.css">
</head>
<body>

<h1>게시판</h1>

<div class="top-tab">
	<ul class="tab">
		<li><a href="#" class="active" data-idx="#QA">Q&A</a></li>
		<li><a href="#" data-idx ="#notice">NOTICE</a></li>
	</ul>
</div>
    <div class="faq-container">
     <div class="active" id="QA">
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 1</h3>

        <p class="faq-text">대답 1</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
		</div>
		</div>

     <div id="notice">
      <div class="faq">
        <h3 class="faq-title">공지사항</h3>

        <p class="faq-text">대답 1</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
		</div>
		</div>
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/boardlist.js"></script>

</body>
</html>