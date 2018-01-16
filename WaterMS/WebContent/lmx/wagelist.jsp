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
<script type='text/javascript' src='../Scripts/My97DatePicker/WdatePicker.js'></script>
</head>
<body>
<table>
	<tr>
		<td><form action="downloadPDFWagebymonth.spring" method="post">
		选择要打印的月份:<input class="text" type="text" id="time" name="time" value="" size="7" maxlength="7" onClick="WdatePicker({dateFmt:'yyyy-MM'})"/>
		<input type="submit" value="打印">
		</form></td>
		<td width="12%">&nbsp;</td>
			<td><form action="findwage.spring">
					员工ID<input type="text" id="userid" name="userid" value="" size="10" onkeyup="value=this.value.replace(/\D+/g,'')"/>
					<input type="submit" value="查询">
				</form>
			</td>
	</tr>
</table>
	<form action="#" method="post">
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
															工资列表</span></td>
												</tr>
											</table></td>
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
							<td width="5%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">姓名</span>
								</div></td>
							<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">工资发放时间</span>
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">基本工资</span>
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">应发合计</span>
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">扣款合计</span>
								</div></td>
							<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">实发工资</span>
								</div></td>
							<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6"><div
									align="center">
									<span class="STYLE10">基本操作</span>
								</div></td>
						</tr>
						<!-- 循环打印数据  -->
						<c:forEach var="wage" items="${page.getList() }">
							<tr>
								<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div
										align="center">${wage.getName() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE6"><div
										align="center"><fmt:formatDate value="${wage.getPayrollTime() }" pattern="yyyy-MM-dd" /></div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${wage.getBasicwage() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${wage.getTotalsent() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${wage.getTotalcharge() }</div></td>
								<td height="20" bgcolor="#FFFFFF" class="STYLE19"><div
										align="center">${wage.getRealwages() }</div></td>
								<td height="20" bgcolor="#FFFFFF"><div align="center"
										class="STYLE21">
										<a href="getWage.spring?nowage=${wage.getNowage() }"><font
											color=black>详细信息</font></a> | <a
											href="downloadPDFWage.spring?nowage=${wage.getNowage() }"
											target="_blank"><font color=black>打印</font></a>
									</div></td>
							</tr>
						</c:forEach>
					</table></td>
		</table>
	</form>
	<form action="showWagelist.spring" method="get">
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
												<a href="showWagelist.spring?requestpage=1"><img
													src="../Images/main_54.gif" width="40" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showWagelist.spring?requestpage=${page.getPage() - 1 }"><img
													src="../Images/main_56.gif" width="45" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showWagelist.spring?requestpage=${page.getPage() + 1 }"><img
													src="../Images/main_58.gif" width="45" height="15" /></a>
											</div></td>
										<td width="49"><div align="center">
												<a
													href="showWagelist.spring?requestpage=${page.getTatalPage() }"><img
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