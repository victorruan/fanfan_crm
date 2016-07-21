<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>询价转订单</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<!--{/if}-->
</head>
<body>
<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{/if}-->
<!--{if $a eq "ltorder"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>添加订单</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('订单列表', 'comment2', '<!--{$cpfile}-->?c=order&sview=<!--{$sview}-->')" class="btn-general"><span>返回列表</span></a>添加订单</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted" onsubmit='return checkadd();' />
    <input type='hidden' name='id' id='id' value='<!--{$id}-->' />
    <input type='hidden' name='title' id='title' value='<!--{$title}-->' />
	<input type='hidden' name='a' id='a' value='addorder' />
    <input type='hidden' name='cpid' id='cpid' value='<!--{$data.cpid}-->' />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_c1' colspan="2">订单物品清单列表</td>
	  </tr>

	  <tr>
	    <td colspan="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                      <tr id="list-top">
                      <td class='hback_1' align="center" width='12%'>物品ID</td>
                      <td class='hback_1' align="center" width='20%'>物品名称</td>
                      <td class='hback_1' align="center" width='15%'>物品规格</td>
                      <td class='hback_1' align="center" width='15%'>物品询价</td>
                      <td class='hback_1' align="center" width='10%'>折扣</td>
                      <td class='hback_1' align="center" width='15%'>物品数量</td>
                      <td class='hback_1' align="center">备注</td>
                    </tr>
                    <!--{foreach $data.product as $val}-->
                    <tr>
                      <td align="center"><!--{$val.goodsid}--></td>
                      <td align="center"><!--{$val.goodsname}--></td>
                      <td align="center"><!--{$val.normsstr}--></td>
                      <td align="center"><!--{$val.goodsprice}--></td>
                      <td align="center"><!--{$val.gooddiscount}--></td>
                      <td align="center"><!--{$val.goodsnum}--></td>
                      <td align="center"><!--{$val.goodsremarks}--></td>
                    </tr>
					<!--{/foreach}-->
                    <tr>
                      <td colspan='5' align="right">物品合计：</td>
                      <td align="left" colspan="2"><!--{$data.goodsamount}--></td>
                    </tr>
                    </table>
		</td>
	  </tr>

	  <tr>
		<td class='hback_c2' colspan="2">订单所属会员及收货信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' width='15%'>用户名 <span class="f_red"></span> </td>
		<td class='hback' width='85%'><!--<input type="text" name="cpname" id="cpname" class="input-100" value="<!--{if $data.type eq 1}--><!--{$data.cpname}--><!--{/if}-->"  readonly='only' /> <span id='dcpname' class='f_red'></span> <a href="javascript:void(0);" onclick="tbox_get_user('选择客户', 'cpname');">选择客户</a> 不填写为匿名订单--><!--{$data.cpname}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipuser" id="shipuser" class="input-100" value="<!--{$data.cpname}-->"  /> <span id='dshipuser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货地址 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipaddress" id="shipaddress" class="input-txt" value="<!--{$data.address}-->"  /> 邮编：<input type="text" name="shipzipcode" id="shipzipcode" class="input-s"  />  <span id='dshipaddress' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人手机 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipmobile" id="shipmobile" class="input-100" value="<!--{$data.mobile}-->"  /> <span id='dshipmobile' class='f_red'></span> （可接收订单提醒短信）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shiptelephone" id="shiptelephone" class="input-150"   value="<!--{$data.tel}-->"  /> <span id='dshiptelephone' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>指定送货时间 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shipday" id="shipday" class="input-txt"  /><span id='dshipday' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单附言 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="shipmemo" id="shipmemo" style="width:40%;height:50px;overflow:auto;"></textarea>  <span id='dshipmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c3' colspan="2">配送方式及备注</td>
	  </tr>
	  <tr>
		<td class='hback_1'>配送方式 <span class="f_red"></span> </td>
		<td class='hback'><!--{$shiptype_select}--> <span id='dshipid' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单备注 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"></textarea>  <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c1' colspan="2">发票信息</td>
	  </tr>
	  <tr>
		<td class='hback_1'>开具发票 <span class="f_red"></span> </td>
		<td class='hback'><input type="radio" name="istax" id="istax" value="1" />是， <input type="radio" name="istax" id="istax" value="0" checked />否，（温馨提示： 开具发票顾客将承担<b><font color="red"><!--{$config.taxrate}-->%</font></b>订单金额发票税金））</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票抬头 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="taxpayee" id="taxpayee" class="input-txt" /> <span id='dtaxpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票内容 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="taxcontent" id="taxcontent" style="width:40%;height:60px;overflow:auto;"></textarea> <span id='dtaxcontent' class='f_red'></span></td>
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



<!--{if $fromtype != 'jdbox'}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
<!--{/if}-->
</body>
</html>
<script type="text/javascript">
function checkadd() {
	var t = "";
	var v = "";

	//t = "itemmaxsort";
//	v = parseInt($("#"+t).val());
//	if(v<1) {
//		//alert('订单物品清单不能为空');
//		dmsg("订单物品清单不能为空", t);
//		$('#'+t).focus();
//		return false;
//	}

	t = "shipuser";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "shipaddress";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人地址不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "shipmobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货人手机号码不能为空", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}
<!--{if $a eq "ltorder"}-->
<!--{if $data.stype eq 2}-->
alert("此询价单已转为订单");
window.parent.$('.easyui-tabs').tabs('close',"<!--{$title}-->");
<!--{/if}-->
<!--{/if}-->
<!--{if $a eq "addorder"}-->
alert("转为订单成功");
addTabs('管理<!--{$orderid}-->', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&a=manage&id=<!--{$orderid}-->')
window.parent.$('.easyui-tabs').tabs('close',"<!--{$title}-->");
<!--{/if}-->
</script>