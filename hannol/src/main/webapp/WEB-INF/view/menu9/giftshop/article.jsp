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
</style>

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
	<div class="itemSubject">${dto.goodsName}</div>
	<div class="itemPrice"><fmt:formatNumber value="${dto.price}" type="number"/>원</div>
	<c:if test="${dto.quantity!=0 }">
		<div>수량</div>
		<button type="button" class="btn btn-default">-</button>
		<input type="text" value="1">
		<button type="button" class="btn btn-default">+</button>
	</c:if>
	<c:if test="${dto.quantity==0 }">
		<div class="itemCount">
			<div>수량</div>
			<div>품절</div>
		</div>
	</c:if>
	<div>
		<div class="itemPrice">총상품금액 : </div>
		
	</div>
	<div style="margin: 0px auto;">
	
		<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/giftshop/list?${dataQuery}';">돌아가기</button>
	
		<button type="button" class="btn btn-default">장바구니</button>
		
		<button type="button" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/pay/list';">구매하기</button>
	</div>
</div>

<div class="giftItemDetail">
	${dto.content}
</div>




