<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
$(function(){
	var idx="${subMenu}";
	if(!idx) idx=1;
	var subMenu=$(".list-group-item")[idx];
	$(subMenu).addClass("active");
});
</script>

<div class="list-group">
       <div class="list-group-item lefthead"><i></i>마이페이지</div>
       <a href="<%=cp%>/guest/guest" class="list-group-item">내정보</a>
       <a href="#" class="list-group-item">알림</a>
       <a href="#" class="list-group-item">쿠폰함</a>
       <a href="#" class="list-group-item">예약현황</a>
       <a href="#" class="list-group-item">구매내역</a>
       <a href="#" class="list-group-item">문의내역</a>
</div>
