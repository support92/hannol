<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	.table td{text-align:center;}
	.table td{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}

	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:203px;} 
	
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}
	  
</style>

<script>

$(function(){
	$(".reviewLayout").hide(); 
	listPage(1);
	
	$("body").on("click", ".btn-review", function(){
		var $reviewLayout = $(this).next("div");
		
		var isVisible = $reviewLayout.is(':visible');
			
		if(isVisible) {
			$reviewLayout.hide();
		} else {
			$reviewLayout.show();
		}
	});
	
	$("input[name=reviewDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        maxDate:0,
	}); 
});

// ajax-json : 후기 등록
function createReview() {
 	var f = document.reviewCreateForm;
	
	var val = f.reviewDate.value;
	if(!val) {
		alert('날짜를 선택하세요');
		return;
	}
	
	val = f.content.value.length;
	if(!val || val < 10) {
		alert('10자이상 입력하세요');
		return;
	}
	
	var url = "<%=cp%>/review/create";
	var query = $("#reviewCreateForm").serialize();
	ajaxJSON(url, "post", query);
}

function listPage(page) {
	var url = "<%=cp%>/review/listReview";
	var query = "pageNo=" + page;
	var divId = "listReview";
	ajaxHTML(url, "get", query, divId);
}

//ajax-text 공통함수
function ajaxHTML(url, type, query, divId) {
	$.ajax({
		type:type,
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
				return;
			}
			$("#"+divId).html(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){
			if(jqXHR.status==403){
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(jqXHR.responseText);
		}
	});
}

// ajax-json 공통함수
function ajaxJSON(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				listPage(1);
//				var count = data.boardLikeCount;
//				$("#boardLikeCount").text(count);
			} else if(state=="false") {
				$("#msg").text(data.msg);
			}
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
        <h3><span class="glyphicon glyphicon-pencil"></span> 이용후기 </h3>
    </div>
    
    <div class="alert alert-info">
        <i class="glyphicon glyphicon-info-sign"></i> 방문 소감을 남겨 주세요.<br>
	 	<span style='font-weight: bold;' > - 타인을 비방하거나 개인정보를 유출하는 글의 게시를 삼가 주세요.</span> 
    </div>

	<div align="right">
		<button type='button' class='btn btn-info btn-review' style='padding: 10px 20px;'>후기 등록</button>
	
		<div style="margin: 10px 0px;" class="reviewLayout">
			<form name="reviewCreateForm" id="reviewCreateForm" method="post">
				<table style='width: 80%; margin: 15px auto 0px; border-spacing: 0px;'>
					<tr>
						<th width="15%">방문날짜</th>
						<td>
							<span class="datepickerBox"><input type="text" name="reviewDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> 
						</td>
					</tr>
					<tr>
						<th>후 기</th>
						<td>
							<textarea class='boxTA'	style='width: 99%; height: 70px;' name="content" placeholder="10자이상 입력하세요"></textarea>
						</td>
					</tr>
				</table>
				<div align="center"><button type='button' class='btn' style='padding: 10px 20px;' onclick="createReview()">등록</button></div>
			</form>
		</div>  
		
	</div>
	<div align="center" id="msg"  style="color: red; font-weight: bold;"></div>

	<div>
		<img src="<%=cp%>/resource/images/like_heart_icon.png"  style="padding: 5px;" width="30px;" onerror="this.src='<%=cp%>/resource/images/gray_heart_icon.png'">
		<div id="listReview"></div>
    </div>
</div>