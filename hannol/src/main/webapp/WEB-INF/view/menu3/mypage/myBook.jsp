<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<style>
.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}
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
</style>

<script type="text/javascript">
$(function() {
	var pageNo = ${pageNo};
	
	$("#tab-${tab}").addClass("active");
	listPage(pageNo);
	
	$("ul.tabs li").click(function() {
		var tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function() {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		listPage(1);
	});
});

function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var gubunCode = $tab.attr("data-gubuncode");
	var url = "<%=cp%>/show/" + gubunCode + "/list";
	
	var query = "pageNo="+page+"&tab="+tab;
	var search = $("form[name=searchForm]").serialize();
	query += "&" + search;
	ajaxHTML(url, "get", query);
}

// ajax 공통함수
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type,
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
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

function insertShowInfo() {
	var checked = $("input[name=showRadio]:checked");
	if(!checked.val()) {
		alert('공연을 선택하세요');
		return;
	}
	
	var showCode = checked.attr("data-showCode");
	
	var url = '<%=cp%>/show/article?showCode=' + showCode;
	location.href = url;
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span>내 예매 정보확인 </h3>
    </div>
    
    <div>
       <div style="clear: both;">
           <ul class="tabs">
		       <li id="tab-all" data-tab="all" data-gubuncode="0">전체</li>
		       <li id="tab-magicpass" data-tab="magicpass" data-gubuncode="1">매직패스</li>
		       <li id="tab-guide" data-tab="guide" data-gubuncode="2">가이드</li>
		       <li id="tab-stage" data-tab="stage" data-gubuncode="3">무대공연</li>
		       <li id="tab-facility" data-tab="facility" data-gubuncode="4">편의시설</li>
		   </ul>
	   </div>
	   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
    </div>
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 10%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">예약코드</th>
		      <th scope="col">구분</th>
		      <th scope="col">예약이름</th>
		      <th scope="col">연락처</th>
		      <th scope="col">예약내용</th>
		      <th scope="col">예약일자</th>
		    </tr>
		  </thead>
		  <tbody>
		  
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td>${dto.bookCode}</td>
			      <td>${dto.timezone}</td>
			      <td>${dto.name}</td>
			      <td>${dto.tel}</td>
			      <td>${dto.role}</td>
			      <td>${dto.workDate}</td>
			    </tr>
			    </c:forEach>
			    
		  </tbody>
		</table>
		
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
		   <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/list';">새로고침</button>
		      </td>
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
    </div>
</div>