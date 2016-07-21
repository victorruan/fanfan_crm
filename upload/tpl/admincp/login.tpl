<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
<base target="_self" />
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>帐号登录-[<!--{$config.sitename}-->]</title>
<meta name="author" content="<!--{$copyright_author}-->" />
<link href="<!--{$cppath}-->css/admin-login.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src='<!--{$urlpath}-->tpl/static/js/jquery.min.js'></script>
</head>
<body>
<div id="wrapper">
  <div id="login_wrapper">
    <form id="loginFrm" action="<!--{$cpfile}-->?c=login&a=login" method="post" onsubmit="return checkform();" defaultbutton="btnlogin">
      <div class="login-panel">
        <table border="0" cellpadding="0" cellspacing="0" style="height: 433px; width: 100%;">
          <tr>
            <td style="height: 215px;" colspan="3"></td>
          </tr>
          <tr>
            <td style="width: 130px; text-align: right; height: 40px;"><strong style="font-family: 幼圆; font-size: 16px; color: White;">登录帐号</strong></td>
            <td style="height: 30px; text-align: left;" colspan="2"><input name="username" type="text" maxlength="50" id="username"
                                style="padding: 5px; border: 0px; background-image: url(<!--{$cppath}-->images/login_txt.png);
                                width: 150px; margin-left: 40px;" />
              <span id="username_msg" style="color:#ffffff;"></span></td>
          </tr>
          <tr>
            <td style="text-align: right; height: 40px;"><strong style="font-family: 幼圆; font-size: 16px; color: White;">登录密码</strong></td>
            <td style="height: 30px; text-align: left;" colspan="2"><input name="password" id="password" type="password" maxlength="50"  style="padding: 5px;
                                border: 0px; background-image: url(<!--{$cppath}-->images/login_txt.png);
                                width: 150px; margin-left: 40px;" />
              <span id="password_msg" style="color:#ffffff;"></span></td>
          </tr>
          <tr>
            <td style="text-align: right; height: 40px;"><strong style="font-family: 幼圆; font-size: 16px; color: White;">验 证 码</strong></td>
            <td style="height: 30px; text-align: left; width: 350px;"><input name="checkcode" id="checkcode" type="text" maxlength="50" autocomplete="off"  style="padding: 5px;
                                border: 0px; background-image: url(<!--{$cppath}-->images/login_txt.png);
                                width: 80px; margin-left: 40px;" />
              <img id="checkCodeImg" style="vertical-align: middle;" src="<!--{$urlpath}-->source/include/imagecode.php?act=verifycode" /> <a href="javascript:refreshCc();">看不清楚，换一张</a> <span id="checkcode_msg" style="color:#ffffff;"></span></td>
            <td align="left"></td>
          </tr>
          <tr>
            <td style="height:96px"></td>
            <td align="right" colspan=""><input type="submit" id="btnlogin" style="background-image: url(<!--{$cppath}-->images/login.png);
                                padding: 0px; margin: 0px; width: 96px; height: 25px; border: 0px; margin-right: 60px;" value="" /></td>
            <td></td>
          </tr>
        </table>
      </div>
    </form>
  </div>
</div>
</body>
</html>
<script language="javascript" type="text/javascript">
function refreshCc() {
	var ccImg = document.getElementById("checkCodeImg");
	if (ccImg) {
		ccImg.src= ccImg.src + '&' +Math.random();
	}
}
function checkform(){
    if($("#username").val()==""){
	    $("#username_msg").html("登录帐号不能为空");
		return false;
	}
    if($("#password").val()==""){
	    $("#password_msg").html("登录密码不能为空");
		return false;
	}
    if($("#checkcode").val()==""){
	    $("#checkcode_msg").html("验证码不能为空");
		return false;
	}
	return true;
}
</script>