<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>查询物品</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
</head>
<style>
.show{display:none}
.show div table,.show div td{ border:0}
</style>

<body>
<!--{if $a eq "search"}-->
<div class="main-wrap">
  <div class="main-cont">
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=quoted&a=search&sortid=<!--{$sortid}-->" />
	  <div class="item">
       <label>所属分类：</label><!--{$category_select}--> &nbsp;&nbsp;&nbsp;
	    <label>物品名称：</label><input type="text" id="sname" name="sname" size="15" class="input-150" value="<!--{$sname}-->" />&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />
	  </div>
	  </form>
	</div>
    <h3 class="title">最近浏览的分类：<!--{$rbData}--></h3>
    <h3 class="title">下级分类：<!--{$classlist}--></h3>
 <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
        <th><div class="th-gap">编号</div></th>
		<th width="15%"><div class="th-gap">分类</div></th>
		<th width="15%"><div class="th-gap">名称</div></th>
        <th width="10%"><div class="th-gap">缩略图</div></th>
		<th width="15%"><div class="th-gap">品牌</div></th>
        <th width="8%"><div class="th-gap">库存</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $product as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.goodsid}--> <span><img src="<!--{$cppath}-->images/menu_plus.gif" style="cursor:pointer;" onclick="showDateil(this,<!--{$volist.goodsid}-->)" /></span></td>
        <td align="center"><!--{$volist.gdsn}--></td>
		<td align="center"><!--{$volist.catname}--></td>
		<td align="center"><!--{$volist.gdname}--></td>
        <td align="center"><!--{if $volist.thumbfiles}--><img src="<!--{$volist.thumbfiles}-->" width="50" height="50"/><!--{else}-->暂无缩略图<!--{/if}--></td>
		<td align="center"><!--{if $volist.brandname}--><!--{$volist.brandname}--><!--{else}-->其它<!--{/if}--></td>
        <td align="center"><!--{if $volist.stocks}--><!--{$volist.stocks}--><!--{else}-->0<!--{/if}--></td>
	  </tr>
      <tr class="show" id="item_<!--{$volist.goodsid}-->">
              <td colspan="7" align="center">
               		 <div>
                   		<!--{$volist.itemlist}-->
                    </div>
                  </td>
             </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="7" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->	</table>
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
function select_goods(sortid,goodsid,sid,gdname,norms, price,oprice,discount) {
    window.parent.$('#item_gid_'+sortid).val(goodsid);
	window.parent.$('#item_sid_'+sortid).val(sid);
	window.parent.$('#item_id_'+sortid).html(goodsid);
	window.parent.$('#item_name_'+sortid).html(gdname);
	window.parent.$('#item_norms_'+sortid).html(norms);
	window.parent.$('#item_normsstr_'+sortid).val(norms);
	window.parent.$('#item_price_'+sortid).val(price);
	window.parent.$('#item_oprice_'+sortid).val(oprice);
	window.parent.$('#item_discount_'+sortid).val(discount);
	window.parent.$('#item_num_'+sortid).val(1);
	window.parent.tb_remove();
}
</script>