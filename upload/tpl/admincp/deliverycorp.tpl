<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>物流公司</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>物流公司</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=deliverycorp&a=add" class="btn-general"><span>添加配送方式</span></a>配送方式</h3>
	<form action="<!--{$cpfile}-->?c=deliverycorp&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">选择</div></th>
		<th width="25%"><div class="th-gap">物流公司名称</div></th>
		<th width="30%"><div class="th-gap">网址</div></th>
		<th width="10%"><div class="th-gap">排序</div></th>
		<th width="10%"><div class="th-gap">状态</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $deliverycorp as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.corpid}-->" onClick="checkItem(this, 'chkAll')"> <!--{$volist.corpid}--></td>
		<td align="left"><!--{$volist.corpname}--></td>
		<td align="left"><!--{$volist.website}--></td>
		<td align="center"><!--{$volist.orders}--></td>
		<td align="center">
		<!--{if $volist.flag==0}-->
			<input type="hidden" id="attr_flag<!--{$volist.corpid}-->" value="flagopen" />
			<img id="flag<!--{$volist.corpid}-->" src="<!--{$urlpath}-->tpl/static/images/no.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.corpid}-->');" style="cursor:pointer;">
		<!--{else}-->
			<input type="hidden" id="attr_flag<!--{$volist.corpid}-->" value="flagclose" />
			<img id="flag<!--{$volist.corpid}-->" src="<!--{$urlpath}-->tpl/static/images/yes.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.corpid}-->');" style="cursor:pointer;">	
		<!--{/if}-->
		</td>
		<td align="center">
		<a href="<!--{$cpfile}-->?c=deliverycorp&a=edit&id=<!--{$volist.corpid}-->&page=<!--{$page}-->" class="icon-edit">编辑</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=deliverycorp&a=del&id[]=<!--{$volist.corpid}-->" onClick="{if(confirm('确定要删除吗？')){return true;} return false;}" class="icon-del">删除</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="5"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定删除选定信息吗!?')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
	  </tr>
	  <!--{/if}-->
	</table>
	</form>
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
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>添加物流公司</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=deliverycorp" class="btn-general"><span>返回列表</span></a>添加物流公司</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=deliverycorp" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>公司名称 <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="text" name="corpname" id="corpname" class="input-200" /> <span id='dcorpname' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>公司网址 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="website" id="website" class="input-txt" />  <span id='dwebsite' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-s" />  <span id='dorders' class='f_red'></span> （数字越小越靠前）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>状态 <span class="f_red"></span> </td>
		<td class='hback'><input type="radio" name="flag" id="flag" value="1" checked />正常，<input type="radio" name="flag" id="flag" value="0" />锁定</td>
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
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>编辑物流公司</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=deliverycorp&page=<!--{$page}-->" class="btn-general"><span>返回列表</span></a>编辑物流公司</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=deliverycorp&page=<!--{$page}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>公司名称 <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="text" name="corpname" id="corpname" class="input-200" value="<!--{$deliverycorp.corpname}-->" /> <span id='dcorpname' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>公司网址 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="website" id="website" class="input-txt" value="<!--{$deliverycorp.website}-->" />  <span id='dwebsite' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-s" value="<!--{$deliverycorp.orders}-->" />  <span id='dorders' class='f_red'></span> （数字越小越靠前）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>状态 <span class="f_red"></span> </td>
		<td class='hback'><input type="radio" name="flag" id="flag" value="1"<!--{if $deliverycorp.flag==1}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" id="flag" value="0"<!--{if $deliverycorp.flag==0}--> checked<!--{/if}--> />锁定</td>
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

	t = "corpname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("公司名称不能为空", t);
		return false;
	}

	return true;
}
</script>
