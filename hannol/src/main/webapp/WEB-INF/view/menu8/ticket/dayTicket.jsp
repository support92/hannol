<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="	glyphicon glyphicon-calendar"></span>예매</h3>
    </div>
    
    <div>
    	<div>상품선택</div>
    	<div>권종선택</div>
    	<select>
    		<option>::권종선택::</option>
    		<option>종일권</option>
    		<option>야간권</option>
    		<option>BIG5</option>
    	</select>
    </div>
</div>