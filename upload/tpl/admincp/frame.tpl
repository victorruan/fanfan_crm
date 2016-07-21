<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><!--{$config.sitename}--></title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/ui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/ui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<!--{$urlpath}-->tpl/static/ui/src/jquery.parser.js"></script>
<link rel="stylesheet" type="text/css" href="<!--{$urlpath}-->tpl/static/ui/themes/gray/easyui.css" />
<link rel="stylesheet" type="text/css" href="<!--{$urlpath}-->tpl/static/ui/themes/icon.css" />
<style type="text/css">
.cy_setting div {
	padding: 10px;
}
.cy_setting div:hover {
	cursor: pointer;
	background: #f0f0f0;
}
.brandSecondaryBrd {
	border-top: 3px solid #1797C0;
}
.smallChart {
	width: 250px;
	float: left;
	margin: 10px;
}
.shadow {
	border: 1px solid #E0E3E5;
}
.shadow_title {
	background-color: #F2F3F3;
	font-weight: bold;
	padding: 5px;
	text-align: center;
}
.shadow_content {
	line-height: 25px;
	padding: 5px;
}
.login_filter {
	filter: Alpha(opacity=40);
	background: #000; /*实现IE背景透明*/
	-moz-opacity: 0.4; /*支持3.5以下低的火狐背景透明*/
	opacity: 0.4; /*支持3.5以上火狐遨游，opera等背景透明*/
	background: #f0f0f0;
	text-align: right;
	padding: 5px;
}
.login_filter p {
	position: relative;
	color: #FFF;
}
.tree ul {
	list-style-type: none;
	margin: 0px;
	left: 0px;
	padding: 0px;
}
.tree ul li {
	padding: 5px;
	cursor: pointer;
	text-decoration: none;
}
.tree ul li:hover {
	background-color: #f0f0f0;
}
</style>
</head>
<body class="easyui-layout">
<!--头部-->
<div data-options="region:'north',split:true,border:false" style="height: 60px; background: #1B3160;
color: White;">
  <table width="100%" border="0" cellpadding="0" cellspacing="0" height="55px">
    <tr>
      <td align="left" width="120px" style="padding-left:10px;"><img width="<!--{if $config.logowidth}--><!--{$config.logowidth}--><!--{else}-->92<!--{/if}-->" height="<!--{if $config.logoheight}--><!--{$config.logoheight}--><!--{else}-->30<!--{/if}-->" src="<!--{if $config.logo}--><!--{$config.logo}--><!--{else}--><!--{$urlpath}-->tpl/static/ui/images/logo.png<!--{/if}-->" /></td>
      <td></td>
      <td align="right" style="padding-right:10px;"><p> admin,欢迎您] <a href="javascript:addTab('修改密码', 'archives', '<!--{$cpfile}-->?c=admin&a=editpassword')" style="color:#FFFFFF">[修改密码]</a> <a href="<!--{$cpfile}-->?c=login&a=logout" style="color:#FFFFFF">[退出]</a></p></td>
    </tr>
  </table>
</div>
<!--尾部-->
<div data-options="region:'south',border:false" title="" style="height: 50px; padding: 10px;
background: #efefef;">
  <div class="easyui-layout" data-options="fit:true" style="background: #ccc;">
    <div data-options="region:'center'" style="padding: 3px;">
      <table>
        <tr>
          <td><span onClick="addTab('群发邮箱', 'listen', '<!--{$cpflie}-->?c=marketing')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/listen.png" alt="群发邮箱" style="vertical-align: middle;" />群发邮箱</span>&nbsp;&nbsp;</td>
          <td><span onClick="addTab('产品录入', 'product_169', '<!--{$cpflie}-->?c=product&a=add')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/product_169.png" alt="产品录入" style="vertical-align: middle;" />产品录入</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('未审核询价单', 'comment2', '<!--{$cpflie}-->?c=quoted&sview=1')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png" alt="未审核询价单" style="vertical-align: middle;" />未审核询价单</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('未转订单询价单', 'comment2', '<!--{$cpflie}-->?c=quoted&sview=4')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png" alt="未转订单询价单" style="vertical-align: middle;" />未转订单询价单</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('询价发布', 'comment2', '<!--{$cpflie}-->?c=quoted&a=add')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png" alt="询价发布" style="vertical-align: middle;" />询价发布</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('未处理订单', 'shopping_cart_empty', '<!--{$cpflie}-->?c=order&sview=1')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png" alt="未处理订单" style="vertical-align: middle;" />未处理订单</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('已付款待发货', 'shopping_cart_empty', '<!--{$cpflie}-->?c=order&sview=2')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png" alt="已付款待发货" style="vertical-align: middle;" />已付款待发货</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('添加订单', 'shopping_cart_empty', '<!--{$cpflie}-->?c=order&a=add')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png" alt="添加订单" style="vertical-align: middle;" />添加订单</span>&nbsp;&nbsp; </td>
          <td><span onClick="addTab('客户录入', 'customers', '<!--{$cpflie}-->?c=user&a=add')" style="cursor:pointer;"> <img src="<!--{$urlpath}-->tpl/static/ui/images/16/customers.png" alt="客户录入" style="vertical-align: middle;" />客户录入</span>&nbsp;&nbsp; </td>
        </tr>
      </table>
    </div>
    <div data-options="region:'east',split:true" style="width: 300px; padding: 5px; text-align: right;"> 
      <!--{$copyright_poweredby}--> Version <!--{$copyright_version}--><!--{$copyright_release}--> 
    </div>
  </div>
</div>

<!--右边-->
<div class="cy_setting" data-options="region:'east',split:true" title="快捷方式" style="width: 110px;
text-align: center;">
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/milestone.png' alt='一键业务 ' onClick="addTab('一键业务 ', 'milestone', '<!--{$cpflie}-->?c=guide')" /><br />
    一键业务 </div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/customers.png' alt='客户资料' onClick="addTab('客户资料列表', 'customers', '<!--{$cpflie}-->?c=user')" /><br />
    客户资料</div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/product_169.png' alt='产品列表' onClick="addTab('产品列表', 'product_169', '<!--{$cpflie}-->?c=product')" /><br />
    产品列表</div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/shopping_cart_empty.png' alt='订单列表' onClick="addTab('订单列表', 'shopping_cart_empty', '<!--{$cpflie}-->?c=order')" /><br />
    订单列表</div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/comment.png' alt='询价列表' onClick="addTab('询价列表', 'comment2', '<!--{$cpflie}-->?c=quoted')" /><br />
    询价列表</div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/process.png' alt='财务收支 ' onClick="addTab('财务收支 ', 'process', '<!--{$cpflie}-->?c=finance')" /><br />
    财务收支 </div>
  <div> <img src='<!--{$urlpath}-->tpl/static/ui/images/32/settings.png' alt='系统设置' onClick="addTab('账号列表', 'settings', '<!--{$cpflie}-->?c=admin')" /><br />
    系统设置</div>
</div>
<!--左边-->
<div data-options="region:'west',split:true" title="功能菜单" style="width: 150px; padding1: 1px;
overflow: hidden;">
  <div class="easyui-accordion" data-options="fit:true,border:false,animate:false">
    <div title="产品管理" style="padding: 10px; overflow: auto;" data-options="selected:true"  class="tree">
      <ul>
        <li onClick="addTab('产品列表', 'product_169', '<!--{$cpfile}-->?c=product')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/product_169.png' alt='产品列表' style="vertical-align: middle;" /> 产品列表 </li>
        <li onClick="addTab('产品分类', 'product_169', '<!--{$cpfile}-->?c=product&a=classified')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/product_169.png' alt='产品分类' style="vertical-align: middle;" /> 产品分类 </li>
        <li onClick="addTab('产品品牌', 'product_169', '<!--{$cpfile}-->?c=product&a=brand')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/product_169.png' alt='产品品牌' style="vertical-align: middle;" /> 产品品牌 </li>
        <li onClick="addTab('产品录入', 'product_169', '<!--{$cpfile}-->?c=product&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/product_169.png' alt='产品录入' style="vertical-align: middle;" /> 产品录入 </li>
      </ul>
    </div>
    <div title="询价管理" style="padding: 10px;" class="tree">
      <ul>
        <li onClick="addTab('询价列表', 'comment2', '<!--{$cpfile}-->?c=quoted')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='询价列表' style="vertical-align: middle;" /> 询价列表 </li>
        <li onClick="addTab('未审核询价单', 'comment2', '<!--{$cpfile}-->?c=quoted&sview=1')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='未审核询价单' style="vertical-align: middle;" /> 未审核询价单 </li>
        <li onClick="addTab('审核失败询价单', 'comment2', '<!--{$cpfile}-->?c=quoted&sview=2')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='审核失败询价单' style="vertical-align: middle;" /> 审核失败询价单 </li>
        <li onClick="addTab('审核成功询价单', 'comment2', '<!--{$cpfile}-->?c=quoted&sview=3')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='审核成功询价单' style="vertical-align: middle;" /> 审核成功询价单 </li>
        <li onClick="addTab('未转订单询价单', 'comment2', '<!--{$cpfile}-->?c=quoted&sview=4')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='未转订单询价单' style="vertical-align: middle;" /> 未转订单询价单 </li>
        <li onClick="addTab('已转订单询价单', 'comment2', '<!--{$cpfile}-->?c=quoted&sview=5')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='已转订单询价单' style="vertical-align: middle;" /> 已转订单询价单 </li>
        <li onClick="addTab('询价发布', 'comment2', '<!--{$cpfile}-->?c=quoted&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/comment2.png' alt='询价发布' style="vertical-align: middle;" /> 询价发布 </li>
      </ul>
    </div>
    <div title="订单管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('订单列表', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='订单列表' style="vertical-align: middle;" /> 订单列表 </li>
        <li onClick="addTab('未处理订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=1')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='未处理订单' style="vertical-align: middle;" /> 未处理订单 </li>
        <li onClick="addTab('已付款待发货', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=2')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已付款待发货' style="vertical-align: middle;" /> 已付款待发货 </li>
        <li onClick="addTab('已发货订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=3')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已发货订单' style="vertical-align: middle;" /> 已发货订单 </li>
        <li onClick="addTab('已完成订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=4')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已完成订单' style="vertical-align: middle;" /> 已完成订单 </li>
        <li onClick="addTab('已退款订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=5')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已退款订单' style="vertical-align: middle;" /> 已退款订单 </li>
        <li onClick="addTab('已退货订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=6')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已退货订单' style="vertical-align: middle;" /> 已退货订单 </li>
        <li onClick="addTab('已作废订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&sview=7')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='已作废订单' style="vertical-align: middle;" /> 已作废订单 </li>
        <li onClick="addTab('添加订单', 'shopping_cart_empty', '<!--{$cpfile}-->?c=order&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='添加订单' style="vertical-align: middle;" /> 添加订单 </li>
        <li onClick="addTab('订单配置', 'shopping_cart_empty', '<!--{$cpfile}-->?c=setting&a=order')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='订单配置' style="vertical-align: middle;" /> 订单配置 </li>
        <li onClick="addTab('配送方式', 'shopping_cart_empty', '<!--{$cpfile}-->?c=shiptype')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='配送方式' style="vertical-align: middle;" /> 配送方式</li>
        <li onClick="addTab('物流公司', 'shopping_cart_empty', '<!--{$cpfile}-->?c=deliverycorp')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/shopping_cart_empty.png' alt='物流公司' style="vertical-align: middle;" /> 物流公司</li>
      </ul>
    </div>
    <div title="客户管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('客户资料列表', 'customers', '<!--{$cpfile}-->?c=user')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/customers.png' alt='客户资料列表' style="vertical-align: middle;" /> 客户资料列表 </li>
        <li onClick="addTab('客户资料列表', 'customers', '<!--{$cpfile}-->?c=user&sview=1')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/customers.png' alt='客户资料列表' style="vertical-align: middle;" /> 企业客户资料 </li>
        <li onClick="addTab('个体客户资料', 'customers', '<!--{$cpfile}-->?c=user&sview=2')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/customers.png' alt='个体客户资料' style="vertical-align: middle;" /> 个体客户资料 </li>
        <li onClick="addTab('客户录入', 'customers', '<!--{$cpfile}-->?c=user&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/customers.png' alt='客户录入' style="vertical-align: middle;" /> 客户录入 </li>
        <li onClick="addTab('客户折扣等级', 'customers', '<!--{$cpfile}-->?c=user&a=discount')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/customers.png' alt='客户折扣等级' style="vertical-align: middle;" /> 客户折扣等级 </li>
      </ul>
    </div>
    <div title="财务管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('账户设置', 'process', '<!--{$cpfile}-->?c=account')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/process.png' alt='账户设置' style="vertical-align: middle;" /> 账户设置 </li>
        <li onClick="addTab('财务参数', 'process', '<!--{$cpfile}-->?c=paramter')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/process.png' alt='财务参数' style="vertical-align: middle;" /> 财务参数 </li>
        <li onClick="addTab('财务收支', 'process', '<!--{$cpfile}-->?c=finance')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/process.png' alt='财务收支' style="vertical-align: middle;" /> 财务收支 </li>
        <li onClick="addTab('待开票订单', 'process', '<!--{$cpfile}-->?c=invoice&a=applist')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/process.png' alt='待开票订单' style="vertical-align: middle;" /> 待开票订单 </li>
        <li onClick="addTab('已开票订单', 'process', '<!--{$cpfile}-->?c=invoice')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/process.png' alt='已开票订单' style="vertical-align: middle;" /> 已开票订单 </li>
      </ul>
    </div>
    <div title="统计管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('财务统计', 'pie-chart_graph', '<!--{$cpfile}-->?c=statistical&a=financial')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/pie-chart_graph.png' alt='财务统计' style="vertical-align: middle;" /> 财务统计 </li>
        <li onClick="addTab('客户统计', 'pie-chart_graph', '<!--{$cpfile}-->?c=statistical&a=customer')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/pie-chart_graph.png' alt='客户统计' style="vertical-align: middle;" /> 客户统计 </li>
        <li onClick="addTab('询价单统计', 'pie-chart_graph', '<!--{$cpfile}-->?c=statistical&a=quoted')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/pie-chart_graph.png' alt='询价单统计' style="vertical-align: middle;" /> 询价单统计 </li>
        <li onClick="addTab('订单统计', 'pie-chart_graph', '<!--{$cpfile}-->?c=statistical&a=order')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/pie-chart_graph.png' alt='订单统计' style="vertical-align: middle;" /> 订单统计 </li>
      </ul>
    </div>
    <div title="营销管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('群发邮箱', 'listen', '<!--{$cpfile}-->?c=marketing')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/listen.png' alt='群发邮箱' style="vertical-align: middle;" /> 群发邮箱 </li>
        <li onClick="addTab('邮箱设置', 'listen', '<!--{$cpfile}-->?c=setting&a=mail')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/listen.png' alt='邮箱设置' style="vertical-align: middle;" /> 邮箱设置 </li>
        <li onClick="addTab('邮件模板设置', 'listen', '<!--{$cpfile}-->?c=mailtpl')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/listen.png' alt='邮件模板设置' style="vertical-align: middle;" /> 邮件模板设置 </li>
      </ul>
    </div>
    <div title="系统管理" style="padding: 10px" class="tree">
      <ul>
        <li onClick="addTab('账号列表', 'settings', '<!--{$cpfile}-->?c=admin')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='账号列表' style="vertical-align: middle;" /> 账号列表 </li>
        <li onClick="addTab('添加管理员', 'settings', '<!--{$cpfile}-->?c=admin&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='添加管理员' style="vertical-align: middle;" /> 添加管理员 </li>
        <li onClick="addTab('修改密码', 'settings', '<!--{$cpfile}-->?c=admin&a=editpassword')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='修改密码' style="vertical-align: middle;" /> 修改密码 </li>
        <li onClick="addTab('部门、组设置', 'settings', '<!--{$cpfile}-->?c=authgroup')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='部门、组设置' style="vertical-align: middle;" /> 部门、组设置 </li>
        <li onClick="addTab('添加部门/组', 'settings', '<!--{$cpfile}-->?c=authgroup&a=add')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='添加部门/组' style="vertical-align: middle;" /> 添加部门/组 </li>
        <li onClick="addTab('系统设置', 'settings', '<!--{$cpfile}-->?c=setting')"> <img src='<!--{$urlpath}-->tpl/static/ui/images/16/settings.png' alt='系统设置' style="vertical-align: middle;" /> 系统设置 </li>
      </ul>
    </div>
  </div>
</div>
<!--中间-->
<div data-options="region:'center',split:true,border:false" title="" style="overflow: hidden;">
  <div class="easyui-tabs" data-options="fit:true,border:false">
    <div title="系统主页" data-options="iconCls:'icon-home'" style="padding: 0px;">

      <div class="main-wrap" style="overflow:hidden;">
        <div class="path">
          <p>当前位置：系统主页<span></span></p>
        </div>
        <div class="main-cont">
          <h3 class="title">系统信息</h3>
          <div class="box">
            <div class="btn-group clear">
              <a class="btn-general" href="http://www.phpcoo.com/" target="_blank"><span>OESOP官方网</span></a> <a class="btn-general" href="http://bbs.phpcoo.com/" target="_blank"><span>技术论坛</span></a> <a class="btn-general" href="http://www.phpcoo.com/contact" target="_blank"><span>联系客服</span></a> <a class="btn-general" href="mailto:phpcoo@qq.com"><span>意见反馈</span></a> </div>
          </div>
          <h3 class="title">官方最新动态</h3>
          <div class="box">
            <ul class="news-item" id="news">
              <script language="javascript" src="http://www.phpcoo.com/data/include/oecms.php"></script>
            </ul>
          </div>
		   <div style="clear:both;"></div>

		  <h3 class="title" style='display:block;'>系统基本数据</h3>
		  <div class="box" style="width:100%;overflow:hidden;">
			<ul class="group-item">
			  <li>询价总数：<span><!--{$sysdata.quotedtotal|number_format}--></span></li>
			  <li>产品总数：<span><!--{$sysdata.goodstotal|number_format}--></span></li>
			  <li>客户总数：<span><!--{$sysdata.corptotal|number_format}--></span></li>
			</ul>
			<ul class="group-item">
			  <li>订单总数：<span><!--{$sysdata.ordertotal|number_format}--></span></li>
			</ul>
		  </div>

          <div style="clear:both;"></div>

		  <h3 class="title" style='display:block;'>服务器信息</h3>
		  <div class="box" style="width:100%;overflow:hidden;">
			<ul class="group-item">
			  <li>服务器IP：<span><!--{$sysdata.serverip}--></span></li>
			  <li>客户端IP：<span><!--{$sysdata.clientip}--></span></li>
			  <li>操作系统：<span><!--{$sysdata.os}--></span></li>
			</ul>

			<ul class="group-item">
			  <li>web引擎：<span><!--{$sysdata.webengine|filterhtml:30}--></span></li>
			  <li>PHP版本：<span><!--{$sysdata.phpversion}--></span></li>
			  <li>curl支持：<span><!--{$sysdata.curl}--></span></li>
			</ul>

			<ul class="group-item">
			  <li>GD版本：<span><!--{$sysdata.gd}--></span></li>
			  <li>iconv支持：<span><!--{$sysdata.iconv}--></span></li>
			  <li>url fopen：<span><!--{$sysdata.urlopen}--></span></li>
			</ul>
		  </div>


        </div>
        <div style="clear:both;"></div>
      </div>


    </div>
  </div>
</div>
</div>
<script type="text/javascript">
var index = 0;
function addTab(title, icon, url) {
	if(typeof(url) == 'undefined') {url = '';}
    
	if ($('.easyui-tabs').tabs('exists', title)) {
		$('.easyui-tabs').tabs('select', title);//判断是否打开过选项卡，已打开就选择
		var tab = $('.easyui-tabs').tabs('getSelected'); //获取被选择的选项卡面板名称。
        //更新选项卡
        $('.easyui-tabs').tabs('update', {
            tab:tab, 
            options:{
                title: title,
    			content: ' <iframe name="tabid1" id="tabid1" src="'+url+'" frameborder="0" style="width:100%; height:96%"></iframe>',
    			iconCls: 'icon-' + icon,
    			closable: true
            }   
        });
	}
	else {
		index++;
		$('.easyui-tabs').tabs('add', {
			title: title,
			content: ' <iframe name="tabid1" id="tabid1" src="'+url+'" frameborder="0" style="width:100%; height:96%"></iframe>',
			iconCls: 'icon-' + icon,
			closable: true
		});
	}
}
</script>
</body>
</html>
