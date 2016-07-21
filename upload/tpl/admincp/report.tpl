<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<style>
.show{display:none}
.show div table,.show div td{ border:0}
</style>

</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>询价表管理</p></div>
  <div class="main-cont">
    <h3 class="title">询价打印表列表</h3>
    <h3 class="title">选中询价单：<span id="productnamestat"></span></h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=report" />
	  <div class="item">
	    
		<label>名称：</label><input type="text" id="sname" name="sname" size="15" class="input-150" value="<!--{$sname}-->" />&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新询价列表" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=product&a=del" method="post" name="myform" id="myform" style="margin:0">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">ID编号</div></th>
        <th width="17%"><div class="th-gap">询价单号</div></th>
		<th width="15%"><div class="th-gap">客户名称</div></th>
        <th width="8%"><div class="th-gap">审核状态</div></th>
		<th width="15%"><div class="th-gap">手机</div></th>
		<th width="20%"><div class="th-gap">邮箱</div></th>
		<th><div class="th-gap">录入时间</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $quoted as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center">
        <a href="javascript:sendadd('<!--{$volist.inquiryid}-->','<!--{$volist.pid}-->')">选择</a>
        <span><img src="<!--{$cppath}-->images/menu_plus.gif" style="cursor:pointer;" onclick="showDateil(this,<!--{$volist.i}-->)" /></span></td>
        <td align="center"><!--{$volist.inquiryid}--></td>
		<td align="center"><!--{$volist.cpname}--></td>
        <td align="center"><!--{if $volist.examine eq 2}--><font color="#009900">审核成功</font><!--{elseif $volist.examine eq 1}--><font color="#CC0000">审核失败</font><!--{else}-->未审核<!--{/if}--></td>
		<td align="center"><!--{$volist.mobile}--></td>
		<td align="center"><!--{$volist.email}--></td>
		<td align="center"><!--{$volist.addtime|date_format:"%Y/%m/%d %H:%M:%S"}--></td>
	  </tr>
      <tr class="show" id="item_<!--{$volist.i}-->">
              <td colspan="7" align="center">
               		 <div>
                   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                      <tr id="list-top">
                      <td class='hback_1' align="center" width='12%'>物品ID</td>
                      <td class='hback_1' align="center" width='30%'>物品名称</td>
                      <td class='hback_1' align="center" width='15%'>物品询价</td>
                      <td class='hback_1' align="center" width='10%'>折扣</td>
                      <td class='hback_1' align="center" width='15%'>物品数量</td>
                      <td class='hback_1' align="center">备注</td>
                    </tr>
                    <!--{foreach $volist.product as $val}-->
                    <tr>
                      <td align="center"><!--{$val.goodsid}--></td>
                      <td align="center"><!--{$val.goodsname}--></td>
                      <td align="center"><!--{$val.goodsprice}--></td>
                      <td align="center"><!--{$val.gooddiscount}--></td>
                      <td align="center"><!--{$val.goodsnum}--></td>
                      <td align="center"><!--{$val.goodsremarks}--></td>
                    </tr>
					<!--{/foreach}-->
                     <tr>
                      <td colspan='5' align="right">物品合计：</td>
                      <td align="left"><!--{$volist.goodsamount}--></td>
                    </tr>
                    </table>
                    </div>
                  </td>
             </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="7" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	 <!--{if $total>0}-->
	  <tr>
		<td class="hback" colspan="7"><input name="send" type="button" onclick="report_excel()" value="询价表生成"/>
        <input name="send" type="button" onclick="report_print()" value="询价表打印"/>&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
	  </tr>
	  <!--{/if}-->
	</table>





<!--    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
		<th width="10%"><div class="th-gap">分类</div></th>
		<th width="25%"><div class="th-gap">名称</div></th>
        <th width="8%"><div class="th-gap">市场价</div></th>
        <th width="8%"><div class="th-gap">购买价</div></th>
		<th width="8%"><div class="th-gap">品牌</div></th>
        <th width="8%"><div class="th-gap">型号</div></th>
        <th width="8%"><div class="th-gap">库存</div></th>
		<th width="11%"><div class="th-gap">发布时间</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $product as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><a href="javascript:sendadd('<!--{$volist.gdname}-->','<!--{$volist.goodsid}-->')">选择</a></td>
		<td align="left"><!--{$volist.catname}--></td>
		<td align="left">	<!--{$volist.gdname}--></td>
        <td align="center">	<!--{$volist.oprice}--></td>
        <td align="center">	<!--{$volist.bprice}--></td>
		<td align="center"><!--{if $volist.brandname}--><!--{$volist.brandname}--><!--{else}-->其它<!--{/if}--></td>
        <td align="center"><!--{if $volist.gdmodel}--><!--{$volist.gdmodel}--><!--{else}-->其它<!--{/if}--></td>
        <td align="center"><!--{if $volist.stocks}--><!--{$volist.stocks}--><!--{else}-->0<!--{/if}--></td>
		<td align="center" title="<!--{$volist.addtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.addtime|date_format:"%Y-%m-%d"}--></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="9" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td class="hback" colspan="9">
        <input name="send" type="button" onclick="report_excel()" value="询价表生成"/>
        <input name="send" type="button" onclick="report_print()" value="询价表打印"/>
        &nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
	  </tr>
	  <!--{/if}-->
	</table>
-->	</form>
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
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script language="javascript">
function sendadd(name,id,type){
	$.ajax({
		type:"POST",	   
		url :"<!--{$cpfile}-->?c=report&a=ajax",
		data:"name="+name+"&id="+id+"&type="+type,
		dataType:"JSON",
		success: function(data,textStatus){
		data = eval(data);
		$.each(data, function(index,txt){
			if(txt['ispass']=='OK'){
				$("#productnamestat").html('');
				$("#productidstat").val('');
				$.each(txt['productnamestatarr'], function(i,row){
					$("#productnamestat").append("&nbsp;&nbsp;&nbsp;<a href=\"javascript:sendadd('"+row+"','"+txt['productidstatarr'][i]+"','cancel')\">"+row+"</a>");
				});
				 
				//$.each(txt['productidstatarr'], function(i,row){
//					if(i==0){
//					 $("#productidstat").val(row);
//					 }else{
//					 	$value=$("#productidstat").val();
//					 	$("#productidstat").val($value+","+row);
//					 }
//				});
			}else{
				alert('已经添加过的');
			}
		});  
	}
	});
}


$(function(){
sendadd('','','');
});

function report_excel()
{
	
	if(confirm("确定生成excel吗？将会清空选中客户")){
		setTimeout("window.location='<!--{$cpfile}-->?c=report'", 2000 );
		window.location='<!--{$cpfile}-->?c=report&a=excel';
	}
}

function report_print()
{
	if(confirm("确定打印吗？将会清空选中客户")){
		setTimeout("window.location='<!--{$cpfile}-->?c=report'", 2000 );
		window.open('<!--{$cpfile}-->?c=report&a=print');
	}
}
function showDateil(src,n){
	var url = src.src;
	if(url.indexOf("menu_plus.gif")!=-1){
		//document.getElementById("item_"+n).style.display = "block";
		$("#item_"+n).show();
	
		src.src = url.replace("plus.gif","minus.gif");
	}else{
		document.getElementById("item_"+n).style.display = "none";
		src.src = url.replace("minus.gif","plus.gif");
	}
}

</script>