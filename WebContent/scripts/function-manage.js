// JavaScript Document
//����Ʒ��ӵ����ﳵ
addGWC = function(id){
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
			var sp = data.split(",");
			//������Ʒ��������
			document.getElementById("Cartcount").innerHTML=sp[0];
			//���ù��ﳵ�ܼ۸�
			document.getElementById("cartSumMoney").innerHTML = sp[1];
			
		  	// ��ӹ��ﳵ�ɹ�����ʾ���js�ű�
			document.getElementById("cartDiv").style.display="block";
		}
		
	});
	
}
//�ر���ӹ��ﳵ�ɹ��Ĳ�
closeShowGWCDiv = function(){
	document.getElementById("cartDiv").style.display="none";
}


$(function(){
	 if($("#welcome").html()!=""){
		 $("#login").hide();
		 $("#reg").hide();
		 $("#exitapplication").show();
	 }else{
		 $("#login").show();
		 $("#reg").show();
		 $("#exitapplication").hide();
	 }
	 //�û��˳�
	 	$("#exitapplication").click(function(){
	 		$.ajax({
	 			url:"exit.do",
	 			type:"POST",
	 			success:function(data,status){
	 				location.href="index.jsp";
	 			}
	 		});
	 	});
});