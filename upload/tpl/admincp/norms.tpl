<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>产品规格</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>产品规格</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=norms&a=add" class="btn-general"><span>添加产品规格</span></a>产品规格列表</h3>
	<form action="<!--{$cpfile}-->?c=norms" method="post" name="myform" id="myform" style="margin:0">
	<input type="hidden" name="a" id="action" value="del" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
		<th width="10%"><div class="th-gap">规格名</div></th>
		<th width="15%"><div class="th-gap">规格别名</div></th>
		<th width="10%"><div class="th-gap">显示方式</div></th>
		<th width="18%"><div class="th-gap">备注</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $norms as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.nid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td><!--{$volist.nname}--></td>
		<td><!--{$volist.nalias}--></td>
		<td><!--{if $volist.nway eq 1}-->平铺<!--{else}-->下拉<!--{/if}--></td>
		<td align="center"><!--{$volist.nremarks}--></td>
		<td align="center"><a href="<!--{$cpfile}-->?c=norms&a=edit&id=<!--{$volist.nid}-->&page=<!--{$page}-->" class="icon-edit">编辑</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=norms&a=del&id[]=<!--{$volist.nid}-->" onClick="{if(confirm('确定要删除吗?')){return true;} return false;}" class="icon-del">删除</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="5"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定删除选定吗!?')){$('#action').val('del');$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加产品规格</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=norms" class="btn-general"><span>返回列表</span></a>添加产品规格</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=norms" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">规格名称：<span class='f_red'>*</span></td>
		<td class='hback' width="85%"><input type="text" name="nname" id="nname" class="input-150" /> <span class='f_red' id="dnname"></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>规格备注：</td>
		<td class='hback'><input type="text" name="nremarks" id="nremarks" class="input-100" /> <span class='f_red' id="dnremarks"></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>规格别名：</td>
		<td class='hback'><input type="text" name="nalias" id="nalias" class="input-100" /> <span class='f_red' id="dnalias"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>显示类型：</td>
		<td class='hback'><label><input name="ntype" type="radio" value="1" checked="checked" />文字</label><label><input name="ntype" type="radio" value="2" />图片</label></td>
	  </tr>
 	 <tr>
		<td class='hback_1'>显示方式：</td>
		<td class='hback'><label><input name="nway" type="radio" value="1" checked="checked" />平铺显示</label><label><input name="nway" type="radio" value="2" />下拉显示</label></td>
	  </tr>
      <tr><td colspan="2">
      <table border='0' cellpadding='0' cellspacing='0' class='table'>
      <input name='itemmaxsort' id='itemmaxsort' type='hidden' value='0' />
      <tr id="list-tops">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>规格值名称</td>
			  <td class='hback_1' align="center" width='15%'>规格值别名</td>
              <td class='hback_1' align="center" >规格图片</td>
			  <td class='hback_1' align="center" width='10%'>操作</td>
			</tr>
			<tr>
			  <td colspan='5' align="right"><a href="javascript:void(0);" onclick="return norms_add($(this));">添加规格值</a>
              <span id="load_itemtips"></span> &nbsp;&nbsp;</td>
			</tr>
           </table>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>编辑产品规格</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=norms&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>编辑产品规格</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=norms" onsubmit='return checkformedit();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">规格名称：<span class='f_red'>*</span></td>
		<td class='hback' width="85%"><input type="text" name="nname" id="nname" class="input-150" value="<!--{$norms.nname}-->" /> <span class='f_red' id="dnname"></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>规格备注：</td>
		<td class='hback'><input type="text" name="nremarks" id="nremarks" class="input-100" value="<!--{$norms.nremarks}-->"/> <span class='f_red' id="dnremarks"></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>规格别名：</td>
		<td class='hback'><input type="text" name="nalias" id="nalias" class="input-100" value="<!--{$norms.nalias}-->" /> <span class='f_red' id="dnalias"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>显示类型：</td>
		<td class='hback'><label><input name="ntype" type="radio" value="1" <!--{if $norms.ntype eq 1}-->checked<!--{/if}-->/>文字</label><label><input name="ntype" type="radio" value="2"  <!--{if $norms.ntype eq 2}-->checked<!--{/if}--> />图片</label></td>
	  </tr>
 	 <tr>
		<td class='hback_1'>显示方式：</td>
		<td class='hback'><label><input name="nway" type="radio" value="1"  <!--{if $norms.nway eq 1}-->checked<!--{/if}-->/>平铺显示</label><label><input name="nway" type="radio" value="2"  <!--{if $norms.nway eq 2}-->checked<!--{/if}--> />下拉显示</label></td>
	  </tr>
      <tr><td colspan="2">
      <table border='0' cellpadding='0' cellspacing='0' class='table'>
      <input name='itemmaxsort' id='itemmaxsort' type='hidden' value='<!--{$norms.num}-->' />
      <tr id="list-tops">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>规格值名称</td>
			  <td class='hback_1' align="center" width='15%'>规格值别名</td>
              <td class='hback_1' align="center" >规格图片</td>
			  <td class='hback_1' align="center" width='10%'>操作</td>
			</tr>
   <!--{if !empty($norms.nvalue)}-->
	  <!--{foreach $norms.nvalue as $key=>$val}-->
<tr class='itemlists' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td class='hback' align='center'> 规格<!--{$key+1}--> 
<td class='hback' align='center'>
<input type='text' name='sitem_nname_<!--{$key+1}-->' id='sitem_nname_<!--{$key+1}-->' class='input-s' value='<!--{$val.normsnname}-->' /></td>
<td class='hback' align='center'><input type='text' name='sitem_nalias_<!--{$key+1}-->' id='sitem_nalias_<!--{$key+1}-->' class='input-s' value='<!--{$val.normsnalias}-->' /></td>
<td>
图片地址：<input name='imgurl_<!--{$key+1}-->' id='imgurl_<!--{$key+1}-->' type='hidden' class='input-200' value='<!--{$val.imgurl}-->' />
<span id='imgpreview_<!--{$key+1}-->'><!--{if $val.imgthumb}--><img src="<!--{$urlpath}--><!--{$val.imgthumb}-->" width="60px" height="60px" /><!--{/if}--></span>
<input type='hidden' name='imgthumb_<!--{$key+1}-->' id='imgthumb_<!--{$key+1}-->' value='<!--{$val.imgthumb}-->' />
<iframe id='iframe_t_<!--{$key+1}-->' border='0' frameborder='0' scrolling='no' style='width:260px;height:25px;padding:0px;margin:0px;' src='<!--{$cpfile}-->?c=upload&module=product&formname=myform&uploadinput=imgurl_<!--{$key+1}-->&thumbinput=imgthumb_<!--{$key+1}-->&multipart=sf_upload_<!--{$key+1}-->&previewid=imgpreview_<!--{$key+1}-->'></iframe>
</td>
<td>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del_norms($(this), <!--{$key+1}-->);'>移除</a></td>
</tr>
	  <!--{/foreach}-->
	  <!--{/if}-->

			<tr>
			  <td colspan='5' align="right"><a href="javascript:void(0);" onclick="return norms_add($(this));">添加规格值</a>
              <span id="load_itemtips"></span> &nbsp;&nbsp;</td>
			</tr>
           </table>
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
	
	t = "nname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("规格名称不能为空", t);
		$('#'+t).focus();
		return false;
	}
	return true;
}

function checkformedit() {
	var t = "";
	var v = "";
	
	t = "nname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("规格名称不能为空", t);
		$('#'+t).focus();
		return false;
	}
	return true;
}
</script>
