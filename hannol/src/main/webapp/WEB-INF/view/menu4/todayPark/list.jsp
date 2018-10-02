<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<style type="text/css">

.giftSelect{
	height: 30px;
	margin: 15px;
	float: left;
}

.imgLayout{
	width: 190px;
	height: 205px;
	padding: 10px 5px 10px;
	margin: 5px;
	border: 1px solid #DAD9FF;
	cursor: pointer;
}
.subject {
     width:180px;
     height:25px;
     line-height:25px;
     margin:5px auto;
     border-top: 1px solid #DAD9FF;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
}

.subList:after {
	content: '';
	display: block;
	clear: both;
}

.thumbnail>a>img {
	margin-bottom: 5%;
}


</style>

<script type="text/javascript">

$(function() {
	var page = ${page};
	var sort = ${sort};
	alert(sort);
	
	$("#tab-${tab}").addClass("active");
	listPage(page);
	
	$("ul.tabs li").click(function() {
		var tab = $(this).attr("data-tab");
		$("ul.tabs li").each(function() {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		listPage(1,orderby);
	});
	
	//정렬변경될때마다 이벤트 발생.. 처리
	function orderList(){
		alert("정렬선택!");
		var orderby = $(".form-control rides-form-control").val();
		listPage(1,sort);
	};
});

function listPage(page, sort) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var gubunCode = $tab.attr("data-gubuncode");
	
	if(!gubunCode)
		gubunCode=0;		
	
	var url = "<%=cp%>/today/subList";
	
	var query = "page="+page+"&tab="+tab+"&gubunCode="+gubunCode+"&sort="+sort;
	ajaxHTML(url, "get", query);
}

//ajax 공통함수
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type,
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
				alert("에러남");
				return;
			}
			$("#tab-content").html(data);
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

/* 정렬 */



</script>

<div class="bodyFrame2" style="width: 630px;">
    <div class="body-title">
        <h3>
        	<span class="glyphicon glyphicon-gift"></span> 놀이기구
		</h3>
    </div>

<!-- 정렬폼 -->    
<!-- 
    <div class="ridesSelect">
		<div class="itemSelect">
			<select class="form-control rides-form-control" onchange="orderList();">
				<option value="facilityCode">::정렬::</option>
				<option value="waitTime">대기시간</option>
				<option value="population">인기</option>
			</select>
		</div>
	</div> 
-->

	<div class="div-menu">
		<select class="form-control rides-form-control" name="searchKey" id="searchKey" onchange="orderList();">
				<option value="waitTime">대기시간</option>
				<option value="population">인기</option>
		</select>
	</div>


    
	<div>
		<div style="clear: both;">
			<ul class="tabs">
				<li id="tab-princess" data-tab="princess" data-gubuncode=1>프린세스빌리지</li>
				<li id="tab-toy" data-tab="toy" data-gubuncode=2>토이스토리</li>
				<li id="tab-mini" data-tab="mini" data-gubuncode=3>미니언즈</li>
				<li id="tab-lion" data-tab="lion" data-gubuncode=5>라이언킹</li>
				<li id="tab-nimo" data-tab="nimo" data-gubuncode=6>니모</li>
			</ul>
		</div>
		<div id="tab-content"></div>
	</div>


</div>