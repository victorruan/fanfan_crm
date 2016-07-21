<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>部门/组管理</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "run"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统设置<span>&gt;&gt;</span>部门/组设置</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="<!--{$cpfile}-->?c=authgroup&a=add" class="btn-general"><span>添加部门/组</span></a>管理部门/组</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="10%"><div class="th-gap">ID编号</div></th>
		<th width="35%"><div class="th-gap">部门/组</div></th>
		<th width="8%"><div class="th-gap">排序</div></th>
		<th width="8%"><div class="th-gap">状态</div></th>
		<th width="18%"><div class="th-gap">录入时间</div></th>
		<th width="15%"><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $authgroup as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center"><!--{$volist.groupid}--></td>
		<td><!--{$volist.tree_node}--></td>
		<td align="center"><!--{$volist.orders}--></td>
		<td align="center">
		<!--{if $volist.flag==0}-->
			<input type="hidden" id="attr_flag<!--{$volist.groupid}-->" value="flagopen" />
			<img id="flag<!--{$volist.groupid}-->" src="<!--{$urlpath}-->tpl/static/images/no.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.groupid}-->');" style="cursor:pointer;">
		<!--{else}-->
			<input type="hidden" id="attr_flag<!--{$volist.groupid}-->" value="flagclose" />
			<img id="flag<!--{$volist.groupid}-->" src="<!--{$urlpath}-->tpl/static/images/yes.gif" onClick="javascript:fetch_ajax('flag','<!--{$volist.groupid}-->');" style="cursor:pointer;">	
		<!--{/if}-->
		</td>
		<td><!--{$volist.timeline|date_format:"%Y/%m/%d %H:%M:%S"}--></td>
		<td align="center"><a href="<!--{$cpfile}-->?c=authgroup&a=edit&id=<!--{$volist.groupid}-->&page=<!--{$page}-->" class="icon-set">设置</a>&nbsp;&nbsp;<a href="<!--{$cpfile}-->?c=authgroup&a=del&id[]=<!--{$volist.groupid}-->" onClick="{if(confirm('确定要删除?')){return true;} return false;}" class="icon-del">删除</a></td>
	  </tr>
	  <!--{foreachelse}-->
      <tr>
	    <td colspan="6" align="center">暂无信息</td>
	  </tr>
	  <!--{/foreach}-->
	</table>
	<!--{if $total>1}-->
	<table width='95%' border='0' cellspacing='0' cellpadding='0' align='center' style="margin-top:10px;">
	  <tr>
		<td align='left'>总记录：<!--{$total}--></td>
	  </tr>
	</table>
	<!--{/if}-->
  </div>
</div>
<!--{/if}-->

<!--{if $a eq "add"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统设置<span>&gt;&gt;</span>添加部门/组</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=authgroup" class="btn-general"><span>返回列表</span></a>添加部门/组</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=authgroup" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveadd" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">部门/组名称：<span class='f_red'>*</span></td>
		<td class='hback' width="85%"><input type="text" name="groupname" id="groupname" class="input-txt" /> <span class='f_red' id="dgroupname"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>所属节点：<span class='f_red'></span></td>
		<td class='hback'><!--{$group_root}--> <span class='f_red' id="drootid"></span> （不选择默认为根节点）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100"  /> <span class='f_red' id="dorders"></span> (数字越小，越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>状态设置：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="flag" value="1" checked />正常，<input type="radio" name="flag" value="0" />锁定</td>
	  </tr>
	  <tr>
		<td class='hback_1'>描述说明： </td>
		<td class='hback'><textarea name="intro" id='intro' style='width:60%;height:65px;overflow:auto;color:#444444;'></textarea></td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="添加保存" /></td>
	  </tr>
<!--	  <tr>
		<td class='hback_1'>操作权限：<span class='f_red'></span></td>
		<td class='hback'><!--{$auth_checkbox}--></td>
	  </tr>
-->      
       <tr>
          <table cellspacing='1' class="list-table">
              <!--{foreach from=$priv_arr item=priv}-->
                            <tr height="30">
                              <td width="18%" valign="top" class="first-cell">
                              <label><input name="chkGroup" type="checkbox" value="checkbox" class="radio" onclick="check('<!--{$priv.priv_list}-->',this);" /><strong><!--{$lang[$priv.action_code]}--></strong></label>
                              </td>
                              <td>
                                <!--{foreach from=$priv.priv key=priv_list item=list}-->
                                <div style="width:200px;float:left;">
                                    <label>
                         <input type="checkbox" class="radio" name="action_code[]" value="<!--{$priv_list}-->" id="<!--{$priv_list}-->" 
                                    <!--{if $list.cando eq 1}--> checked="true" <!--{/if}--> />
                                    <!--{$lang[$list.action_code]}--></label>
                                </div>
                                <!--{/foreach}-->
                              </td>
                            </tr>
              <!--{/foreach}-->
          </table>
      </tr>
      <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><label><input type="checkbox" name="checkall" value="checkbox" onclick="checkAll(this.form, this);" class="radio" /><strong>全选</strong> &nbsp;&nbsp;&nbsp;&nbsp;</label><input type="submit" name="btn_save" class="button" value="添加保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：系统设置<span>&gt;&gt;</span>编辑部门/组</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="<!--{$cpfile}-->?c=authgroup" class="btn-general"><span>返回列表</span></a>编辑部门/组</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=authgroup" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
	<input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="15%">部门/组名称：<span class='f_red'>*</span></td>
		<td class='hback' width="85%"><input type="text" name="groupname" id="groupname" class="input-txt" value="<!--{$authgroup.groupname}-->" /> <span class='f_red' id="dgroupname"></span></td>
	  </tr>
	  <tr>
		<td class='hback_1'>所属节点：<span class='f_red'></span></td>
		<td class='hback'><!--{$group_root}--> <span class='f_red' id="drootid"></span> （不选择默认为根节点）</td>
	  </tr>
	  <tr>
		<td class='hback_1'>排序：<span class='f_red'></span></td>
		<td class='hback'><input type="text" name="orders" id="orders" class="input-100" value="<!--{$authgroup.orders}-->"  /> <span class='f_red' id="dorders"></span> (数字越小，同级越靠前)</td>
	  </tr>
	  <tr>
		<td class='hback_1'>状态设置：<span class='f_red'></span></td>
		<td class='hback'><input type="radio" name="flag" value="1"<!--{if $authgroup.flag==1}--> checked<!--{/if}--> />正常，<input type="radio" name="flag" value="0"<!--{if $authgroup.flag==0}--> checked<!--{/if}--> />锁定</td>
	  </tr>
	  <tr>
		<td class='hback_1'>描述说明： </td>
		<td class='hback'><textarea name="intro" id='intro' style='width:60%;height:65px;overflow:auto;color:#444444;'><!--{$authgroup.intro}--></textarea></td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
	  </tr>
	  <tr>
          <table cellspacing='1' class="list-table">
  <!--{foreach from=$priv_arr item=priv}-->
  	<tr height="30">
      <td width="18%" valign="top" class="first-cell">
      <label><input name="chkGroup" type="checkbox" value="checkbox" class="radio" onclick="check('<!--{$priv.priv_list}-->',this);" /><strong><!--{$lang[$priv.action_code]}--></strong></label>
      </td>
      <td>
      	<!--{foreach from=$priv.priv key=priv_list item=list}-->
        <div style="width:200px;float:left;">
        	<label>
            <input type="checkbox" class="radio" name="action_code[]" value="<!--{$priv_list}-->" id="<!--{$priv_list}-->" 
            <!--{if $list.cando eq 1}--> checked="true" <!--{/if}--> /><!--{$lang[$list.action_code]}-->
    		</label>
        </div>
        <!--{/foreach}-->
      </td>
    </tr>
  <!--{/foreach}-->
  </table>
            </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><label><input type="checkbox" name="checkall" value="checkbox" onclick="checkAll(this.form, this);" class="radio" />全选 &nbsp;&nbsp;&nbsp;&nbsp;</label><input type="submit" name="btn_save" class="button" value="更新保存" /></td>
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

	t = "groupname";
	v = $("#"+t).val();
	if(v=="") {
		dmsg("部门/组名称不能为空", t);
		return false;
	}
	return true;
}
<!--
function checkAll(frm, checkbox)
{
  for (i = 0; i < frm.elements.length; i++)
  {
    if (frm.elements[i].name == 'action_code[]' || frm.elements[i].name == 'chkGroup')
    {
      frm.elements[i].checked = checkbox.checked;
    }
	if (frm.elements[i].name == 'cat_code[]' || frm.elements[i].name == 'chkGroup')
    {
      frm.elements[i].checked = checkbox.checked;
    }
  }
}

function check(list, obj)
{
  var frm = obj.form;
 
    for (i = 0; i < frm.elements.length; i++)
    {
      if (frm.elements[i].name == "action_code[]")
      {
          var regx = new RegExp(frm.elements[i].value + "(?!_)", "i");
 
          if (list.search(regx) > -1) {frm.elements[i].checked = obj.checked;}
      }
	  if (frm.elements[i].name == "cat_code[]")
      {
          var regx = new RegExp(frm.elements[i].value + "(?!_)", "i");
 
          if (list.search(regx) > -1) {frm.elements[i].checked = obj.checked;}
      }
    }
}
//-->

</script>
