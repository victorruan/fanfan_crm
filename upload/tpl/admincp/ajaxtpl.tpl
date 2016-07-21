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
<td class='hback' align='center'> 物品<!--{$orders}--> <input type='hidden' name='item_gid_<!--{$orders}-->' id='item_gid_<!--{$orders}-->' />
<input type='hidden' name='item_sid_<!--{$orders}-->' id='item_sid_<!--{$orders}-->' /></td>
<td class='hback' align='center' id='item_id_<!--{$orders}-->'></td>
<td class='hback' id='item_name_<!--{$orders}-->'></td>
<td class='hback' id='item_norms_<!--{$orders}-->'></td>
<input type='hidden' name='item_normsstr_<!--{$orders}-->' id='item_normsstr_<!--{$orders}-->' />
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
<td class='hback' align='center'> 物品<!--{$orders}--> <input type='hidden' name='sitem_gid_<!--{$orders}-->' id='sitem_gid_<!--{$orders}-->' /><input type='hidden' name='sitem_sid_<!--{$orders}-->' id='sitem_sid_<!--{$orders}-->' /></td>
<td class='hback' align='center' id='sitem_id_<!--{$orders}-->'></td>
<td class='hback' id='sitem_name_<!--{$orders}-->'></td>
<td class='hback' id='sitem_norms_<!--{$orders}-->'></td>
<input type='hidden' name='sitem_normsstr_<!--{$orders}-->' id='sitem_normsstr_<!--{$orders}-->' />
<td class='hback' align='center'><input type='text' name='sitem_price_<!--{$orders}-->' id='sitem_price_<!--{$orders}-->' class='input-s' onblur="pcdiscounts('sitem_oprice_<!--{$orders}-->', 'sitem_price_<!--{$orders}-->','sitem_discount_<!--{$orders}-->')" /></td>
<td class='hback' align='center'><input type='text' name='sitem_discount_<!--{$orders}-->' id='sitem_discount_<!--{$orders}-->' class='input-s' onblur="dcprice('sitem_oprice_<!--{$orders}-->', 'sitem_price_<!--{$orders}-->','sitem_discount_<!--{$orders}-->')"  />
<input type='hidden' name='sitem_oprice_<!--{$orders}-->' id='sitem_oprice_<!--{$orders}-->' /></td>
<td class='hback' align='center'><input type='text' name='sitem_num_<!--{$orders}-->' id='sitem_num_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><input type='text' name='sitem_remarks_<!--{$orders}-->' id='sitem_remarks_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><a href='javascript:void(0);' onclick="tbox_get_quoted('查询物品', '<!--{$orders}-->')">选取产品</a>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del_quoted($(this), <!--{$orders}-->);'>移除</a></td>
</tr>
<!--{/if}-->
<!--{if $a eq 'add_album'}-->
<tr class='imglist'>
<td class='hback_1'><a href='javascript:void(0);' onclick='album_countnums();album_del($(this),<!--{$orders}-->);'>删除</a> 图片<!--{$orders}--></td>
<td class='hback'>
<table border='0' cellspacing='0' cellpadding='0'>
<tr>
<td colspan='2'>
排序：<input name='imgorders_<!--{$orders}-->' id='imgorders_<!--{$orders}-->' type='text' class='input-s' value='<!--{$orders}-->' />&nbsp;图片描述：<input name='imgname_<!--{$orders}-->' id='imgname_<!--{$orders}-->' type='text' class='input-150' />&nbsp;
</td>
</tr>
<tr>
<td>
图片地址：<input name='imgurl_<!--{$orders}-->' id='imgurl_<!--{$orders}-->' type='text' class='input-200' /><input type='hidden' name='imgthumb_<!--{$orders}-->' id='imgthumb_<!--{$orders}-->' value='' />
</td>
<td>
<iframe id='iframe_t_<!--{$orders}-->' border='0' frameborder='0' scrolling='no' style='width:260px;height:25px;padding:0px;margin:0px;' src='<!--{$cpfile}-->?c=upload&module=product&formname=myform&uploadinput=imgurl_<!--{$orders}-->&thumbinput=imgthumb_<!--{$orders}-->&multipart=sf_upload_<!--{$orders}-->&previewid=imgpreview_<!--{$orders}-->'></iframe>
</td>
</tr>
</table>
<span id='imgpreview_<!--{$orders}-->'></span>
</td>
</tr>
<!--{/if}-->
<!--{if $a eq 'add_norms'}-->
<tr class='itemlists' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td class='hback' align='center'> 规格<!--{$orders}--> 
<td class='hback' align='center'><input type='text' name='sitem_nname_<!--{$orders}-->' id='sitem_nname_<!--{$orders}-->' class='input-s' /></td>
<td class='hback' align='center'><input type='text' name='sitem_nalias_<!--{$orders}-->' id='sitem_nalias_<!--{$orders}-->' class='input-s' /></td>
<td>
图片地址：<input name='imgurl_<!--{$orders}-->' id='imgurl_<!--{$orders}-->' type='hidden' class='input-200' />
<span id='imgpreview_<!--{$orders}-->'></span>
<input type='hidden' name='imgthumb_<!--{$orders}-->' id='imgthumb_<!--{$orders}-->' value='' />
<iframe id='iframe_t_<!--{$orders}-->' border='0' frameborder='0' scrolling='no' style='width:260px;height:25px;padding:0px;margin:0px;' src='<!--{$cpfile}-->?c=upload&module=product&formname=myform&uploadinput=imgurl_<!--{$orders}-->&thumbinput=imgthumb_<!--{$orders}-->&multipart=sf_upload_<!--{$orders}-->&previewid=imgpreview_<!--{$orders}-->'></iframe>
</td>
<td>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del_norms($(this), <!--{$orders}-->);'>移除</a></td>
</tr>
<!--{/if}-->

<!--{if $a eq 'add_normsval'}-->
<tr class='allspcies species_<!--{$nid}--> itemlists_<!--{$num}-->' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
<td class='hback' align='center'> <!--{$val}--> <input type='hidden' name='sitem_normsnname_<!--{$num}-->' id='sitem_normsnname_<!--{$num}-->' class='input-s' value='<!--{$val}-->' />
<td class='hback' align='center'><input type='text' name='sitem_nname_<!--{$num}-->' id='sitem_nname_<!--{$num}-->' class='input-s' value='<!--{$val}-->' /></td>
<td>
图片地址：<input name='imgurl_<!--{$num}-->' id='imgurl_<!--{$num}-->' type='hidden' class='input-200' />
<span id='imgpreview_<!--{$num}-->'></span>
<input type='hidden' name='imgthumb_<!--{$num}-->' id='imgthumb_<!--{$num}-->' value='' />
<iframe id='iframe_t_<!--{$num}-->' border='0' frameborder='0' scrolling='no' style='width:260px;height:25px;padding:0px;margin:0px;' src='<!--{$cpfile}-->?c=upload&module=product&formname=myform&uploadinput=imgurl_<!--{$num}-->&thumbinput=imgthumb_<!--{$num}-->&multipart=sf_upload_<!--{$num}-->&previewid=imgpreview_<!--{$num}-->'></iframe>
</td>
<td>
&nbsp;&nbsp;<a href='javascript:void(0);' onclick='item_countnums();item_del_normsval("<!--{$num}-->");'>移除</a></td>
</tr>
<!--{/if}-->
<!--{if $a eq 'handle'}-->
    <style type="text/css">
        /*sssssssssssss*/.window_top
        {
            padding: 10px;
        }
        .window_main
        {
            margin: 10px;
            font-family: 微软雅黑;
            font-size: 13px;
        }
        .window_main_left
        {
            border: 1px solid #e1e1e1;
            padding: 10px;
            float: left;
            width: 20%;
            overflow-x: hidden;
            overflow-y: auto;
            bottom: 50px;
            height: 100%;
        }
        .window_main_right
        {
            overflow: auto; position:relative;
        }
        .window_main_top
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
        }
        .window_main_second
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
            margin-top: 10px;
        }
        .window_table
        {
            width: 100%;
            margin-top: 10px;
            line-height: 30px;
            text-align: center;
        }
        .window_table tr td
        {
            border-right: 1px solid #e1e1e1;
            padding: 0px 10px;
        }
        .window_main_content
        {
            border: 1px solid #e1e1e1;
        }
    </style>
    <div class="window_main">
        <div class="window_main_right">
            <table class="window_table" cellpadding="0" cellspacing="0">
                <tr class="window_main_second">
                    <td style="width:150px;">货号 </td>
                    <!--{foreach $namearr as $key=>$val}-->
                    <td style="width:100px;">
                    <select onchange="changenorms(<!--{$key}-->,this.value)">
                      <!--{foreach $normslist as $vals}-->
                      <option value="<!--{$vals.nid}-->" <!--{if $val eq $vals.nname}--> selected="selected"<!--{/if}-->><!--{$vals.nname}--></option>
                      <!--{/foreach}-->
                    </select>
                    </td>
                    <!--{/foreach}-->
                    <td style="width:100px;">颜色</td>
                    <td style="width:100px;">型号</td>
                    <td style="width:100px;">库存</td>
                    <td style="width:100px;">成本价格</td>
                    <td style="width:100px;">市场价格</td>
                     <td style="width:100px;">销售价格</td>
                     <td style="width:100px;">操作</td>
                </tr>
                <!--{foreach $list as $key=>$val}-->
                <tr class="window_main_content">
                   <td><input type='text' name='artno_<!--{$key}-->' id="artno_<!--{$key}-->" class='input-s artnolist' value='<!--{$val.artno}-->' /></td>
                    <!--{foreach $val.normsnalias as $keys=>$vals}-->
          <td><input type='text' name='normsnalias_<!--{$key}-->_<!--{$keys}-->' class='input-s normsnaliaslist' id="normsnalias_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals}-->' /></td>
                    <!--{/foreach}-->
                     <!--{foreach $val.normsnname as $keys=>$vals}-->
                    <input type='hidden' name='normsnname_<!--{$key}-->_<!--{$keys}-->' id="normsnname_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals}-->' />
                    <!--{/foreach}-->
                    <!--{foreach $val.imgurl as $keys=>$vals}-->
                    <input type='hidden' name='imgurl_<!--{$key}-->_<!--{$keys}-->' id="imgurl_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals}-->' />
                    <!--{/foreach}-->
                    <!--{foreach $val.imgthumb as $keys=>$vals}-->
                    <input type='hidden' name='imgthumb_<!--{$key}-->_<!--{$keys}-->' id="imgthumb_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals}-->' />
                    <!--{/foreach}-->
                    <td><input type='text' name='gdcolourname_<!--{$key}-->' id="gdcolourname_<!--{$key}-->" class='input-s gdcolournamelist' value='<!--{$val.gdcolourname}-->' />
                     <input type="text" style="display:none" name="gdcolour_<!--{$key}-->" id="gdcolour_<!--{$key}-->" value='<!--{$val.gdcolour}-->'/>
        <img id="img_colorPack_<!--{$key}-->" class="hover" style="background:<!--{$val.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                    </td>
				<script type="text/javascript">
                $('#img_colorPack_<!--{$key}-->').soColorPacker({changeTarget:'#gdcolour_<!--{$key}-->',selfBgChange:true});
                </script>
                    <td><input type='text' name='gdmodel_<!--{$key}-->' id="gdmodel_<!--{$key}-->" class='input-s gdmodellist' value='<!--{$val.gdmodel}-->' /></td>
                    <td><input type='text' name='stocks_<!--{$key}-->' id="stocks_<!--{$key}-->" class='input-s stockslist' value='<!--{$val.stocks}-->' /></td>
                    <td><input type='text' name='costrice_<!--{$key}-->' id="costrice_<!--{$key}-->" class='input-s costricelist' value='<!--{$val.costrice}-->' /></td>
                    <td><input type='text' name='oprice_<!--{$key}-->' id="oprice_<!--{$key}-->" class='input-s opricelist' value='<!--{$val.oprice}-->' /></td>
                    <td><input type='text' name='bprice_<!--{$key}-->' id="bprice_<!--{$key}-->" class='input-s bpricelist' value='<!--{$val.bprice}-->' /></td>
                    <td><a href="javascript:void(0)" onclick="del_normsonemeg($(this),<!--{$key}-->)">移除</a></td>
                 </tr> 
                 <!--{/foreach}-->
              <tr>
			  <td align="right" colspan="8"><a href="javascript:void(0);" onclick="return normsonemeg_add();">添加</a>
              <span id="load_itemtipss"></span> &nbsp;&nbsp;</td>
			</tr>
            </table>
        </div>
    </div>
<!--{/if}-->
<!--{if $normsedittpl eq 'editnorms'}-->
    <style type="text/css">
        /*sssssssssssss*/.window_top
        {
            padding: 10px;
        }
        .window_main
        {
            margin: 10px;
            font-family: 微软雅黑;
            font-size: 13px;
        }
        .window_main_left
        {
            border: 1px solid #e1e1e1;
            padding: 10px;
            float: left;
            width: 20%;
            overflow-x: hidden;
            overflow-y: auto;
            bottom: 50px;
            height: 100%;
        }
        .window_main_right
        {
            overflow: auto; position:relative;
        }
        .window_main_top
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
        }
        .window_main_second
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
            margin-top: 10px;
        }
        .window_table
        {
            width: 100%;
            margin-top: 10px;
            line-height: 30px;
            text-align: center;
        }
        .window_table tr td
        {
            border-right: 1px solid #e1e1e1;
            padding: 0px 10px;
        }
        .window_main_content
        {
            border: 1px solid #e1e1e1;
        }
    </style>
    <div class="window_main">
        <div class="window_main_right">
            <table class="window_table" cellpadding="0" cellspacing="0">
                <tr class="window_main_second">
                    <td style="width:150px;">货号 </td>
                    <!--{foreach $namearr as $key=>$val}-->
                    <td style="width:100px;">
                    <select onchange="changenorms(<!--{$key}-->,this.value)">
                      <!--{foreach $normslist as $vals}-->
                      <option value="<!--{$vals.nid}-->" <!--{if $val eq $vals.nname}--> selected="selected"<!--{/if}-->><!--{$vals.nname}--></option>
                      <!--{/foreach}-->
                    </select>
                    </td>
                    <!--{/foreach}-->
                    <td style="width:100px;">颜色</td>
                    <td style="width:100px;">型号</td>
                    <td style="width:100px;">库存</td>
                    <td style="width:100px;">成本价格</td>
                    <td style="width:100px;">市场价格</td>
                    <td style="width:100px;">销售价格</td>
                    <td style="width:100px;">操作</td>
                </tr>
                <!--{foreach $list as $key=>$val}-->
                <tr class="window_main_content">
                	<input type='hidden' name='sid_<!--{$key}-->' id="sid_<!--{$key}-->" value='<!--{$val.sid}-->' />
                   <td><input type='text' name='artno_<!--{$key}-->' id="artno_<!--{$key}-->" class='input-s artnolist' value='<!--{$val.artno}-->' /></td>
                    <!--{foreach $val.norms as $keys=>$vals}-->
          <td><input type='text' name='normsnalias_<!--{$key}-->_<!--{$keys}-->' class='input-s normsnaliaslist' id="normsnalias_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals.normsnalias}-->' /></td>
      <input type='hidden' name='normsnname_<!--{$key}-->_<!--{$keys}-->' id="normsnname_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals.normsnname}-->' />
   <input type='hidden' name='imgurl_<!--{$key}-->_<!--{$keys}-->' id="imgurl_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals.imgurl}-->' />
   <input type='hidden' name='imgthumb_<!--{$key}-->_<!--{$keys}-->' id="imgthumb_<!--{$key}-->_<!--{$keys}-->" value='<!--{$vals.imgthumb}-->' />
                    <!--{/foreach}-->
                    <td><input type='text' name='gdcolourname_<!--{$key}-->' id="gdcolourname_<!--{$key}-->" class='input-s gdcolournamelist' value='<!--{$val.gdcolourname}-->' />
                     <input type="text" style="display:none" name="gdcolour_<!--{$key}-->" id="gdcolour_<!--{$key}-->" value='<!--{$val.gdcolour}-->'/>
        <img id="img_colorPack_<!--{$key}-->" class="hover" style="background:<!--{$val.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                    </td>
				<script type="text/javascript">
                $('#img_colorPack_<!--{$key}-->').soColorPacker({changeTarget:'#gdcolour_<!--{$key}-->',selfBgChange:true});
                </script>
                    <td><input type='text' name='gdmodel_<!--{$key}-->' id="gdmodel_<!--{$key}-->" class='input-s gdmodellist' value='<!--{$val.gdmodel}-->' /></td>
                    <td><input type='text' name='stocks_<!--{$key}-->' id="stocks_<!--{$key}-->" class='input-s stockslist' value='<!--{$val.stocks}-->' /></td>
                    <td><input type='text' name='costrice_<!--{$key}-->' id="costrice_<!--{$key}-->" class='input-s costricelist' value='<!--{$val.costrice}-->' /></td>
                    <td><input type='text' name='oprice_<!--{$key}-->' id="oprice_<!--{$key}-->" class='input-s opricelist' value='<!--{$val.oprice}-->' /></td>
                    <td><input type='text' name='bprice_<!--{$key}-->' id="bprice_<!--{$key}-->" class='input-s bpricelist' value='<!--{$val.bprice}-->' /></td>
                    <td><a href="javascript:void(0)" onclick="del_normsonemeg($(this),<!--{$key}-->,<!--{$val.locks}-->)">移除</a></td>
                 </tr> 
                 <!--{/foreach}-->
              <tr>
			  <td align="right" colspan="8"><a href="javascript:void(0);" onclick="return normsonemeg_add();">添加</a>
              <span id="load_itemtipss"></span> &nbsp;&nbsp;</td>
			</tr>
            </table>
        </div>
    </div>
<!--{/if}-->
<!--{if $normsedittpl eq 'listnorms'}-->
    <style type="text/css">
        /*sssssssssssss*/.window_top
        {
            padding: 10px;
        }
        .window_main
        {
            margin: 10px;
            font-family: 微软雅黑;
            font-size: 13px;
        }
        .window_main_left
        {
            border: 1px solid #e1e1e1;
            padding: 10px;
            float: left;
            width: 20%;
            overflow-x: hidden;
            overflow-y: auto;
            bottom: 50px;
            height: 100%;
        }
        .window_main_right
        {
            overflow: auto; position:relative;
        }
        .window_main_top
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
        }
        .window_main_second
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
            margin-top: 10px;
        }
        .window_table
        {
            width: 100%;
            margin-top: 10px;
            line-height: 30px;
            text-align: center;
        }
        .window_table tr td
        {
            border-right: 1px solid #e1e1e1;
            padding: 0px 10px;
        }
        .window_main_content
        {
            border: 1px solid #e1e1e1;
        }
    </style>
    <div class="window_main">
        <div class="window_main_right">
            <table class="window_table" cellpadding="0" cellspacing="0">
                <tr class="window_main_second">
                    <td style="width:150px;">货号 </td>
                    <!--{if $namearr}-->
                    <!--{foreach $namearr as $val}-->
                    <td style="width:100px;"><!--{$val}--></td>
                    <!--{/foreach}-->
                    <!--{/if}-->
                    <td style="width:100px;">颜色</td>
                    <td style="width:100px;">型号</td>
                    <td style="width:100px;">库存</td>
                    <td style="width:100px;">成本价格</td>
                    <td style="width:100px;">市场价格</td>
                     <td style="width:100px;">销售价格</td>
                </tr>
                <!--{foreach $list as $key=>$val}-->
                <tr class="window_main_content">
                   <td><!--{$val.artno}--></td>
                   <!--{if $val.norms}-->
                    <!--{foreach $val.norms as $keys=>$vals}-->
          <td><!--{$vals.normsnalias}--></td>
                    <!--{/foreach}-->
                    <!--{/if}-->
                    <td><!--{$val.gdcolourname}-->
        <img id="img_colorPack_<!--{$key}-->" class="hover" style="background:<!--{$val.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                    </td>
				
                    <td><!--{$val.gdmodel}--></td>
                    <td><!--{$val.stocks}--></td>
                    <td><!--{$val.costrice}--></td>
                    <td><!--{$val.oprice}--></td>
                    <td><!--{$val.bprice}--></td>
                 </tr> 
                 <!--{/foreach}-->
            </table>
        </div>
    </div>
<!--{/if}-->

<!--{if $normsedittpl eq 'quotedsearchnorms'}-->
    <style type="text/css">
        /*sssssssssssss*/.window_top
        {
            padding: 10px;
        }
        .window_main
        {
            margin: 10px;
            font-family: 微软雅黑;
            font-size: 13px;
        }
        .window_main_left
        {
            border: 1px solid #e1e1e1;
            padding: 10px;
            float: left;
            width: 20%;
            overflow-x: hidden;
            overflow-y: auto;
            bottom: 50px;
            height: 100%;
        }
        .window_main_right
        {
            overflow: auto; position:relative;
        }
        .window_main_top
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
        }
        .window_main_second
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
            margin-top: 10px;
        }
        .window_table
        {
            width: 100%;
            margin-top: 10px;
            line-height: 30px;
            text-align: center;
        }
        .window_table tr td
        {
            border-right: 1px solid #e1e1e1;
            padding: 0px 10px;
        }
        .window_main_content
        {
            border: 1px solid #e1e1e1;
        }
    </style>
    <div class="window_main">
        <div class="window_main_right">
            <table class="window_table" cellpadding="0" cellspacing="0">
                <tr class="window_main_second">
                    <td style="width:150px;">货号 </td>
                    <!--{if $namearr}-->
                    <!--{foreach $namearr as $val}-->
                    <td style="width:100px;"><!--{$val}--></td>
                    <!--{/foreach}-->
                    <!--{/if}-->
                    <td style="width:100px;">颜色</td>
                    <td style="width:100px;">型号</td>
                    <td style="width:100px;">库存</td>
                    <td style="width:100px;">成本价格</td>
                    <td style="width:100px;">市场价格</td>
                     <td style="width:100px;">销售价格</td>
                     <td style="width:100px;">选择</td>
                </tr>
                <!--{foreach $list as $key=>$val}-->
                <tr class="window_main_content">
                   <td><!--{$val.artno}--></td>
                   <!--{if $val.norms}-->
                    <!--{foreach $val.norms as $keys=>$vals}-->
          <td><!--{$vals.normsnalias}--></td>
                    <!--{/foreach}-->
                    <!--{/if}-->
                    <td><!--{$val.gdcolourname}-->
        <img id="img_colorPack_<!--{$key}-->" class="hover" style="background:<!--{$val.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                    </td>
				
                    <td><!--{$val.gdmodel}--></td>
                    <td><!--{$val.stocks}--></td>
                    <td><!--{$val.costrice}--></td>
                    <td><!--{$val.oprice}--></td>
                    <td><!--{$val.bprice}--></td>
                    <td><a href="javascript:void(0);" onclick="select_goods('<!--{$sortid}-->', '<!--{$goodsid}-->','<!--{$val.sid}-->','<!--{$gdname}-->','<!--{$val.guigename}-->', '<!--{$val.bprice}-->','<!--{$val.oprice}-->','<!--{if $val.oprice neq 0}--><!--{(($val.bprice / $val.oprice))|string_format:"%.2f"}--><!--{else}-->0<!--{/if}-->')">选择</a></td>
                 </tr> 
                 <!--{/foreach}-->
            </table>
        </div>
    </div>
<!--{/if}-->

<!--{if $a eq 'normsonemeg_add'}-->
                <tr class="window_main_content">
                   <td><input type='text' name='artno_<!--{$key}-->' id="artno_<!--{$key}-->" class='input-s artnolist'/></td>
                    <!--{foreach $normsnum as $i}-->
          <td><input type='text' name='normsnalias_<!--{$key}-->_<!--{$i}-->' class='input-s normsnaliaslist' id="normsnalias_<!--{$key}-->_<!--{$i}-->"/></td>
      <input type='hidden' name='normsnname_<!--{$key}-->_<!--{$i}-->' id="normsnname_<!--{$key}-->_<!--{$i}-->"/>
   <input type='hidden' name='imgurl_<!--{$key}-->_<!--{$i}-->' id="imgurl_<!--{$key}-->_<!--{$i}-->"/>
   <input type='hidden' name='imgthumb_<!--{$key}-->_<!--{$i}-->' id="imgthumb_<!--{$key}-->_<!--{$i}-->"/>
                    <!--{/foreach}-->
     <td><input type='text' name='gdcolourname_<!--{$key}-->' id="gdcolourname_<!--{$key}-->" class='input-s gdcolournamelist' />
         <input type="text" style="display:none" name="gdcolour_<!--{$key}-->" id="gdcolour_<!--{$key}-->"/>
        <img id="img_colorPack_<!--{$key}-->" class="hover"  src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                    </td>
				<script type="text/javascript">
                $('#img_colorPack_<!--{$key}-->').soColorPacker({changeTarget:'#gdcolour_<!--{$key}-->',selfBgChange:true});
                </script>
                    <td><input type='text' name='gdmodel_<!--{$key}-->' id="gdmodel_<!--{$key}-->" class='input-s gdmodellist'/></td>
                    <td><input type='text' name='stocks_<!--{$key}-->' id="stocks_<!--{$key}-->" class='input-s stockslist'/></td>
                    <td><input type='text' name='costrice_<!--{$key}-->' id="costrice_<!--{$key}-->" class='input-s costricelist'/></td>
                    <td><input type='text' name='oprice_<!--{$key}-->' id="oprice_<!--{$key}-->" class='input-s opricelist'/></td>
                    <td><input type='text' name='bprice_<!--{$key}-->' id="bprice_<!--{$key}-->" class='input-s bpricelist'/></td>
                    <td><a href="javascript:void(0)" onclick="del_normsonemeg($(this),<!--{$key}-->)">移除</a></td>
                 </tr> 

<!--{/if}-->