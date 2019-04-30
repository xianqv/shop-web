<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>IGOU CMS 系统登录</title>
  <link href="Include/Default.css" rel="stylesheet" type="text/css">
  <script src="../js/jquery-1.8.3.js"></script>
  <style>
    .input1{ border:1px solid #84A1BD; width:100px; height:20px; line-height:23px;}
    .input2{ border:1px solid #84A1BD; width:68px; height:20px; line-height:23px;}
    .button1{
      border:none;
      width:70px;
      height:27px;
      line-height:23px;
      color:#525252;
      font-size:12px;
      font-weight:bold;
      background-image: url(images/bt001.jpg);
      background-repeat: no-repeat;
      background-position: 0px 0px;
    }
    .button2{
      border:none;
      width:70px;
      height:27px;
      line-height:23px;
      color:#525252;
      font-size:12px;
      font-weight:bold;
      background-image: url(images/bt002.jpg);
      background-repeat: no-repeat;
      background-position: 0px 0px;
    }
    .STYLE3 {
      color: #FF0000;
      font-weight: bold;
    }
  </style>

  <script type="text/javascript">
    function login() {
     var pass =  document.getElementById("Password").value;
      var username = document.getElementById("UserName").value;
      if(username == ""){
        alert('用户名不能为空！');
        return false;
      }
      if( pass == ""){
        alert('密码不能为空！');
        return false;
      }else {
          $.ajax({
            type : "post",
            url : 'login.action',
            data : {
              name: username,
              pass: pass
            },
            dataType : "json",//设置需要返回的数据类型
            success: function(date) {
              if(date.flag == 0){
                alert(date.msg);
              }else {
                  window.location.reload();
              }

            }
          });
      }
    }


  </script>

</head>
<body>
<form id="fm"  method="post" style=" display:block;height:100%;">
  <table width="100%" height="100%">
    <tr>
      <td align="center" valign="middle">
        <table style=" height:283px; width:620px;margin-top: 150px; background:url(../images/loginbg_nozving.jpg) no-repeat 0px 0px;">
          <tr>
            <td>
              <div style="height:213px; width:620px;"></div>
              <div style="height:70px; width:620px;margin:0px auto 0px auto;">
                <table width="95%" border="0" align="center" cellpadding="0"
                       cellspacing="0" style="margin-top:8px;">
                  <tr>
                    <td align="center">用户名：
                      <input name="UserName" type="text" style="width:120px"
                             id="UserName" class="inputText" onfocus="this.select();"/>
                      &nbsp;密码：
                      <input name="Password" type="password" style="width:120px"
                             id="Password" class="inputText" onfocus="this.select();"/>
                      <span id='spanVerifyCode'></span>
                      <%--&nbsp;<input type="submit"  style="width: 80px" id="SubmitButton" value="登录" onclick="login()" />--%>
                      &nbsp;<img src="../images/loginbutton.jpg" name="LoginImg" align="absmiddle" id="LoginImg" style="cursor:pointer"
                                 onClick="login()" /></td>
                    </td>
                  </tr>
                  <tr>
                    <td height="23" align="center" valign="bottom">Copyright © 2007-2012 SinoSoft.com Inc. All rights reserved.</td>
                  </tr>
                </table>
              </div>
            </td>
          </tr>
        </table>
        <br>
      </td>
    </tr>
  </table>
</form>

</body>
</html>