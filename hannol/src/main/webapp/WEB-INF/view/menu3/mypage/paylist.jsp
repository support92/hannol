<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<style>
.gitf-form-control{
	background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}

.col-xs-8:after{
	content:''; display:block; clear:both;
}

.col-xs-offset-2{
	width: 40%;
}

.col-xs-8{
 	float: none;
 	margin: 10px auto;
}

.note{
	border: 1px solid #e1e1e1;
    background: #f8f8f8;
    padding: 20px;
    margin-top: 30px;
}

th {
    width: 30%;
    border: solid #e4e4e4; 
    border-width: 0 1px 1px 0;
    background: #f8f8f8;
    padding: 7px 15px 7px 15px;
    font-weight: bold;
    text-align: center;    
}

td {
    width: 30%;
    border: solid #e4e4e4; 
    border-width: 0 1px 1px 0;
    padding: 7px 15px 7px 15px;
    text-align: center;    
}
</style>

<script type="text/javascript">

</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-list-alt"></span> 구매내역 </h3>
    </div>
    
    <div>
    	<div align="right">
    		<select style="height: 30px; width: 80px;">
    			<option>2018</option>
    		</select>
    	</div>
    	
    	<c:forEach varStatus="days" items="${payDay}">
    	<div style="border: 1px solid #e1e1e1; margin-top: 15px;">
    		<div style="background-color: #e1e1e1;">
    			<div style="padding: 10px;">
    				<h5 style="display: inline;">구매일</h5>
    				<h5 style="font-weight: bold; display: inline; margin-left: 10px;">2018-09-19</h5>
    			</div>
    		</div>
    		<!-- if(날짜비교) -->
    		<div style="margin: 15px;">
    		<!-- if(이용권 샀나) -->
    			<table style="border: 1px solid #e1e1e1;">
    				<tr>
    					<th rowspan="2" style="width: 15%">이용권</th>
    					<th>상품명</th>
    					<th>가격 / 수량</th>
    					<td rowspan="2"><p>총결제금액</p><button type="button" class="btn btn-danger">구매취소</button></td> <!-- if(사용되었거나 날짜지났으면 구매취소 못하게) -->
    				</tr>
    				<tr>
    					<td>니모</td>
    					<td>2게/3만</td>
    				</tr>
    			</table>
    			
    			<!-- if(기프티콘 샀나) -->
    			<table style="margin-top: 10px; border: 1px solid #e1e1e1;">
    				<tr>
    					<th rowspan="3" style="width: 15%">기프트샵</th>
    					<th>상품명</th>
    					<th>가격 / 수량</th>
    					<td rowspan="3"><p>총결제금액</p><button type="button" class="btn btn-danger">구매취소</button></td>
    				</tr>
    				<tr>
    					<td>니모</td>
    					<td>2게/3만</td>
    				</tr>
    				<tr>
    					<td>니모</td>
    					<td>2게/3만</td>
    				</tr>
    			</table>
    		</div>
    	</div>
    	</c:forEach>
    
		<div style="width: 100%; margin-top: 10px; border-spacing: 0px;">
		   <div>
		    <div align="left">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/mypage/paylist';">새로고침</button>
		     </div>
			 <div align="center">
			        <c:if test="${dataCount==0}">최근 구매내역이 없습니다.</c:if>
			        <c:if test="${dataCount!=0}">${paging}</c:if>
			 </div>
			</div>
		</div>
		
		<div class="note">
    		<p style="font-size: 16px; font-weight: bold;">꼭 알아두세요</p>
    		<p style="margin-top: 10px; font-size: 12px;">이용권 구매 취소 시 해당 매직패스도 같이 취소가 됩니다.</p>
    	</div>
    </div>
</div>   