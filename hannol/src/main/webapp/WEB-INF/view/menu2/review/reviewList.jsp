<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>


<c:forEach items="${list}" var="dto">
    <div>
		<div style="width: 80%; background-color: red; float: left;" align="left" >
			${dto.content}		
		</div>
    	<div style="width: 20%; background-color: blue; float: left;" align="center">
			<img src="<%=cp%>/resource/images/gray_heart_icon.png"  style="padding: 5px;" width="30px;"> ${dto.likecount}
		</div>
    </div>
</c:forEach>    

${paging}