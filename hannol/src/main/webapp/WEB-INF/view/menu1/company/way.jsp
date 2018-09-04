<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 오시는 길 </h3>
    </div>
    
    <div>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link active" href="#">지하철</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">버스</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link disabled" href="#">지도</a>
		  </li>
		</ul>
				
    </div>
</div>