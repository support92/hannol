<%@page import="java.util.Dictionary"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
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

.custom_h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    color: #333;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}

.custom_col1 {
    width: 50%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
}

.customer_col2 {
	width: 50%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.pay_price {
    border-top: 2px solid #cecece;
}

.col_title {
    vertical-align: top;
    text-align: right;
    padding-right: 10px;
    border-right: 1px solid #e4e4e4;
    border-bottom: 1px solid #e4e4e4;
    background: #f4f4f4;
}

.price {
    display: inline-block;
    padding-left: 17px;  
    padding-bottom: 10px;
    width: 100px;
}

.table_col{
	border-bottom: 1px solid #e4e4e4;
}

select {
    height: 23px;
    font-size: 12px;
    vertical-align: middle;
}

.pay-type-section {
    padding: 10px 0;
    margin: 0;
    line-height: 21px;
    border-bottom: 1px solid #e4e4e4;
}

.line-title {
    display: inline-block;
    width: 90px;
    font-size: 12px;
    font-weight: bold;
    margin: 0;
    vertical-align: middle;
    padding-left: 15px;
}

.pay-type-section .line-title:before {
    content: "";
    position: relative;
    display: inline-block;
    width: 3px;
    height: 3px;
    margin-left: 2px;
    margin-right: 4px;
    vertical-align: middle;
    background: #55575f;
}

.modal_th {
    width: 30%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

.modal_td {
	width: 70%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.btn_delete{
  width: 21px;
  height: 21px;
  background: url('<%=cp%>/resource/images/delete.png') no-repeat -1px -1px;
  border: none;
  line-height : 21px;
  float: left;
}
</style>

<script type="text/javascript">

</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-credit-card"></span> 1:1문의 </h3>
    </div>
     
</div>   