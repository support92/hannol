<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.selectMenu{
	float: right;
}
</style>

<script type="text/javascript">
$(function(){
	listPage(1);
});

function listPage(page){
	var order = $(".form-control").val();
	
	var data = "page="+page+"&order="+order;
	var url = "<%=cp%>/mypage/rankCouponListBody";
	
	$.ajax({
		type:"POST"
		,url:url
		,data: data
		,success:function(data) {
			$(".td-coupon").html(data);			
			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>

<div class="bodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-tower"></span> 등급 혜택
		</h3>
	</div>

	


	<div>
		<div class="selectMenu">
			<select class="form-control" onchange="listPage('1')">
				<option value="recent">최근발급순</option>
				<option value="endDate">만료임박순</option>
			</select>
		</div>
	
		<div class="td-coupon">
			
		</div>
	</div>
</div>