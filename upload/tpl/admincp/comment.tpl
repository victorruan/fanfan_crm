<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>评论管理</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>产品评论</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=comment&a=add" class="btn-general"><span>添加评论</span></a>产品评论</h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=comment" />
	  <div class="item">
		<label>产品名称：</label><input type="text" id="stitle" name="stitle" class="input-150" value="<!--{$stitle}-->" />&nbsp;&nbsp;&nbsp;
		<label>评论内容：</label><input type="text" id="scontent" name="scontent" class="input-150" value="<!--{$scontent}-->" />&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=comment&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">选择</div></th>
		<th width="28%"><div class="th-gap">产品名称</div></th>
		<th width="12%"><div class="th-gap">评论人</div></th>
		<th width="17%"><div class="th-gap">评论时间</div></th>
		<th width="12%"><div class="th-gap">IP</div></th>
		<th width="8%"><div class="th-gap">审核</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $comment as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.comid}-->" onClick="checkItem(this, 'chkAll')"><!--{$volist.comid}--></td>
		<td align="left">
		<!--{$volist.gdname}-->
		</td>
		<td align="left"><!--{$volist.comuser}--></td>
		<td align="center" title="<!--{$volist.addtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.addtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td align="center"><!--{$volist.ip}--></td>
		<td align="center">
		<!--{if $volist.flag==0}-->
			<input type="hidden" id="attr_flag<!--{$volist.comid}-->" value="flagopen" />
			<img id="flag<!--{$volist.comid}-->" src="<!--{$urlpath}-->tpl/static/images/no.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.comid}-->');" style="cursor:pointer;">
		<!--{else}-->
			<input type="hidden" id="attr_flag<!--{$volist.comid}-->" value="flagclose" />
			<img id="flag<!--{$volist.comid}-->" src="<!--{$urlpath}-->tpl/static/images/yes.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.comid}-->');" style="cursor:pointer;">	
		<!--{/if}-->
        </td>
		<td align="center"><a href="<!--{$cpfile}-->?c=comment&a=edit&id=<!--{$volist.comid}-->&page=<!--{$page}-->&<!--{$urlitem}-->" class="icon-edit">编辑</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=comment&a=del&id[]=<!--{$volist.comid}-->" onClick="{if(confirm('确定要删除吗？')){return true;} return false;}" class="icon-del">删除</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="7" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="6"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加评论</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=comment" class="btn-general"><span>返回列表</span></a>添加评论</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=comment" onsubmit='return checkform();' />
	<input type='hidden' name='a' id='a' value='saveadd' />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>产品ID <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="text" name="goodsid" id="goodsid" class="input-80"  /> <span id='dgoodsid' class='f_red'></span> 产品ID</td>
	  </tr>
	  <tr>
		<td class='hback_1'>评论人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="comuser" id="comuser" class="input-80"  /> <span id='dcomuser' class='f_red'></span> 评论人长度不能大于50个任意字符</td>
	  </tr>
	  <tr>
		<td class='hback_1'>评论内容 <span class="f_red">*</span> </td>
		<td class='hback'><textarea name="content" id="content" style="width:50%;height:90px;overflow:auto;"></textarea>  <br /><span id='dcontent' class='f_red'></span> 评论内容长度不能大于2000个任意字符</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>审核状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1" checked />通过，<input type="radio" name="flag" id="flag" value="0" />锁定</td>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>编辑评论</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=comment&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>编辑评论</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=comment&<!--{$comeurl}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>关联内容ID <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="text" name="goodsid" id="goodsid" class="input-80" value="<!--{$comment.goodsid}-->" /> <span id='dgoodsid' class='f_red'></span> 产品ID</td>
	  </tr>
	  <tr>
		<td class='hback_1'>评论人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="comuser" id="comuser" class="input-80" value="<!--{$comment.comuser}-->" /> <span id='dcomuser' class='f_red'></span> 评论人长度不能大于50个任意字符</td>
	  </tr>
	  <tr>
		<td class='hback_1'>评论内容 <span class="f_red">*</span> </td>
		<td class='hback'><textarea name="content" id="content" style="width:50%;height:90px;overflow:auto;"><!--{$comment.content}--></textarea>  <br /><span id='dcontent' class='f_red'></span> 评论内容长度不能大于2000个任意字符</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>审核状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1"<!--{if $comment.flag=='1'}--> checked<!--{/if}--> />通过，<input type="radio" name="flag" id="flag" value="0"<!--{if $comment.flag=='0'}--> checked<!--{/if}--> />锁定</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>评论时间 <span class='f_red'></span></td>
		<td><!--{$comment.addtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
	    <td class='hback_1'>IP <span class='f_red'></span></td>
		<td><!--{$comment.ip}--></td>
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

	t = "goodsid";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("产品ID不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "comuser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("评论人不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "content";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("评论内容不能为空", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}

</script>