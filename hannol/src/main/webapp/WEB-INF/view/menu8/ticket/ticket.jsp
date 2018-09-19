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

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="	glyphicon glyphicon-calendar"></span>예매</h3>
    </div>
    
    <div>
        <div class="div-box" style="margin-right: 3%; ">
        	<a href="<%=cp%>/reservation/dayTicket">
        		<p class="img">
        			<img alt="이용권" src="<%=cp%>/resource/images/hannol_logo.jpg">
        		</p>
        		<ul class="txt">
        			<li>이용권</li>
        		</ul>
        	</a>
        </div>
        
        
        <div class="div-box">
        	<a href="<%=cp%>/reservation/yearTicket">
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