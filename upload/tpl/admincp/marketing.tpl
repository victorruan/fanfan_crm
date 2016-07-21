<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：营销管理<span>&gt;&gt;</span>群发邮件</p></div>
  <div class="main-cont">
    <h3 class="title">群发邮件</h3>
     <h3 class="title">选中群发客户：<span id="namestat"></span></h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=marketing" />
	  <div class="item">
	    <label>企业名称：</label><input type="text" id="sentname" name="sentname" class="input-80" value="<!--{$sentname}-->" />&nbsp;&nbsp;
		<label>客户名称：</label><input type="text" id="scpname" name="scpname" class="input-80" value="<!--{$scpname}-->" />&nbsp;&nbsp;
		<label>邮箱：</label><input type="text" id="semail" name="semail" class="input-80" value="<!--{$semail}-->" />&nbsp;&nbsp;
		<label>电话：</label><input type="text" id="shotline" name="shotline" class="input-80" value="<!--{$shotline}-->" />&nbsp;&nbsp;
		<label>手机：</label><input type="text" id="smobile" name="smobile" class="input-80" value="<!--{$smobile}-->" />&nbsp;&nbsp;
		<input type="submit" class="button_s" value="搜 索" />
	  </div>
	  </form>
	</div>
	<form action="<!--{$cpfile}-->?c=user&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
		<th width="20%"><div class="th-gap">客户名称</div></th>
		<th width="20%"><div class="th-gap">邮箱</div></th>
		<th width="20%"><div class="th-gap">手机</div></th>
		 <th width="10%"><div class="th-gap">主体</div></th>
		<th width="10%"><div class="th-gap">注册时间</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $corp as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
		<td align="center"><!--{$volist.cpname}--></td>
        <td align="center"><!--{$volist.email}--></td>
		<td align="center"><!--{$volist.mobile}--></td>
		<td align="center"><!--{if $volist.rootid neq 0}--><!--{$volist.entname}--><!--{else}-->个人<!--{/if}--></td>
		<td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center">
        <a href="javascript:sendadd('<!--{$volist.cpname}-->','<!--{$volist.cpid}-->')">加入群发</a>
        <a href="javascript:sendadd('<!--{$volist.cpname}-->','<!--{$volist.cpid}-->','cancel')">取消改用户群发</a>
        </td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
      <input name="idstat" id="idstat" type="hidden" value="" />
		
	  <!--{if $total>0}-->
	  <tr>
		<td class="hback" colspan="6"><input name="send" type="button" value="发送选中客户邮件" onclick="tbox_sendemail('发送内容')" />&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
<!--{if $a eq "sendemail"}-->
  <div class="main-cont">
  <h3 class="title">发送邮件页面</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=marketing" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="sendadd" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='18%'>邮件主题 <span class="f_red">*</span> </td>
		<td class='hback' width='82%'><input type="text" name="subject" id="subject" class="input-txt" /> <span id='dsubject' class='f_red'></span> </td>
	  </tr>
      <tr>
		<td class='hback_1' width='15%'>模板选择<span class="f_red">*</span> </td>
		<td class='hback' width='85%'>
        <select name="m_tpl" id="m_tpl">
          <option value="">可选择模板</option>
          <!--{$mailtpl}-->
        </select>
        </td>
	  </tr>
	  <tr>
		<td class='hback_1'>邮件内容 <span class="f_red">*</span></td>
		<td class='hback'>
		  <textarea name="content" id="content" style="width:95%;height:280px;display:none;"></textarea>
		  <script>var editor;
		KindEditor.ready(function(K) {
		editor = K.create('#content');
		$("#m_tpl").change(function () { 
			var val=$("#m_tpl").val();
				$.ajax({
						type:"POST",	   
						url :"<!--{$cpfile}-->",
						data:"c=marketing&a=ajaxtpl&tplid="+val,
						dataType:"JSON",
						success: function(data,textStatus){
							data = eval(data);
							$.each(data, function(index,txt){
								if(txt['tplid']!=0)
								{
									editor.html(txt['content']);
								}else{
									editor.html('');
								}
							});
						}
					});
			 });
		});
        </script>
		  <span id='dcontent' class='f_red'></span>{username} 客户名称</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="添加保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
<!--{/if}-->



<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script language="javascript">
function sendadd(name,id,type){
	$.ajax({
		type:"POST",	   
		url :"<!--{$cpfile}-->?c=marketing&a=ajax",
		data:"name="+name+"&id="+id+"&type="+type,
		dataType:"JSON",
		success: function(data,textStatus){
		data = eval(data);
		$.each(data, function(index,txt){
			if(txt['ispass']=='OK'){
				$("#namestat").html('');
				$("#idstat").val('');
				$.each(txt['namestatarr'], function(i,row){
					$("#namestat").append("&nbsp;&nbsp;&nbsp;<a href=\"javascript:sendadd('"+row+"','"+txt['idstatarr'][i]+"','cancel')\">"+row+"</a>");
				});
				 
				//$.each(txt['idstatarr'], function(i,row){
//					if(i==0){
//					 $("#idstat").val(row);
//					 }else{
//					 	$value=$("#idstat").val();
//					 	$("#idstat").val($value+","+row);
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
</script>