<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.imgLayout{
	width: 190px;
	height: 205px;
	padding: 10px 5px 10px;
	margin: 5px;
	border: 1px solid #DAD9FF;
	cursor: pointer;
}
.subject {
     width:180px;
     height:25px;
     line-height:25px;
     margin:5px auto;
     border-top: 1px solid #DAD9FF;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
}

.subList:after {
	content: '';
	display: block;
	clear: both;
}

.thumbnail>a>img {
	margin-bottom: 5%;
}


</style>

<script type="text/javascript">

var dataQuery = "";

listPage("${page}");

function listPage(page){
	
	var url="<%=cp%>/enjoy/subList"
	var data = "page="+page;
	
	/* if(query!=''){
		data+="&"+query;
	}
	 */
	$.ajax({
		type:"GET"
		,url:url
		,data:data
		,success:function(data){
			$(".subList").html(data);
		}
		,error:function(e){
			conseol.log(e.responseText);
		}
	});
}

</script>

<div class="bodyFrame2" style="width: 630px;">
    <div class="body-title">
        <h3>
        	<span class="glyphicon glyphicon-gift"></span> 놀이기구
		</h3>
    </div>
    
    <div class="subList"></div>

</div>