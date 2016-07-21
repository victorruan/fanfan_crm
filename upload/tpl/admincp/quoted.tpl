<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>询价管理</title>
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
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>询价列表</p></div>
  <div class="main-cont">
    <h3 class="title"><a href="javascript:addTabs('询价发布', 'comment2', '<!--{$cpfile}-->?c=quoted&a=add')" class="btn-general"><span>询价发布</span></a><!--{if $sview == 1}-->
	未审核询价单
	<!--{elseif $sview == 2}-->
	审核失败询价单
	<!--{elseif $sview == 3}-->
	审核成功询价单
	<!--{elseif $sview == 4}-->
	未转询价单
	<!--{elseif $sview == 5}-->
	已转询价单
	<!--{else}-->
	询价列表
	<!--{/if}--></h3>
    <div class="search-area ">
	  <form method="post" id="search_form" action="<!--{$cpfile}-->?c=quoted&sview=<!--{$sview}-->" />
	  <div class="item">
        <label>询价单号：</label><input type="text" id="sinquiryid" name="sinquiryid" size="15" class="input-150" value="<!--{$sinquiryid}-->" />&nbsp;&nbsp;
       <label>公司名：</label><input type="text" id="sentname" name="sentname" size="15" class="input-150" value="<!--{$sentname}-->" />&nbsp;&nbsp;
		<label>联系人：</label><input type="text" id="sname" name="sname" size="15" class="input-150" value="<!--{$sname}-->" />&nbsp;&nbsp;
        <label>手机：</label><input type="text" id="smobile" name="smobile" size="15" class="input-150" value="<!--{$smobile}-->" />&nbsp;&nbsp;
        <!--<br/>
        <label>审核状态：</label>
        <select name="sexamine">
        <option value="0" <!--{if $sexamine eq 0}-->selected="selected"<!--{/if}-->>未审核</option>
        <option value="2" <!--{if $sexamine eq 2}-->selected="selected"<!--{/if}-->>审核成功</option>
        <option value="1" <!--{if $sexamine eq 1}-->selected="selected"<!--{/if}-->>审核失败</option>
        </select>&nbsp;&nbsp;
        <label>转订单状态：</label>
        <select name="sstype">
        <option value="1" <!--{if $sstype eq 1}-->selected="selected"<!--{/if}-->>未转订单</option>
        <option value="2" <!--{if $sstype eq 2}-->selected="selected"<!--{/if}-->>已转订单</option>
        </select>&nbsp;&nbsp;-->
		<input type="submit" class="button" value="搜 索" />&nbsp;&nbsp;
        <img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新询价列表" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
	</div>
    <form action="<!--{$cpfile}-->?c=quoted&a=del" method="post" name="myform" id="myform" style="margin:0">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
	  <thead class="tb-tit-bg">
	  <tr>
	    <th width="8%"><div class="th-gap">ID编号</div></th>
        <th width="13%"><div class="th-gap">询价单号</div></th>
		<th width="10%"><div class="th-gap">主体（联系人）</div></th>
        <th width="8%"><div class="th-gap">审核状态</div></th>
        <th width="8%"><div class="th-gap">是否已转订单</div></th>
		<th width="10%"><div class="th-gap">手机</div></th>
		<!--<th width="10%"><div class="th-gap">邮箱</div></th>-->
		<th width="15%"><div class="th-gap">录入时间</div></th>
		<th><div class="th-gap">操作</div></th>
	  </tr>
	  </thead>
	  <tfoot class="tb-foot-bg"></tfoot>
	  <!--{foreach $quoted as $volist}-->
	  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
	    <td align="center">
        <!--{if $volist.stype neq 2}-->
        <input name="id[]" type="checkbox" value="<!--{$volist.pid}-->" onClick="checkItem(this, 'chkAll')">
        <!--{/if}-->
        <!--{$volist.pid}-->
        <span><img src="<!--{$cppath}-->images/menu_plus.gif" style="cursor:pointer;" onclick="showDateil(this,<!--{$volist.i}-->)" /></span></td>
        <td align="center"><!--{$volist.inquiryid}--></td>
		<td align="center"><!--{if $volist.entname}--><!--{$volist.entname}--><!--{else}-->个体<!--{/if}-->（<!--{$volist.cpname}-->）</td>
        <td align="center"><!--{if $volist.examine eq 2}--><font color="#009900">审核成功</font><!--{elseif $volist.examine eq 1}--><font color="#CC0000">审核失败</font><!--{else}-->未审核<!--{/if}--></td>
        <td align="center"><!--{if $volist.stype eq 2}--><font color="#009900">已转订单</font><!--{else}-->未转订单<!--{/if}--></td>
		<td align="center"><!--{$volist.mobile}--></td>
		<!--<td align="center"><!--{$volist.email}--></td>-->
		<td><!--{$volist.addtime|date_format:"%Y/%m/%d %H:%M:%S"}--></td>
       
		<td align="center"> 
        <!--{if $volist.examine eq 0}-->
        <a href="javascript:addTabs('[<!--{$volist.cpname}-->]审核<!--{$volist.pid}-->', 'comment2', '<!--{$cpfile}-->?c=quoted&a=examine&id=<!--{$volist.pid}-->')" class="icon-add">审核</a>&nbsp;&nbsp;
        <!--{/if}-->
         <!--{if $volist.stype neq 2}-->
         <!--{if $volist.examine eq 2}-->
       <a href="javascript:addTabs('[<!--{$volist.cpname}-->]转为订单ID为<!--{$volist.pid}-->', 'comment2', '<!--{$cpfile}-->?c=quoted&a=ltorder&id=<!--{$volist.pid}-->&title=[<!--{$volist.cpname}-->]转为订单ID为<!--{$volist.pid}-->')" class="icon-add">转为订单</a>&nbsp;&nbsp;
      	<!--{/if}-->
        <a href="javascript:addTabs('[<!--{$volist.cpname}-->]编辑<!--{$volist.pid}-->', 'comment2', '<!--{$cpfile}-->?c=quoted&a=edit&id=<!--{$volist.pid}-->&page=<!--{$page}-->')" class="icon-set">编辑</a>&nbsp;&nbsp;
        <!--{/if}-->
         <!--<a href="javascript:addTabs('[<!--{$volist.cpname}-->]操作记录<!--{$volist.pid}-->', 'comment2', '<!--{$cpfile}-->?c=quoted&a=quotedlog&id=<!--{$volist.pid}-->')" class="icon-set">查看操作记录</a>&nbsp;&nbsp;-->
         
         <a href="javascript:tbox_quotedlog('查看操作记录','<!--{$volist.pid}-->')" class="icon-set">查看操作记录</a>&nbsp;&nbsp;
          <!--{if $volist.examine neq 0}-->
         <a href="javascript:tbox_examineemail('发送邮件至客户','<!--{$volist.pid}-->')" class="icon-set">发送邮件</a>&nbsp;&nbsp;
         <!--{/if}-->
         <!--{if $volist.examine eq 2}-->
         <a href="javascript:quoted_excel('<!--{$volist.pid}-->')" class="icon-set">生成EXCEL</a>&nbsp;&nbsp;
         <a href="javascript:quoted_print('<!--{$volist.pid}-->')" class="icon-set">打印</a>&nbsp;&nbsp;
         <!--{/if}-->
         <!--{if $volist.stype neq 2}-->
        <a href="<!--{$cpfile}-->?c=quoted&a=del&id[]=<!--{$volist.pid}-->" onClick="{if(confirm('确定要删除?')){return true;} return false;}" class="icon-del">删除</a> <!--{/if}-->
        </td>
	  </tr>
      <tr class="show" id="item_<!--{$volist.i}-->">
              <td colspan="8" align="center">
               		 <div>
                   <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                      <tr id="list-top">
                      <td class='hback_1' align="center" width='12%'>物品ID</td>
                      <td class='hback_1' align="center" width='30%'>物品名称</td>
                      <td class='hback_1' align="center" width='15%'>物品规格</td>
                      <td class='hback_1' align="center" width='15%'>物品询价</td>
                      <td class='hback_1' align="center" width='10%'>折扣</td>
                      <td class='hback_1' align="center" width='15%'>物品数量</td>
                      <td class='hback_1' align="center" width='10%'>总价</td>
                      <td class='hback_1' align="center">备注</td>
                    </tr>
                    <!--{foreach $volist.product as $val}-->
                    <tr>
                      <td align="center"><!--{$val.goodsid}--></td>
                      <td align="center"><!--{$val.goodsname}--></td>
                      <td align="center"><!--{$val.normsstr}--></td>
                      <td align="center"><!--{$val.goodsprice}--></td>
                      <td align="center"><!--{$val.gooddiscount}--></td>
                      <td align="center"><!--{$val.goodsnum}--></td>
                      <td align="center"><!--{$val.one_total}--></td>
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
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>询价发布</p></div>
        <div class="main-cont">
      <h3 class="title">新客户快速注册</h3>
    <div class="search-area ">
    	 <form method="post" id="search_forms" action="<!--{$cpfile}-->?c=quoted&a=addcorp"  autocomplete="off"/>
	  <div class="item">
      <label>类型：</label><!--{$type_select}-->&nbsp;&nbsp;
      <span id="entnameinfo">
        <label>请填写企业名称：</label>
		<style>
                #suggestions{ position: relative; left:2px; top:-0px; width:300px; display:none;}
                #searchresults { border-width:1px; border-color:#919191; border-style:solid; width:300px; background-color:#a0a0a0; font-size:10px; line-height:14px; }
                #searchresults span.searchdata { display:block; font-weight:bold; padding-top:5px; font-size:12px; color:#F00; background-color:#e4e4e4 }
                #searchresults span.title { display:block; font-size:12px; margin:5px; display:block;cursor:pointer }
				#searchresults span.titles { background:#FF0000}
                #searchresults span.company{ display:block; background-color:#e4e4e4}
           </style>    
               <input type="text" class="reg_input" name="entname" id="entname"  onkeyup="lookup(event,this.value);"/> 
        <div style="position:absolute"><div id="suggestions"></div> </div>&nbsp;&nbsp;
        </span>
        <span id="didinfo"><label>属于企业：</label><!--{$entselect}--> &nbsp;&nbsp;</span>
        
        
	    <label>客户名称：</label><input type="text" id="cpname" name="cpname" class="input-80"/>&nbsp;&nbsp;
		<label>邮箱：</label><input type="text" id="email" name="email" class="input-80"/>&nbsp;&nbsp;
		<label>手机：</label><input type="text" id="mobile" name="mobile" class="input-80"/>&nbsp;&nbsp;
		<input type="button" onclick="tijiaozhuce()" class="button_s" value="快速注册" />&nbsp;&nbsp;<img style="vertical-align: middle; cursor:pointer; width:20px; height:20px;" title="刷新客户资料" onclick="location.reload()" src="<!--{$urlpath}-->tpl/static/ui/images/32/refresh (2).png"/>
	  </div>
	  </form>
    </div>
            <h3 class="title">客户搜索（不输入条件则搜索全部客户）</h3>
            <div class="search-area ">
	 <form method="post" id="search_form" action="<!--{$cpfile}-->?c=quoted&a=add&search=1" />
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
    
    		<!--{if $search}-->
            <div style="margin: 8px;">
                <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                    font-weight: bold; text-align: center; float: left;">
                    客户列表
                </div>
                <div style="clear: both;"></div>
                <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="table" align="center">
                  <thead class="tb-tit-bg">
                  <tr>
                    <th width="8%"><div class="th-gap">选择</div></th>
                    <th width="10%"><div class="th-gap">客户名称</div></th>
                    <th width="10%"><div class="th-gap">客户折扣等级</div></th>
                    <th width="10%"><div class="th-gap">邮箱</div></th>
                    <th width="10%"><div class="th-gap">手机</div></th>
                    <th width="10%"><div class="th-gap">主体</div></th>
                    <th width="10%"><div class="th-gap">注册时间</div></th>
                  </tr>
                  </thead>
                  <tfoot class="tb-foot-bg"></tfoot>
                  <!--{foreach $corp as $volist}-->
                  <tr onMouseOver="overColor(this)" onMouseOut="outColor(this)">
                    <td align="center">
                    <input name="id" type="radio" value="<!--{$volist.cpid}-->" /><!--{$volist.cpid}-->
                    </td>
                    <td align="left"><!--{$volist.cpname}--></td>
                    <td align="left"><!--{if $volist.class}--><!--{$volist.class}-->（<!--{$volist.discount}-->）<!--{else}-->没有折扣等级<!--{/if}--></td>
                    <td align="left"><!--{$volist.email}--></td>
                    <td align="left"><!--{$volist.mobile}--></td>
                    <td align="center"><!--{if $volist.rootid neq 0}--><!--{$volist.entname}--><!--{else}-->个人<!--{/if}--></td>
                    <td align="center" title="<!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}-->"><!--{$volist.createtime|date_format:"%Y-%m-%d"}--></td>
                  </tr>
                  <!--{foreachelse}-->
                  <tr>
                    <td colspan="7" align="center">暂无信息</td>
                  </tr>
                  <!--{/foreach}-->
                  <!--{if $total>0}-->
                  <tr>
                    <td class="hback" colspan="7">&nbsp;&nbsp;共[ <b><!--{$total}--></b> ]条记录</td>
                  </tr>
                  <!--{/if}-->
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
            <div style="margin: 8px;">
                <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                    font-weight: bold; text-align: center; float: left;">
                    客户名片
                </div>
                <div style="clear: both;"></div>
                <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
                   <table width="100%">
                        <tr>
                            <td align="center" width="10%"><strong>客户名称：</strong></td>
                            <td align="left" width="10%"><span id="ajaxcpname"></span></td>
                            <td align="center" width="10%"><strong>类型：</strong></td>
                            <td align="left" width="10%"><span id="ajaxtype"></span></td>
                            <td align="center" width="10%"><strong>手机号码：</strong></td>
                            <td align="left" width="10%"><span id="ajaxmobile"></span></td>
                            <td align="center" width="10%"><strong>地点：</strong></td>
                            <td align="left" width="10%"><span id="ajaxaddress"></span></td>
                            <td align="center" width="10%"><strong>备注：</strong></td>
                            <td align="left" width="10%"><span id="ajaxremark"></span></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left;">
                客户询价记录
            </div>
            <div style="clear: both;"></div>
            
            <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
           <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="history">
			  <td class='hback_1' align="center" width='12%'>ID编号</td>
			  <td class='hback_1' align="center" width='15%'>询价单号</td>
			  <td class='hback_1' align="center" width='15%'>主体（联系人）</td>
              <td class='hback_1' align="center" width='10%'>审核状态</td>
			  <td class='hback_1' align="center" width='15%'>是否已转订单</td>
              <td class='hback_1' align="center" width='15%'>手机</td>
              <td class='hback_1' align="center">录入时间</td>
			</tr>
		  </table>
           </div>
           
            <div style="background-color: #f0f0f0; width: 350px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                客户现场询价(<span class="infocp" style="color:#CC0000">请选择客户</span>)
            </div>
            <div style="clear: both;"></div>
             <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
             <input name='itemmaxsorts' id='itemmaxsorts' type='hidden' value='0' />
             <input type="hidden" name="a" value="saveadd" />
            <input name='ajaxid' id='ajaxid' type='hidden' />
            <input name='ajaxname' id='ajaxname' type='hidden' />
           <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-tops">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>物品ID</td>
			  <td class='hback_1' align="center" width='15%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='10%'>询价价格</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='10%'>物品数量</td>
              <td class='hback_1' align="center" width='10%'>备注</td>
			  <td class='hback_1' align="center">操作</td>
			</tr>
			<tr>
			  <td colspan='9' align="right"><a href="javascript:void(0);" onclick="return quoted_add($(this));">添加物品</a><span id="load_itemtipss"></span> &nbsp;&nbsp;</td>
			</tr>
            <tr>
            <td class='hback_none'><input type="button" name="botton" class="button" value="添加询价单" onclick="ajaxquotedadd();" /></td>
          </tr>
		  </table>
          </div>
   </div>
        <!--{/if}-->
<!--{/if}-->

<!--{if $a eq "edit"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>编辑询价发布</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('询价列表', 'comment2', '<!--{$cpfile}-->?c=quoted&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>编辑询价发布</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted" onsubmit='return checkform();' />
    <input type="hidden" name="a" value="saveedit" />
    <input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="20%">客户名称：</td>
		<td class='hback'><!--{$data.cpname}--></td>
	  </tr>
       <tr>
		<td class='hback_1'>客户折扣等级：</td>
		<td class='hback'><!--{if $data.class}--><!--{$data.class}-->（<!--{$data.discount}-->）<!--{else}-->没有客户折扣<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>邮箱：</td>
		<td class='hback'><!--{if $data.email}--><!--{$data.email}--><!--{else}-->暂无信息<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>手机：</td>
		<td class='hback'><!--{if $data.mobile}--><!--{$data.mobile}--><!--{else}-->暂无信息<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>主体：</td>
		<td class='hback'><!--{if $data.entname}--><!--{$data.entname}--><!--{else}-->个体<!--{/if}--></td>
	  </tr>
      
      <tr>
		<td class='hback_c1' colspan="2">订单物品清单列表</td>
	  </tr>

	  <tr>
	    <td colspan="2">
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='12%'>物品ID</td>
			  <td class='hback_1' align="center" width='15%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='15%'>询价价格</td>
              <td class='hback_1' align="center" width='15%'>折扣</td>
			  <td class='hback_1' align="center" width='15%'>物品数量</td>
              <td class='hback_1' align="center">备注</td>
			</tr>
			<!--{foreach $data.product as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.goodsid}--></td>
			  <td align="center"><!--{$volist.goodsname}--></td>
              <td align="center"><!--{$volist.normsstr}--></td>
			  <td align="center"><!--{$volist.goodsprice}--></td>
              <td align="center"><!--{$volist.gooddiscount}--></td>
			  <td align="center"><!--{$volist.goodsnum}--></td>
			  <td align="center"><!--{$volist.goodsremarks}--></td>
			</tr>
			<!--{/foreach}-->
            <tr>
			  <td colspan='6' align="right">物品合计：</td>
			  <td align="left"><!--{$data.goodsamount}--></td>
			</tr>
		  </table>
          <div style="background-color: #f0f0f0; width: 350px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                编辑询价货物(<span class="infocp" style="color:#CC0000">
                <!--{if $data.class}-->当前客户最低可享<!--{$data.discount}--> <a href="javascript:bonddiscount('<!--{$data.discount}-->','quoted')">一键折扣转换</a><!--{else}-->没有客户折扣<!--{/if}--></span>)
            </div>
            <div style="clear: both;">
            </div>
          <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
             <input name='itemmaxsorts' id='itemmaxsorts' type='hidden' value='<!--{$data.total}-->' />
           <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-tops">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>物品ID</td>
			  <td class='hback_1' align="center" width='15%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='10%'>询价价格</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='10%'>物品数量</td>
              <td class='hback_1' align="center" width='10%'>备注</td>
			  <td class='hback_1' align="center">操作</td>
			</tr>
            <!--{foreach $data.product as $volist}-->
            <tr class='itemlists' onMouseOver="overColor(this)" onMouseOut="outColor(this)">
			  <td class='hback' align='center'> 物品<!--{$volist.i}-->
               <input type='hidden' name='sitem_gid_<!--{$volist.i}-->' id='sitem_gid_<!--{$volist.i}-->' value="<!--{$volist.goodsid}-->" />
               <input type='hidden' name='sitem_sid_<!--{$volist.i}-->' id='sitem_sid_<!--{$volist.i}-->' value="<!--{$volist.sid}-->" />
               </td>
              <td class='hback' align='center' id='sitem_id_<!--{$volist.i}-->'><!--{$volist.goodsid}--></td>
              <td class='hback' id='sitem_name_<!--{$volist.i}-->'><!--{$volist.goodsname}--></td>
              <td class='hback' id='sitem_norms_<!--{$volist.i}-->'><!--{$volist.normsstr}--></td>
              <input type='hidden' name='sitem_normsstr_<!--{$volist.i}-->' id='sitem_normsstr_<!--{$volist.i}-->' value="<!--{$volist.normsstr}-->" />
              
			  <td class='hback' align='center'>
              <input type='text' name='sitem_price_<!--{$volist.i}-->' id='sitem_price_<!--{$volist.i}-->' class='input-s' onblur="pcdiscounts('sitem_oprice_<!--{$volist.i}-->', 'sitem_price_<!--{$volist.i}-->','sitem_discount_<!--{$volist.i}-->')" value="<!--{$volist.goodsprice}-->" />
              </td>
			<td class='hback' align='center'>
            <input type='text' name='sitem_discount_<!--{$volist.i}-->' id='sitem_discount_<!--{$volist.i}-->' class='input-s' onblur="dcprice('sitem_oprice_<!--{$volist.i}-->', 'sitem_price_<!--{$volist.i}-->','sitem_discount_<!--{$volist.i}-->')" value="<!--{$volist.gooddiscount}-->"  />
            <input type='hidden' name='sitem_oprice_<!--{$volist.i}-->' id='sitem_oprice_<!--{$volist.i}-->' value="<!--{$volist.goodsoprice}-->" />
            </td>
             <td class='hback' align='center'>
             <input type='text' name='sitem_num_<!--{$volist.i}-->' id='sitem_num_<!--{$volist.i}-->' class='input-s' value="<!--{$volist.goodsnum}-->" />
             </td>
             <td class='hback' align='center'>
             <input type='text' name='sitem_remarks_<!--{$volist.i}-->' id='sitem_remarks_<!--{$volist.i}-->' class='input-s' value="<!--{$volist.goodsremarks}-->" />
             </td>
			 <td class='hback' align='center'>
             <a href='javascript:void(0);' onclick="tbox_get_quoted('查询物品', '<!--{$volist.i}-->')">选取产品</a>&nbsp;&nbsp;
             <a href='javascript:void(0);' onclick='item_countnums();item_del_quoted($(this),<!--{$volist.i}-->);'>移除</a></td>
    	        </tr>
            <!--{/foreach}-->       
                   
                   
			<tr>
			  <td colspan='9' align="right"><a href="javascript:void(0);" onclick="return quoted_add($(this));">添加物品</a><span id="load_itemtipss"></span> &nbsp;&nbsp;</td>
			</tr>
		  </table>
          </div>
          
		</td>
	  </tr>
       <tr>
		<td class='hback_c1' colspan="2">本次编辑的备注</td>
	  </tr>
      <tr>
		<td class='hback_1'>备注</td>
		<td class='hback'><textarea name="editorremarks" id="editorremarks" style="width:40%;height:60px;overflow:auto;">请填写对本次操作修改情况的概述</textarea></td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="编辑保存" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq "examine"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>审核询价发布</p></div>
  <div class="main-cont">
	<h3 class="title"><a href="javascript:addTabs('询价列表', 'comment2', '<!--{$cpfile}-->?c=quoted&<!--{$comeurl}-->')" class="btn-general"><span>返回列表</span></a>审核询价发布</h3>
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted"/>
    <input type="hidden" name="a" value="saveexamine" />
    <input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='3' cellspacing='3' class='tab'>
	  <tr>
		<td class='hback_1' width="20%">客户名称：</td>
		<td class='hback'><!--{$data.cpname}--></td>
	  </tr>
       <tr>
		<td class='hback_1'>客户折扣等级：</td>
		<td class='hback'><!--{if $data.class}--><!--{$data.class}-->（<!--{$data.discount}-->）<!--{else}-->没有客户折扣<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>邮箱：</td>
		<td class='hback'><!--{if $data.email}--><!--{$data.email}--><!--{else}-->暂无信息<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>手机：</td>
		<td class='hback'><!--{if $data.mobile}--><!--{$data.mobile}--><!--{else}-->暂无信息<!--{/if}--></td>
	  </tr>
      <tr>
		<td class='hback_1'>主体：</td>
		<td class='hback'><!--{if $data.entname}--><!--{$data.entname}--><!--{else}-->个体<!--{/if}--></td>
	  </tr>
      
      <tr>
		<td class='hback_c1' colspan="2">订单物品清单列表</td>
	  </tr>

	  <tr>
	    <td colspan="2">
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='12%'>物品ID</td>
			  <td class='hback_1' align="center" width='15%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='15%'>询价价格</td>
              <td class='hback_1' align="center" width='15%'>折扣</td>
			  <td class='hback_1' align="center" width='15%'>物品数量</td>
              <td class='hback_1' align="center">备注</td>
			</tr>
			<!--{foreach $data.product as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.goodsid}--></td>
			  <td align="center"><!--{$volist.goodsname}--></td>
              <td align="center"><!--{$volist.normsstr}--></td>
			  <td align="center"><!--{$volist.goodsprice}--></td>
              <td align="center"><!--{$volist.gooddiscount}--></td>
			  <td align="center"><!--{$volist.goodsnum}--></td>
			  <td align="center"><!--{$volist.goodsremarks}--></td>
			</tr>
			<!--{/foreach}-->
            <tr>
			  <td colspan='6' align="right">物品合计：</td>
			  <td align="left"><!--{$data.goodsamount}--></td>
			</tr>
		  </table>
		</td>
	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input name="success" onclick="tbox_success('发送内容','<!--{$id}-->')" type="button" value="审核成功" /><input name="failure" onclick="tbox_failure('发送内容','<!--{$id}-->')" type="button" value="审核失败" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq 'quotedlog'}-->
<!-- 询价记录开始 -->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>询价单记录</p></div>
  <div class="main-cont">
	<h3 class="title">询价单记录</h3>

		<div id="myTab_Content5" class="none">
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <thead class="tb-tit-bg">
		    <tr>
			  <th width="10%"><div class="th-gap">序号</div></th>
			  <th width="18%"><div class="th-gap">时间</div></th>
			  <th width="15%"><div class="th-gap">操作人</div></th>
			  <th width="10%"><div class="th-gap">行为</div></th>
			  <!--<th width="10%"><div class="th-gap">结果</div></th>-->
			  <th><div class="th-gap">备注</div></th>
		    </tr>
		    </thead>
			<!--{foreach $log_data as $volist}-->
			<tr>
			  <td align="center"><!--{$volist.i}--></td>
			  <td align="center"><!--{$volist.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
			  <td align="center"><!--{$volist.adminname}--></td>
			  <td align="center"><!--{$volist.behavior}--></td>
			  <!--<td align="center"><!--{if $volist.result==1}-->成功<!--{else}-->失败<!--{/if}--></td>-->
			  <td align="center"><!--{$volist.logtext}--></td>
			</tr>
			<!--{/foreach}-->
		  </table>
		</div>
          </div>
  <div style="clear:both;"></div>
</div>
		<!-- 询价记录结束 -->
<!--{/if}-->
<!--{if $a eq "failure"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>发送失败页面</p></div>
  <div class="main-cont">
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted"/>
    <input type="hidden" name="a" value="failureexamine" />
    <input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	  <tr>
        <td class='hback_1'>备注</td>
		<td class='hback'><textarea name="remarks" id="remarks" style="width:40%;height:60px;overflow:auto;">请填写对本次审核情况的概述</textarea></td>	  </tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="发送" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq "success"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>发送成功页面</p></div>
  <div class="main-cont">
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted"/>
    <input type="hidden" name="a" value="successexamine" />
    <input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	   <tr>
        <td class='hback_1'>备注</td>
		<td class='hback'><textarea name="remarks" id="remarks" style="width:40%;height:60px;overflow:auto;">请填写对本次审核情况的概述</textarea></td>	  </tr>
	  <tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="发送" /></td>
	  </tr>
	</table>
	</form>
  </div>
  <div style="clear:both;"></div>
</div>
<!--{/if}-->
<!--{if $a eq "examineemail"}-->
<div class="main-wrap">
  <div class="path"><p>当前位置：询价管理<span>&gt;&gt;</span>发送成功页面</p></div>
  <div class="main-cont">
    <form name="myform" id="myform" method="post" action="<!--{$cpfile}-->?c=quoted"/>
    <input type="hidden" name="a" value="examineemailcon" />
    <input type="hidden" name="id" value="<!--{$id}-->" />
	<table cellpadding='1' cellspacing='1' class='tab'>
	   <tr>
        <td class='hback_1'>备注</td>
		<td class='hback'><textarea name="remarks" id="remarks" style="width:40%;height:60px;overflow:auto;">邮件内容追加备注</textarea></td>	  </tr>
	  <tr>
	  <tr>
		<td class='hback_none'></td>
		<td class='hback_none'><input type="submit" name="btn_save" class="button" value="发送" /></td>
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
	return true;
}

$("input[name='id']").each(function(i){
     $(this).click(function(){
	 var id=$(this).val();
	 	var html = '';
		$.ajax({
			type:"POST",	   
			url :"<!--{$cpfile}-->?c=guide&a=ajaxGetCp",
			data:"id="+id,
			dataType:"JSON",
			success: function(data,textStatus){
			data = eval(data);
			$.each(data, function(index,txt){
			   if(txt['rootid']!=0){
			   		$("#ajaxtype").html('企业');
			   }else{
			   		$("#ajaxtype").html('个人');
			   }
			   		$("#ajaxid").val(txt['cpid']);
					$("#ajaxname").val(txt['cpname']);
					$("#shipuser").val(txt['cpname']);
					$("#shipmobile").val(txt['mobile']);
					$("#shipaddress").val(txt['address']);
					
					$("#ajaxcpname").html(txt['cpname']);
					//$("#ajaxcpno").html(txt['cpno']);
					$("#ajaxaddress").html(txt['address']);
					$("#ajaxremark").html(txt['remark']);
					$("#ajaxmobile").html(txt['mobile']);
					//$("#ajaxposition").html(txt['position']);
					if(txt['discount'] && txt['cpname']){
		$(".infocp").eq(0).html('当前客户最低可享'+txt['discount']+' <a href="javascript:bonddiscount(\''+txt['discount']+'\',\'quoted\')">一键折扣转换</a>');
					}else if(txt['cpname'] && !txt['discount']){
						$(".infocp").html('当前客户没有折扣等级');
					}else{
						$(".infocp").html('请选择客户');
					}
					$(".addprolist").remove();
					
					$("#history").after(txt['quoted']);
			});  
			}
		});
	 });
 });
$(function(){
entchange(1);
});
function quoted_excel(id)
{
	
	if(confirm("确定生成excel吗？")){
		window.location='<!--{$cpfile}-->?c=quoted&a=excel&id='+id;
	}
}

function quoted_print(id)
{
	if(confirm("确定打印吗？")){
		window.open('<!--{$cpfile}-->?c=quoted&a=print&id='+id);
	}
}

</script>
