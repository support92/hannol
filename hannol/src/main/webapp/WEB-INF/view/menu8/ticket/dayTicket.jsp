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
	margin-left: 30px;
	width: 45%;
}

#ticket_gubun, #ticket_person, #ticket_count{
	padding: 3px;
	width: 100%;
	font-size: 14px;
	margin-top: 15px;
}

.ticket_result{
	font-size: 14px;
	margin-top: 15px;
	width: 100%;
	border-top: 1px solid #e2e2e2;
}

.input-count{
	width: 42px;
	text-align: center;
}

.btn_delete{
  width: 21px;
  height: 21px;
  background: url('<%=cp%>/resource/images/delete.png') no-repeat -1px -1px;
  border: none;
  line-height : 21px;
  float: right;
}
</style>

<script>
var endDate = "${day}";
var limit = "";


$(function(){
	$("#ticket_gubun").change(function(){
		$("#ticket_person option").css("display", "none");
		$("#ticket_person").val("");
		$("#ticket_count").val("");
		
		if($(this).val() == ""){
			$("#ticket_person").attr("disabled", true);
		}else{
			var gubunItem = $(this).val();
			if(gubunItem==1){
				$(".oneDay").css("display", "block");
			}else if(gubunItem==2){
				$(".oneDayMasic").css("display", "block");
			}else if(gubunItem==3){
				$(".after").css("display", "block");
			}else if(gubunItem==4){
				$(".afterMasic").css("display", "block");
			}else if(gubunItem==5){
				$(".big").css("display", "block");
			}
			
			$("#ticket_person").attr("disabled", false);
		}
	});
	
	$("#ticket_person").change(function(){
		$("#ticket_count").val("");
		$("#ticket_count").attr("disabled", false);
	});
	
	$("#ticket_count").change(function(){
		console.log(totalCount());
		var total = totalCount()+Number($(this).val());
		if(total>4){
			alert("4매 이상 구매할 수 없습니다.");
			return;
		}
		
		var $item = $("#ticket_person option:selected");
		var goodsCode = $item.val();
		var goodsName = $item.attr("data-goodsName");
		var goodsPrice = $item.attr("data-goodsPrice");
		var gubunCode = $item.attr("data-gubunCode");
		var gubunName = $item.attr("data-gubunName");
		var parentCode = $item.attr("data-parentCode");
		
		var html ="<li>";
		html+="<span>["+$("#ticket_gubun option:selected").text()+"]</span>";
		html+="<span>"+goodsName+"</span>";
		html+="<span class='input-count'>X"+$(this).val()+"</span>";
		html+="<span><button type='button' class='btn_delete'></button></span>";
		html+="";
		
		html+="</li>";
			
		$(".ticket_result").find("ul").append(html);
	});
	
	$(document).on("click",".btn_delete",function(){
		$(this).closest("li").remove();
	});
	
	$(".btn-pay").click(function(){
		$("#saleForm").submit();
	});
});

function totalCount(){
	var total = 0;
	$(".input-count").each(function(){
		total+=Number($(this).text().substring(1));
	});
	
	return total;
}
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
    				<c:forEach items="${oneDay}" var="item">
    					<option value="${item.goodsCode}" class="oneDay" style="display: none;" data-goodsName="${item.goodsName}" data-gubunCode="${item.gubunCode}"
    					 data-goodsPrice="${item.goodsPrice}" data-gubunName="${item.gubunName}" data-parentCode="${item.parentCode}">${item.goodsName}[${item.goodsPrice}원]</option>
    				</c:forEach>
    				<c:forEach items="${oneDayMasic}" var="item">
    					<option value="${item.goodsCode}" class="oneDayMasic" style="display: none;"data-goodsName="${item.goodsName}" data-gubunCode="${item.gubunCode}"
    					 data-goodsPrice="${item.goodsPrice}" data-gubunName="${item.gubunName}" data-parentCode="${item.parentCode}">${item.goodsName}[${item.goodsPrice}원]</option>
    				</c:forEach>
    				<c:forEach items="${after}" var="item">
    					<option value="${item.goodsCode}" class="after" style="display: none;"data-goodsName="${item.goodsName}" data-gubunCode="${item.gubunCode}"
    					 data-goodsPrice="${item.goodsPrice}" data-gubunName="${item.gubunName}" data-parentCode="${item.parentCode}">${item.goodsName}[${item.goodsPrice}원]</option>
    				</c:forEach>
    				<c:forEach items="${afterMasic}" var="item">
    					<option value="${item.goodsCode}" class="afterMasic" style="display: none;"data-goodsName="${item.goodsName}" data-gubunCode="${item.gubunCode}"
    					 data-goodsPrice="${item.goodsPrice}" data-gubunName="${item.gubunName}" data-parentCode="${item.parentCode}">${item.goodsName}[${item.goodsPrice}원]</option>
    				</c:forEach>
    				<c:forEach items="${big}" var="item">
    					<option value="${item.goodsCode}" class="big" style="display: none;"data-goodsName="${item.goodsName}" data-gubunCode="${item.gubunCode}"
    					 data-goodsPrice="${item.goodsPrice}" data-gubunName="${item.gubunName}" data-parentCode="${item.parentCode}">${item.goodsName}[${item.goodsPrice}원]</option>
    				</c:forEach>
    				
    			</select>
    			
    			<select id="ticket_count" disabled="disabled">
    				<option value="">::수량::</option>
    				<option value="1">1</option>
    				<option value="2">2</option>
    				<option value="3">3</option>
    				<option value="4">4</option>
    			</select>
    		</div>
    		
    		<div class="ticket_result">
	    		<form action="<%=cp%>/pay/list" method="post" id="saleForm">
	    			<ul style="margin: 15px 0px;">
	    				<li>
	    					<input type="hidden" name="goodsCode" value="">
							<input type="hidden" name="gubunCode" value="">
							<input type="hidden" name="goodsName" value="">
							<input type="hidden" name="goodsPrice" value="">
							<input type="hidden" name="gubunName" value="">
							<input type="hidden" name="parentCode" value="">
							<input type="hidden" name="quantity" value="">
	    				</li>
	    			</ul>
	    		</form>
	    		<div style="text-align: center;">
	    			<button type="button" class="btn btn-defualt" style="width: 49%;">취소</button>
	    			<button type="button" class="btn btn-danger btn-pay" style="width: 49%;">결제</button>
	    		</div>
    		</div>
    	</div>
    </div>
</div>