<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
  
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








