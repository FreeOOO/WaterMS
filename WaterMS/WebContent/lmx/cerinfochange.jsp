<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/skin.css" />
<title>Insert title here</title>
</head>
<script type='text/javascript'
	src='../Scripts/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript">
	function checkCertificate() {
		var userid = document.getElementById("userid").value;
		if (userid == "") {
			alert("请输入员工ID");
			return false;
		}
		var certificateType = document.getElementById("certificateType").value;
		if (certificateType != "" && certificateType.length > 10) {
			alert("证书类别小于10个字");
			return false;
		}
		var certificatename = document.getElementById("certificatename").value;
		if (certificatename == "") {
			alert("请输入证书名称");
			return false;
		} else if (certificatename.length > 10) {
			alert("证书名称小于10个字");
			return false;
		}
		var hirecompanies = document.getElementById("hirecompanies").value;
		if (hirecompanies != "" && hirecompanies.length > 15) {
			alert("聘用企业小于15个字");
			return false;
		}
		var job = document.getElementById("job").value;
		if (job != "" && job.length > 8) {
			alert("专业类别小于8个字");
			return false;
		}
		var technicaltitles = document.getElementById("technicaltitles").value;
		if (technicaltitles != "" && technicaltitles.length > 8) {
			alert("技术职称小于8个字");
			return false;
		}
		var certificateNumber = document.getElementById("certificateNumber").value;
		if (certificateNumber != "" && certificateNumber.length > 25) {
			alert("资格证书编号小于25个字");
			return false;
		}
		var registrationNumber = document.getElementById("registrationNumber").value;
		if (registrationNumber != "" && registrationNumber.length > 25) {
			alert("注册编号小于25个字");
			return false;
		}
		var certificateNo = document.getElementById("certificateNo").value;
		if (certificateNo != "" && certificateNo.length > 25) {
			alert("证书编号小于25个字");
			return false;
		}
		var issuingauthority = document.getElementById("issuingauthority").value;
		if (issuingauthority != "" && issuingauthority.length > 25) {
			alert("发证机关小于25个字");
			return false;
		}
		var dateofissue = document.getElementById("dateofissue").value;
		if (dateofissue == "") {
			alert("请输入发证日期");
			return false;
		}
		var validitydeadline = document.getElementById("validitydeadline").value;
		if (validitydeadline == "") {
			alert("请输入有效截至日期");
			return false;
		}
		var approvalNumber = document.getElementById("approvalNumber").value;
		if (approvalNumber != "" && approvalNumber.length > 25) {
			alert("批准文号小于25个字");
			return false;
		}
		var additionalitemsregistrationrecord = document
				.getElementById("additionalitemsregistrationrecord").value;
		if (additionalitemsregistrationrecord != ""
				&& additionalitemsregistrationrecord.length > 25) {
			alert("增项注册记录小于25个字");
			return false;
		}
		var accessorymaterialfile = document
				.getElementById("accessorymaterialfile").value;
		if (accessorymaterialfile != ""
				&& !/\.(pdf|doc|docx|jpg|jpeg|png|JPG|PNG)$/.test(accessorymaterialfile)) {
			alert("附件类型必须是pdf,doc,docx,jpg,jpeg,png中的一种");
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
										<form action="changeCertificate.spring" method="post"  enctype="multipart/form-data">
											<table width="100%" class="cont">
												<tr>
													<td width="10%">&nbsp;</td>
													<td>员工ID：</td>
													<td width="35%"><input class="text" type="text"
														id="userid" name="userid"
														value="${certificate.getUserid() }" onfocus="this.blur()" />*</td>
													<td>证书类别：</td>
													<td width="35%"><input class="text" type="text"
														id="certificateType" name="certificateType"
														value="${certificate.getCertificateType() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>证书名称：</td>
													<td><input class="text" type="text"
														id="certificatename" name="certificatename"
														value="${certificate.getCertificatename() }" />*</td>
													<td>姓名：</td>
													<td><input class="text" type="text" id="name"
														name="name" value="${certificate.getName() }"
														onfocus="this.blur()" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
													<td><input type="radio" id="sex" name="sex" value="男"
														${certificate.getSex() == "男" ? "checked" : "" } /> 男 <input
														type="radio" id="sex" name="sex" value="女"
														${certificate.getSex() == "女" ? "checked" : "" } /> 女*</td>
													<td>出生日期</td>
													<td><input class="text" type="text" id="birth"
														name="birth"
														value="<fmt:formatDate value='${certificate.getBirth() }' pattern='yyyy-MM-dd' />"
														onfocus="this.blur()" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>身份证号：</td>
													<td><input class="text" type="text" id="idnumber"
														name="idnumber" value="${certificate.getIdnumber() }"
														onfocus="this.blur()" />*</td>
													<td>聘用企业：</td>
													<td><input class="text" type="text" id="hirecompanies"
														name="hirecompanies"
														value="${certificate.getHirecompanies() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>专业类别：</td>
													<td><input class="text" type="text" id="job"
														name="job" value="${certificate.getJob() }" /></td>
													<td>技术职称：</td>
													<td><input class="text" type="text"
														id="technicaltitles" name="technicaltitles"
														value="${certificate.getTechnicaltitles() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>资格证书编号：</td>
													<td><input class="text" type="text"
														id="certificateNumber" name="certificateNumber"
														value="${certificate.getCertificateNumber() }" /></td>
													<td>注册编号：</td>
													<td><input class="text" type="text"
														id="registrationNumber" name="registrationNumber"
														value="${certificate.getRegistrationNumber() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>证书编号：</td>
													<td><input class="text" type="text" id="certificateNo"
														name="certificateNo"
														value="${certificate.getCertificateNo() }" />*</td>
													<td>发证机关：</td>
													<td><input class="text" type="text"
														id="issuingauthority" name="issuingauthority"
														value="${certificate.getIssuingauthority() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>发证日期：</td>
													<td><input class="text" type="text" id="dateofissue"
														name="dateofissue"
														value="<fmt:formatDate value='${certificate.getDateofissue() }' pattern='yyyy-MM-dd' />"
														size="10" maxlength="10" onClick="WdatePicker()" />*</td>
													<td>有效期截止日期：</td>
													<td><input class="text" type="text"
														id="validitydeadline" name="validitydeadline"
														value="<fmt:formatDate value='${certificate.getValiditydeadline() }' pattern='yyyy-MM-dd' />"
														size="10" maxlength="10" onClick="WdatePicker()" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>批准文号：</td>
													<td><input class="text" type="text"
														id="approvalNumber" name="approvalNumber"
														value="${certificate.getApprovalNumber() }" /></td>
													<td>增项注册记录：</td>
													<td><input class="text" type="text"
														id="additionalitemsregistrationrecord"
														name="additionalitemsregistrationrecord"
														value="${certificate.getAdditionalitemsregistrationrecord() }" />
														</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>附件材料：</td>
													<td><input type="file" id="accessorymaterialfile" name="accessorymaterialfile"></td>
													<td><input class="text" type="text" id="cerid"
														name="cerid" value="${certificate.getCerid() }"
														style="display: none" />
														<input class="text" type="text" id="accessorymaterial"
														name="accessorymaterial" value="${certificate.getAccessorymaterial() }"
														style="display: none" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="submit"
														value="提交" onclick="return checkCertificate()" /></td>
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