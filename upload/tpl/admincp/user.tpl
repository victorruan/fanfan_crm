<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>客户管理</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>客户资料</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="javascript:addTabs('客户录入', 'customers', '<!--{$cpfile}-->?c=user&a=add')" class="btn-general"><span>添加客户</span></a><!--{if $sview == 1}-->
	企业客户资料
	<!--{elseif $sview == 2}-->
	个体客户资料
	<!--{else}-->
	客户资料列表
	<!--{/if}--></h3>
	<div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=user&sview=<!--{$sview}-->" />
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
	<form action="<!--{$cpfile}-->?c=user&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">选择</div></th>
		<th width="10%"><div class="th-gap">客户名称</div></th>
		<th width="15%"><div class="th-gap">邮箱</div></th>
		<th width="10%"><div class="th-gap">手机</div></th>
		<th width="10%"><div class="th-gap">主体</div></th>
        <th width="10%"><div class="th-gap">客户组</div></th>
		<th width="10%"><div class="th-gap">注册时间</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $corp as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><input name="id[]" type="checkbox" value="<!--{$volist.cpid}-->" onClick="checkItem(this, 'chkAll')"><!--{$volist.cpid}--></td>
		<td align="left"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.email}--></td>
		<td align="left"><!--{$volist.mobile}--></td>
		<td align="center"><!--{if $volist.rootid neq 0}--><!--{$volist.entname}--><!--{else}-->个人<!--{/if}--></td>
        <td align="center"><!--{if $volist.groupname}--><!--{$volist.groupname}--><!--{else}-->~<!--{/if}--></td>
		<td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
		<td align="center">
        <a href="javascript:void(0);" onclick="tbox_addmoney('添加客户帐号现金', '<!--{$volist.cpid}-->');" class="icon-add">添加现金</a>&nbsp;
		<a href="javascript:addTabs('[<!--{$volist.cpname}-->]客户编辑<!--{$volist.cpid}-->', 'customers', '<!--{$cpfile}-->?c=user&a=edit&id=<!--{$volist.cpid}-->&page=<!--{$page}-->&<!--{$urlitem}-->')" class="icon-edit">编辑</a>&nbsp;<a href="<!--{$cpfile}-->?c=user&a=del&id[]=<!--{$volist.cpid}-->" onClick="{if(confirm('确定要删除吗？')){return true;} return false;}" class="icon-del">删除</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="8" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	  <!--{if $total>0}-->
	  <tr>
		<td align="center"><input name="chkAll" type="checkbox" id="chkAll" onClick="checkAll(this, 'id[]')" value="checkbox"></td>
		<td class="hback" colspan="7"><input class="button" name="btn_del" type="button" value="删 除" onClick="{if(confirm('确定要删除吗？')){$('#myform').submit();return true;}return false;}" class="button">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
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
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>添加客户</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('客户资料', 'customers', '<!--{$cpfile}-->?c=user')" class="btn-general"><span>返回列表</span></a>添加客户</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=user" onsubmit='return checkform();' autocomplete="off" />
	<input type='hidden' name='a' id='a' value='saveadd' />
	<table cellpadding='1' cellspacing='1' class='tab' align="left" style="width:45%">
     <tr>
		<td class='hback_c1' colspan="2">个人信息</td>
	  </tr>
      <tr>
		<td class='hback_1' width="25%">类型 <span class="f_red">*</span> </td>
		<td class='hback'><!--{$type_select}--> <span id='dtype' class='f_red'></span></td>
	  </tr>
      
      <tr id="entnameinfo" style="display:none">
		<td class='hback_1'>请填写企业名称 <span class="f_red">*</span> </td>
		<td class='hback'>
        	<style>
                #suggestions{ position: relative; left:2px; top:-0px; width:300px; display:none;}
                #searchresults { border-width:1px; border-color:#919191; border-style:solid; width:300px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
                #searchresults span.searchdata { display:block; font-weight:bold; padding-top:5px; font-size:12px; color:#F00; background-color:#e4e4e4 }
                #searchresults span.title { display:block; font-size:12px; margin:5px; display:block;cursor:pointer }
				#searchresults span.titles { background:#FF0000}
                #searchresults span.company{ display:block; background-color:#e4e4e4}
                </style>    
               <input type="text" class="reg_input" name="entname" id="entname"  onkeyup="lookup(event,this.value);"/> 
        <div style="position:absolute"><div id="suggestions"></div> </div>
        <span id='dentname' class='f_red'></span></td>
	  </tr>
      <tr id="didinfo">
		<td class='hback_1'>属于企业</td>
		<td class='hback'><!--{$entselect}--> <span id='dtype' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>客户名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="cpname" id="cpname"  /><span id='dcpname' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>手机号码 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="mobile" id="mobile"/>  <span id='dmobile' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>邮箱 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="email" id="email"/>  <span id='demail' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>客户折扣等级</td>
		<td class='hback'><!--{$discountselect}--> </td>
	  </tr>
       <tr>
		<td class='hback_1'>所属会员组 <span class="f_red"></span> </td>
		<td class='hback'><!--{$group_select}--> <span id='dgroupid' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>客户编号</td>
		<td class='hback'><input type="text" name="cpno" id="cpno"  /> <span id='dcpno' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>地区 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="address" id="address"/>  <span id='daddress' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>工作电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="hotline" id="hotline"/>  <span id='dhotline' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>传真号码 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="fax" id="fax"/>  <span id='dfax' class='f_red'></span></td>
	  </tr>
      <tr>
      	<td></td>
		<td class='hback_none'><input type="button" id="tijiao" name="btn_save" class="button" value="添加保存" />
	  </tr>
      </table>
      <table cellpadding='1' cellspacing='1' class='tab'  align="left" style="width:50%">
      <tr>
		<td class='hback_c2' colspan="2">其它信息</td>
	  </tr>
      <tr>
		<td class='hback_1'>职务 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="position" id="position"/>  <span id='dposition' class='f_red'></span></td>
	  </tr>
       
      <tr>
		<td class='hback_1'>助记简称 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="indexname" id="indexname" style="width:40%;height:60px;overflow:auto;"></textarea> 
        <span id='dindexname' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>详细介绍 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="intro" id="intro" style="width:40%;height:60px;overflow:auto;"></textarea>
        		<span id='dintro' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>备注 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="remark" id="remark"/>  <span id='dremark' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>QQ号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="qq" id="qq"/>  <span id='dqq' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>MSN <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="msn" id="msn"/>  <span id='dmsn' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>淘宝旺旺 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="wangwang" id="wangwang"/>  <span id='dwangwang' class='f_red'></span></td>
	  </tr>
	 <tr>
		<td class='hback_1'>SKYPE <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="skype" id="skype"/>  <span id='dskype' class='f_red'></span></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>编辑客户</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('客户资料', 'customers', '<!--{$cpfile}-->?c=user&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>编辑客户</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=user&<!--{$comeurl}-->" onsubmit='return checkedit();' autocomplete="off"  />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab' align="left" style="width:45%">
	  <tr>
		<td class='hback_c1' colspan="2">个人信息</td>
	  </tr>
      <tr>
		<td class='hback_1' width="25%">类型 <span class="f_red">*</span> </td>
		<td class='hback'>个人<input type="hidden" name="type" id="type" value="2"/><span id='dtype' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>属于企业</td>
		<td class='hback'><!--{$entselect}--> <span id='dtype' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>客户名称 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="cpname" id="cpname" value="<!--{$corp.cpname}-->"/><span id='dcpname' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>手机号码 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="mobile" id="mobile" value="<!--{$corp.mobile}-->"/>  <span id='dmobile' class='f_red'></span></td>
	  </tr>
     <tr>
		<td class='hback_1'>邮箱 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="email" id="email" value="<!--{$corp.email}-->"/>  <span id='demail' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>客户折扣等级</td>
		<td class='hback'><!--{$discountselect}--> </td>
	  </tr>
      <tr>
		<td class='hback_1'>所属会员组 <span class="f_red"></span> </td>
		<td class='hback'><!--{$group_select}--> <span id='dgroupid' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>客户编号  </td>
		<td class='hback'><input type="text" name="cpno" id="cpno" value="<!--{$corp.cpno}-->"/> <span id='dcpno' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>地区 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="address" id="address" value="<!--{$corp.address}-->"/>  <span id='daddress' class='f_red'></span></td>
	  </tr>
      <tr>
		<td class='hback_1'>工作电话 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="hotline" id="hotline" value="<!--{$corp.hotline}-->"/>  <span id='dhotline' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>传真号码 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="fax" id="fax" value="<!--{$corp.fax}-->"/>  <span id='dfax' class='f_red'></span></td>
	  </tr>
       
      	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>

      </table>
      <table cellpadding='1' cellspacing='1' class='tab'  align="left" style="width:50%">
      <tr>
		<td class='hback_c2' colspan="2">其它信息</td>
	  </tr>
      <tr>
		<td class='hback_1'>职务 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="position" id="position" value="<!--{$corp.position}-->"/>  <span id='dposition' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>助记简称 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="indexname" id="indexname" style="width:40%;height:60px;overflow:auto;"><!--{$corp.indexname}--></textarea> 
        <span id='dindexname' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>详细介绍 <span class="f_red"></span> </td>
		<td class='hback'><textarea name="intro" id="intro" style="width:40%;height:60px;overflow:auto;"><!--{$corp.intro}--></textarea>
        		<span id='dintro' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>备注 <span class="f_red"></span> </td>
		<td class='hback'>
        <input type="text" name="remark" id="remark" value="<!--{$corp.remark}-->"/><span id='dremark' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>QQ号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="qq" id="qq"  value="<!--{$corp.qq}-->"/>  <span id='dqq' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>MSN <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="msn" id="msn" value="<!--{$corp.msn}-->"/>  <span id='dmsn' class='f_red'></span></td>
	  </tr>
       <tr>
		<td class='hback_1'>淘宝旺旺 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="wangwang" id="wangwang" value="<!--{$corp.wangwang}-->"/>  <span id='dwangwang' class='f_red'></span></td>
	  </tr>
	 <tr>
		<td class='hback_1'>SKYPE <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="skype" id="skype" value="<!--{$corp.skype}-->"/>  <span id='dskype' class='f_red'></span></td>
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
	
	t = "type";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("请选择类型", t);
			$('#'+t).focus();
			return false;
		}
		
	t = "cpname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("客户名称不能为空", t);
		$('#'+t).focus();
		return false;
	}
	var typeid=$("#type").val();
	if(typeid==1){
		t = "entname";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("企业类型企业名称不能为空", t);
			$('#'+t).focus();
			return false;
		}
	}
	t = "mobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("手机号码不能为空", t);
		$('#'+t).focus();
		return false;
	}else{
	   var pass= checktelephone(t);
	   if(!pass){
	   		dmsg("手机号码不正确", t);
			$('#'+t).focus();
			return false;
	   }
	}
	
	t = "email";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("邮箱不能为空", t);
		$('#'+t).focus();
		return false;
	}else{
	   var ispass= isEmail(v);
	   if(!ispass){
	   		dmsg("邮箱格式不正确", t);
			$('#'+t).focus();
			return false;
	   }
	}
	
	return true;
}

function checkedit() {
	var t = "";
	var v = "";
	
	t = "type";
		v = $("#"+t).val();
		if(v=="") {
			dmsg("请选择类型", t);
			$('#'+t).focus();
			return false;
		}
		
	t = "cpname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("客户名称不能为空", t);
		$('#'+t).focus();
		return false;
	}
	
	t = "mobile";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("手机号码不能为空", t);
		$('#'+t).focus();
		return false;
	}else{
	   var pass= checktelephone(t);
	   if(!pass){
	   		dmsg("手机号码不正确", t);
			$('#'+t).focus();
			return false;
	   }
	}
	
	t = "email";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("邮箱不能为空", t);
		$('#'+t).focus();
		return false;
	}else{
	   var ispass= isEmail(v);
	   if(!ispass){
	   		dmsg("邮箱格式不正确", t);
			$('#'+t).focus();
			return false;
	   }
	}
	
	return true;
}

<!--{if $a eq "add"}-->
$(function(){
entchange(1);
});
<!--{/if}-->

$("#tijiao").click(function(){
$("#myform").submit();
 });

</script>