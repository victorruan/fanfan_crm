<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>查询物品</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
</head>
    <style>
        .aui_outer
        {
            text-align: left;
        }
        .aui_border, .aui_inner
        {
            border: 0 none;
            border-collapse: collapse;
            margin: 0;
            width: auto;
        }
        .aui_nw, .aui_n, .aui_ne, .aui_w, .aui_center, .aui_e, .aui_sw, .aui_s, .aui_se, .aui_header, .aui_tdIcon, .aui_main, .aui_footer
        {
            padding: 0;
        }
        .aui_header, .aui_buttons button
        {
            font: 12px/1.11 'Microsoft Yahei' ,Tahoma,Arial,Helvetica,STHeiti;
        }
        .aui_title
        {
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .aui_close
        {
            display: block;
            outline: medium none;
            position: absolute;
            text-decoration: none;
        }
        .aui_close:hover
        {
            text-decoration: none;
        }
        .aui_main
        {
            min-width: 9em;
            text-align: center;
        }
        .aui_content
        {
            border: 0 none;
            display: inline-block;
            text-align: left;
        }
        .aui_content.aui_state_full
        {
            display: block;
            height: 100%;
            margin: 0;
            padding: 0 !important;
            width: 100%;
        }
        .aui_loading
        {
            background: url("icons/loading.gif") no-repeat scroll center center transparent;
            height: 32px;
            overflow: hidden;
            text-align: left;
            text-indent: -999em;
            width: 96px;
        }
        .aui_icon
        {
            vertical-align: middle;
        }
        .aui_icon div
        {
            height: 48px;
            margin: 10px 0 10px 10px;
            width: 48px;
        }
        .aui_buttons
        {
            padding: 5px;
            text-align: right;
            white-space: nowrap;
        }
        .aui_buttons button
        {
            background: -moz-linear-gradient(center top , #FFFFFF, #DDDDDD) repeat scroll 0 0 transparent;
            border: 1px solid #999999;
            border-radius: 5px 5px 5px 5px;
            box-shadow: 0 1px 0 rgba(255, 255, 255, 0.7), 0 -1px 0 rgba(0, 0, 0, 0.09);
            color: #333333;
            cursor: pointer;
            display: inline-block;
            letter-spacing: 2px;
            line-height: 1;
            margin-left: 15px;
            overflow: visible;
            padding: 6px 10px;
            text-align: center;
            text-shadow: 0 1px 1px #FFFFFF;
            width: auto;
        }
        .aui_buttons button:focus
        {
            border-color: #426DC9;
            box-shadow: 0 0 8px rgba(66, 109, 201, 0.9);
            outline: 0 none;
        }
        .aui_buttons button:hover
        {
            border-color: #666666;
            color: #000000;
        }
        .aui_buttons button:active
        {
            background: -moz-linear-gradient(center top , #DDDDDD, #FFFFFF) repeat scroll 0 0 transparent;
            border-color: #666666;
            box-shadow: 0 1px 5px rgba(66, 109, 201, 0.9) inset, 0 1px 1em rgba(0, 0, 0, 0.3) inset;
        }
        .aui_buttons button[disabled]
        {
            background: none repeat scroll 0 0 #DDDDDD;
            border: 1px solid #999999;
            box-shadow: none;
            color: #666666;
            cursor: default;
            opacity: 0.5;
        }
        button.aui_state_highlight
        {
            background: -moz-linear-gradient(center top , #33BBEE, #2288CC) repeat scroll 0 0 transparent;
            border: 1px solid #3399DD;
            color: #FFFFFF;
            text-shadow: -1px -1px 1px #1C6A9E;
        }
        button.aui_state_highlight:hover
        {
            border-color: #1C6A9E;
            color: #FFFFFF;
        }
        button.aui_state_highlight:active
        {
            background: -moz-linear-gradient(center top , #33BBEE, #2288CC) repeat scroll 0 0 transparent;
            border-color: #1C6A9E;
        }
        .aui_inner
        {
            background: none repeat scroll 0 0 #FFFFFF;
        }
        .aui_outer, .aui_center
        {
            border: 1px solid rgba(0, 0, 0, 0.3) !important;
        }
        .aui_outer
        {
            border-radius: 3px 3px 3px 3px;
        }
        .aui_border
        {
            border-radius: 2px 2px 2px 2px;
            box-shadow: 0 0 1px rgba(255, 255, 255, 0.9) inset;
        }
        .aui_nw, .aui_ne, .aui_sw, .aui_se
        {
            height: 8px;
            width: 8px;
        }
        .aui_nw, .aui_n, .aui_ne, .aui_w, .aui_e, .aui_sw, .aui_s, .aui_se
        {
            background: none repeat scroll 0 0 rgba(0, 0, 0, 0.2);
        }
        .aui_state_focus .aui_inner
        {
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.4);
        }
        .aui_state_focus .aui_outer
        {
            box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
        }
        .aui_state_drag .aui_outer
        {
            border: 1px solid rgba(0, 0, 0, 0.4) !important;
            box-shadow: none;
        }
        .aui_titleWrap
        {
            height: 100%;
            position: relative;
        }
        .aui_title
        {
            background: -moz-linear-gradient(center top , #EDF5F8, #BDC6CD) repeat scroll 0 0 transparent;
            border-bottom: 1px solid #BDC6CD;
            color: #95A7AE;
            font-weight: bold;
            height: 28px;
            line-height: 28px;
            padding: 0 28px 0 10px;
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.7);
        }
        .aui_state_focus .aui_title
        {
            color: #4C5A5F;
        }
        .aui_state_drag .aui_title
        {
            background: -moz-linear-gradient(center top , #BDC6CD, #EDF5F8) repeat scroll 0 0 transparent;
            box-shadow: none;
        }
        .aui_state_drag .aui_titleWrap
        {
            box-shadow: none;
        }
        .aui_close
        {
            color: #68767B;
            font-family: Helvetica,STHeiti;
            font-size: 18px;
            height: 21px;
            line-height: 21px;
            padding: 0;
            right: 3px;
            text-align: center;
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.9);
            top: 3px;
            width: 21px;
        }
        .aui_close:hover
        {
            color: #C72015;
        }
        .aui_close:active
        {
            box-shadow: none;
        }
        .aui_content
        {
            color: #666666;
        }
        .aui_state_focus .aui_content
        {
            color: #000000;
        }
        body, button, input, select, textarea
        {
            font: 12px/1.5 tahoma,arial,宋体宋体;
        }
        input, select, textarea
        {
            font-size: 100%;
        }
        table
        {
            border-collapse: collapse;
            border-spacing: 0;
        }
        th
        {
            text-align: inherit;
        }
        fieldset, img
        {
            border: 0 none;
        }
        iframe
        {
            display: block;
        }
        abbr, acronym
        {
            border: 0 none;
            font-variant: normal;
        }
        del
        {
            text-decoration: line-through;
        }
        address, caption, cite, code, dfn, em, th, var
        {
            font-style: normal;
            font-weight: 500;
        }
        ol, ul
        {
            list-style: none outside none;
        }
        caption, th
        {
            text-align: left;
        }
        h1, h2, h3, h4, h5, h6
        {
            font-size: 100%;
            font-weight: 500;
        }
        q:before, q:after
        {
            content: "";
        }
        sup
        {
            vertical-align: text-top;
        }
        sub
        {
            vertical-align: text-bottom;
        }
        a:hover
        {
            text-decoration: underline;
        }
        ins, a
        {
            text-decoration: none;
        }
        .fn-clear:after
        {
            clear: both;
            content: " ";
            display: block;
            font-size: 0;
            height: 0;
            visibility: hidden;
        }
        .fn-clear
        {
        }
        body .fn-hide
        {
            display: none;
        }
        .fn-left, .fn-right
        {
            display: inline;
        }
        .fn-left
        {
            float: left;
        }
        .fn-right
        {
            float: right;
        }
        /*sssssssssssss*/.window_top
        {
            padding: 10px;
        }
        .window_main
        {
            margin: 10px;
        }
        .window_main_left
        {
            border: 1px solid #e1e1e1;
            padding: 10px;
            float: left;
            width: 20%;
            overflow-x: hidden;
            overflow-y: auto;
            bottom: 50px;
        }
        .window_main_right
        {
            float: right;
            width: 76%;
        }
        .window_main_top
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
        }
        .window_main_second
        {
            background-image: url("http://css.web08.net/images/default/windows-bg1.gif");
            padding: 6px 5px;
            border: 1px solid #e1e1e1;
            margin-top: 10px;
        }
        .window_table
        {
            width: 100%;
            margin-top: 10px;
            line-height: 30px;
            text-align: center;
        }
        .window_table tr td
        {
            border-right: 1px solid #e1e1e1;
        }
        .window_main_content
        {
            border: 1px solid #e1e1e1;
        }
    </style>

<body>
<!--{if $a eq "search"}-->
<div class="main-wrap">
  <div class="main-cont">
    <table>
        <tbody>
            <tr>
                <td>
	 			 <form method="post" id="search_form" action="<!--{$cpfile}-->?c=norms" />
                 <input name="a" type="hidden" value="handle" />
                 <input name="artno" id="artno" type="hidden" value="" />
                 <input name="gdmodel" id="gdmodel" type="hidden" value="" />
                 <input name="gdsn" id="gdsn" type="hidden" value="" />
                 <input name="stocks" id="stocks" type="hidden" value="" />
                 <input name="costrice" id="costrice" type="hidden" value="" />
                 <input name="oprice" id="oprice" type="hidden" value="" />
                 <input name="bprice" id="bprice" type="hidden" value="" />
                 <input name="gdcolourname" id="gdcolourname" type="hidden" value="" />
                 <input name="gdcolour" id="gdcolour" type="hidden" value="" />
                    <table class="aui_inner">
                        <tbody>
                            
                            <tr>
                                <td style="width: 800px;">
                                    <div style="padding: 20px 25px" class="aui_content aui_state_full">
                                        <!--<iframe frameborder="0" src="123456.html" name="OpenartDialog13614344189692" style="width: 100%; height: 100%; border: 0px none;" allowtransparency="true"></iframe>-->
                                        <div class="window_top">
                                            <strong>商品规格</strong>（点选当前产品所需要规格）
                                        </div>
                                        <div class="window_main">
                                            <div class="window_main_left">
                                                <ul>
                                                <!--{foreach $data as $key=>$val}-->
                                     <li><a href="javascript:getValList(<!--{$key}-->,<!--{$val.nid}-->)"><!--{$val.nname}--></a></li>
                                                   <!--{/foreach}-->
                                                </ul>
                                            </div>
                                            <div class="window_main_right">
                                            <!--{foreach $data as $vals}-->
                                                <div class="window_main_top">
                               <input type="checkbox" id="checkall<!--{$vals.nid}-->" value="1" onclick="allcheck($(this),'<!--{$vals.nid}-->')" />ALL
                                                </div>  
                                                <div class="norms_vallist">
                                               <!--{foreach $vals.nvalue as $val}-->
               <input type="checkbox" name="normsnname[]" class="allcheck<!--{$vals.nid}-->" id='value<!--{$val.id}-->' onclick="normsval_add('<!--{$val.normsnname}-->',$(this),'<!--{$vals.nid}-->')" value="<!--{$val.id}-->" /><!--{$val.normsnname}-->
                                                <!--{/foreach}-->
                                                 </div>
                                                  <!--{/foreach}-->
                                                <table class="window_table">
                                                    <tr class="window_main_second" id="list-tops">
                                                        <td>系统规格</td>
                                                        <td>自定义规格值</td>
                                                        <td>自定义规格图片</td>
                                                        <td>操作</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="aui_footer">
                                <input name="提交" type="button" id="tijiao" onclick="tijiaonorms()" value="提交" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </form>
                </td>
                <td class="aui_e">
                </td>
            </tr>
        </tbody>
    </table>
  </div>
</div>
<!--{/if}-->
</body>
</html>
<script language="javascript">
function allcheck(my,nid){
	var checked=my.attr("checked");
	if(checked){
		$(".allcheck"+nid).each(function(i){
		    var ischecked=$(this).attr("checked");
			if(!ischecked){
				this.click();
			}
		 });
		$(".allcheck"+nid).attr("checked","checked");
	}else{
		$(".allcheck"+nid).each(function(i){
		    var ischecked=$(this).attr("checked");
			if(ischecked){
				this.click();
			}
		 });	
		$(".allcheck"+nid).attr("checked","");
	}
}
function getValList(num,nid)
{
	$(".window_main_top").hide();
	$(".norms_vallist").hide();
	$(".allspcies").hide();
	$(".species_"+nid).show();
	$(".norms_vallist").eq(num).show();
	$(".window_main_top").eq(num).show();
}
getValList(0,1);

function tijiaonorms(){
	var artno=window.parent.$("#artno").val();
	$("#artno").val(artno);
	var gdmodel=window.parent.$("#gdmodel").val();
	$("#gdmodel").val(gdmodel);
	var gdsn=window.parent.$("#gdsn").val();
	$("#gdsn").val(gdsn);
	var stocks=window.parent.$("#stocks").val();
	$("#stocks").val(stocks);
	var costrice=window.parent.$("#costrice").val();
	$("#costrice").val(costrice);
	var oprice=window.parent.$("#oprice").val();
	$("#oprice").val(oprice);
	var bprice=window.parent.$("#bprice").val();
	$("#bprice").val(bprice);
	var gdcolourname=window.parent.$("#gdcolourname").val();
	$("#gdcolourname").val(gdcolourname);
	var gdcolour=window.parent.$("#gdcolour").val();
	$("#gdcolour").val(gdcolour);
	$("#search_form").submit();
}
</script>
