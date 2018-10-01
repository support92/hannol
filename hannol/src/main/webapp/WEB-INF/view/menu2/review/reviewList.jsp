<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<c:forEach items="${list}" var="dto">
    <div style="height: 70px;">
		<div style="width: 80%; float: left;" align="left" >
			<div>${dto.content}</div> 
			<div style="padding-top: 10px;">${dto.memberIdWithStar}&nbsp;&nbsp;|&nbsp;&nbsp;${dto.reviewDate} 방문</div>		
		</div>
    	<div style="width: 20%; float: left;" align="center">
			<img class="redHeartIcon" src="<%=cp%>/resource/images/like_heart_icon.png"  style="padding: 5px;" width="30px;">     			
    		${dto.likecount}
    		<%-- <c:if test="${sessionScope.member.memberId != dto.memberId}">
				<img class="grayHeartIcon" src="<%=cp%>/resource/images/gray_heart_icon.png"  style="padding: 5px;" width="30px;"> ${dto.likecount}
    		</c:if> --%>
		</div>
		<hr size="3">
    </div>
</c:forEach>    

<div align="center" style="clear: both;">
	${paging}
</div>