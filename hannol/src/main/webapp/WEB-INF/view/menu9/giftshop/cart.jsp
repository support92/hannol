<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.div_basket{
	border-bottom: 1px solid #ddd;
}

/* Table */
.tb{
	width: 100%;
	border-top: 2px solid #198292;
	border-collapse: separate;
}

/* checkBox */
.tb_th{
	border-right: 1px solid #ddd;
}

.tb th{
	text-align: center;
	font-size: 12px;
	height: 40px;
	line-height: 40px;
}

/* 상품 목록 */
.cart_list{
	border-top: 1px solid #ddd;
	height: 130px;
}

.tb td{
	text-align: center;
}

/* 전체 삭제 버튼*/
.btn-delete-all{
	font-size: 12px;
	padding: 3px;
}

.check_all{
	margin: 0px 25px 25px 6px;
    padding: 10px 0px;
}

/*결제 예상 테이블*/
.tb_total{
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.div_total{
	border-top: 2px solid #333;
	border-bottom: 1px solid #e1e1e1;
}

.th_price_sub{
	background: #f3f3f3;
	font-size: 20px;
	height: 50px;
	text-align: right;
	padding-right: 10px;
}

.th_price{
	border-top: 1px solid #ddd;
	color: tomato;
	font-size: 20px;
	font-weight: bold;
	height: 50px;
	text-align: right;
	padding-right: 10px;
}

.quantity{
    width: 30px;
    height: 21px;
    text-align: center;
    float: left;
}

.btn_minus{    
	width: 21px;
    height: 21px;
    background: url(/hannol/resource/images/minus.png) no-repeat -1px -1px;
    border: 0 none;
    float: left;
}

.btn_plus{
	width: 21px;
	height: 21px;
	line-height : 21px;
	background: url(/hannol/resource/images/plus.png) no-repeat -1px -1px;
	border: 0 none;
	float: left;
}

.cart_one button{
	padding: 5px;
}


</style>

<script>

</script>

<div class="bodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-shopping-cart"></span>장바구니
		</h3>
	</div>
	
	<div class="div_basket">
		<table class="tb">
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="checkbox_all" class="">
					</th>
					<th class="tb_th" style="width: 40%">
						상품/정보
					</th>
					<th class="tb_th">
						수량
					</th>
					<th class="tb_th">
						상품금액
					</th>
					<th>
						주문
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="cart_list" colspan="5">
						장바구니에 담겨있는 상품이 없습니다.
					</td>
				</tr>
				
				<tr>
					<td class="cart_list">
						<input type="checkbox">
					</td>
					<td class="cart_list tb_th" style="text-align: left;">
						<span>
							<img src="<%=cp%>/resource/images/noimage.png" width="50" height="50">
						</span>
						<span>
							[니모] 니모봉제가방
						</span>
					</td>
					<td class="cart_list tb_th">
						<div>
							<button type="button" class="btn_minus"></button>
							<input type="text" class="quantity" value="1">
							<button type="button" class="btn_plus"></button>
						</div>
					</td>
					<td class="cart_list tb_th" style="font-weight: bold;">
						40,000원
					</td>
					<td class="cart_list cart_one">
						<button type="button" class="btn btn-default">삭제하기</button>
						<button type="button" class="btn btn-danger">주문하기</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="check_all">
		<input type="checkbox">
		<button type="button" class="btn btn-default btn-delete-all">선택삭제</button>
	</div>
	
	<div class="div_total">
		<table class="tb_total">
			<thead>
				<tr>
					<th class="th_price_sub">
						결제 예정금액
					</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td class="th_price">
						00,000원
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div style="text-align: center; margin-top: 20px;">
		<button type="button" class="btn btn-default">쇼핑 계속하기</button>
		<button type="button" class="btn btn-danger">주문결제</button>
	</div>
</div>






