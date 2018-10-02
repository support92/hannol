<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.col-xs-8:after{
	content:''; display:block; clear:both;
}

.col-xs-offset-2{
	width: 40%;
}

.col-xs-8{
 	float: none;
 	margin: 10px auto;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
    margin-top: 15px;
}

select {
    height: 30px;
    font-size: 12px;
    vertical-align: middle;
}

th {
    width: 25%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

td {
	width: 75%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.td_custom {
	width: 75%;
	border-bottom: #ffffff;
    padding: 10px 16px;
}
</style>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-pencil"></span> 문의내역</h3>
    </div>

    <div align="center">
    <form name="questionForm" method="post">
    	<table class="custom_table">
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
				<tr>
					<th>문의유형</th>
					<td>
						<select id="gubun" name="gubun">
							<option value="">:::문의유형:::</option>
							<option value="요금 문의">요금 문의</option>
							<option value="제휴 할인">제휴 할인</option>
							<option value="온라인 예매">온라인 예매</option>
							<option value="연간 회원">연간 회원</option>
							<option value="예약 문의">예약 문의</option>
							<option value="기타 문의">기타 문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${dto.subject}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						${dto.content}
					</td>
				</tr>
		  </tbody>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<tr height="40">
		    	<td align="center" width="100" class="td_custom">
		          	<button type="button" class="btn btn-info" style="font-weight: bold;">수정하기</button>
		     	 	<button type="reset" class="btn btn-default" data-dismiss="modal" style="font-weight: bold;" onclick="javascript:location.href='<%=cp%>/mypage/question';">리스트</button>
		     	</td>
		   	</tr>
		</table>
	</form>
    </div>
</div>