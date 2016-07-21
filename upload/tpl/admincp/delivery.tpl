<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>
<!--{if $stype == 'delivery'}-->
发货单据
<!--{else}-->
退货单据
<!--{/if}-->
</title>
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
  
  <!-- 发货单 -->
  <!--{if $stype == 'delivery'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span><a href="<!--{$cpfile}-->?c=delivery&stype=delivery">发货单据</a></p></div>
  <div class="main-cont">
    <h3 class="title">发货单据</h3>
	<form action="<!--{$cpfile}-->?c=delivery&stype=delivery&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="6%"><div class="th-gap">选择</div></th>
		<th width="13%"><div class="th-gap">发货单号</div></th>
		<th width="13%"><div class="th-gap">订单号</div></th>
		<th width="11%"><div class="th-gap">创建时间</div></th>
		<th width="10%"><div class="th-gap">所属会员</div></th>
		<th width="10%"><div class="th-gap">收货人</div></th>
		<th width="10%"><div class="th-gap">物流公司</div></th>
		<th width="15%"><div class="th-gap">物流单号</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $delivery as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.dealid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="left"><!--{$volist.dealid}--></td>
		<td align="left"><!--{$volist.orderid}--></td>
		<td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.shipuser}--></td>
		<td align="left"><!--{$volist.loginame}--></td>
		<td align="left"><!--{$volist.logino}--></td>
		<td align="center">
		<a href="javascript:void(0);" class="icon-set" onclick="tbox_viewdelivery('查看收货单据', '<!--{$volist.dealid}-->');">查看</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=delivery&a=del&id[]=<!--{$volist.dealid}-->&stype=delivery" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
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
  
  <!-- 退货单据 -->
  <!--{else}-->

  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span><a href="<!--{$cpfile}-->?c=delivery&stype=return">退货单据</a></p></div>
  <div class="main-cont">
    <h3 class="title">退货单据</h3>
	<form action="<!--{$cpfile}-->?c=delivery&stype=return&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="6%"><div class="th-gap">选择</div></th>
		<th width="13%"><div class="th-gap">退货单号</div></th>
		<th width="13%"><div class="th-gap">订单号</div></th>
		<th width="11%"><div class="th-gap">创建时间</div></th>
		<th width="10%"><div class="th-gap">所属会员</div></th>
		<th width="10%"><div class="th-gap">退货人</div></th>
		<th width="10%"><div class="th-gap">物流公司</div></th>
		<th width="15%"><div class="th-gap">物流单号</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $delivery as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.dealid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="left"><!--{$volist.dealid}--></td>
		<td align="left"><!--{$volist.orderid}--></td>
		<td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.shipuser}--></td>
		<td align="left"><!--{$volist.loginame}--></td>
		<td align="left"><!--{$volist.logino}--></td>
		<td align="center">
		<a href="javascript:void(0);" class="icon-set" onclick="tbox_viewreturn('查看退货单据', '<!--{$volist.dealid}-->');">查看</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=delivery&a=del&id[]=<!--{$volist.dealid}-->&stype=return" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}" class="icon-del">删除</a>
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

  <!--{/if}-->


</div>
<!--{/if}-->

<!--{if $a eq "delivery"}-->
<div class="main-wrap">
   
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>添加发货单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
	<h3 class="title">订单[<!--{$order.orderid}-->]发货...操作</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=delivery&fromtype=<!--{$fromtype}-->&stype=delivery" onsubmit='return checkdelivery();' />
    <input type="hidden" name="a" value="savedelivery" />
	<input type="hidden" name="orderid" id="orderid" value="<!--{$order.orderid}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>订单编号 <span class="f_red"></span> </td>
		<td class='hback' width='35%'>
		<!--{$order.orderid}-->
		&nbsp;<font color="orange">[会员：<!--{if $order.cpid==0}-->~~<!--{else}--><!--{$order.cpname}--><!--{/if}-->]</font>
		</td>
		<td class='hback_1' width='15%'>下单日期 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$order.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单配送方式 <span class="f_red"></span> </td>
		<td class='hback'>
		<!--{$order.shipname}-->

		&nbsp;
		<!--{if $order.shipstatus==0}-->
		<font color="#999999">未发货</font>
		<!--{elseif $order.shipstatus==1}-->
		<font color="#ff8000">部分发货</font>
		<!--{elseif $order.shipstatus==2}-->
		<font color="#008000">全部发货</font>
		<!--{elseif $order.shipstatus==3}-->
		<font color="#008080">部分退货</font>
		<!--{elseif $order.shipstatus==4}-->
		<font color="#ff0000">全部退货</font>
		<!--{/if}-->
		
		</td>
		<td class='hback_1'>订单配送费用 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.shipamount}--></td>
	  </tr>
	  <tr>
      
		<td class='hback_1'>物流公司 <span class="f_red">*</span> </td>
		<td class='hback'>
        <style>
                #suggestions{ position: relative; left:2px; top:-0px; width:300px; display:none;}
                #searchdeliverycorp { border-width:1px; border-color:#919191; border-style:solid; width:300px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
                #searchdeliverycorp span.searchdata { display:block; font-weight:bold; padding-top:5px; font-size:12px; color:#F00; background-color:#e4e4e4 }
                #searchdeliverycorp span.title { display:block; font-size:12px; margin:5px; display:block;cursor:pointer }
				#searchdeliverycorp span.titles { background:#FF0000}
                #searchdeliverycorp span.company{ display:block; background-color:#e4e4e4}
                </style> 
        <input type="text" name="loginame" id="loginame" class="input-100" onkeyup="lookupdeliverycorp(event,this.value);" /> <span id='dloginame' class='f_red'></span><div style="position:absolute"><div id="suggestions"></div></div></td>
		<td class='hback_1'>物流单号 <span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="logino" id="logino" class="input-150" /> <span id='dlogino' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发货类型 <span class="f_red">*</span> </td>
		<td class='hback'><select name="shiptype" id="shiptype"><option value="">请选择</option><option value="1">部分发货</option><option value="2">全部发货</option></select> <span id='dshiptype' class='f_red'></span> </td>
		<td class='hback_1'>发货时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shiptime" id="shiptime" class="input-150" value="<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='dshiptime' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipuser" id="shipuser" class="input-60" value="<!--{$order.shipuser}-->" /> <span id='dshipuser' class='f_red'></span></td>
		<td class='hback_1'>收货人手机 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipmobile" id="shipmobile" class="input-100" value="<!--{$order.shipmobile}-->" /> <span id='dshipmobile' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货地址 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipaddress" id="shipaddress" class="input-200" value="<!--{$order.shipaddress}-->" /> <span id='dshipaddress' class='f_red'></span></td>
		<td class='hback_1'>邮编 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shipzipcode" id="shipzipcode" class="input-60" value="<!--{$order.shipzipcode}-->" />  <span id='dshipzipcode' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shiptelephone" id="shiptelephone" class="input-100" value="<!--{$order.shiptelephone}-->" /> <span id='dshiptelephone' class='f_red'></span></td>
		<td class='hback_1'>发货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="douser" id="douser" class="input-60" />  <span id='ddouser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发货单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="memo" id="memo" style="width:50%;height:60px;overflow:auto;"></textarea> <span id='dmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
      	<td><input name="notice"  checked="checked" type="checkbox" value="1" />是否通知客户</td>
		<td class='hback_none' colspan='3' align="center"><input type="button" id="tijiao" name="btn_save" class="button" value=" 提 交 " /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "viewdelivery"}-->
<div class="main-wrap">
  
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>查看发货单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
    
	<!--{if $fromtype=='jdbox'}-->
	<h3 class="title">正在查看发货单据[<!--{$delivery.dealid}-->]</h3>
	<!--{else}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=delivery&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>查看收款单据</h3>
	<!--{/if}-->

	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>发货单号 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$delivery.dealid}--></td>
		<td class='hback_1' width='15%'>所属订单号 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$delivery.orderid}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>物流公司 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.loginame}--></td>
		<td class='hback_1'>物流单号 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.logino}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>生成时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td class='hback_1'>发货时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shiptime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipuser}--></td>
		<td class='hback_1'>收货人手机 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipmobile}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货地址 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipaddress}--> <!--{$delivery.shipzipcode}--></td>
		<td class='hback_1'>收货人电话 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shiptelephone}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发货人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.douser}--></td>
		<td class='hback_1'>操作人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.opname}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>单据备注 <span class="f_red"></span> </td>
		<td class='hback_green' colspan='3'><!--{$delivery.memo}--></td>
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


<!--{if $a eq "return"}-->
<div class="main-wrap">
   
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>添加退货单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
	<h3 class="title">订单[<!--{$order.orderid}-->]退货...操作</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=delivery&fromtype=<!--{$fromtype}-->&stype=delivery" onsubmit='return checkreturn();' />
    <input type="hidden" name="a" value="savereturn" />
	<input type="hidden" name="orderid" id="orderid" value="<!--{$order.orderid}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>订单编号 <span class="f_red"></span> </td>
		<td class='hback' width='35%'>
		<!--{$order.orderid}-->
		&nbsp;<font color="orange">[会员：<!--{if $order.cpid==0}-->~~<!--{else}--><!--{$order.cpname}--><!--{/if}-->]</font>
		</td>
		<td class='hback_1' width='15%'>下单日期 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$order.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单配送方式 <span class="f_red"></span> </td>
		<td class='hback'>
		<!--{$order.shipname}-->
		&nbsp;
		<!--{if $order.shipstatus==0}-->
		<font color="#999999">未发货</font>
		<!--{elseif $order.shipstatus==1}-->
		<font color="#ff8000">部分发货</font>
		<!--{elseif $order.shipstatus==2}-->
		<font color="#008000">全部发货</font>
		<!--{elseif $order.shipstatus==3}-->
		<font color="#008080">部分退货</font>
		<!--{elseif $order.shipstatus==4}-->
		<font color="#ff0000">全部退货</font>
		<!--{/if}-->
		
		</td>
		<td class='hback_1'>订单配送费用 <span class="f_red"></span> </td>
		<td class='hback'><!--{$order.shipamount}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>物流公司 <span class="f_red">*</span> </td>
		<td class='hback'>
        <style>
                #suggestions{ position: relative; left:2px; top:-0px; width:300px; display:none;}
                #searchdeliverycorp { border-width:1px; border-color:#919191; border-style:solid; width:300px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
                #searchdeliverycorp span.searchdata { display:block; font-weight:bold; padding-top:5px; font-size:12px; color:#F00; background-color:#e4e4e4 }
                #searchdeliverycorp span.title { display:block; font-size:12px; margin:5px; display:block;cursor:pointer }
				#searchdeliverycorp span.titles { background:#FF0000}
                #searchdeliverycorp span.company{ display:block; background-color:#e4e4e4}
                </style> 
        <input type="text" name="loginame" id="loginame" class="input-100"  onkeyup="lookupdeliverycorp(event,this.value);" /> <span id='dloginame' class='f_red'></span><div style="position:absolute"><div id="suggestions"></div></div></td>
		<td class='hback_1'>物流单号 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="logino" id="logino" class="input-150" /> <span id='dlogino' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货类型 <span class="f_red">*</span> </td>
		<td class='hback'><select name="shiptype" id="shiptype"><option value="">请选择</option><option value="1">部分退货</option><option value="2">全部退货</option></select> <span id='dshiptype' class='f_red'></span> </td>
		<td class='hback_1'>退货时间 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shiptime" id="shiptime" class="input-150" value="<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='dshiptime' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipuser" id="shipuser" class="input-60" value="<!--{$order.shipuser}-->" /> <span id='dshipuser' class='f_red'></span></td>
		<td class='hback_1'>退货人手机 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipmobile" id="shipmobile" class="input-100" value="<!--{$order.shipmobile}-->" /> <span id='dshipmobile' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货地址 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipaddress" id="shipaddress" class="input-200" value="<!--{$order.shipaddress}-->" /> <span id='dshipaddress' class='f_red'></span></td>
		<td class='hback_1'>邮编 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shipzipcode" id="shipzipcode" class="input-60" value="<!--{$order.shipzipcode}-->" />  <span id='dshipzipcode' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货人电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shiptelephone" id="shiptelephone" class="input-100" value="<!--{$order.shiptelephone}-->" /> <span id='dshiptelephone' class='f_red'></span></td>
		<td class='hback_1'>收货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="douser" id="douser" class="input-60" />  <span id='ddouser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="memo" id="memo" style="width:50%;height:60px;overflow:auto;"></textarea> <span id='dmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
        <td><input name="notice"  checked="checked" type="checkbox" value="1" />是否通知客户</td>
		<td class='hback_none' colspan='3' align="center"><input type="button" id="tijiao" name="btn_save" class="button" value=" 提 交 " /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "viewreturn"}-->
<div class="main-wrap">
  
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：业务管理<span>&gt;&gt;</span>单据管理<span>&gt;&gt;</span>查看退货单据</p></div>
  <!--{/if}-->

  <div class="main-cont">
    
	<!--{if $fromtype=='jdbox'}-->
	<h3 class="title">正在查看退货单据[<!--{$delivery.dealid}-->]</h3>
	<!--{else}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=delivery&<!--{$comeurl}-->" class="btn-general"><span>返回列表</span></a>查看退货单据</h3>
	<!--{/if}-->

	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>退货单号 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$delivery.dealid}--></td>
		<td class='hback_1' width='15%'>所属订单号 <span class="f_red"></span> </td>
		<td class='hback_green' width='35%'><!--{$delivery.orderid}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>物流公司 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.loginame}--></td>
		<td class='hback_1'>物流单号 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.logino}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>生成时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td class='hback_1'>退货时间 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shiptime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipuser}--></td>
		<td class='hback_1'>退货人手机 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipmobile}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货地址 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shipaddress}--> <!--{$delivery.shipzipcode}--></td>
		<td class='hback_1'>退货人电话 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.shiptelephone}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.douser}--></td>
		<td class='hback_1'>操作人 <span class="f_red"></span> </td>
		<td class='hback_green'><!--{$delivery.opname}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>退货单据备注 <span class="f_red"></span> </td>
		<td class='hback_green' colspan='3'><!--{$delivery.memo}--></td>
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
function checkdelivery() {
	var t = "";
	var v = "";

	t = "loginame";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("物流公司不能为空", t);
		return false;
	}

	t = "logino";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("物流单号不能为空", t);
		return false;
	}

	t = "shiptype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发货类型不能为空", t);
		return false;
	}

	t = "shiptime";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发货时间不能为空", t);
		return false;
	}

	t = "shipuser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人不能为空", t);
		return false;
	}

	t = "shipmobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人手机不能为空", t);
		return false;
	}

	t = "shipaddress";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货地址不能为空", t);
		return false;
	}

	t = "douser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("发货人不能为空", t);
		return false;
	}

	return true;
}

//退货
function checkreturn() {
	var t = "";
	var v = "";

	t = "loginame";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("物流公司不能为空", t);
		return false;
	}

	t = "logino";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("物流单号不能为空", t);
		return false;
	}

	t = "shiptype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退货类型不能为空", t);
		return false;
	}

	t = "shiptime";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退货时间不能为空", t);
		return false;
	}

	t = "shipuser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退货人不能为空", t);
		return false;
	}

	t = "shipmobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退货人手机不能为空", t);
		return false;
	}

	t = "shipaddress";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("退货地址不能为空", t);
		return false;
	}

	t = "douser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人不能为空", t);
		return false;
	}

	return true;
}
$("#tijiao").click(function(){
$("#myform").submit();
 });
</script>
