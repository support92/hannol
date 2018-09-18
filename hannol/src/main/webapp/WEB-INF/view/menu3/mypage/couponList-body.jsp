<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div style="clear: both;">
		<div>
			<table class="table">
			    <colgroup>
			        <col style="width: 15%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			    </colgroup>
    
		  	<thead class="thead-light">
		    	<tr>
		      	<th scope="col">쿠폰번호</th> <!-- 시리얼번호 -->
		      	<th scope="col">내용</th>
		      	<th scope="col">만료일</th>
		      	<th scope="col">사용여부</th>
		      	<th scope="col">사용일</th>
		    	</tr>
		  	</thead>
		  	<tbody>
			  <c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}
			      <input type="hidden" name="giftCode" value="${dto.giftCode}">
			      </th>
			      <td>${dto.gubunName}-${dto.goodsName}</td>
			      <td>${dto.endDate}</td>
			      <td>
			      	<c:if test="${not empty dto.useDate}">
			      		사용
			      	</c:if>
			      	<c:if test="${empty dto.useDate}">
			      		미사용
			      	</c:if>
			      </td>
			      <td>${dto.useDate}</td>
			    </tr>
			   </c:forEach>
		  	</tbody>
		</table>
    </div>
</div>
<div class="div-paging" style="width: 100%; text-align: center; margin: 0px auto; clear: both;">
	<c:if test="${dataCount==0}">사용가능한 쿠폰이 없습니다.</c:if>
	<c:if test="${dataCount!=0}">${paging}</c:if>
</div>