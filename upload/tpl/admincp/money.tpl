<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>现金记录</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{if $fromtype == 'jdbox'}-->
<!--{else}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<!--{/if}-->
</head>
<body>
<!--{if $fromtype == 'jdbox'}-->
<!--{else}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{/if}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>现金记录</p></div>
  <div class="main-cont">
    <h3 class="title">现金记录</h3>

	<div class="search-area3">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=money" />
	  <div class="item">
	  <label>客户ID&nbsp;</label><input type="text" name="suserid" id="suserid" value="<!--{if $suserid>0}--><!--{$suserid}--><!--{/if}-->" class="input-s" />&nbsp;
	  <label>客户名称&nbsp;</label><input type="text" name="susername" id="susername" value="<!--{$susername}-->" class="input-s" />&nbsp;
	  <label>操作记录&nbsp;</label><input type="text" name="stext" id="stext" value="<!--{$stext}-->" class="input-s" />&nbsp;
      <label>操作时间&nbsp;</label><input type="text" name="sdate" id="sdate" value="<!--{$sdate}-->"  readonly onClick="WdatePicker();" class="input-s" />&nbsp;~~ &nbsp;&nbsp;<input type="text" name="edate" id="edate" value="<!--{$edate}-->"  readonly onClick="WdatePicker();" class="input-s" />&nbsp;
	  &nbsp;&nbsp;&nbsp;<input type="submit" class="button_s" value="搜索" />
      </div>
	  </form>
	</div>

    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">客户ID</div></th>
		<th width="15%"><div class="th-gap">客户名称</div></th>
		<th width="17%"><div class="th-gap">操作时间</div></th>
		<th width="10%"><div class="th-gap">增加</div></th>
		<th width="10%"><div class="th-gap">减少</div></th>
		<th><div class="th-gap">操作记录</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $money as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.cpid}--></td>
		<td align="center"><!--{$volist.cpname}--></td>
		<td align="left"><!--{$volist.timeline|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
		<td align="center"><!--{if $volist.actiontype==1}--><font color='green'><!--{$volist.amount}--></font><!--{/if}--></td>
		<td align="left"><!--{if $volist.actiontype==2}--><font color='red'><!--{$volist.amount}--></font><!--{/if}--></td>
		<td align="left"><!--{$volist.logcontent}--></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
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
<!--{/if}-->

<!--{if $a eq "add"}-->
<div class="main-wrap">
  
  <!--{if $fromtype != 'jdbox'}-->
  <div class="path"><p>当前位置：客户管理<span>&gt;&gt;</span>添加现金记录</p></div>
  <!--{/if}-->

  <div class="main-cont">
    
	<!--{if $fromtype != 'jdbox'}-->
	<h3 class="title"><a href="<!--{$cpfile}-->?c=money" class="btn-general"><span>返回列表</span></a>添加现金记录</h3>
	<!--{/if}-->

    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=money&fromtype=<!--{$fromtype}-->" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<input type="hidden" name="cpid" value="<!--{$user.cpid}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
		<td class='hback_1' width='15%'>客户ID <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$user.cpid}--> </td>
		<td class='hback_1' width='15%'>客户名称 <span class="f_red"></span> </td>
		<td class='hback' width='35%'><!--{$user.cpname}--> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>剩余积分 <span class="f_red"></span> </td>
		<td class='hback'><!--{$user.points}--> </td>
		<td class='hback_1'>现金余额 <span class="f_red"></span> </td>
		<td class='hback'><!--{$user.money}--> </td>
	  </tr>
	  <tr>
		<td class='hback_1'>现金去向 <span class="f_red">*</span> </td>
		<td class='hback'>
		  <select name="actiontype" id="actiontype">
		  <option value=''>请选择</option>
		  <option value='1'>增加</option>
		  <option value='2'>减少</option>
		  </select>
		  <span id='dactiontype' class='f_red'></span> 
		</td>
		<td class='hback_1'>操作金额 <span class="f_red">*</span> </td>
		<td class='hback'><input type="text" name="amount" id="amount" class="input-s" /><span id='damount' class='f_red'></span> (填写数字,最多2位小数.)
		</td>
	  </tr>
	  <tr>
		<td class='hback_1'>关联订单号 <span class="f_red"></span> </td>
		<td class='hback'><input type="text" name="ordernum" id="ordernum" class="input-150" />  <span id='dordernum' class='f_red'></span><br /> (例如客户的汇款单号) </td>
		<td class='hback_1'>操作记录 <span class="f_red">*</span></td>
		<td class='hback'><textarea name="logcontent" id="logcontent" style="width:95%;height:80px;display:;overflow:auto;"></textarea><br /><span id='dlogcontent' class='f_red'></span> 描述下增加/减少金币的原因</td>
	  </tr>
	  <tr>

	  </tr>
	  <tr>
		<td class='hback_none' colspan="4" align="center"><input type="submit" name="btn_save" class="button" value="确定保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->


<!--{if $fromtype == 'jdbox'}-->
<!--{else}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
<!--{/if}-->
</body>
</html>
<script type="text/javascript">
function checkform() {
	var t = "";
	var v = "";

	t = "actiontype";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("现金去向不能为空", t);
		return false;
	}

	t = "amount";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("操作金额不能为空", t);
		return false;
	}

	t = "logcontent";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("操作记录不能为空", t);
		return false;
	}

	return true;
}
</script>
