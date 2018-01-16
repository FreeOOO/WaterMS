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
										<table width="100%" class="cont">
											<tr>
												<td width="10%">&nbsp;</td>
												<td>员工ID：</td>
												<td width="35%">${certificate.getUserid() }</td>
												<td>证书类别：</td>
												<td width="35%">${certificate.getCertificateType() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>证书名称：</td>
												<td>${certificate.getCertificatename() }</td>
												<td>姓名：</td>
												<td>${certificate.getName() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
												<td>${certificate.getSex() }</td>
												<td>出生日期</td>
												<td><fmt:formatDate value="${certificate.getBirth() }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>身份证号：</td>
												<td>${certificate.getIdnumber() }</td>
												<td>聘用企业：</td>
												<td>${certificate.getHirecompanies() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>专业类别：</td>
												<td>${certificate.getJob() }</td>
												<td>技术职称：</td>
												<td>${certificate.getTechnicaltitles() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>资格证书编号：</td>
												<td>${certificate.getCertificateNumber() }</td>
												<td>注册编号：</td>
												<td>${certificate.getRegistrationNumber() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>证书编号：</td>
												<td>${certificate.getCertificateNo() }</td>
												<td>发证机关：</td>
												<td>${certificate.getIssuingauthority() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>发证日期：</td>
												<td><fmt:formatDate value="${certificate.getDateofissue() }" pattern="yyyy-MM-dd" /></td>
												<td>有效期截止日期：</td>
												<td><fmt:formatDate value="${certificate.getValiditydeadline() }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>批准文号：</td>
												<td>${certificate.getApprovalNumber() }</td>
												<td>增项注册记录：</td>
												<td>${certificate.getAdditionalitemsregistrationrecord() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td colspan="3"><a
													href="changeCerinfo.spring?cerid=${certificate.getCerid() }"><input
														class="btn" type="button" value="修改信息" /></a></td>
												<td>&nbsp;</td>
											</tr>
										</table>
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