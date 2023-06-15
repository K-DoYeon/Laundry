<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 안내</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/service.css">
<body>
<div class="service-container">
	<div class="top-tab">
		<div class="tab">
			<h1><a href="#" id="tab-cost" class="active n" data-idx="#cost">기본 요금</a></h1>
			<h1>/</h1>
			<h1><a href="#" class="n" data-idx ="#pr">Pr</a></h1>
		</div>
	</div>
	<div class="service-content">
		<div class="active" id="cost">
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>생활빨래</h2>
					<p>일반 가정에서 발생하는 의류, 수건, 양말 등을 세탁하고 건조하는 서비스 입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>생활빨래</th>
								<th>900원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>침구</h2>
					<p>개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본케어가 진행되는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>이불</th>
								<th>10,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>셔츠</h2>
					<p>개별 품목의 권장된 케어라벨에 따라 세탁하고 오염 제거를 위한 기본케어가 진행되는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>셔츠</th>
								<th>2,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>드라이</h2>
					<p>특별 세탁제를 사용해 탁월한 오염제거와 소재에 맞는 맞춤 건조를 통해 특별케어를 제공하는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>드라이</th>
								<th>5,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>개별 클리닉</h2>
					<p>단독 세탁물이나 물빠짐이 있는 세탁물을 따로 받아 이염없이 깔끔한 세탁을 위한 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>개별 클리닉</th>
								<th>1,500원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div id="pr">
			<div class="top-title">
				<img alt="pr-bg" src="../img/pr-bg.jpg">
				<div class="pr-font">
					<p>세탁 없는 삶.</p>
					<p class="pr-logo">세탁의 <span>당신</span></p>
				</div>
			</div>
			<div class="pr-second">
				<h1>사람을 위한</h1>
				<h1>현대적이고 편리한</h1>
				<p>세탁의 당신은 1인가구도 부담없이 편리하게 세탁서비스를 사용할 수 있게 하자는 트랜드적인 사고로 시작 되었습니다. 각 분야의 전문가들이 모여 사람들의 삶이 더욱 행복해질 수 있도록 고민하고 땀흘리고 있습니다.</p>
				<div class="pr-se-item">
					<div class="pr-price">
						<h3>부담없는 세탁 가격과 높은 품질</h3>
						<p>1인 가구들을 고려하여 최대한 거품가격은 내리고 좋은 품질을 유지하기 위해 다양한 서비스를 시행하고 있습니다.</p>
					</div>
					<div class="pr-deliver">
						<h3>직접 찾아가는 세탁소</h3>
						<p>전문적인 수거 업체가 빠르고 신속하게 세탁물을 수거해 여러분의 시간을 절약해드립니다.</p>
					</div>
				</div>
			</div>
			
			<div class="pr-three">
			<div class="ppr-three">
				<h1>세탁의 모든 것을</h1>
				<h1>한번에</h1>
			</div>
			</div>
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/service.js"></script>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>