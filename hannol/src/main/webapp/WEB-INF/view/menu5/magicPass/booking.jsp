<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.form-control{
	width: 20%;
	float: left;
	padding: 5px 5px;
}

.col-xs-offset-2{
	margin-left: 0px;
}

.txtTitle{
	float: left;
    font-size: 14px;
    font-weight: bold;
    vertical-align: middle;
    margin: 5px;
}
</style>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 매직패스 예약 </h3>
    </div>
    
    <div>
		<div>
			<span class="txtTitle">테마</span>
			<span>
				<select class="form-control">
					<option>전체</option>
	    			<option>미니언즈</option>
	    			<option>프린세스빌리지</option>
	    			<option>라이언킹</option>
	    			<option>니모</option>
	    			<option>토이스토리</option>
				</select>
			</span>
		</div>
		
		<div class="col-xs-8 col-xs-offset-2">
			<span class="txtTitle">어트랙션명</span>
			<div class="input-group">
				<input type="text" style="height:35px;" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
	            <span class="input-group-btn">
	                <button class="btn btn-info" type="button"><span class="glyphicon glyphicon-search"></span></button>
	            </span>
			</div>
		</div>
	</div>
	
	<div>
		
	</div>
</div>