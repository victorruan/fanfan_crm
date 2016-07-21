<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>产品管理</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<link type="text/css" rel="stylesheet" media="all" href="<!--{$urlpath}-->tpl/static/js/soColorPacker/css/style.css" />
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/js/soColorPacker/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/js/soColorPacker/js/jquery.soColorPacker-1.0.js"></script>
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/js/soColorPacker/js/jquery.bgiframe-2.1.1.js"></script>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>产品列表</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="javascript:addTabs('产品录入', 'product_169', '<!--{$cpfile}-->?c=product&a=add')" class="btn-general"><span>添加内容</span></a>产品列表</h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=product" />
	  <div class="item">
	    <label>分类：</label><!--{productclass nodeid=0 value=$scatid name='scatid' text='所有分类'}-->&nbsp;&nbsp;
		<label>品牌：</label><!--{brand type='select' value=$sbrandid name='sbrandid' text='所有品牌'}-->&nbsp;&nbsp;&nbsp;
        <label>编号：</label><input type="text" id="sgdsn" name="sgdsn" size="15" class="input-150" value="<!--{$sgdsn}-->" />&nbsp;&nbsp;&nbsp;
        <label>名称：</label><input type="text" id="sname" name="sname" size="15" class="input-150" value="<!--{$sname}-->" />&nbsp;&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新产品列表" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=product&a=delList" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
        <th width="10%"><div class="th-gap">编号</div></th>
		<th width="10%"><div class="th-gap">分类</div></th>
		<th width="20%"><div class="th-gap">名称</div></th>
        <th width="10%"><div class="th-gap">缩略图</div></th>
		<th width="8%"><div class="th-gap">品牌</div></th>
        <th width="6%"><div class="th-gap">型号</div></th>
        <th width="6%"><div class="th-gap">库存</div></th>
		<th width="5%"><div class="th-gap">状态</div></th>
		<th width="8%"><div class="th-gap">发布时间</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $product as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.goodsid}-->" onClick="checkItem(this, 'chkAll')"><!--{$volist.goodsid}--> <span><img src="<!--{$cppath}-->images/menu_plus.gif" style="cursor:pointer;" onclick="showDateil(this,<!--{$volist.goodsid}-->)" /></span></td>
        <td align="center"><!--{$volist.gdsn}--></td>
		<td align="center"><!--{$volist.catname}--></td>
		<td align="center"><!--{$volist.gdname}--></td>
        <td align="center"><!--{if $volist.thumbfiles}--><img src="<!--{$volist.thumbfiles}-->" width="50" height="50"/><!--{else}-->暂无缩略图<!--{/if}--></td>
		<td align="center"><!--{if $volist.brandname}--><!--{$volist.brandname}--><!--{else}-->其它<!--{/if}--></td>
        <td align="center"><!--{if $volist.gdmodel}--><!--{$volist.gdmodel}--><!--{else}-->其它<!--{/if}--></td>
        <td align="center"><!--{if $volist.stocks}--><!--{$volist.stocks}--><!--{else}-->0<!--{/if}--></td>
		<td align="center">
		<!--{if $volist.flag==0}-->
			<input type="hidden" id="attr_list<!--{$volist.goodsid}-->" value="listopen" />
			<img id="list<!--{$volist.goodsid}-->" src="<!--{$urlpath}-->tpl/static/images/no.gif" onClick="javascript:fetch_ajax('list','<!--{$volist.goodsid}-->');" style="cursor:pointer;">
		<!--{else}-->
			<input type="hidden" id="attr_list<!--{$volist.goodsid}-->" value="listclose" />
			<img id="list<!--{$volist.goodsid}-->" src="<!--{$urlpath}-->tpl/static/images/yes.gif" onClick="javascript:fetch_ajax('list','<!--{$volist.goodsid}-->');" style="cursor:pointer;">	
		<!--{/if}-->
        </td>
		<td align="center" title="<!--{$volist.addtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.addtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center"><a href="javascript:addTabs('[<!--{$volist.gdname}-->]产品编辑<!--{$volist.goodsid}-->', 'product_169', '<!--{$cpfile}-->?c=product&a=edit&id=<!--{$volist.goodsid}-->&page=<!--{$page}-->&<!--{$urlitem}-->')" class="icon-edit">编辑</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=product&a=delList&id[]=<!--{$volist.goodsid}-->" onClick="{if(confirm('确定要删除吗？')){return true;} return false;}" class="icon-del">删除</a></td>
	  </tr>
      <tr class="show" id="item_<!--{$volist.goodsid}-->">
              <td colspan="8" align="center">
               		 <div>
                   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                      <tr>
                      <td><strong>成本价格</strong>:</td><td><!--{$volist.costrice}--></td>
                      <td><strong>市场价格</strong>:</td><td><!--{$volist.oprice}--></td>
                      <td><strong>销售价格</strong>:</td><td><!--{$volist.bprice}--></td>
                      <td><strong>颜色</strong>:</td>
                      <td><!--{if $volist.gdcolourname}--><!--{$volist.gdcolourname}-->
                           <!--{if $volist.gdcolour}-->
                           <img class="hover" style="background:<!--{$volist.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" />
                           <!--{/if}--><!--{else}-->暂无<!--{/if}-->
               		</td>
                      <td colspan="4"></td>
                     </tr>
                    </table>
                    </div>
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
		<td class="hback" colspan="10"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>添加内容</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('产品列表', 'product_169', '<!--{$cpfile}-->?c=product')" class="btn-general"><span>返回列表</span></a>添加内容</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product" onsubmit='return checkform();' />
	<input type='hidden' name='a' id='a' value='saveadd' />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">所属分类 <span class='f_red'>*</span></td>
		<td class='hback' width="85%"><!--{$category_select}--> <span id="dcatid" class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1' width="15%">所属品牌 <span class='f_red'>*</span></td>
		<td class='hback' width="85%">
        <!--{brand type='select' value=0 name='brandid' text='不选择为空'}-->
         </td>
	  </tr>
	  <tr>
		<td class='hback_1'>编号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="gdsn" id="gdsn" class="input-150" value="SN<!--{$timeline}-->" /> <span id='dgdsn' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="gdname" id="gdname" class="input-txt" /> <span id='dgdname' class='f_red'></span> 名称长度不能大于200个任意字符 </td>
	  </tr>
      <tr>
		<td class='hback_1'>颜色</td>
		<td class='hback'><input type="text" name="gdcolourname" id="gdcolourname" class="input-txt" />
        <input type="hidden" name="gdcolour" id="gdcolour"/>
        <img id="img_colorPack" class="hover" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" /></td>
	  </tr>
      <tr>
		<td class='hback_1'>型号</td>
		<td class='hback'><input type="text" name="gdmodel" id="gdmodel" class="input-txt" /> </td>
	  </tr>
      <tr>
		<td class='hback_1'>库存</td>
		<td class='hback'><input type="text" name="stocks" id="stocks" class="input-txt" /> </td>
	  </tr>
      <tr>
		<td class='hback_1'>成本价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="costrice" id="costrice" class="input-100" />元 （填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>市场价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="oprice" id="oprice" class="input-100" />元 （填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>销售价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="bprice" id="bprice" class="input-100" style="width:50px" onblur="discount()" />元
        <span class="discount" style="color:#CC0000"></span>（填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>图片地址 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="uploadfiles" id="uploadfiles" class="input-txt"  /> <span id='duploadfiles' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=uploadfiles&thumbinput=thumbfiles&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
	    </td>
	  </tr>
	  <tr>
		<td class='hback_1'>缩略图 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="thumbfiles" id="thumbfiles" class="input-txt" /> (自动生成) <span id='dthumbfiles' class='f_red'></span> </td>
			  <td><span id="previewsrc"></span></td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>内容 <span class="f_red">*</span> </td>
		<td class='hback'>
		  <textarea name="content" id="content" style="width:95%;height:280px;display:none;"></textarea>
		  <script>var editor;KindEditor.ready(function(K) {editor = K.create('#content'); });</script>
		  <span id='dcontent' class='f_red'></span>
		</td>
	  </tr>

      <tr>
		<td class='hback_yellow' colspan="2">其它附加设置 </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1" checked />正常，<input type="radio" name="flag" id="flag" value="0" />锁定</td>
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

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：产品管理<span>&gt;&gt;</span>编辑内容</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('产品列表', 'product_169', '<!--{$cpfile}-->?c=product&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>编辑内容</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=product&<!--{$comeurl}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='2' class='tab'>
 <tr>
		<td class='hback_1' width="15%">所属分类 <span class='f_red'>*</span></td>
		<td class='hback' width="85%"><!--{$category_select}--> <span id="dcatid" class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1' width="15%">所属品牌 <span class='f_red'>*</span></td>
		<td class='hback' width="85%"><!--{brand type='select' value=$data.brandid name='brandid' text='不选择为空'}--></td>
	  </tr>
	  <tr>
		<td class='hback_1'>编号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="gdsn" id="gdsn" class="input-150" value="<!--{$data.gdsn}-->" /> <span id='dgdsn' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="gdname" id="gdname" class="input-txt" value="<!--{$data.gdname}-->" /> <span id='dgdname' class='f_red'></span> 名称长度不能大于200个任意字符 </td>
	  </tr>
      <tr>
		<td class='hback_1'>颜色</td>
		<td class='hback'><input type="text" name="gdcolourname" id="gdcolourname" class="input-txt" value="<!--{$data.gdcolourname}-->" />
        <input type="hidden" name="gdcolour" id="gdcolour" value="<!--{$data.gdcolour}-->"/>
        <img id="img_colorPack" class="hover" style="background:<!--{$data.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" /></td>
	  </tr>
      <tr>
		<td class='hback_1'>型号</td>
		<td class='hback'><input type="text" name="gdmodel" id="gdmodel" class="input-txt" value="<!--{$data.gdmodel}-->" /> </td>
	  </tr>
      <tr>
		<td class='hback_1'>库存</td>
		<td class='hback'><input type="text" name="stocks" id="stocks" class="input-txt" value="<!--{$data.stocks}-->" /> </td>
	  </tr>
       <tr>
		<td class='hback_1'>成本价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="costrice" id="costrice" class="input-100" value="<!--{$data.costrice}-->" />元 （填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>市场价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="oprice" id="oprice" class="input-100" value="<!--{$data.oprice}-->"/>元 （填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>销售价格 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="bprice" id="bprice" class="input-100" value="<!--{$data.bprice}-->" />元（填写数字，最多2位小数）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>图片地址 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="uploadfiles" id="uploadfiles" class="input-txt"  /> <span id='duploadfiles' class='f_red'></span></td>
			  <td>
			  <iframe id='iframe_t' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=uploadfiles&thumbinput=thumbfiles&multipart=sf_upload&previewid=previewsrc'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
	    </td>
	  </tr>
	  <tr>
		<td class='hback_1'>缩略图 <span class="f_red"></span> </td>
		<td class='hback'>
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="thumbfiles" id="thumbfiles" class="input-txt" value="<!--{$data.thumbfiles}-->" /> (自动生成) <span id='dthumbfiles' class='f_red'></span> </td>
			  <td><span id="previewsrc"></span></td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>内容 <span class="f_red">*</span> </td>
		<td class='hback'>
		  <textarea name="content" id="content" style="width:95%;height:280px;display:none;"><!--{$data.content}--></textarea>
		  <script>var editor;KindEditor.ready(function(K) {editor = K.create('#content'); });</script>
		  <span id='dcontent' class='f_red'></span>
		</td>
	  </tr>

      <tr>
		<td class='hback_yellow' colspan="2">其它附加设置 </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1" <!--{if $data.flag=='1'}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" id="flag" value="0" <!--{if $data.flag=='0'}--> checked<!--{/if}--> />锁定</td>
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
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script type="text/javascript">
function checkform() {
	var t = "";
	var v = "";

	t = "catid";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("请选择分类", t);
		$('#'+t).focus();
		return false;
	}

	t = "gdname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("名称不能为空", t);
		$('#'+t).focus();
		return false;
	}

	t = "content";
	v = editor.text();
	if(editor.isEmpty()) {
		dmsg("内容不能为空", t);
		editor.focus();
		return false;
	}
	return true;
}
//function getBrand(parent_id,type)
//{
//	var html = '';
//	html += '<option  value=>不选择为空</option>';
//	$.ajax({
//		type:"POST",	   
//		url :"<!--{$cpfile}-->?c=product&a=getBrand",
//		data:"parent_id="+parent_id,
//		dataType:"JSON",
//		success: function(data,textStatus){
//		data = eval(data);
//		$.each(data, function(index,txt){
//		   html += '<option value='+txt['brandid']+'>'+txt['brandname']+'</option>';
//		});  
//		$("#"+type).html(html);
//		}
//	});
//}
//$("#catid").change(function(){
//  var catid=$("#catid").val();
//  getBrand(catid,"brandid");
//});
function discount(){
	var oprice=$("#oprice").val();
	var bprice=$("#bprice").val();
	//var reg = /\D+/;
//	if(reg.test(bprice)) 
//	{
//		alert("请输入正确数字");
//		$(".discount").html('');
//		$("#bprice").focus();
//		$("#bprice").select();
//		return false;
//	}else{
		var discount;
		var value;
		value=(parseFloat(bprice)/parseFloat(oprice));
		discount=(parseFloat(value)).toFixed(2);
		$(".discount").html(discount);
	//}
}

$('#img_colorPack').soColorPacker({changeTarget:'#gdcolour',selfBgChange:true});

</script>