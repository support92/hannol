<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 등급 혜택</h3>
    </div>
        

<div class="sub-container" style="width: 100%;">
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">종류</th>
		      <th scope="col">쿠폰번호</th> <!-- 시리얼번호 -->
		      <th scope="col">내용</th>
		      <th scope="col">발급일</th>
		      <th scope="col">만료일</th>
		      <th scope="col">사용여부</th>
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
		          &nbsp;
		    </td>
			<td align="center">
			        <c:if test="${dataCount==0}">사용가능한 쿠폰이 없습니다.</c:if>
			        <c:if test="${dataCount!=0}">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
    </div>

</div>
    </div>
</div>