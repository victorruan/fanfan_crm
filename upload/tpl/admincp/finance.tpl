<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>财务收支</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<!--{/if}-->
</head>
<body>
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{/if}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>财务收支</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=finance&a=add&stype=1" class="btn-general"><span>添加收入</span></a><a href="<!--{$cpfile}-->?c=finance&a=add&stype=2" class="btn-general"><span>添加支出</span></a>财务收支</h3>

	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=finance&stype=<!--{$stype}-->" />
	  <div class="item">
	    <label>所属帐户&nbsp;</label><!--{$account_select}-->&nbsp;&nbsp;&nbsp;&nbsp;
		
		<label>发生时间&nbsp;</label><input type="text" name="sdate" id="sdate" value="<!--{$sdate}-->"  readonly onClick="WdatePicker();" class="input-80" />&nbsp;~~ &nbsp;&nbsp;<input type="text" name="edate" id="edate" value="<!--{$edate}-->"  readonly onClick="WdatePicker();" class="input-80" />&nbsp;&nbsp;<br />
		<label>单据编号&nbsp;</label><input type="text" name="sserialnum" id="sserialnum" value="<!--{$sserialnum}-->" class="input-80" />&nbsp;
		<label>客户名称&nbsp;</label><input type="text" name="scustomuser" id="scustomuser" value="<!--{$scustomuser}-->" class="input-100" />&nbsp;
		<label>备注说明&nbsp;</label><input type="text" name="sremark" id="sremark" value="<!--{$sremark}-->" class="input-100" />&nbsp;
		<input type="submit" class="button_s" value="搜 索" />
	  </div>
	  </form>
	</div>

	<form action="<!--{$cpfile}-->?c=finance&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="6%"><div class="th-gap">选择</div></th>
		<th width="12%"><div class="th-gap">单据编号</div></th>
		<th width="10%"><div class="th-gap">帐户名称</div></th>
		<th width="10%"><div class="th-gap">收入</div></th>
		<th width="10%"><div class="th-gap">支出</div></th>
		<th width="10%"><div class="th-gap">余额</div></th>
		<th width="8%"><div class="th-gap">收支</div></th>
		<th width="8%"><div class="th-gap">类别</div></th>
		<th width="8%"><div class="th-gap">凭证</div></th>
		<th width="6%"><div class="th-gap">状态</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $finance as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)" title="发生时间：<!--{$volist.actiontime|date_format:"%Y-%m-%d %H:%M:%S"}-->，客户名称：<!--{$volist.customuser}-->，备注：<!--{$volist.remark}-->">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.moneyid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="left"><!--{$volist.serialnum}--></td>
		<td align="center"><!--{$volist.actitle}--></td>
		<td align="left"><font color="#0000ff"><!--{$volist.inamount}--></font></td>
		<td align="left"><font color="#ff0000"><!--{$volist.outamount}--></font></td>
		<td align="left">
		<!--{if $volist.flag==1}-->
		<font color="#008000"><!--{$volist.remamount}--></font>
		<!--{else}-->
		~~
		<!--{/if}-->
		</td>
		<td align="center"><!--{$volist.moneykind_t}--></td>
		<td align="center"><!--{$volist.moneytype_t}--></td>
		<td align="center"><!--{$volist.tokentype_t}--></td>
		<td align="center">
		<!--{if $volist.flag==1}-->
		<font color="green">正常</font>
		<!--{else}-->
		<font color="#999999">锁定</font>
		<!--{/if}-->
		</td>
		<td align="center">
		<a href="javascript:void(0);" onclick="tbox_viewfinance('查看收支明细', '<!--{$volist.moneyid}-->');">查看</a>&nbsp;<a href="<!--{$cpfile}-->?c=finance&a=edit&id=<!--{$volist.moneyid}-->&<!--{$urlitem}-->&page=<!--{$page}-->">编辑</a>&nbsp;<a href="<!--{$cpfile}-->?c=finance&a=del&id[]=<!--{$volist.moneyid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}">删除</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="11" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="10"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>财务收支<span>&gt;&gt;</span>
  
  <!--{if $paramtype=='in'}-->
  <a href="<!--{$cpfile}-->?c=finance&a=add&stype=1">添加收入</a>
  <!--{else}-->
  <a href="<!--{$cpfile}-->?c=finance&a=add&stype=2">添加支出</a>
  <!--{/if}-->
  
  </p></div>
  <div class="main-cont">
	<h3 class="title">
	<a href="<!--{$cpfile}-->?c=finance" class="btn-general"><span>返回列表</span></a>
	<!--{if $paramtype=='in'}-->
	添加收入
	<!--{else}-->
	添加支出
	<!--{/if}-->
	</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=finance" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<!--{if $paramtype == 'in'}-->
	<input type="hidden" name="balancetype" id="balancetype" value="1" />
	<!--{else}-->
	<input type="hidden" name="balancetype" id="balancetype" value="2" />
	<!--{/if}-->
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>单据编号 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><input type="text" name="serialnum" id="serialnum" class="input-150" value="<!--{$serialnum}-->" /> <span id='dserialnum' class='f_red'></span></td>
		<td class='hback_1' width='15%'>所属帐户 <span class="f_red">*</span> </td>
		<td class='hback' width='35%'><!--{$account_select}-->  <span id='dacid' class='f_red'></span> </td>
	  </tr>
	  
	  <tr>
	    <!--{if $paramtype=='in'}-->
		<td class='hback_1'>收入种类 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneykind_select}-->  <span id='dmoneykind' class='f_red'></span></td>
		<!--{else}-->
		<td class='hback_1'>支出种类 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneykind_select}-->  <span id='dmoneykind' class='f_red'></span></td>
		<!--{/if}-->
		<td class='hback_1'>款项类别 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneytype_select}-->  <span id='dmoneytype' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>凭证类别 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$tokentype_select}-->  <span id='dtokentype' class='f_red'></span></td>
		<td class='hback_1'>金额 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="amount" id="amount" class="input-80" /> <span id='damount' class='f_red'></span> （填写数字，最多2位小数。）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发生时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="actiontime" id="actiontime" class="input-150" value="<!--{$time|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='dactiontime' class='f_red'></span></td>
		<td class='hback_1'>审核状态 <span class="f_red"></span> </td>
		<td class='hback'><input type="radio" name="flag" id="flag" value='1' checked />正常，<input type="radio" name="flag" id="flag" value='0' />锁定 <span id='dflag' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>客户名称 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="customuser" id="customuser" class="input-txt" /> <span id='dcustomuser' class='f_red'></span></td>
		<td class='hback_1'>关联订单 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="relorderno" id="relorderno" class="input-150" /> <span id='drelorderno' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"></textarea> <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none' colspan="3"><input type="submit" name="btn_save" class="button" value="添加保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>财务收支<span>&gt;&gt;</span>
  <!--{if $finance.balancetype==1}-->
  编辑收入
  <!--{else}-->
  编辑支出
  <!--{/if}-->
  </p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=finance&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>
	  <!--{if $finance.balancetype==1}-->
	  编辑收入
	  <!--{else}-->
	  编辑支出
	  <!--{/if}-->
	</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=finance&<!--{$comeurl}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" id="id" value="<!--{$id}-->" />
	<input type="hidden" name="balancetype" id="balancetype" value="<!--{$finance.balancetype}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>单据编号 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><input type="text" name="serialnum" id="serialnum" class="input-150" value="<!--{$finance.serialnum}-->" /> <span id='dserialnum' class='f_red'></span></td>
		<td class='hback_1' width='15%'>所属帐户 <span class="f_red">*</span> </td>
		<td class='hback' width='35%'><!--{$account_select}-->  <span id='dacid' class='f_red'></span> </td>
	  </tr>
	  
	  <tr>
	    <!--{if $finance.balancetype==1}-->
		<td class='hback_1'>收入种类 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneykind_select}-->  <span id='dmoneykind' class='f_red'></span></td>
		<!--{else}-->
		<td class='hback_1'>支出种类 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneykind_select}-->  <span id='dmoneykind' class='f_red'></span></td>
		<!--{/if}-->
		<td class='hback_1'>款项类别 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$moneytype_select}-->  <span id='dmoneytype' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>凭证类别 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$tokentype_select}-->  <span id='dtokentype' class='f_red'></span></td>
		<td class='hback_1'>金额 <span class="f_red">*</span> </td>
		<td class='hback'>
		<!--{if $finance.balancetype==1}-->
		<input type="text" name="amount" id="amount" class="input-80" value="<!--{$finance.inamount}-->" /> 
		<!--{else}-->
		<input type="text" name="amount" id="amount" class="input-80" value="<!--{$finance.outamount}-->" /> 
		<!--{/if}-->
		
		
		<span id='damount' class='f_red'></span> （填写数字，最多2位小数。）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发生时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="actiontime" id="actiontime" class="input-150" value="<!--{$finance.actiontime|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='dactiontime' class='f_red'></span></td>
		<td class='hback_1'>审核状态 <span class="f_red"></span> </td>
		<td class='hback'><input type="radio" name="flag" id="flag" value='1'<!--{if $finance.flag==1}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" id="flag" value='0'<!--{if $finance.flag==0}--> checked<!--{/if}--> />锁定 <span id='dflag' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>客户名称 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="customuser" id="customuser" class="input-txt" value="<!--{$finance.customuser}-->" /> <span id='dcustomuser' class='f_red'></span></td>
		<td class='hback_1'>关联订单 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="relorderno" id="relorderno" class="input-150" value="<!--{$finance.relorderno}-->" /> <span id='drelorderno' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"><!--{$finance.remark}--></textarea> <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none' colspan="3"><input type="submit" name="btn_save" class="button" value="编辑保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->


<!--{if $a eq "view"}-->
<div class="main-wrap">
  
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>财务收支<span>&gt;&gt;</span>
  <!--{if $finance.balancetype==1}-->
  查看收入明细
  <!--{else}-->
  查看支出明细
  <!--{/if}-->
  </p></div>
  <!--{/if}-->
  <div class="main-cont">
	<h3 class="title">
	<!--{if $fromtype != 'jdbox'}-->
	<a href="<!--{$cpfile}-->?c=finance&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>
	<!--{/if}-->
	  <!--{if $finance.balancetype==1}-->
	  正在查看收入明细
	  <!--{else}-->
	  正在查看支出明细
	  <!--{/if}-->
	</h3>
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>单据编号 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$finance.serialnum}--></td>
		<td class='hback_1' width='15%'>所属帐户 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$finance.actitle}--> </td>
	  </tr>
	  
	  <tr>
	    <!--{if $finance.balancetype==1}-->
		<td class='hback_1'>收入种类 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.moneykind_t}--> </td>
		<!--{else}-->
		<td class='hback_1'>支出种类 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.moneykind_t}--> </td>
		<!--{/if}-->
		<td class='hback_1'>款项类别 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.moneytype_t}--> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>凭证类别 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.tokentype_t}--> </td>
		<!--{if $finance.balancetype==1}-->
		<td class='hback_1'>收入金额 <span class="f_red"></span> </td>
		<td class='hback_green'><font color="#008000"><!--{$finance.inamount}--></font></td>
		<!--{else}-->
		<td class='hback_1'>支出金额 <span class="f_red"></span> </td>
		<td class='hback_green'><font color="#ff0000"><!--{$finance.outamount}--></font></td>
		<!--{/if}-->
	  </tr>
	  <tr>
		<td class='hback_1'>发生时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.actiontime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td class='hback_1'>审核状态 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{if $finance.flag==1}--><font color="green">正常</font><!--{else}--><font color="blue">锁定</font> <!--{/if}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>客户名称 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.customuser}--></td>
		<td class='hback_1'>关联订单 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.relorderno}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 <span class="f_red"></span> </td>
		<td class='hback_green' colspan="3"><!--{$finance.remark|nl2br}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>录入人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.opname}--></td>
		<td class='hback_1'>更新时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$finance.updatetime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <!--{if $fromtype == 'jdbox'}-->
	  <tr>
		<td class='hback_none' colspan="4" align="center"><a href="javascript:void(0);" onclick="tbox_close();">关闭窗口</a></td>
	  </tr>
	  <!--{else}-->
	  <tr>
		<td class='hback_none' colspan="4" align="center"><a href="<!--{$cpfile}-->?c=finance&<!--{$comeurl}-->">关闭窗口</a></td>
	  </tr>
	  <!--{/if}-->
	</table>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->


<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
<!--{/if}-->
</body>
</html>
<script type="text/javascript">
function checkform() {
	var t = "";
	var v = "";

	t = "acid";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择所属帐户", t);
		$('#'+t).focus();
		return false;
	}

	t = "moneykind";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择收支种类", t);
		$('#'+t).focus();
		return false;
	}

	t = "moneytype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择款项类别", t);
		$('#'+t).focus();
		return false;
	}

	t = "tokentype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择凭证类别", t);
		$('#'+t).focus();
		return false;
	}

	t = "amount";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("金额不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "actiontime";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发生时间不能为空", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}
</script>
