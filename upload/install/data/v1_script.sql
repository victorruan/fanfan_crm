--
-- 表的结构 `{dbpre}account`
--

DROP TABLE IF EXISTS `{dbpre}account`;
CREATE TABLE IF NOT EXISTS `{dbpre}account` (
  `adminid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adminname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `groupid` smallint(2) unsigned DEFAULT '0',
  `super` tinyint(1) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `logintime` int(10) unsigned DEFAULT '0',
  `logintimes` int(10) unsigned DEFAULT '0',
  `loginip` varchar(20) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}account_action`
--

DROP TABLE IF EXISTS `{dbpre}account_action`;
CREATE TABLE IF NOT EXISTS `{dbpre}account_action` (
  `action_id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) NOT NULL DEFAULT '0',
  `action_code` varchar(500) NOT NULL,
  PRIMARY KEY (`action_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}account_group`
--

DROP TABLE IF EXISTS `{dbpre}account_group`;
CREATE TABLE IF NOT EXISTS `{dbpre}account_group` (
  `groupid` smallint(2) unsigned NOT NULL DEFAULT '0',
  `groupname` varchar(100) NOT NULL,
  `auths` tinytext,
  `rootid` smallint(2) unsigned DEFAULT '0',
  `depth` smallint(2) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `orders` smallint(2) unsigned DEFAULT '0',
  `intro` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}corp`
--

DROP TABLE IF EXISTS `{dbpre}corp`;
CREATE TABLE IF NOT EXISTS `{dbpre}corp` (
  `cpid` int(10) unsigned NOT NULL DEFAULT '0',
  `cpname` varchar(255) DEFAULT NULL,
  `groupid` smallint(2) unsigned DEFAULT '0',
  `did` int(11) NOT NULL,
  `type` tinyint(3) unsigned DEFAULT '0',
  `rootid` int(10) unsigned DEFAULT '0',
  `points` decimal(18,2) unsigned DEFAULT '0.00',
  `money` decimal(18,2) unsigned DEFAULT '0.00',
  `indexname` varchar(100) DEFAULT NULL,
  `cpno` varchar(100) DEFAULT NULL,
  `intro` tinytext,
  `country` smallint(4) unsigned DEFAULT '0',
  `provinceid` smallint(4) unsigned DEFAULT '0',
  `cityid` smallint(4) unsigned DEFAULT '0',
  `distid` smallint(4) unsigned DEFAULT '0',
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `updatetime` int(10) unsigned DEFAULT '0',
  `opuid` int(10) unsigned DEFAULT '0',
  `hotline` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `wangwang` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `isdelete` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}corp_discount`
--

DROP TABLE IF EXISTS `{dbpre}corp_discount`;
CREATE TABLE IF NOT EXISTS `{dbpre}corp_discount` (
  `did` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` varchar(50) NOT NULL,
  `discount` decimal(18,2) NOT NULL,
  `orders` mediumint(8) NOT NULL DEFAULT '0',
  `opuid` mediumint(8) NOT NULL,
  `addtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}corp_group`
--

DROP TABLE IF EXISTS `{dbpre}corp_group`;
CREATE TABLE IF NOT EXISTS `{dbpre}corp_group` (
  `groupid` smallint(2) unsigned NOT NULL DEFAULT '0',
  `groupname` varchar(255) DEFAULT NULL,
  `orders` smallint(2) unsigned DEFAULT '0',
  `intro` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`groupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}corp_money`
--

DROP TABLE IF EXISTS `{dbpre}corp_money`;
CREATE TABLE IF NOT EXISTS `{dbpre}corp_money` (
  `actionid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `amount` decimal(18,2) unsigned DEFAULT '0.00',
  `actiontype` tinyint(1) unsigned DEFAULT '0',
  `logcontent` varchar(500) DEFAULT NULL,
  `actiondate` date DEFAULT NULL,
  `tyear` smallint(2) unsigned DEFAULT '0',
  `tmonth` smallint(2) unsigned DEFAULT '0',
  `tweek` smallint(2) unsigned DEFAULT '0',
  `tday` smallint(2) unsigned DEFAULT '0',
  `timeline` int(10) unsigned DEFAULT '0',
  `dateline` int(10) unsigned DEFAULT NULL,
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `optime` int(10) unsigned DEFAULT '0',
  `ordernum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`actionid`),
  KEY `userid` (`cpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}delivery_corp`
--

DROP TABLE IF EXISTS `{dbpre}delivery_corp`;
CREATE TABLE IF NOT EXISTS `{dbpre}delivery_corp` (
  `corpid` smallint(2) unsigned NOT NULL DEFAULT '0',
  `corpname` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `orders` smallint(2) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`corpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}finance`
--

DROP TABLE IF EXISTS `{dbpre}finance`;
CREATE TABLE IF NOT EXISTS `{dbpre}finance` (
  `moneyid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `acid` smallint(2) unsigned DEFAULT '0',
  `serialnum` varchar(50) DEFAULT NULL,
  `moneykind` mediumint(8) unsigned DEFAULT '0',
  `moneytype` mediumint(8) unsigned DEFAULT '0',
  `tokentype` mediumint(8) unsigned DEFAULT '0',
  `balancetype` tinyint(1) unsigned DEFAULT '1',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `inamount` decimal(18,2) unsigned DEFAULT '0.00',
  `outamount` decimal(18,2) unsigned DEFAULT '0.00',
  `sumamount` decimal(18,2) unsigned DEFAULT '0.00',
  `actiontime` int(10) unsigned DEFAULT '0',
  `tyear` smallint(2) unsigned DEFAULT '0',
  `tmonth` smallint(2) unsigned DEFAULT '0',
  `tday` smallint(2) unsigned DEFAULT '0',
  `createtime` int(10) unsigned DEFAULT '0',
  `customuser` varchar(255) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `relorderno` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) unsigned DEFAULT '0',
  `opuid` int(10) unsigned DEFAULT '0',
  `audituid` int(10) unsigned DEFAULT '0',
  `updatetime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`moneyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}finance_account`
--

DROP TABLE IF EXISTS `{dbpre}finance_account`;
CREATE TABLE IF NOT EXISTS `{dbpre}finance_account` (
  `acid` smallint(2) unsigned NOT NULL DEFAULT '0',
  `actitle` varchar(255) DEFAULT NULL,
  `actype` tinyint(1) unsigned DEFAULT '0',
  `bankname` varchar(255) DEFAULT NULL,
  `branchname` varchar(255) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `acuser` varchar(50) DEFAULT NULL,
  `orders` smallint(2) unsigned DEFAULT '0',
  `acmoney` decimal(18,2) unsigned DEFAULT '0.00',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}finance_paramter`
--

DROP TABLE IF EXISTS `{dbpre}finance_paramter`;
CREATE TABLE IF NOT EXISTS `{dbpre}finance_paramter` (
  `paramid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `paramtype` varchar(20) DEFAULT NULL,
  `paramvalue` varchar(255) DEFAULT NULL,
  `orders` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`paramid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods`
--

DROP TABLE IF EXISTS `{dbpre}goods`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods` (
  `goodsid` int(10) unsigned NOT NULL DEFAULT '0',
  `gdsn` varchar(255) DEFAULT NULL,
  `gdname` varchar(255) DEFAULT NULL,
  `normsidstr` varchar(200) DEFAULT NULL,
  `gdspec` varchar(255) DEFAULT NULL,
  `treeid` int(10) unsigned DEFAULT '0',
  `catid` int(10) unsigned DEFAULT '0',
  `brandid` int(10) unsigned DEFAULT '0',
  `thumbfiles` varchar(255) DEFAULT NULL,
  `uploadfiles` varchar(255) DEFAULT NULL,
  `content` text,
  `flag` tinyint(1) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  `albums` text,
  `isorder` tinyint(1) unsigned DEFAULT '0',
  `iscomment` tinyint(1) unsigned DEFAULT '0',
  `linkurl` varchar(255) DEFAULT NULL,
  `linktype` tinyint(1) unsigned DEFAULT '1',
  `istop` tinyint(1) unsigned DEFAULT '0',
  `elite` tinyint(1) unsigned DEFAULT '0',
  `purview` smallint(2) unsigned DEFAULT '0',
  `tags` varchar(255) DEFAULT NULL,
  `metakeyword` varchar(255) DEFAULT NULL,
  `metadescription` varchar(500) DEFAULT NULL,
  `stocks` decimal(18,2) unsigned DEFAULT '0.00',
  `unit` varchar(20) DEFAULT NULL,
  `syssearch` varchar(2000) DEFAULT NULL,
  `fieldsearch` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_album`
--

DROP TABLE IF EXISTS `{dbpre}goods_album`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_album` (
  `abid` int(10) unsigned NOT NULL DEFAULT '0',
  `goodsid` int(10) unsigned DEFAULT '0',
  `picname` varchar(255) DEFAULT NULL,
  `picfile` varchar(255) DEFAULT NULL,
  `addtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`abid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_brand`
--

DROP TABLE IF EXISTS `{dbpre}goods_brand`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_brand` (
  `brandid` int(10) unsigned NOT NULL DEFAULT '0',
  `brandname` varchar(255) DEFAULT NULL,
  `catid` int(10) unsigned DEFAULT '0',
  `thumbfiles` varchar(255) DEFAULT NULL,
  `orders` int(10) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `discount` decimal(18,4) unsigned DEFAULT '0.0000',
  `intro` tinytext,
  PRIMARY KEY (`brandid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_category`
--

DROP TABLE IF EXISTS `{dbpre}goods_category`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_category` (
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(255) DEFAULT NULL,
  `rootid` int(10) unsigned DEFAULT '0',
  `depth` smallint(2) unsigned DEFAULT '0',
  `orders` smallint(2) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `addgoods` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_category_field`
--

DROP TABLE IF EXISTS `{dbpre}goods_category_field`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_category_field` (
  `fieldid` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned DEFAULT '0',
  `fieldtext` varchar(50) DEFAULT NULL,
  `fielddec` varchar(100) DEFAULT NULL,
  `fieldname` varchar(50) DEFAULT NULL,
  `fieldtype` varchar(20) DEFAULT NULL,
  `attrvalue` tinytext,
  `attrwidth` smallint(2) unsigned DEFAULT '0',
  `attrheight` smallint(2) unsigned DEFAULT '0',
  `isvalid` tinyint(1) unsigned DEFAULT '0',
  `validtext` varchar(200) DEFAULT NULL,
  `issearch` tinyint(1) unsigned DEFAULT '0',
  `orders` int(10) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `issystem` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`fieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_comment`
--

DROP TABLE IF EXISTS `{dbpre}goods_comment`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_comment` (
  `comid` int(10) unsigned NOT NULL DEFAULT '0',
  `goodsid` int(10) unsigned DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `comuser` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `addtime` int(10) unsigned DEFAULT '0',
  `ip` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`comid`),
  KEY `relid` (`goodsid`),
  KEY `userid` (`cpid`),
  KEY `addtime` (`addtime`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_field`
--

DROP TABLE IF EXISTS `{dbpre}goods_field`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_field` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `fieldid` int(10) unsigned DEFAULT '0',
  `fieldvalue` tinytext,
  `goodsid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_norms`
--

DROP TABLE IF EXISTS `{dbpre}goods_norms`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_norms` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `nname` varchar(50) DEFAULT NULL,
  `nalias` varchar(50) DEFAULT NULL,
  `nremarks` varchar(200) DEFAULT NULL,
  `ntype` tinyint(2) unsigned DEFAULT '1',
  `nway` tinyint(2) unsigned DEFAULT '1',
  `nvalue` text,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}goods_stock`
--

DROP TABLE IF EXISTS `{dbpre}goods_stock`;
CREATE TABLE IF NOT EXISTS `{dbpre}goods_stock` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0',
  `artno` varchar(100) DEFAULT NULL,
  `norms` text,
  `gdmodel` varchar(255) DEFAULT NULL,
  `gdcolour` varchar(255) DEFAULT NULL,
  `gdcolourname` varchar(255) DEFAULT NULL,
  `costrice` decimal(18,2) DEFAULT '0.00',
  `oprice` decimal(18,2) DEFAULT '0.00',
  `bprice` decimal(18,2) DEFAULT '0.00',
  `stocks` decimal(18,2) DEFAULT '0.00',
  `goodsid` int(10) unsigned DEFAULT '0',
  `locks` int(10) unsigned DEFAULT '0',
  `locksnum` decimal(18,2) DEFAULT '0.00',
  `addtime` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}guestbook`
--

DROP TABLE IF EXISTS `{dbpre}guestbook`;
CREATE TABLE IF NOT EXISTS `{dbpre}guestbook` (
  `gid` int(10) unsigned NOT NULL DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `cpname` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `content` text,
  `addtime` int(10) unsigned DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `flag` tinyint(1) unsigned DEFAULT '0',
  `qq` varchar(50) DEFAULT NULL,
  `msn` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `telephone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `replyflag` tinyint(1) unsigned DEFAULT '0',
  `replycontent` text,
  `replyuser` varchar(50) DEFAULT NULL,
  `replytime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`gid`),
  KEY `flag` (`flag`),
  KEY `cpid` (`cpid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}htmllabel`
--

DROP TABLE IF EXISTS `{dbpre}htmllabel`;
CREATE TABLE IF NOT EXISTS `{dbpre}htmllabel` (
  `labelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `labelname` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `content` tinytext,
  `flag` tinyint(1) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  `issystem` tinyint(1) unsigned DEFAULT '0',
  `templet` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`labelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}info`
--

DROP TABLE IF EXISTS `{dbpre}info`;
CREATE TABLE IF NOT EXISTS `{dbpre}info` (
  `infoid` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` mediumint(8) unsigned DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `thumbfiles` varchar(255) DEFAULT NULL,
  `uploadfiles` varchar(255) DEFAULT NULL,
  `summary` varchar(2000) DEFAULT NULL,
  `content` tinytext,
  `addtime` int(10) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `elite` tinyint(1) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`infoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}info_category`
--

DROP TABLE IF EXISTS `{dbpre}info_category`;
CREATE TABLE IF NOT EXISTS `{dbpre}info_category` (
  `catid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catname` varchar(255) DEFAULT NULL,
  `rootid` mediumint(8) unsigned DEFAULT '0',
  `depth` smallint(2) unsigned DEFAULT '0',
  `orders` smallint(2) unsigned DEFAULT '0',
  `intro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}items_config`
--

DROP TABLE IF EXISTS `{dbpre}items_config`;
CREATE TABLE IF NOT EXISTS `{dbpre}items_config` (
  `itemname` varchar(255) NOT NULL,
  `itemvalue` tinytext,
  `itemdec` varchar(255) DEFAULT NULL,
  `orders` smallint(4) unsigned DEFAULT '0',
  `itemtype` varchar(50) DEFAULT NULL,
  `issystem` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`itemname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}lang`
--

DROP TABLE IF EXISTS `{dbpre}lang`;
CREATE TABLE IF NOT EXISTS `{dbpre}lang` (
  `langkey` varchar(255) NOT NULL,
  `langval` varchar(2000) DEFAULT NULL,
  `langnote` varchar(255) DEFAULT NULL,
  `issystem` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`langkey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}log`
--

DROP TABLE IF EXISTS `{dbpre}log`;
CREATE TABLE IF NOT EXISTS `{dbpre}log` (
  `logid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `opuid` int(10) unsigned DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `logtype` tinyint(1) unsigned DEFAULT '0',
  `logtime` int(10) unsigned DEFAULT '0',
  `success` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}mailtpl`
--

DROP TABLE IF EXISTS `{dbpre}mailtpl`;
CREATE TABLE IF NOT EXISTS `{dbpre}mailtpl` (
  `tplid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `tplsort` enum('reg','valid','inform','other') DEFAULT 'other',
  `flag` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`tplid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}myads`
--

DROP TABLE IF EXISTS `{dbpre}myads`;
CREATE TABLE IF NOT EXISTS `{dbpre}myads` (
  `aid` mediumint(8) unsigned NOT NULL,
  `zoneid` mediumint(8) unsigned DEFAULT '0',
  `tagname` varchar(100) DEFAULT NULL,
  `adname` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` tinyint(1) unsigned DEFAULT '1',
  `orders` mediumint(8) unsigned DEFAULT '0',
  `timeset` tinyint(2) unsigned DEFAULT '0',
  `starttime` int(10) unsigned DEFAULT '0',
  `endtime` int(10) unsigned DEFAULT '0',
  `normbody` varchar(1000) DEFAULT NULL,
  `flag` tinyint(1) unsigned DEFAULT '0',
  `issystem` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `zoneid` (`zoneid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}options`
--

DROP TABLE IF EXISTS `{dbpre}options`;
CREATE TABLE IF NOT EXISTS `{dbpre}options` (
  `optionname` varchar(100) NOT NULL,
  `optionvalue` text,
  `optiondesc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`optionname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order`
--

DROP TABLE IF EXISTS `{dbpre}order`;
CREATE TABLE IF NOT EXISTS `{dbpre}order` (
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `orderstatus` varchar(20) DEFAULT NULL,
  `paystatus` tinyint(1) unsigned DEFAULT '0',
  `shipstatus` tinyint(1) unsigned DEFAULT '0',
  `goodsamount` decimal(18,2) unsigned DEFAULT '0.00',
  `discountamount` decimal(18,2) unsigned DEFAULT '0.00',
  `shipamount` decimal(18,2) unsigned DEFAULT '0.00',
  `addtaxamount` decimal(18,2) unsigned DEFAULT '0.00',
  `totalamount` decimal(18,2) unsigned DEFAULT '0.00',
  `payamount` decimal(18,2) unsigned DEFAULT '0.00',
  `refundamount` decimal(18,2) unsigned DEFAULT '0.00',
  `createtime` int(10) unsigned DEFAULT '0',
  `acttime` int(10) unsigned DEFAULT '0',
  `updatetime` int(10) unsigned DEFAULT '0',
  `shipid` smallint(2) unsigned DEFAULT '0',
  `istax` tinyint(1) unsigned DEFAULT '0',
  `taxpayee` varchar(255) DEFAULT NULL,
  `taxcontent` varchar(1000) DEFAULT NULL,
  `apptime` int(10) unsigned DEFAULT '0',
  `taxstatus` tinyint(1) unsigned DEFAULT '0',
  `taxamount` decimal(18,2) unsigned DEFAULT '0.00',
  `remark` varchar(500) DEFAULT NULL,
  `deleted` tinyint(1) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_attr`
--

DROP TABLE IF EXISTS `{dbpre}order_attr`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_attr` (
  `orderid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `shipuser` varchar(50) DEFAULT NULL,
  `shipaddress` varchar(255) DEFAULT NULL,
  `shipzipcode` varchar(10) DEFAULT NULL,
  `shipmobile` varchar(50) DEFAULT NULL,
  `shiptelephone` varchar(50) DEFAULT NULL,
  `shipmemo` varchar(255) DEFAULT NULL,
  `shipday` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_delivery`
--

DROP TABLE IF EXISTS `{dbpre}order_delivery`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_delivery` (
  `dealid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `loginame` varchar(255) DEFAULT NULL,
  `logino` varchar(255) DEFAULT NULL,
  `deltype` varchar(20) DEFAULT NULL,
  `shiptype` tinyint(1) unsigned DEFAULT '0',
  `shiptime` int(10) unsigned DEFAULT '0',
  `shipuser` varchar(255) DEFAULT NULL,
  `shipaddress` varchar(255) DEFAULT NULL,
  `shipzipcode` varchar(10) DEFAULT NULL,
  `shipmobile` varchar(50) DEFAULT NULL,
  `shiptelephone` varchar(50) DEFAULT NULL,
  `douser` varchar(50) DEFAULT NULL,
  `opuid` int(10) unsigned DEFAULT '0',
  `createtime` int(10) unsigned DEFAULT '0',
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`dealid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_detail`
--

DROP TABLE IF EXISTS `{dbpre}order_detail`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_detail` (
  `did` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `goodsid` int(10) unsigned DEFAULT '0',
  `sid` int(10) unsigned DEFAULT '0',
  `normsstr` varchar(2000) DEFAULT NULL,
  `price` decimal(18,2) unsigned DEFAULT '0.00',
  `oprice` decimal(18,2) unsigned DEFAULT '0.00',
  `discount` decimal(18,2) unsigned DEFAULT '0.00',
  `quantity` decimal(18,2) unsigned DEFAULT '0.00',
  `total` decimal(18,2) unsigned DEFAULT '0.00',
  `addon` tinytext,
  `createtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_invoice`
--

DROP TABLE IF EXISTS `{dbpre}order_invoice`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_invoice` (
  `invid` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `invcode` varchar(255) DEFAULT NULL,
  `invpayee` varchar(255) DEFAULT NULL,
  `invcontent` varchar(2000) DEFAULT NULL,
  `invmoney` decimal(18,2) unsigned DEFAULT '0.00',
  `taxmoney` decimal(18,2) unsigned DEFAULT '0.00',
  `currency` varchar(10) DEFAULT NULL,
  `billtime` int(10) unsigned DEFAULT '0',
  `billuser` varchar(50) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`invid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_log`
--

DROP TABLE IF EXISTS `{dbpre}order_log`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_log` (
  `logid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `logtext` varchar(500) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `behavior` varchar(20) DEFAULT NULL,
  `result` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_payment`
--

DROP TABLE IF EXISTS `{dbpre}order_payment`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_payment` (
  `payid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `paymentid` smallint(4) unsigned DEFAULT '0',
  `acid` smallint(2) unsigned DEFAULT '0',
  `account` varchar(50) DEFAULT NULL,
  `bankname` varbinary(50) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `currency` varchar(10) DEFAULT NULL,
  `sendamount` decimal(18,2) unsigned DEFAULT '0.00',
  `merchantfee` decimal(18,4) unsigned DEFAULT '0.0000',
  `amount` decimal(18,2) unsigned DEFAULT '0.00',
  `bankdealno` varchar(50) DEFAULT NULL,
  `dealtime` varchar(50) DEFAULT NULL,
  `paystatus` smallint(2) unsigned DEFAULT '0',
  `retimeline` int(10) unsigned DEFAULT '0',
  `paytype` varchar(20) DEFAULT NULL,
  `paytime` int(10) unsigned DEFAULT '0',
  `payuser` varchar(50) DEFAULT NULL,
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}order_refund`
--

DROP TABLE IF EXISTS `{dbpre}order_refund`;
CREATE TABLE IF NOT EXISTS `{dbpre}order_refund` (
  `refid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `orderid` bigint(20) unsigned DEFAULT '0',
  `cpid` int(10) unsigned DEFAULT '0',
  `paymentid` smallint(2) unsigned DEFAULT '0',
  `acid` smallint(2) unsigned DEFAULT '0',
  `account` varchar(50) DEFAULT NULL,
  `bankname` varchar(50) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `currency` varchar(10) DEFAULT NULL,
  `merchantfee` decimal(18,4) unsigned DEFAULT '0.0000',
  `amount` decimal(18,2) unsigned DEFAULT '0.00',
  `refstatus` smallint(2) unsigned DEFAULT '0',
  `reftype` varchar(20) DEFAULT NULL,
  `reftime` int(10) unsigned DEFAULT '0',
  `refuser` varchar(50) DEFAULT NULL,
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`refid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}quoted`
--

DROP TABLE IF EXISTS `{dbpre}quoted`;
CREATE TABLE IF NOT EXISTS `{dbpre}quoted` (
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `inquiryid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `stype` tinyint(2) NOT NULL DEFAULT '1',
  `cpid` int(10) NOT NULL,
  `examine` tinyint(2) NOT NULL DEFAULT '0',
  `product` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `opuid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}quoted_log`
--

DROP TABLE IF EXISTS `{dbpre}quoted_log`;
CREATE TABLE IF NOT EXISTS `{dbpre}quoted_log` (
  `logid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `quotedid` bigint(20) unsigned DEFAULT '0',
  `opuid` mediumint(8) unsigned DEFAULT '0',
  `logtext` varchar(500) DEFAULT NULL,
  `createtime` int(10) unsigned DEFAULT '0',
  `behavior` varchar(20) DEFAULT NULL,
  `result` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`logid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}shiptype`
--

DROP TABLE IF EXISTS `{dbpre}shiptype`;
CREATE TABLE IF NOT EXISTS `{dbpre}shiptype` (
  `shipid` smallint(2) unsigned NOT NULL DEFAULT '0',
  `shipname` varchar(255) DEFAULT NULL,
  `price` decimal(18,2) unsigned DEFAULT '0.00',
  `upprice` decimal(18,2) unsigned DEFAULT '0.00',
  `intro` varchar(2000) DEFAULT NULL,
  `orders` smallint(2) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `addtime` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`shipid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `{dbpre}zone`
--

DROP TABLE IF EXISTS `{dbpre}zone`;
CREATE TABLE IF NOT EXISTS `{dbpre}zone` (
  `zoneid` mediumint(8) unsigned NOT NULL,
  `zonename` varchar(100) DEFAULT NULL,
  `idmark` varchar(100) DEFAULT NULL,
  `sort` varchar(10) DEFAULT NULL,
  `zonewidth` smallint(2) unsigned DEFAULT '0',
  `zoneheight` smallint(2) unsigned DEFAULT '0',
  `flag` tinyint(1) unsigned DEFAULT '0',
  `issystem` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`zoneid`),
  KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
