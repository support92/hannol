<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="bodyFrame2">
    <div class="body-title" align="center">
          <h2 style="font-weight: bold;"> 가든스테이지 좌석예약 </h2>
    </div>
    <br><br>
    <div style="background-color: #dfe5f3; height: 600px;"> 
        <div align="center">
        	 
			<div style="font-size:x-large; padding: 60px;" align="center">
		      	<span>가든스테이지에서 진행되는 공연을 <strong style="color: #550adf">좌석예약</strong>을 통해</span><br><br>
  			 	<span style="font-weight: bold;">더 앞에서! 더 편하게! 즐겨보세요.</span>
  			 	 
 			</div>
 			
 			
 			<div style="width: 45%;">
	 			<div align="left" style="padding: 10px;">
					 <div style="background-color: #550adf; display: inline; border-radius: 25px; padding: 10px;">
					 	<span style="color: white; font-weight: bold; font-size: medium;">좌석 예약 시간</span>
					 </div>
					 <div style="display: inline;">
					 	&nbsp;&nbsp;&nbsp;공연 전일 오후 12:00 ~ 익일 오전 8:00
					 </div>
	 			</div>
	 			<div align="left" style="padding: 10px;">
					 <div style="background-color: #550adf; display: inline; border-radius: 25px; padding: 10px;">
					 	<span style="color: white; font-weight: bold; font-size: medium;">좌석 예약 공연</span>
					 </div>
					 <div style="display: inline;">
					 	&nbsp;&nbsp;&nbsp;드라큐라의 사랑
					 </div>
	 			</div> 
 			</div> 
 			
 			
			<div style="background-color: white; width: 70%; padding: 24px; margin-top: 40px;" align="left">
				<h4 align="center"><mark>좌석 예약 전 확인하세요.</mark></h4>
				<br> 
				<ul style="list-style-type: circle;">
					<li>- 좌석예약은 ID당 1일 1회 신청 가능합니다.</li>
					<li>- 좌석예약은 ID당 최대 2 좌석 신청 가능합니다.</li> 
					<li>- 접속 기기의 시간 설정에 따라 신청 페이지 오픈 시각의 차이가 발생할 수 있습니다.</li>
					<li>- 원활한 관람을 위해 공연시작 15분 전까지 착석을 완료해주시기 바랍니다. (공연시작 30분 전부터 착석 가능)</li>
					<li>- 해당일의 좌석 예약은 전일 오후 12시~다음날 오전 8시까지 예약 가능합니다.</li>
					<li>- 공연시작 10분전까지 입장하지 않을 경우, 이용이 불가합니다.</li>
				</ul>
			</div>
			
			<div style="padding: 100px;">
				<button class="btn btn-default btn-info" type="button" onclick="reservation()">&nbsp;좌석 신청하기</button>
			</div>
		</div>
    </div> 
    
    
    
</div>