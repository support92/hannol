<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
#dateList {
	height: 20%; 
	padding: 150px;
	margin-top: -30px;
}
#dateList > div {
	padding-bottom: 30px;
	cursor: pointer; 
} 
#dateList > div:nth-child(1) {
	margin-left: -35px;
}
#dateList > div:nth-child(1) ~ div {
	margin-left: -10px;
}

.activeDate {
	color:black; 
	font-size: 16px; 
	font-weight: bold;
}
.nActiveDate {
	font-size: 16px;
	font-weight: bold;
}
</style>
  
<script type="text/javascript">
$(function() {
	initDateList();
	
});

function initDateList() { // d-오늘부터 일주일로 바꾸기
	var date = dateToString(new Date());
	var dateAry = '';
	var $dateListdiv = document.getElementById('dateList');
	
	for(var i = 0; i <= 6; i++) {
		dateAry = getDaysLater(date, i+1);
		var dataDate = dateAry;
		
		dateAry = dateAry.substr(5);
		var m = dateAry.substr(0, 2);
		var d = dateAry.substr(3, 4);
		dateAry = m + "/" + d;
		
		var $image = document.createElement('img');
		$image.setAttribute('width', '100px');
		$image.setAttribute('height', '100px');
		$image.setAttribute('class', 'img-responsive');
		
		var $span = document.createElement('span');
		
		var $pDiv = document.createElement('div');
		$pDiv.setAttribute('class', 'col-md-2');
		if(i == 0) { // image 흰색 원, 글씨 검정
			$image.setAttribute('src', '<%=cp%>/resource/images/circle_line.png');
			$span.setAttribute('class', 'activeDate');
		} else { // image 보라원, 글씨 흰색
			$image.setAttribute('src', '<%=cp%>/resource/images/circle.PNG');
			$span.setAttribute('class', 'nActiveDate');
		}
		
		$span.innerText = dateAry;
		$span.setAttribute('data-date', dataDate);
		
		var $cDiv = document.createElement('div');
		$cDiv.setAttribute('class', 'carousel-caption');
		
		$pDiv.appendChild($image);
		$cDiv.appendChild($span);
		$pDiv.appendChild($cDiv);
		
		$dateListdiv.appendChild($pDiv);
	}
}  
 
</script>
  
<div class="bodyFrame2">
	<div class="body-title">
		<h3><span class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;&nbsp;금주의 무대공연 </h3>
	</div>

	
	<div id="dateList" align="center"></div>

	<div id="showList">
		<table style="width: 100%; height: 15m; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
			<tr align="center" height="100em" style="border-bottom: 1px solid #cccccc;">
				<td rowspan="2" width="30%"><img src="<%=cp%>/resource/images/card.jpg" class="cardImage"></td>
				<td colspan="2" width="70%" height="30%" align="left" style="padding-left: 1em; padding-right: 1em;">
					<h3 style="font-weight: bold;">할로윈 스페셜 밴드 쇼</h3>
				</td>
			</tr>
			<tr style="border-bottom: 1px solid #cccccc;">
				<td width="70%" height="80%" align="left" style="padding-left: 1em; padding-right: 1em; ">
					<div style="margin-bottom: 15px;"><h4>팝 뮤직과 영화 OST를 연주하는 할로윈 밴드 공연</h4></div>
					<span style="font-weight: bold;">공연시간</span>&nbsp;&nbsp;11:30 | 14:00<br> 
					<span style="font-weight: bold;">공연장소</span>&nbsp;&nbsp;만남의 광장</td>
				<td width="15%" valign="bottom">
					<button type="button" class="btn" onclick="Detail()">상세보기</button>
				</td>
			</tr>
		</table>


	</div>
	
	<div id="dateList2" align="center">
	</div>	
</div>








