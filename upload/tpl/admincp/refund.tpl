<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>退款单据</title>
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
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span><a href="<!--{$cpfile}-->?c=refund">退款单据</a></p></div>
  <div class="main-cont">
    <h3 class="title">收款单据</h3>
	<form action="<!--{$cpfile}-->?c=refund&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
		<th width="15%"><div class="th-gap">退款单号</div></th>
		<th width="10%"><div class="th-gap">退款金额</div></th>
		<th width="8%"><div class="th-gap">币种</div></th>
		<th width="10%"><div class="th-gap">所属会员</div></th>
		<th width="15%"><div class="th-gap">订单号</div></th>
		<th width="10%"><div class="th-gap">退款方式</div></th>
		<th width="10%"><div class="th-gap">退款状态</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $refund as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.refid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="left"><!--{$volist.refid}--></td>
		<td align="left"><!--{$volist.amount}--></td>
		<td align="center"><!--{$volist.currency}--></td>
		<td align="center"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.orderid}--></td>
		<td align="center">
		<!--{if $volist.reftype=='online'}-->
		线上支付
		<!--{elseif $volist.reftype=='offline'}-->
		线下支付
		<!--{elseif $volist.reftype=='deposit'}-->
		帐号退款
		<!--{/if}-->
		</td>
		<td align="center">
		<!--{if $volist.refstatus==0}-->
		<font color="#999999">待处理</font>
		<!--{elseif $volist.refstatus==10}-->
		<font color="green">退款成功</font>
		<!--{elseif $volist.refstatus==11}-->
		<font color="red">退款失败</font>
		<!--{/if}-->
		</td>
		<td align="center">
		<a href="javascript:void(0);" class="icon-set" onclick="tbox_viewrefund('查看退款单据', '<!--{$volist.refid}-->');">查看</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=refund&a=del&id[]=<!--{$volist.refid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="9" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="8"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
   
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>添加退款单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
	<h3 class="title">订单[<!--{$order.orderid}-->]退款...操作</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=refund&fromtype=<!--{$fromtype}-->" onsubmit='return checkadd();' />
    <input type="hidden" name="a" value="saveadd" />
	<input type="hidden" name="orderid" id="orderid" value="<!--{$order.orderid}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>订单编号 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$order.orderid}--></td>
		<td class='hback_1' width='15%'>下单日期 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$order.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单总金额 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.totalamount}--></td>
		<td class='hback_1'>已收金额 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.payamount}--> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款银行 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="bankname" id="bankname" class="input-100" /> <span id='dbankname' class='f_red'></span></td>
		<td class='hback_1'>退款帐号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="account" id="account" class="input-150" /> <span id='daccount' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款金额 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="amount" id="amount" class="input-60" value="<!--{$order.payamount}-->" /> <span id='damount' class='f_red'></span> (不能超出未退金额)</td>
		<td class='hback_1'>币种 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="currency" id="currency" class="input-60" value="CNY" /> <span id='dcurrency' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款人 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="refuser" id="refuser" class="input-60" /> <span id='drefuser' class='f_red'></span></td>
		<td class='hback_1'>退款时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="reftime" id="reftime" class="input-150" value="<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='dreftime' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>所属会员 <span class="f_red"></span> </td>
		<td class='hback'>
		<!--{if $order.cpid==0}-->
		~~
		<!--{else}-->
		<!--{$order.cpname}-->
		<!--{/if}--></td>
		<td class='hback_1'>退款方式 <span class="f_red">*</span> </td>
		<td class='hback'>
		 <select name="reftype" id="reftype">
		 <option value="">请选择</option>
		 <option value="online">线上支付</option>
		 <option value="offline">线下支付</option>
<!--		 <option value="deposit">帐号退款</option>
-->		 </select>
		 <span id='dreftype' class='f_red'></span>
		 <!--<br />
		 (如果选择“帐号退款”，必须非匿名会员订单，退款金额返回到会员帐号！)-->
		 </td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="memo" id="memo" style="width:50%;height:50px;overflow:auto;"></textarea> <span id='dmemo' class='f_red'></span></td>
	  </tr>
      <tr>
      	<td><input name="notice"  checked="checked" type="checkbox" value="1" />是否通知客户</td>
      </tr>
	  <tr>
		<td class='hback_none' colspan='4' align="center"><input type="submit" name="btn_save" class="button" value=" 提 交 " /></td>
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
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>查看退款单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
    
	<!--{if $fromtype=='jdbox'}-->
	<h3 class="title">正在查看退款单据[<!--{$refund.refid}-->]</h3>
	<!--{else}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=refund&page=<!--{$page}-->" class="btn-general"><span>返回列表</span></a>查看退款单据</h3>
	<!--{/if}-->

	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>退款单号 <span class="f_red"></span> </td>
		<td class='hback_yellow' width='35%'><!--{$refund.refid}--> 
		<!--{if $refund.refstatus==0}-->
		<font color="#999999">待处理</font>
		<!--{elseif $refund.refstatus==10}-->
		<font color="green">退款成功</font>
		<!--{elseif $refund.refstatus==11}-->
		<font color="red">退款失败</font>
		<!--{/if}-->
		</td>
		<td class='hback_1' width='15%'>所属订单号 <span class="f_red"></span> </td>
		<td class='hback_yellow' width='35%'><!--{$refund.orderid}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款方式 <span class="f_red"></span> </td>
		<td class='hback_yellow'>
		<!--{if $refund.reftype=='online'}-->
		线上支付
		<!--{elseif $refund.reftype=='offline'}-->
		线下支付
		<!--{elseif $refund.reftype=='deposit'}-->
		帐号退款
		<!--{/if}-->
		</td>
		<td class='hback_1'>退款金额 <span class="f_red"></span> </td>
		<td class='hback_yellow'><b><!--{$refund.amount}--></b> <!--{$refund.currency}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>生成时间 <span class="f_red"></span> </td>
		<td class='hback_yellow'><!--{$refund.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td class='hback_1'>退款时间 <span class="f_red"></span> </td>
		<td class='hback_yellow'><!--{$refund.reftime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款帐号 <span class="f_red"></span> </td>
		<td class='hback_yellow'><!--{$refund.account}--></td>
		<td class='hback_1'>退款银行 <span class="f_red"></span> </td>
		<td class='hback_yellow'><!--{$refund.bankname}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退款人 <span class="f_red"></span> </td>
		<td class='hback_yellow'><!--{$refund.refuser}--></td>
		<td class='hback_1'>操作人 <span class="f_red"></span> </td>
		<td class='hback_yellow'>
		<!--{if $refund.opid==0}-->
		会员自己
		<!--{else}-->
		<!--{$refund.opname}-->
		<!--{/if}-->
		
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>单据备注 <span class="f_red"></span> </td>
		<td class='hback_yellow' colspan='3'><!--{$refund.memo}--></td>
	  </tr>
	  <!--{if $fromtype == 'jdbox'}-->
	  <tr>
		<td class='hback_none' colspan='4' align="center"><a href="javascript:void(0);" onclick="tbox_close();">关闭窗口</a></td>
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
function checkadd() {
	var t = "";
	var v = "";

	t = "amount";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退款金额不能为空", t);
		return false;
	}

	t = "reftime";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退款时间不能为空", t);
		return false;
	}

	t = "reftype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择退款方式", t);
		return false;
	}

	return true;
}
</script>
