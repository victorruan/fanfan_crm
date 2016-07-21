<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title></title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<!--{/if}-->
</head>
<body>
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{/if}-->

<!--{if $a eq "applist"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>待开票订单</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=invoice" class="btn-general"><span>已开票订单</span></a>待开票订单</h3>

	<div class="search-area3">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=invoice&a=applist" />
	  <div class="item">
	  <label>订单号&nbsp;</label><input type="text" name="sorderid" id="sorderid" value="<!--{$sorderid}-->" class="input-100" />&nbsp;
	  <label>抬头&nbsp;</label><input type="text" name="sinvpayee" id="sinvpayee" value="<!--{$sinvpayee}-->" class="input-100" />&nbsp;
	  <label>内容&nbsp;</label><input type="text" name="sinvcontent" id="sinvcontent" value="<!--{$sinvcontent}-->" class="input-100" />&nbsp;
	  &nbsp;&nbsp;&nbsp;<input type="submit" class="button_s" value="搜索" />
      </div>
	  </form>
	</div>

    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="15%"><div class="th-gap">订单号</div></th>
		<th width="12%"><div class="th-gap">下单日期</div></th>
		<th width="12%"><div class="th-gap">订单金额</div></th>
		<th width="12%"><div class="th-gap">收款金额</div></th>
		<th width="22%"><div class="th-gap">发票抬头</div></th>
		<th width="18%"><div class="th-gap">申请时间</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $order as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="left"><!--{$volist.orderid}--></td>
		<td align="center"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="left"><!--{$volist.totalamount}--></td>
		<td align="left"><!--{$volist.payamount}--></td>
		<td align="left"><!--{$volist.taxpayee}--></td>
		<td align="center"><!--{$volist.apptime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td align="center"><a href="javascript:void(0);" onclick="tbox_openinvoice('开订单发票', '<!--{$volist.orderid}-->');" class="icon-set">开票</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="7" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>

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


<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>已开票订单</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=invoice&a=applist" class="btn-general"><span>待开票订单</span></a>已开票订单</h3>

	<div class="search-area3">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=invoice" />
	  <div class="item">
	  <label>订单号&nbsp;</label><input type="text" name="sorderid" id="sorderid" value="<!--{$sorderid}-->" class="input-s" />&nbsp;
	  <label>发票单据&nbsp;</label><input type="text" name="sinvcode" id="sinvcode" value="<!--{$sinvcode}-->" class="input-s" />&nbsp;
	  <label>抬头&nbsp;</label><input type="text" name="sinvpayee" id="sinvpayee" value="<!--{$sinvpayee}-->" class="input-s" />&nbsp;
	  <label>内容&nbsp;</label><input type="text" name="sinvcontent" id="sinvcontent" value="<!--{$sinvcontent}-->" class="input-s" />&nbsp;
      <label>开票时间&nbsp;</label><input type="text" name="sdate" id="sdate" value="<!--{$sdate}-->"  readonly onClick="WdatePicker();" class="input-s" />&nbsp;~ &nbsp;<input type="text" name="edate" id="edate" value="<!--{$edate}-->"  readonly onClick="WdatePicker();" class="input-s" />&nbsp;
	  &nbsp;&nbsp;&nbsp;<input type="submit" class="button_s" value="搜索" />
      </div>
	  </form>
	</div>

    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="15%"><div class="th-gap">订单号</div></th>
		<th width="15%"><div class="th-gap">发票单据</div></th>
		<th width="18%"><div class="th-gap">发票抬头</div></th>
		<th width="10%"><div class="th-gap">发票金额</div></th>
		<th width="10%"><div class="th-gap">税金</div></th>
		<th width="12%"><div class="th-gap">开票时间</div></th>
		<th width='10%'><div class="th-gap">开票人</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $invoice as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="left"><!--{$volist.orderid}--></td>
		<td align="left"><!--{$volist.invcode}--></td>
		<td align="left"><!--{$volist.invpayee}--></td>
		<td align="left"><!--{$volist.invmoney}--></td>
		<td align="left"><!--{$volist.taxmoney}--></td>
		<td align="center" title="<!--{$volist.billtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.billtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center"><!--{$volist.billuser}--></td>
		<td align="center">
		<a href="javascript:void(0);" onclick="tbox_viewinvoice('查看订单发票', '<!--{$volist.invid}-->');" class="icon-add">查看</a>
		</td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="8" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>

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

<!--{if $a eq "open"}-->
<div class="main-wrap">
  
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>开发票</p></div>
  <!--{/if}-->
  <div class="main-cont">
    
	<!--{if $fromtype != 'jdbox'}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=invoice&a=applist&<!--{$urlitem}-->" class="btn-general"><span>返回列表</span></a>开发票</h3>
	<!--{else}-->
	<h3 class="title">订单[<!--{$order.orderid}-->]开发票...操作</h3>
	<!--{/if}-->

    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=invoice&fromtype=<!--{$fromtype}-->" onsubmit='return checkinvoice();' />
    <input type="hidden" name="a" value="saveopen" />
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
		<td class='hback'><b><!--{$order.totalamount}--></b></td>
		<td class='hback_1'>已收金额 <span class="f_red"></span> </td>
		<td class='hback'><b><!--{$order.payamount}--></b></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票抬头 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.taxpayee}--></td>
		<td class='hback_1'>发票内容 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.taxcontent|nl2br}--></td>
	  </tr>
	  <tr>
		<td class='hback_green' colspan="4">发票明细</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票单据 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="invcode" id="invcode" class="input-150" />  <span id='dinvcode' class='f_red'></span></td>
		<td class='hback_1'>发票抬头 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="invpayee" id="invpayee" class="input-200" value="<!--{$order.taxpayee}-->" />  <span id='dinvpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票内容 <span class="f_red">*</span> </td>
		<td class='hback' colspan='3'>
		<textarea name="invcontent" id='invcontent' style="width:60%;height:60px;overflow:auto;"><!--{$order.taxcontent}--></textarea>
		<br /> <span id='dinvcontent' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>开票金额 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="invmoney" id="invmoney" class="input-80" value="<!--{$order.totalamount}-->" /> （填写数字）  <span id='dinvmoney' class='f_red'></span></td>
		<td class='hback_1'>税金 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="taxmoney" id="taxmoney" class="input-80"  /> （填写数字）  <span id='dtaxmoney' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>开票人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="billuser" id="billuser" class="input-80" />  <span id='dbilluser' class='f_red'></span></td>
		<td class='hback_1'>开票时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="billtime" id="billtime" class="input-150" value="<!--{$time|date_format:"%Y-%m-%d %H:%M:%S"}-->" />  <span id='dbilltime' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 <span class="f_red"></span> </td>
		<td class='hback' colspan='3'>
		<textarea name="remark" id='remark' style="width:60%;height:45px;overflow:auto;"></textarea>
		<br /> <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_none' colspan='4' align='center'><input type="submit" name="btn_save" class="button" value="确定开票" /></td>
	  </tr>
	  <tr>
		<td class='hback_green' colspan="4">物品明细</td>
	  </tr>
	  <tr>
	    <td colspan='4'>
		  <table border='0' cellpadding='1' cellspacing='1' class='tab'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='12%'>序号</td>
			  <td class='hback_1' align="center" width='30%'>物品名称</td>
			  <td class='hback_1' align="center" width='15%'>物品单价</td>
			  <td class='hback_1' align="center" width='15%'>物品数量</td>
			  <td class='hback_1' align="center">总额</td>
			</tr>
			<!--{foreach $itemlist as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.i}--></td>
			  <td align="center"><!--{$volist.spname}--></td>
			  <td align="center"><!--{$volist.price}--></td>
			  <td align="center"><!--{$volist.quantity}--></td>
			  <td align="center"><!--{$volist.total}--></td>
			</tr>
			<!--{/foreach}-->
			<tr>
			  <td colspan='4' align="right">物品合计：</td>
			  <td align="left"><!--{$order.goodsamount}--></td>
			</tr>
		  </table>

		</td>
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
  <div class="path"><p>当前位置：财务管理<span>&gt;&gt;</span>查看发票</p></div>
  <!--{/if}-->
  <div class="main-cont">
    
	<!--{if $fromtype != 'jdbox'}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=invoice&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>查看订单发票</h3>
	<!--{else}-->
	<h3 class="title">正在查看订单[<!--{$invoice.orderid}-->]的发票信息</h3>
	<!--{/if}-->

	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>订单编号 <span class="f_red"></span> </td>
		<td class='hback_c1' width='35%'><!--{$invoice.orderid}--></td>
		<td class='hback_1' width='15%'>下单日期 <span class="f_red"></span> </td>
		<td class='hback_c1' width='35%'><!--{$invoice.ordertime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单总金额 <span class="f_red"></span> </td>
		<td class='hback_c1'><b><!--{$invoice.totalamount}--></b></td>
		<td class='hback_1'>已收金额 <span class="f_red"></span> </td>
		<td class='hback_c1'><b><!--{$invoice.payamount}--></b></td>
	  </tr>
	  <tr>
		<td class='hback_c2' colspan="4">发票明细</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票单据 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.invcode}--></td>
		<td class='hback_1'>发票抬头 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.invpayee}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票内容 <span class="f_red"></span> </td>
		<td class='hback_c3' colspan='3'><!--{$invoice.invcontent|nl2br}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>开票金额 <span class="f_red"></span> </td>
		<td class='hback_c3'><b><!--{$invoice.invmoney}--></b> </td>
		<td class='hback_1'>税金 <span class="f_red"></span> </td>
		<td class='hback_c3'><b><!--{$invoice.taxmoney}--></b></td>
	  </tr>
	  <tr>
		<td class='hback_1'>开票人 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.billuser}--></td>
		<td class='hback_1'>开票时间 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.billtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>备注说明 <span class="f_red"></span> </td>
		<td class='hback_c3' colspan='3'><!--{$invoice.remark|nl2br}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>操作人 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.opname}--></td>
		<td class='hback_1'>操作时间 <span class="f_red"></span> </td>
		<td class='hback_c3'><!--{$invoice.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <!--{if $fromtype == 'jdbox'}-->
	  <tr>
		<td class='hback_none' colspan='4' align="center"><a href="javascript:void(0);" onclick="tbox_close();">关闭窗口</a></td>
	  </tr>
	  <!--{else}-->
	  <tr>
		<td class='hback_none' colspan='4' align="center"><a href="<!--{$cpfile}-->?c=invoice&<!--{$comeurl}-->">返回列表</a></td>
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
function checkinvoice() {
	var t = "";
	var v = "";

	t = "invcode";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发票单据不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "invpayee";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发票抬头不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "invcontent";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发票内容不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "invmoney";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("开票金额不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "taxmoney";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("税金不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "billuser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("开票人不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "billtime";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("开票时间不能为空", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}
</script>
