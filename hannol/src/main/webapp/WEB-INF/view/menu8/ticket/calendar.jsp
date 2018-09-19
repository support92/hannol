<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/fullcalendar.min.js'/>"></script>
<script>
$(function(){
	$('#calendar').fullCalendar({
	    header: {
	    	left : '',
	        center: 'title',
	        right : 'next'
	    },
	    selectable: true,
	    editable: false,
	    eventStartEditable: false,
	    defaultDate: new Date(),
	    navLinks: false, 
	    eventLimit: true,
	    monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    dayNamesShort: ["일","월","화","수","목","금","토"]
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