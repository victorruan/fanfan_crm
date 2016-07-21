<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>产品品牌</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->

<!--{if $a eq "brand"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>栏目设置</p></div>
  <div class="main-cont">
    <h3 class="title">
	<a href="<!--{$cpfile}-->?c=product&a=brandadd" class="btn-general"><span>添加品牌</span></a>
	
	栏目设置
	</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">ID</div></th>
		<th width="10%"><div class="th-gap">排序</div></th>
		<th><div class="th-gap">品牌名称</div></th>
        <th width="10%"><div class="th-gap">缩略图</div></th>
		<th width="20%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $data as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.brandid}--></td>
		<td align="center"><!--{$volist.orders}--></td>
        <td align="center"><!--{$volist.brandname}--></td>
         <td align="left"><!--{if $volist.thumbfiles}--><img src="<!--{$volist.thumbfiles}-->" width="50" height="50"/><!--{else}-->暂无缩略图<!--{/if}--></td>
		<td align="center">
		<a href="<!--{$cpfile}-->?c=product&a=brandedit&id=<!--{$volist.brandid}-->" class="icon-edit">修改</a>&nbsp;
		<a href="<!--{$cpfile}-->?c=product&a=del_brand&id[]=<!--{$volist.brandid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
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

<!--{if $a eq "brandadd"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加品牌页面</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=brand" class="btn-general"><span>返回列表</span></a>品牌列表</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_add_brand();' />
    <input type="hidden" name="a" value="saveadd_brand" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <!--<tr>
		<td class='hback_1'>所属栏目：</td>
		<td class='hback'><!--{$category_select}--><span class='f_red' id="dcatid"></span></td>
	  </tr>-->
	 
	  <tr>
		<td class='hback_1'>品牌名称：</td>
		<td class='hback'><input type="text" name="brandname" id="brandname" class="input-100"  /> <span class='f_red' id="dbrandname"></span></td>
	  </tr>
      
      <tr>
		<td class='hback_1'>图片地址 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="uploadfiles" id="uploadfiles" class="input-txt"  /> <span id='duploadfiles' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=uploadfiles&thumbinput=thumbfiles&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
	    </td>
	  </tr>
	  <tr>
		<td class='hback_1'>缩略图 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="thumbfiles" id="thumbfiles" class="input-txt" /> (自动生成) <span id='dthumbfiles' class='f_red'></span> </td>
			  <td><span id="previewsrc"></span></td>
			</tr>
		  </table>
		</td>
	  </tr>
      
      
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100"  />(数字越小，越靠前)</td>
	  </tr>
      <!-- <tr>
		<td class='hback_1'>最低折扣：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="discount" id="discount" class="input-100"  /></td>
	  </tr>-->
       <tr>
		<td class='hback_1'>品牌介绍：<span class='f_red'></span></td>
		<td class='hback'><textarea  rows="5" name="intro" id="intro"></textarea></td>
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

<!--{if $a eq "brandedit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>编辑品牌</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=product&a=brand" class="btn-general"><span>返回列表</span></a>编辑品牌</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return check_edit_brand();' />
    <input type="hidden" name="a" value="saveedit_brand" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	<!-- <tr>
		<td class='hback_1'>所属栏目：</td>
		<td class='hback'><!--{$category_select}--><span class='f_red' id="dcatid"></span></td>
	  </tr>-->
	 
	  <tr>
		<td class='hback_1'>品牌名称：</td>
		<td class='hback'><input type="text" name="brandname" id="brandname" class="input-100" value="<!--{$data.brandname}-->" /> <span class='f_red' id="dbrandname"></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>图片地址 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="uploadfiles" id="uploadfiles" class="input-txt"  /> <span id='duploadfiles' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=uploadfiles&thumbinput=thumbfiles&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
	    </td>
	  </tr>
	  <tr>
		<td class='hback_1'>缩略图 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="thumbfiles" id="thumbfiles" class="input-txt" value="<!--{$data.thumbfiles}-->" /> (自动生成) <span id='dthumbfiles' class='f_red'></span> </td>
			  <td><span id="previewsrc"></span></td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="<!--{$data.orders}-->"  />(数字越小，越靠前)</td>
	  </tr>
      <!-- <tr>
		<td class='hback_1'>最低折扣：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="discount" id="discount" class="input-100" value="<!--{$data.discount}-->"  /></td>
	  </tr>-->
       <tr>
		<td class='hback_1'>品牌介绍：<span class='f_red'></span></td>
		<td class='hback'><textarea  rows="5" name="intro" id="intro"><!--{$data.intro}--></textarea></td>
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
function check_add_brand() {
	var t = "";
	var v = "";
	
	
	t = "brandname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("品牌名称不能为空", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
function check_edit_brand() {
	var t = "";
	var v = "";
	
	
	t = "brandname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("品牌名称不能为空", t);
		$("#"+t).focus();
		return false;
	}
	return true;
}
</script>
