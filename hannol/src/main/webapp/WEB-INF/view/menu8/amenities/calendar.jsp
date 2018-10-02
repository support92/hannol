<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>

</style>

<script type="text/javascript" src="<c:url value='/resource/fullcalendar/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/locale-all.js'/>"></script>
<script type="text/javascript">
	//전체달력
	$(function(){
		var startDate = "${startDate}";
		var endDate = "${endDate}"; 
		
		$("#calendar").fullCalendar({
			selectable : false,
			locale : "ko",
			header : {
				left : "prev, today", 
				center : "title",
				right : "next"
			},
			defaultView : "month" ,
			validRange : {
				start : startDate,
				end : endDate   
			}
		});
	});
</script>


<div class="bodyFrame2">
	<div class="body-title">
		<h3>
			<span class="glyphicon glyphicon-calendar"></span> 편의시설  
		</h3>
	</div>
	
	<div>
		<div id="calendar"></div>
	</div>


</div>








