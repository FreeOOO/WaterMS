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
<script src="../Scripts/jquery-1.12.3.js"></script>
<script src="../Scripts/json2.js"></script>
<script type="text/javascript">
	function userinfo(userid) {
		this.userid = userid;
	}
	function sendAjax() {
		if(document.getElementById("userid").value == "")
			return false;
		var userinfoRef = new userinfo(document.getElementById("userid").value);
		var jsonStringRef = JSON.stringify(userinfoRef);
		$.post("isExistEmployee.spring?t=" + new Date().getTime(), {
			jsonString : jsonStringRef
		}, function(data) {
			if (data == "false"){
				document.getElementById("userid").value = "";
				document.getElementById("userid").focus();
				alert("用户不存在,请重填");
				//flag = true;
			}else if(data == "isexist"){
				document.getElementById("userid").value = "";
				document.getElementById("name").value = "";
				document.getElementById("idnumber").value = "";
				document.getElementById("userid").focus();
				alert("此用户合同已录入");
			}else{
				var jsonObject = JSON.parse(data);
				document.getElementById("name").value = jsonObject.name;
				document.getElementById("idnumber").value = jsonObject.idnumber;
			}
			/* if (data != "false"){
				var jsonObject = JSON.parse(data);
				document.getElementById("name").value = jsonObject.name;
				document.getElementById("idnumber").value = jsonObject.idnumber;
				//flag = true;
			}else {
				document.getElementById("userid").value = "";
				document.getElementById("userid").focus();
				alert("用户不存在,请重填");
			} */
		});
	}
	function checklaborcontact(){
		var userid = document.getElementById("userid").value;
		if(userid == ""){
			alert("请输入员工ID");
			return false;
		}
		var contractNo = document.getElementById("contractNo").value;
		if(contractNo == ""){
			alert("请输入合同编号");
			return false;
		}else if(contractNo.length > 25){
			alert("合同编号小于25字");
			return false;
		}
		var startDate = document.getElementById("startDate").value;
		if(startDate == ""){
			alert("请输入起始日期");
			return false;
		}
		var deadline = document.getElementById("deadline").value;
		//alert(Date.parse(deadline));
		if(deadline == ""){
			alert("请输入截止日期");
			return false;
		}
		if(Date.parse(deadline) - Date.parse(startDate) < 0){
			alert("截止日期不能小于起始日期");
			return false;
		}
		var signedobjects = document.getElementById("signedobjects").value;
		if(signedobjects == ""){
			alert("请输入签订对象");
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
										<form action="saveLaborContract.spring" method="post">
											<table width="100%" class="cont">
												<tr>
													<td width="10%">&nbsp;</td>
													<td>员工ID：</td>
													<td width="35%"><input class="text" type="text"
														id="userid" name="userid" value="" onblur="sendAjax()" onkeyup="value=this.value.replace(/\D+/g,'')"/>*</td>
													<td>姓名：</td>
													<td width="35%"><input class="text" type="text"
														id="name" name="name" value="" onfocus="this.blur()"/>*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>身份证号：</td>
													<td><input class="text" type="text" id="idnumber"
														name="idnumber" value="" onfocus="this.blur()"/></td>
													<td>合同编号：</td>
													<td><input class="text" type="text" id="contractNo"
														name="contractNo" value="" onkeyup="value=this.value.replace(/\D+/g,'')"/>*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>合同类型：</td>
													<td><input class="text" type="text" id="contracttype"
														name="contracttype" value="" /></td>
													<td>起始日期</td>
													<td><input class="text" type="text" id="startDate"
														name="startDate" value="" size="10" maxlength="10" onClick="WdatePicker()" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>截止日期：</td>
													<td><input class="text" type="text" id="deadline"
														name="deadline" value="" size="10" maxlength="10" onClick="WdatePicker()"/>*</td>
													<td>签订日期：</td>
													<td><input class="text" type="text" id="dateofsigning"
														name="dateofsigning" value="" size="10" maxlength="10" onClick="WdatePicker()"/></td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td>签订对象：</td>
													<td><input class="text" type="text" id="signedobjects"
														name="signedobjects" value="" />*</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
													<td colspan="3"><input class="btn" type="submit"
														value="提交" onclick="return checklaborcontact()"/></td>
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