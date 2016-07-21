--
-- 导出表中的数据 `{dbpre}account_action`
--

INSERT INTO `{dbpre}account_action` (`action_id`, `parent_id`, `action_code`) VALUES
(1, 0, 'pro'),
(2, 0, 'quo'),
(3, 0, 'order'),
(4, 0, 'cust'),
(5, 0, 'finan'),
(6, 0, 'stat'),
(7, 0, 'sys'),
(8, 0, 'marke'),
(9, 1, 'pro_class'),
(10, 1, 'pro_brand'),
(11, 1, 'pro_list'),
(12, 1, 'pro_in'),
(13, 3, 'order_list'),
(14, 3, 'order_manage'),
(15, 3, 'order_distribution'),
(16, 4, 'cust_infor'),
(17, 4, 'cust_in'),
(18, 5, 'finan_set'),
(19, 5, 'finan_parameter'),
(20, 5, 'finan_bp'),
(21, 5, 'finan_to'),
(22, 5, 'finan_ao'),
(23, 6, 'stat_finan'),
(24, 6, 'stat_cust'),
(25, 6, 'stat_quo'),
(26, 7, 'quo_list'),
(27, 7, 'quo_add'),
(28, 7, 'quo_edit'),
(29, 7, 'quo_depset'),
(30, 7, 'quo_depadd'),
(31, 8, 'marke_mass'),
(32, 8, 'marke_set'),
(33, 2, 'quo_set'),
(34, 2, 'quo_examine'),
(35, 0, 'bm'),
(36, 35, 'bm_guide'),
(37, 4, 'cust_discount');


--
-- 导出表中的数据 `{dbpre}mailtpl`
--

INSERT INTO `{dbpre}mailtpl` (`tplid`, `subject`, `content`, `tplsort`, `flag`) VALUES
(1, '询价单审核失败', '<p>\r\n	客户名称为:{username}<br />\r\n询价时间为:{quotedtime}\r\n</p>\r\n<p>\r\n	的<span style="color:#e56600;">询价单审核失败</span>\r\n</p>\r\n<span style="color:#e56600;"></span>', 'valid', 1),
(2, '询价单审核成功', '<p>\r\n	尊敬的客户:{username} 您{quotedtime}申请的询价单<span id="__kindeditor_bookmark_start_6__" style="display:none;"></span>己经出来了，并己通过了公司审核。\r\n</p>\r\n<p>\r\n	请快与公司客服联系吧。<span style="color:#009900;"></span> \r\n</p>\r\n<span style="color:#e56600;"></span>', 'valid', 1),
(3, '支付操作', '<p>\r\n	您好！{username}\r\n</p>\r\n<p>\r\n	你的订单号为:{orderid}\r\n</p>\r\n<p>\r\n	你的订单时间为{ordertime}\r\n</p>\r\n<p>\r\n	已收到你的款项\r\n</p>', 'inform', 1),
(4, '发货操作', '<p>\r\n	您好！{username}\r\n</p>\r\n<p>\r\n	你的订单号为:{orderid}\r\n</p>\r\n<p>\r\n	你的订单时间为{ordertime}\r\n</p>\r\n<p>\r\n	我们已将货物发出\r\n</p>', 'inform', 1),
(5, '退款操作', '<p>\r\n	您好！{username}\r\n</p>\r\n<p>\r\n	你的订单号为:{orderid}\r\n</p>\r\n<p>\r\n	你的订单时间为{ordertime}\r\n</p>\r\n<p>\r\n	已退回款\r\n</p>', 'inform', 1),
(6, '退货操作', '<p>\r\n	您好！{username}\r\n</p>\r\n<p>\r\n	你的订单号为:{orderid}\r\n</p>\r\n<p>\r\n	你的订单时间为{ordertime}\r\n</p>\r\n<p>\r\n	已退回货物\r\n</p>', 'inform', 1);

--
-- 导出表中的数据 `{dbpre}options`
--

INSERT INTO `{dbpre}options` (`optionname`, `optionvalue`, `optiondesc`) VALUES
('active_plugins', '', '插件'),
('nonce_templet', 'default   ', '当前模板'),
('site_base', 'a:6:{s:8:"sitename";s:23:"OESOP业务管理系统";s:7:"siteurl";s:22:"http://127.0.0.1:8084/";s:4:"logo";s:0:"";s:9:"logowidth";i:0;s:10:"logoheight";i:0;s:8:"timezone";i:8;}', '系统基本信息'),
('site_footer', '', '底部版权'),
('site_safety', '', '系统安全设置'),
('upload_config', 'a:12:{s:13:"uploadmaxsize";d:2;s:13:"maxthumbwidth";i:700;s:14:"maxthumbheight";i:680;s:10:"thumbwidth";i:139;s:11:"thumbheight";i:139;s:17:"productthumbwidth";i:180;s:18:"productthumbheight";i:180;s:15:"photothumbwidth";i:300;s:16:"photothumbheight";i:300;s:13:"watermarkflag";i:1;s:13:"watermarkfile";s:0:"";s:12:"watermarkpos";i:4;}', '上传图片设置'),
('order_config', 'a:5:{s:8:"currency";s:3:"CNY";s:6:"symbol";s:3:"￥";s:7:"taxrate";d:2;s:13:"orderpagesize";i:0;s:6:"buynon";i:0;}', '订单设置');