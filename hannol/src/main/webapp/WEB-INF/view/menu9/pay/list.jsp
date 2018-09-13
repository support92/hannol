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

.custom_h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    color: #333;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}

.custom_col1 {
    width: 50%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
}

.customer_col2 {
	width: 50%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.pay_price {
    border-top: 2px solid #cecece;
}

.col_title {
    vertical-align: top;
    text-align: right;
    padding-right: 10px;
    border-right: 1px solid #e4e4e4;
    border-bottom: 1px solid #e4e4e4;
    background: #f4f4f4;
}

.price {
    display: inline-block;
    width: 100px;
    padding-left: 15px;
    padding-bottom: 10px;
}

.table_col{
	border-bottom: 1px solid #e4e4e4;
}

select {
    height: 23px;
    font-size: 12px;
    vertical-align: middle;
}

.pay-type-section {
    padding: 10px 0;
    margin: 0;
    line-height: 21px;
    border-bottom: 1px solid #e4e4e4;
}

.line-title {
    display: inline-block;
    width: 90px;
    font-size: 12px;
    font-weight: bold;
    margin: 0;
    vertical-align: middle;
    padding-left: 15px;
}

.pay-type-section .line-title:before {
    content: "";
    position: relative;
    display: inline-block;
    width: 3px;
    height: 3px;
    margin-left: 2px;
    margin-right: 4px;
    vertical-align: middle;
    background: #55575f;
}
s}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#readTermsInfo").click(function(){
		$("#terms-info").slideUp();
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
		}else{
			$(this).next().slideUp();
		}
	})
})

$(function(){
	$("input:checkbox[id='termsCheck']").click(function(){
		if($("input:checkbox[id='termsCheck']").is(":checked")){
			$("#alerCheck").hide();
		}
	})
})

function isTermsCheck(){
	var str = $("#cardSelect option:checked").val();
    if(!str) {
        alert("카드사를 선택하세요.");
        $("#cardSelect").focus();
        return;
    }else if($("input:checkbox[id='termsCheck']").is(":checked")){
    	$("#payModal").modal();
	}else{
		$("#alerCheck").show();
	}
}

</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-credit-card"></span> 결제 </h3>
    </div>
    
    <div>
	    <h2 class="custom_h2">상품정보</h2>
		<table class="custom_table">
		  <tbody>
			<%-- <c:forEach var="vo" items="${list}"> --%>
				<tr>
					<td class="custom_col1">프린세스 빌리지 - 신데렐라 왕관</td>
					<td class="customer_col2">각 15000원 / 수량 2개</td>
				</tr>
			<%-- </c:forEach> --%>
		  </tbody>
		</table>
		
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }"><span style="color: red;">선택한 상품이 없습니다.</span></c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
		<h2 class="custom_h2">결제정보</h2>
		<table class="pay_price">
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
		  		<c:if test="${dto.gubunCode == 1}">
				<tr class="table_col">
					<th class="col_title">총 상품 가격</th>
					<td>
						<strong class="price">23,000원</strong>
					</td>
				</tr>
				<tr class="table_col">
					<th class="col_title">쿠폰</th>
					<td>
						<div style="display: inline; padding-left: 15px;">
						<select id="couponSelect">
							<option>사용안함</option>
							<c:if test="${couponCount > 0}">
								<c:forEach var="i" begin="1" end="${couponCount}">
									<option>${i}</option>
								</c:forEach>
							</c:if>
						</select>
						</div>
						<div style="display: inline-block; padding-left: 15px;">
							<c:if test="${couponCount > 0}"><span>적용 가능한 할인 쿠폰이 ${couponCount}개 있습니다.</span></c:if>
							<c:if test="${couponCount == 0}"><span>적용 가능한 할인쿠폰이 없습니다.</span></c:if>
						</div>
					</td>
				</tr>
				<tr class="table_col">
					<th class="col_title">할인 금액</th>
					<td>
						<strong class="price">0원</strong>
					</td>
				</tr>
				</c:if>
				<tr class="table_col">
					<th class="col_title">총 결제 금액</th>
					<td>
						<strong class="price" style="color: red;">23,000원</strong>
					</td>
				</tr>
				<tr class="table_col">
					<th class="col_title">결제 카드</th>
					<td>
						<ul>
							<li class="pay-type-section">
								<label class="line-title">카드종류</label>
								<div style="display: inline;">
									<select id="cardSelect">
										<option value="">카드 선택</option>
										<option value="현대">현대 카드</option>
										<option value="신한">신한 카드</option>
										<option value="우리">우리 카드</option>
										<option value="BC">BC 카드</option>
										<option value="씨티">씨티 카드</option>
										<option value="롯데">롯데 카드</option>
										<option value="국민">국민 카드</option>
										<option value="농협">농협 카드</option>
										<option value="하나">하나 카드</option>
										<option value="삼성">삼성 카드</option>
									</select>
								</div>
								<c:if test="${dto.gubunCode == 1}">
								<div style="display: inline-block; padding-left: 10px;">
									<span style="color:#888888;">* 제휴카드는 카드 선택시 자동으로 제휴할인이 적용됩니다.</span>
								</div>
								</c:if>
							</li>
							<li class="pay-type-section">
								<label class="line-title">할부기간</label>
								<div style="display: inline;">
									<select>
										<option>일시불</option>
										<option>2개월(무이자)</option>
										<option>3개월(무이자)</option>
										<option>4개월</option>
										<option>5개월</option>
										<option>6개월</option>
										<option>7개월</option>
										<option>8개월</option>
										<option>9개월</option>
										<option>10개월</option>
										<option>11개월</option>
										<option>12개월</option>
									</select>
									<span style="display: inline-block; margin-left: 10px; vertical-align: center; color:#888888;">* 할부는 50,000원 이상만 가능합니다.</span>
									<div style="margin-left: 20px; margin-top: 10px;">
										<img width="70%;" src="<%=cp%>/resource/images/pay_section.png">
									</div>
								</div>
							</li>
						</ul> 
					</td>
				</tr>
		  </tbody>
		</table>
		
		<div style="margin-top: 5px;">
			<input id="termsCheck" type="checkbox"><span style="vertical-align: center;"> (필수) 구매조건 확인 및 결제대행 서비스 약관 동의</span><a id="readTermsInfo" style="cursor: pointer;">  [보기]</a>
			<div id="terms-info" style="margin-left: 15px; display: none;">
				<div><span>서비스 이용 약관 동의</span></div>								
				<div><span>개인정보 수집 및 이용 동의</span></div>								
				<div><span>개인정보 제공 및 위탁 동의</span></div>							
			</div>
		</div>
		<div id="alerCheck" style="display: none;"><span style="color: red; margin-top: 5px; margin-left: 15px;">구매조건 확인 및 결제대행 서비스 약관에 동의하셔야 합니다.</span></div>		
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr>
		   	  <td align="center" width="100" style="padding-top: 5px; padding-bottom: 5px;">
		      	<span>위 주문 내용을 확인하였으며, 결제에 동의합니다.</span>
		      </td>
		   </tr>
		   <tr height="40">
		      <td align="center" width="100">
		          <button id="payButton" type="button" class="btn btn-danger" style="font-weight: bold;" onclick="isTermsCheck();">결제하기</button>
		      </td>
		   </tr>
		</table>
    </div>
    
    
    <div style="display: none;" id="payModal" role="dialog" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
		    	<div class="modal-header">
 					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  					<span aria-hidden="true">×</span></button>
 					<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">
 						결제하기
 					</h4>
				</div>
				<div class="modal-body">
					<div>
						<div id="modalcard" style="margin-bottom: 10px;">
							<div>
								<c:if test="${empty dto.saveFilename}"><img src="<%=cp%>/resource/images/NoCard.PNG" class="cardImage" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
								<c:if test="${not empty dto.saveFilename}"><img src="/hannolAdmin/uploads/card/${dto.saveFilename}" class="cardImage" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
							</div>						
						</div>
						<div id="modalcontent">
							<h4 style="font-weight: bold; display: block;">${dto.cardName}</h4>
							<br>
							<span style="font-weight: bold; display: block;">이용혜택</span>
							<span style="display: block;">- 자유이용권 ${dto.discount}%</span>
							<span style="display: block;">(본인에 한함. 전 놀이공원 1일, 1회)</span>
							<span style="display: block;">${dto.startDate} ~ ${dto.endDate}</span>
						</div>
					</div>
					<div class="boxIn" align="left" style="clear: both; padding: 10px;">
						${dto.memo}
					</div>
				</div>
			</div>
		</div>
	</div>
    
    

</div>   