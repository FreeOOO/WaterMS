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
	function checkemployee() {
		var idnumber = document.getElementById("idnumber").value;
		if (idnumber == "") {
			alert("请输入身份证号");
			return false;
		} else if (!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(idnumber)) {
			alert("请输入正确的身份证");
			return false;
		}
		var name = document.getElementById("name").value;
		if (name == "") {
			alert("请输入姓名");
			return false;
		} else if (name.length > 8) {
			alert("姓名数小于8个字");
			return false;
		}
		var jobtitle = document.getElementById("jobtitle").value;
		if (jobtitle == "") {
			alert("请选择职称");
			return false;
		}
		var job = document.getElementById("job").value;
		if (job == "请选择...") {
			alert("请选择岗位");
			return false;
		}
		var post = document.getElementById("post").value;
		if (post != "") {
			if (post.length > 15) {
				alert("职务小于15个字");
				return false;
			}
		}
		var graduatedschool = document.getElementById("graduatedschool").value;
		if (graduatedschool != "") {
			if (graduatedschool.length > 15) {
				alert("毕业学校小于15个字");
				return false;
			}
		}
		var highestEducationSchools = document
				.getElementById("highestEducationSchools").value;
		if (highestEducationSchools != "") {
			if (highestEducationSchools.length > 15) {
				alert("最高学历毕业学校小于15个字");
				return false;
			}
		}
		var reasonforleaving = document.getElementById("reasonforleaving").value;
		if (reasonforleaving != "" && reasonforleaving.length > 150) {
			alert("离职原因小于150字");
			return false;
		}
		var birthplace = document.getElementById("birthplace").value;
		if (birthplace != "" && birthplace.length > 50) {
			alert("籍贯小于50字");
			return false;
		}
		var politicalstatus = document.getElementById("politicalstatus").value;
		if (politicalstatus != "" && politicalstatus.length > 5) {
			alert("政治面貌小于5个字");
			return false;
		}
		var officePhone = document.getElementById("officePhone").value;
		if (officePhone != ""
				&& !/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)/
						.test(officePhone)) {
			alert("请输入正确的办公电话");
			return false;
		}
		var homephone = document.getElementById("homephone").value;
		if (homephone != ""
				&& !/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)/.test(homephone)) {
			alert("请输入正确的家庭电话");
			return false;
		}
		var homeaddress = document.getElementById("homeaddress").value;
		if (homeaddress != "" && homeaddress.length > 50) {
			alert("家庭住址小于50个字");
			return false;
		}
		var phone = document.getElementById("phone").value;
		if (phone != "" && !(/^1[3|4|5|7|8][0-9]{9}$/.test(phone))) {
			alert("请输入正确的手机号码");
			return false;
		}
		var email = document.getElementById("email").value;
		if (email == ""
				|| !/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
						.test(email)) {
			alert("请输入正确的邮箱");
			return false;
		}
		var file = document.getElementById("userphoto").value;
		if (file != "" && !/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file)) {
			alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
			return false;
		}
		return true;
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
										<form action="changeEmployee.spring" method="post"
											enctype="multipart/form-data">
											<table width="100%" class="cont">
												<tr>
													<td width="10%">&nbsp;</td>
													<td>身份证号：</td>
													<td width="35%"><input class="text" type="text"
														id="idnumber" name="idnumber"
														value="${employee.getIdnumber() }" onfocus="this.blur()"/>*</td>
													<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
													<td width="35%"><input class="text" type="text"
														id="name" name="name" value="${employee.getName() }" onfocus="this.blur()"/>*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
													<td><select id="jobtitle" name="jobtitle">
															<option ${employee.getJobtitle()=="初级"?"selected":"" }>初级</option>
															<option ${employee.getJobtitle()=="中级"?"selected":"" }>中级</option>
															<option ${employee.getJobtitle()=="副高"?"selected":"" }>副高</option>
															<option ${employee.getJobtitle()=="正高"?"selected":"" }>正高</option>
													</select>*</td>
													<td>评定时间：</td>
													<td><input class="text" type="text"
														id="evaluationtime" name="evaluationtime" size="10"
														maxlength="10"
														value="<fmt:formatDate value='${employee.getEvaluationtime() }' pattern='yyyy-MM-dd' />"
														size="10" maxlength="10" onClick="WdatePicker()" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
													<td><input type="radio" id="sex" name="sex" value="男"
														${employee.getSex() == "男" ? "checked" : "" } /> 男 <input
														type="radio" id="sex" name="sex" value="女"
														${employee.getSex() == "女" ? "checked" : "" } /> 女</td>
													<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</td>
													<td><input class="text" type="text" id="post"
														name="post" value="${employee.getPost() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>岗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
													<td><select id="job" name="job">
															<option selected>请选择...</option>
															<option ${employee.getJob()=="公司员工"?"selected":"" }>公司员工</option>
															<option ${employee.getJob()=="人事部长"?"selected":"" }>人事部长</option>
															<option ${employee.getJob()=="工程部长"?"selected":"" }>工程部长</option>
															<option ${employee.getJob()=="安全部长"?"selected":"" }>安全部长</option>
															<option ${employee.getJob()=="质量部长"?"selected":"" }>质量部长</option>
															<option ${employee.getJob()=="财务部长"?"selected":"" }>财务部长</option>
															<option ${employee.getJob()=="材料部长"?"selected":"" }>材料部长</option>
															<option ${employee.getJob()=="综合部长"?"selected":"" }>综合部长</option>
															<option ${employee.getJob()=="项目经理"?"selected":"" }>项目经理</option>
															<option ${employee.getJob()=="分管领导"?"selected":"" }>分管领导</option>
															<option ${employee.getJob()=="总经理"?"selected":"" }>总经理</option>
															<option ${employee.getJob()=="董事长"?"selected":"" }>董事长</option>
													</select>*</td>
													<td>第一学历：</td>
													<td><select id="firstdegree" name="firstdegree">
															<option selected></option>
															<option ${employee.getFirstdegree()=="小学"?"selected":"" }>小学</option>
															<option ${employee.getFirstdegree()=="初中"?"selected":"" }>初中</option>
															<option
																${employee.getFirstdegree()=="高中/职中/中专"?"selected":"" }>高中/职中/中专</option>
															<option
																${employee.getFirstdegree()=="大学专科"?"selected":"" }>大学专科</option>
															<option
																${employee.getFirstdegree()=="大学本科"?"selected":"" }>大学本科</option>
															<option ${employee.getFirstdegree()=="硕士"?"selected":"" }>硕士</option>
															<option ${employee.getFirstdegree()=="博士"?"selected":"" }>博士</option>
															<option
																${employee.getFirstdegree()=="博士后"?"selected":"" }>博士后</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>毕业学校：</td>
													<td><input class="text" type="text"
														id="graduatedschool" name="graduatedschool"
														value="${employee.getGraduatedschool() }" /></td>
													<td>最高学历：</td>
													<td><select id="highesteducation"
														name="highesteducation">
															<option selected></option>
															<option
																${employee.getHighesteducation()=="小学"?"selected":"" }>小学</option>
															<option
																${employee.getHighesteducation()=="初中"?"selected":"" }>初中</option>
															<option
																${employee.getHighesteducation()=="高中/职中/中专"?"selected":"" }>高中/职中/中专</option>
															<option
																${employee.getHighesteducation()=="大学专科"?"selected":"" }>大学专科</option>
															<option
																${employee.getHighesteducation()=="大学本科"?"selected":"" }>大学本科</option>
															<option
																${employee.getHighesteducation()=="硕士"?"selected":"" }>硕士</option>
															<option
																${employee.getHighesteducation()=="博士"?"selected":"" }>博士</option>
															<option
																${employee.getHighesteducation()=="博士后"?"selected":"" }>博士后</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>最高学历毕业学校：</td>
													<td><input class="text" type="text"
														id="highestEducationSchools"
														name="highestEducationSchools"
														value="${employee.getHighestEducationSchools() }" /></td>
													<td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
													<td><select id="bachelorofScience"
														name="bachelorofScience">
															<option selected>无</option>
															<option
																${employee.getBachelorofScience()=="学士"?"selected":"" }>学士</option>
															<option
																${employee.getBachelorofScience()=="硕士"?"selected":"" }>硕士</option>
															<option
																${employee.getBachelorofScience()=="博士"?"selected":"" }>博士</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>出生日期：</td>
													<td><input class="text" type="text" id="dateofbirth"
														name="dateofbirth"
														value="<fmt:formatDate value='${employee.getDateofbirth() }' pattern='yyyy-MM-dd' />"
														onfocus="this.blur()"/>*</td>
													<td>参加工作日期：</td>
													<td><input class="text" type="text" id="workDate"
														name="workDate"
														value="<fmt:formatDate value='${employee.getWorkDate() }' pattern='yyyy-MM-dd' />"
														size="10" maxlength="10" onClick="WdatePicker()" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>到公司日期：</td>
													<td><input class="text" type="text" id="datecompany"
														name="datecompany"
														value="<fmt:formatDate value='${employee.getDatecompany() }' pattern='yyyy-MM-dd'  />"
														size="10" maxlength="10" onClick="WdatePicker()" /></td>
													<td>离职日期：</td>
													<td><input class="text" type="text"
														id="dateofseparation" name="dateofseparation"
														value="<fmt:formatDate value='${employee.getDateofseparation() }' pattern='yyyy-MM-dd' />"
														size="10" maxlength="10" onClick="WdatePicker()" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>离职原因：</td>
													<td><input class="text" type="text"
														id="reasonforleaving" name="reasonforleaving"
														value="${employee.getReasonforleaving() }" /></td>
													<td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
													<td><input class="text" type="text" id="birthplace"
														name="birthplace" value="${employee.getBirthplace() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>政治面貌：</td>
													<td><input class="text" type="text"
														id="politicalstatus" name="politicalstatus"
														value="${employee.getPoliticalstatus() }" /></td>
													<td>办公电话：</td>
													<td><input class="text" type="text" id="officePhone"
														name="officePhone" value="${employee.getOfficePhone() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>家庭电话：</td>
													<td><input class="text" type="text" id="homephone"
														name="homephone" value="${employee.getHomephone() }" /></td>
													<td>家庭住址：</td>
													<td><input class="text" type="text" id="homeaddress"
														name="homeaddress" value="${employee.getHomeaddress() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
													<td><input class="text" type="text" id="phone"
														name="phone" value="${employee.getPhone() }" /></td>
													<td>email：</td>
													<td><input class="text" type="text" id="email"
														name="email" value="${employee.getEmail() }" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>照片：</td>
													<td><input type="file" id="userphoto" name="userphoto"></td>
													<td><input type="text" id="userid" name="userid"
														value="${employee.getUserid() }" style="display: none" />
														<input type="text" id="photo" name="photo"
														value="${employee.getPhoto() }" style="display: none" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="submit"
														value="提交" onclick="return checkemployee()" /></td>
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