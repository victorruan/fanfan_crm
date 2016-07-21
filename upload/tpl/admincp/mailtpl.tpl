<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>营销推广</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
 <div class="path"><p>当前位置：营销管理<span>&gt;&gt;</span>邮件模板设置</p></div>  
 <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=mailtpl&a=add" class="btn-general"><span>添加邮件模板</span></a>邮件模板设置</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
		<th width="10%"><div class="th-gap">ID</div></th>
		<th width="10%"><div class="th-gap">邮件类别</div></th>
		<th><div class="th-gap">邮件主题</div></th>
		<th width="15%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $mailtpl as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
		<td align="center"><!--{$volist.tplid}--></td>
		<td align="center"><!--{$volist.tplsort}--></td>
		<td align="left"><!--{$volist.subject}--></td>
		<td align="center">
		<a href="<!--{$cpfile}-->?c=mailtpl&a=edit&id=<!--{$volist.tplid}-->&page=<!--{$page}-->" class="icon-edit">编辑</a>&nbsp;&nbsp;

		<!--{if $volist.tplsort == 'other'}-->
		<a href="<!--{$cpfile}-->?c=mailtpl&a=del&id[]=<!--{$volist.tplid}-->" onClick="{if(confirm('确定要删除吗？')){return true;} return false;}" class="icon-del">删除</a>
		<!--{else}-->
		<font color="#999999">删除</font>
		<!--{/if}-->

		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="4" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>
	<!--{if $pagecount>1}-->
	<table width='95%' border='0' cellspacing='0' cellpadding='0' align='center' style="margin-top:10px;">
	  <tr>
		<td align='center'><!--{$showpage}--></td>
	  </tr>
	</table>
	<!--{/if}-->
  </div>
</div>
<!--{/if}-->

<!--{if $a eq "add"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：营销管理<span>&gt;&gt;</span>邮件模板设置<span>&gt;&gt;</span>添加邮件模板</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=mailtpl" class="btn-general"><span>返回列表</span></a>添加邮件模板</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=mailtpl" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='18%'>邮件主题 <span class="f_red">*</span> </td>
		<td class='hback' width='82%'><input type="text" name="subject" id="subject" class="input-txt" /> <span id='dsubject' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>邮件内容 <span class="f_red">*</span></td>
		<td class='hback'>
		  <textarea name="content" id="content" style="width:95%;height:280px;display:none;"></textarea>
		  <script>var editor;KindEditor.ready(function(K) {editor = K.create('#content'); });</script>
		  <span id='dcontent' class='f_red'></span>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>主题，内容可用标签 <span class="f_red"></span></td>
		<td class='hback'>
		 {username} 客户名称;{quotedtime}询价单时间;{ordertime}订单时间;{orderid}订单号
	</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="添加保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：营销管理<span>&gt;&gt;</span>邮件模板设置<span>&gt;&gt;</span>编辑邮件模板</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=mailtpl&page=<!--{$page}-->" class="btn-general"><span>返回列表</span></a>编辑邮件模板</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=mailtpl&page=<!--{$page}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='18%'>邮件主题 <span class="f_red">*</span> </td>
		<td class='hback' width='82%'><input type="text" name="subject" id="subject" class="input-txt" value="<!--{$mailtpl.subject}-->" /> <span id='dsubject' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>邮件类别 <span class="f_red"></span> </td>
		<td class='hback'><!--{$mailtpl.tplsort}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>邮件内容 <span class="f_red">*</span></td>
		<td class='hback'>
		  <textarea name="content" id="content" style="width:95%;height:280px;display:none;"><!--{$mailtpl.content}--></textarea>
		  <script>var editor;KindEditor.ready(function(K) {editor = K.create('#content'); });</script>
		  <span id='dcontent' class='f_red'></span>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>主题，内容可用标签 <span class="f_red"></span></td>
		<td class='hback'>
		  {username} 客户名称;{quotedtime}询价单时间;{ordertime}订单时间;{orderid}订单号
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
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script type="text/javascript">
function checkform() {
	var t = "";
	var v = "";

	t = "subject";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("邮件主题不能为空", t);
		return false;
	}

	t = "content";
	v = editor.text();
	if(editor.isEmpty()) {
		dmsg("邮件内容不能为空", t);
		editor.focus();
		return false;
	}

	return true;
}
</script>
