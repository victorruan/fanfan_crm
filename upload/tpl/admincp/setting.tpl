<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>系统配置</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
  <input type="hidden" name="a" value="savebase" />
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>系统设置<span>&gt;&gt;</span>站点设置</p></div>
  <div class="main-cont">
	<h3 class="title">站点信息设置</h3>
	<div class="set-area">
	  <div class="form web-info-form">
		<div class="form-row">
		  <label class="form-field">系统名称</label>
		  <div class="form-cont"><input name="sitename" id="sitename" class="input-txt" type="text" value="<!--{$sitename}-->" /><span id="dsitename"></span></div>
		</div>
		<div class="form-row">
		  <label class="form-field">系统地址</label>
		  <div class="form-cont"><input name="siteurl" id="siteurl" class="input-txt" type="text" value="<!--{$siteurl}-->" /><span id="dsiteurl"></span><p class="form-tips">（以“http://”开头，“/”结束）</p></div>
		</div>
	  </div>
	</div>
    
	<h3 class="title">系统LOGO设置</h3>
	<div class="set-area">
	  <div class="form web-info-form">
	    <div class="form-row">
		  <label class="form-field">LOGO图片</label>
		  <div class="form-cont">

		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="logo" id="logo" value="<!--{$logo}-->" class="input-txt" /> <span id='dlogo' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=article&uploadinput=logo&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
			
		  </div>
		</div>
		<div class="form-row">
		  <label class="form-field">LOGO大小</label>
		  <div class="form-cont">宽：<input name="logowidth" id="logowidth" type="text" size="5" value="<!--{$logowidth}-->" />px；高：<input name="logoheight" id="logoheight" type="text" size="5" value="<!--{$logoheight}-->" />px</div>
		</div>
        
		<div class="form-row">
		  <label class="form-field">LOGO预览</label>
		  <div class="form-cont">
		  <span id="previewsrc">
		  <!--{if $logo != ''}-->
		  <img src='<!--{$urlpath}--><!--{$logo}-->' />
		  <!--{/if}-->
		  </span>
		  </div>
		</div>

		<div class="btn-area"><input type="submit" name="btn_save" class="button" value="更新保存" /></div>
	  </div>
	</div>
  </div>
  </form>
</div>
<!--{/if}-->

<!--{if $a eq "web"}-->
<div class="main-wrap">
  <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
  <input type="hidden" name="a" value="saveweb" />
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>网站设置</p></div>
  <div class="main-cont">
	<h3 class="title">站点信息设置</h3>
	<div class="set-area">
	  <div class="form web-info-form">
		<div class="form-row">
		  <label class="form-field">网站名称</label>
		  <div class="form-cont"><input name="websitename" id="websitename" class="input-txt" type="text" value="<!--{$websitename}-->" /><span id="dwebsitename"></span></div>
		</div>
		<div class="form-row">
		  <label class="form-field">网站地址</label>
		  <div class="form-cont"><input name="websiteurl" id="websiteurl" class="input-txt" type="text" value="<!--{$websiteurl}-->" /><span id="dwebsiteurl"></span><p class="form-tips">（以“http://”开头，“/”结束）</p></div>
		</div>
		<div class="form-row">
		  <label class="form-field">备案号码</label>
		  <div class="form-cont"><input name="webicpcode" id="webicpcode" class="input-txt" type="text" value="<!--{$webicpcode}-->" /><span id="dwebicpcode"></span><p class="form-tips">（网站备案信息将显示在页面底部）</p></div>
		</div>
		<div class="form-row">
		  <label for="declare" class="form-field">流量统计代码</label>
		  <div class="form-cont"><textarea name="webtjcode" id="webtjcode" class="input-area area-s4 code-area" style="width:500px;height:60px;"><!--{$webtjcode}--></textarea></div>
		</div>
	  </div>
	</div>
    
	<h3 class="title">网站LOGO设置</h3>
	<div class="set-area">
	  <div class="form web-info-form">
	    <div class="form-row">
		  <label class="form-field">LOGO图片</label>
		  <div class="form-cont">

		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="weblogo" id="weblogo" value="<!--{$weblogo}-->" class="input-txt" /> <span id='dweblogo' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=article&uploadinput=weblogo&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
			
		  </div>
		</div>
		<div class="form-row">
		  <label class="form-field">LOGO大小</label>
		  <div class="form-cont">宽：<input name="logowidth" id="logowidth" type="text" size="5" value="<!--{$logowidth}-->" />px；高：<input name="logoheight" id="logoheight" type="text" size="5" value="<!--{$logoheight}-->" />px</div>
		</div>
        
		<div class="form-row">
		  <label class="form-field">LOGO预览</label>
		  <div class="form-cont">
		  <span id="previewsrc">
		  <!--{if $logo != ''}-->
		  <img src='<!--{$urlpath}--><!--{$logo}-->' />
		  <!--{/if}-->
		  </span>
		  </div>
		</div>

		<div class="btn-area"><input type="submit" name="btn_save" class="button" value="更新保存" /></div>
	  </div>
	</div>
  </div>
  </form>
</div>
<!--{/if}-->

<!--{if $a eq "footer"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>网站底部信息</p></div>
  <div class="main-cont">
	<h3 class="title">网站底部信息</h3>
    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="savefooter" />
	<table cellpadding='2' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>底部信息：</td>
		<td class='hback' width='85%'>
		  <textarea name="content" id="content" style="overflow:auto;width:98%;height:300px;display:none;"><!--{$content}--></textarea>
		  <script>var editor;KindEditor.ready(function(K) {editor = K.create('#content'); });</script>
		</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "upload"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>上传图片设置</p></div>
  <div class="main-cont">
	<h3 class="title">上传图片设置，本功能需要PHP环境支持GD库才生效
缩略图按原图比例缩小，宽高不会超过本设定，但都不能小于60px</h3>

    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="saveupload" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
	    <td class='hback_1'>PHP环境信息：</td>
		<td><font color="green">PHP环境允许最大上传：<!--{$php_upload_maxsize}-->；GD库：<!--{$gd_version}--></font></td>
	  </tr>
	  <tr>
	    <td class='hback_1'>设置最大上传：</td>
		<td><input type='text' name='uploadmaxsize' id='uploadmaxsize' value='<!--{$uploadmaxsize}-->' size="5" />M (大小不能超过PHP环境允许的最大值)</td>
	  </tr>
	  <tr>
		<td class='hback_1' width="20%">图片最大尺寸： </td>
		<td class='hback' width="80%">宽：<input type="text" name="maxthumbwidth" id="maxthumbwidth" size="5" value="<!--{$maxthumbwidth}-->" /> 像素（px）  高：<input type="text" name="maxthumbheight" id="maxthumbheight" size="5" value="<!--{$maxthumbheight}-->" /> 像素（px）<br />
	如果用户上传一些尺寸很大的数码图片，则程序会按照本设置进行缩小该图片并显示，<br />比如可以设置为 宽：1024px，高：768px，但都不能小于300px。设置为0，则不做任何处理。</td>
	  </tr>

	  <tr>
		<td class='hback_1'>文章缩略图大小： </td>
		<td class='hback'>宽：<input type="text" name="thumbwidth" id="thumbwidth" size="5" value="<!--{$thumbwidth}-->" /> 像素（px） ， 高：<input type="text" name="thumbheight" id="thumbheight" size="5" value="<!--{$thumbheight}-->" /> 像素（px）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>产品缩略图大小： </td>
		<td class='hback'>宽：<input type="text" name="productthumbwidth" id="productthumbwidth" size="5" value="<!--{$productthumbwidth}-->" /> 像素（px） ， 高：<input type="text" name="productthumbheight" id="productthumbheight" size="5" value="<!--{$productthumbheight}-->" /> 像素（px）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>图库缩略图大小： </td>
		<td class='hback'>宽：<input type="text" name="photothumbwidth" id="photothumbwidth" size="5" value="<!--{$photothumbwidth}-->" /> 像素（px） ， 高：<input type="text" name="photothumbheight" id="photothumbheight" size="5" value="<!--{$photothumbheight}-->" /> 像素（px）</td>
	  </tr>
	</table>
	<h3 class="title">图片水印设置（需要GD库支持）</h3>
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class="hback_1" width="20%">是否启用： </td>
		<td class="hback" width="80%"><input type="radio" name="watermarkflag" value="1"<!--{if $watermarkflag==1}--> checked<!--{/if}--> />是，<input type="radio" name="watermarkflag" value="0"<!--{if $watermarkflag==0}--> checked<!--{/if}--> />否</td>
	  </tr>
	  <tr>
		<td class="hback_1">水印图片地址： </td>
		<td class="hback"><input type="text" name="watermarkfile" id="watermarkfile" size="45" value="<!--{$watermarkfile}-->" /> <br />默认为tpl/static/images/watermark.png，只支持JPG/GIF/PNG格式，推荐用透明的png图片 <br /><font color="red">注意图片地址相对于网站根目录</font></td>
	  </tr>
	  <tr>
		<td class="hback_1">水印位置： </td>
		<td class="hback"><input type="radio" name="watermarkpos" value="1"<!--{if $watermarkpos==1}--> checked<!--{/if}--> />顶端居左 <input type="radio" name="watermarkpos" value="2"<!--{if $watermarkpos==2}--> checked<!--{/if}--> />顶端居右 <input type="radio" name="watermarkpos" value="3"<!--{if $watermarkpos==3}--> checked<!--{/if}--> />底端居左 <input type="radio" name="watermarkpos" value="4"<!--{if $watermarkpos==4}--> checked<!--{/if}--> />底端居右  <input type="radio" name="watermarkpos" value="0"<!--{if $watermarkpos==0}--> checked<!--{/if}--> />随机</td>
	  </tr>

	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "seo"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>首页SEO设置</p></div>
  <div class="main-cont">
	<h3 class="title">首页SEO设置</h3>
    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="saveseo" />
	<table cellpadding='2' cellspacing='1' class='tab'>
	  <tr>
		<td class="hback_none" width="15%">首页标题： </td>
		<td class="hback" width="85%">&nbsp;&nbsp;&nbsp;<input type="text" name="sitetitle" id="sitetitle" size="45" value="<!--{$sitetitle}-->" /></td>
	  </tr>
	  <tr>
		<td class='hback_none'>首页Meta描述：</td>
		<td class='hback_none'><textarea name="metadescription" id="metadescription" style="width:50%;height:80px;display:;overflow:auto;"><!--{$metadescription}--></textarea></td>
	  </tr>
	  <tr>
		<td class='hback_none'>首页Meta关键字：</td>
		<td class='hback_none'><textarea name="metakeyword" id="metakeyword" style="width:50%;height:80px;display:;overflow:auto;"><!--{$metakeyword}--></textarea><br />多个请用英文,逗号隔开。</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "safety"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统管理<span>&gt;&gt;</span>安全设置</p></div>
  <div class="main-cont">
	<h3 class="title">安全设置</h3>

    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="savesafety" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
	    <td class='hback_1' width='15%'>后台登录验证码：</td>
		<td class="hback" width='85%'><input type="radio" name="admincode" value="1"<!--{if $admincode=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='admincode' value='0'<!--{if $admincode=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>留言/评论验证码：</td>
		<td class="hback"><input type="radio" name="commentcode" value="1"<!--{if $commentcode=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='commentcode' value='0'<!--{if $commentcode=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>留言/评论审核：</td>
		<td class="hback"><input type="radio" name="commentaudit" value="1"<!--{if $commentaudit=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='commentaudit' value='0'<!--{if $commentaudit=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>注册验证码：</td>
		<td class="hback"><input type="radio" name="regcode" value="1"<!--{if $regcode=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='regcode' value='0'<!--{if $regcode=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>登录验证码：</td>
		<td class="hback"><input type="radio" name="logincode" value="1"<!--{if $logincode=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='logincode' value='0'<!--{if $logincode=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>取回密码验证码：</td>
		<td class="hback"><input type="radio" name="forgetcode" value="1"<!--{if $forgetcode=='1'}--> checked<!--{/if}--> />开启，<input type='radio' name='forgetcode' value='0'<!--{if $forgetcode=='0'}--> checked<!--{/if}--> />关闭</td>
	  </tr>
	  <tr>
	    <td class="hback_1">过滤字符：</td>
		<td class="hback"><textarea name="forbidargs" id="forbidargs" style="width:60%;height:100px;overflow:auto;"><!--{$forbidargs}--></textarea><br />多个字符请用英文,号隔开。</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->


<!--{if $a eq "mail"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：营销管理<span>&gt;&gt;</span>邮箱设置 <span>&gt;&gt;</span>邮箱设置</p></div>
  <div class="main-cont">
	<h3 class="title">邮箱设置</h3>
	<form name="myform" method="post" action="<!--{$cpfile}-->?c=setting&a=testmail" />
	<div class="search-area ">
	  <div class="item">
	  <font color="green"><b>温馨提示：</b></font>
	  发送方式设置为SMTP方式时,发信邮箱必须支持smtp并且开启smtp服务才能发送成功。
	  <br />
	  测试邮件发送：（请先设置好以下相关信息保存后再测试）&nbsp;&nbsp;
	  <input type="submit" name="btn_test" class="button" value="发送一封测试邮件" />
	  </div>
	</div>
	</form>
    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="savemail" />
	<table cellpadding='2' cellspacing='1' class='tab'>
	  <tr>
		<td class="hback_1" width="15%">邮件发送 </td>
		<td class="hback" width="85%">
		  <input type="radio" name="flag" id="flag" value="1"<!--{if $flag==1}--> checked<!--{/if}--> />开启&nbsp;&nbsp;
		  <input type="radio" name="flag" id="flag" value="0"<!--{if $flag==0}--> checked<!--{/if}--> />关闭
		</td>
	  </tr>

	  <tr>
		<td class="hback_1">SMTP服务器 </td>
		<td class="hback"><input type="text" name="smtp" id="smtp" value="<!--{$smtp}-->" class="input-txt" /> (如：smtp.163.com)</td>
	  </tr>
	  <tr>
		<td class="hback_1">SMTP端口 </td>
		<td class="hback"><input type="text" name="port" id="port" value="<!--{$port}-->" class="input-s" />  (如：25)</td>
	  </tr>
	  <tr>
		<td class="hback_1">发信人名称 </td>
		<td class="hback"><input type="text" name="sendname" id="sendname" value="<!--{$sendname}-->" class="input-txt" /></td>
	  </tr>
	  <tr>
		<td class="hback_1">发信邮箱 </td>
		<td class="hback"><input type="text" name="sendmail" id="sendmail" value="<!--{$sendmail}-->" class="input-txt" /> (如：test@163.com)</td>
	  </tr>
	  <tr>
		<td class="hback_1">发信密码 </td>
		<td class="hback"><input type="password" name="sendpassword" id="sendpassword" value="<!--{$sendpassword}-->" class="input-txt" /> (如：123456)</td>
	  </tr>
	  <tr>
		<td class="hback_1">发送方式 </td>
		<td class="hback">
		<input type="radio" name="sendtype" id="sendtype" value="0"<!--{if $sendtype==0}--> checked<!--{/if}--> />Mail方式（Linux,Unix下有效），
		<input type="radio" name="sendtype" id="sendtype" value="1"<!--{if $sendtype==1}--> checked<!--{/if}--> />SMTP方式
		</td>
	  </tr>

	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq "order"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>订单设置</p></div>
  <div class="main-cont">
	<h3 class="title">订单设置</h3>

    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="saveorder" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
	    <td class='hback_1'>商品/订单币种：</td>
		<td class="hback"><input type="text" name="currency" id="currency" class="input-s" value="<!--{$currency}-->" /> （请填写国际币种，USD,CNY,EUR,HKD等，不填写默认为CNY）</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>币种符号：</td>
		<td class="hback"><input type="text" name="symbol" id="symbol" class="input-s" value="<!--{$symbol}-->" /></td>
	  </tr>
	  <tr>
	    <td class='hback_1'>订单税率：</td>
		<td class="hback"><input type="text" name="taxrate" id="taxrate" class="input-s" value="<!--{$taxrate}-->" />%  （大于0表示顾客将承担设定的利率订单发票税金）</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>订单列表显示数：</td>
		<td class="hback"><input type="text" name="orderpagesize" id="orderpagesize" class="input-s" value="<!--{$orderpagesize}-->" /> （客户订单列表查看显示数量，请填写大于0的整数）</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq "user"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span><a href="<!--{$cpfile}-->?c=setting&a=user">客户设置</a></p></div>
  <div class="main-cont">
	<h3 class="title">客户设置</h3>
    <form name="myform" method="post" action="<!--{$cpfile}-->?c=setting" />
    <input type="hidden" name="a" value="saveuser" />
	<table cellpadding='5' cellspacing='5' class='tab'>
	  <tr>
		<td class="hback_none" width="20%">开启客户功能 </td>
		<td class="hback_none" width="80%"><input type="radio" name="usercpflag" id="usercpflag" value="1"<!--{if $usercpflag=='1'}--> checked<!--{/if}--> />开启客户功能&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="usercpflag" id="usercpflag" value="0"<!--{if $usercpflag=='0'}--> checked<!--{/if}--> />关闭客户功能 <br /><font color="#999999">（如关闭，则网站不再允许使用相关客户所有功能）</td>
	  </tr>
	  <tr>
		<td class="hback_none">客户注册状态 </td>
		<td class="hback_none"><input type="radio" name="userreg" id="userreg" value="1"<!--{if $userreg=='1'}--> checked<!--{/if}--> />开启&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="userreg" id="userreg" value="0"<!--{if $userreg=='0'}--> checked<!--{/if}--> />关闭 <br /><font color="#999999">（如关闭，则网站不再允许新客户注册）</td>
	  </tr>
	  <tr>
		<td class="hback_none">默认客户组 </td>
		<td class="hback_none"><!--{$corpgroup_select}--> <br /><font color="#999999">（新客户注册，默认所属客户组）</td>
	  </tr>
	  <tr>
		<td class="hback_none">禁止注册用户名 </td>
		<td class="hback_none">
		<textarea name="lockusers" id="lockusers" style="width:50%;height:70px;overflow:auto;"><!--{$lockusers}--></textarea>
		<br /><font color="#999999">（多个用户名请用 “,” 隔开，不区分大小写）</font></td>
	  </tr>
	  <tr>
		<td class="hback_none">客户审核类型 </td>
		<td class="hback_none"><input type="radio" name="useraudit" id="useraudit" value="1"<!--{if $useraudit=='1'}--> checked<!--{/if}--> />审核&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="useraudit" id="useraudit" value="0"<!--{if $useraudit=='0'}--> checked<!--{/if}--> />不审核 <br /><font color="#999999">（如启用审核，则客户注册需要审核后才能登录）</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="编辑保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "copyright"}-->
  <div class="main s_clear">
    <div class="content first">
      <h1>欢迎安装</h1>
      <div class="inner">
        <h2>OE软件使用协议</h2>
        <strong>版权所有 (c) 2013-2099，OEdev,保留所有权利。 <br />OEsop软件著作权号：2012SR091833</strong> <br>
        <br>
		<p>
    本协议是您（个人或单一实体）与OE团队之间关于“网站程序”“管理系统”等软件产品（以下统称“本软件”）的法律协议。<br>
 
    一旦您安装、复制或以其他方式使用本软件产品，即表示同意接受协议各项条款的约束。如果您不同意本协议，则不能获得使用本软件产品的权利。<br> <br>
 
一．软件产品保护条款 <br><br>
 
1.本软件产品由OE团队自主研发。本软件产品（包括但不限于本软件产品中所含的任何图象、数据、文字和附加程序(dll、exe等)）、随附的帮助材料、及本软件产品的任何副本的一切所有权和知识产权受中华人民共和国版权法及国际版权条约和其他知识产权法及条约的保护。用户仅获得本软件产品的使用权。
 <br>
2.用户不得进行有损OE团队权益的行为，用户不得实施如下行为（包括但不限于）： <br>
    删除本软件及其他副本上一切关于版权声明的信息； <br>
    如对本软件进行反向工程，如反汇编、反编译等；修改、破坏本软件原状；请注明本团队的信息。<br>
 
3.如果用户未遵守本协议的任何一项条款，官方有权立即终止本协议，并保留通过法律途径追究责任的权利。<br>
 
4.本程序仅用于研究及学习用途、如果需要进行商业性的销售、复制和散发，例如软件预装和捆绑，必须获得官方的书面授权和许可。<br>

5.使用本软件用户应具备本软件产品运行所需的条件，用户必须保证有权使用Linux、 Windows操作系统及Microsoft IE、火狐、google浏览器等组件等。<br>在适用法律允许的最大范围内，OE团队在任何情况下不就用户因使用或不能使用本软件产品所发生的特殊的、意外的、直接的或间接的侵权或遭致损失承担赔偿责任。即使已事先被告知该损害发生的可能性。官方不负任何法律责任。 <br>
 
6.用户须明白，使用本软件产品涉及到Internet服务，可能会受到各个环节不稳定因素的影响。因此服务存在因不可抗力、计算机病毒或黑客攻击、系统不稳定、用户所在位置、用户关机以及其他任何技术、互联网络、通信线路原因等造成的服务中断或不能满足用户要求的风险。用户须承担以上风险，本团队不作担保。<br>
 
7.本团队定义的信息内容包括：文字、软件、声音、相片、录像、图表；在广告中全部内容；本团队为用户提供的商业信息，所有这些内容受版权、商标权、和其它知识产权和所有权法律的保护。所以，用户只能在本团队和广告商授权下才能使用这些内容，而不能擅自复制、修改、编撰这些内容、或创造与内容有关的衍生产品。<br><br>
 
二．用户使用须知<br><br>
 
    特别提醒用户，使用互联网必须遵守国家有关的政策和法律，如刑法、国家安全法、保密法、计算机信息系统安全保护条例、知识产权法等，保护国家利益，保护国家安全，对于违法使用互联网络而引起的一切责任，由用户负全部责任。 <br>
 
1．用户不得使用本软件进行违反国家法律制度的行为。 <br>
 
2．本软件同大多数互联网软件一样，易受到各种安全问题的困扰，包括但不限于：<br>
    1）下载安装的其它软件中含有“特洛伊木马”等病毒，威胁到个人计算计上信息和数据的安全，继而威胁对本软件的使用。<br>
    2）浏览访问某些恶意网页时，导致电脑中毒、受损。<br>
    3）由于被下载文件提供者或网络原因，导致无法正常下载。<br>
 
3．用户应加强个人资料的保护意识，以免对个人生活造成不必要的骚扰。 <br>
 
4．盗取他人用户号码或利用网络通讯骚扰他人，均属于非法行为。用户不得采用测试、欺骗等任何非法手段，盗取其他用户号码和对他人进行骚扰。<br> 
 

5. OE团队敬请用户按照官方指定网站或指定方式下载安装本软件产品。谨防在非指定网站下载本软件，以免计算机感染能破坏用户计算机数据和获取用户隐私信息的恶意程序。<br>
 
6．OE团队重视用户的隐私保护，保证本软件产品不含有任何跟踪、监视用户计算机和或操作行为的功能代码，不会监控用户网上、网下的行为或泄漏用户隐私。<br><br>


三．特别提请用户注意，OE团队为了保障公司业务发展和调整的自主权，OE团队拥有随时修改或中断服务而不需通知用户的权利，行使修改或中断服务的权利不需对用户或任何第三方负责。用户必须在同意本条款的前提下，官方才开始对用户提供服务。 <br><br>
 
四. 郑重提醒用户注意本协议中免除OE团队责任和加重用户义务的条款，请用户仔细阅读，自主考虑风险。未成年人应在法定监护人的陪同下阅读本协议。以上各项条款内容的最终解释权及修改权归OE团队所有。<br>  <br>

五.若您对OE团队及本软件产品有任何意见，欢迎垂询官方客服中心。

          <br>
          <br>
        </p>
        <h2>附：</h2>
       OEsop 产品网站：<a href="http://www.phpcoo.com" target="_blank">http://www.phpcoo.com</a><br>
       OEsop 官方论坛：<a href="http://bbs.phpcoo.com/" target="_blank">http://bbs.phpcoo.com</a><br>
      </div>
    </div>
<!--{/if}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
