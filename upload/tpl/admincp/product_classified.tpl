<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>产品分类</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->

<!--{if $a eq "classified"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>产品分类</p></div>
  <div class="main-cont">
    <h3 class="title">
	<a href="<!--{$cpfile}-->?c=product&a=classified_add" class="btn-general"><span>添加一级外部栏目</span></a>
	
	栏目设置
	</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">ID</div></th>
		<th width="10%"><div class="th-gap">排序</div></th>
		<th><div class="th-gap">栏目名称</div></th>
		<th width="20%"><div class="th-gap">是否允许添加物品</div></th>
		<th width="20%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $product as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.catid}--></td>
		<td align="center"><!--{$volist.orders}--></td>
		<td>
		<!--{if $volist.depth==0}-->
		<b><!--{$volist.tree_node}--></b>
		<!--{else}-->
		<!--{$volist.tree_node}-->
		<!--{/if}-->
		&nbsp;&nbsp;
		</td>
		<td align="center">
		<!--{if $volist.addgoods==0}-->
			<input type="hidden" id="attr_flag<!--{$volist.catid}-->" value="flagopen" />
			<img id="flag<!--{$volist.catid}-->" src="<!--{$urlpath}-->tpl/static/images/no.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.catid}-->');" style="cursor:pointer;">
		<!--{else}-->
			<input type="hidden" id="attr_flag<!--{$volist.catid}-->" value="flagclose" />
			<img id="flag<!--{$volist.catid}-->" src="<!--{$urlpath}-->tpl/static/images/yes.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.catid}-->');" style="cursor:pointer;">	
		<!--{/if}-->
		</td>
		<td align="center">
		<!-- 添加子栏目 -->
        <!--{if $volist.depth<4}-->
        <a href="<!--{$cpfile}-->?c=product&a=add_list&rootid=<!--{$volist.catid}-->" class="icon-add">添加<!--{$volist.depth+2}-->级栏目</a>
        <!--{/if}-->
	 &nbsp;
		<!-- 修改 -->
		<!--{if $volist.rootid=='0'}-->
			<a href="<!--{$cpfile}-->?c=product&a=edit_nodelist&id=<!--{$volist.catid}-->" class="icon-set">设置</a>
			
		<!--{else}-->
			<a href="<!--{$cpfile}-->?c=product&a=edit_list&id=<!--{$volist.catid}-->" class="icon-edit">修改</a>
		<!--{/if}-->
		&nbsp;
		<!--{if $volist.system==0}-->
		<a href="<!--{$cpfile}-->?c=product&a=del&id[]=<!--{$volist.catid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
		<!--{/if}-->
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="5" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>
	<!--{if $total>1}-->
	<table width='95%' border='0' cellspacing='0' cellpadding='0' align='center' style="margin-top:10px;">
	  <tr>
		<td align='left'>共有栏目：<!--{$total}--> 个</td>
	  </tr>
	</table>
	<!--{/if}-->
  </div>
</div>
<!--{/if}-->

<!--{if $a eq "classified_add"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加一级列表栏目</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=classified" class="btn-general"><span>返回列表</span></a>添加一级列表栏目</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_add_nodelist();' />
    <input type="hidden" name="a" value="saveadd_nodelist" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1'>栏目名称：<span class='f_red'>*</span></td>
		<td class='hback'><input type="text" name="catname" id="catname" class="input-txt" /> <span class='f_red' id="dcatname"></span>
        </td>
	  </tr>
	 
	  <tr>
		<td class='hback_1'>同级排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100"  /> <span class='f_red' id="dorders"></span> (数字越小，越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>是否允许添加物品：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="addgoods" value="1" checked />是，<input type="radio" name="addgoods" value="0" />否</td>
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

<!--{if $a eq "edit_nodelist"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>编辑一级列表栏目</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=classified" class="btn-general"><span>返回列表</span></a>编辑一级列表栏目</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_edit_nodelist();' />
    <input type="hidden" name="a" value="saveedit_nodelist" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1'>栏目名称：<span class='f_red'>*</span></td>
		<td class='hback'><input type="text" name="catname" id="catname" class="input-txt" value="<!--{$product.catname}-->" /> <span class='f_red' id="dcatname"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>同级排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="<!--{$product.orders}-->"  /> <span class='f_red' id="dorders"></span> (数字越小，越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>是否允许添加物品：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="addgoods" value="1"<!--{if $product.addgoods=='1'}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" value="0"<!--{if $product.addgoods=='0'}--> checked<!--{/if}--> />锁定</td>
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



<!--{if $a eq "add_list"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加列表子栏目</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=classified" class="btn-general"><span>返回列表</span></a>添加列表子栏目</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_add_list();' />
    <input type="hidden" name="a" value="saveadd_list" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1'>上级栏目：<span class='f_red'>*</span></td>
		<td class='hback'><!--{$root_select}--> <span class='f_red' id="drootid"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>栏目名称：<span class='f_red'>*</span></td>
		<td class='hback'><input type="text" name="catname" id="catname" class="input-txt" /> <span class='f_red' id="dcatname"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>同级排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100"  /> <span class='f_red' id="dorders"></span> (数字越小，越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>是否允许添加物品：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="addgoods" value="1" checked />是，<input type="radio" name="addgoods" value="0" />否</td>
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

<!--{if $a eq "edit_list"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>修改列表子栏目</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=classified" class="btn-general"><span>返回列表</span></a>修改列表子栏目</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_edit_list();' />
    <input type="hidden" name="a" value="saveedit_list" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1'>上级栏目：<span class='f_red'>*</span></td>
		<td class='hback'><!--{$root_select}--> <span class='f_red' id="drootid"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>栏目名称：<span class='f_red'>*</span></td>
		<td class='hback'><input type="text" name="catname" id="catname" class="input-txt" value="<!--{$product.catname}-->" /> <span class='f_red' id="dcatname"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>同级排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="<!--{$product.orders}-->"  /> <span class='f_red' id="dorders"></span> (数字越小，越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>是否允许添加物品：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="addgoods" value="1"<!--{if $product.addgoods=='1'}--> checked<!--{/if}--> />正常，<input type="radio" name="addgoods" value="0"<!--{if $product.addgoods=='0'}--> checked<!--{/if}--> />锁定</td>
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
function check_add_nodelist() {
	var t = "";
	var v = "";
	
	t = "catname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("栏目名称不能为空", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
function check_edit_nodelist() {
	var t = "";
	var v = "";

	t = "catname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("栏目名称不能为空", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
//列表子栏目
function check_add_list() {
	var t = "";
	var v = "";

	t = "rootid";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择上级栏目", t);
		$("#"+t).focus();
		return false;
	}

	t = "catname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("栏目名称不能为空", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
function check_edit_list() {
	var t = "";
	var v = "";

	t = "rootid";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择上级栏目", t);
		$("#"+t).focus();
		return false;
	}

	t = "catname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("栏目名称不能为空", t);
		$("#"+t).focus();
		return false;
	}

	return true;
}

</script>
