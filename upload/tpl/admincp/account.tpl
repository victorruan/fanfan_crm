<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>财务帐户管理</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>账户设置</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=account&a=add" class="btn-general"><span>添加帐户</span></a>帐户设置</h3>
	<form action="<!--{$cpfile}-->?c=account&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
		<th width="15%"><div class="th-gap">帐户名称</div></th>
		<th width="10%"><div class="th-gap">类型</div></th>
		<th width="10%"><div class="th-gap">初始金额</div></th>
		<th width="8%"><div class="th-gap">排序</div></th>
		<th><div class="th-gap">帐户信息</div></th>
		<th width="12%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $account as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.acid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="center"><!--{$volist.actitle}--></td>
		<td align="center">
		<!--{if $volist.actype==1}-->
		<font color='green'>银行帐户</font>
		<!--{else}-->
		<font color='blue'>现金帐户</font>
		<!--{/if}-->
		</td>
		<td align="left"><!--{$volist.acmoney}--></td>
		<td align="center"><!--{$volist.orders}--></td>
		<td align="center">
		<!--{$volist.bankname}--> <!--{$volist.account}-->
		</td>
		<td align="center">
		<a href="<!--{$cpfile}-->?c=account&a=edit&id=<!--{$volist.acid}-->&page=<!--{$page}-->" class="icon-edit">编辑</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=account&a=del&id[]=<!--{$volist.acid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="7" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="6"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>添加帐户</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=account" class="btn-general"><span>返回列表</span></a>添加帐户</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=account" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>帐户类型 <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="radio" name="actype" id='actype' value='1' checked />银行帐户， <input type="radio" name="actype" id='actype' value='2' />现金帐户 <span id='dactype' class='f_red'></span> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		初始金额：<input type="text" name="acmoney" id="acmoney" class="input-s" />  <span id='dacmoney' class='f_red'></span>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>帐户名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="actitle" id="actitle" class="input-200" />  <span id='dactitle' class='f_red'></span> 排序：<input type="text" name="orders" id="orders" class="input-s" />  <span id='dorders' class='f_red'></span> （数字越小越靠前）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 </td>
		<td class='hback'><textarea name="remark" id="remark" style="width:40%;height:70px;display:;overflow:auto;"></textarea></td>
	  </tr>
	  <tr>
		<td class='hback_green' colspan="2">银行帐户信息</td>
	  </tr>
	  <tr>
		<td class='hback_1'>银行名称 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="bankname" id="bankname" class="input-150" />  <span id='dbankname' class='f_red'></span> 银行支行：<input type="text" name="branchname" id="branchname" class="input-200" />  <span id='dbranchname' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>帐号/卡号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="account" id="account" class="input-150" />  <span id='daccount' class='f_red'></span> 开户人：<input type="text" name="acuser" id="acuser" class="input-80" />  <span id='dacuser' class='f_red'></span></td>
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
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>编辑帐户</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=account&page=<!--{$page}-->" class="btn-general"><span>返回列表</span></a>编辑帐户</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=account&page=<!--{$page}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>帐户类型 <span class="f_red">*</span> </td>
		<td class='hback' width='85%'><input type="radio" name="actype" id='actype' value='1'<!--{if $account.actype==1}--> checked<!--{/if}--> />银行帐户， <input type="radio" name="actype" id='actype' value='2' <!--{if $account.actype==2}--> checked<!--{/if}--> />现金帐户 <span id='dactype' class='f_red'></span> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		初始金额：<input type="text" name="acmoney" id="acmoney" class="input-s" value="<!--{$account.acmoney}-->" />  <span id='dacmoney' class='f_red'></span>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>帐户名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="actitle" id="actitle" class="input-200" value="<!--{$account.actitle}-->" />  <span id='dactitle' class='f_red'></span> 排序：<input type="text" name="orders" id="orders" class="input-s" value="<!--{$account.orders}-->" />  <span id='dorders' class='f_red'></span> （数字越小越靠前）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 </td>
		<td class='hback'><textarea name="remark" id="remark" style="width:40%;height:70px;display:;overflow:auto;"><!--{$account.remark}--></textarea></td>
	  </tr>
	  <tr>
		<td class='hback_green' colspan="2">银行帐户信息</td>
	  </tr>
	  <tr>
		<td class='hback_1'>银行名称 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="bankname" id="bankname" class="input-150" value="<!--{$account.bankname}-->" />  <span id='dbankname' class='f_red'></span> 银行支行：<input type="text" name="branchname" id="branchname" class="input-200" value="<!--{$account.branchname}-->" />  <span id='dbranchname' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>帐号/卡号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="account" id="account" class="input-150" value="<!--{$account.account}-->" />  <span id='daccount' class='f_red'></span> 开户人：<input type="text" name="acuser" id="acuser" class="input-80" value="<!--{$account.acuser}-->" />  <span id='dacuser' class='f_red'></span></td>
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

	t = "actitle";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("帐户名称不能为空", t);
		return false;
	}

	return true;
}
</script>
