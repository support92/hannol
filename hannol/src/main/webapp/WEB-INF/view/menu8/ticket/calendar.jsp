<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/fullcalendar.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/locale-all.js'/>"></script>

<style>
.fc-unthemed td.fc-today{
	background: none;
}

td.fc-other-month .fc-day-number{
   visibility: hidden;
}
</style>
<script>
$(function(){
	var startDay = "${startDay}";
	var endDay ="${endDay}";
	
	$('#calendar').fullCalendar({
	    selectable: false,
	    locale : "ko",
	    header: {
	      left: 'prev',
	      center: 'title',
	      right: 'next'
	    },
	    dayClick: function(date) {
	    	if($(this).attr("class").indexOf("fc-other-month") == -1){
	  	      $("td img").remove();
		      $(this).css("vertical-align", "middle");
		      $(this).css("text-align", "center");
		      $(this).append("<img src='<%=cp%>/resource/images/hannol_logo.jpg' alt='선택날짜' style='width:50px;'>")
		      
		      alert(date.format());
	    	}  	

	    },
	    defaultView: 'month',
	    validRange: {
	         start: startDay,
	    	 end: endDay
	    }
	  });
});
</script>

<style>
.fc-scroller-y {
   overflow: hidden !important;
}
</style>
<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="	glyphicon glyphicon-calendar"></span>예매</h3>
    </div>
		<div id="calendar"></div>    
    <div>
    
    </div>
</div>