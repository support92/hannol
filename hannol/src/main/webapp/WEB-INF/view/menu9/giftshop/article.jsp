<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.giftLeftLayout{
	float : left;
	width: 50%;
}

.giftRightLayout{
	float : left;
	padding : 15px;
	width: 50%;
}

#carousel-custom {
    margin: 15px auto;
    width: 100%;
}
#carousel-custom .carousel-indicators {
    margin: 10px 0 0;
    overflow: auto;
    position: static;
    text-align: left;
    white-space: nowrap;
    width: 100%;
}
#carousel-custom .carousel-indicators li {
    background-color: transparent;
    -webkit-border-radius: 0;
    border-radius: 0;
    display: inline-block;
    height: auto;
    margin: 0 !important;
    width: auto;
}
#carousel-custom .carousel-indicators li img {
    display: block;
    opacity: 0.5;
}
#carousel-custom .carousel-indicators li.active img {
    opacity: 1;
}
#carousel-custom .carousel-indicators li:hover img {
    opacity: 0.75;
}
#carousel-custom .carousel-outer {
    position: relative;
}

.item > img{
	width : 100%;
}

.itemSubject{
	font-size: 20px;
}

.itemPrice{
	font-size: 14px;
}

.itemPrice{
	font-weight: bold;
}

.giftItemDetail{
	width: 100%;
	display: inline-block;
}

.giftItemDetail img{
	width: 100%;
}

.itemCount{
	margin: 15px 0px;
}

.giftItemDetail > img{
	width: 100%;
}



@media (max-width: 767px){
	.giftLeftLayout {
    width : 100%;
	}
}

/*상품구분, 상품가격*/
.goodsGubun, .div-price, .div-quat, .div-total{
	font-size: 16px;
	margin-bottom: 2px;
}

/*상품명*/
.goodsName{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

/*상품 가격*/
.giftPrice{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}

/*상품 수량*/

.quantity{
	margin-bottom: 20px;
	height: 20px; 
	
}

.ipt_count_chk{
	padding: 1px 4px 1px;
	height: 21px;
	width: 40px;
	margin-left: 21px;
	text-align: center;
	position: absolute;
}

.btn_minus{
	position: absolute;
	width: 21px;
	height: 21px;
	line-height : 21px;
	background: url(/hannol/resource/images/minus.png) no-repeat -1px -1px;
	border: 0 none;
}

.btn_plus{
	right: 0;
	position: absolute;
	width: 387px;
	height: 21px;
	line-height : 21px;
	background: url(/hannol/resource/images/plus.png) no-repeat -1px -1px;
	border: 0 none;
}


.btn_plus, .btn_minus{
	outline: none;
}

/*총 가격*/
.div-tPrice{
	font-size: 30px;
	font-weight: bold;
	color : red;
	margin-bottom: 20px; 
	float: right;
}

.div-btn{
	clear: both;
	float: right;
}

.div-btn button{
	width: 130px;	
}

</style>

<script>
$(function(){
	var count = $(".ipt_count_chk").val();
	var price = "${dto.price}";
	var total = count*price;
	var quantity = "${dto.quantity}";
	
	$(".div-tPrice").html(numberWithCommas(total)+"원");
	
	$(".btn_minus").click(function(){
		var count = $(".ipt_count_chk").val();
		if(Number(count)-1<1){
			alert("최소수량은 1개 이상입니다.");
			return;
		}
		
		$(".ipt_count_chk").val(Number(count)-1);
		var count = $(".ipt_count_chk").val();
		var total = count*price;
		$(".div-tPrice").html(numberWithCommas(total)+"원");
		
	});
	
	$(".btn_plus").click(function(){
		var count = $(".ipt_count_chk").val();
		if(Number(quantity)<Number(count)+1){
			alert("현재 구매 가능 수량은 "+quantity+"개 입니다.");
			return;
		}
		
		if(Number(count)+1>4){
			alert("최대수량은 4개 입니다.");
			return;
		}
		
		$(".ipt_count_chk").val(Number(count)+1);
		var count = $(".ipt_count_chk").val();
		var total = count*price;
		$(".div-tPrice").html(numberWithCommas(total)+"원");
	});
	
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


</script>

<script>
$(function(){
	$(".item").eq(0).addClass("active");
	$(".mCustomScrollbar").children().eq(0).addClass("active");
});
</script>

<div class="giftLeftLayout">
	<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
    <div class='carousel-outer'>
        <!-- Wrapper for slides -->
        <div class='carousel-inner'>
        <c:forEach items="${dto.fileList}" var="itemImg">
        	<div class='item'>
                <img style="width: 400px;" src='/hannolAdmin/uploads/giftShopGoods/${itemImg.SAVEFILENAME}' alt="${itemImg.ORIGINALFILENAME}" onerror="this.src='<%=cp%>/resource/images/noimage.png'"/>
            </div>
        </c:forEach>
        </div>
    </div>
    
    <!-- Indicators -->
    <ol class='carousel-indicators mCustomScrollbar'>
    <c:forEach items="${dto.fileList}" var="itemImg" varStatus="status">
    	<li data-target='#carousel-custom' data-slide-to='${status.index}'><img style="width: 100px;" src='/hannolAdmin/uploads/giftShopGoods/${itemImg.SAVEFILENAME}' alt='' onerror="this.src='<%=cp%>/resource/images/noimage.png'" /></li>
    </c:forEach>
    </ol>
</div>
</div>
<div class="giftRightLayout">
	<div id="goodsGubun" class="goodsGubun">[${dto.gubunName }]</div>
	<div id="goodsName" class="goodsName">${dto.goodsName}</div>
	<div class="div-price">가격</div>
	<div id="price" class="giftPrice"><fmt:formatNumber value="${dto.price}" type="number" pattern="#,###원"/></div>
	<div class="div-quat">수량</div>
	<div id="quantity" class="quantity">
		<button type="button" class="btn_minus">
			<span class="hide">수량감소</span>
		</button>
		<input type="text" value="1" class="ipt_count_chk" id="">
		<button type="button" class="btn_plus">
			<span class="hide">수량증가</span>
		</button>
	</div>
	<div class="div-total">총 상품금액</div>
	<div class="div-tPrice"></div>
	
	<div class="div-btn">
		<button class="btn btn-default">돌아가기</button>
		<button class="btn btn-default">장바구니</button>
		<button class="btn btn-danger">구매하기</button>
	</div>
</div>

<div class="giftItemDetail">
	${dto.content}
</div>




