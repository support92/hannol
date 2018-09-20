<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.buy_info{
	width: 100%;
}

.img_area{
	float: left;
	position: relative;
	width: 45%;
}

.img_area img{
	width: 100%;
}

.price_area{
	float:left; 
	margin-left: 10px;
	width: 45%;
}

#ticket_gubun, #ticket_person, #ticket_count{
	padding: 3px;
	width: 100%;
	font-size: 14px;
	margin-top: 15px;
}
</style>

<script>
$(function(){
	$("#ticket_gubun").change(function(){
		if($(this).val() == ""){
			$("#ticket_person").attr("disabled", true);
		}else{
			$("#ticket_person").attr("disabled", false);
			var gubunItem = $(this).val();
			if(gubunItem==1){
				
			}
		}
	});
});
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="	glyphicon glyphicon-calendar"></span>예매</h3>
    </div>
    
    <div class="buy_info">
    	<div class="img_area">
    		<img alt="한놀 HANNOL" src="<%=cp%>/resource/images/hannol_logo.jpg">
    	</div>
    	
    	<div class="price_area">
    		<h4 class="day_title">[${day}]</h4>
    		<div class="goods_option">
    			<select id="ticket_gubun">
    				<option value="">::권종선택::</option>
    				<c:forEach items="${oneDay}"></c:forEach>
    				<c:if test="${not empty oneDay}">
    					<option value="1">종일권</option>
    				</c:if>
    				<c:if test="${not empty oneDayMasic}">
    					<option value="2">종일권+매직패스</option>
    				</c:if>
    				<c:if test="${not empty after}">
    					<option value="3">야간권</option>
    				</c:if>
    				<c:if test="${not empty afterMasic}">
    					<option value="4">야간권+매직패스</option>
    				</c:if>
    				<c:if test="${not empty big}">
    					<option value="5">BIG5</option>
    				</c:if>
    			</select>
    			
    			<select id="ticket_person" disabled="disabled">
    				<option value="">::구분::</option>
    				
    			</select>
    			
    			<select id="ticket_count" disabled="disabled">
    				<option value="">::수량::</option>
    				<option value="1">1</option>
    				<option value="2">2</option>
    				<option value="3">3</option>
    				<option value="4">4</option>
    			</select>
    		</div>
    	</div>
    </div>
</div>