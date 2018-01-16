<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>淮阴水利有限公司综合管理信息系统</title>
<link rel="stylesheet" type="text/css" href="../CSS/skin.css" />
<script src="../Scripts/jquery-1.12.3.js"></script>
<script src="../Scripts/json2.js"></script>
<script type="text/javascript">
	function userinfo(username, password) {
		this.username = username;
		this.password = password;
	}
	function sendAjax() {
		var flag = true;
		var userinfoRef = new userinfo(
				document.getElementById("username").value, document
						.getElementById("password").value);
		var jsonStringRef = JSON.stringify(userinfoRef);
		$.ajaxSetup({
			async : false
		});
		$.post("../checkUserbyJson.spring?t=" + new Date().getTime(), {
			jsonString : jsonStringRef
		}, function(data) {
			if (data == "true")
				flag = true;
			else {
				flag = false;
				alert("用户名或密码错误");
			}
		});
		return flag;
	}
</script>
</head>
<body>
	<table width="100%">
		<!-- 顶部部分 -->
		<tr height="41">
			<td colspan="2" background="../Images/login_top_bg.gif">&nbsp;</td>
		</tr>
		<!-- 主体部分 -->
		<tr style="background: url(../Images/login_bg.jpg) repeat-x;"
			height="532">
			<!-- 主体左部分 -->
			<td id="left_cont">
				<table width="100%" height="100%">
					<tr height="155">
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td width="20%" rowspan="2">&nbsp;</td>
						<td width="60%">
							<table width="100%">
								<tr height="70">
									<td align="right"><img src="../Images/logo.gif"
										title="瑞曼科技" alt="瑞曼科技" /></td>
								</tr>
								<tr height="274">
									<td valign="top" align="right">
										<ul>
											<li>1- 企业门户站建立的首选方案...</li>
											<li>2- 一站通式的整合方式，方便用户使用...</li>
											<li>3- 强大的后台系统，管理内容易如反掌...</li>
											<li><img src="../Images/icon_demo.gif" />&nbsp;<a
												href="javascript:void(0)">使用说明</a>&nbsp;&nbsp;<span>
													<a target="_blank"
													href=" "
													onfocus="this.blur()"><img border="0"
														src="" alt="瑞曼为您服务"
														title="瑞曼科技"></a>
											</span></li>
										</ul>
									</td>
								</tr>
							</table>
						<td width="15%" rowspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
				</table>
			</td>
			<!-- 主体右部分 -->
			<td id="right_cont">
				<table height="100%">
					<tr height="30%">
						<td colspan="3">&nbsp;</td>
					</tr>
					<tr>
						<td width="30%" rowspan="5">&nbsp;</td>
						<td valign="top" id="form">
							<form action="../checkUser.spring" method="post">
								<table valign="top" width="50%">
									<tr>
										<td colspan="2"><h4
												style="letter-spacing: 1px; font-size: 16px;">RainMan
												网站管理后台</h4></td>
									</tr>
									<tr>
										<td>管理员：</td>
										<td><input type="text" id="username" name="username"
											value="" /></td>
									</tr>
									<tr>
										<td>密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
										<td><input type="password" id="password" name="password"
											value="" /></td>
									</tr>
									<tr>
										<td>验证码：</td>
										<td><input type="text" name="" value=""
											style="width: 80px;" /></td>
									</tr>
									<tr class="bt" align="center">
										<td>&nbsp;<input type="submit" value="登陆"
											onclick="return sendAjax()" /></td>
										<td>&nbsp;<input type="reset" value="重填" /></td>
									</tr>
								</table>
							</form>
						</td>
						<td rowspan="5">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 底部部分 -->
		<tr id="login_bot">
			<td colspan="2"><p>Copyright © 2011-2012 RainMan 网络工作室</p></td>
		</tr>
	</table>
</body>
</html>