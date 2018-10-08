<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.img img{
	width: 150px;
	height: 150px;
}

.img{
	width: 40%;
	vertical-align: middle;
	display: table-cell;
}

.div-box a{
	display: table;
	width: 100%;
	line-height: 0;
}

.div-box{
	float: left;
	width: 47%;
	margin: 5px;
	border: 1px solid #eee;
	box-shadow: 5px 5px #ececec;
    font-size: 2.5em;
    font-weight: bold;
    min-width: 300px;
}

.txt{
	display: table-cell;
	vertical-align: middle;
	width: 60%;
	pause: 0 5%;
	text-align: center;
}

@media (max-width: 1000px){
	.div-box {
    	width : 100%;
    	margin-bottom: 3%;
	}
}

</style>

<script>
$(function(){
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
})

function checkYearTicket(){
	var url = "<%=cp%>/reservation/checkYearTicket";
	
	$.ajax({
		type:"GET"
		,url:url
		,success:function(data) {
			if(data.state=="fail"){
				alert("로그인 후 이용해 주세요");
				location.href="<%=cp%>/member/login";
			}else if(data.state=="already"){
				alert("연간이용권이 이미 있습니다.");
			}else if(data.state=="true"){
				location.href="<%=cp%>/reservation/yearTicket"
			}else{
				alert("죄송합니다 고객님의 요청을 완료하지 못했습니다. 다시 시도해 주세요");
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="	glyphicon glyphicon-calendar"></span>예매</h3>
    </div>
    
    <div>
        <div class="div-box" style="margin-right: 3%; ">
        	<a href="<%=cp%>/reservation/dayCalendar">
        		<p class="img">
        			<img alt="이용권" src="<%=cp%>/resource/images/hannol_logo.jpg">
        		</p>
        		<ul class="txt">
        			<li>이용권</li>
        		</ul>
        	</a>
        </div>
        
        
        <div class="div-box">
        	<a href="javascript:checkYearTicket();">
        		<p class="img">
        			<img alt="이용권" src="<%=cp%>/resource/images/hannol_logo.jpg">
        		</p>
        		<ul class="txt">
        			<li>연간이용권</li>
        		</ul>
        	</a>
        </div>
        
    </div>
</div>