<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="body-container"> 
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> ${mode=="created"?"회원 가입":"회원 정보 수정"} </h3>
    </div>
    
    <div>
		<form name="memberForm" method="post">
		  <h4 class="joinSubTitle">기본 정보 입력</h4>
		  <table class="joinTable">
			  <tr>
					<th>
						<label>아이디</label>
					</th>
					<td>
			        <p>
			            <input type="text" name="userId" id="userId" value="${dto.userId}"
	                        ${mode=="update" ? "readonly='readonly' ":""}
	                        maxlength="15" class="boxTF" placeholder="아이디">
			        	<span class="help-block">아이디는 5~10자 이내이며, 첫글자는 영문자로 시작해야 합니다.</span>
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <th>
			      	<label>비밀번호</label>
			      </th>
			      <td>
			        <p>
			            <input type="password" name="userPwd" maxlength="15" class="boxTF"
			                       placeholder="비밀번호">
			        	<span class="help-block">비밀번호는 5~10자 이내이며, 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</span>
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <th>
			            <label>비밀번호 확인</label>
			      </th>
			      <td>
			        <p>
			            <input type="password" name="userPwdCheck" maxlength="15" class="boxTF"
			                       placeholder="비밀번호 확인">
			            <span class="help-block">비밀번호를 한번 더 입력해주세요.</span>
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <th>
			            <label>이름</label>
			      </th>
			      <td>
			        <p>
			            <input type="text" name="userName" value="${dto.userName}" maxlength="30" class="boxTF"
		                      
		                      ${mode=="update" ? "readonly='readonly' ":""}
		                      placeholder="이름">
			        </p>
			      </td>
			  </tr>
			
			  <tr>
			      <th>
			            <label>이메일</label>
			      </th>
			      <td>
			        <p>
			            <input type="text" name="email1" value="${dto.email1}" size="13" maxlength="30"  class="boxTF">
			            @ 
			            <input type="text" name="email2" value="${dto.email2}" size="13" maxlength="30"  class="boxTF" readonly="readonly">
			        	<select name="selectEmail" class="selectField">
			                <option value="">선 택</option>
			                <option value="naver.com" ${dto.email2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
			                <option value="hanmail.net" ${dto.email2=="hanmail.net" ? "selected='selected'" : ""}>한 메일</option>
			                <option value="hotmail.com" ${dto.email2=="hotmail.com" ? "selected='selected'" : ""}>핫 메일</option>
			                <option value="gmail.com" ${dto.email2=="gmail.com" ? "selected='selected'" : ""}>지 메일</option>
			                <option value="direct">직접입력</option>
			            </select>
			        	<button type="button" class="btn1" id="emailCheck">이메일 인증</button>
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <th>
			            <label>전화번호</label>
			      </th>
			      <td>
			        <p>
			            <select class="selectField" id="tel1" name="tel1" >
			                <option value="">선 택</option>
			                <option value="010" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
			                <option value="011" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
			                <option value="016" ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
			                <option value="017" ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
			                <option value="018" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
			                <option value="019" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
			            </select>
			            -
			            <input type="text" name="tel2" value="${dto.tel2}" class="boxTF telTF" maxlength="4">
			            -
			            <input type="text" name="tel3" value="${dto.tel3}" class="boxTF telTF" maxlength="4">
			        </p>
			      </td>
			  </tr>
			  
			  <tr>
			      <th>
			           <label>생년월일</label>
					</th>
			      <td>
			        <p>
			            <input type="text" name="birth" value="${dto.birth}" maxlength="10" 
			                       class="boxTF" placeholder="생년월일">
			            <span class="help-block">생년월일은 2000-01-01 형식으로 입력 합니다.</span>
			        </p>
			        
			      </td>
			  </tr>
			  <tr>
                <th>
                     <label>우대조건</label>
               </th>
               <td>
                  <p>
                     <input type="checkbox" name="chk1" value="chk1">장애인
                     <input type="checkbox" name="chk2" value="chk2">어르신
                     <input type="checkbox" name="chk3" value="chk3">국가유공자 
               </td>
           </tr>
		</table>
			
			<h4 class="joinSubTitle">부가 정보 입력</h4>
			<table class="joinTable"> 
				<tr>
					<th><label>이메일 수신여부</label></th>
					<td>
						<input type="radio" name="emailChk" value="email_chk" checked="checked">수신 
						<input type="radio" name="emailChk" value="email_nochk">수신거부
					</td>
				</tr>

				<tr>
					<th><label>알림 수신여부</label></th>
					<td>
						<input type="radio" name="alarmChk" value="alarm_chk" checked="checked">수신 
						<input type="radio" name="alarmChk" value="alarm_nochk">수신거부 
					</td>
				</tr>
			</table>
			
			
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" name="sendButton" class="btn2 btnBlue" onclick="memberOk();">${mode=="created"?"회원가입":"정보수정"}</button>
			        <button type="reset" class="btn2">다시입력</button>
			        <button type="button" class="btn2" onclick="javascript:location.href='<%=cp%>/';">${mode=="created"?"가입취소":"수정취소"}</button>
			      </td>
			    </tr>
			    <tr height="30">
			        <td align="center" style="color: blue;">${message}</td>
			    </tr>
		  </table>
		</form>
	</div>
</div>
