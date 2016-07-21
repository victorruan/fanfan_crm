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
       <h3> <p align="center"><strong>询 价 单</strong></p></h3>
        <table border="1" cellspacing="0" cellpadding="0" align="center">
        
          <tr>
            <td><p align="center"><strong>询价单编号 </strong></p></td>
            <td colspan="5"><p align="center"><!--{$data.inquiryid}--></p></td>
          </tr>
          <tr>
            <td><p align="center"><strong>客户名称 </strong></p></td>
            <td colspan="5"><p align="center"><!--{$data.cpname}--></p></td>
          </tr>
          <tr>
            <td><p align="center"><strong>手机 </strong></p></td>
            <td colspan="5"><p align="center"><!--{$data.mobile}-->&nbsp;</p></td>
          </tr>
          <tr>
            <td><p align="center"><strong>邮箱 </strong></p></td>
            <td colspan="5"><p align="center"><!--{$data.email}-->&nbsp;</p></td>
          </tr>
          
          <tr>
            <td width="100"><p align="center"><strong>物品ID </strong></p></td>
            <td width="106"><p align="center"><strong>物品名称</strong></p></td>
            <td width="87"><p align="center"><strong>物品询价 </strong></p></td>
            <td width="104"><p align="center"><strong>物品数量 </strong></p></td>
            <td width="104"><p align="center"><strong>总价 </strong></p></td>
            <td width="57"><p align="center"><strong>备注 </strong></p></td>
          </tr>
          <!--{foreach $data.product as $vals}-->
          <tr>
            <td><p align="center"><!--{$vals.goodsid}--></p></td>
            <td><p align="center"><!--{$vals.goodsname}--></p></td>
            <td><p align="center"><!--{$vals.goodsprice}--></p></td>
            <td><p align="center"><!--{$vals.goodsnum}-->&nbsp;</p></td>
            <td><p align="center"><!--{$vals.one_total}-->&nbsp;</p></td>
            <td><p align="center"><!--{$vals.goodsremarks}-->&nbsp;</p></td>
          </tr>
           <!--{/foreach}-->
           <tr>
            <td><p align="center"><strong>物品合计</strong></p></td>
            <td colspan="5"><p align="left"><!--{$data.total}-->&nbsp;</p></td>
          </tr>
         
          <tr>
            <td><p align="center"><strong>业务员姓名：</strong></p></td>
            <td colspan="5"><p align="left"><!--{$data.adminname}-->&nbsp;</p></td>
          </tr>
          <tr>
            <td><p align="center"><strong>联系手机：</strong></p></td>
            <td colspan="5"><p align="left"><!--{$data.mobile}-->&nbsp;</p></td>
          </tr>
          <tr>
            <td><p align="center"><strong>联系邮箱：</strong></p></td>
            <td colspan="5"><p align="left"><!--{$data.email}-->&nbsp;</p></td>
          </tr>
        </table>
<!--{/if}-->
<!--{assign var='pluginevent' value=XHook::doAction('adm_footer')}-->
<script type="text/javascript">
    window.print();
</script>
</body>
</html>
