<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<%
		Cookie[] cookies = request.getCookies();
		String loginStatus = null;
		String rememberId = null;
		String uid =  null;
		
		if(cookies != null && cookies.length>0){
			for (int i=0; i<cookies.length; i++){
				
				if(cookies[i].getName().equals("loginStatus")){
					loginStatus = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("rememberId")){
					
					rememberId = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("uid")){
					uid = cookies[i].getValue();
				}
			}
		}
	%>

	<div class="main-banner">
		<div class="banner-inside">
			<div class="main-delivery">
				<p class="delivery-p">우리집이<span> 새벽 배송 </span>지역인지<br>확인해보세요!</p>
				<p class="delivery-p-s">남들보다 빠르게, 신속한 새벽배송을 받아보세요.</p>
				<input type="search" id="delivery-search" placeholder="거주지의 지역명을 검색해보세요." class="delivery-search" name="searchText" autocomplete="off">
				<span class="delevery-search-btn"><i class="ri-search-line"></i></span>
				<p class="delivery-hashtag">
					<span>#</span>
					&nbsp;&nbsp;새벽 배송
					&nbsp;&nbsp;전날 수거
					&nbsp;&nbsp;다음날 배송
					&nbsp;&nbsp;깔끔하고
					&nbsp;&nbsp;신속하게
				</p>
			</div>
			<div class="main-reservation">
				
			</div>
		</div>
	</div>
	

</body>
</html>