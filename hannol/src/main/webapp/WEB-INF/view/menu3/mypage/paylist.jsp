<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	int rank = 0;
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
    			<option>${curDate}</option>
    			<option>${curDate-1}</option>
    			<option>${curDate-2}</option>
    		</select>
    	</div>
    	
    	
    	
    	<c:set var="parentCode" value="1"/>
		<c:set var="gubun" value="이용권"/>
		<c:set var="payDate" value="${lastPayDate}"/>
		
		<c:forEach var="dto" items="${list}" varStatus="status" >
      		<c:if test="${status.first || parentCode!=dto.parentCode || payDate!=dto.payDate}">
      			<c:set var="parentCode" value="${dto.parentCode}"/>
      				<c:if test="${dto.parentCode==1}">
	           			<c:set var="gubun" value="이용권"/>
	      			</c:if>
          			<c:if test="${dto.parentCode==2}">
	            		<c:set var="gubun" value="기프트콘"/>
	      			</c:if>
	      			<c:set var="payDate" value="${dto.payDate}"/>
	      			
	      			
	      			<c:if test="${! status.first}">
			     		</table>
			     		</div>
			     		</div>
		  			</c:if>
		  			
		  			
		  			<div style="border: 1px solid #e1e1e1; margin-top: 15px;">
		  			
		  			<div style="background-color: #e1e1e1;">
    					<div style="padding: 10px;">
    						<h5 style="display: inline;">구매일</h5>
    						<h5 style="font-weight: bold; display: inline; margin-left: 10px;">${dto.payDate}</h5>
    					</div>
    				</div>
		  				
		  			<div style="margin: 15px;">
		  				<table style="border: 1px solid #e1e1e1;">
		  					<tr>
		             			<th rowspan="${dto.rowspan}" style="width: 15%">${gubun}</th>
		             			<th>상품명</th>
		             			<th>가격 / 수량</th>
		             			<th rowspan="${dto.rowspan}" style="width: 15%">
		             				<p><fmt:formatNumber value="${dto.payPrice}" type="number" pattern="#,###원"/></p>
		             				<c:forEach var="vo" items="${uselist}">
		             				<c:if test="${dto.payCode != vo.PAYCODELIST}">
		             					<button type="button" class="btn btn-danger">구매취소</button>
		             				</c:if>
		             				</c:forEach>
		             			</th>
		      				</tr>
      		</c:if>
      		<tr>
      			<td>${dto.gubunName} - ${dto.goodsName}</td>
      			<td><fmt:formatNumber value="${dto.price}" type="number" pattern="#,###원"/> / ${dto.quantity}개</td>
      		</tr>
      	</c:forEach>
      	
      	<c:if test="${list.size()>0}">
		     </table>
		     </div>
		     </div>
		 </c:if>	
    	
    	
    	
    	
    
    
    
    
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