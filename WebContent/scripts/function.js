// JavaScript Document


function FocusItem(obj)
{
	obj.parentNode.parentNode.className = "current";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	msgBox.innerHTML = "";
	msgBox.className = "";
}
//验证留言输入的值
CheckGuestBook = function(obj){
	obj.parentNode.parentNode.className="";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch(obj.name){
	case "guestName":
		if(obj.value == ""){
			msgBox.innerHTML="昵称不可以为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "guestTitle":
		if(obj.value == ""){
			msgBox.innerHTML="留言标题不可以为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "guestContent":
		if(obj.value == ""){
			msgBox.innerHTML="留言内容不可以为空";
			msgBox.className = "error";
			return false;
		}
		break;
	}
	return true;
}
//验证登录输入的值
CheckLogin = function(obj){
	obj.parentNode.parentNode.className="";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch(obj.name){
	case "userName":
		if(obj.value == ""){
			msgBox.innerHTML = "用户名不可以为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "passWord":
		if(obj.value == "") {
			msgBox.innerHTML = "密码不可以为空";
			msgBox.className = "error";
			return false;
		}
		break;
	case "veryCode":
		if(obj.value == ""){
			msgBox.innerHTML="验证码不可以为空";
			msgBox.className="error";
			return false;
		}
		break;
	}
	return true;
}
//验证添加商品名称
CheckProductItem = function(obj){
	//去除css样式
	obj.parentNode.parentNode.className="";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch(obj.name){
	case "productName":
			if(obj.value == ""){
				msgBox.innerHTML="商品名称不可以为空";
				msgBox.className="error";
				return false;
			}
		break;
	case "productDescription":
			if(obj.value == ""){
				msgBox.innerHTML="商品描述不可以为空";
				msgBox.className="error";
				return false;
			}
		break;
	case "photo":
			if(obj.value == ""){
				msgBox.innerHTML="商品图片路径不可以为空";
				msgBox.className="error";
				return false;
			}
		break;
	case "productPrice":
		//正则表达式价格
			var reg =/^(\d*\.\d{0,2}|\d+).*$/;
			if(obj.value == ""){
				msgBox.innerHTML="商品价格不可以为空";
				msgBox.className="error";
				return false;
			}
			else if(!reg.test(obj.value)){
				msgBox.innerHTML="商品价格填写错误";
				msgBox.className="error";
				return false;
			}
		break;
	case "productStock":
		var reg = /^\d{1,}$/;
		if(obj.value == ""){
			msgBox.innerHTML="库存不可以为空";
			msgBox.className="error";
			return false;
		}
		else if(!reg.test(obj.value)){
			msgBox.innerHTML="库存添加错误";
			msgBox.className="error";
			return false;
		}
		break;
	}
	return true;
}
//验证注册输入的值
function CheckItem(obj)
{
	obj.parentNode.parentNode.className = "";
	var msgBox = obj.parentNode.getElementsByTagName("span")[0];
	switch(obj.name) {
		case "userName":
			var regcode = /^\w{6,}$/;
			if(obj.value == "") {
				msgBox.innerHTML = "用户名不可以为空";
				msgBox.className = "error";
				return false;
			}else if(!regcode.test(obj.value)){
				msgBox.innerHTML = "用户名长度不可以小于6";
				msgBox.className = "error";
				return false;
			}else{
				$.ajax({
					url:"../BackManager/serch.do",
					type:"POST",
					data:{name:obj.value},
					dataType:"text",
					success:function(data,status){
						msgBox.innerHTML = data;
						msgBox.className = "error";
					}
				});
			}
			break;
		case "passWord":
			if(obj.value == "") {
				msgBox.innerHTML = "密码不可以为空";
				msgBox.className = "error";
				return false;
			}
			break;
		case "rePassWord":
			if(obj.value == "") {
				msgBox.innerHTML = "确认密码不可以为空";
				msgBox.className = "error";
				return false;
			} else if(obj.value != document.getElementById("passWord").value) {
				msgBox.innerHTML = "两次输入的密码不相同";
				msgBox.className = "error";
				return false;
			}
			break;
		case "phone":
			var regcode = /^\d{11}$/;
			if(obj.value == ""){
				msgBox.innerHTML="手机号不可以为空";
				msgBox.className= "error";
				return false;
			}else if(!regcode.test(obj.value)){
				msgBox.innerHTML="手机号填写不正确";
				msgBox.className= "error";
				return false;
			}
			break;
		case "email":
			var regcode = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if(obj.value == ""){
					msgBox.innerHTML="邮箱地址不可以为空";
					msgBox.className= "error";
					return false;
				}else if(!regcode.test(obj.value)){
					msgBox.innerHTML="邮箱地址输入不正确";
					msgBox.className= "error";
					return false;
				}
			break;
		case "veryCode":
			if(obj.value == "") {
				msgBox.innerHTML = "验证码不能为空";
				msgBox.className = "error";
				return false;
			}
			break;
	}
	return true;
}
//验证留言表单
checkGuestbookForm = function(frm){
	var bl = true;
	var els = frm.getElementsByTagName("input");
	for(var i =0;i<els.length;i++){
		if(!CheckGuestBook(els[i])){
			bl =false;
			break;
		}
	}
	return bl;
}
//验证添加商品
checkProductForm = function(frm){
	var bl = true;
	var els = frm.getElementsByTagName("input");
	for(var i =0;i<els.length;i++){
		if(!CheckProductItem(els[i])){
			bl =false;
			break;
		}
	}
	return bl;
}
//验证登录表单
function checkLoginForm(frm){
	var bl = true;
	var els = frm.getElementsByTagName("input");
	for(var i =0;i<els.length;i++){
		if(!CheckLogin(els[i])){
			bl =false;
			break;
		}
	}
	return bl;
	
	
}
//验证注册表单
function checkForm(frm)
{
	var bl = true;
	var els = frm.getElementsByTagName("input");
	for(var i =0;i<els.length;i++){
		if(!CheckItem(els[i])){
			bl =false;
			break;
		}
	}
	return bl;
}

function inArray(array, str)
{
	for(a in array) {
		if(array[a] == str) return true;
	}
	return false;
}

//结算
function goBuy(id)
{
	var count = document.getElementById("count").value;
	var stock = document.getElementById("proStock").innerHTML;
	var msg = document.getElementById("showMes");
	var regcode=/^\d{1,}$/;
	if(!regcode.test(count)){
		msg.innerHTML="<img src='images/isok.png'/>";
		return false;
	}
	else if(count > parseInt(stock)){
			msg.innerHTML="<img src='images/ms.png'/>";
			return false;
	}else{
		msg.innerHTML="";
	}
	$.ajax({
		url:"addshopcare.do",
		type:"POST",
		data:{productId:id,productCount:count},
		success:function(data,status){
			location.href="loadshopcart.do";
		}
		
	});
}

function delShopping(id)
{
	var tr = document.getElementById("product_id_"+ id);

	if(tr) tr.parentNode.removeChild(tr);
	//使用Jquery Ajax 调用删除购物车商品的Servlet
	$.ajax({
		url:"deleteshopcart.do",
		type:"POST",
		data:{"productId":id},
		dateType:"text",
		success:function(){
			//重新加载购物车的信息
			location.reload(true);
		}
	});
}
function reloadPrice(id, status,stock,type)
{
	var price = document.getElementById("price_id_" + id).getElementsByTagName("input")[0].value;
	var priceBox = document.getElementById("price_id_" + id).getElementsByTagName("span")[0];
	var number = document.getElementById("number_id_" + id);
	//提示输入数量错误
	var me = document.getElementById("mesCount"+id);
	//存放本次操作数量的标签
	var pcount = document.getElementById("privodeCount"+id);
	
	
	/**
	 * 如果输入的数量大于库存并且状态是true时
	 * 也就是增加商品时
	 */
	if(number.value >= stock && status==true){
		//显示提示
		me.parentNode.style.display="block";
		me.innerHTML="已经超过了该商品的库存";
		//否则不大于时，执行的操作
	}else{
		//隐藏提示
		me.parentNode.style.display="none";
	}
	if(status) {
			if(type == 1){
				number.value++;
			}
	} else {
		if(number.value == 1) {
			return false;
		} else {
			if(type == 1){
				number.value--;
			}
		}
	}
	
	priceBox.innerHTML = price * number.value;
	//获取总金额
	var count = document.getElementById("mes");
	if(type==1){
		if(status){
			//修改总金额
			count.innerHTML = parseFloat(count.innerHTML)+parseFloat(price);
		}else{
			count.innerHTML = parseFloat(count.innerHTML)-parseFloat(price)
		}
	}
	else if(type == 2){
		var modifyCount = number.value - pcount.value;
		count.innerHTML = parseFloat(count.innerHTML)+ modifyCount * price;
	}
	//设置本次操作的数量给标签
	pcount.value = number.value;
	
}