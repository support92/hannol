<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
	.assetsContents{text-align:center;}
	.assets_box{display:inline-block; position:relative; width:30%; margin-left:1.5%; border:1px solid #d5d5d5; border-radius:3px;}    
	.assets_box:first-child{margin-left:0;} 
	.assets_box:hover{cursor:pointer;} 
	.assets_box:before{content:''; position:absolute; top:-1px; left:-1px; width:calc(100% + 2px); height:calc(100% + 2px); z-index:5;}     
    .assets_box:hover:before{box-shadow:10px 10px 15px rgba(0,0,0,0.2); transition:.3s ease;} 
    
	.assets_box dt img{width:100%;}  
	.assets_box dd{position:relative; padding:30px; text-align:left; color:#666666;}  
	.assets_box .as_symbol{width:50px; padding:3px; text-align:center; border-radius:19px; color:#b98413; border:1px solid #b98413;}
 	.assets_box .as_title{margin-top:20px; font-size:19px; font-weight:700;} 
 	.assets_box .as_subTitle{margin-top:2px;} 
 	.assets_box .as_btn{position:absolute; right:31px; bottom:32px; opacity:0.5;} 
 	
 	/*모바일*/
 	@media (max-width: 767px){
 		.assets_box{display:block; width:90%; margin:0 5% 10% 5%;}  
 		.assets_box:first-child{margin-left:5%;}   
 	}      
</style> 
 
<script type="text/javascript">
	$(function(){
		$(".assets_box").click(function(){
			var gubunCode = $(this).attr("data-gubun"); //구분 코드
			location.href="<%=cp%>/amenities/reservation?gubunCode="+gubunCode;     
		}); 
	}); 	
</script>


<div class="bodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-calendar"></span> 편의시설  
		</h3>
	</div>
	
	<div class="assetsContents">
		<dl id="stroller" class="assets_box" data-gubun="1">
			<dt>
				<img src="<%=cp%>/resource/images/assets_01.jpg" alt="유모차">
			</dt>
			<dd>
				<p class="as_symbol">대여</p>
				<p class="as_title">유모차</p>
				<p class="as_subTitle">유모차를 대여하세요.</p>
				<p class="as_btn"><img src="<%=cp%>/resource/images/btn_01.png"></p> 
			</dd>
		</dl>
		
		<dl id="wheelchair" class="assets_box" data-gubun="2">
			<dt>
				<img src="<%=cp%>/resource/images/assets_02.jpg" alt="휠체어"> 
			</dt>
			<dd>
				<p class="as_symbol">대여</p>
				<p class="as_title">휠체어</p>
				<p class="as_subTitle">휠체어를 대여하세요.</p>
				<p class="as_btn"><img src="<%=cp%>/resource/images/btn_01.png"></p>
			</dd>
		</dl>
		
		<dl id="storageBox" class="assets_box" data-gubun="3">
			<dt>
				<img src="<%=cp%>/resource/images/assets_03.jpg" alt="보관함"> 
			</dt>
			<dd>
				<p class="as_symbol">대여</p>
				<p class="as_title">보관함</p>
				<p class="as_subTitle">보관함를 대여하세요.</p>
				<p class="as_btn"><img src="<%=cp%>/resource/images/btn_01.png"></p>
			</dd>  
		</dl> 
	</div>
</div>








