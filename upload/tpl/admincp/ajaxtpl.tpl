<!--{if $a eq 'ajaxGetCp'}-->
<!--{if $type eq 'quoted'}-->
 <!--{foreach $quoted as $volist}-->
<tr class="addprolist" onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td align="center"><!--{$volist.pid}--></td>
<td align="center"><!--{$volist.inquiryid}--></td>
<td align="center"><!--{if $volist.entname}--><!--{$volist.entname}--><!--{else}-->个体<!--{/if}-->（<!--{$volist.cpname}-->）</td>
<td align="center"><!--{if $volist.examine eq 2}--><font color="#009900">审核成功</font><!--{elseif $volist.examine eq 1}--><font color="#CC0000">审核失败</font><!--{else}-->未审核<!--{/if}--></td>
<td align="center">
<!--{if $volist.stype eq 2}--><font color="#009900">已转订单</font><!--{else}-->未转订单<!--{/if}--></td>
<td align="center"><!--{$volist.mobile}--></td>
<td><!--{$volist.addtime|date_format:"%Y/%m/%d"}--></td></tr>
<!--{foreachelse}-->
      <tr>
	    <td colspan="7" class="addprolist" align="center">暂无信息</td>
	  </tr>
<!--{/foreach}-->
<!--{/if}-->
<!--{if $type eq 'order'}-->
<!--{foreach $order as $volist}-->
<tr class="addprolistorder" onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td align="center"><!--{$volist.orderid}--></td>
<td align="center"><!--{$volist.totalamount}--></td>
<td align="center"><!--{if $volist.orderstatus=='finish'}-->
		<font color="#008000">已完成</font>
		<!--{elseif $volist.orderstatus=='dead'}-->
		<font color="#ff0000">已作废</font>
		<!--{elseif $volist.orderstatus=='active'}-->
		<font color="#0000ff">进行中</font>
		<!--{elseif $volist.orderstatus=='wait'}-->
		<font color="#999999">待确认</font>
		<!--{/if}--></td>
<td align="center"><!--{if $volist.entname}--><!--{$volist.entname}--><!--{else}-->个体<!--{/if}-->（<!--{$volist.cpname}-->） </td>
<td align="center"><!--{$volist.shipuser}--></td>
<td align="center"><!--{if $volist.paystatus==0}-->
		<font color="#999999">未付款</font>
		<!--{elseif $volist.paystatus==1}-->
		<font color="#ff8000">部分付款</font>
		<!--{elseif $volist.paystatus==2}-->
		<font color="#008000">全部付款</font>
		<!--{elseif $volist.paystatus==3}-->
		<font color="#008080">部分退款</font>
		<!--{elseif $volist.paystatus==4}-->
		<font color="#ff0000">全部退款</font>
		<!--{/if}--></td>
<td align="center"><!--{if $volist.shipstatus==0}-->
		<font color="#999999">未发货</font>
		<!--{elseif $volist.shipstatus==1}-->
		<font color="#ff8000">部分发货</font>
		<!--{elseif $volist.shipstatus==2}-->
		<font color="#008000">全部发货</font>
		<!--{elseif $volist.shipstatus==3}-->
		<font color="#008080">部分退货</font>
		<!--{elseif $volist.shipstatus==4}-->
		<font color="#ff0000">全部退货</font>
		<!--{/if}--></td>
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
    <!--{/if}--></td>
</tr>
<!--{foreachelse}-->
<tr>
<td colspan="8" class="addprolistorder" align="center">暂无信息</td>
</tr>
<!--{/foreach}-->          
<!--{/if}-->
<!--{/if}-->

<!--{if $a eq 'add_goods'}-->
<tr class='itemlist' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td class='hback' align='center'> 物品<!--{$orders}--> <input type='hidden' name='item_gid_<!--{$orders}-->' id='item_gid_<!--{$orders}-->' /></td>
<td class='hback' align='center' id='item_id_<!--{$orders}-->'></td>
<td class='hback' id='item_name_<!--{$orders}-->'></td>
<td class='hback' align='center'>
<input type='text' name='item_price_<!--{$orders}-->' id='item_price_<!--{$orders}-->' class='input-s' onblur="pcdiscounts('item_oprice_<!--{$orders}-->', 'item_price_<!--{$orders}-->','item_discount_<!--{$orders}-->')" /></td>
<td class='hback' align='center'>
<input type='text' name='item_discount_<!--{$orders}-->' id='item_discount_<!--{$orders}-->' class='input-s' onblur="dcprice('item_oprice_<!--{$orders}-->', 'item_price_<!--{$orders}-->','item_discount_<!--{$orders}-->')"  />
<input type='hidden' name='item_oprice_<!--{$orders}-->' id='item_oprice_<!--{$orders}-->' /></td>
<td class='hback' align='center'><input type='text' name='item_num_<!--{$orders}-->' id='item_num_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><a href='javascript:void(0);' onclick="tbox_get_goods('查询物品', '<!--{$orders}-->')">选取产品</a>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del($(this), <!--{$orders}-->);'>移除</a></td>
</tr>
<!--{/if}-->

<!--{if $a eq 'add_quoted'}-->
<tr class='itemlists' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td class='hback' align='center'> 物品<!--{$orders}--> <input type='hidden' name='sitem_gid_<!--{$orders}-->' id='sitem_gid_<!--{$orders}-->' /></td>
<td class='hback' align='center' id='sitem_id_<!--{$orders}-->'></td>
<td class='hback' id='sitem_name_<!--{$orders}-->'></td>
<td class='hback' align='center'><input type='text' name='sitem_price_<!--{$orders}-->' id='sitem_price_<!--{$orders}-->' class='input-s' onblur="pcdiscounts('sitem_oprice_<!--{$orders}-->', 'sitem_price_<!--{$orders}-->','sitem_discount_<!--{$orders}-->')" /></td>
<td class='hback' align='center'><input type='text' name='sitem_discount_<!--{$orders}-->' id='sitem_discount_<!--{$orders}-->' class='input-s' onblur="dcprice('sitem_oprice_<!--{$orders}-->', 'sitem_price_<!--{$orders}-->','sitem_discount_<!--{$orders}-->')"  />
<input type='hidden' name='sitem_oprice_<!--{$orders}-->' id='sitem_oprice_<!--{$orders}-->' /></td>
<td class='hback' align='center'><input type='text' name='sitem_num_<!--{$orders}-->' id='sitem_num_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><input type='text' name='sitem_remarks_<!--{$orders}-->' id='sitem_remarks_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><a href='javascript:void(0);' onclick="tbox_get_quoted('查询物品', '<!--{$orders}-->')">选取产品</a>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del_quoted($(this), <!--{$orders}-->);'>移除</a></td>
</tr>
<!--{/if}-->