<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>产品内容</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<style>
.show{display:none}
.show div table,.show div td{ border:0}
</style>

</head>
<body>
    <div class="main-wrap">
        <div class="path">
            <p>当前位置：业务员模块<span>&gt;&gt;</span>业务员向导</p>
        </div>
        <div class="main-cont">
      <h3 class="title">新客户快速注册</h3>
    <div class="search-area ">
    	 <form method="post" id="search_forms" action="<!--{$cpfile}-->?c=guide&a=saveadd"  autocomplete="off"/>
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
	 <form method="post" id="search_form" action="<!--{$cpfile}-->?c=guide&a=search" />
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
    
    
    
    		<!--{if $a eq 'search'}-->
            <div style="margin: 8px;">
                <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                    font-weight: bold; text-align: center; float: left;">
                    客户列表
                </div>
                <div style="clear: both;">
                </div>
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
                <div style="clear: both;">
                </div>
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
            <div style="clear: both;">
            </div>
            
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
            <div style="clear: both;">
            </div>
            
            <div style=" border-top:2px solid #1D86D7; padding-top: 10px; line-height: 25px;">
             <input name='itemmaxsorts' id='itemmaxsorts' type='hidden' value='0' />
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
           
            <div style="background-color: #f0f0f0; width: 120px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                客户订单记录
            </div>
            <div style="clear: both;">
            </div>
            <div style="border-top:2px solid #1D86D7; padding-top: 10px;">
              <table border='0' cellpadding='1' cellspacing='1' class='tab'>
		    <tr id="historyorder">
			  <td class='hback_1' align="center" width='12%'>订单号</td>
			  <td class='hback_1' align="center" width='11%'>订单总额</td>
              <td class='hback_1' align="center" width='6%'>状态</td>
			  <td class='hback_1' align="center" width='14%'>主体（联系人）</td>
			  <td class='hback_1' align="center" width='8%'>收货人</td>
              <td class='hback_1' align="center" width='8%'>付款状态</td>
              <td class='hback_1' align="center" width='8%'>发货状态</td>
              <td class='hback_1' align="center" width='8%'>开票状态</td>
			</tr>
		  </table>
            </div>
            <input type="hidden" name="a" value="saveadd" />
            <input name='ajaxid' id='ajaxid' type='hidden' />
            <input name='ajaxname' id='ajaxname' type='hidden' />
            <div style="background-color: #f0f0f0; width: 350px; padding: 5px 10px 5px 10px;
                font-weight: bold; text-align: center; float: left; margin-top:10px;">
                客户现场订单(<span class="infocp" style="color:#CC0000">请选择客户</span>)
            </div>
            <div style="clear: both;">
            </div>
            <div style="border-top:2px solid #1D86D7; padding-top: 10px;">
          <input name='itemmaxsort' id='itemmaxsort' type='hidden' value='0' /> <span id='ditemmaxsort' class='f_red'></span>
		  <table border='0' cellpadding='0' cellspacing='0' class='table'>
		    <tr id="list-top">
			  <td class='hback_1' align="center" width='10%'>序号</td>
			  <td class='hback_1' align="center" width='10%'>物品ID</td>
			  <td class='hback_1' align="center" width='20%'>物品名称</td>
              <td class='hback_1' align="center" width='15%'>物品规格</td>
			  <td class='hback_1' align="center" width='10%'>物品价格</td>
              <td class='hback_1' align="center" width='10%'>折扣</td>
			  <td class='hback_1' align="center" width='10%'>物品数量</td>
			  <td class='hback_1' align="center">操作</td>
			</tr>
			<tr>
			  <td colspan='8' align="right"><a href="javascript:void(0);" onclick="return item_add($(this));">添加物品清单</a><span id="load_itemtips"></span> &nbsp;&nbsp;</td>
			</tr>
      <!--   <tr>
		<td class='hback_c2' colspan="7">订单金额</td>
	  </tr>
	  <tr>
	    <td class='hback_1' colspan="2">折扣优惠</td>
		<td class='hback' colspan="5"><input type='text' name='discountamount' id='discountamount' class='input-80' value="0.00"/></td>
	  </tr>-->
      <tr>
		<td class='hback_c2' colspan="7">订单所属会员及收货信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipuser" id="shipuser" class="input-100"  /> <span id='dshipuser' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货地址 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipaddress" id="shipaddress" class="input-txt"  /> 邮编：<input type="text" name="shipzipcode" id="shipzipcode" class="input-s"  />  <span id='dshipaddress' class='f_red'></span> </td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人手机 <span class="f_red">*</span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipmobile" id="shipmobile" class="input-100"  /> <span id='dshipmobile' class='f_red'></span> （可接收订单提醒短信）</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">收货人电话 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="shiptelephone" id="shiptelephone" class="input-150"  /> <span id='dshiptelephone' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">指定送货时间 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="shipday" id="shipday" class="input-txt"  /><span id='dshipday' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">订单附言 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="shipmemo" id="shipmemo" style="width:40%;height:50px;overflow:auto;"></textarea>  <span id='dshipmemo' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c3' colspan="7">配送方式及备注</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">配送方式 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><!--{$shiptype_select}--> <span id='dshipid' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">订单备注 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="remark" id="remark" style="width:40%;height:60px;overflow:auto;"></textarea>  <span id='dremark' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_c1' colspan="7">发票信息</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">开具发票 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="radio" name="istax" id="istax" value="1" />是， <input type="radio" name="istax" id="istax" value="0" checked />否，（温馨提示： 开具发票顾客将承担<b><font color="red"><!--{$config.taxrate}-->%</font></b>订单金额发票税金））</td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">发票抬头 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><input type="text" name="taxpayee" id="taxpayee" class="input-txt" /> <span id='dtaxpayee' class='f_red'></span></td>
	  </tr>
	  <tr>
		<td class='hback_1' colspan="2">发票内容 <span class="f_red"></span> </td>
		<td class='hback' colspan="5"><textarea name="taxcontent" id="taxcontent" style="width:40%;height:60px;overflow:auto;"></textarea> <span id='dtaxcontent' class='f_red'></span></td>
	  </tr>
            <tr>
            <td class='hback_none'><input type="button" name="botton" class="button" value="添加订单" onclick="ajaxorderadd();" /></td>
          </tr>
		  </table>
            </div>
        </div>
       
        
        <!--{/if}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
</body>
</html>
<script type="text/javascript">
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
		$(".infocp").eq(1).html('当前客户最低可享'+txt['discount']+' <a href="javascript:bonddiscount(\''+txt['discount']+'\',\'order\')">一键折扣转换</a>');
					}else if(txt['cpname'] && !txt['discount']){
						$(".infocp").html('当前客户没有折扣等级');
					}else{
						$(".infocp").html('请选择客户');
					}
					$(".addprolist").remove();
					$(".addprolistorder").remove();
//					$.each(txt['quoted'], function(i,row){
//						$("#history").after(row['productlist']);
//					});
					$("#history").after(txt['quoted']);
					$("#historyorder").after(txt['order']);
					//$.each(txt['order'], function(i,row){
						//$("#historyorder").after(row['orderproductilist']);
					//});
					$("#goodsamount").html(txt['order']['goodsamount']);
					
					
			});  
			}
		});
	 });
 });

$(function(){
entchange(1);
});

</script>
