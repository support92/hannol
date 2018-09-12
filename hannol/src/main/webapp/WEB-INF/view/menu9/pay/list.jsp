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

.pay-section-info {
    width: 110px;
    height: 20px;
    padding: 2px 13px 0 5px;
    border: solid 1px #b6b9c1;
    line-height: 13px;
    letter-spacing: -1px;
    color: #55575f;
    cursor: default;
    background-color: #fff;
}
</style>

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
						<select>
							<option>사용안함</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
						</div>
						<div style="display: inline-block; padding-left: 15px;">
							<span>적용 가능한 할인 쿠폰이 2개 있습니다.</span>
							<!-- <span>적용 가능한 할인쿠폰이 없습니다.</span> -->
						</div>
					</td>
				</tr>
				<tr class="table_col">
					<th class="col_title">할인 금액</th>
					<td>
						<strong class="price">0원</strong>
					</td>
				</tr>
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
									<select>
										<option>카드 선택</option>
									</select>
								</div>
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
									<span style="display: inline-block; margin-left: 10px; vertical-align: center; color:#888888;">*할부는 50,000원 이상만 가능합니다.</span>
									<div style="margin-left: 20px; margin-top: 10px;" class="pay-section-info">무이자 할부 혜택 ▼</div>
									<div style="margin-left: 20px; margin-top: 5px;">
										<img src="<%=cp%>/resource/images/pay_section.png">
									</div>
								</div>
							</li>
						</ul>
					</td>
				</tr>
		  </tbody>
		</table>
		
		<div style="margin-top: 5px;">
			<input type="checkbox"><span style="vertical-align: center;"> (필수) 구매조건 확인 및 결제대행 서비스 약관 동의</span><a>[보기]</a>
			<div><span style="color: red;">구매조건 확인 및 결제대행 서비스 약관에 동의하셔야 합니다.</span></div>
		</div>
		<div style="marmargin-top: 5px; margin-left: 15px;">
			<div><span>서비스 이용 약관 동의</span></div>								
			<div><span>개인정보 수집 및 이용 동의</span></div>								
			<div><span>개인정보 제공 및 위탁 동의</span></div>							
		</div>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr>
		   	  <td align="center" width="100" style="padding-top: 5px; padding-bottom: 5px;">
		      	<span>위 주문 내용을 확인하였으며, 결제에 동의합니다.</span>
		      </td>
		   </tr>
		   <tr height="40">
		      <td align="center" width="100">
		          <button type="button" class="btn btn-danger" style="font-weight: bold;" onclick="javascript:location.href='<%=cp%>/pay/pay';">결제하기</button>
		      </td>
		   </tr>
		</table>
		
    </div>

</div>   