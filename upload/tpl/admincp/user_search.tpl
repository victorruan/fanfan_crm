<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>查询会员</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
</head>
<body>
<!--{if $a eq "search"}-->
<div class="main-wrap">
  <div class="main-cont">
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=user&a=search&inputid=<!--{$inputid}-->&tipid=<!--{$tipid}-->" />
	  <div class="item">
	    <label>类型：</label><!--{$type_select}-->&nbsp;&nbsp;
		<label>客户名称：</label><input type="text" id="scpname" name="scpname" class="input-80" value="<!--{$scpname}-->" />&nbsp;
		<label>邮箱：</label><input type="text" id="semail" name="semail" class="input-80" value="<!--{$semail}-->" />&nbsp;
		<label>手机：</label><input type="text" id="smobile" name="smobile" class="input-80" value="<!--{$smobile}-->" />&nbsp;
		<input type="submit" class="button_s" value="搜 索" />
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=user&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="12%"><div class="th-gap">客户ID</div></th>
		<th width="18%"><div class="th-gap">客户名称</div></th>
		<th width="25%"><div class="th-gap">邮箱</div></th>
		<th width="18%"><div class="th-gap">手机</div></th>
		<th width="15%"><div class="th-gap">类型</div></th>
		<th><div class="th-gap">选择</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $corp as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.cpid}--></td>
		<td align="left"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.email}--></td>
		<td align="left"><!--{$volist.mobile}--></td>
		<td align="center"><!--{if $volist.type eq 1}-->企业<!--{else}-->个人<!--{/if}--></td>
		<td align="center"><a href="javascript:void(0);" onclick="select_user('<!--{$inputid}-->', '<!--{$tipid}-->', '<!--{$volist.cpid}-->', '<!--{$volist.cpname}-->')">选择</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
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
</body>
</html>
<script type="text/javascript">
function select_user(inputid, tipid, userid, username){
    window.parent.$("#"+inputid).val(username);
	if(tipid!='') {
		window.parent.$('#'+tipid).html(userid);
	}
	window.parent.tb_remove();
}
</script>