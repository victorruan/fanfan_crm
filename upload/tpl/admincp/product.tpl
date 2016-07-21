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
              <td colspan="10" align="center">
               		 <div>
                   		<!--{$volist.itemlist}-->
                    </div>
                  </td>
             </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="10" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="9"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
    <div id="bottun_show"></div>
    <input type='hidden' name='normstotalnum' id="normstotalnum" value='0' />
    <input type='hidden' name='idarr' id="idarr" value='0' />
    <input type='hidden' name='normsidstr' id="normsidstr" value='0'/>
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">所属分类 <span class='f_red'>*</span></td>
		<td class='hback' width="85%"><!--{$category_select}--> <span id="dcatid" class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1' width="15%">所属品牌 <span class='f_red'></span></td>
		<td class='hback' width="85%">
        <!--{brand type='select' value=0 name='brandid' text='不选择为空'}-->
         </td>
	  </tr>
	  <tr class="norms_bottun">
		<td class='hback_1'>编号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="gdsn" id="gdsn" class="input-150" value="SN<!--{$timeline}-->" /> <span id='dgdsn' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="gdname" id="gdname" class="input-txt" /> <span id='dgdname' class='f_red'></span> 名称长度不能大于200个任意字符 </td>
	  </tr>
     <tr class="norms_bottun">
		<td class='hback_1'>颜色 <span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="gdcolourname" id="gdcolourname" class="input-txt" />
        <input type="text" style="display:none" name="gdcolour" id="gdcolour"/>
        <img id="img_colorPack" class="hover" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" /> <span id='dgdcolourname' class='f_red'></span></td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>型号 <span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="gdmodel" id="gdmodel" class="input-txt" />  <span id='dgdmodel' class='f_red'></span></td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>货号 <span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="artno" id="artno" class="input-txt" /> <span id='dartno' class='f_red'></span> </td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>库存 <span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="stocks" id="stocks" class="input-txt" />  <span id='dstocks' class='f_red'></span></td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>成本价格 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="costrice" id="costrice" class="input-100" />元 （填写数字，最多2位小数） <span id='dcostrice' class='f_red'></span></td>
	  </tr>
	  <tr class="norms_bottun">
		<td class='hback_1'>市场价格 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="oprice" id="oprice" class="input-100" />元 （填写数字，最多2位小数） <span id='doprice' class='f_red'></span></td>
	  </tr>
	  <tr class="norms_bottun">
		<td class='hback_1'>销售价格 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="bprice" id="bprice" class="input-100" style="width:50px" onblur="discount()" />元
        <span class="discount" style="color:#CC0000"></span>（填写数字，最多2位小数） <span id='dbprice' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>规格 <span class="f_red"></span> </td>
		<td class='hback'><input name="norms"  id="norms" type="button" value="开启规格" onclick="tbox_get_norms('规格选择窗口')" />
        				<input id="colsenorms" name="colsenorms" style="display:none" type="button" value="关闭规格" onclick="colsenormsaa()" /></td>
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
		 <!--{if !empty($modattr)}-->
	  <tr>
		<td class='hback_yellow' colspan="2">扩展字段 </td>
	  </tr>
	  <!--{foreach $modattr as $volist}-->
	  <tr>
		<td class='hback_1'><!--{$volist.fieldtext}--> 
		<span class="f_red"><!--{if $volist.isvalid==1}-->*<!--{/if}--></span> 
		</td>
		<td class='hback'>
		<!--{if $volist.fieldtype=='radio' || $volist.fieldtype=='checkbox' || $volist.fieldtype=='select'}-->
		<!--{$volist.attr_select}-->
		<!--{/if}-->
		<!--{if $volist.fieldtype=='text'}-->
		<input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" class="input-<!--{$volist.attrwidth}-->" /> 
		<!--{/if}-->
		<!--{if $volist.fieldtype=='textarea'}-->
		<textarea name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" style="width:<!--{$volist.attrwidth}-->%;height:<!--{$volist.attrheight}-->px;overflow:auto;"></textarea> 
		<!--{/if}-->

		<!--{if $volist.fieldtype=='img'}-->
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" class="input-txt" /></td>
			  <td>
			  <iframe id='iframe_attr_<!--{$volist.fieldid}-->' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=attr_<!--{$volist.fieldid}-->&multipart=sf_attr_<!--{$volist.fieldid}-->'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
		<!--{/if}-->

		<!--{if $volist.fieldtype=='attchment'}-->
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" class="input-txt" /></td>
			  <td>
			  <iframe id='iframe_attr_<!--{$volist.fieldid}-->' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=attchment&uploadinput=attr_<!--{$volist.fieldid}-->&multipart=sf_attr_<!--{$volist.fieldid}-->'></iframe>
			  </td>
			</tr>
		  </table>
		  上传文件只支持：rar, zip, tar, gz压缩格式
		<!--{/if}-->
		<span id='dattr_<!--{$volist.fieldid}-->' class='f_red'></span>
		</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{/if}-->
        <tr>
		<td class='hback_yellow' colspan="2">SEO优化相关设置 </td>
	  </tr>
	  <tr>
		<td class='hback_1'>TAG标签 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="tags" id="tags" class="input-txt" /> 
		<span id='dtags' class='f_red'></span>
		(多个标签请用","隔开，会自动关联链接)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>Meta关键字 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="metakeyword" id="metakeyword" class="input-txt" /> <span id='dmetakeyword' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>Meta描述 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="metadescription" id="metadescription" style="width:50%;height:60px;overflow:auto;"></textarea>  <span id='dmetadescription' class='f_red'></span> </td>
	  </tr>
        
      <tr>
		<td class='hback_yellow' colspan="2">其它附加设置 </td>
	  </tr>
	 <!-- <tr>
	    <td class='hback_1'>访问权限 <span class='f_red'></span></td>
		<td><!--{$purview_select}--> <span id='dpurview' class='f_red'></span></td>
	  </tr>-->
	  <tr>
	    <td class='hback_1'>设置 <span class='f_red'></span></td>
		<td><input type="checkbox" name="istop" id="istop" value="1" />置顶，<input type="checkbox" name="elite" id="elite" value="1" />推荐</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1" checked />正常，<input type="radio" name="flag" id="flag" value="0" />锁定</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>发布时间 <span class='f_red'></span></td>
		<td><input type="text" name="addtime" id="addtime" class="input-150" value="<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='daddtime' class='f_red'></span> 当前时间为：<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}--> 注意不要改变格式。</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>浏览次数 <span class='f_red'></span></td>
		<td><input type="text" name="hits" id="hits" class="input-s" /> <span id='dhits' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>链接类型 <span class='f_red'></span></td>
		<td><input type="radio" name="linktype" id="linktype" value="1" checked />内部，<input type="radio" name="linktype" id="linktype" value="2" />外部 URL地址：<input type="text" name="linkurl" id="linkurl" class="input-txt" /> <span id='dlinkurl' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>评论状态 <span class='f_red'></span></td>
		<td><input type="radio" name="iscomment" id="iscomment" value="1" checked />允许，<input type="radio" name="iscomment" id="iscomment" value="0" />禁止 <span id='discomment' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>订购状态 <span class='f_red'></span></td>
		<td><input type="radio" name="isorder" id="isorder" value="1" />开启，<input type="radio" name="isorder" id="isorder" value="0" checked />关闭 <span id='discomment' class='f_red'></span> </td>
	  </tr>
	  <tr id="list-top">
		<td class='hback_yellow' colspan="2">
		相册管理  您可以添加多张图片，如需前台显示，TPL模板必须支持相册框排版。 上传图片只支持：gif,jpeg,jpg,png格式
		<input name='imgmaxsort' type='hidden' value='0' />
		</td>
	  </tr>
      
	  <tr> 
	    <td class="hback_1"></td>
		<td class='hback'>
		<a href="javascript:void(0);" onclick="return album_add($(this),'product');">添加展示图片</a>
		<span id="load_imgtips"></span></td>
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
    <input type="hidden" name="sid" value="<!--{$data.sid}-->" />
    <div id="bottun_show"><!--{$data.itemlist}--></div>
    <input type='hidden' name='normstotalnum' id="normstotalnum" value='<!--{$data.normstotalnum}-->' />
    <input type='hidden' name='idarr' id="idarr" value='<!--{$data.idarr}-->' />
    <input type='hidden' name='normsidstr' id="normsidstr" value='<!--{$data.normsidstr}-->'/>

	<table cellpadding='1' cellspacing='2' class='tab'>
 <tr>
		<td class='hback_1' width="15%">所属分类 <span class='f_red'>*</span></td>
		<td class='hback' width="85%"><!--{$category_select}--> <span id="dcatid" class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1' width="15%">所属品牌 <span class='f_red'></span></td>
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
      <tr class="norms_bottun">
		<td class='hback_1'>颜色<span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="gdcolourname" id="gdcolourname" class="input-txt" value="<!--{$data.gdcolourname}-->" />
        <input type="text" name="gdcolour" style="display:none" id="gdcolour" value="<!--{$data.gdcolour}-->"/>
        <img id="img_colorPack" class="hover" style="background:<!--{$data.gdcolour}-->" src="<!--{$urlpath}-->tpl/static/images/color.gif" alt="" /><span id='dgdcolourname' class='f_red'></span></td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>型号<span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="gdmodel" id="gdmodel" class="input-txt" value="<!--{$data.gdmodel}-->" /><span id='dgdmodel' class='f_red'></span> </td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>货号<span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="artno" id="artno" class="input-txt" value="<!--{$data.gdmodel}-->" /> <span id='dartno' class='f_red'></span></td>
	  </tr>
      <tr class="norms_bottun">
		<td class='hback_1'>库存<span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="stocks" id="stocks" class="input-txt" value="<!--{$data.stocks}-->" /><span id='dstocks' class='f_red'></span> </td>
	  </tr>
       <tr class="norms_bottun">
		<td class='hback_1'>成本价格<span class="f_red">*</span></td>
		<td class='hback'><input type="text" name="costrice" id="costrice" class="input-100" value="<!--{$data.costrice}-->" />元 （填写数字，最多2位小数）<span id='dcostrice' class='f_red'></span></td>
	  </tr>
	  <tr class="norms_bottun">
		<td class='hback_1'>市场价格 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="oprice" id="oprice" class="input-100" value="<!--{$data.oprice}-->"/>元 （填写数字，最多2位小数）<span id='doprice' class='f_red'></span></td>
	  </tr>
	  <tr class="norms_bottun">
		<td class='hback_1'>销售价格 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="bprice" id="bprice" class="input-100" value="<!--{$data.bprice}-->" />元（填写数字，最多2位小数）<span id='dbprice' class='f_red'></span></td>
	  </tr>
<!--            <tr>
		<td class='hback_1'>规格 <span class="f_red"></span> </td>
		<td class='hback'><input name="norms"  id="norms" type="button" value="开启规格" onclick="tbox_get_norms('规格选择窗口')" />
        				<input id="colsenorms" name="colsenorms" style="display:none" type="button" value="关闭规格" onclick="colsenormsaa()" /></td>
	  </tr>
-->
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
<!--{if !empty($modattr)}-->
	  <tr>
		<td class='hback_yellow' colspan="2">扩展字段 </td>
	  </tr>
	  <!--{foreach $modattr as $volist}-->
	  <tr>
		<td class='hback_1'><!--{$volist.fieldtext}--> 
		<span class="f_red"><!--{if $volist.isvalid==1}-->*<!--{/if}--></span> 
		</td>
		<td class='hback'>
		<!--{if $volist.fieldtype=='radio' || $volist.fieldtype=='checkbox' || $volist.fieldtype=='select'}-->
		<!--{$volist.attr_select}-->
		<!--{/if}-->
		<!--{if $volist.fieldtype=='text'}-->
		<input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" value="<!--{$volist.fieldvalue}-->" class="input-<!--{$volist.attrwidth}-->" /> 
		<!--{/if}-->
		<!--{if $volist.fieldtype=='textarea'}-->
		<textarea name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" style="width:<!--{$volist.attrwidth}-->%;height:<!--{$volist.attrheight}-->px;overflow:auto;"><!--{$volist.fieldvalue}--></textarea> 
		<!--{/if}-->

		<!--{if $volist.fieldtype=='img'}-->
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" value="<!--{$volist.fieldvalue}-->" class="input-txt" /></td>
			  <td>
			  <iframe id='iframe_attr_<!--{$volist.fieldid}-->' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=product&uploadinput=attr_<!--{$volist.fieldid}-->&multipart=sf_attr_<!--{$volist.fieldid}-->'></iframe>
			  </td>
			</tr>
		  </table>
		  上传图片只支持：gif,jpeg,jpg,png格式
		<!--{/if}-->

		<!--{if $volist.fieldtype=='attchment'}-->
		  <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			  <td><input type="text" name="attr_<!--{$volist.fieldid}-->" id="attr_<!--{$volist.fieldid}-->" value="<!--{$volist.fieldvalue}-->" class="input-txt" /></td>
			  <td>
			  <iframe id='iframe_attr_<!--{$volist.fieldid}-->' border='0' frameborder='0' scrolling='no' style="width:260px;height:25px;padding:0px;margin:0px;" src='<!--{$cpfile}-->?c=upload&formname=myform&module=attchment&uploadinput=attr_<!--{$volist.fieldid}-->&multipart=sf_attr_<!--{$volist.fieldid}-->'></iframe>
			  </td>
			</tr>
		  </table>
		  上传文件只支持：rar, zip, tar, gz压缩格式
		<!--{/if}-->

		<span id='dattr_<!--{$volist.fieldid}-->' class='f_red'></span>
		</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{/if}-->

	  <tr>
		<td class='hback_yellow' colspan="2">SEO优化相关设置 </td>
	  </tr>
	  <tr>
		<td class='hback_1'>TAG标签 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="tags" id="tags" class="input-txt" value="<!--{$data.tags}-->" /> 
		<span id='dtags' class='f_red'></span>
		(多个标签请用","隔开，会自动关联链接)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>Meta关键字 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="metakeyword" id="metakeyword" class="input-txt" value="<!--{$data.metakeyword}-->" /> <span id='dmetakeyword' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>Meta描述 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="metadescription" id="metadescription" style="width:50%;height:60px;overflow:auto;"><!--{$data.metadescription}--></textarea>  <span id='dmetadescription' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_yellow' colspan="2">其它附加设置 </td>
	  </tr>
	  <!--<tr>
	    <td class='hback_1'>访问权限 <span class='f_red'></span></td>
		<td><!--{$purview_select}--> <span id='dpurview' class='f_red'></span></td>
	  </tr>-->
	  <tr>
	    <td class='hback_1'>设置 <span class='f_red'></span></td>
		<td><input type="checkbox" name="istop" id="istop" value="1"<!--{if $data.istop==1}--> checked<!--{/if}--> />置顶，<input type="checkbox" name="elite" id="elite" value="1"<!--{if $data.elite==1}--> checked<!--{/if}--> />推荐</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>状态 <span class='f_red'></span></td>
		<td><input type="radio" name="flag" id="flag" value="1"<!--{if $data.flag==1}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" id="flag" value="0"<!--{if $data.flag==0}--> checked<!--{/if}--> />锁定</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>发布时间 <span class='f_red'></span></td>
		<td><input type="text" name="addtime" id="addtime" class="input-150" value="<!--{$data.addtime|date_format:"%Y-%m-%d %H:%M:%S"}-->" /> <span id='daddtime' class='f_red'></span> 当前时间为：<!--{$timeline|date_format:"%Y-%m-%d %H:%M:%S"}--> 注意不要改变格式。</td>
	  </tr>
	  <tr>
	    <td class='hback_1'>浏览次数 <span class='f_red'></span></td>
		<td><input type="text" name="hits" id="hits" class="input-s" value="<!--{$data.hits}-->" /> <span id='dhits' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>链接类型 <span class='f_red'></span></td>
		<td><input type="radio" name="linktype" id="linktype" value="1"<!--{if $data.linktype==1}--> checked<!--{/if}--> />内部，<input type="radio" name="linktype" id="linktype" value="2"<!--{if $data.linktype==2}--> checked<!--{/if}--> />外部 URL地址：<input type="text" name="linkurl" id="linkurl" class="input-txt" value="<!--{$data.linkurl}-->" /> <span id='dlinkurl' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>评论状态 <span class='f_red'></span></td>
		<td><input type="radio" name="iscomment" id="iscomment" value="1"<!--{if $data.iscomment==1}--> checked<!--{/if}--> />允许，<input type="radio" name="iscomment" id="iscomment" value="0"<!--{if $data.iscomment==0}--> checked<!--{/if}--> />禁止 <span id='discomment' class='f_red'></span> </td>
	  </tr>
	  <tr>
	    <td class='hback_1'>订购状态 <span class='f_red'></span></td>
		<td><input type="radio" name="isorder" id="isorder" value="1"<!--{if $data.isorder==1}--> checked<!--{/if}--> />开启，<input type="radio" name="isorder" id="isorder" value="0"<!--{if $data.isorder==0}--> checked<!--{/if}--> />关闭 <span id='discomment' class='f_red'></span> </td>
	  </tr>

	  <tr id="list-top">
		<td class='hback_yellow' colspan="2">
		相册管理  您可以添加多张图片，如需前台显示，TPL模板必须支持相册框排版。 上传图片只支持：gif,jpeg,jpg,png格式
		<input name='imgmaxsort' type='hidden' value='<!--{$data.gallery_num}-->' />
		</td>
	  </tr>

	  <!-- 循环读取已相册 -->
	  <!--{if !empty($data.gallery)}-->
	  <!--{foreach $data.gallery as $album}-->
	  <tr class='imglist'>
	    <td class='hback_1'><a href='javascript:void(0);' onclick='album_countnums();album_del($(this), <!--{$album.i}-->);'>删除</a> 图片<!--{$album.i}--></td>
		<td class='hback'>
		  <table border='0' cellspacing='0' cellpadding='0'>
		    <tr>
			  <td colspan='2'>
			    排序：<input name='imgorders_<!--{$album.i}-->' id='imgorders_<!--{$album.i}-->' type='text' class='input-s' value='<!--{$album.imgorders}-->' />&nbsp;
                图片描述：<input name='imgname_<!--{$album.i}-->' id='imgname_<!--{$album.i}-->' type='text' class='input-150' value="<!--{$album.imgname}-->" />
			  </td>
			</tr>
			<tr>
			  <td>
			    图片地址：<input name='imgurl_<!--{$album.i}-->' id='imgurl_<!--{$album.i}-->' type='text' class='input-200' value="<!--{$album.imgurl}-->" />
				<input type='hidden' name='imgthumb_<!--{$album.i}-->' id='imgthumb_<!--{$album.i}-->' value="<!--{$album.imgthumb}-->" />
			  </td>
			  <td>
			    <iframe id='iframe_t_<!--{$album.i}-->' border='0' frameborder='0' scrolling='no' style='width:260px;height:25px;padding:0px;margin:0px;' src='<!--{$cpfile}-->?c=upload&module=product&formname=myform&uploadinput=imgurl_<!--{$album.i}-->&thumbinput=imgthumb_<!--{$album.i}-->&multipart=sf_upload_<!--{$album.i}-->&previewid=imgpreview_<!--{$album.i}-->'></iframe>
			  </td>
			</tr>
		  </table>
		  <span id='imgpreview_<!--{$album.i}-->'><img src="<!--{$urlpath}--><!--{$album.imgthumb}-->" width="60px" height="60px" /></span>
		</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{/if}-->

	  <tr> 
	    <td class="hback_1"></td>
		<td class='hback'>
		<a href="javascript:void(0);" onclick="return album_add($(this), 'product');">添加展示图片</a>
		<span id="load_imgtips"></span></td>
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
	
	var normstotalnum=$("#normstotalnum").val();
	if(normstotalnum==0){
		t = "gdcolourname";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("颜色不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "gdmodel";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("型号不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "artno";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("货号不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "stocks";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("库存不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "costrice";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("成本价不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "oprice";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("市场价不能为空", t);
			$('#'+t).focus();
			return false;
		}
		t = "bprice";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("销售不能为空", t);
			$('#'+t).focus();
			return false;
		}
	}else{
	
	    var artnolist=true;
		$(".artnolist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("货号不能为空");
				$(this).focus();
				artnolist=false;
				return false;
				}
		});
		if(!artnolist){
			return false;
		}
		var normsnaliaslist=true;
		$(".normsnaliaslist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("规格不能为空");
				$(this).focus();
				normsnaliaslist=false;
				return false;
				}
		});
		if(!normsnaliaslist){
			return false;
		}
		var gdcolournamelist=true;
		$(".gdcolournamelist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("颜色不能为空");
				$(this).focus();
				gdcolournamelist=false;
				return false;
				}
		});
		if(!gdcolournamelist){
			return false;
		}
		
		var gdmodellist=true;
		$(".gdmodellist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("型号不能为空");
				$(this).focus();
				gdmodellist=false;
				return false;
				}
		});
		if(!gdmodellist){
			return false;
		}
		
		var stockslist=true;
		$(".stockslist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("库存不能为空");
				$(this).focus();
				stockslist=false;
				return false;
				}
		});
		if(!stockslist){
			return false;
		}
		
		var costricelist=true;
		$(".costricelist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("成本价不能为空");
				$(this).focus();
				costricelist=false;
				return false;
				}
		});
		if(!costricelist){
			return false;
		}
		
		var opricelist=true;
		$(".opricelist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("市场价不能为空");
				$(this).focus();
				opricelist=false;
				return false;
				}
		});
		if(!opricelist){
			return false;
		}
		
		var bpricelist=true;
		$(".bpricelist").each(function(i){
		      v=$(this).val();
			  if(v=="") {
				alert("销售价不能为空");
				$(this).focus();
				bpricelist=false;
				return false;
				}
		});
		if(!bpricelist){
			return false;
		}
		
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

function discount(){
	var oprice=$("#oprice").val();
	var bprice=$("#bprice").val();
		var discount;
		var value;
		value=(parseFloat(bprice)/parseFloat(oprice));
		discount=(parseFloat(value)).toFixed(2);
		$(".discount").html(discount);
}

$('#img_colorPack').soColorPacker({changeTarget:'#gdcolour',selfBgChange:true});

function colsenormsaa(){
	$(".norms_bottun").show();
	$("#bottun_show").hide();
	$("#colsenorms").hide();
	$("#normstotalnum").val(0);
	$("#idarr").val(0);
	$("#normsidstr").val(0);
}
<!--{if $data.multiple eq 1}-->
$(".norms_bottun").hide();
$("#colsenorms").show();
<!--{/if}-->

//改变计数器
function changenorms(key,id){
	var normsidstr=$("#normsidstr").val();
	var normsidstrarr= new Array(); 
	normsidstrarr=normsidstr.split(","); 
	var str='';
	for (i=0;i<normsidstrarr.length ;i++ )    
	{    
		if(key==i){
			normsidstrarr[i]=id;
		}
		if(str){
			str+=','+normsidstrarr[i];
		}else{
			str+=normsidstrarr[i];
		}
	} 
	$("#normsidstr").val(str);
}



</script>