<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../CSS/skin.css" />
<title>Insert title here</title>
</head>
<script type='text/javascript' src='../Scripts/My97DatePicker/WdatePicker.js'></script>
<script>
	function filldirthday(){
		var idnumber = document.getElementById("idnumber").value;
		var regic = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		if(regic.test(idnumber)){
			var tmp = idnumber.substring(6,14);
			var sex = idnumber.substring(16,17);
			var birth = tmp.substring(0,4) + "-" + tmp.substring(4,6) + "-" + tmp.substring(6,8);
			document.getElementById("dateofbirth").value = birth;
			if(sex % 2 == 0)
				sex = "女";
			else
				sex = "男";
			var sexarr = document.getElementsByName("sex");
			for(var i = 0;i < sexarr.length;i++){
				if(sexarr[i].value == sex)
					sexarr[i].checked = 'checked';
			}
		}else
			alert("请输入正确的身份证号");
	}
	function checkemployee(){
		var idnumber = document.getElementById("idnumber").value;
		if(idnumber == ""){
			alert("请输入身份证号");
			return false;
		}else if(!/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(idnumber)){
			alert("请输入正确的身份证");
			return false;
		}
		var name = document.getElementById("name").value;
		if(name == ""){
			alert("请输入姓名");
			return false;
		}else if(name.length > 8){
			alert("姓名数小于8个字");
			return false;
		}
		var jobtitle = document.getElementById("jobtitle").value;
		if(jobtitle == ""){
			alert("请选择职称");
			return false;
		}
		var job = document.getElementById("job").value;
		if(job == "请选择..."){
			alert("请选择岗位");
			return false;
		}
		var post = document.getElementById("post").value;
		if(post != ""){
			if(post.length > 15){
				alert("职务小于15个字");
				return false;
			}
		}
		var graduatedschool = document.getElementById("graduatedschool").value;
		if(graduatedschool != ""){
			if(graduatedschool.length > 15){
				alert("毕业学校小于15个字");
				return false;
			}
		}
		var highestEducationSchools = document.getElementById("highestEducationSchools").value;
		if(highestEducationSchools != ""){
			if(highestEducationSchools.length > 15){
				alert("最高学历毕业学校小于15个字");
				return false;
			}
		}
		var reasonforleaving = document.getElementById("reasonforleaving").value;
		if(reasonforleaving != "" && reasonforleaving.length > 150){
			alert("离职原因小于150字");
			return false;
		}
		var birthplace = document.getElementById("birthplace").value;
		if(birthplace != "" && birthplace.length > 50){
			alert("籍贯小于50字");
			return false;
		}
		var politicalstatus = document.getElementById("politicalstatus").value;
		if(politicalstatus != "" && politicalstatus.length > 5){
			alert("政治面貌小于5个字");
			return false;
		}
		var officePhone = document.getElementById("officePhone").value;
		if(officePhone != "" && !/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)/.test(officePhone)){
			alert("请输入正确的办公电话");
			return false;
		}
		var homephone = document.getElementById("homephone").value;
		if(homephone != "" && !/(^[0-9]{3,4}\-[0-9]{7,8}$)|(^[0-9]{7,8}$)/.test(homephone)){
			alert("请输入正确的家庭电话");
			return false;
		}
		var homeaddress = document.getElementById("homeaddress").value;
		if(homeaddress != "" && homeaddress.length > 50){
			alert("家庭住址小于50个字");
			return false;
		}
		var phone = document.getElementById("phone").value;
		if(phone != "" && !(/^1[3|4|5|7|8][0-9]{9}$/.test(phone))){
			alert("请输入正确的手机号码");
			return false;
		}
		var email = document.getElementById("email").value;
		if(email == "" || !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(email)){
			alert("请输入正确的邮箱");
			return false;
		}
		var file = document.getElementById("userphoto").value;
		if(file == ""){
			alert("请上传图片");
			return false;
		}else{
        	if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(file))
        	{
          		alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
         	 	return false;
        	}
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
										<form action="saveEmployee.spring" method="post" enctype="multipart/form-data">
											<table width="100%" class="cont">
												<tr>
													<td width="10%">&nbsp;</td>
													<td>身份证号：</td>
													<td width="35%"><input class="text" type="text"
														id="idnumber" name="idnumber" value="" onblur="filldirthday()"/>*</td>
													<td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
													<td width="35%"><input class="text" type="text"
														id="name" name="name" value="" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</td>
													<td><select id="jobtitle" name="jobtitle">
															<option selected></option>
															<option>初级</option>
															<option>中级</option>
															<option>副高</option>
															<option>正高</option>
													</select>*</td>
													<td>评定时间：</td>
													<td><input class="text" type="text"
														id="evaluationtime" name="evaluationtime" value="" size="10" maxlength="10" onClick="WdatePicker()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
													<td><input type="radio" id="sex" name="sex" value="男" />
														男 <input type="radio" id="sex" name="sex" value="女" /> 女
													</td>
													<td>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务</td>
													<td><input class="text" type="text" id="post"
														name="post" value="" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>岗&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
													<td><select id="job" name="job">
															<option selected>请选择...</option>
															<option>公司员工</option>
															<option>人事部长</option>
															<option>工程部长</option>
															<option>安全部长</option>
															<option>质量部长</option>
															<option>财务部长</option>
															<option>材料部长</option>
															<option>综合部长</option>
															<option>项目经理</option>
															<option>分管领导</option>
															<option>总经理</option>
															<option>董事长</option>
													</select>*</td>
													<td>第一学历：</td>
													<td><select id="firstdegree" name="firstdegree">
															<option selected></option>
															<option>小学</option>
															<option>初中</option>
															<option>高中/职中/中专</option>
															<option>大学专科</option>
															<option>大学本科</option>
															<option>硕士</option>
															<option>博士</option>
															<option>博士后</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>毕业学校：</td>
													<td><input class="text" type="text"
														id="graduatedschool" name="graduatedschool" value="" /></td>
													<td>最高学历：</td>
													<td><select id="highesteducation" name="highesteducation">
															<option selected></option>
															<option>小学</option>
															<option>初中</option>
															<option>高中/职中/中专</option>
															<option>大学专科</option>
															<option>大学本科</option>
															<option>硕士</option>
															<option>博士</option>
															<option>博士后</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>最高学历毕业学校：</td>
													<td><input class="text" type="text"
														id="highestEducationSchools"
														name="highestEducationSchools" value="" /></td>
													<td>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
													<td><select id="bachelorofScience" name="bachelorofScience">
															<option selected>无</option>
															<option>学士</option>
															<option>硕士</option>
															<option>博士</option>
													</select></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>出生日期：</td>
													<td><input class="text" type="text" id="dateofbirth"
														name="dateofbirth" value="" onfocus="this.blur()"/>*</td>
													<td>参加工作日期：</td>
													<td><input class="text" type="text" id="workDate"
														name="workDate" value="" size="10" maxlength="10" onClick="WdatePicker()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>到公司日期：</td>
													<td><input class="text" type="text" id="datecompany"
														name="datecompany" value="" size="10" maxlength="10" onClick="WdatePicker()"/></td>
													<td>离职日期：</td>
													<td><input class="text" type="text"
														id="dateofseparation" name="dateofseparation" value="" size="10" maxlength="10" onClick="WdatePicker()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>离职原因：</td>
													<td><input class="text" type="text"
														id="reasonforleaving" name="reasonforleaving" value="" /></td>
													<td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
													<td><input class="text" type="text" id="birthplace"
														name="birthplace" value="" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>政治面貌：</td>
													<td><input class="text" type="text"
														id="politicalstatus" name="politicalstatus" value="" /></td>
													<td>办公电话：</td>
													<td><input class="text" type="text" id="officePhone"
														name="officePhone" value="" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>家庭电话：</td>
													<td><input class="text" type="text" id="homephone"
														name="homephone" value="" /></td>
													<td>家庭住址：</td>
													<td><input class="text" type="text" id="homeaddress"
														name="homeaddress" value="" /></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
													<td><input class="text" type="text" id="phone"
														name="phone" value="" /></td>
													<td>email：</td>
													<td><input class="text" type="text" id="email"
														name="email" value="" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>照片：</td>
													<td><input type="file" id="userphoto" name="userphoto"></td>
												</tr>
												<!-- <tr>
                                                        <td>&nbsp;</td>
                                                        <td>栏目位置：</td>
                                                        <td>
                                                            <input type="checkbox" name="pos" value="0" /> 顶部 
                                                            <input type="checkbox" name="pos" value="1" /> 底部
                                                        </td>
                                                        <td>设置栏目的显示的范围与位置</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>浏览器标题(title)：</td>
                                                        <td><input class="text" style="width:200px;" type="text" name="bro_name" value="" /></td>
                                                        <td>浏览器标题(Title)，有利于SEO</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>关键字(Meta Keywords):：</td>
                                                        <td><textarea></textarea></td>
                                                        <td>Keywords 项出现在页面头部的 Meta 标签中，有利于SEO，多个关键字间请用半角逗号 "," 隔开</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>描述(Meta Description):：</td>
                                                        <td><textarea></textarea></td>
                                                        <td>Description 出现在页面头部的 Meta 标签中，有利于SEO</td>
                                                        <td>&nbsp;</td>
                                                    </tr> -->
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="submit"
														value="提交" onclick="return checkemployee()"/></td>
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