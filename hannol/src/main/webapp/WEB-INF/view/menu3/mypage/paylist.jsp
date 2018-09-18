<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
	int n = 0;
%>

<style>
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

.custom_table {
    width: 60%;
    border-top: 2px solid #cecece;
}

.custom_table2 {
    width: 80%;
    border-top: 2px solid #cecece;
}

.custom_h2 {
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    color: #333;
}

.table_th {
    width: 30%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

.table_td {
	width: 70%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.table_th2 {
    width: 30%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: center;
    background: #f4f4f4;
    font-size: 13px;
}

.table_td2 {
	width: 30%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
    font-weight: bold;
    text-align: center;
    font-size: 13px;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-list-alt"></span> 구매내역 </h3>
    </div>
    
    <div class="alert alert-info">
    	<i class="glyphicon glyphicon-info-sign"></i>
       		 최근 6개월 동안의 구매내역을 조회하실 수 있습니다.<br>
        <i class="glyphicon glyphicon-info-sign"></i>
        	이용권 구매 취소 시 해당 매직패스도 같이 취소가 됩니다.
    </div> 
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 10%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">구분</th>
		      <th scope="col">상품명</th>
		      <th scope="col">가격</th>
		      <th scope="col">구매일</th>
		      <th scope="col">수량</th>
		      <th scope="col">현재상태</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach var="vo" items="${noticeList}">
			    <tr>
			      <th scope="row">공지</th>
			      <td><a href="${articleUrl}&num=${vo.noticeCode}">${vo.subject}</a></td>
			      <td>${vo.name}</td>
			      <td>${vo.created}</td>
			    </tr>
			  </c:forEach>
		  
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td><a href="${articleUrl}&num=${dto.noticeCode}">${dto.subject}</a></td>
			      <td>${dto.name}</td>
			      <td>${dto.created}</td>
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
			        <c:if test="${dataCount==0}">최근 구매내역이 없습니다.</c:if>
			        <c:if test="${dataCount!=0}">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
    </div>
</div>   