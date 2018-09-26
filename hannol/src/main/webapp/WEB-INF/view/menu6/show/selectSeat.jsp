<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<%
	boolean[][] seatList = new boolean[11][16];
	for (int i = 1; i < seatList.length; i++) {
		for (int j = 1; j < seatList[0].length; j++) {
			seatList[i][j] = true;
		}
	}
	//	seatList[2][3] = false;
	//	seatList[2][4] = false;
	//	seatList[5][6] = false;
	//	seatList[5][7] = false;
	//	seatList[8][2] = false;
	//	seatList[8][3] = false;
%>
<script type="text/javascript">
	function check() {
		var f = document.seatForm;

		if ($(":checked").not($(":disabled")).length == 0) {
			alert('좌석을 1개 이상 선택하세요~~')
			return false;
		}

		return true;
	}
</script>

<div style="margin: 30px auto; width: 600px; background-color: #dfe5f3; text-align: center;"><strong>stage</strong></div>
<div style="margin: -10px auto; width: 600px;">
	<form name="seatForm" method="post"	onsubmit="return check();">
		<table
			style="width: 100%; border-spacing: 0; border-collapse: collapse;">
			<tr height="30" align="center" bgcolor="#dfe5f3">
				<%
					out.print("<td width='30'>&nbsp;</td>");
					int k = 1;
					for (int i = 1; i < 18; i++) {
						if (i % 6 == 0) {
							out.print("<td width='30'>&nbsp;</td>");
						} else {
							out.print("<td width='30'>" + k + "</td>");
							k++;
						}
					}
				%>
			</tr>

			<!-- 1행부터 출력 -->
			<%
				for (int row = 1; row <= 5; row++) {

					out.print("<tr height='30' align='center' bgcolor='#dfe5f3'>");
					out.print("<td width='30'>" + row + "</td>");
					k = 1; // 진짜 열
					for (int col = 1; col < 18; col++) {
						if (col % 6 == 0) {
							out.print("<td width='30' bgcolor='gray'>&nbsp;</td>");
						} else {
							if (seatList[row][k] == false) {
								out.print("<td width='30' bgcolor='moccasin'>" + "<input type='checkbox' name='seat' id='"
										+ row + ":" + k + "' checked='checked' disabled='disabled' value='" + row + ":" + k
										+ "'></td>");
							} else {
								out.print("<td width='30'><input type='checkbox' name='seat' id='" + row + ":" + k
										+ "' value='" + row + ":" + k + "'></td>");
							}
							k++;
						}
					}
					out.print("</tr>");
				}
			%>

		</table>

		<div style="margin: 30px auto; width: 600px; text-align: right;">
			<button class="btn btn-default btn-info" type="submit">선택 완료</button>
		</div>
	</form>
</div>

