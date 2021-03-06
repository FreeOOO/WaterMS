<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/skin.css" />
<title>Insert title here</title>
</head>
<script type='text/javascript' src='../Scripts/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript">
function checkBorrowCer(){
	var subjecttoborrow = document.getElementById("subjecttoborrow").value;
	if(subjecttoborrow == ""){
		alert("请输借用事由");
		return false;
	}else if(subjecttoborrow.length > 100){
		alert("借用事由小于100字");
		return false;
	}
	var borrower = document.getElementById("borrower").value;
	if(borrower == ""){
		alert("请输借用人");
		return false;
	}else if(borrower.length > 8){
		alert("借用人姓名小于8个字");
		return false;
	}else if(!/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/g.test(borrower)){
		alert("请输入正确的借用人姓名");
		return false;
	}
	var remark = document.getElementById("remark").value;
	if(remark != "" && remark.length > 100){
		alert("备注小于100字");
		return false;
	}
}
</script>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<!-- 头部开始 -->
		<tr>
			<td width="17" valign="top" background="../Images/mail_left_bg.gif">
				<img src="../Images/left_top_right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="../Images/content_bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" background="../Images/content_bg.gif">
					<tr>
						<td height="31"><div class="title">添加栏目</div></td>
					</tr>
				</table>
			</td>
			<td width="16" valign="top" background="../Images/mail_right_bg.gif"><img
				src="../Images/nav_right_bg.gif" width="16" height="29" /></td>
		</tr>
		<!-- 中间部分开始 -->
		<tr>
			<!--第一行左边框-->
			<td valign="middle" background="../Images/mail_left_bg.gif">&nbsp;</td>
			<!--第一行中间内容-->
			<td valign="top" bgcolor="#F7F8F9">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<!-- 空白行-->
					<tr>
						<td colspan="2" valign="top">&nbsp;</td>
						<td>&nbsp;</td>
						<td valign="top">&nbsp;</td>
					</tr>
					<!-- 一条线 -->
					<tr>
						<td height="40" colspan="4">
							<table width="100%" height="1" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#CCCCCC">
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
					<!-- 添加栏目开始 -->
					<tr>
						<td width="2%">&nbsp;</td>
						<td width="96%">
							<table width="100%">
								<tr>
									<td colspan="2">
										<form action="changeBorrowCertificate.spring" method="post">
											<table width="100%" class="cont">
												<tr>
													<td width="10%">&nbsp;</td>
													<td>证件姓名：</td>
													<td width="35%"><input class="text" type="text"
														id="name" name="name"
														value="${borrowCertificate.getName() }" onfocus="this.blur()"/>*</td>
													<td>证书类别：</td>
													<td width="35%"><input class="text" type="text"
														id="certificateType" name="certificateType"
														value="${borrowCertificate.getCertificateType() }" onfocus="this.blur()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>借用事由：</td>
													<td><input class="text" type="text"
														id="subjecttoborrow" name="subjecttoborrow"
														value="${borrowCertificate.getSubjecttoborrow() }" /></td>
														<td>投标时间：</td>
													<td><input class="text" type="text" id="tenderTime"
														name="tenderTime"
														value="<fmt:formatDate value='${borrowCertificate.getTenderTime() }' pattern='yyyy-MM-dd' />" onfocus="this.blur()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>借用日期</td>
													<td><input class="text" type="text" id="borrowingDate"
														name="borrowingDate"
														value="<fmt:formatDate value='${borrowCertificate.getBorrowingDate() }' pattern='yyyy-MM-dd' />" onfocus="this.blur()"/></td>
													<td>应还日期：</td>
													<td><input class="text" type="text" id="datereturn"
														name="datereturn"
														value="<fmt:formatDate value='${borrowCertificate.getDatereturn() }' pattern='yyyy-MM-dd' />" onfocus="this.blur()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>借用人：</td>
													<td><input class="text" type="text" id="borrower"
														name="borrower"
														value="${borrowCertificate.getBorrower() }" /></td>
														<td>收证人：</td>
													<td><input class="text" type="text" id="incomewitness"
														name="incomewitness"
														value="${borrowCertificate.getIncomewitness() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>备注：</td>
													<td><input class="text" type="text" id="remark"
														name="remark" value="${borrowCertificate.getRemark() }" /></td>
													<td><input type="text" id="borrowingID"
														name="borrowingID"
														value="${borrowCertificate.getBorrowingID() }"
														style="display: none" />
														<input class="text" type="text" id="userid"
														name="userid" value="${borrowCertificate.getUserid() }" style="display:none"/>
														<input class="text" type="text"
														id="cerid" name="cerid"
														value="${borrowCertificate.getCerid() }" style="display: none" />
														<input class="text" type="text"
														id="whetherrestitution" name="whetherrestitution"
														value="${borrowCertificate.getWhetherrestitution() }" style="display: none" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="submit"
														value="提交" onclick="return checkBorrowCer()"/></td>
													<td>&nbsp;</td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</table>
						</td>
						<td width="2%">&nbsp;</td>
					</tr>
					<!-- 添加栏目结束 -->
					<tr>
						<td height="40" colspan="4">
							<table width="100%" height="1" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#CCCCCC">
								<tr>
									<td></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td background="../Images/mail_right_bg.gif">&nbsp;</td>
		</tr>
		<!-- 底部部分 -->
		<tr>
			<td valign="bottom" background="../Images/mail_left_bg.gif"><img
				src="../Images/buttom_left.gif" width="17" height="17" /></td>
			<td background="../Images/buttom_bgs.gif"><img
				src="../Images/buttom_bgs.gif" width="17" height="17"></td>
			<td valign="bottom" background="../Images/mail_right_bg.gif"><img
				src="../Images/buttom_right.gif" width="16" height="17" /></td>
		</tr>
	</table>
</body>
</html>