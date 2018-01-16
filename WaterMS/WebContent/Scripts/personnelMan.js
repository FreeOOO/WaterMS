var highlightcolor = '#d5f4fe';
var clickcolor = '#51b2f6';
function changeto() {
	source = event.srcElement;
	if (source.tagName == "TR" || source.tagName == "TABLE")
		return;
	while (source.tagName != "TD")
		source = source.parentElement;
	source = source.parentElement;
	cs = source.children;
	//alert(cs.length);
	if (cs[1].style.backgroundColor != highlightcolor && source.id != "nc"
			&& cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = highlightcolor;
		}
}
function changeback() {
	if (event.fromElement.contains(event.toElement)
			|| source.contains(event.toElement) || source.id == "nc")
		return
	if (event.toElement != source && cs[1].style.backgroundColor != clickcolor)
		for (i = 0; i < cs.length; i++) {
			cs[i].style.backgroundColor = "";
		}
}

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
	}else if(!/^([\u4e00-\u9fa5]+|([a-zA-Z]+\s?)+)$/g.test(name)){
		alert("请输入正确的姓名");
		return false;
	}
	var post = document.getElementById("post").value;
	if(post != ""){
		if(post.length > 15){
			alert("职务小于15个字");
			return false;
		}else if(!/^[u4E00-u9FA5]+$/.test(post)){
			alert("请输入正确的职务，只能为汉字");
			return false;
		}
	}
	var graduatedschool = document.getElementById("graduatedschool").value;
	if(graduatedschool != ""){
		if(graduatedschool.length > 15){
			alert("毕业学校小于15个字");
			return false;
		}else if(!/^[u4E00-u9FA5]+$/.test(graduatedschool)){
			alert("请输入正确的毕业学校");
			return false;
		}
	}
	var highestEducationSchools = document.getElementById("highestEducationSchools").value;
	if(highestEducationSchools != ""){
		if(highestEducationSchools.length > 15){
			alert("最高学历毕业学校小于15个字");
			return false;
		}else if(!/^[u4E00-u9FA5]+$/.test(highestEducationSchools)){
			alert("请输入正确的最高学历毕业学校");
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
	if(phone != "" && !/^(?:13\d|15[89])-?\d{5}(\d{3}|\*{3})$/.test(phone)){
		alert("请输入正确的手机号码");
		return false;
	}
	var email = document.getElementById("email").value;
	if(email == "" || !/^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/.test(email)){
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