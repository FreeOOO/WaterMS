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
<script type='text/javascript' src='../Scripts/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript">
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
	var deadline = document.getElementById("deadline").value;
	if(deadline == ""){
		alert("请输入截止日期");
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
                    <table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" background="../Images/content_bg.gif">
                        <tr><td height="31"><div class="title">添加栏目</div></td></tr>
                    </table>
                </td>
                <td width="16" valign="top" background="../Images/mail_right_bg.gif"><img src="../Images/nav_right_bg.gif" width="16" height="29" /></td>
            </tr>
            <!-- 中间部分开始 -->
            <tr>
                <!--第一行左边框-->
                <td valign="middle" background="../Images/mail_left_bg.gif">&nbsp;</td>
                <!--第一行中间内容-->
                <td valign="top" bgcolor="#F7F8F9">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <!-- 空白行-->
                        <tr><td colspan="2" valign="top">&nbsp;</td><td>&nbsp;</td><td valign="top">&nbsp;</td></tr>
                        <!-- 一条线 -->
                        <tr>
                            <td height="40" colspan="4">
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
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
                                            <form action="changeLaborContract.spring" method="post">
                                                <table width="100%" class="cont">
                                                    <tr>
                                                        <td width="10%">&nbsp;</td>
                                                        <td>员工ID：</td>
                                                        <td width="35%"><input class="text" type="text" id="userid" name="userid" value="${laborContract.getUserid() }" />*</td>
                                                        <td>姓名：</td>
                                                        <td width="35%"><input class="text" type="text" id="name" name="name" value="${laborContract.getName() }" />*</td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>身份证号：</td>
                                                        <td><input class="text" type="text" id="idnumber" name="idnumber" value="${laborContract.getIdnumber() }" /></td>
                                                        <td>合同编号：</td>
                                                        <td><input class="text" type="text" id="contractNo" name="contractNo" value="${laborContract.getContractNo() }" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>合同类型：</td>
                                                        <td><input class="text" type="text" id="contracttype" name="contracttype" value="${laborContract.getContracttype() }" /></td>
                                                        <td>起始日期</td>
                                                        <td><input class="text" type="text" id="startDate" name="startDate" value="<fmt:formatDate value='${laborContract.getStartDate() }' pattern='yyyy-MM-dd' />" size="10" maxlength="10" onClick="WdatePicker()"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>截止日期：</td>
                                                        <td><input class="text" type="text" id="deadline" name="deadline" value="<fmt:formatDate value='${laborContract.getDeadline() }' pattern='yyyy-MM-dd' />" size="10" maxlength="10" onClick="WdatePicker()"/></td>
                                                        <td>签订日期：</td>
                                                        <td><input class="text" type="text" id="dateofsigning" name="dateofsigning" value="<fmt:formatDate value='${laborContract.getDateofsigning() }' pattern='yyyy-MM-dd' />" size="10" maxlength="10" onClick="WdatePicker()"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td>签订对象：</td>
                                                        <td><input class="text" type="text" id="signedobjects" name="signedobjects" value="${laborContract.getSignedobjects() }" /></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td colspan="3"><input class="btn" type="submit" value="提交" onclick="return checklaborcontact()"/></td>
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
                                <table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
                                    <tr><td></td></tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td background="../Images/mail_right_bg.gif">&nbsp;</td>
            </tr>
            <!-- 底部部分 -->
            <tr>
                <td valign="bottom" background="../Images/mail_left_bg.gif">
                    <img src="../Images/buttom_left.gif" width="17" height="17" />
                </td>
                <td background="../Images/buttom_bgs.gif">
                    <img src="../Images/buttom_bgs.gif" width="17" height="17">
                </td>
                <td valign="bottom" background="../Images/mail_right_bg.gif">
                    <img src="../Images/buttom_right.gif" width="16" height="17" />
                </td>           
            </tr>
        </table>
    </body>
</html>