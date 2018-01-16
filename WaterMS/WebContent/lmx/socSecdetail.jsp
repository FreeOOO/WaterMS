<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
											<%-- <tr>
												<td width="10%">&nbsp;</td>
												<td>员工ID：</td>
												<td width="35%">${socialSecurity.getUserid() }</td>
												<td>个人编号：</td>
												<td width="35%">${socialSecurity.getPersonalNumber() }</td>
											</tr> --%>
											<tr>
												<td width="10%">&nbsp;</td>
												<td>姓名：</td>
												<td width="35%">${socialSecurity.getName() }</td>
												<td>医保基数：</td>
												<td width="35%">${socialSecurity.getMedicarebase() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>养老基数：</td>
												<td>${socialSecurity.getPensionbase() }</td>
												<td>个人医疗保险</td>
												<td>${socialSecurity.getIndividualhealthinsurance() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>个人失业保险：</td>
												<td>${socialSecurity.getPersonalUnemploymentInsurance() }</td>
												<td>个人养老保险：</td>
												<td>${socialSecurity.getPrivatepensioninsurance() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>单位医疗保险：</td>
												<td>${socialSecurity.getMedicalInsuranceUnit() }</td>
												<td>单位失业保险：</td>
												<td>${socialSecurity.getUnemploymentInsuranceUnit() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>单位养老保险：</td>
												<td>${socialSecurity.getEndowmentinsurance() }</td>
												<td>单位医保大病：</td>
												<td>${socialSecurity.getUnitillnessinsurance() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>单位生育保险：</td>
												<td>${socialSecurity.getUnitmaternityinsurance() }</td>
												<td>单位工伤保险：</td>
												<td>${socialSecurity.getInjuryinsuranceunit() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td colspan="3"><a
													href="changeSocialSecurityinfo.spring?socialSecurityNo=${socialSecurity.getSocialSecurityNo() }"><input
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