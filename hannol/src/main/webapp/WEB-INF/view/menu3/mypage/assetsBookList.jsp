<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	.table th,
	.table td{text-align:center; vertical-alilgn:middle;}  
	.table td:nth-child(6){text-align:left;} 
	 
	.table>tbody>tr>td{vertical-align:middle;}
	#chkAll{margin:0; vertical-align:middle;}   
</style>
<div>
	<form name="assetsBookForm" id="assetsBookForm">
		<table class="table">
			<colgroup>
				<col style="width:2%;">
				<col style="width:5%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:15%;">   
				<col style=""> 
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:7%;"> 
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col"><input type="checkbox" name="chkAll" id="chkAll" value="chkAll" onclick="checkAll();"></th>
					<th scope="col">번호</th>
					<th scope="col">예약코드</th>
					<th scope="col">예약이름</th>
					<th scope="col">연락처</th>
					<th scope="col">시설</th>
					<th scope="col">예약시간</th>
					<th scope="col">이용예정일</th>
					<th scope="col">예약한일자</th>
					<th scope="col">상태</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td><input type="checkbox" name="chk" value="chk" onclick="chkSingle();" <c:if test="${dto.state!=0}">disabled="disabled"</c:if>></td>
						<td scope="row">${dto.listNum}</td> 
						<td>${dto.bookCode}</td>
						<td>${dto.name}</td> 
						<td>${dto.tel}</td>
						<td>${dto.facName}</td> 
						<td>${dto.state==0?"오후":"종일"}</td>
						<td>${dto.useDate}</td>
						<td>${dto.bookDate}</td>
						<td>${dto.state==0?"예약":(dto.state==1?"반납완료":"대여중")}</td>
					</tr> 
				</c:forEach>
			</tbody>
		</table>


		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35"> 
				<td align="center">
				        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				   		<c:if test="${dataCount!=0 }">${paging}</c:if>
				</td>
				<td align="right" width="100">
						<button type="button" id="btnDelete" name="btnDelete" class="btn btn-default">예약삭제</button>
				</td>
		   </tr>
		</table>
	</form>
</div>