<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.btnLike {
    color:#333333;
    font-weight:500;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    border:1px solid #cccccc;
    background-color:#ffffff;
    text-align:center;
    cursor:pointer;
    padding:3px 10px 5px;
    border-radius:4px;
}
</style>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> ${menu} </h3>
    </div>
    
    <div>
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="center">
		          <form name="searchForm" action="" method="post">
		              <select name="searchKey" class="selectField">
		                  <option value="subject">제목</option>
		                  <option value="userName">작성자</option>
		                  <option value="content">내용</option>
		                  <option value="created">등록일</option>
		            </select>
		            <input type="text" name="searchValue" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
		
		<table  style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
		  <tr align="center" height="100em" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="30%" bgcolor="#cccccc"><img src="<%=cp%>/resource/images/disk.gif"></td>
		      <td width="50%" align="left" style="padding-left: 1em">
		           	대강대강 설명
		      </td>
		      <td width="20%" bgcolor="#cccccc">
		      	 <button type="button" class="btn" onclick="">상세정보</button>
		      </td>
		  </tr>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        1 2 3
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>