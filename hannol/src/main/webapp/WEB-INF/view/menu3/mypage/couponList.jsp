<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
var couponTypeP =0;
var couponType = "${thema}";

$(function(){
	$('.nav-item').removeClass('active');
	$(".nav-item").each(function(){
		if( $(this).attr("data-coupon-gubun") == couponType){
			$(this).addClass("active");
			return;
		}
	});
	
	listPage("${page}", couponType);
	
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
		
		couponTypeP = $(this).parent(".nav-item").data("coupon-gubun");
		
		listPage(1, couponTypeP);
	});
});


function listPage(page, couponType){	
	var url = "<%=cp%>/mypage/ajaxCouponList"
	var data = "page="+page;
	
	
	data+="&couponType="+couponType;
	
	
	$.ajax({
		type:"GET"
		,url:url
		,data: data
		,success:function(data) {
			$(".couponList").html(data);			
			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-star"></span> 쿠폰함</h3>
    </div>
        
    <div class="alert alert-warning">
        <i class="glyphicon glyphicon-warning-sign"></i>
        	쿠폰 사용 버튼을 누르면 사용이 완료되어 더이상 사용이 불가능하니 주의하십시오.<br>
        <i class="glyphicon glyphicon-info-sign"></i>
       		 쿠폰 사용 여부에 문제가 있을 경우 관리자에게 문의하여 주십시오.
    </div>   

	<div>
		<ul class="nav nav-tabs">
			<li class="nav-item active" data-coupon-gubun="0">
				<a class="nav-link">기프트콘함</a>
			</li>
			<li class="nav-item" data-coupon-gubun="1">
				<a class="nav-link">티켓함</a>
			</li>
		</ul>

	</div>

	<div class="couponList" style="width: 100%;">
    	

	</div>
</div>