<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>订单管理</title>
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
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>订单列表</p></div>
  <div class="main-cont">
    <h3 class="title">
	<a href="javascript:addTabs('添加订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&a=add')" class="btn-general"><span>添加订单</span></a>
	<!--{if $sview == 1}-->
	未处理订单
	<!--{elseif $sview == 2}-->
	已付款待发货订单
	<!--{elseif $sview == 3}-->
	已发货订单
	<!--{elseif $sview == 4}-->
	已完成订单
	<!--{elseif $sview == 5}-->
	已退款订单
	<!--{elseif $sview == 6}-->
	已退货订单
	<!--{elseif $sview == 7}-->
	已作废订单
	<!--{else}-->
	全部订单
	<!--{/if}-->
	</h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=order&sview=<!--{$sview}-->" />
	  <div class="item">
	    <label>搜索类型：</label>
		<select name='stype' id='stype'>
		<option value="orderid"<!--{if $stype=='orderid'}--> selected<!--{/if}-->>订单号</option>
		<option value="remark"<!--{if $stype=='remark'}--> selected<!--{/if}-->>订单备注</option>
		<option value="shipuser"<!--{if $stype=='shipuser'}--> selected<!--{/if}-->>收货人</option>
		<option value="shipaddress"<!--{if $stype=='shipaddress'}--> selected<!--{/if}-->>收货人地址</option>
		<option value="shiptel"<!--{if $stype=='shiptel'}--> selected<!--{/if}-->>收货人电话</option>
		<option value="shipmobile"<!--{if $stype=='shipmobile'}--> selected<!--{/if}-->>收货人手机</option>
		<option value="cpname"<!--{if $stype=='cpname'}--> selected<!--{/if}-->>联系人</option>
        <option value="sentname"<!--{if $stype=='sentname'}--> selected<!--{/if}-->>公司名</option>
		</select>&nbsp;&nbsp;
		<label>关键字：</label>
		<input type="text" id="skeywd" name="skeywd" class="input-150" value="<!--{$skeywd}-->" />&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新订单列表" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=order&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="5%"><div class="th-gap">选择</div></th>
		<th width="12%"><div class="th-gap">订单号</div></th>
		<th width="11%"><div class="th-gap">下单时间</div></th>
		<th width="7%"><div class="th-gap">订单总额</div></th>
		<th width="6%"><div class="th-gap">状态</div></th>
		<th width="14%"><div class="th-gap">主体（联系人）</div></th>
		<th width="8%"><div class="th-gap">收货人</div></th>
		<th width="8%"><div class="th-gap">付款状态</div></th>
		<th width="8%"><div class="th-gap">发货状态</div></th>
		<th width="8%"><div class="th-gap">开票状态</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $order as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.orderid}-->" onClick="checkItem(this, 'chkAll')"></td>
		<td align="left"><!--{$volist.orderid}--></td>
		<td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="left"><!--{$volist.totalamount}--></td>
		<td align="center">
		<!--{if $volist.orderstatus=='finish'}-->
		<font color="#008000">已完成</font>
		<!--{elseif $volist.orderstatus=='dead'}-->
		<font color="#ff0000">已作废</font>
		<!--{elseif $volist.orderstatus=='active'}-->
		<font color="#0000ff">进行中</font>
		<!--{elseif $volist.orderstatus=='wait'}-->
		<font color="#999999">待确认</font>
		<!--{/if}-->
		</td>
		<td align="center"><!--{if $volist.entname}--><!--{$volist.entname}--><!--{else}-->个体<!--{/if}-->（<!--{$volist.cpname}-->） </td>
		<td align="center"><!--{$volist.shipuser}--></td>
		<td align="center">
		<!--{if $volist.paystatus==0}-->
		<font color="#999999">未付款</font>
		<!--{elseif $volist.paystatus==1}-->
		<font color="#ff8000">部分付款</font>
		<!--{elseif $volist.paystatus==2}-->
		<font color="#008000">全部付款</font>
		<!--{elseif $volist.paystatus==3}-->
		<font color="#008080">部分退款</font>
		<!--{elseif $volist.paystatus==4}-->
		<font color="#ff0000">全部退款</font>
		<!--{/if}-->
		</td>
		<td align="center">
		<!--{if $volist.shipstatus==0}-->
		<font color="#999999">未发货</font>
		<!--{elseif $volist.shipstatus==1}-->
		<font color="#ff8000">部分发货</font>
		<!--{elseif $volist.shipstatus==2}-->
		<font color="#008000">全部发货</font>
		<!--{elseif $volist.shipstatus==3}-->
		<font color="#008080">部分退货</font>
		<!--{elseif $volist.shipstatus==4}-->
		<font color="#ff0000">全部退货</font>
		<!--{/if}-->
		</td>
		<td align="center">
		<!--{if $volist.istax==0}-->
		不开票
		<!--{else}-->
		<!--{if $volist.taxstatus==0}-->
		<font color="#999999">待开票</font>
		<!--{elseif $volist.taxstatus==1}-->
		<font color="blue">申请中</font>
		<!--{elseif $volist.taxstatus==2}-->
		<font color="green">已开票</font>
		<!--{/if}-->
		<!--{/if}-->
		</td>
		<td align="center">
		<a href="javascript:addTabs('管理<!--{$volist.orderid}-->', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&a=manage&id=<!--{$volist.orderid}-->&page=<!--{$page}-->&<!--{$urlitem}-->')">管理</a>&nbsp;
		<!--{if $volist.paystatus==0 && $volist.shipstatus==0 && $volist.taxstatus==0}-->
		<a href="javascript:addTabs('编辑<!--{$volist.orderid}-->', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&a=edit&id=<!--{$volist.orderid}-->&page=<!--{$page}-->&<!--{$urlitem}-->')">编辑</a>&nbsp;
		<!--{/if}-->
		<a href="<!--{$cpfile}-->?c=order&a=del&id[]=<!--{$volist.orderid}-->" onClick="{if(confirm('确定要删除吗？一旦删除无法恢复！')){return true;} return false;}">删除</a>
		
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
  <div class="path"><p>当前位置：订单系统<span>&gt;&gt;</span>订单发布</p></div>
        <div class="main-cont">
      <h3 class="title">新客户快速注册</h3>
    <div class="search-area ">
    	 <form method="post" id="search_forms" action="<!--{$cpfile}-->?c=order&a=addcorp"  autocomplete="off"/>
	  <div class="item">
      <label>类型：</label><!--{$type_select}-->&nbsp;&nbsp;
      <span id="entnameinfo">
        <label>请填写企业名称：</label>
		<style>
                #suggestions{ position: relative; left:2px; top:-0px; width:300px; display:none;}
                #searchresults { border-width:1px; border-color:#919191; border-style:solid; width:300px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
                #searchresults span.searchdata { display:block; font-weight:bold; padding-top:5px; font-size:12px; color:#F00; background-color:#e4e4e4 }
                #searchresults span.title { display:block; font-size:12px; margin:5px; display:block;cursor:pointer }
				#searchresults span.titles { background:#FF0000}
                #searchresults span.company{ display:block; background-color:#e4e4e4}
           </style>    
               <input type="text" class="reg_input" name="entname" id="entname"  onkeyup="lookup(event,this.value);"/> 
        <div style="position:absolute"><div id="suggestions"></div> </div>&nbsp;&nbsp;
        </span>
        <span id="didinfo"><label>属于企业：</label><!--{$entselect}--> &nbsp;&nbsp;</span>
        
        
	    <label>客户名称：</label><input type="text" id="cpname" name="cpname" class="input-80"/>&nbsp;&nbsp;
		<label>邮箱：</label><input type="text" id="email" name="email" class="input-80"/>&nbsp;&nbsp;
		<label>手机：</label><input type="text" id="mobile" name="mobile" class="input-80"/>&nbsp;&nbsp;
		<input type="button" onclick="tijiaozhuce()" class="button_s" value="快速注册" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新客户资料" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
    </div>
            <h3 class="title">客户搜索（不输入条件则搜索全部客户）</h3>
            <div class="search-area ">
	 <form method="post" id="search_form" action="<!--{$cpfile}-->?c=order&a=add&search=1" />
	  <div class="item">
	    <label>企业名称：</label><input type="text" id="sentname" name="sentname" class="input-80" value="<!--{$sentname}-->" />&nbsp;&nbsp;
		<label>客户名称：</label><input type="text" id="scpname" name="scpname" class="input-80" value="<!--{$scpname}-->" />&nbsp;&nbsp;
		<label>邮箱：</label><input type="text" id="semail" name="semail" class="input-80" value="<!--{$semail}-->" />&nbsp;&nbsp;
		<label>电话：</label><input type="text" id="shotline" name="shotline" class="input-80" value="<!--{$shotline}-->" />&nbsp;&nbsp;
		<label>手机：</label><input type="text" id="smobile" name="smobile" class="input-80" value="<!--{$smobile}-->" />&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新客户资料" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
	</div>
    
    		<!--{if $search}-->
            <div style="margin: 8px;">
                <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                    font-weight: bold; text-align: center; float: left;">
                    客户列表
                </div>
                <div style="clear: both;"></div>
                <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                  <thead class="tb-tit-bg">
                  <tr>
                    <th width="8%"><div class="th-gap">选择</div></th>
                    <th width="10%"><div class="th-gap">客户名称</div></th>
                    <th width="10%"><div class="th-gap">客户折扣等级</div></th>
                    <th width="10%"><div class="th-gap">邮箱</div></th>
                    <th width="10%"><div class="th-gap">手机</div></th>
                    <th width="10%"><div class="th-gap">主体</div></th>
                    <th width="10%"><div class="th-gap">注册时间</div></th>
                  </tr>
                  </thead>
                  <tfoot class="tb-foot-bg"></tfoot>
                  <!--{foreach $corp as $volist}-->
                  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
                    <td align="center">
                    <input name="id" type="radio" value="<!--{$volist.cpid}-->" /><!--{$volist.cpid}-->
                    </td>
                    <td align="left"><!--{$volist.cpname}--></td>
                    <td align="left"><!--{if $volist.class}--><!--{$volist.class}-->（<!--{$volist.discount}-->）<!--{else}-->没有折扣等级<!--{/if}--></td>
                    <td align="left"><!--{$volist.email}--></td>
                    <td align="left"><!--{$volist.mobile}--></td>
                    <td align="center"><!--{if $volist.rootid neq 0}--><!--{$volist.entname}--><!--{else}-->个人<!--{/if}--></td>
                    <td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
                  </tr>
                  <!--{foreachelse}-->
                  <tr>
                    <td colspan="7" align="center">暂无信息</td>
                  </tr>
                  <!--{/foreach}-->
                  <!--{if $total>0}-->
                  <tr>
                    <td class="hback" colspan="7">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
                  </tr>
                  <!--{/if}-->
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
            <div style="margin: 8px;">
                <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                    font-weight: bold; text-align: center; float: left;">
                    客户名片
                </div>
                <div style="clear: both;"></div>
                <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
                    <table width="100%">
                        <tr>
                            <td align="center" width="10%"><strong>客户名称：</strong></td>
                            <td align="left" width="10%"><span id="ajaxcpname"></span></td>
                            <td align="center" width="10%"><strong>类型：</strong></td>
                            <td align="left" width="10%"><span id="ajaxtype"></span></td>
                            <td align="center" width="10%"><strong>手机号码：</strong></td>
                            <td align="left" width="10%"><span id="ajaxmobile"></span></td>
                            <td align="center" width="10%"><strong>地点：</strong></td>
                            <td align="left" width="10%"><span id="ajaxaddress"></span></td>
                            <td align="center" width="10%"><strong>备注：</strong></td>
                            <td align="left" width="10%"><span id="ajaxremark"></span></td>
                        </tr>
                    </table>
                </div>
            </div>
            
             <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                客户订单记录
            </div>
            <div style="clear: both;">
            </div>
            <div style="border-top:2px solid #1D86D7; padding-top: 10px;">
               <table border='0' cellpadding='1' cellspacing='1' class='tab'>
		    <tr id="historyorder">
			  <td class='hback_1' align="center" width='12%'>订单号</td>
			  <td class='hback_1' align="center" width='11%'>订单总额</td>
              <td class='hback_1' align="center" width='6%'>状态</td>
			  <td class='hback_1' align="center" width='14%'>主体（联系人）</td>
			  <td class='hback_1' align="center" width='8%'>收货人</td>
              <td class='hback_1' align="center" width='8%'>付款状态</td>
              <td class='hback_1' align="center" width='8%'>发货状态</td>
              <td class='hback_1' align="center" width='8%'>开票状态</td>
			</tr>
		  </table>
            </div>
            <input type="hidden" name="a" value="saveadd" />
            <input name='ajaxid' id='ajaxid' type='hidden' />
            <input name='ajaxname' id='ajaxname' type='hidden' />
            <div style="background-color: #f0f0f0; width: 350px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                客户订单(<span class="infocp" style="color:#CC0000">请选择客户</span>)
            </div>
            <div style="clear: both;">
            </div>
            <div style="border-top:2px solid #1D86D7; padding-top: 10px;">
          <input name='itemmaxsort' id='itemmaxsort' type='hidden' value='0' /> <span id='ditemmaxsort' class='f_red'></span>
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>物品ID</td>
			  <td class='hback_1' align="center" width='20%'>物品名称</td>
              <td class='hback_1' align="center" width='20%'>物品规格</td>
			  <td class='hback_1' align="center" width='10%'>物品价格</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='10%'>物品数量</td>
			  <td class='hback_1' align="center">操作</td>
			</tr>
			<tr>
			  <td colspan='8' align="right"><a href="javascript:void(0);" onclick="return item_add($(this));">添加物品清单</a><span id="load_itemtips"></span> &nbsp;&nbsp;</td>
			</tr>
      <!--   <tr>
		<td class='hback_c2' colspan="7">订单金额</td>
	  </tr>
	  <tr>
	    <td class='hback_1' colspan="2">折扣优惠</td>
		<td class='hback' colspan="5"><input type='text' name='discountamount' id='discountamount' class='input-80' value="0.00"/></td>
	  </tr>-->
      <tr>
		<td class='hback_c2' colspan="7">订单所属会员及收货信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipuser" id="shipuser" class="input-100"  /> <span id='dshipuser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货地址 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipaddress" id="shipaddress" class="input-txt"  /> 邮编：<input type="text" name="shipzipcode" id="shipzipcode" class="input-s"  />  <span id='dshipaddress' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人手机 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipmobile" id="shipmobile" class="input-100"  /> <span id='dshipmobile' class='f_red'></span> （可接收订单提醒短信）</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人电话 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="shiptelephone" id="shiptelephone" class="input-150"  /> <span id='dshiptelephone' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">指定送货时间 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipday" id="shipday" class="input-txt"  /><span id='dshipday' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">订单附言 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="shipmemo" id="shipmemo" style="width:40%;height:50px;overflow:auto;"></textarea>  <span id='dshipmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c3' colspan="7">配送方式及备注</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">配送方式 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><!--{$shiptype_select}--> <span id='dshipid' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">订单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"></textarea>  <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c1' colspan="7">发票信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">开具发票 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="radio" name="istax" id="istax" value="1" />是， <input type="radio" name="istax" id="istax" value="0" checked />否，（温馨提示： 开具发票顾客将承担<b><font color="red"><!--{$config.taxrate}-->%</font></b>订单金额发票税金））</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">发票抬头 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="taxpayee" id="taxpayee" class="input-txt" /> <span id='dtaxpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">发票内容 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="taxcontent" id="taxcontent" style="width:40%;height:60px;overflow:auto;"></textarea> <span id='dtaxcontent' class='f_red'></span></td>
	  </tr>
            <tr>
            <td class='hback_none'><input type="button" name="botton" class="button" value="添加订单" onclick="ajaxorderadd();" /></td>
          </tr>
		  </table>
            </div>
            
   </div>
        <!--{/if}-->
</div>
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>编辑订单</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('订单列表', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>正在编辑订单</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=order&<!--{$comeurl}-->" onsubmit='return checkedit();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
	  <tr>
		<td class='hback_c1' colspan="4">物品清单</td>
	  </tr>
	  <tr>
	    <td colspan="4">
		  <table border='0' cellpadding='1' cellspacing='1' class='tab'>
		    <tr id="list-tops">
			  <td class='hback_1' align="center" width='12%'>序号</td>
              <td class='hback_1' align="center" width='30%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='15%'>物品单价</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='15%'>物品数量</td>
			  <td class='hback_1' align="center">总额</td>
			</tr>
			<!--{foreach $itemlist as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.i}--></td>
			  <td align="center"><!--{$volist.gdname}--></td>
              <td align="center"><!--{$volist.normsstr}--></td>
			  <td align="center"><!--{$volist.price}--></td>
              <td align="center"><!--{$volist.discount}--></td>
			  <td align="center"><!--{$volist.quantity}--></td>
			  <td align="center"><!--{$volist.total}--></td>
			</tr>
			<!--{/foreach}-->
			<tr>
			  <td colspan='5' align="right">物品合计：</td>
			  <td align="left"><!--{$order.goodsamount}--></td>
			</tr>
		  </table>
          
           <div style="background-color: #f0f0f0; width: 350px; padding: 5px 10px 5px 10px; font-weight: bold; text-align: center; float: left; margin-top:10px;">编辑订单货物(<span class="infocp" style="color:#CC0000"><!--{if $order.class}-->当前客户最低可享<!--{$order.discount}--> <a href="javascript:bonddiscount('<!--{$order.discount}-->','order')">一键折扣转换</a><!--{else}-->没有客户折扣<!--{/if}--></span>)</div>
            <div style="clear: both;"></div>
          <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
             <input name='itemmaxsort' id='itemmaxsort' type='hidden' value='<!--{$itemsum}-->' />
           <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>物品ID</td>
			  <td class='hback_1' align="center" width='15%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='10%'>订单价格</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='10%'>物品数量</td>
			  <td class='hback_1' align="center">操作</td>
			</tr>
            <!--{foreach $itemlist as $volist}-->
            <tr class='itemlist' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
			  <td class='hback' align='center'> 物品<!--{$volist.i}-->
               <input type='hidden' name='item_gid_<!--{$volist.i}-->' id='item_gid_<!--{$volist.i}-->' value="<!--{$volist.goodsid}-->" />
               <input type='hidden' name='item_sid_<!--{$volist.i}-->' id='item_sid_<!--{$volist.i}-->' value="<!--{$volist.sid}-->" />
               </td>
              <td class='hback' align='center' id='item_id_<!--{$volist.i}-->'><!--{$volist.goodsid}--></td>
              <td class='hback' id='item_name_<!--{$volist.i}-->'><!--{$volist.gdname}--></td>
              <td class='hback' id='item_norms_<!--{$volist.i}-->'><!--{$volist.normsstr}--></td>
               <input type='hidden' name='item_normsstr_<!--{$volist.i}-->' id='item_normsstr_<!--{$volist.i}-->' value="<!--{$volist.normsstr}-->" />
			  <td class='hback' align='center'>
              <input type='text' name='item_price_<!--{$volist.i}-->' id='item_price_<!--{$volist.i}-->' class='input-s' onblur="pcdiscounts('item_oprice_<!--{$volist.i}-->', 'item_price_<!--{$volist.i}-->','item_discount_<!--{$volist.i}-->')" value="<!--{$volist.price}-->" />
              </td>
			<td class='hback' align='center'>
            <input type='text' name='item_discount_<!--{$volist.i}-->' id='item_discount_<!--{$volist.i}-->' class='input-s' onblur="dcprice('item_oprice_<!--{$volist.i}-->', 'item_price_<!--{$volist.i}-->','item_discount_<!--{$volist.i}-->')" value="<!--{$volist.discount}-->"  />
            <input type='hidden' name='item_oprice_<!--{$volist.i}-->' id='item_oprice_<!--{$volist.i}-->' value="<!--{$volist.oprice}-->" />
            </td>
             <td class='hback' align='center'>
             <input type='text' name='item_num_<!--{$volist.i}-->' id='item_num_<!--{$volist.i}-->' class='input-s' value="<!--{$volist.quantity}-->" />
             </td>
			 <td class='hback' align='center'>
             <a href='javascript:void(0);' onclick="tbox_get_goods('查询物品', '<!--{$volist.i}-->')">选取产品</a>&nbsp;&nbsp;
             <a href='javascript:void(0);' onclick='item_countnums();item_del($(this),<!--{$volist.i}-->);'>移除</a></td>
    	        </tr>
            <!--{/foreach}-->       
                   
                   
			<tr>
			  <td colspan='8' align="right"><a href="javascript:void(0);" onclick="return item_add($(this));">添加物品清单</a><span id="load_itemtipss"></span> &nbsp;&nbsp;</td>
			</tr>
		  </table>
          </div>

          
		</td>
	  </tr>
	  <tr>
		<td class='hback_c2' colspan="4">订单金额</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>配送费用</td>
		<td class='hback'><input type='text' name='shipamount' id='shipamount' class='input-80' value="<!--{$order.shipamount}-->" /></td>
	    <td class='hback_1'>折扣优惠</td>
		<td class='hback'><input type='text' name='discountamount' id='discountamount' class='input-80' value="<!--{$order.discountamount}-->" /></td>
	  </tr>
	  <tr>
	    <td class='hback_1'>开具发票 </td>
		<td class='hback'><!--{if $order.istax==1}--><font color="green">是</font><!--{else}--><font color="red">否</font><!--{/if}--></td>
	    <td class='hback_1'>开具发票费用 </td>
		<td class='hback'><!--{$order.addtaxamount}--> <br />计算公式：发票费用=(物品金额+配送费用-折扣优惠)*税率(<!--{$config.taxrate}-->%)</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>物品金额</td>
		<td class='hback'><!--{$order.goodsamount}--><input type='hidden' name='goodsamount' id='goodsamount' value="<!--{$order.goodsamount}-->" /></td>
	    <td class='hback_1'>订单总额</td>
		<td class='hback'><b><!--{$order.totalamount}--></b> <br />计算公式：订单总额=物品金额+配送费用-折扣优惠+发票费用</td>
	  </tr>
	  <tr>
		<td class='hback_c2' colspan="4">订单所属会员及收货信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' width='15%'>客户 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$order.cpname}-->
        <input type='hidden' name='cpid' id='cpid' value="<!--{$order.cpid}-->" />
       <!-- <input type="text" name="cpname" id="cpname" class="input-100"  readonly='only' value="<!--{$order.cpname}-->" /> <span id='dcpname' class='f_red'></span> <a href="javascript:void(0);" onclick="tbox_get_user('选择客户', 'cpname');">选择用户</a>--> </td>
		<td class='hback_1'>收货人 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipuser" id="shipuser" class="input-100" value="<!--{$order.shipuser}-->"  /> <span id='dshipuser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货地址 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipaddress" id="shipaddress" class="input-txt" value="<!--{$order.shipaddress}-->" /> <br />邮编：<input type="text" name="shipzipcode" id="shipzipcode" class="input-s" value="<!--{$order.shipzipcode}-->"  />  <span id='dshipaddress' class='f_red'></span> </td>

		<td class='hback_1'>收货人手机 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="shipmobile" id="shipmobile" class="input-100" value="<!--{$order.shipmobile}-->" /> <span id='dshipmobile' class='f_red'></span> <br />（可接收订单提醒短信）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>收货人电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shiptelephone" id="shiptelephone" class="input-150" value="<!--{$order.shiptelephone}-->"  /> <span id='dshiptelephone' class='f_red'></span></td>
		<td class='hback_1'>指定送货时间 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="shipday" id="shipday" class="input-txt" value="<!--{$order.shipday}-->" /><span id='dshipday' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单附言 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="shipmemo" id="shipmemo" style="width:40%;height:50px;overflow:auto;"><!--{$order.shipmemo}--></textarea>  <span id='dshipmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c3' colspan="4">配送方式及备注</td>
	  </tr>
	  <tr>
		<td class='hback_1'>配送方式 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><!--{$shiptype_select}--> <span id='dshipid' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>订单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"><!--{$order.remark}--></textarea>  <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c1' colspan="4">发票信息</td>
	  </tr>
	  <tr>
		<td class='hback_1'>开具发票 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><input type="radio" name="istax" id="istax" value="1"<!--{if $order.istax==1}--> checked<!--{/if}--> />是， <input type="radio" name="istax" id="istax" value="0"<!--{if $order.istax==0}--> checked<!--{/if}--> />否，（温馨提示： 开具发票顾客将承担<b><font color="red"><!--{$config.taxrate}-->%</font></b>订单金额发票税金））</td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票抬头 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><input type="text" name="taxpayee" id="taxpayee" class="input-txt" value="<!--{$order.taxpayee}-->" /> <span id='dtaxpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票内容 <span class="f_red"></span> </td>
		<td class='hback' colspan="3"><textarea name="taxcontent" id="taxcontent" style="width:40%;height:60px;overflow:auto;"><!--{$order.taxcontent}--></textarea> <span id='dtaxcontent' class='f_red'></span></td>
	  </tr>
		 <tr>
		<td class='hback_c1' colspan="4">本次编辑的备注</td>
	  </tr>
      <tr>
		<td class='hback_1'>备注</td>
		<td class='hback' colspan="3"><textarea name="editorremarks" id="editorremarks" style="width:40%;height:60px;overflow:auto;">请填写对本次操作修改情况的概述</textarea></td>
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


<!--{if $a eq "manage"}-->
<script type="text/javascript">
	function nTabs(thisObj, Num) {
		if (thisObj.className == "active") return;
		var tabList = document.getElementById("myTab").getElementsByTagName("li");
		for (i = 0; i < tabList.length; i++) {
			//点击之后，其他tab变成灰色，内容隐藏，只有点击的tab和内容有属性
			if (i == Num) {
				thisObj.className = "active";
				document.getElementById("myTab_Content" + i).style.display = "block";
			} else {
				tabList[i].className = "normal";
				document.getElementById("myTab_Content" + i).style.display = "none";
			}
		}
	}
</script>
<style type="text/css">
.nTab{width: 98%;height: auto;margin: 20px auto;border: 1px solid #dbe2e7;overflow: hidden;}
.none{display: none;}
.nTab .TabTitle li{float: left;cursor: pointer;height:28px;line-height:28px;text-align: center;width: 100px;}
.nTab .TabTitle li a{text-decoration: none;}
.nTab .TabTitle .active{background: #e5ecf0;font-size:13px;font-weight: bold;}
.nTab .TabTitle .normal{color: #336699;}
.nTab .TabContent{clear: both;overflow: hidden;background: #fff;padding: 5px;display: block;height: auto;}
</style>
<div class="main-wrap">
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>操作订单</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('订单列表', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>正在操作订单：<!--{$order.orderid}--></h3>

	<div class="nTab">
	  <div class="TabTitle">
	    <ul id="myTab">
		  <li class="active" onclick="nTabs(this,0);">基本信息</li>
		  <li class="normal" onclick="nTabs(this,1);">订单清单</li>
		  <li class="normal" onclick="nTabs(this,2);">收退款记录</li>
		  <li class="normal" onclick="nTabs(this,3);">收发货记录</li>
		  <li class="normal" onclick="nTabs(this,4);">订单备注</li>
		  <li class="normal" onclick="nTabs(this,5);">订单记录</li>
		</ul>
	  </div>

      <div class="TabContent">
	    
		<!-- 基本信息开始 -->
	    <div id="myTab_Content0">
			<div class="search-area6 ">
			  <div class="item">
			    <form action="<!--{$cpfile}-->?c=order&<!--{$comeurl}-->" method="post" name="myform" id="myform" style="margin:0">
				<input type="hidden" name='a' id='a' value='' />
				<input type="hidden" name='id' id='id' value='<!--{$order.orderid}-->' />
				<label>订单状态操作：</label>

				<!--{if $order.orderstatus=='dead' || $order.orderstatus=='finish'}-->
				<input type="button" name='op_pay' id='op_pay' value="支付..." disabled />&nbsp;
				<input type="button" name='op_delivery' id='op_delivery' value="发货..." disabled />&nbsp;
				<input type="button" name='op_finish' id='op_finish' value="&nbsp;完 成&nbsp;" disabled />&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" name='op_refund' id='op_refund' value="退款..." disabled />&nbsp;
				<input type="button" name='op_return' id='op_return' value="退货..." disabled />&nbsp;
				<input type="button" name='op_dead' id='op_dead' value="&nbsp;作 废&nbsp;" disabled />&nbsp;
				<!--{else}-->

				<!--{if $order.paystatus==2}-->
				<input type="button" name='op_pay' id='op_pay' value="支付..." disabled />&nbsp;
				<!--{else}-->
				<input type="button" name='op_pay' id='op_pay' value="支付..." onclick="tbox_addpayment('订单收款操作', '<!--{$order.orderid}-->');" />&nbsp;
				<!--{/if}-->

				<!--{if $order.shipstatus==2}-->
				<input type="button" name='op_delivery' id='op_delivery' value="发货..." disabled  />&nbsp;
				<!--{else}-->
				<input type="button" name='op_delivery' id='op_delivery' value="发货..." onclick="tbox_adddelivery('订单发货操作', '<!--{$order.orderid}-->')"  />&nbsp;
				<!--{/if}-->

				
				<input type="button" name='op_finish' id='op_finish' value="&nbsp;完 成&nbsp;" onClick="{if(confirm('确定要完成订单吗？一旦完成，无法再操作订单！')){$('#a').val('savefinish');$('#myform').submit();return true;}return false;}" />&nbsp;

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

				<!--{if $order.paystatus==0 || $order.paystatus==4}-->
				<input type="button" name='op_refund' id='op_refund' value="退款..." disabled />&nbsp;
				<!--{else}-->
				<input type="button" name='op_refund' id='op_refund' value="退款..." onclick="tbox_addrefund('订单退款操作', '<!--{$order.orderid}-->');" />&nbsp;
				<!--{/if}-->

				<!--{if $order.shipstatus==0 || $order.shipstatus==4}-->
				<input type="button" name='op_return' id='op_return' value="退货..." disabled />&nbsp;
				<!--{else}-->
				<input type="button" name='op_return' id='op_return' value="退货..." onclick="tbox_addreturn('订单退货操作', '<!--{$order.orderid}-->');" />&nbsp;
				<!--{/if}-->

				<input type="button" name='op_dead' id='op_dead' value="&nbsp;作 废&nbsp;" onClick="{if(confirm('确定要作废订单吗？一旦作废，无法再操作订单！')){$('#a').val('savedead');$('#myform').submit();return true;}return false;}" />&nbsp;

				&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- 是否开具发票 -->
				<!--{if $order.istax==1}-->
				<!--{if $order.taxstatus==1}-->
				<input type="button" name="op_tax" id="op_tax" value="开票申请中..." disabled />
				<!--{elseif $order.taxstatus==2}-->
				<input type="button" name="op_tax" id="op_tax" value="已开发票" disabled />
				<!--{else}-->
				<input type="button" name="op_tax" id="op_tax" value="申请财务开发票" onclick="tbox_appinvoice('申请财务开发票', '<!--{$order.orderid}-->');" />
				<!--{/if}-->
				<!--{/if}-->
				<!--{/if}-->

                </form>
			  </div>
			</div>
			<table cellpadding='1' cellspacing='2' class='tab'>
			  <tr>
				<td class='hback_c1' colspan="4">订单金额</td>
			  </tr>
			  <tr>
				<td class='hback_1' width='15%'>配送费用</td>
				<td class='hback' width='35%'><!--{$order.shipamount}--></td>
				<td class='hback_1' width='15%'>折扣优惠</td>
				<td class='hback' width='35%'><!--{$order.discountamount}--></td>
			  </tr>
			  <tr>
				<td class='hback_1'>物品金额</td>
				<td class='hback'><!--{$order.goodsamount}--></td>
				<td class='hback_1'>开具发票金额</td>
				<td class='hback'><!--{$order.addtaxamount}--></td>
			  </tr>
			  <tr>
				<td class='hback_1'>订单总额</td>
				<td class='hback'><!--{$order.totalamount}--></td>
				<td class='hback_1'>已收金额</td>
				<td class='hback'><!--{$order.payamount}--></td>
			  </tr>
			  <tr>
				<td class='hback_c2' colspan="4">收货信息</td>
			  </tr>
			  <tr>
				<td class='hback_1'>用户名 <span class="f_red"></span> </td>
				<td class='hback'><!--{if $order.cpid==0}-->~~<!--{else}--><!--{$order.cpname}--><!--{/if}--></td>
				<td class='hback_1'>收货人 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipuser}--></td>
			  </tr>
			  <tr>
				<td class='hback_1'>收货地址 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipaddress}--> 邮编：<!--{$order.shipzipcode}--></td>

				<td class='hback_1'>收货人手机 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipmobile}--></td>
			  </tr>
			  <tr>
				<td class='hback_1'>收货人电话 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shiptelephone}--></td>
				<td class='hback_1'>指定送货时间 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipday}--></td>
			  </tr>
			  <tr>
				<td class='hback_1'>配送方式 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipname}--></td>
				<td class='hback_1'>收货附言 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.shipmemo}--></td>
			  </tr>
			  <tr>
				<td class='hback_c1' colspan="4">开具发票信息</td>
			  </tr>
			  <tr>
				<td class='hback_1'>是否开票 <span class="f_red"></span> </td>
				<td class='hback'><!--{if $order.istax==1}--><font color="green">是</font><!--{else}--><font color="red">否</font><!--{/if}--></td>
				<td class='hback_1'>承担金额 <span class="f_red"></span> </td>
				<td class='hback'>开具发票 客户承担<b><font color="red"><!--{$config.taxrate}-->%</font></b>订单金额发票税金</td>
			  </tr>
			  <tr>
				<td class='hback_1'>发票抬头 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.taxpayee}--></td>
				<td class='hback_1'>发票内容 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.taxcontent|nl2br}--></td>
			  </tr>
			  <tr>
				<td class='hback_c3' colspan="4">下单信息</td>
			  </tr>
			  <tr>
				<td class='hback_1'>下单时间 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
				<td class='hback_1'>最后更新 <span class="f_red"></span> </td>
				<td class='hback'><!--{$order.updatetime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
			  </tr>
			</table>


        </div>
		<!-- 基本信息结束 -->

		<!-- 订单清单开始 -->
		<div id="myTab_Content1" class="none">
	
		  <table border='0' cellpadding='1' cellspacing='1' class='tab'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='12%'>明细ID</td>
			  <td class='hback_1' align="center" width='30%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='15%'>物品单价</td>
               <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='15%'>物品数量</td>
			  <td class='hback_1' align="center">总额</td>
			</tr>
			<!--{foreach $itemlist as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.i}--></td>
			  <td align="center"><!--{$volist.gdname}--></td>
              <td align="center"><!--{$volist.normsstr}--></td>
			  <td align="center"><!--{$volist.price}--></td>
              <td align="center"><!--{$volist.discount}--></td>
			  <td align="center"><!--{$volist.quantity}--></td>
			  <td align="center"><!--{$volist.total}--></td>
			</tr>
			<!--{/foreach}-->
			<tr>
			  <td colspan='6' align="right">物品合计：</td>
			  <td align="left"><!--{$order.goodsamount}--></td>
			</tr>
		  </table>
		
		</div>
		<!-- 订单清单结束 -->

		<!-- 收退款记录开始 -->
		<div id="myTab_Content2" class="none">
		  <table cellpadding='2' cellspacing='2' border='0' width='100%'>
		    <tr>
			  <!--  收款记录 -->
			  <td width='50%' valign="top">
			      <h3 class="subtitle">收款单据列表</h3>
				  <table border='0' cellpadding='0' cellspacing='0' class='table'>
					<thead class="tb-tit-bg">
					<tr>
					  <th width="28%"><div class="th-gap">单据日期</div></th>
					  <th width="25%"><div class="th-gap">支付金额</div></th>
					  <th width="25%"><div class="th-gap">支付方式</div></th>
					  <th width="23%"><div class="th-gap">状态</div></th>
					</tr>
					</thead>
					<!--{foreach $paylist as $volist}-->
					<tr>
					  <td align="center"><!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M"}--></td>
					  <td align="center"><b><!--{$volist.amount}--></b></td>
					  <td align="center">
						<!--{if $volist.paytype=='online'}-->
						在线支付
						<!--{elseif $volist.paytype=='recharge'}-->
						转账汇款
						<!--{elseif $volist.paytype=='cash'}-->
						现金付款
						<!--{elseif $volist.paytype=='deposit'}-->
						帐号余额支付
						<!--{/if}-->
					  </td>
					  <td align="center">
						<!--{if $volist.paystatus==0}-->
						<font color="#999999">未执行</font>
						<!--{elseif $volist.paystatus==10}-->
						<font color="green">支付成功</font>
						<!--{elseif $volist.paystatus==11}-->
						<font color="red">支付失败</font>
						<!--{/if}-->
					  </td>
					</tr>
					<!--{foreachelse}-->
					<tr>
					  <td colspan='4' align='center'>暂无收款单据</td>
					</tr>
					<!--{/foreach}-->
				  </table>
			  </td>

			  <!-- 退款记录 -->
			  <td width='50%' valign="top">
			      <h3 class="subtitle">退款单据列表</h3>
				  <table border='0' cellpadding='0' cellspacing='0' class='table'>
					<thead class="tb-tit-bg">
					<tr>
					  <th width="28%"><div class="th-gap">单据日期</div></th>
					  <th width="25%"><div class="th-gap">退款金额</div></th>
					  <th width="25%"><div class="th-gap">退款方式</div></th>
					  <th width="23%"><div class="th-gap">状态</div></th>
					</tr>
					</thead>
					<!--{foreach $refundlist as $volist}-->
					<tr>
					  <td align="center"><!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M"}--></td>
					  <td align="center"><b><!--{$volist.amount}--></b></td>
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
					</tr>
					<!--{foreachelse}-->
					<tr>
					  <td colspan='4' align='center'>暂无退款单据</td>
					</tr>
					<!--{/foreach}-->
				  </table>
			  </td>
			</tr>
		  </table>

		</div>
		<!-- 收退款记录结束 -->

		<!-- 收发货记录开始 -->
		<div id="myTab_Content3" class="none">
		  <table cellpadding='2' cellspacing='2' border='0' width='100%'>
		    <tr>
			  <!--  发货记录 -->
			  <td width='50%' valign="top">
			      <h3 class="subtitle">发货单据列表</h3>
				  <table border='0' cellpadding='0' cellspacing='0' class='table'>
					<thead class="tb-tit-bg">
					<tr>
					  <th width="20%"><div class="th-gap">创建时间</div></th>
					  <th width="22%"><div class="th-gap">发货单号</div></th>
					  <th width="22%"><div class="th-gap">物流单号</div></th>
					  <th width="15%"><div class="th-gap">收件人</div></th>
					  <th><div class="th-gap">物流公司</div></th>
					</tr>
					</thead>
					<!--{foreach $deliverylist as $volist}-->
					<tr>
					  <td align="center"><!--{$volist.createtime|date_format:"%m-%d %H:%M"}--></td>
					  <td align="center"><!--{$volist.dealid}--></td>
					  <td align="center"><!--{$volist.logino}--></td>
					  <td align="center"><!--{$volist.shipuser}--></td>
					  <td align="center"><!--{$volist.loginame}--></td>
					</tr>
					<!--{foreachelse}-->
					<tr>
					  <td colspan='5' align='center'>暂无发货单据</td>
					</tr>
					<!--{/foreach}-->
				  </table>
			  </td>

			  <!-- 退货记录 -->
			  <td width='50%' valign="top">
			      <h3 class="subtitle">退货单据列表</h3>
				  <table border='0' cellpadding='0' cellspacing='0' class='table'>
					<thead class="tb-tit-bg">
					<tr>
					  <th width="20%"><div class="th-gap">创建时间</div></th>
					  <th width="22%"><div class="th-gap">退货单号</div></th>
					  <th width="22%"><div class="th-gap">物流单号</div></th>
					  <th width="15%"><div class="th-gap">退货人</div></th>
					  <th><div class="th-gap">物流公司</div></th>
					</tr>
					</thead>
					<!--{foreach $returnlist as $volist}-->
					<tr>
					  <td align="center"><!--{$volist.createtime|date_format:"%m-%d %H:%M"}--></td>
					  <td align="center"><!--{$volist.dealid}--></td>
					  <td align="center"><!--{$volist.logino}--></td>
					  <td align="center"><!--{$volist.shipuser}--></td>
					  <td align="center"><!--{$volist.loginame}--></td>
					</tr>
					<!--{foreachelse}-->
					<tr>
					  <td colspan='5' align='center'>暂无退货单据</td>
					</tr>
					<!--{/foreach}-->
				  </table>
			  </td>
			</tr>
		  </table>
		</div>
		<!-- 收发货记录结束 -->

		<!-- 订单备注开始 -->
		<div id="myTab_Content4" class="none">
		<form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=order&<!--{$comeurl}-->" />
		<input type="hidden" name="a" value="saveremark" />
		<input type="hidden" name="id" value="<!--{$id}-->" />
		<table cellpadding='1' cellspacing='2' class='tab'>
		  <tr>
			<td class='hback_1' width='15%'>订单备注 <span class="f_red"></span> </td>
			<td class='hback' width='85%'><textarea name="remark" id="remark" style="width:40%;height:100px;overflow:auto;"><!--{$order.remark}--></textarea>  <span id='dremark' class='f_red'></span></td>
		  </tr>
		  <tr>
			<td class='hback_none'></td>
			<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
		  </tr>
		</table>
		</form>
		
		</div>
		<!-- 订单备注结束 -->

		<!-- 订单记录开始 -->
		<div id="myTab_Content5" class="none">
		
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <thead class="tb-tit-bg">
		    <tr>
			  <th width="10%"><div class="th-gap">序号</div></th>
			  <th width="18%"><div class="th-gap">时间</div></th>
			  <th width="15%"><div class="th-gap">操作人</div></th>
			  <th width="10%"><div class="th-gap">行为</div></th>
			  <th width="10%"><div class="th-gap">结果</div></th>
			  <th><div class="th-gap">备注</div></th>
		    </tr>
		    </thead>
			<!--{foreach $loglist as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.i}--></td>
			  <td align="center"><!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
			  <td align="center"><!--{$volist.adminname}--></td>
			  <td align="center"><!--{$volist.behavior}--></td>
			  <td align="center"><!--{if $volist.result==1}-->成功<!--{else}-->失败<!--{/if}--></td>
			  <td align="center"><!--{$volist.logtext}--></td>
			</tr>
			<!--{/foreach}-->
		  </table>

		</div>
		<!-- 订单记录结束 -->
	  </div>
	</div>



  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->


<!--{if $a eq "appinvoice"}-->
<div class="main-wrap">
   
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：订单管理<span>&gt;&gt;</span>申请开发票</p></div>
  <!--{/if}-->

  <div class="main-cont">
	<h3 class="title">订单[<!--{$order.orderid}-->]申请开发票...操作</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=order&fromtype=<!--{$fromtype}-->&<!--{$comeurl}-->" onsubmit='return checkappinvoice();' />
    <input type="hidden" name="a" value="saveinvoice" />
	<input type="hidden" name="id" id="id" value="<!--{$order.orderid}-->" />
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
		<td class='hback'><!--{$order.payamount}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票抬头 <span class="f_red">*</span> </td>
		<td class='hback' colspan='3'><input type="text" name="taxpayee" id="taxpayee" class="input-txt" value="<!--{$order.taxpayee}-->" /> <span id='dtaxpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>发票内容 <span class="f_red">*</span> </td>
		<td class='hback' colspan='3'>
		<textarea name="taxcontent" id="taxcontent" style="width:90%;height:100px;overflow:auto;"><!--{$order.taxcontent}--></textarea>
		<br /><span id='dtaxcontent' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_none' colspan='4' align="center"><input type="submit" name="btn_save" class="button" value="提交申请" /></td>
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
function checkedit() {
	var t = "";
	var v = "";

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
		dmsg("收货地址不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "shipmobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("收货手机号码不能为空", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}

function checkappinvoice() {
	var t = "";
	var v = "";

	t = "taxpayee";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写发票抬头", t);
		$('#'+t).focus();
		return false;
	}

	t = "taxcontent";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请填写发票内容", t);
		$('#'+t).focus();
		return false;
	}

	return true;
}
$("input[name='id']").each(function(i){
     $(this).click(function(){
	 var id=$(this).val();
	 	var html = '';
		$.ajax({
			type:"POST",	   
			url :"<!--{$cpfile}-->?c=guide&a=ajaxGetCp",
			data:"id="+id,
			dataType:"JSON",
			success: function(data,textStatus){
			data = eval(data);
			$.each(data, function(index,txt){
			
			   if(txt['rootid']!=0){
			   		$("#ajaxtype").html('企业');
			   }else{
			   		$("#ajaxtype").html('个人');
			   }
			   		$("#ajaxid").val(txt['cpid']);
					$("#ajaxname").val(txt['cpname']);
					$("#shipuser").val(txt['cpname']);
					$("#shipmobile").val(txt['mobile']);
					$("#shipaddress").val(txt['address']);
					
					$("#ajaxcpname").html(txt['cpname']);
					//$("#ajaxcpno").html(txt['cpno']);
					$("#ajaxaddress").html(txt['address']);
					$("#ajaxremark").html(txt['remark']);
					$("#ajaxmobile").html(txt['mobile']);
					//$("#ajaxposition").html(txt['position']);
					if(txt['discount'] && txt['cpname']){
		$(".infocp").eq(0).html('当前客户最低可享'+txt['discount']+' <a href="javascript:bonddiscount(\''+txt['discount']+'\',\'order\')">一键折扣转换</a>');
					}else if(txt['cpname'] && !txt['discount']){
						$(".infocp").html('当前客户没有折扣等级');
					}else{
						$(".infocp").html('请选择客户');
					}
					
					$(".addprolistorder").remove();
					$("#historyorder").after(txt['order']);
					//$("#goodsamount").html(txt['order']['goodsamount']);
					
					
			});  
			}
		});
	 });
 });
$(function(){
entchange(1);
});

</script>