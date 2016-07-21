<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<!--{$page_charset}-->" />
<title>询 价 单</title>
<!--{include file="<!--{$cptplpath}-->headerjs.tpl"}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_head')}-->
<style>
.show{display:none}
.show div table,.show div td{ border:0}
</style>

</head>
<body>
<!--{assign var='pluginevent' value=XHook::doAction('adm_main_top')}-->
<!--{if $a eq "print"}-->
       <h3> <p align="center"><strong>询 价 单</strong><strong> </strong></p></h3>
        <table border="1" cellspacing="0" cellpadding="0">
        <!--{foreach $data as $val}-->
          <tr>
            <td width="100"><p align="center"><strong>询价单编号 </strong></p></td>
            <td width="106"><p align="center"><strong>客户名称</strong></p></td>
            <td width="87"><p align="center"><strong>审核状态 </strong></p></td>
            <td width="104"><p align="center"><strong>手机 </strong></p></td>
            <td width="57"><p align="center"><strong>邮箱 </strong></p></td>
          </tr>
          
          <tr>
            <td width="50"><p align="center"><!--{$val.inquiryid}--></p></td>
            <td width="106"><p align="center"><!--{$val.cpname}--></p></td>
            <td width="87"><p align="center"><!--{if $val.examine eq 2}--><font color="#009900">审核成功</font><!--{elseif $val.examine eq 1}--><font color="#CC0000">审核失败</font><!--{else}-->未审核<!--{/if}--></p></td>
            <td width="104"><p align="center"><!--{$val.mobile}-->&nbsp;</p></td>
            <td width="57"><p align="center"><!--{$val.email}-->&nbsp;</p></td>
          </tr>
          
          <tr>
            <td width="100"><p align="center"><strong>物品ID </strong></p></td>
            <td width="106"><p align="center"><strong>物品名称</strong></p></td>
            <td width="87"><p align="center"><strong>物品询价 </strong></p></td>
            <td width="104"><p align="center"><strong>物品数量 </strong></p></td>
            <td width="57"><p align="center"><strong>备注 </strong></p></td>
          </tr>
          <!--{foreach $val.product as $vals}-->
          <tr>
            <td width="50"><p align="center"><!--{$vals.goodsid}--></p></td>
            <td width="106"><p align="center"><!--{$vals.goodsname}--></p></td>
            <td width="87"><p align="center"><!--{$vals.goodsprice}--></p></td>
            <td width="104"><p align="center"><!--{$vals.goodsnum}-->&nbsp;</p></td>
            <td width="57"><p align="center"><!--{$vals.goodsremarks}-->&nbsp;</p></td>
          </tr>
           <!--{/foreach}-->
          <!--{/foreach}-->
        </table>
<!--{/if}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
<script type="text/javascript">
    window.print();
</script>
</body>
</html>
