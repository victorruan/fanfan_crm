<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>客户折扣等级</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->

<!--{if $a eq "discount"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>客户折扣等级 </p></div>
  <div class="main-cont">
    <h3 class="title">
	<a href="<!--{$cpfile}-->?c=user&a=discountadd" class="btn-general"><span>添加客户折扣等级</span></a>
	
	客户折扣等级列表
	</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">ID</div></th>
		<th width="10%"><div class="th-gap">等级</div></th>
		<th width="10%"><div class="th-gap">折扣</div></th>
        <th width="10%"><div class="th-gap">排序</div></th>
		<th width="20%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $data as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.did}--></td>
		<td align="center"><!--{$volist.class}--></td>
        <td align="center"><!--{$volist.discount}--></td>
        <td align="center"><!--{$volist.orders}--></td>
		<td align="center">
		<a href="<!--{$cpfile}-->?c=user&a=discountedit&id=<!--{$volist.did}-->" class="icon-edit">修改</a>&nbsp;
		<a href="<!--{$cpfile}-->?c=user&a=discountdel&id=<!--{$volist.did}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="5" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>
  </div>
</div>
<!--{/if}-->

<!--{if $a eq "discountadd"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>添加客户折扣等级</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=user&a=discount" class="btn-general"><span>返回列表</span></a>添加客户折扣</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=user" onsubmit='return check_add_discount();' />
    <input type="hidden" name="a" value="saveadd_discount" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1'>等级名称：</td>
		<td class='hback'><input type="text" name="class" id="class" class="input-100"  /> <span class='f_red' id="dclass"></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>折扣：</td>
		<td class='hback'><input type="text" name="discount" id="discount" class="input-100"  /> <span class='f_red' id="ddiscount"></span>(例如：0.9)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="0"  />(数字越小，越靠前)</td>
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

<!--{if $a eq "discountedit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>编辑客户折扣等级</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=user&a=discount" class="btn-general"><span>返回列表</span></a>编辑客户折扣等级</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=user" onsubmit='return check_edit_discount();' />
    <input type="hidden" name="a" value="saveedit_discount" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
      <tr>
		<td class='hback_1'>等级名称：</td>
		<td class='hback'><input type="text" name="class" id="class" class="input-100" value="<!--{$data.class}-->"  /> <span class='f_red' id="dclass"></span>(例如：0.9)</td>
	  </tr>
      <tr>
		<td class='hback_1'>折扣：</td>
		<td class='hback'><input type="text" name="discount" id="discount" class="input-100" value="<!--{$data.discount}-->"  /> <span class='f_red' id="ddiscount"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="<!--{$data.orders}-->"  />(数字越小，越靠前)</td>
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
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script type="text/javascript">
//一级列表栏目
function check_add_discount() {
	var t = "";
	var v = "";
	
	t = "class";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写等级名称", t);
		$("#"+t).focus();
		return false;
	}
	
	t = "discount";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写折扣", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
function check_edit_discount() {
	var t = "";
	var v = "";
	
	t = "class";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写等级名称", t);
		$("#"+t).focus();
		return false;
	}
	
	t = "discount";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写折扣", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
</script>
