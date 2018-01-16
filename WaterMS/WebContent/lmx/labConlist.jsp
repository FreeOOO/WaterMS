<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/personnelMan.css" />
<script type='text/javascript' src='../Scripts/personnelMan.js'></script>
</head>
<script>
	function allCheck(check) {
		var checkbox = document.getElementsByName("userid");
		if (check.checked) {
			for (var i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = "checked";
			}
		} else {
			for (var i = 0; i < checkbox.length; i++) {
				checkbox[i].checked = "";
			}
		}
	}
	function checkjh(tmp){
		alert("此劳动合同已借出");
		return false;
	}
</script>
<body>
<form action="findlabcon.spring">
					员工ID<input type="text" id="userid" name="userid" value="" size="10" onkeyup="value=this.value.replace(/\D+/g,'')"/>
					<input type="submit" value="查询">
				</form>
	<form action="deleteLaborContract.spring" method="post">
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30"><table width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44"><table width="100%"
									border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td><table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="6%" height="19" valign="bottom"><div
															align="center">
															<img src="../Images/tb.gif" width="14" height="14" />
														</div></td>
													<td width="94%" valign="bottom"><span class="STYLE1">
															劳动合同信息列表</span></td>
												</tr>
											</table></td>
										<td><div align="right">
												<span class="STYLE1"> <input type="checkbox"
													name="checkbox" id="checkbox" onclick="allCheck(this)" />
													全选 &nbsp;&nbsp;<img src="../Images/add.gif" width="10"
													height="10" /> <a href="labConadd.jsp">添加</a> &nbsp;
													<button type="submit"
														style="color: #e1e2e3; background-color: #353c44; border: 0;">
														<img src="../Images/del.gif" width="10" height="10" /> 删除
													</button></span><span class="STYLE1"> &nbsp;</span>
											</div></td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
			<tr>
				<td><table width="100%" border="0" cellpadding="0"
						cellspacing="1" bgcolor="#a8c7ce" onmouseover="changeto()"
						onmouseout="changeback()">
						<tr>
							<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10"><div
									align="center">
									<input type="checkbox" name="checkbox" id="checkbox"
										onclick="allCheck(this)" />
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">姓名</span>
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">合同编号</span>
								</div></td>
							<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">起始日期</span>
								</div></td>
							<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">截止日期</span>
								</div></td>
							<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">签订对象</span>
								</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">借用状态</span>
								</div></td>
							<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">基本操作</span>
								</div></td>
						</tr>
						<!-- 循环打印数据  -->
						<c:forEach var="laborContract" items="${page.getList() }">
							<tr>
								<td height="20" bgcolor="#FFFFFF"><div align="center">
										<input type="checkbox" name="userid" id="userid"
											value="${laborContract.getUserid() }" />
									</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div
										align="center">${laborContract.getName() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div
										align="center">${laborContract.getContractNo() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center"><fmt:formatDate value="${laborContract.getStartDate() }" pattern="yyyy-MM-dd" /></div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center"><fmt:formatDate value="${laborContract.getDeadline() }" pattern="yyyy-MM-dd" /></div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${laborContract.getSignedobjects() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${laborContract.getWhetherrestitution() == "是" ? "<font color='red'>已借出</font>" : "未借出" }</div></td>
								<td height="20" bgcolor="#FFFFFF"><div align="center"
										class="STYLE21">
										<a
											href="deleteLaborContract.spring?userid=${laborContract.getUserid() }"><font
											color=black>删除</font></a> | <a
											href="getLaborContract.spring?userid=${laborContract.getUserid() }"><font
											color=black>详细信息</font></a> | <a
											href="borrowlabConadd.jsp?userid=${laborContract.getUserid() }&name=${laborContract.getName() }" ${laborContract.getWhetherrestitution() == "是" ? "onclick='return checkjh()'" : "" }><font
											color=black>借用登记</font></a>
									</div></td>
							</tr>
						</c:forEach>
					</table></td>
		</table>
	</form>
	<form action="showLaborContractlist.spring" method="get">
		<table>
			<tr>
				<td height="30"><table width="1150" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td width="30%"><div align="left">
									<span class="STYLE22">&nbsp;&nbsp;共有<strong>
											${page.getCounts() }</strong> 条记录，当前第<strong>
											${page.getPage() }</strong> 页，共 <strong>${page.getTatalPage() }</strong>
										页
									</span>
								</div></td>
							<td width="70%"><table width="312" border="0" align="right"
									cellpadding="0" cellspacing="0">
									<tr>
										<td width="49"><div align="center">
												<a href="showLaborContractlist.spring?requestpage=1"><img
													src="../Images/main_54.gif" width="40" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showLaborContractlist.spring?requestpage=${page.getPage() - 1 }"><img
													src="../Images/main_56.gif" width="45" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showLaborContractlist.spring?requestpage=${page.getPage() + 1 }"><img
													src="../Images/main_58.gif" width="45" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showLaborContractlist.spring?requestpage=${page.getTatalPage() }"><img
													src="../Images/main_60.gif" width="40" height="15" /></a>
											</div></td>
										<td width="37" class="STYLE22"><div align="center">转到</div></td>
										<td width="22"><div align="center">
												<input type="text" name="requestpage" id="requestpage"
													style="width: 20px; height: 12px; font-size: 12px; border: solid 1px #7aaebd;" />
											</div></td>
										<td width="22" class="STYLE22"><div align="center">页</div></td>
										<td width="35"><input type="image"
											src="../Images/main_62.gif" width="26" height="15" /></td>
									</tr>
								</table></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</form>
</body>
</html>