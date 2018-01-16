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
												<td><img src="./userphotos/${employee.getPhoto() }"
													width="120" height="120" /></td>
											</tr>
											<tr>
												<td width="10%">&nbsp;</td>
												<td>身份证号：</td>
												<td width="35%">${employee.getIdnumber() }</td>
												<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
												<td width="35%">${employee.getName() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
												<td>${employee.getJobtitle() }</td>
												<td>评定时间：</td>
												<td><fmt:formatDate value="${employee.getEvaluationtime() }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
												<td>${employee.getSex() }</td>
												<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</td>
												<td>${employee.getPost() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>岗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
												<td>${employee.getJob() }</td>
												<td>第一学历：</td>
												<td>${employee.getFirstdegree() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>毕业学校：</td>
												<td>${employee.getGraduatedschool() }</td>
												<td>最高学历：</td>
												<td>${employee.getHighesteducation() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>最高学历毕业学校：</td>
												<td>${employee.getHighestEducationSchools() }</td>
												<td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
												<td>${employee.getBachelorofScience() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>出生日期：</td>
												<td><fmt:formatDate value="${employee.getDateofbirth() }" pattern="yyyy-MM-dd" /></td>
												<td>参加工作日期：</td>
												<td><fmt:formatDate value="${employee.getWorkDate() }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>到公司日期：</td>
												<td><fmt:formatDate value="${employee.getDatecompany() }" pattern="yyyy-MM-dd" /></td>
												<td>离职日期：</td>
												<td><fmt:formatDate value="${employee.getDateofseparation() }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>离职原因：</td>
												<td>${employee.getReasonforleaving() }</td>
												<td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
												<td>${employee.getBirthplace() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>政治面貌：</td>
												<td>${employee.getPoliticalstatus() }</td>
												<td>办公电话：</td>
												<td>${employee.getOfficePhone() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>家庭电话：</td>
												<td>${employee.getHomephone() }</td>
												<td>家庭住址：</td>
												<td>${employee.getHomeaddress() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
												<td>${employee.getPhone() }</td>
												<td>email：</td>
												<td>${employee.getEmail() }</td>
											</tr>
											<tr>
												<td>&nbsp;</td>
												<td colspan="3"><a
													href="changeEmpinfo.spring?userid=${employee.getUserid() }"><input
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
</body>
</html>