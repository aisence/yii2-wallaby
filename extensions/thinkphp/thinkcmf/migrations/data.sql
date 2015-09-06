-- phpMyAdmin SQL Dump
-- version 4.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-07-06 10:13:40
-- 服务器版本： 5.5.37-log
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hrcf`
--

-- --------------------------------------------------------

--
-- 表的结构 `sp_ad`
--

CREATE TABLE IF NOT EXISTS `sp_ad` (
`ad_id` bigint(20) NOT NULL COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_asset`
--

CREATE TABLE IF NOT EXISTS `sp_asset` (
`aid` bigint(20) NOT NULL,
  `key` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_auth_access`
--

CREATE TABLE IF NOT EXISTS `sp_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `sp_auth_rule` (
`id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限规则表' AUTO_INCREMENT=162 ;

--
-- 转存表中的数据 `sp_auth_rule`
--

INSERT INTO `sp_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(1, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(2, 'Api', 'admin_url', 'api/guestbookadmin/index', NULL, '所有留言', 1, ''),
(3, 'Api', 'admin_url', 'api/guestbookadmin/delete', NULL, '删除网站留言', 1, ''),
(4, 'Comment', 'admin_url', 'comment/commentadmin/index', NULL, '评论管理', 1, ''),
(5, 'Comment', 'admin_url', 'comment/commentadmin/delete', NULL, '删除评论', 1, ''),
(6, 'Comment', 'admin_url', 'comment/commentadmin/check', NULL, '评论审核', 1, ''),
(7, 'Portal', 'admin_url', 'portal/adminpost/index', NULL, '文章管理', 1, ''),
(8, 'Portal', 'admin_url', 'portal/adminpost/listorders', NULL, '文章排序', 1, ''),
(9, 'Portal', 'admin_url', 'portal/adminpost/top', NULL, '文章置顶', 1, ''),
(10, 'Portal', 'admin_url', 'portal/adminpost/recommend', NULL, '文章推荐', 1, ''),
(11, 'Portal', 'admin_url', 'portal/adminpost/move', NULL, '批量移动', 1, ''),
(12, 'Portal', 'admin_url', 'portal/adminpost/check', NULL, '文章审核', 1, ''),
(13, 'Portal', 'admin_url', 'portal/adminpost/delete', NULL, '删除文章', 1, ''),
(14, 'Portal', 'admin_url', 'portal/adminpost/edit', NULL, '编辑文章', 1, ''),
(15, 'Portal', 'admin_url', 'portal/adminpost/edit_post', NULL, '提交编辑', 1, ''),
(16, 'Portal', 'admin_url', 'portal/adminpost/add', NULL, '添加文章', 1, ''),
(17, 'Portal', 'admin_url', 'portal/adminpost/add_post', NULL, '提交添加', 1, ''),
(18, 'Portal', 'admin_url', 'portal/adminterm/index', NULL, '分类管理', 1, ''),
(19, 'Portal', 'admin_url', 'portal/adminterm/listorders', NULL, '文章分类排序', 1, ''),
(20, 'Portal', 'admin_url', 'portal/adminterm/delete', NULL, '删除分类', 1, ''),
(21, 'Portal', 'admin_url', 'portal/adminterm/edit', NULL, '编辑分类', 1, ''),
(22, 'Portal', 'admin_url', 'portal/adminterm/edit_post', NULL, '提交编辑', 1, ''),
(23, 'Portal', 'admin_url', 'portal/adminterm/add', NULL, '添加分类', 1, ''),
(24, 'Portal', 'admin_url', 'portal/adminterm/add_post', NULL, '提交添加', 1, ''),
(25, 'Portal', 'admin_url', 'portal/adminpage/index', NULL, '页面管理', 1, ''),
(26, 'Portal', 'admin_url', 'portal/adminpage/listorders', NULL, '页面排序', 1, ''),
(27, 'Portal', 'admin_url', 'portal/adminpage/delete', NULL, '删除页面', 1, ''),
(28, 'Portal', 'admin_url', 'portal/adminpage/edit', NULL, '编辑页面', 1, ''),
(29, 'Portal', 'admin_url', 'portal/adminpage/edit_post', NULL, '提交编辑', 1, ''),
(30, 'Portal', 'admin_url', 'portal/adminpage/add', NULL, '添加页面', 1, ''),
(31, 'Portal', 'admin_url', 'portal/adminpage/add_post', NULL, '提交添加', 1, ''),
(32, 'Admin', 'admin_url', 'admin/recycle/default', NULL, '回收站', 1, ''),
(33, 'Portal', 'admin_url', 'portal/adminpost/recyclebin', NULL, '文章回收', 1, ''),
(34, 'Portal', 'admin_url', 'portal/adminpost/restore', NULL, '文章还原', 1, ''),
(35, 'Portal', 'admin_url', 'portal/adminpost/clean', NULL, '彻底删除', 1, ''),
(36, 'Portal', 'admin_url', 'portal/adminpage/recyclebin', NULL, '页面回收', 1, ''),
(37, 'Portal', 'admin_url', 'portal/adminpage/clean', NULL, '彻底删除', 1, ''),
(38, 'Portal', 'admin_url', 'portal/adminpage/restore', NULL, '页面还原', 1, ''),
(39, 'Admin', 'admin_url', 'admin/extension/default', NULL, '扩展工具', 1, ''),
(40, 'Admin', 'admin_url', 'admin/backup/default', NULL, '备份管理', 1, ''),
(41, 'Admin', 'admin_url', 'admin/backup/restore', NULL, '数据还原', 1, ''),
(42, 'Admin', 'admin_url', 'admin/backup/index', NULL, '数据备份', 1, ''),
(43, 'Admin', 'admin_url', 'admin/backup/index_post', NULL, '提交数据备份', 1, ''),
(44, 'Admin', 'admin_url', 'admin/backup/download', NULL, '下载备份', 1, ''),
(45, 'Admin', 'admin_url', 'admin/backup/del_backup', NULL, '删除备份', 1, ''),
(46, 'Admin', 'admin_url', 'admin/backup/import', NULL, '数据备份导入', 1, ''),
(47, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(48, 'Admin', 'admin_url', 'admin/plugin/toggle', NULL, '插件启用切换', 1, ''),
(49, 'Admin', 'admin_url', 'admin/plugin/setting', NULL, '插件设置', 1, ''),
(50, 'Admin', 'admin_url', 'admin/plugin/setting_post', NULL, '插件设置提交', 1, ''),
(51, 'Admin', 'admin_url', 'admin/plugin/install', NULL, '插件安装', 1, ''),
(52, 'Admin', 'admin_url', 'admin/plugin/uninstall', NULL, '插件卸载', 1, ''),
(53, 'Admin', 'admin_url', 'admin/slide/default', NULL, '幻灯片', 1, ''),
(54, 'Admin', 'admin_url', 'admin/slide/index', NULL, '幻灯片管理', 1, ''),
(55, 'Admin', 'admin_url', 'admin/slide/listorders', NULL, '幻灯片排序', 1, ''),
(56, 'Admin', 'admin_url', 'admin/slide/toggle', NULL, '幻灯片显示切换', 1, ''),
(57, 'Admin', 'admin_url', 'admin/slide/delete', NULL, '删除幻灯片', 1, ''),
(58, 'Admin', 'admin_url', 'admin/slide/edit', NULL, '编辑幻灯片', 1, ''),
(59, 'Admin', 'admin_url', 'admin/slide/edit_post', NULL, '提交编辑', 1, ''),
(60, 'Admin', 'admin_url', 'admin/slide/add', NULL, '添加幻灯片', 1, ''),
(61, 'Admin', 'admin_url', 'admin/slide/add_post', NULL, '提交添加', 1, ''),
(62, 'Admin', 'admin_url', 'admin/slidecat/index', NULL, '幻灯片分类', 1, ''),
(63, 'Admin', 'admin_url', 'admin/slidecat/delete', NULL, '删除分类', 1, ''),
(64, 'Admin', 'admin_url', 'admin/slidecat/edit', NULL, '编辑分类', 1, ''),
(65, 'Admin', 'admin_url', 'admin/slidecat/edit_post', NULL, '提交编辑', 1, ''),
(66, 'Admin', 'admin_url', 'admin/slidecat/add', NULL, '添加分类', 1, ''),
(67, 'Admin', 'admin_url', 'admin/slidecat/add_post', NULL, '提交添加', 1, ''),
(68, 'Admin', 'admin_url', 'admin/ad/index', NULL, '网站广告', 1, ''),
(69, 'Admin', 'admin_url', 'admin/ad/toggle', NULL, '广告显示切换', 1, ''),
(70, 'Admin', 'admin_url', 'admin/ad/delete', NULL, '删除广告', 1, ''),
(71, 'Admin', 'admin_url', 'admin/ad/edit', NULL, '编辑广告', 1, ''),
(72, 'Admin', 'admin_url', 'admin/ad/edit_post', NULL, '提交编辑', 1, ''),
(73, 'Admin', 'admin_url', 'admin/ad/add', NULL, '添加广告', 1, ''),
(74, 'Admin', 'admin_url', 'admin/ad/add_post', NULL, '提交添加', 1, ''),
(75, 'Admin', 'admin_url', 'admin/link/index', NULL, '友情链接', 1, ''),
(76, 'Admin', 'admin_url', 'admin/link/listorders', NULL, '友情链接排序', 1, ''),
(77, 'Admin', 'admin_url', 'admin/link/toggle', NULL, '友链显示切换', 1, ''),
(78, 'Admin', 'admin_url', 'admin/link/delete', NULL, '删除友情链接', 1, ''),
(79, 'Admin', 'admin_url', 'admin/link/edit', NULL, '编辑友情链接', 1, ''),
(80, 'Admin', 'admin_url', 'admin/link/edit_post', NULL, '提交编辑', 1, ''),
(81, 'Admin', 'admin_url', 'admin/link/add', NULL, '添加友情链接', 1, ''),
(82, 'Admin', 'admin_url', 'admin/link/add_post', NULL, '提交添加', 1, ''),
(83, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(84, 'Api', 'admin_url', 'api/oauthadmin/setting_post', NULL, '提交设置', 1, ''),
(85, 'Admin', 'admin_url', 'admin/menu/default', NULL, '菜单管理', 1, ''),
(86, 'Admin', 'admin_url', 'admin/navcat/default1', NULL, '前台菜单', 1, ''),
(87, 'Admin', 'admin_url', 'admin/nav/index', NULL, '菜单管理', 1, ''),
(88, 'Admin', 'admin_url', 'admin/nav/listorders', NULL, '前台导航排序', 1, ''),
(89, 'Admin', 'admin_url', 'admin/nav/delete', NULL, '删除菜单', 1, ''),
(90, 'Admin', 'admin_url', 'admin/nav/edit', NULL, '编辑菜单', 1, ''),
(91, 'Admin', 'admin_url', 'admin/nav/edit_post', NULL, '提交编辑', 1, ''),
(92, 'Admin', 'admin_url', 'admin/nav/add', NULL, '添加菜单', 1, ''),
(93, 'Admin', 'admin_url', 'admin/nav/add_post', NULL, '提交添加', 1, ''),
(94, 'Admin', 'admin_url', 'admin/navcat/index', NULL, '菜单分类', 1, ''),
(95, 'Admin', 'admin_url', 'admin/navcat/delete', NULL, '删除分类', 1, ''),
(96, 'Admin', 'admin_url', 'admin/navcat/edit', NULL, '编辑分类', 1, ''),
(97, 'Admin', 'admin_url', 'admin/navcat/edit_post', NULL, '提交编辑', 1, ''),
(98, 'Admin', 'admin_url', 'admin/navcat/add', NULL, '添加分类', 1, ''),
(99, 'Admin', 'admin_url', 'admin/navcat/add_post', NULL, '提交添加', 1, ''),
(100, 'Admin', 'admin_url', 'admin/menu/index', NULL, '后台菜单', 1, ''),
(101, 'Admin', 'admin_url', 'admin/menu/add', NULL, '添加菜单', 1, ''),
(102, 'Admin', 'admin_url', 'admin/menu/add_post', NULL, '提交添加', 1, ''),
(103, 'Admin', 'admin_url', 'admin/menu/listorders', NULL, '后台菜单排序', 1, ''),
(104, 'Admin', 'admin_url', 'admin/menu/export_menu', NULL, '菜单备份', 1, ''),
(105, 'Admin', 'admin_url', 'admin/menu/edit', NULL, '编辑菜单', 1, ''),
(106, 'Admin', 'admin_url', 'admin/menu/edit_post', NULL, '提交编辑', 1, ''),
(107, 'Admin', 'admin_url', 'admin/menu/delete', NULL, '删除菜单', 1, ''),
(108, 'Admin', 'admin_url', 'admin/menu/lists', NULL, '所有菜单', 1, ''),
(109, 'Admin', 'admin_url', 'admin/setting/default', NULL, '设置', 1, ''),
(110, 'Admin', 'admin_url', 'admin/setting/userdefault', NULL, '个人信息', 1, ''),
(111, 'Admin', 'admin_url', 'admin/user/userinfo', NULL, '修改信息', 1, ''),
(112, 'Admin', 'admin_url', 'admin/user/userinfo_post', NULL, '修改信息提交', 1, ''),
(113, 'Admin', 'admin_url', 'admin/setting/password', NULL, '修改密码', 1, ''),
(114, 'Admin', 'admin_url', 'admin/setting/password_post', NULL, '提交修改', 1, ''),
(115, 'Admin', 'admin_url', 'admin/setting/site', NULL, '网站信息', 1, ''),
(116, 'Admin', 'admin_url', 'admin/setting/site_post', NULL, '提交修改', 1, ''),
(117, 'Admin', 'admin_url', 'admin/route/index', NULL, '路由列表', 1, ''),
(118, 'Admin', 'admin_url', 'admin/route/add', NULL, '路由添加', 1, ''),
(119, 'Admin', 'admin_url', 'admin/route/add_post', NULL, '路由添加提交', 1, ''),
(120, 'Admin', 'admin_url', 'admin/route/edit', NULL, '路由编辑', 1, ''),
(121, 'Admin', 'admin_url', 'admin/route/edit_post', NULL, '路由编辑提交', 1, ''),
(122, 'Admin', 'admin_url', 'admin/route/delete', NULL, '路由删除', 1, ''),
(123, 'Admin', 'admin_url', 'admin/route/ban', NULL, '路由禁止', 1, ''),
(124, 'Admin', 'admin_url', 'admin/route/open', NULL, '路由启用', 1, ''),
(125, 'Admin', 'admin_url', 'admin/route/listorders', NULL, '路由排序', 1, ''),
(126, 'Admin', 'admin_url', 'admin/mailer/default', NULL, '邮箱配置', 1, ''),
(127, 'Admin', 'admin_url', 'admin/mailer/index', NULL, 'SMTP配置', 1, ''),
(128, 'Admin', 'admin_url', 'admin/mailer/index_post', NULL, '提交配置', 1, ''),
(129, 'Admin', 'admin_url', 'admin/mailer/active', NULL, '邮件模板', 1, ''),
(130, 'Admin', 'admin_url', 'admin/mailer/active_post', NULL, '提交模板', 1, ''),
(131, 'Admin', 'admin_url', 'admin/setting/clearcache', NULL, '清除缓存', 1, ''),
(132, 'User', 'admin_url', 'user/indexadmin/default', NULL, '用户管理', 1, ''),
(133, 'User', 'admin_url', 'user/indexadmin/default1', NULL, '用户组', 1, ''),
(134, 'User', 'admin_url', 'user/indexadmin/index', NULL, '本站用户', 1, ''),
(135, 'User', 'admin_url', 'user/indexadmin/ban', NULL, '拉黑会员', 1, ''),
(136, 'User', 'admin_url', 'user/indexadmin/cancelban', NULL, '启用会员', 1, ''),
(137, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(138, 'User', 'admin_url', 'user/oauthadmin/delete', NULL, '第三方用户解绑', 1, ''),
(139, 'User', 'admin_url', 'user/indexadmin/default3', NULL, '管理组', 1, ''),
(140, 'Admin', 'admin_url', 'admin/rbac/index', NULL, '角色管理', 1, ''),
(141, 'Admin', 'admin_url', 'admin/rbac/member', NULL, '成员管理', 1, ''),
(142, 'Admin', 'admin_url', 'admin/rbac/authorize', NULL, '权限设置', 1, ''),
(143, 'Admin', 'admin_url', 'admin/rbac/authorize_post', NULL, '提交设置', 1, ''),
(144, 'Admin', 'admin_url', 'admin/rbac/roleedit', NULL, '编辑角色', 1, ''),
(145, 'Admin', 'admin_url', 'admin/rbac/roleedit_post', NULL, '提交编辑', 1, ''),
(146, 'Admin', 'admin_url', 'admin/rbac/roledelete', NULL, '删除角色', 1, ''),
(147, 'Admin', 'admin_url', 'admin/rbac/roleadd', NULL, '添加角色', 1, ''),
(148, 'Admin', 'admin_url', 'admin/rbac/roleadd_post', NULL, '提交添加', 1, ''),
(149, 'Admin', 'admin_url', 'admin/user/index', NULL, '管理员', 1, ''),
(150, 'Admin', 'admin_url', 'admin/user/delete', NULL, '删除管理员', 1, ''),
(151, 'Admin', 'admin_url', 'admin/user/edit', NULL, '管理员编辑', 1, ''),
(152, 'Admin', 'admin_url', 'admin/user/edit_post', NULL, '编辑提交', 1, ''),
(153, 'Admin', 'admin_url', 'admin/user/add', NULL, '管理员添加', 1, ''),
(154, 'Admin', 'admin_url', 'admin/user/add_post', NULL, '添加提交', 1, ''),
(155, 'Admin', 'admin_url', 'admin/plugin/update', NULL, '插件更新', 1, ''),
(156, 'Admin', 'admin_url', 'admin/storage/index', NULL, '文件存储', 1, ''),
(157, 'Admin', 'admin_url', 'admin/storage/setting_post', NULL, '文件存储设置提交', 1, ''),
(158, 'Admin', 'admin_url', 'admin/slide/ban', NULL, '禁用幻灯片', 1, ''),
(159, 'Admin', 'admin_url', 'admin/slide/cancelban', NULL, '启用幻灯片', 1, ''),
(160, 'Admin', 'admin_url', 'admin/user/ban', NULL, '禁用管理员', 1, ''),
(161, 'Admin', 'admin_url', 'admin/user/cancelban', NULL, '启用管理员', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `sp_comments`
--

CREATE TABLE IF NOT EXISTS `sp_comments` (
`id` bigint(20) unsigned NOT NULL,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_common_action_log`
--

CREATE TABLE IF NOT EXISTS `sp_common_action_log` (
`id` int(11) NOT NULL,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=439 ;

--
-- 转存表中的数据 `sp_common_action_log`
--

INSERT INTO `sp_common_action_log` (`id`, `user`, `object`, `action`, `count`, `last_time`, `ip`) VALUES
(1, 0, 'posts1', 'Portal-Article-index', 11, 1433903862, '125.111.197.20'),
(2, 0, 'posts1', 'Portal-Article-index', 1, 1433752353, '14.17.34.191'),
(3, 0, 'posts3', 'Portal-Article-index', 5, 1433902422, '125.111.197.20'),
(4, 0, 'posts2', 'Portal-Article-index', 6, 1433905191, '125.111.197.20'),
(5, 0, 'posts4', 'Portal-Article-index', 8, 1433904385, '125.111.197.20'),
(6, 0, 'posts5', 'Portal-Article-index', 1, 1433752986, '125.111.197.20'),
(7, 0, 'posts7', 'Portal-Article-index', 3, 1433816560, '125.111.197.20'),
(8, 0, 'posts8', 'Portal-Article-index', 8, 1433842170, '125.111.197.20'),
(9, 0, 'posts6', 'Portal-Article-index', 1, 1433753488, '125.111.197.20'),
(10, 0, 'posts8', 'Portal-Article-index', 1, 1433753784, '123.125.106.97'),
(11, 0, 'posts10', 'Portal-Article-index', 3, 1433812598, '125.111.197.20'),
(12, 0, 'posts12', 'Portal-Article-index', 8, 1433903833, '125.111.197.20'),
(13, 0, 'posts9', 'Portal-Article-index', 5, 1433907096, '125.111.197.20'),
(14, 0, 'posts13', 'Portal-Article-index', 6, 1433904212, '125.111.197.20'),
(15, 0, 'posts14', 'Portal-Article-index', 61, 1433905965, '125.111.197.20'),
(16, 0, 'posts11', 'Portal-Article-index', 4, 1433833864, '125.111.197.20'),
(17, 0, 'posts16', 'Portal-Article-index', 8, 1433906754, '125.111.197.20'),
(18, 0, 'posts15', 'Portal-Article-index', 16, 1433907099, '125.111.197.20'),
(19, 0, 'posts17', 'Portal-Article-index', 5, 1433906784, '125.111.197.20'),
(20, 0, 'posts18', 'Portal-Article-index', 8, 1433904969, '125.111.197.20'),
(21, 0, 'posts19', 'Portal-Article-index', 7, 1433907102, '125.111.197.20'),
(22, 0, 'posts15', 'Portal-Article-index', 6, 1434073300, '115.231.57.198'),
(23, 0, 'posts15', 'Portal-Article-index', 1, 1433827144, '101.226.89.122'),
(24, 0, 'posts16', 'Portal-Article-index', 5, 1434073203, '115.231.57.198'),
(25, 0, 'posts17', 'Portal-Article-index', 3, 1433926044, '115.231.57.198'),
(26, 0, 'posts16', 'Portal-Article-index', 1, 1433827364, '119.147.146.189'),
(27, 0, 'posts16', 'Portal-Article-index', 1, 1433827956, '101.226.33.221'),
(28, 0, 'posts20', 'Portal-Article-index', 3, 1433988697, '115.231.57.198'),
(29, 0, 'posts20', 'Portal-Article-index', 1, 1433838622, '101.226.89.116'),
(30, 0, 'posts20', 'Portal-Article-index', 1, 1433838628, '180.153.214.191'),
(31, 0, 'posts20', 'Portal-Article-index', 22, 1433907139, '125.111.197.20'),
(32, 0, 'posts14', 'Portal-Article-index', 2, 1433842725, '116.228.235.182'),
(33, 0, 'posts14', 'Portal-Article-index', 1, 1433842748, '123.125.106.97'),
(34, 0, 'posts14', 'Portal-Article-index', 1, 1433842749, '180.149.135.16'),
(35, 0, 'posts14', 'Portal-Article-index', 1, 1433843526, '101.226.89.115'),
(36, 0, 'posts15', 'Portal-Article-index', 1, 1433854752, '183.135.177.23'),
(37, 0, 'posts20', 'Portal-Article-index', 1, 1433854768, '183.135.177.23'),
(38, 0, 'posts20', 'Portal-Article-index', 1, 1433854768, '101.226.66.181'),
(39, 0, 'posts14', 'Portal-Article-index', 3, 1433923001, '115.231.57.198'),
(40, 0, 'posts14', 'Portal-Article-index', 1, 1433899292, '180.153.205.252'),
(41, 0, 'posts14', 'Portal-Article-index', 1, 1433900150, '101.226.89.116'),
(42, 0, 'posts4', 'Portal-Article-index', 1, 1433904394, '123.125.106.97'),
(43, 0, 'posts4', 'Portal-Article-index', 1, 1433904394, '180.149.134.10'),
(44, 0, 'posts14', 'Portal-Article-index', 43, 1434074162, '115.217.161.251'),
(45, 0, 'posts15', 'Portal-Article-index', 79, 1434075469, '115.217.161.251'),
(46, 0, 'posts20', 'Portal-Article-index', 133, 1434075471, '115.217.161.251'),
(47, 0, 'posts19', 'Portal-Article-index', 69, 1434072201, '115.217.161.251'),
(48, 0, 'posts7', 'Portal-Article-index', 2, 1433920280, '115.217.161.251'),
(49, 0, 'posts1', 'Portal-Article-index', 7, 1434005612, '115.217.161.251'),
(50, 0, 'posts12', 'Portal-Article-index', 9, 1434072195, '115.217.161.251'),
(51, 0, 'posts11', 'Portal-Article-index', 7, 1434074113, '115.217.161.251'),
(52, 0, 'posts18', 'Portal-Article-index', 8, 1434074284, '115.217.161.251'),
(53, 0, 'posts9', 'Portal-Article-index', 3, 1433926113, '115.217.161.251'),
(54, 0, 'posts15', 'Portal-Article-index', 4, 1433923363, '116.228.235.182'),
(55, 0, 'posts16', 'Portal-Article-index', 2, 1433923376, '116.228.235.182'),
(56, 0, 'posts20', 'Portal-Article-index', 2, 1433922894, '116.228.235.182'),
(57, 0, 'posts19', 'Portal-Article-index', 2, 1433923287, '116.228.235.182'),
(58, 0, 'posts13', 'Portal-Article-index', 9, 1434005715, '115.217.161.251'),
(59, 0, 'posts19', 'Portal-Article-index', 1, 1433918599, '112.64.235.253'),
(60, 0, 'posts16', 'Portal-Article-index', 36, 1434075530, '115.217.161.251'),
(61, 0, 'posts17', 'Portal-Article-index', 6, 1434000698, '115.217.161.251'),
(62, 0, 'posts4', 'Portal-Article-index', 7, 1434006475, '115.217.161.251'),
(63, 0, 'posts5', 'Portal-Article-index', 1, 1433920433, '115.217.161.251'),
(64, 0, 'posts2', 'Portal-Article-index', 5, 1434006057, '115.217.161.251'),
(65, 0, 'posts19', 'Portal-Article-index', 2, 1433985717, '115.231.57.198'),
(66, 0, 'posts20', 'Portal-Article-index', 1, 1433985738, '101.226.89.119'),
(67, 0, 'posts15', 'Portal-Article-index', 1, 1433986196, '180.153.206.22'),
(68, 0, 'posts19', 'Portal-Article-index', 1, 1433986237, '180.153.163.186'),
(69, 0, 'posts12', 'Portal-Article-index', 1, 1434000364, '115.231.57.198'),
(70, 0, 'posts12', 'Portal-Article-index', 1, 1434001171, '101.226.89.116'),
(71, 0, 'posts10', 'Portal-Article-index', 1, 1434006098, '115.217.161.251'),
(72, 0, 'posts16', 'Portal-Article-index', 1, 1434013820, '101.226.33.206'),
(73, 0, 'posts15', 'Portal-Article-index', 17, 1435544474, '183.136.133.43'),
(74, 0, 'posts20', 'Portal-Article-index', 14, 1435313006, '183.136.133.43'),
(75, 0, 'posts19', 'Portal-Article-index', 8, 1435313006, '183.136.133.43'),
(76, 0, 'posts16', 'Portal-Article-index', 10, 1435313239, '183.136.133.43'),
(77, 0, 'posts15', 'Portal-Article-index', 9, 1435728379, '183.136.133.29'),
(78, 0, 'posts14', 'Portal-Article-index', 8, 1435397969, '183.136.133.43'),
(79, 0, 'posts12', 'Portal-Article-index', 1, 1434078248, '183.136.133.43'),
(80, 0, 'posts4', 'Portal-Article-index', 2, 1435308315, '183.136.133.43'),
(81, 0, 'posts18', 'Portal-Article-index', 3, 1435313178, '183.136.133.43'),
(82, 0, 'posts20', 'Portal-Article-index', 5, 1435650910, '183.136.133.29'),
(83, 0, 'posts15', 'Portal-Article-index', 1, 1434126314, '220.181.108.80'),
(84, 0, 'posts19', 'Portal-Article-index', 1, 1434127961, '123.125.71.21'),
(85, 0, 'posts16', 'Portal-Article-index', 1, 1434128004, '123.125.71.42'),
(86, 0, 'posts20', 'Portal-Article-index', 1, 1434128046, '123.125.71.43'),
(87, 0, 'posts14', 'Portal-Article-index', 2, 1436148607, '183.136.133.41'),
(88, 0, 'posts12', 'Portal-Article-index', 1, 1434184892, '183.136.133.41'),
(89, 0, 'posts4', 'Portal-Article-index', 1, 1434184954, '183.136.133.41'),
(90, 0, 'posts2', 'Portal-Article-index', 1, 1434184957, '183.136.133.41'),
(91, 0, 'posts14', 'Portal-Article-index', 4, 1436069311, '183.136.133.30'),
(92, 0, 'posts15', 'Portal-Article-index', 9, 1436069302, '183.136.133.30'),
(93, 0, 'posts19', 'Portal-Article-index', 8, 1434416878, '183.136.133.30'),
(94, 0, 'posts20', 'Portal-Article-index', 10, 1436069294, '183.136.133.30'),
(95, 0, 'posts16', 'Portal-Article-index', 3, 1435674241, '183.136.133.30'),
(96, 0, 'posts15', 'Portal-Article-index', 11, 1435301872, '222.73.144.28'),
(97, 0, 'posts12', 'Portal-Article-index', 2, 1435250525, '120.52.18.54'),
(98, 0, 'posts15', 'Portal-Article-index', 3, 1435250107, '120.52.18.54'),
(99, 0, 'posts16', 'Portal-Article-index', 2, 1435250125, '120.52.18.54'),
(100, 0, 'posts9', 'Portal-Article-index', 2, 1435250264, '120.52.18.54'),
(101, 0, 'posts15', 'Portal-Article-index', 4, 1435110221, '120.52.18.48'),
(102, 0, 'posts15', 'Portal-Article-index', 5, 1435628819, '221.204.14.21'),
(103, 0, 'posts16', 'Portal-Article-index', 5, 1435110230, '120.52.18.48'),
(104, 0, 'posts16', 'Portal-Article-index', 1, 1434337124, '221.204.14.23'),
(105, 0, 'posts20', 'Portal-Article-index', 1, 1434337149, '120.52.18.48'),
(106, 0, 'posts15', 'Portal-Article-index', 1, 1434337627, '125.88.189.22'),
(107, 0, 'posts20', 'Portal-Article-index', 9, 1435826279, '222.73.144.28'),
(108, 0, 'posts16', 'Portal-Article-index', 1, 1434337992, '222.73.144.28'),
(109, 0, 'posts19', 'Portal-Article-index', 4, 1434908121, '222.73.144.28'),
(110, 0, 'posts15', 'Portal-Article-index', 1, 1434338435, '125.88.189.13'),
(111, 0, 'posts14', 'Portal-Article-index', 2, 1434339032, '222.73.144.28'),
(112, 0, 'posts20', 'Portal-Article-index', 4, 1435607183, '125.88.189.12'),
(113, 0, 'posts20', 'Portal-Article-index', 1, 1434340750, '125.88.189.18'),
(114, 0, 'posts20', 'Portal-Article-index', 1, 1434346772, '120.52.18.51'),
(115, 0, 'posts19', 'Portal-Article-index', 2, 1434346831, '120.52.18.51'),
(116, 0, 'posts20', 'Portal-Article-index', 1, 1434353073, '222.73.144.34'),
(117, 0, 'posts15', 'Portal-Article-index', 3, 1434353557, '120.52.18.50'),
(118, 0, 'posts20', 'Portal-Article-index', 16, 1435287560, '120.52.18.50'),
(119, 0, 'posts19', 'Portal-Article-index', 3, 1435287562, '120.52.18.50'),
(120, 0, 'posts20', 'Portal-Article-index', 2, 1435561023, '222.73.144.31'),
(121, 0, 'posts19', 'Portal-Article-index', 1, 1434363580, '182.118.25.211'),
(122, 0, 'posts16', 'Portal-Article-index', 1, 1434363598, '182.118.22.220'),
(123, 0, 'posts20', 'Portal-Article-index', 1, 1434363628, '182.118.20.162'),
(124, 0, 'posts15', 'Portal-Article-index', 1, 1434363732, '182.118.21.209'),
(125, 0, 'posts15', 'Portal-Article-index', 3, 1436104249, '222.73.144.29'),
(126, 0, 'posts16', 'Portal-Article-index', 3, 1436104282, '222.73.144.29'),
(127, 0, 'posts17', 'Portal-Article-index', 2, 1436104292, '222.73.144.29'),
(128, 0, 'posts14', 'Portal-Article-index', 1, 1434429074, '222.73.144.29'),
(129, 0, 'posts15', 'Portal-Article-index', 2, 1434430368, '125.88.189.21'),
(130, 0, 'posts14', 'Portal-Article-index', 2, 1435574857, '125.88.189.21'),
(131, 0, 'posts13', 'Portal-Article-index', 1, 1434430017, '125.88.189.21'),
(132, 0, 'posts12', 'Portal-Article-index', 1, 1434430079, '125.88.189.21'),
(133, 0, 'posts9', 'Portal-Article-index', 1, 1434430134, '125.88.189.21'),
(134, 0, 'posts16', 'Portal-Article-index', 2, 1434848583, '125.88.189.21'),
(135, 0, 'posts17', 'Portal-Article-index', 2, 1435692948, '125.88.189.21'),
(136, 0, 'posts14', 'Portal-Article-index', 1, 1434430759, '222.73.144.33'),
(137, 0, 'posts9', 'Portal-Article-index', 1, 1434430940, '222.73.144.28'),
(138, 0, 'posts16', 'Portal-Article-index', 1, 1434430989, '222.73.144.31'),
(139, 0, 'posts17', 'Portal-Article-index', 1, 1434431002, '222.73.144.32'),
(140, 0, 'posts15', 'Portal-Article-index', 3, 1435574766, '125.88.189.12'),
(141, 0, 'posts15', 'Portal-Article-index', 2, 1434436753, '120.52.18.46'),
(142, 0, 'posts17', 'Portal-Article-index', 1, 1434436715, '120.52.18.46'),
(143, 0, 'posts16', 'Portal-Article-index', 2, 1434436763, '120.52.18.46'),
(144, 0, 'posts20', 'Portal-Article-index', 3, 1435566993, '222.73.144.32'),
(145, 0, 'posts20', 'Portal-Article-index', 3, 1435387214, '125.88.189.21'),
(146, 0, 'posts20', 'Portal-Article-index', 1, 1434608513, '183.136.133.42'),
(147, 0, 'posts15', 'Portal-Article-index', 3, 1434614724, '27.221.20.25'),
(148, 0, 'posts16', 'Portal-Article-index', 3, 1434615828, '27.221.20.25'),
(149, 0, 'posts12', 'Portal-Article-index', 2, 1434615547, '27.221.20.25'),
(150, 0, 'posts3', 'Portal-Article-index', 1, 1434615569, '27.221.20.25'),
(151, 0, 'posts5', 'Portal-Article-index', 1, 1434615572, '27.221.20.25'),
(152, 0, 'posts7', 'Portal-Article-index', 1, 1434615572, '27.221.20.25'),
(153, 0, 'posts13', 'Portal-Article-index', 2, 1434615837, '27.221.20.25'),
(154, 0, 'posts14', 'Portal-Article-index', 1, 1434615591, '27.221.20.25'),
(155, 0, 'posts13', 'Portal-Article-index', 1, 1434618062, '123.125.71.82'),
(156, 0, 'posts20', 'Portal-Article-index', 1, 1434620062, '123.125.71.103'),
(157, 0, 'posts9', 'Portal-Article-index', 1, 1434622062, '123.125.71.109'),
(158, 0, 'posts18', 'Portal-Article-index', 1, 1434624062, '123.125.71.53'),
(159, 0, 'posts12', 'Portal-Article-index', 1, 1434626062, '220.181.108.142'),
(160, 0, 'posts11', 'Portal-Article-index', 1, 1434628062, '220.181.108.96'),
(161, 0, 'posts4', 'Portal-Article-index', 1, 1434636032, '123.125.71.40'),
(162, 0, 'posts19', 'Portal-Article-index', 1, 1434638032, '220.181.108.160'),
(163, 0, 'posts19', 'Portal-Article-index', 1, 1434759967, '101.226.166.246'),
(164, 0, 'posts10', 'Portal-Article-index', 1, 1434839349, '182.118.22.201'),
(165, 0, 'posts13', 'Portal-Article-index', 1, 1434839377, '182.118.25.204'),
(166, 0, 'posts7', 'Portal-Article-index', 1, 1434839474, '182.118.22.225'),
(167, 0, 'posts16', 'Portal-Article-index', 1, 1434839477, '182.118.25.210'),
(168, 0, 'posts5', 'Portal-Article-index', 1, 1434839584, '182.118.20.253'),
(169, 0, 'posts9', 'Portal-Article-index', 1, 1434839686, '182.118.25.203'),
(170, 0, 'posts8', 'Portal-Article-index', 1, 1434839748, '182.118.25.226'),
(171, 0, 'posts12', 'Portal-Article-index', 1, 1434839786, '182.118.20.217'),
(172, 0, 'posts18', 'Portal-Article-index', 1, 1434839800, '182.118.21.251'),
(173, 0, 'posts20', 'Portal-Article-index', 1, 1434839814, '182.118.20.174'),
(174, 0, 'posts4', 'Portal-Article-index', 1, 1434839858, '182.118.21.207'),
(175, 0, 'posts20', 'Portal-Article-index', 1, 1434840107, '182.118.20.228'),
(176, 0, 'posts17', 'Portal-Article-index', 1, 1434840399, '182.118.22.210'),
(177, 0, 'posts1', 'Portal-Article-index', 1, 1434842424, '101.226.168.252'),
(178, 0, 'posts15', 'Portal-Article-index', 7, 1435892178, '222.73.144.32'),
(179, 0, 'posts16', 'Portal-Article-index', 2, 1435626513, '222.73.144.32'),
(180, 0, 'posts15', 'Portal-Article-index', 2, 1435628808, '183.136.133.41'),
(181, 0, 'posts20', 'Portal-Article-index', 3, 1434863534, '183.136.133.41'),
(182, 0, 'posts19', 'Portal-Article-index', 2, 1434863533, '183.136.133.41'),
(183, 0, 'posts15', 'Portal-Article-index', 1, 1434877809, '221.204.14.28'),
(184, 0, 'posts2', 'Portal-Article-index', 1, 1434899403, '222.73.144.33'),
(185, 0, 'posts20', 'Portal-Article-index', 1, 1435044156, '120.52.18.49'),
(186, 0, 'posts15', 'Portal-Article-index', 2, 1435583587, '120.52.18.52'),
(187, 0, 'posts20', 'Portal-Article-index', 4, 1435547335, '120.52.18.54'),
(188, 0, 'posts15', 'Portal-Article-index', 10, 1435729537, '27.221.20.21'),
(189, 0, 'posts20', 'Portal-Article-index', 10, 1435892376, '183.136.133.31'),
(190, 0, 'posts15', 'Portal-Article-index', 7, 1435811819, '183.136.133.31'),
(191, 0, 'posts19', 'Portal-Article-index', 2, 1435724982, '183.136.133.31'),
(192, 0, 'posts20', 'Portal-Article-index', 2, 1435417439, '125.88.189.16'),
(193, 0, 'posts15', 'Portal-Article-index', 1, 1435071111, '125.88.189.16'),
(194, 0, 'posts16', 'Portal-Article-index', 1, 1435071149, '125.88.189.16'),
(195, 0, 'posts14', 'Portal-Article-index', 1, 1435110247, '120.52.18.49'),
(196, 0, 'posts16', 'Portal-Article-index', 5, 1435902092, '183.136.133.29'),
(197, 0, 'posts20', 'Portal-Article-index', 1, 1435129718, '222.73.144.29'),
(198, 0, 'posts15', 'Portal-Article-index', 7, 1435645979, '222.73.144.33'),
(199, 0, 'posts8', 'Portal-Article-index', 1, 1435182707, '123.125.71.23'),
(200, 0, 'posts7', 'Portal-Article-index', 1, 1435183773, '220.181.108.140'),
(201, 0, 'posts10', 'Portal-Article-index', 1, 1435184840, '220.181.108.179'),
(202, 0, 'posts6', 'Portal-Article-index', 1, 1435185907, '220.181.108.87'),
(203, 0, 'posts5', 'Portal-Article-index', 1, 1435188040, '220.181.108.152'),
(204, 0, 'posts9', 'Portal-Article-index', 1, 1435195963, '183.136.133.29'),
(205, 0, 'posts1', 'Portal-Article-index', 1, 1435196065, '183.136.133.29'),
(206, 0, 'posts2', 'Portal-Article-index', 1, 1435196091, '183.136.133.29'),
(207, 0, 'posts2', 'Portal-Article-index', 1, 1435196091, '125.88.189.16'),
(208, 0, 'posts3', 'Portal-Article-index', 1, 1435196171, '183.136.133.29'),
(209, 0, 'posts4', 'Portal-Article-index', 1, 1435196294, '183.136.133.29'),
(210, 0, 'posts4', 'Portal-Article-index', 1, 1435196294, '125.88.189.21'),
(211, 0, 'posts15', 'Portal-Article-index', 2, 1435995418, '222.73.144.31'),
(212, 0, 'posts17', 'Portal-Article-index', 2, 1435300918, '183.136.133.29'),
(213, 0, 'posts18', 'Portal-Article-index', 1, 1435196510, '222.73.144.27'),
(214, 0, 'posts18', 'Portal-Article-index', 1, 1435196510, '183.136.133.29'),
(215, 0, 'posts14', 'Portal-Article-index', 1, 1435196544, '183.136.133.29'),
(216, 0, 'posts13', 'Portal-Article-index', 2, 1435568536, '183.136.133.29'),
(217, 0, 'posts1', 'Portal-Article-index', 1, 1435196872, '222.73.144.27'),
(218, 0, 'posts12', 'Portal-Article-index', 1, 1435196904, '183.136.133.29'),
(219, 0, 'posts12', 'Portal-Article-index', 1, 1435196904, '125.88.189.15'),
(220, 0, 'posts11', 'Portal-Article-index', 1, 1435197123, '183.136.133.29'),
(221, 0, 'posts10', 'Portal-Article-index', 1, 1435197199, '183.136.133.29'),
(222, 0, 'posts14', 'Portal-Article-index', 2, 1436122982, '125.88.189.15'),
(223, 0, 'posts11', 'Portal-Article-index', 2, 1435645802, '222.73.144.33'),
(224, 0, 'posts14', 'Portal-Article-index', 1, 1435198210, '101.226.169.224'),
(225, 0, 'posts15', 'Portal-Article-index', 1, 1435199019, '221.204.14.26'),
(226, 0, 'posts16', 'Portal-Article-index', 1, 1435199064, '221.204.14.26'),
(227, 0, 'posts13', 'Portal-Article-index', 1, 1435199080, '221.204.14.26'),
(228, 0, 'posts4', 'Portal-Article-index', 1, 1435199084, '221.204.14.26'),
(229, 0, 'posts19', 'Portal-Article-index', 1, 1435209668, '182.118.20.164'),
(230, 0, 'posts11', 'Portal-Article-index', 1, 1435209921, '182.118.22.244'),
(231, 0, 'posts14', 'Portal-Article-index', 1, 1435209966, '182.118.25.226'),
(232, 0, 'posts19', 'Portal-Article-index', 1, 1435217585, '183.136.133.29'),
(233, 0, 'posts14', 'Portal-Article-index', 1, 1435223236, '221.204.14.26'),
(234, 0, 'posts15', 'Portal-Article-index', 3, 1435980699, '183.136.133.44'),
(235, 0, 'posts16', 'Portal-Article-index', 1, 1435227286, '183.136.133.44'),
(236, 0, 'posts8', 'Portal-Article-index', 1, 1435227343, '183.136.133.44'),
(237, 0, 'posts17', 'Portal-Article-index', 1, 1435232702, '183.136.133.42'),
(238, 0, 'posts13', 'Portal-Article-index', 1, 1435232829, '183.136.133.42'),
(239, 0, 'posts14', 'Portal-Article-index', 2, 1435547158, '120.52.18.54'),
(240, 0, 'posts13', 'Portal-Article-index', 1, 1435250250, '120.52.18.54'),
(241, 0, 'posts8', 'Portal-Article-index', 1, 1435250293, '120.52.18.54'),
(242, 0, 'posts7', 'Portal-Article-index', 1, 1435250419, '120.52.18.54'),
(243, 0, 'posts6', 'Portal-Article-index', 1, 1435250436, '120.52.18.54'),
(244, 0, 'posts5', 'Portal-Article-index', 1, 1435250462, '120.52.18.54'),
(245, 0, 'posts10', 'Portal-Article-index', 1, 1435250480, '120.52.18.54'),
(246, 0, 'posts11', 'Portal-Article-index', 1, 1435250502, '120.52.18.54'),
(247, 0, 'posts18', 'Portal-Article-index', 1, 1435250597, '120.52.18.54'),
(248, 0, 'posts19', 'Portal-Article-index', 1, 1435263384, '125.88.189.11'),
(249, 0, 'posts20', 'Portal-Article-index', 2, 1436028647, '125.88.189.11'),
(250, 0, 'posts15', 'Portal-Article-index', 3, 1436030282, '125.88.189.11'),
(251, 0, 'posts16', 'Portal-Article-index', 1, 1435263389, '125.88.189.11'),
(252, 0, 'posts19', 'Portal-Article-index', 1, 1435263718, '125.88.189.21'),
(253, 0, 'posts15', 'Portal-Article-index', 1, 1435292009, '183.136.133.28'),
(254, 0, 'posts14', 'Portal-Article-index', 2, 1435416961, '125.88.189.16'),
(255, 0, 'posts5', 'Portal-Article-index', 2, 1435417162, '125.88.189.16'),
(256, 0, 'posts9', 'Portal-Article-index', 1, 1435325154, '27.221.20.23'),
(257, 0, 'posts10', 'Portal-Article-index', 1, 1435325275, '27.221.20.23'),
(258, 0, 'posts11', 'Portal-Article-index', 1, 1435325364, '27.221.20.23'),
(259, 0, 'posts12', 'Portal-Article-index', 1, 1435325428, '27.221.20.23'),
(260, 0, 'posts14', 'Portal-Article-index', 1, 1435325601, '27.221.20.23'),
(261, 0, 'posts20', 'Portal-Article-index', 5, 1435802890, '202.102.85.16'),
(262, 0, 'posts20', 'Portal-Article-index', 3, 1435913015, '125.88.189.19'),
(263, 0, 'posts3', 'Portal-Article-index', 1, 1435397761, '183.136.133.43'),
(264, 0, 'posts10', 'Portal-Article-index', 1, 1435416798, '125.88.189.16'),
(265, 0, 'posts11', 'Portal-Article-index', 1, 1435416804, '125.88.189.16'),
(266, 0, 'posts12', 'Portal-Article-index', 1, 1435416930, '125.88.189.16'),
(267, 0, 'posts13', 'Portal-Article-index', 1, 1435417021, '125.88.189.16'),
(268, 0, 'posts17', 'Portal-Article-index', 1, 1435417032, '125.88.189.16'),
(269, 0, 'posts18', 'Portal-Article-index', 1, 1435417046, '125.88.189.16'),
(270, 0, 'posts4', 'Portal-Article-index', 1, 1435417119, '125.88.189.16'),
(271, 0, 'posts6', 'Portal-Article-index', 1, 1435417206, '125.88.189.16'),
(272, 0, 'posts7', 'Portal-Article-index', 1, 1435417255, '125.88.189.16'),
(273, 0, 'posts8', 'Portal-Article-index', 1, 1435417307, '125.88.189.16'),
(274, 0, 'posts9', 'Portal-Article-index', 1, 1435417349, '125.88.189.16'),
(275, 0, 'posts19', 'Portal-Article-index', 1, 1435417422, '125.88.189.16'),
(276, 0, 'posts6', 'Portal-Article-index', 1, 1435437137, '182.118.21.221'),
(277, 0, 'posts20', 'Portal-Article-index', 4, 1435987606, '222.73.144.33'),
(278, 0, 'posts20', 'Portal-Article-index', 1, 1435549762, '120.52.18.45'),
(279, 0, 'posts15', 'Portal-Article-index', 4, 1435822141, '222.73.144.30'),
(280, 0, 'posts20', 'Portal-Article-index', 3, 1435553858, '222.73.144.30'),
(281, 0, 'posts20', 'Portal-Article-index', 1, 1435560383, '202.102.85.17'),
(282, 0, 'posts20', 'Portal-Article-index', 1, 1435560387, '221.204.14.19'),
(283, 0, 'posts20', 'Portal-Article-index', 2, 1435628725, '221.204.14.20'),
(284, 0, 'posts15', 'Portal-Article-index', 1, 1435569604, '125.88.189.14'),
(285, 0, 'posts16', 'Portal-Article-index', 2, 1435574784, '125.88.189.12'),
(286, 0, 'posts17', 'Portal-Article-index', 1, 1435574805, '125.88.189.12'),
(287, 0, 'posts9', 'Portal-Article-index', 1, 1435579383, '120.52.18.52'),
(288, 0, 'posts18', 'Portal-Article-index', 1, 1435583567, '120.52.18.52'),
(289, 0, 'posts17', 'Portal-Article-index', 1, 1435583609, '120.52.18.52'),
(290, 0, 'posts15', 'Portal-Article-index', 5, 1435912804, '125.88.189.19'),
(291, 0, 'posts1', 'Portal-Article-index', 1, 1435597028, '182.118.25.202'),
(292, 0, 'posts4', 'Portal-Article-index', 1, 1435597629, '182.118.25.227'),
(293, 0, 'posts7', 'Portal-Article-index', 1, 1435597640, '182.118.25.202'),
(294, 0, 'posts2', 'Portal-Article-index', 1, 1435597809, '182.118.20.219'),
(295, 0, 'posts11', 'Portal-Article-index', 1, 1435597812, '182.118.20.169'),
(296, 0, 'posts20', 'Portal-Article-index', 1, 1435597825, '182.118.20.214'),
(297, 0, 'posts17', 'Portal-Article-index', 1, 1435597854, '182.118.21.211'),
(298, 0, 'posts19', 'Portal-Article-index', 1, 1435598084, '182.118.22.236'),
(299, 0, 'posts12', 'Portal-Article-index', 1, 1435598212, '182.118.22.232'),
(300, 0, 'posts10', 'Portal-Article-index', 1, 1435599126, '182.118.22.220'),
(301, 0, 'posts8', 'Portal-Article-index', 1, 1435599374, '182.118.21.220'),
(302, 0, 'posts16', 'Portal-Article-index', 3, 1435626528, '61.160.224.138'),
(303, 0, 'posts16', 'Portal-Article-index', 2, 1435626504, '202.102.85.18'),
(304, 0, 'posts16', 'Portal-Article-index', 6, 1435891519, '183.136.133.31'),
(305, 0, 'posts15', 'Portal-Article-index', 2, 1435626944, '202.102.85.18'),
(306, 0, 'posts20', 'Portal-Article-index', 1, 1435626569, '61.160.224.138'),
(307, 0, 'posts20', 'Portal-Article-index', 1, 1435626587, '202.102.85.18'),
(308, 0, 'posts15', 'Portal-Article-index', 1, 1435628667, '221.204.14.20'),
(309, 0, 'posts20', 'Portal-Article-index', 1, 1435628716, '61.160.224.137'),
(310, 0, 'posts15', 'Portal-Article-index', 1, 1435628810, '61.160.224.137'),
(311, 0, 'posts16', 'Portal-Article-index', 1, 1435633853, '125.88.189.22'),
(312, 0, 'posts15', 'Portal-Article-index', 4, 1435822154, '125.88.189.18'),
(313, 0, 'posts16', 'Portal-Article-index', 1, 1435634065, '125.88.189.18'),
(314, 0, 'posts1', 'Portal-Article-index', 1, 1435634449, '125.88.189.21'),
(315, 0, 'posts2', 'Portal-Article-index', 1, 1435634472, '125.88.189.21'),
(316, 0, 'posts3', 'Portal-Article-index', 1, 1435634537, '125.88.189.21'),
(317, 0, 'posts15', 'Portal-Article-index', 1, 1435634762, '125.88.189.15'),
(318, 0, 'posts16', 'Portal-Article-index', 1, 1435634876, '125.88.189.13'),
(319, 0, 'posts16', 'Portal-Article-index', 2, 1435729562, '27.221.20.21'),
(320, 0, 'posts17', 'Portal-Article-index', 2, 1435729571, '27.221.20.21'),
(321, 0, 'posts9', 'Portal-Article-index', 1, 1435643638, '27.221.20.21'),
(322, 0, 'posts12', 'Portal-Article-index', 1, 1435643684, '27.221.20.21'),
(323, 0, 'posts16', 'Portal-Article-index', 2, 1435645481, '222.73.144.33'),
(324, 0, 'posts19', 'Portal-Article-index', 1, 1435645451, '222.73.144.33'),
(325, 0, 'posts17', 'Portal-Article-index', 1, 1435645489, '222.73.144.33'),
(326, 0, 'posts11', 'Portal-Article-index', 1, 1435654125, '125.88.189.12'),
(327, 0, 'posts11', 'Portal-Article-index', 1, 1435673792, '183.136.133.30'),
(328, 0, 'posts12', 'Portal-Article-index', 1, 1435673882, '183.136.133.30'),
(329, 0, 'posts4', 'Portal-Article-index', 1, 1435674135, '183.136.133.30'),
(330, 0, 'posts13', 'Portal-Article-index', 1, 1435674180, '183.136.133.30'),
(331, 0, 'posts9', 'Portal-Article-index', 1, 1435674283, '183.136.133.30'),
(332, 0, 'posts18', 'Portal-Article-index', 1, 1435674393, '183.136.133.30'),
(333, 0, 'posts19', 'Portal-Article-index', 1, 1435679141, '125.88.189.19'),
(334, 0, 'posts14', 'Portal-Article-index', 1, 1435684878, '125.88.189.19'),
(335, 0, 'posts15', 'Portal-Article-index', 1, 1435687669, '182.118.22.223'),
(336, 0, 'posts16', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(337, 0, 'posts15', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(338, 0, 'posts12', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(339, 0, 'posts4', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(340, 0, 'posts9', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(341, 0, 'posts19', 'Portal-Article-index', 2, 1435711543, '202.102.85.16'),
(342, 0, 'posts18', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(343, 0, 'posts14', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(344, 0, 'posts11', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(345, 0, 'posts13', 'Portal-Article-index', 1, 1435711539, '202.102.85.16'),
(346, 0, 'posts17', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(347, 0, 'posts10', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(348, 0, 'posts7', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(349, 0, 'posts6', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(350, 0, 'posts5', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(351, 0, 'posts8', 'Portal-Article-index', 1, 1435711544, '202.102.85.16'),
(352, 0, 'posts15', 'Portal-Article-index', 1, 1435720043, '183.136.133.42'),
(353, 0, 'posts20', 'Portal-Article-index', 3, 1435887713, '112.25.60.16'),
(354, 0, 'posts20', 'Portal-Article-index', 1, 1435730283, '125.88.189.22'),
(355, 0, 'posts1', 'Portal-Article-index', 1, 1435737170, '125.88.189.22'),
(356, 0, 'posts2', 'Portal-Article-index', 1, 1435737173, '125.88.189.22'),
(357, 0, 'posts3', 'Portal-Article-index', 1, 1435737175, '125.88.189.22'),
(358, 0, 'posts20', 'Portal-Article-index', 1, 1435744862, '125.88.189.15'),
(359, 0, 'posts19', 'Portal-Article-index', 1, 1435812818, '27.221.20.23'),
(360, 0, 'posts14', 'Portal-Article-index', 2, 1435891508, '183.136.133.31'),
(361, 0, 'posts15', 'Portal-Article-index', 1, 1435821843, '182.140.227.17'),
(362, 0, 'posts12', 'Portal-Article-index', 1, 1435821875, '182.140.227.17'),
(363, 0, 'posts15', 'Portal-Article-index', 1, 1435822068, '202.102.85.20'),
(364, 0, 'posts9', 'Portal-Article-index', 1, 1435822941, '222.73.144.33'),
(365, 0, 'posts7', 'Portal-Article-index', 1, 1435822974, '222.73.144.33'),
(366, 0, 'posts15', 'Portal-Article-index', 2, 1436010556, '202.102.85.22'),
(367, 0, 'posts14', 'Portal-Article-index', 1, 1435841281, '112.25.60.15'),
(368, 0, 'posts14', 'Portal-Article-index', 2, 1435993636, '222.73.144.34'),
(369, 0, 'posts20', 'Portal-Article-index', 3, 1435997194, '112.25.60.18'),
(370, 0, 'posts21', 'Portal-Article-index', 2, 1436105879, '112.25.60.22'),
(371, 0, 'posts15', 'Portal-Article-index', 1, 1435847024, '112.25.60.22'),
(372, 0, 'posts16', 'Portal-Article-index', 1, 1435847066, '112.25.60.22'),
(373, 0, 'posts17', 'Portal-Article-index', 2, 1435847081, '112.25.60.22'),
(374, 0, 'posts18', 'Portal-Article-index', 1, 1435847121, '112.25.60.22'),
(375, 0, 'posts7', 'Portal-Article-index', 1, 1435859450, '112.25.60.17'),
(376, 0, 'posts4', 'Portal-Article-index', 1, 1435859578, '112.25.60.17'),
(377, 0, 'posts1', 'Portal-Article-index', 1, 1435859622, '112.25.60.17'),
(378, 0, 'posts3', 'Portal-Article-index', 1, 1435859635, '112.25.60.17'),
(379, 0, 'posts5', 'Portal-Article-index', 1, 1435859666, '112.25.60.17'),
(380, 0, 'posts10', 'Portal-Article-index', 1, 1435859713, '112.25.60.17'),
(381, 0, 'posts9', 'Portal-Article-index', 1, 1435859758, '112.25.60.17'),
(382, 0, 'posts8', 'Portal-Article-index', 1, 1435859808, '112.25.60.17'),
(383, 0, 'posts15', 'Portal-Article-index', 3, 1435980699, '112.25.60.17'),
(384, 0, 'posts16', 'Portal-Article-index', 1, 1435859973, '112.25.60.17'),
(385, 0, 'posts17', 'Portal-Article-index', 1, 1435859994, '112.25.60.17'),
(386, 0, 'posts20', 'Portal-Article-index', 3, 1436100378, '112.25.60.17'),
(387, 0, 'posts19', 'Portal-Article-index', 1, 1435860020, '112.25.60.17'),
(388, 0, 'posts5', 'Portal-Article-index', 1, 1435860131, '125.88.189.22'),
(389, 0, 'posts17', 'Portal-Article-index', 1, 1435864543, '123.125.71.104'),
(390, 0, 'posts21', 'Portal-Article-index', 1, 1435881229, '222.73.144.29'),
(391, 0, 'posts13', 'Portal-Article-index', 1, 1435881326, '222.73.144.29'),
(392, 0, 'posts15', 'Portal-Article-index', 2, 1435887723, '112.25.60.16'),
(393, 0, 'posts20', 'Portal-Article-index', 1, 1435891447, '112.25.60.19'),
(394, 0, 'posts21', 'Portal-Article-index', 3, 1435892583, '183.136.133.31'),
(395, 0, 'posts13', 'Portal-Article-index', 1, 1435892581, '183.136.133.31'),
(396, 0, 'posts16', 'Portal-Article-index', 1, 1435911721, '125.88.189.19'),
(397, 0, 'posts14', 'Portal-Article-index', 1, 1435912892, '112.25.60.17'),
(398, 0, 'posts15', 'Portal-Article-index', 1, 1435980674, '112.25.60.15'),
(399, 0, 'posts17', 'Portal-Article-index', 2, 1435980755, '112.25.60.15'),
(400, 0, 'posts15', 'Portal-Article-index', 1, 1435987484, '27.221.20.24'),
(401, 0, 'posts16', 'Portal-Article-index', 1, 1435987513, '27.221.20.24'),
(402, 0, 'posts20', 'Portal-Article-index', 1, 1435987579, '27.221.20.24'),
(403, 0, 'posts21', 'Portal-Article-index', 1, 1435993314, '222.73.144.34'),
(404, 0, 'posts12', 'Portal-Article-index', 2, 1436011462, '222.73.144.34'),
(405, 0, 'posts9', 'Portal-Article-index', 1, 1435993524, '222.73.144.34'),
(406, 0, 'posts13', 'Portal-Article-index', 1, 1435993561, '222.73.144.34'),
(407, 0, 'posts18', 'Portal-Article-index', 1, 1435994864, '180.153.236.127'),
(408, 0, 'posts15', 'Portal-Article-index', 5, 1435997209, '112.25.60.18'),
(409, 0, 'posts16', 'Portal-Article-index', 1, 1435997186, '112.25.60.18'),
(410, 0, 'posts20', 'Portal-Article-index', 1, 1435998018, '112.25.60.15'),
(411, 0, 'posts17', 'Portal-Article-index', 1, 1436010596, '202.102.85.22'),
(412, 0, 'posts14', 'Portal-Article-index', 2, 1436013842, '202.102.85.22'),
(413, 0, 'posts12', 'Portal-Article-index', 1, 1436010655, '202.102.85.22'),
(414, 0, 'posts9', 'Portal-Article-index', 1, 1436010701, '202.102.85.22'),
(415, 0, 'posts3', 'Portal-Article-index', 1, 1436010729, '202.102.85.22'),
(416, 0, 'posts2', 'Portal-Article-index', 1, 1436010903, '202.102.85.22'),
(417, 0, 'posts20', 'Portal-Article-index', 1, 1436010925, '202.102.85.22'),
(418, 0, 'posts9', 'Portal-Article-index', 1, 1436011517, '222.73.144.30'),
(419, 0, 'posts3', 'Portal-Article-index', 1, 1436011539, '125.88.189.19'),
(420, 0, 'posts2', 'Portal-Article-index', 1, 1436011716, '222.73.144.29'),
(421, 0, 'posts21', 'Portal-Article-index', 1, 1436017284, '222.73.144.28'),
(422, 0, 'posts19', 'Portal-Article-index', 1, 1436028657, '125.88.189.15'),
(423, 0, 'posts9', 'Portal-Article-index', 1, 1436029538, '125.88.189.15'),
(424, 0, 'posts21', 'Portal-Article-index', 1, 1436052621, '220.181.108.166'),
(425, 0, 'posts14', 'Portal-Article-index', 1, 1436063584, '112.25.60.16'),
(426, 0, 'posts13', 'Portal-Article-index', 1, 1436063623, '112.25.60.16'),
(427, 0, 'posts12', 'Portal-Article-index', 1, 1436063713, '112.25.60.16'),
(428, 0, 'posts20', 'Portal-Article-index', 1, 1436091461, '123.125.71.52'),
(429, 0, 'posts18', 'Portal-Article-index', 1, 1436100217, '112.25.60.17'),
(430, 0, 'posts16', 'Portal-Article-index', 1, 1436104283, '112.25.60.19'),
(431, 0, 'posts17', 'Portal-Article-index', 1, 1436104296, '112.25.60.16'),
(432, 0, 'posts9', 'Portal-Article-index', 1, 1436135904, '125.88.189.22'),
(433, 0, 'posts6', 'Portal-Article-index', 1, 1436143723, '125.88.189.11'),
(434, 0, 'posts21', 'Portal-Article-index', 1, 1436148528, '183.136.133.41'),
(435, 0, 'posts11', 'Portal-Article-index', 2, 1436148614, '183.136.133.41'),
(436, 0, 'posts10', 'Portal-Article-index', 1, 1436148617, '183.136.133.41'),
(437, 0, 'posts8', 'Portal-Article-index', 1, 1436148619, '183.136.133.41'),
(438, 0, 'posts7', 'Portal-Article-index', 2, 1436148628, '183.136.133.41');

-- --------------------------------------------------------

--
-- 表的结构 `sp_guestbook`
--

CREATE TABLE IF NOT EXISTS `sp_guestbook` (
`id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_links`
--

CREATE TABLE IF NOT EXISTS `sp_links` (
`link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_links`
--

INSERT INTO `sp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder`) VALUES
(1, 'http://www.weipaidai.com', '微拍贷', '', '_blank', '', 1, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_menu`
--

CREATE TABLE IF NOT EXISTS `sp_menu` (
`id` smallint(6) unsigned NOT NULL,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=162 ;

--
-- 转存表中的数据 `sp_menu`
--

INSERT INTO `sp_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 1, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 1, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 1, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '幻灯片', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '网站广告', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 1, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 1, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 39, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav`
--

CREATE TABLE IF NOT EXISTS `sp_nav` (
`id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `sp_nav`
--

INSERT INTO `sp_nav` (`id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path`) VALUES
(1, 1, 0, '首页', '', 'home', '', 1, 1, '0-1'),
(2, 1, 0, '新闻动态', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"1";}}', '', 1, 4, '0-2'),
(3, 1, 0, '瀑布流', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"2";}}', '', 0, 10, '0-3'),
(5, 1, 9, '企业简介', '', 'index.php?g=&m=article&a=index&id=16', '', 1, 0, '0-9-5'),
(6, 1, 9, '企业文化', '', 'index.php?g=&m=article&a=index&id=17', '', 1, 0, '0-9-6'),
(7, 1, 9, '荣誉资质', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"8";}}', '', 1, 0, '0-9-7'),
(8, 1, 9, '招贤纳士', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"9";}}', '', 1, 0, '0-9-8'),
(9, 1, 0, '关于华融', '', 'home', '', 1, 5, '0-9'),
(10, 1, 0, '我要理财', '_blank', 'http://www.weipaidai.com/invest/index.html', '', 1, 2, '0-10'),
(22, 1, 0, '我要借贷', '_blank', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:2:"20";}}', '', 1, 3, '0-22'),
(15, 1, 2, '华融动态', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"4";}}', '', 1, 0, '0-2-15'),
(16, 1, 2, '行业资讯', '', 'a:2:{s:6:"action";s:17:"Portal/List/index";s:5:"param";a:1:{s:2:"id";s:1:"3";}}', '', 1, 0, '0-2-16'),
(17, 1, 0, '联系我们', '', 'home', '', 1, 5, '0-17'),
(18, 1, 17, '联系方式', '', '?m=article&a=index&id=21', '', 1, 0, '0-17-18'),
(19, 1, 17, '客户服务', '', '?m=article&a=index&id=20', '', 1, 0, '0-17-19'),
(20, 1, 17, '在线留言', '', 'tencent://message/?uin=1119389110&amp;websiteName=www.qq.com', '', 1, 0, '0-17-20');

-- --------------------------------------------------------

--
-- 表的结构 `sp_nav_cat`
--

CREATE TABLE IF NOT EXISTS `sp_nav_cat` (
`navcid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_nav_cat`
--

INSERT INTO `sp_nav_cat` (`navcid`, `name`, `active`, `remark`) VALUES
(1, '主导航', 1, '主导航');

-- --------------------------------------------------------

--
-- 表的结构 `sp_oauth_user`
--

CREATE TABLE IF NOT EXISTS `sp_oauth_user` (
`id` int(20) NOT NULL,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_options`
--

CREATE TABLE IF NOT EXISTS `sp_options` (
`option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `sp_options`
--

INSERT INTO `sp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'member_email_active', '{"title":"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.","template":"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\"http:\\/\\/www.thinkcmf.com\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\"\\" href=\\"http:\\/\\/#link#\\" target=\\"_self\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>"}', 1),
(2, 'site_options', '            {\r\n            		"site_name":"华融财富",\r\n            		"site_host":"http://cms.my.com/",\r\n            		"site_root":"",\r\n            		"site_icp":"",\r\n            		"site_admin_email":"cdm14cn@163.com",\r\n            		"site_tongji":"",\r\n            		"site_copyright":"",\r\n            		"site_seo_title":"华融财富",\r\n            		"site_seo_keywords":"",\r\n            		"site_seo_description":"理财,投资"\r\n        }', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_plugins`
--

CREATE TABLE IF NOT EXISTS `sp_plugins` (
`id` int(11) unsigned NOT NULL COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_posts`
--

CREATE TABLE IF NOT EXISTS `sp_posts` (
`id` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `sp_posts`
--

INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(1, 1, '', '', '2015-06-08 16:27:51', '<p style="clear: both; white-space: normal;"><strong><span style="font-family: Calibri;">9</span><span style="font-family: 宋体;">月起，无论你是在高楼大厦里俯视，亦或是在公交车内向外观望，又或是在自家座驾里发呆，你都很有可能碰到</span><span style="font-family: Calibri;">“</span><span style="font-family: 宋体;">华融财富</span><span style="font-family: Calibri;">”</span><span style="font-family: 宋体;">华丽丽的背影。。。</span></strong></p><p style="clear: both; white-space: normal; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzibJtBbSYbgj48vXibuWUOSkSNhyJDqO5SOzUrkTnX4OICJ2xPxNia3WKQxHJHGFOGoRLSSp3Neiajl7g/0" data-s="300,640" data-ratio="0.6059405940594059" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><strong><span style="font-family: 宋体;"><br/></span></strong></p><p style="clear: both; white-space: normal;"><strong><span style="font-family: 宋体;">别说我没有告诉过你哦</span><span style="font-family: Calibri;">~&nbsp;</span><span style="font-family: 宋体;">其实，你只要动动手指，拍下你看到的“华融财富”出租车广告，然后发微信，就能凭该条微信到公司来领取精美小礼品一份哦</span><span style="font-family: Calibri;">!</span></strong></p><p style="clear: both; white-space: normal;"><strong><span style="font-family: 宋体;">还是那句话，“数量有限，先到先得！”</span></strong></p><p style="clear: both; white-space: normal;"><strong><span style="font-family: 宋体;">小伙伴们，快行动起来吧！</span></strong></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><span style="color: rgb(255, 0, 0);"><strong><span style="font-family: 宋体;">咨询热线：</span><span style="font-family: Calibri;">400 033 6693</span></strong></span></p><p><br/></p>', 'TAXI~~~华融财富“拍照发微信赢好礼”活动即将开始喽！', '拍下你看到的“华融财富”出租车广告，然后发微信，就能凭该条微信到公司来领取精美小礼品一份哦!', 1, 1, '2014-09-01 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"5577c44a6868b.jpg"}', 10, 0, 0, 0),
(2, 1, '', '', '2015-06-08 16:32:31', '<p style="clear: both; white-space: normal;">&nbsp; &nbsp; 忙活了许久的活动，今天终于圆满结束了！每次到了这个时候，总是想感谢很多人！谢谢华融财富的所有工作人员的努力和付出，我想我们每个人又成长了！谢谢合作单位东方爱婴小托班所有参与表演的宝贝和家长们，今天，因为你们的到来，我们的会场变得特别有爱！谢谢所有聆听的家长们，孩子的成长来源于你们的思考与学习！谢谢所有合作机构的小伙伴们，下次合作更精彩[握手]今天还有很多的收获，海曙区总工会顾主席听完整场！通过成刚教授的讲座，知道了原来小朋友学习才艺最佳年纪是5周岁！华融财富的明天更精彩！感恩，感谢！所有 ！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAB4bSHfxdjgJMdKib6sKNLnPicKPvEOiarDtVibKUlNyVJOOE6WXpgAYaNA/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAicbBmG9E4jdBCU746HpIcZZqgjdhJ09RMJ17ciaibtwnWLhib6L2beslWA/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsA7OeqRYUPINt9yWaAEdIHe70xzFNu2ptmJ7icicTE3iaItZpgibNjby0icJw/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAns9R1fNCY7DONGEAk1oUR4EG9mKAUK7bic9vY0NmuSGe8fibUlPzlSNw/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAKlWozltgDWlWI8IPoVrkia1bPjorE9MydXCz6O5Fj0V8xwZSJd722Qw/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAiaZCoIs448wXw4Voxeqjmejzar2ODwenBVob0Yic1sOOsJsBce6pxJvA/0" data-w="720" data-ratio="1.3333333333333332" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsA8nANePKiaDicWX9Xxg13qngYzSJNpoAsszic6NPFk1nA78CayAOiaSrFEw/0" data-w="960" data-ratio="0.75" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p><br/></p>', '11月1日华融财富携手宁波市总工会、东方爱婴举办早教活动！', '总是想感谢很多人！谢谢华融财富的所有工作人员的努力和付出，我想我们每个人又成长了！谢谢合作单位东方爱婴小托班所有参与表演的宝贝和家长们', 1, 1, '2014-11-03 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"557552aa12171.jpg"}', 11, 0, 0, 0),
(3, 1, '', '', '2015-06-08 16:34:31', '<p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; &nbsp;华融财富，作为一颗在互联网金融界越来越闪耀的星星，于</span><span style="font-family: Calibri;">10</span><span style="font-family: 宋体;">月</span><span style="font-family: Calibri;">31</span><span style="font-family: 宋体;">日在上海应邀参加了为期三天的</span><span style="font-family: Calibri;">“2014</span><span style="font-family: 宋体;">上海理财博览会</span><span style="font-family: Calibri;">”</span><span style="font-family: 宋体;">。</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; &nbsp;</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; &nbsp;在此次展会期间，华融财富自成立以来的稳步发展得到了主办方以及业界的一致肯定，并一举斩获了由</span><span style="font-family: Calibri;">2014</span><span style="font-family: 宋体;">中国互联网金融论坛颁发的</span><span style="font-family: Calibri;">“</span><span style="font-family: 宋体;">互联网金融新锐品牌大奖</span><span style="font-family: Calibri;">”</span><span style="font-family: 宋体;">，此处应有掌声</span><span style="font-family: Calibri;">~~~</span></p><p style="clear: both; white-space: normal;"><span style="font-family: Calibri;"><br/></span></p><p style="clear: both; white-space: normal; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAe98d08QSu1uTNEXFzO5zyQB31f8GrUbkdMomermMia0Aict2eqic8M8iaQ/0" data-w="" data-ratio="0.6653465346534654" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; &nbsp;与此同时，华融财富理财端总经理王辉在接受主办方特邀采访时，表达了华融团队对未来</span><span style="font-family: Calibri;">P2P</span><span style="font-family: 宋体;">行业的美好愿景。</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">“对于如何规范行业自律，促使市场健康发展，华融财富肩负重任，今后的路还很长，这份事业任重而道远！”</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;"><br/></span></p><p style="clear: both; white-space: normal; text-align: center;"><span style="font-family: Calibri;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAdLyhibIycfKwVsohyytIyaMOrSB7TIjtyBPo6Z9ic2cJqPul6elnaNPA/0" data-w="" data-ratio="0.6514851485148515" data-s="300,640" style="max-width: 100%; height: auto !important;"/></span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;"></span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; 三天的展会虽然很短，但是华融的小伙伴们着实感受到了上海投资者们的热情，许多投资者过来的第一句话就是：</span><span style="font-family: Calibri;">“</span><span style="font-family: 宋体;">我听说你们得奖了，一定很靠谱，专程再来亲自了解下。</span><span style="font-family: Calibri;">”</span></p><p style="clear: both; white-space: normal;"><span style="font-family: Calibri;"><br/></span></p><p style="clear: both; white-space: normal; text-align: center;"><span style="font-family: Calibri;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAZztzSvibd6tmy1eK98QoHQvMNuKZzViapreSssrasa6hQricUxRKhX8iaw/0" data-w="436" data-ratio="1.110091743119266" data-s="300,640" style="max-width: 100%; height: auto !important;"/></span></p><p style="clear: both; white-space: normal;"><span style="font-family: Calibri;"></span><span style="font-family: 宋体;"></span></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体;">&nbsp; 你瞧</span><span style="font-family: Calibri;">~~~</span><span style="font-family: 宋体;">这队伍排的，不仅把我们的小伙伴们惊呆了，还惊动了各路媒体。。。</span></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal; text-align: center;"><span style="font-family: 宋体;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsA79QliaW2H52u3Jsh0FJ6khA4UscHNomM9Ejc6KxGYuMQlEiaADECWEug/0" data-w="" data-ratio="0.6495049504950495" data-s="300,640" style="max-width: 100%; height: auto !important;"/></span></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;">&nbsp;<span style="font-family: 宋体;">展会已经圆满结束啦，华融的小伙伴们也回到了各自的岗位上，欢迎有理财投资需求的你前来咨询哦</span><span style="font-family: Calibri;">~~~</span></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic1Dh1micl2xy23NQTjicJxsAuhQUKGHx1uuCKfBiaR54icYZmtgRiaHykpq59OrZuX5AaUDIMLd2icsstg/0" data-w="" data-ratio="1.2673267326732673" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="white-space: normal;"><br/></p>', '凯旋归来！——2014 华融财富参加上海理财博览会', '华融财富，作为一颗在互联网金融界越来越闪耀的星星，于10月31日在上海应邀参加了为期三天的“2014上海理财博览会”。', 1, 1, '2014-11-03 12:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 9, 0, 0, 0),
(4, 1, '', '', '2015-06-08 16:40:45', '<p style="clear: both; white-space: normal; line-height: 3em;">关注财富，更关注幸福！<br/></p><p style="clear: both; white-space: normal; line-height: 3em;">双11光棍日，单身的你去哪里找那个TA？？？</p><p style="clear: both; white-space: normal; line-height: 3em;"><br/></p><p style="clear: both; white-space: normal; line-height: 3em;">华融财富携手瑞俪新娘在金港大酒店<span style="line-height: 3em;">举办了</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;"><strong>“一起来脱单”</strong>&nbsp;大型的相亲见面</span><span style="line-height: 3em;">会的活动，</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">陪伴到场的单身帅哥美女们</span><span style="line-height: 3em;">共度了一个美好</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">的夜晚~</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><br/></p><p style="clear: both; white-space: normal; line-height: 3em;">游戏内容相当丰富，窃窃私语、腰媚<span style="line-height: 3em;">动人、</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">猪</span><span style="line-height: 3em;">八戒背媳妇、有情饮水饱、</span><span style="line-height: 3em;">相敬如宾等</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">等，</span><span style="line-height: 3em;">没</span><span style="line-height: 3em;">有来到现场的你或</span><span style="line-height: 3em;">许只能对着下面的</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">照片</span><span style="line-height: 3em;">尽情</span><span style="line-height: 3em;">发挥你的</span><span style="line-height: 3em;">想象力了~~~</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><br/></p><p style="clear: both; white-space: normal; line-height: 3em;">抓住幸福，拥有财富——华融财富愿<span style="line-height: 3em;">成为您</span></p><p style="clear: both; white-space: normal; line-height: 3em;"><span style="line-height: 3em;">身</span><span style="line-height: 3em;">边</span><span style="line-height: 3em;">贴心的财富管理专家！</span></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mmy9iaricibFvyN4geGkWMdxu1T5hXlcicicxUsfuQ44I4X9j3dAGmZs2zY7Q/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mmGia3O5zwXoZsc6zDEpdS2HWt7r8LuNe1p1tpojGCibrkHwrF1qo4jDkA/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mmJicpMSu54d5zDvzVeR1DDicSUsnfmADs2qOj1UhVcedCQqibr5IF0awMg/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mmarvVBBat3LaTn6PYGuNB9qtAHAQicUnEicsGgp43L7HxsoEZCpgJpEKA/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mm4PzYBWrrwiaRh9UqxbXiaibMkhuHqdotHSo6J1YXTV8g7pKIaCB8qFNsg/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mms80O9JX46mIXiatDUiaEOEXiaSicf3Z4DYpuHYXlnNI6JYkI04fKVv2Ieg/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz87em7CicVJ6pCO5LcblT9mm94LhR3SNtMnibuicjt29MtSWV9UIxNV30eAVVoLKGJDkdtvU4oA9yfng/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="white-space: normal;"><br/></p>', '11.11华融财富-瑞俪新娘 大型相亲活动', '华融财富携手瑞俪新娘在金港大酒店举办了“一起来脱单” 大型的相亲见面会的活动', 1, 1, '2015-06-08 16:39:52', NULL, 0, NULL, '', 0, '{"thumb":""}', 16, 0, 0, 0),
(5, 1, '', '', '2015-06-08 16:42:34', '<p style="clear: both; white-space: normal; text-indent: 28px; line-height: 2em;"><span style="font-family: 宋体;">在平淡无奇的生活当中，是不是渴望一场酣畅淋漓的战斗来重新点燃你的激情呢？</span><strong><span style="font-family: 宋体;">11月21日宁波雅戈尔体育馆推出真武魂WBK极限格斗联赛第二站</span></strong><span style="font-family: 宋体;">，21号那天雅戈尔体育馆不止是一场世界级殿堂赛事的精彩角逐，更是全国各种帅哥美女齐齐亮相的时侯,话说联赛也首次引进了MMA综合格斗系列，非常值得期待。朋友们，让我们21号19点</span>30<span style="font-family: 宋体;">分在宁波雅戈尔体育馆</span><span style="font-family: 宋体; line-height: 2em;">见</span>~<img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdzic4VHDIeVVymEfT0TEbWjMnNZAHRWyTSZLfjo9r1NWsNeic6ZUyAXodg7jKvz8RUgtbFkksMvyumrw/0" data-ratio="2.253968253968254" data-w="504" style="max-width: 100%; height: auto !important; font-family: 宋体; font-size: 14px; line-height: 2em;"/></p><p style="clear: both; white-space: normal; text-indent: 28px; line-height: 2em;"><span style="font-family: 宋体;">华融财富作为本次活动特约合作商：即日起至11月20日，只要您是华融财富VIP客户即享尊贵特权，将此微信分享至朋友圈截图给我们，同时编辑<span style="background-color: rgb(31, 73, 125); color: rgb(255, 255, 255);"><strong>“真武魂WBK职业极限格斗联赛第二战+姓名+手机号+投资金额”</strong></span>发送至&nbsp;<strong>华融财富</strong>&nbsp;官方微信即可参与报名！</span></p><p style="clear: both; white-space: normal; text-indent: 28px; line-height: 2em;"><span style="font-family: 宋体;"><br/></span></p><p style="clear: both; white-space: normal; text-indent: 28px; line-height: 2em;"><span style="font-family: 宋体;"></span></p><p style="clear: both; white-space: normal; line-height: 2em;"><span style="font-size: 14px; font-family: 宋体;">&nbsp; &nbsp;&nbsp;<span style="font-size: 16px;">我们将从中抽取10位幸运客户，电话通知您来我司领取赠票,每人限赠2张（数量有限，报完截止），期待着您的参与！</span></span></p><p style="clear: both; white-space: normal; line-height: 2em;"><br/></p><p><br/></p>', 'WBK真武魂世界极限格斗联赛华融财富来赠票了！', '在平淡无奇的生活当中，是不是渴望一场酣畅淋漓的战斗来重新点燃你的激情呢？', 1, 1, '2014-11-22 09:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 10, 0, 0, 0),
(6, 1, '', '', '2015-06-08 16:44:18', '<p style="clear: both; white-space: normal; line-height: 3em;">在这天降吉祥的幸福时刻，</p><p style="clear: both; white-space: normal; line-height: 3em;">我们不负镇海人民的期盼，</p><p style="clear: both; white-space: normal; line-height: 3em;">满怀真诚的祝福相约在美丽的地方，</p><p style="clear: both; white-space: normal; line-height: 3em;"><strong>共同庆祝华融财富镇海门店的盛大开业！</strong></p><p style="clear: both; white-space: normal; line-height: 3em;">今天上午，华融财富镇海门店在最繁华的镇海城河西路上正式开业啦！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHo3f1sEyPLZ1SiaicO8p1X5ulj0J0yLcJsx6oh0v4X0BNJiaYJogTtpa1pg/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHo6PLP119M3BfujicQmoAaAvSt1aNNxa55AqpubOCiaAPpdrGAUjFRZmTg/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHoriczsjLsRAiakpgu9hP1ZjmAqRhLymy00ibduYlAmX7DcGfmv4XVJKic8Q/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal; line-height: 3em;">门店虽小，诚意满满～</p><p style="clear: both; white-space: normal; line-height: 3em;">热情的镇海人民今天都快把大门给挤爆了！！！</p><p style="clear: both; white-space: normal; line-height: 3em;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHoyt9PjZ8sa3q3kSF8KeibCQ4MtEOBzytvPt8tqgzVKeWeciblfBjiag8ww/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal; line-height: 3em;">开业之际特地为大家准备了多重豪礼，队伍排的好欢乐！华融的小伙伴们也是醉了。。。</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHoNZgCa7Os2ZBjT0U9vW8M0EAwkCGZhxTnqOUXyGNy2wcK1W234yZU8A/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9EkeH0EGymPGPsgHQPsiaHo12wRCSmltyKm9ibbaabD7wTraXicmMpjuM5wqj2Q34C643uwORdHiaCHg/0" data-ratio="1.3339920948616601" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal; line-height: 3em;">“财富管理好，幸福自然来！”</p><p style="clear: both; white-space: normal; line-height: 3em;">大华融已经正式起航，你还在等什么，让我们一起扬帆驶向幸福的彼岸！</p><p style="white-space: normal; line-height: 3em;"><br/></p>', '11月20日华融财富镇海门店的盛大开业！', '在这天降吉祥的幸福时刻，满怀真诚的祝福相约在美丽的地方，共同庆祝华融财富镇海门店的盛大开业！', 1, 1, '2014-11-20 10:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 7, 0, 0, 0),
(7, 1, '', '', '2015-06-08 16:46:50', '<p style="clear: both; white-space: normal;"><span style="background-color: rgba(255, 255, 255, 0);">&nbsp;</span><span style="background-color: rgba(255, 255, 255, 0); line-height: 2em;">&nbsp;&nbsp; 基于创新的商业模式、贴心周到的服务体系、卓越的管理运营团队以及雄厚的资金实力，</span><strong style="line-height: 2em;">华融财富</strong>已经全面布局整个长三角、珠三角地区<span style="background-color: rgba(255, 255, 255, 0); line-height: 2em;">。目前，为了更好地服务宁波市民，华融财富的版图在宁波也继续扩大，位于江东惊驾路555号泰富广场A座1802室的江东分公司，即将在</span><strong style="line-height: 2em;">12月7日</strong><span style="background-color: rgba(255, 255, 255, 0); line-height: 2em;">开业了，开业当天，到华融财富的市民，</span><strong style="line-height: 2em;"><span class="s8" style="background-color: rgba(255, 255, 255, 0); color: rgb(183, 53, 25);">可以领取精美礼品一份。此外，在今年的12月底，华融财富的恒泰营业部</span><span class="s8" style="background-color: rgba(255, 255, 255, 0); color: rgb(183, 53, 25);">也将开业。</span></strong></p><p style="clear: both; white-space: normal;"><span style="background-color: rgba(255, 255, 255, 0);"><strong><span class="s8" style="background-color: rgba(255, 255, 255, 0); color: rgb(183, 53, 25);"></span></strong></span></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9ibicbibzf6mGH1TRXOlolziaS7icwflBP92Cfkl7hiaHwP6BK8Zw5FBzBCMoIM4zLMiaiamoxOo9rn10fGQ/0" data-ratio="1.233201581027668" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9ibicbibzf6mGH1TRXOlolziaS4fdJnw82z3oc4voibsNzfl6oFnmwRjE0gONFgdangnaggz7bIBKv76w/0" data-ratio="0.7509881422924901" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9ibicbibzf6mGH1TRXOlolziaSv2sLibxV5RQJkyl1xicu4lj3TA7Gexo6JEVgXqTmC9mUHQAV6qU5eobw/0" data-ratio="0.5592885375494071" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal; line-height: 2em;"><span style="background-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp;&nbsp;华融普惠资产管理有限公司（简称“华融财富”）是集财富管理、信用风险评估与管理、信用数据整合服务、小微借款咨询服务与交易促成等业务于一体的综合性现代服务业企业。近年来，凭借良好的服务信誉，华融财富获得了众多荣誉，像是今年不仅获得了<strong><span class="s8" style="background-color: rgba(255, 255, 255, 0); color: rgb(183, 53, 25);">2014中国互联网金融价值榜年度互联网金融“新锐”品牌大奖，11月20日还被宁波晚报评为“行业口碑奖”<strong><span class="s8" style="background-color: rgba(255, 255, 255, 0);">。</span></strong></span></strong></span></p><p style="clear: both; white-space: normal; line-height: 2em;"><span style="background-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp; &nbsp;作为集企业资产整合、产业链融资、财富创意规划、个人信用服务、公益金融服务为一体的高端金融咨询服务平台，华融财富根据客户的需求，精选了众多的金融产品，其中就有“财富宝”、“月月赢”、“季度丰”等颇具亮点的产品。</span></p><p style="clear: both; white-space: normal; line-height: 2em;"><span style="background-color: rgba(255, 255, 255, 0);">&nbsp; &nbsp; 未来，华融普惠还将不断壮大，竭诚为有金融服务需求的客户提供全方位的专业化服务。</span></p><p style="clear: both; white-space: normal; line-height: 2em;"><span style="background-color: rgba(255, 255, 255, 0);"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9ibicbibzf6mGH1TRXOlolziaSt0ZPrpqiaiabaCXmrmXgfXpVAs3Wto7LHxZb9H67hrxuwfl7ZEbjPDfQ/0" data-ratio="1.9426877470355732" data-w="" style="max-width: 100%; height: auto !important;"/></span></p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz9ibicbibzf6mGH1TRXOlolziaSeEGZiaawQ9Uhtog8hf2r0QgEVjFNhOxbaaounN5o7HI8oLRcVSiaVxTA/0" data-ratio="0.7727272727272727" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><span style="max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;">理财热线：</span><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;">4000 &nbsp;3366 &nbsp;93</span></strong></span></p><p style="clear: both; white-space: normal;"><span style="background-color: rgb(255, 255, 255); color: rgb(255, 255, 255); max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></strong></span><span style="background-color: rgb(255, 255, 255);"><span style="color: rgb(255, 255, 255); max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong></span><span style="color: rgb(255, 255, 255); max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;">&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;</span></strong></span></span><span style="background-color: rgb(23, 54, 93); color: rgb(255, 255, 255); max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; font-family: Calibri; word-wrap: break-word !important; box-sizing: border-box !important;">0574-27997788</span></strong></span></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><span style="max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong><span style="max-width: 100%; font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong></span></strong></span></p><p style="clear: both; white-space: normal;"><strong style="color: rgb(255, 255, 255); max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; background-color: rgb(255, 255, 0); font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;"><strong><span style="max-width: 100%; background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;">泰富地址：宁波市江东区惊驾路555号泰富广场A座1802-1804</span></strong></span></strong></p><p style="clear: both; white-space: normal;"><span style="max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong><span style="max-width: 100%; font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;"></span></strong></span></strong></span><br/></p><p style="clear: both; white-space: normal;"><span style="max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong><span style="max-width: 100%; font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;"><br/></span></strong></span></strong></span></p><p style="clear: both; white-space: normal;"><span style="max-width: 100%; color: rgb(255, 255, 255); background-color: rgb(23, 54, 93); word-wrap: break-word !important; box-sizing: border-box !important;"><strong style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><span style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;"><strong><span style="max-width: 100%; font-family: 宋体; word-wrap: break-word !important; box-sizing: border-box !important;"><br/></span></strong></span></strong></span></p><p><br/></p>', '华融财富江东分公司将于12月7日盛大开业 ！', '位于江东惊驾路555号泰富广场A座1802室的江东分公司，即将在12月7日开业了!!!', 1, 1, '2014-12-08 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 12, 0, 0, 0);
INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(8, 1, '', '', '2015-06-08 16:48:44', '<p style="clear: both; white-space: normal; line-height: 2em;">热烈祝贺华融财富江东泰富营业部开业大吉!!!<br/></p><p style="clear: both; white-space: normal; line-height: 2em;">首先在此感谢江东区各级领导、中行等金融机构行长领导、真武魂、玛利亚医院等合作机构老总及所有关心华融发展的客户朋友的莅临公司指导，有你们，我们会更强大！</p><p style="clear: both; white-space: normal; line-height: 2em;">下面是12月7日活动当天拍摄的花絮，让我们一起走进认识华融江东泰富营业部。</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzGb2tP4mNWw67x2vq0Y4uWiblJpmTgSB9LHic1BI6kqpNfKMK4eYz5MkQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/><br/></p><p style="clear: both; white-space: normal;">清早赶来的热情阿姨们！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzPQia0wlIB2yRbtPCeFoVnWnibxYGmmpbpcC2ggT2d9avGhXVTiahiafBcA/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">宽敞、明亮、高大上的办公场所</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzVRAPt7XKqZF5X2WVDHqIAn9FkU6EQQzHWgeoiamU1iaSxOMAoPRLIPJQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">宽敞、明亮、高大上的办公场所</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzpMgKLHSE6pRffujvx9CwDuKQ461VKmT6ROgEIHRu64kNIXuaJss6icA/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">等待揭开面纱的华融财富</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzcLamLgYYibYJUa4iaI0dOVCUJwsjibu5TbsNibkUup2iaBrPnfGt5Fpk3ibw/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">满满准备好的赠送礼物！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzo0N3QPDnQEp2EQOZ5nHOc8G6vc9uynjh4miaUiblx5wjUs5CBWibWialYQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">会议室里沟通交流的客户们！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz6yiabJpt3QnoYNZvSPBRvvTdYibPh0ticpljs0P9K0UV2Vmia39AttwmJQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">引导着到访客户参观公司场所。</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFznzFZc0eOIPINdHGVlBG8jkUicfuq4CGnblf6AGIjkiawHOZeBpYAx12A/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">忙！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFza4U3y3DBHysLGNMbvEyszTPeLHySu74qk873sV2ib0cqibwDVc1MJqsg/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">很忙！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzxAmLt5Cno6AURn4ATWODu1GxHHDsHrORaSzHkr7uhnBsY7GiaAz04Tg/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">签到的叔叔阿姨们!我们的礼仪忙的热火朝天！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzvqI9JibyNjlWEEkmw3U5Nu0eicRSljQL6VaNiabDxzXtUB9aibPOLibicsWw/0" data-ratio="0.6956521739130435" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">王总、陈总、张总在总的协调调度！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzt3GWStOzW6SELGyiaRYqg2yuIp6abE4qUnUJObIAUrRqAWIe3yicragQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">等待着嘉宾到齐，举行剪彩仪式。</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzE2P3vBIxiaRT5rODuXcNLPXrMDakWGWpWvMrRXks3KtQp8SaVcDHjjg/0" data-ratio="0.6482213438735178" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">吉时到，王总致开业词！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzj2dIWL31oAbDTH8nPrvyQUDcXBkGXJbicuSqwLB8g5wmbmibs3cVv7zw/0" data-ratio="0.6126482213438735" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">邀请谢总发言，满满的祝福，深厚的寄望送给了我们华融财富！非常感谢到场嘉宾们百忙之中的拨冗前来！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz2T9rd1qM2OgtJa40TFGypM37SGDDSNm9IHYAqTk75UWAK6ktQM7csg/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">最最期待人心的时刻，剪彩开始啦！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzAAfBIwrSoNhAbSAftYlumb4eYPicwWxkwVCXjjjQPPGgvzicoN5HDI4g/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">人潮攒动的大厅！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzyhLnh1gVkU1pxqSGF3hOV5U4KMTDdssukGRebODks2lAT3ulmlXKBQ/0" data-ratio="0.6758893280632411" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">华融财富江东营业部开业啦！庆祝！！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzFVH8FVXHjz1ozibrlicpWgQpYuspR8aetmwL9an1szuicAldMJ25rxT6A/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">开心记录下此刻幸福时间！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz2tmUBX2snalKqjtlw5NxdmSricC4F8Z2YpsAMsVSqXJgSiaMtTSSrsEg/0" data-ratio="0.7213438735177866" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">谢总也按耐不住，拿起自己的手机来拍拍华融财富！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzAD4W3qeqPju27ZGrojFz7L4QxmZMia9HVblOcBPLzXE8B2000LG9nEA/0" data-ratio="0.5632411067193676" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">各位领导的大合照！领导们个个气场十足！</p><p style="clear: both; white-space: normal;">至此，上半场的活动结束，让我们休息片刻，马上回来更精彩的下半场！</p><p style="clear: both; white-space: normal;">接下活动精彩预告：热舞开场、拍卖活动，砸金蛋活动……加上精美食物各种礼品，华融财富还是非常爽气的！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzBEnZIpm2Zr2sSSDuP1ALIUjETic4uyqBI3o4SLkUf3pfY4Q89HYhz5w/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">宴会大厅热闹非凡</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzn7IwEHRVYkdGpWTU2V9v7Gf8hcGWrn6dYexThn0diaxhnM4ibwFvmiaOQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">享受着美食看着热舞！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzjzsyELRNr7pAo30yxMwuKG6iaV8JOpdcNp33pMiaXnmYWfeibb3mRUJBA/0" data-ratio="1.0256916996047432" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">华融多才多艺的姑娘们上场了，一曲热舞点燃整个宴会气氛！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzp0lN5BVe4v7bE2ToM2ic6KaCwsLVyp5776jOVBkbWFgnS1xGP4DlYiaQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">自告奋勇上来露一手的阿姨，阿姨唱的非常赞，后面忍不住又清唱了一首才做罢的！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzm3fOiaEJAicx6rjv74nRo8Hkfk4EhcfGEUBA6ibMEgPWV6YiagRLV2NspA/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">华融财富江东泰富营业部的张文杰张总致词！领导，我们期待着在您的带领下，泰富营业部能红红火火，蒸蒸日上！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzI2ibhGiaF5m2nLwEsiatsp5qNMa0WL8ZNMlIGQicDYbmXVQ5FLXjnQiaRpQ/0" data-ratio="0.7114624505928854" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">张总抽取了此次活动的三等奖！把好运带个现场参加活动的朋友们！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzMfMIiaAPCwF47Wd6vVCiaLjv8dLliaoyCoUpbEIbWMZxpQ8a9tuiaObmMQ/0" data-ratio="0.6719367588932806" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">一首《God is a girl》，声情并茂！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFztp0OFuQq8FQMB4UhzAPLlDGbhEb3gNVpwspPP7vRIjkwPtia6MSSvSw/0" data-ratio="0.6857707509881423" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">马不停蹄，王总把几位幸运的二等奖获得者抽出来了!真应了王总那句话“本人男，爱好女”，看，抽中的都是女士！！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzOAysIDfWZrIgDkcxva7wSphBIjo5tUtIFF1TfGcJBz8J8caRRvUurA/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">美女主持，今天也是蛮认真负责的！活动主持的有声有色，辛苦了！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzOWVSQjVN6ChRSADsAKoVG5zEK0obqAIXP17bcOuyCTF4eUZ6zH9ib0g/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">第一轮拍卖开始了，华融的创新拍卖模式，实际上拍的是债权，只要你投资，自己的钱一分不会少，还免费得到精美花瓶，非常值得出手的！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzZCDnvkV8ictO1MT8oCJvXtfx6rkJhosBfHwKkTxicwNI5gKAvKzhg73g/0" data-ratio="0.5889328063241107" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">所有者额外赠送的墨宝！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzRPia1iaU4WH5O66MKdRrztibZs09DTG1zYpsMsdVOW7uEG2pxPylDdcrw/0" data-ratio="1.4367588932806323" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">经过激烈竞争角逐，最后拍的宝贝的先生和张总的合影！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzuQ2XicQKBIkbkHva8FBgo7EQqmsXIL3KkGErWLAkc72RqcXF2u0S18Q/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">下面，真武魂的老总亲情献唱！！没有准备唱的还是蛮有水准的！万分感谢！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz5A5RK2skCzseic2LeO3d1ibZuCnkwVgsKYCBCFr06Dq0oxWib8wez5iacw/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">喝一个！！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzQBPgS3wCzKx9TvGbn9r48UUvaI78sQ9ia1ibQLrLozhDicicCKRzmTQdfQ/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">第二次拍卖来到了！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz2ONNF82bk9j3m2PBXM3k2ic72WY0XlsmqW36Mqcs0M95wzQKicTUGqUA/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">叔叔按耐不住，接过金币认真查看！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzqqDq50KicIGCSvKuUicpPEPEt6VfRqa0h6Jnl4L7OrD8IjtjzsvKskew/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">拍卖中角逐的阿姨！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz6On7uNIEJvvqGRYLqIJOYohqZhZICx7yXbFwJblc9TdCEYuuHLsNkw/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">这位阿姨也几次加价，可惜最后花落她家！不过，还是十分感谢阿姨的热心参与的！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzCshDaykJlibYNuXzrL2LJIl7kHO71plas87GHBOVKTu0f6jNR5xkVIw/0" data-ratio="1.5434782608695652" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">第二次拍卖获胜的阿姨！恭喜恭喜啦！</p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;">下面现场购买理财的客户，均有机会砸金蛋哦！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzN2GzuvtFibJHUMgSJrwibVpttmm9mwVeiaC5iaHWX1dWC1N9edS4KHoG4A/0" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">金蛋排排摆好！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzicicYViav3V0OHn8OGxyOvcOwGjIrRIawiakicZkhbdBodqVKicjfhuLpAug/0" data-ratio="0.7608695652173914" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">热闹十足的现场签单处！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzpOGNXZQWG3Xicyk3uJDMX7VTVLmcOdSYbf2iaGAJJoYmw8srpPozknEg/0" data-ratio="1.4723320158102766" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">阿姨在探宝，砸开的金蛋寻找自己得到的什么。</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFz5z7p43vL8xs4CUb3b7iarIs2YX2w7WOwQKJNT7BgTIyrYTygEZrIzvQ/0" data-ratio="0.8241106719367589" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">砸砸砸！砸出惊喜来！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzR0icCgwRc0icnNvxpTtetAnLzibZ51EnBGoLYfNn5emb5ylIkIic3fbKYA/0" data-ratio="0.7608695652173914" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">满地的碎屑，证明很多朋友都如愿，开启了自己的幸运金蛋。各种礼品，100元三江卡，300元三江卡，足浴桶，羽绒被等等相继被砸出，恭喜各位获得奖品的客户们！！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFznLuNhuJbjru5RiaPA6z37KyoaTQuFv1xn7J6wesjT16rRSloFgia2VHg/0" data-ratio="0.6837944664031621" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">最后压轴的一等奖抽奖环节，很多客户酒足饭饱，没有等到最后的压轴时刻，所以奖项轮空很多次，我们曹总抽奖抽得好无奈，有奖，没人领！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzicCEv7qNSZIKoIG8rOTt5KOVtjMu7jWSUia0MboF0Yu4fMMkaDfXuQzA/0" data-ratio="0.7430830039525692" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">最后改变了抽奖规则，有在场的叔叔阿姨们写名字投入奖项，纸头抽取！</p><p style="clear: both; white-space: normal;"><img data-s="300,640" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8jK88bTiaEYDBl1nuu24iaFzXfpnN3mazkibR7pmIb0xjRj5zSzXZoM9EiafesWh89k85kaEZUnrnUhg/0" data-ratio="1.5197628458498025" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">最后一等奖的获得者产生！美女得主！！恭喜恭喜！！</p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;">活动到此结束，感谢所有参与活动的嘉宾、工作人员、客户们！没有到场的人也不要遗憾，本次活动暂时告一段落，华融财富江东分公司的旅程才刚刚开始。 华融财富恒泰营业部也将盛大开业，我们可以到时见！</p><p style="clear: both; white-space: normal;"><br/></p><p style="white-space: normal;"><br/></p>', '华融财富江东泰富营业部开业典礼', '热烈祝贺华融财富江东泰富营业部开业大吉!!!首先在此感谢所有到场关心华融发展的客户朋友的莅临公司指导！！', 1, 1, '2014-12-08 14:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 11, 0, 0, 0),
(9, 1, '', '', '2015-06-08 16:52:49', '<h2 style="white-space: normal; margin: 8px 0px 0px; padding: 0px; height: 32px; text-align: justify; line-height: 18px; font-family: 微软雅黑; font-size: 16px; font-weight: normal;"><span style="padding: 0px 2px 3px; line-height: 28px; float: left; display: block;"><span class="i_num" style="padding: 4px 10px; border-top-left-radius: 80%; border-top-right-radius: 100%; border-bottom-right-radius: 90%; border-bottom-left-radius: 20%; color: rgb(255, 255, 255); margin-right: 8px; background-color: rgb(255, 118, 0);">这也许不是宁波最盛大的！！</span></span></h2><p style="clear: both; white-space: normal;"><strong>却是我们为您送上“最”盛大的开业盛典!</strong></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz86m1o37wlu2ia6roCNDP22ncXFlrWYS6xEEqT6pr3AawAyWqkAVzkSOibx7cqgdaJibZE8AhuSDrtqg/0" data-ratio="1.3346534653465347" data-w="" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><strong>一最：最开心热闹的剪彩！12月28日，华融财富恒泰大厦营业部在行内外关注下顺利开业！</strong></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz86m1o37wlu2ia6roCNDP22ntJ9ia2g04rKGJPnuh6tJib15aZ9EZqhKQT46xYcNHLtdyU7rlSvlJAibg/0" data-ratio="0.7504950495049505" data-w="" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><strong>二最：“盛典砸金蛋”最得客户喜爱，重掷一拳，是对我们华融财富深深的信任！</strong></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz86m1o37wlu2ia6roCNDP22nlNJicnkOMPRDqKJtPKZzKR6up6IeTpApJa41QQqFTcEj9ic40ZoOjJxw/0" data-ratio="1.3346534653465347" data-w="" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz86m1o37wlu2ia6roCNDP22n6xtVTVRQo8yceKttFbsgVugNqS2VvgID9xgx45YKjVtD1xaMA9Itgw/0" data-ratio="1.3346534653465347" data-w="" data-s="300,640" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><strong>三最：最能干的华融精英们跳着小苹果！</strong></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz86m1o37wlu2ia6roCNDP22nHTwy5Z3A8AG7DbLh3iciaiaicWCUI3dgX1Sbgia1Qpnb9wp9icd488q35JGw/0" data-ratio="0.7504950495049505" data-w="" data-s="300,640" style="max-width: 100%; height: auto !important;"/><strong>四最：最最最诚意的宴请！宴请一直支持我们的新老客户！</strong></p><p style="clear: both; white-space: normal;"><strong><br/></strong></p><p><br/></p><p><span style="font-size: 18px; background-color: rgb(255, 0, 0);"><strong><span style="font-family: Calibri;"><br/></span></strong></span></p><p><br/></p>', '华融财富恒泰营业部开业典礼', '华融财富恒泰营业部开业典礼', 1, 1, '2014-12-28 14:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 21, 0, 0, 0),
(10, 1, '', '', '2015-06-08 16:54:21', '<p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">1月9日，和煦如初。华融财富宁波一营业部团建活动定点东钱湖绿野谷度假村。</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">娱乐,挑战,激励,凝聚力是这次的首要目的。</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">看看我们的精彩瞬间吧！</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7O6y2FNePEm2wLLpBVy1trhOZzMWxTYyFzbPnrg0Iiayy6DAG23QQe6w/0" data-type="jpeg" data-s="300,640" data-ratio="0.37154989384288744" data-w="471" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7ibULZC73qvbLGiadG7up7mDib76qyg6OvibGiaVO2IqibE6tg46YB3N46Bfg/0" data-type="jpeg" data-s="300,640" data-ratio="1.772823779193206" data-w="471" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">看惯了平时的西装革履，现在穿上“战服”的精英们是不是别有一番“疯味”呢？</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7icK7W5brsLJvhdIwibhp7oqd5Ef48RQFazUxMRNtAVjckTxNqSNld8wA/0" data-type="jpeg" data-s="300,640" data-ratio="1.335456475583864" data-w="471" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">华融的美女精英们，小编问一句：你们。。你们。。还单身不？</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7XbnPoIJuQK58Zq331kQibWl2HsxJ7BPY1WUbn72xyfiaYtH7q8h7adAg/0" data-type="jpeg" data-s="300,640" data-ratio="0.7515923566878981" data-w="471" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">放下这把枪，让我来！！！！</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7bVicABptha3iaeJxHib2MDDpd47ibKhGNHib5huAo16eKyXqHBtHat8PHag/0" data-type="jpeg" data-s="300,640" data-ratio="0.7515923566878981" data-w="471" style="max-width: 100%; height: auto !important;"/>这样的“烧烤趴”，不仅拉近革命情谊，还让平时严肃的我们都小露一手哦。</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8L1I26kZQBwKSzKNpDlpu7NmT1mngN341DJBWgictj5ZpyJdUnMBNxhSTIibIqRYwdiciaAoFdCrW3tw/0" data-type="jpeg" data-s="300,640" data-ratio="1.3333333333333332" data-w="471" style="max-width: 100%; height: auto !important;"/>怎么样？看起来还不错吧。。。</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">----------------------------------------------------------------</p><p style="clear: both; line-height: 22.390625px; text-align: center; white-space: normal;">欲登峰顶辛满道，踏尽砍途墨留痕。一次的团建不仅是一整年的好开端，还是大家彼此磨合培养默契的机会，愿你们越来越好！感谢提供照片的华融财富兄弟们！</p><p><br/></p>', '欲登顶峰辛满道·华融财富宁波一银亿营业部团建小记', '华融财富宁波一银亿营业部团建小记', 1, 1, '2015-01-10 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 12, 0, 0, 0),
(11, 1, '', '', '2015-06-08 17:04:18', '<p style="clear: both; white-space: normal;"><strong>华融财富特别报道</strong>，1月17日，镇海年终答谢会在镇海石浦酒店举行，华融财富进驻镇海这个浙江门户之门的时间并不长，但华融财富“声浪汹涌”，深得民心，参加答谢会的镇海新老客户人气鼎沸。再次感谢支持我们的客户们，天涯何处觅佳音，能为你们财富保驾护航也是我们华融的荣幸！</p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;">看，财富知识从小熏陶！---用知识拥有财富，让财富拥有人生！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0niauNNw3MicCUdgibOOzE1f4vDwNVWQpFKHKDocjMvU7jLtRWcS2lBas1A/0" data-w="464" data-ratio="1.5" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">贺，华融财富成绩超然！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0nxnZZjQYXgpGWUE3DBwrn6vvUzE2kdKYqic4kdnrrRvSCIbI6R8xX0ww/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;">喜，客户大奖惊喜连连。</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0ntEZzbobZaKUSBBThLTE6fO1Q6MaibT9tqMoFTS9micxTQLib3KicdjuibPQ/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0niazvTk5YUCBtscV4Yaib6Ne2YDiccptcYZiaQaPeu0fTIXqbV2zv69UHaA/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0nOiaFZrd7iaiak2icsc5kcgNSSc6AeZ7oicuWk4Yanp2ibOHZ4UWZ5kZtaVLA/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0nwLpMic0qTqVJ7ayyEGbAA2GmftBY2vGiaQ7bBFWib6DriarqRN8eJe3a4A/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">叹--我们的客户才情绝佳</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0nRcPaQepTx7iaSP2w7yXXY3pUdjr3Mg4JB4zoVJDo28Uo6g6jbHSpkcg/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0n0Rld5Fqb4Yb2r3ElnwWslibE7SAoIf7ATzoPmu6iagnWWNCsxuzVh3VA/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">谢，感谢全心赴力的华融精英们和客户群体。</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdziby9Fzsh8rFo3hRD97GAQ0njicXa3qcdPHSxMHuz8wmwprZFSTUoH85ic6EC9c1xiaFfDfVicYtBwBjzw/0" data-w="464" data-ratio="0.665948275862069" data-s="300,640" data-type="jpeg" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><br/></p><p><br/></p>', '财富门户之门·天涯何处觅佳音--华融财富镇海答谢会', '融财富镇海答谢会华融财富特别报道，1月17日，镇海年终答谢会在镇海石浦酒店', 1, 1, '2015-01-19 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"5577c5160b160.jpg"}', 14, 0, 0, 0),
(12, 1, '', '', '2015-06-08 17:07:26', '<p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">人生是一列单向急驶的火车，我们匆匆行进目的地，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">其实是在像世界招手，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">火车很长，挤下我们所有的乘客。</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="color: rgb(255, 192, 0);"><strong><span style="font-family: 宋体;">成长</span></strong></span><span style="font-family: 宋体;">，是不断地变换风景，不断地变换车厢，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="color: rgb(255, 192, 0);"><strong><span style="font-family: 宋体;">力量</span></strong></span><span style="font-family: 宋体;">，是跻身看完所有风景，并向世界完整地解说。</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">而<span style="color: rgb(255, 192, 0);"><strong>成长的力量</strong></span>，便是对自己负责完后开始对所有人负责。</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;"><br/></span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">华融的一年，充满力量的一年，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">行业口碑奖，新锐品牌奖。</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">我们成长，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">我们追逐，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">我们蜕变，</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;">我们分享。</span></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;"></span></p><p style="clear: both; white-space: normal;">2015年1月24日华融财富2014年度年终客户答谢会在香格里拉大酒店举行。晚会主题<strong>成长的力量！</strong><br/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxXdYdTX8CTNVpXsoa4GSTyZ0IMc5gJFdUZUDX1VRxCGcekGbN6s85qA/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFx3uxAp675aXvVs5jXNtpDds4p64UzJicMsh7Zltia295p0Ez9dsnZHibIA/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFx5XL9Aiaibje8gCrg3mOHsEp245e8GmmibDicib8D8zglZSmg7fFkP2f8tHw/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">一切准备就绪，坐等客户到来！期待与你们共聚一堂！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxuF1TmJKMkOU5ib2JdWkhbGHXtL2KzKXn3Cf98MuBcY1GyqibjJyItDTA/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxmoGJ6uEGKysUh2FQ7OlLIDy8WFLrJXGkpv4LxOGZHGYWvtQrzqUzXQ/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxyrYlvjxm6osr6nyHQgeTg7RC4oUdibm0pM7Iu4vaZliasuPHds0CfhUg/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxcBRamRu1nv1anq8tEspwbnlK91HXViciaUe0828p3V6enLoFFWo68AVA/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxiaYpp8GxaUQJl6iarb21XEeCvjUXRhYiajzo5wcqs1JuNPYUatMLcaEag/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">客户及贵宾陆续进场，现场气氛一片祥和。。。</p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxvib8kPUYjs6Mt2vcu9b7w803BZG8rw6Us4r6TQXnf8M9At48Ulc6h4w/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxVLt5Mkdyo8Ntk7ZZpBxnD61GHbwURdIealtEiaaMianbHVQpZ8s5Obhw/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/>感谢泰富营业部一场开场舞nobody！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxlbTs80fM1LrWH4hAt80tx4MibEY6ibCl0cXzhSeNjw65BLPrG839xAOg/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxrTtPem7icuPAgicKsicspH7NFTveERJx4QTA7UXFoYUjB39ppicFtd2J1w/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">曹总致辞祝酒，祝你们越来越好！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxUuBVXxPjgEmwHOf5uq8MAlJAEFzQYa96wqdibcsicp3YLXJqG7dUbNKw/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxDATVDfibNeL9BOB93n53LKAeCjvuojCepPciaiciaOvWz8G9wyhlFoSFAw/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">觥筹交错间，畅谈华融未来发展！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxNtiaicS2QiaxgbKneqaMmE7xb4EnxE9RdAGzd5Dyth4RibrUu4Edl2deLw/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxKRQDgnMSLMzqKN3PgEbMKk3Uebq6YCKHKQ7MQUDOVCIOx3t97Lpy6w/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxwXw9lxSxy4X0A6Leibehap4DE7uv0JuT08epuHibC8DvSYfZlwaTgPSw/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxt2X90AHo1jGiaiaYSTjuVvGm8TbMuAias6GDZtejFnRrMvPXStO8GjrCQ/0" data-s="300,640" data-type="jpeg" data-ratio="0.66600790513834" data-w="" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxmMRXJuOG0dcLia0QCjnAJhee8gNVTx6fd92EUjKo0PeiaDXu55Thb6wQ/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxibmdsvQfb0T5ODGu6aHDUD5HLJJibrbfwsqO2LOia4FqZw3OkIX3S3AxA/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxbanAo9Du8VAhhwJKpEIX3LSegaClJacb50rKCuhqwJoGTj9KDIxL5A/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxLtYtbKZpT6qjlWN2fiaIfXpdqXr8u2XHib79bbmB9w3VRNZoNvAiasNMg/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">歌舞琴弦齐汇演，庆华融来年大喜！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFx8QrUFFlJPU2AjicasrQlfAQTeuTKKeT3lAs738G2amfdPwiaH2cl3XuQ/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxyJmrxT2L35dkmYkhFVfd2rEIYeXcdenJqTBPHTDTyqmcmj6icmic81rw/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/>感恩的心，感恩有你，华融未来与你同行！再次感谢到场来宾对华融的支持。</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxWKY7kbk19mYMiaRc4viba8niaw60cT7Fibe7yRdIcbP3MibVGxt5n7Joo3w/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxNncViba22Ux5EiajYicL3ibiaLibEbRZGvpyzVojb5fIuHWoeEMuApAnqTHA/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxlO2tiaicS8Zu2kXEbJLOXDSmYLyRibHMiaLcqESOUIpNb6WLSRyXOPAH1Q/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxsds7Jg6Dok0e2GyZ6icLyibFRs0nTaVMf5OhGBmPR0H9hB7AcqzPBlQQ/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxDcoaHelPtn2o4KFZZB8HGJLzufIMsPWS7XhWkfRchFlytygpG9CfKg/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/><br/></p><p style="clear: both; white-space: normal;">试问领导何时帅？ 答：抽奖时间何等帅！o(∩_∩)o</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxSeoJ91CHx3YgpW6kDvrHL5KXUtNa9z9WIZibmicGS47zsiam8Oia3GbaFQ/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxyibX1cSzbIhjhwSz3E0Rib0KqtH7lftaN0U5ibuz9Sq2MDMR0Ae0k9dbA/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">恭喜得奖的客户们，我们来年再约！</p><p style="clear: both; white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8BGh289nv0hMtecGT67GFxRTaQm489cewuQicxK2icyeWHvpQiaH8PXlS1em0XYVEg6KMY0T27QgQGg/0" data-s="300,640" data-type="jpeg" data-ratio="1.1111111111111112" data-w="18" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><span style="font-family: 宋体; font-size: 14pt;">不管市场如何风云变幻，我坚信，你我都是华融辉煌见证者</span>！</p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; line-height: 24px; white-space: normal;"><span style="font-family: 宋体;"><br/></span><br/></p><p><br/></p>', '成长的力量！---记华融财富2014年度年终答谢会', '华融财富2014年度年终答谢会于2015年1月24日举行', 1, 1, '2015-01-26 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":"5577c4d07c520.jpg"}', 23, 0, 0, 0);
INSERT INTO `sp_posts` (`id`, `post_author`, `post_keywords`, `post_source`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended`) VALUES
(13, 1, '', '', '2015-06-08 17:12:46', '<p style="clear: both; font-family: 宋体; line-height: 24px; orphans: 2; white-space: normal; widows: 2; text-indent: 240px;"><strong><strong style="font-family: 宋体; line-height: 24px; orphans: 2; text-indent: 240px; white-space: normal; widows: 2; background-color: rgb(239, 239, 239);"><span style="font-size: 24px;">成长</span></strong>潘潇霄</strong></p><p style="clear: both; font-family: 宋体; line-height: 24px; orphans: 2; white-space: normal; widows: 2; text-indent: 32px;">理财顾问，这一高大上的名词对于两年前的我来说还只是个遥远的名词。<span style="font-family: &#39;Times New Roman&#39;;">2013</span>年那个细雨朦朦的清明时节，即将从财经大学毕业的我淹没在茫茫就业大军中，对未来充满期待，同时也满心迷惘。周围同学多数都去了银行，或者考了家乡的公务员。因为有金融梦，我选择了“理财顾问”这一职业。我这样一个不擅长与人交流，甚至可以说不喜欢主动与人交流的人，怎么可能做好这样一个需要沟通的工作呢？后续的工作展开确实因为我的性格问题遇到了诸多障碍。每每遇到问题，我唯有向同事领导讨教经验，帮助自己理清自己需要改进和学习的地方。这种时候也是我感受公司温暖的时候，一个公司的领导不是站在高位上发号施令，而是站在员工身边给予员工帮助，在这样的公司我有什么理由不好好努力呢？在前辈的帮助和自己的摸索下，我也寻找到了适合自己的工作方式：电销。每天面对的只有一台电话机和一沓密密麻麻的电话号码。。对于我来说，每个号码的另一头都是迷，沟通就是解密的过程，当然这个问题需要耐心，需要工作的激情，更需要强大的心理抗压能力。愿意给我沟通机会的客户对我来说都是弥足珍贵的朋友。在经历了起初的摇摆不定之后，我有了我人生中的第一个客户，客户叔叔签完合同之后对我说了一句：“小潘，你很适合做这个呀，有耐心又专业。”这句话一直鼓励我在这个行业不断努力，不断进步。去年的圣诞恰好初雪，我坐着公交去市郊见一个开纸箱厂的客户。飘雪天、黄泥地、工程车、矮棚屋，客户一杯热茶，一份信任，应该是圣诞最好的礼物了吧。与每个客户都有一个故事，跑遍城市的每个角落，熟悉每条路线的公交，这也是工作的一部分。因为是理财顾问，所以需要专业，懂得如何帮客户做资产配置；因为是理财顾问，所以需要热情，积极与客户进行沟通交流。就在华融这艘航母上，我们理财顾问才能更好的服务于大众。</p><p><br/></p>', '华融财富优秀文章分享《成长》--潘潇霄', '因为是理财顾问，所以需要热情，积极与客户进行沟通交流。就在华融这艘航母上，我们理财顾问才能更好的服务于大众。', 1, 1, '2015-06-08 17:07:27', NULL, 0, NULL, '', 0, '{"thumb":""}', 17, 0, 0, 0),
(14, 1, '', '', '2015-06-08 17:17:39', '<p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);">如何能确保投资资金的安全?如何才能在较低的风险下获得较高的收益率? 5月26日，华融财富特邀著名央视财经评论员，上海资深媒体人李光一先生做客甬城三江畔，与华融财富嘉宾分享他的“理财金”</span></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"></span></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrAzdJ3PrK7MmicgkGzxtXefEys4POjpDuebtedCZajrQU984znPv6CdA/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrqMActXHet3gR6OepvxoyB6naK58NbZ5oPntvksbh8aodbdm1yBxRoQ/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrfulM3FWh2H3hBYicibK5LL0JibMwGJdDibYFFVJCJavViaiahrutlxNt2g7g/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrJSjnDrAoEvsCGA4xIyzV8abRnHX3tCHOVZX8SVJ47ISkwhjIGWvia7A/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrK28BCKqVjSfaLZemzp4eG0acbed1vkaicjuXWs3DKcIrRmmibrA3cV4g/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrtOtQhicm1nib9X4KRd0kOfHGltUNMYqt5Xt1gFFIkNE2WZcTuR0dA2GQ/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrV7Zd1O3FURYVRI2zk6JWbRAVg0SATolnRPhFYriaKSZN5QXVfYkcPFg/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrXDjadfqGibqI5GpK91AE7rbXtsg6mrcC8nOVWaWcpibpqKjwsokgjMnQ/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrKLtvlzScP5QTy6MLLGFv1vhZtfD6R9KvL3mG6GCOctFqeIzPvVrreg/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><br/></p><p style="clear: both; white-space: normal;"><span style="font-family: 微软雅黑;">李光一 以“中国进入创富新时代”为起始点，运用丰富多彩的投资案例与通俗易懂的理财方法与嘉宾介绍理财致富的方法与诀窍。</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 微软雅黑;"></span></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhr6nHFRrNrKX467HS9icegKg66sQdcayevEq6ibKo4pECfMowtNiaiaNTWDw/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrJnLuibU1QnMDT8MKniadPaBGpH74iaxpTP1BBlj5nw9oLbnCghiblKcFcA/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrkvCBwqdPgqRCls4QcDf3exXibv2ibsia14YxDdODqGm94EsJibF5PLRWvw/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrjjiauIIfibyp8bicmozR4u2TMKLbY1hWw8bFA5PGKicbUm5RGLH4CSlQEw/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrTuwdRJ0P3adqfr6eLt2wJVcTT53xDr4xpS2CiaQ9s4MqFcLFQZsVwEA/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><span style="font-family: 微软雅黑;">座谈期间。他和华融讲师向大家隆重介绍了新三板专项基金，对于其他理财热点来说，华融新三板专项基金门槛高、收益高适合有一定财富积累的投资者。李老师风趣幽默的语言和独到的见解得到在席嘉宾的一致好评。</span></p><p style="clear: both; white-space: normal;"><span style="font-family: 微软雅黑;"></span></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhrDSl2Kr5sBXwDs0hUPwYefm35iaIVeRN17l1Owb9fAhATJANLMny62DA/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhr6suLPhgib8nECrTXZriaP8ic8hkWDJ5OAIOXaqagwKVvBVsBjIKVX5Fbw/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;"><img data-s="300,640" data-type="jpeg" src="https://mmbiz.qlogo.cn/mmbiz/9OXXxNwsdz8Jg7zST3fCSvvLgGX6xJhricibqYOV9CWAJTGc8Cm7EkyyLYSQEyZs4AyBEI8bMk6pUM3wISQTohew/0?wx_fmt=jpeg" data-ratio="0.666" data-w="500" style="max-width: 100%; height: auto !important;"/></p><p style="clear: both; white-space: normal;">强强会晤，李老师和华融高层们及媒体记者们探讨华融的新三板专项投资基金！</p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span><br/></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span></p><p><span style="color: rgb(255, 255, 255); font-family: 微软雅黑; orphans: 2; text-align: justify; widows: 2; background-color: rgb(0, 187, 236);"><br/></span></p>', '《对话，李光一》完美落幕！', '如何能确保投资资金的安全?如何才能在较低的风险下获得较高的收益率? 5月26日，华融财富特邀著名央视财经评论', 1, 1, '2015-05-27 00:00:00', NULL, 0, NULL, '', 0, '{"thumb":""}', 34, 0, 0, 0),
(15, 1, '', '', '2015-06-09 11:10:48', '<p style="text-indent: 0px; margin-left: 0px; background-color: rgb(255, 255, 255);"><span style="letter-spacing: 0px; font-family: 微软雅黑; font-size: 16px;"></span></p><p style="background: rgb(255, 255, 255); text-align: justify; text-indent: 0px; margin-left: 0px; -ms-text-justify: inter-ideograph;"><span style="background: rgb(255, 255, 255); color: rgb(0, 0, 0); letter-spacing: 0px; font-family: 微软雅黑; font-size: 16px; font-style: normal; font-weight: normal;">华融财富创建于2010年，总部位于上海，整体注册资金超过5亿元人民币，是一家集财富管理、信用风险评估与管理、信用数据整合服务、小微借款咨询服务与交易促成、基金投资咨询服务、财务顾问、上市辅导等业务于一体的综合性现代金融服务业企业。公司致力于在产业链金融、车辆抵押贷款、P2P网贷、创业投资、资产管理&nbsp;、企业咨询等业务板块提供创新式服务。华融财富目前在上海、南京、杭州、宁波、苏州、无锡、常州、绍兴、嘉兴、湖州、台州等长三角地区建立强大的协同服务网络，为广大优质客户提供全方位、个性化的普惠金融和财富管理服务。</span></p><p style="text-indent: 0px; margin-left: 0px; background-color: rgb(255, 255, 255);"><span style="letter-spacing: 0px; font-family: 微软雅黑; font-size: 16px;"></span></p><p><br/></p>', '华融简介', '华融财富创建于2010年，总部位于上海，整体注册资金超过5亿元人民币。', 1, 1, '2015-06-09 11:09:40', NULL, 0, NULL, '', 0, '{"thumb":""}', 57, 0, 0, 0),
(16, 1, '', '诚信、进取、普惠、专业', '2015-06-09 11:14:21', '<p style="margin-top: 0px; margin-bottom: 10px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;">企业理念：诚信、进取、普惠、专业</span></p><p style="margin-top: 0px; margin-bottom: 10px; color: rgb(85, 85, 85); font-family: &#39;Microsoft YaHei&#39;, Lato, &#39;Helvetica Neue&#39;, Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;">企业slogan：您的幸福合伙人</span></p><p><br/></p>', '企业文化', '诚信、进取、普惠、专业', 1, 1, '2015-06-09 11:10:49', NULL, 0, NULL, '', 0, '{"thumb":""}', 43, 0, 0, 0),
(17, 1, '', '', '2015-06-09 11:20:04', '<p><span style="font-size: medium;">2014年华融财富获得第三方金融机构<strong>行业口碑奖</strong>！</span></p><p><span style="font-size: medium;">2014年华融财富获得中国互联网金融价值榜</span><strong><span style="font-size: medium;">年度金融新锐品牌大奖！</span></strong></p><p><br/></p>', '荣誉', '2014年华融财富获得第三方金融机构行业口碑奖！\r\n2014年华融财富获得中国互联网金融价值榜年度金融新锐品牌大奖！', 1, 1, '2015-06-09 11:14:22', NULL, 0, NULL, '', 0, '{"thumb":""}', 23, 0, 0, 0),
(18, 1, '新三板', '搜狐财经', '2015-06-09 11:21:24', '<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第一，新三板是国策的抓手、利器和落脚点。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">新三板的巨大的财富效应使得新三板能够吸引创业者去创业，创业投资去投资，使得“大众创业、万众创新”这一国策得以落地。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第二，新三板是中国改革开放的彻底检验，将释放改革开放三十年的成果，将成为数千万家中小微企业的出海口。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">资本市场20多年的发展，截至2015年4月，沪深两市的上市公司数量才2600余家，但是包括个体户在内工商总局统计的我国市场主体有7000余万家（个），这一比例严重不匹配。过去20多年资本市场没有完全发挥出对经济增长应有的促进作用，而新三板会因为大量的企业去那里融资，成为真正释放我国三十年改革开放成果的一个基地。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第三，新三板将还原资本市场不确定性的、多元化的本来面目，将有力推动技术创新、模式创新，将催生伟大的创新型企业。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">资本市场的本性是一个有条件的带有赌性的市场，以前我国市场的审核，无论是主板、中小板还是创业板都是严格的审核制，没有真正起到资本市场对企业不确定性的支持作用。在新三板上市的企业中，信息传输、软件和信息技术服务业，文化、体育和娱乐业，科学研究和技术服务业，教育等新兴行业的数量家数和占比分别是662家，27%，远高于沪深两市的222家，8%的比例。沪深两市在制造业、房地产等行业领域的比重更高。新三板企业除了传统企业占比明显很低以外，公司平均成立时间不到5年，新三板要求企业上市只需要2个完整会计年度，这就是对创新创业的一种支持。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第四，新三板将成为经济增长的助推器。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">过去10几年，我国的股权融资比重一直停滞不前，甚至相比2007年还有大幅下降的趋势，2014年比例仅仅2.7%。新三板的财富效应的带动，可以让资金挤入和主动流入到股权市场中，成为经济增长的助推器。其实，不管是流入主板、中小板、创业板还是新三板，提高直接融资比重尤其是股权融资比重达到一定比例，对中国经济增长的发展尤为重要。其认为目前国内股市的超预期上涨与这一逻辑也有很大关系。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第五，新三板将成为真正的创业板。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">目前国内主板、中小板、创业板无本质区别，甚至创业板的审核严格程度超过了中小板，某种意义上来说，前三者属于一板，新三板是二板。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第六，新三板将成为世界最大的证券交易所。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">未来新三板可以按照每年1万家的速度发展，我们国家企业数量完全可以支撑这个数量。这与纳斯达克和纽交所的发展历史极为相似，纳斯达克成立于1971年，远晚于1792年的纽交所，最初差距甚大，但2011年纳斯达克与ICE差点共同收购纽交所，后因政府否决而未成行。2013年，成立200多年的纽交所，竟被一家位于亚特兰大的成立仅仅10余年的洲际交易所ICE收购。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第七，新三板将是链接创业者、创业投资和资本市场的桥梁。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">在国内资本市场，一个创业项目原来与资本市场尤其是二级市场离的很远，但新三板的出现，因为大幅缩短了上市时间、大幅提高了上市的可能性，使得创业项目、创业投资与资本市场直接连通，这个桥梁非常重要。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第八，新三板将去中介化、公开、透明的互联网思维植入整个投资领域，将成为全球最大的P2P平台。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">虽然很多人和企业在讲互联网思维，但是目前为止，投资领域一直罕有互联网思维，新三板是真正将互联网思维植入到了投资领域。资金需求方和资金供给方彻底结合就是P2P，去中介化、公开化和透明化，这会为市场带来很大的变化。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第九，新三板将是一场革命，既是革资本市场的命，更是革股权投资界，尤其是PE界的命，将重塑一级市场投资格局。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">以前企业从天使投资，到A轮、B轮、C轮…然后上市，过程很长，一些外资基金对新三板不是很感兴趣，但新三板的出现会将PE投资截流，会使得一级市场投资往前端发展。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="margin: 0px; padding: 0px; max-width: 100%; color: rgb(0, 176, 240); box-sizing: border-box !important; word-wrap: break-word !important;">第十，中国资本市场过去20多年的发展只是一个序幕，新三板的大幅发展才会真正拉开资本市场整个大幕。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; line-height: 25px; background-color: rgb(255, 255, 255); box-sizing: border-box !important; word-wrap: break-word !important;"><br style="margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; clear: both; min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: &#39;Helvetica Neue&#39;, Helvetica, &#39;Hiragino Sans GB&#39;, &#39;Microsoft YaHei&#39;, Arial, sans-serif; background-color: rgb(255, 255, 255); line-height: 1.75em; box-sizing: border-box !important; word-wrap: break-word !important;">创业板在1999年政府就想推出，后来在2009年推出以后到现在仅仅450余家，与创业板设立的初衷相差甚远。</p><p><br/></p>', '新三板对于中国而言具有十大战略意义', '新三板是国策的抓手、利器和落脚点。', 1, 1, '2015-06-09 11:20:05', NULL, 0, NULL, '', 0, '{"thumb":""}', 15, 0, 0, 0),
(19, 1, '', '', '2015-06-09 11:23:51', '<p><strong>电话服务</strong></p><p>客户可通过电话直接联系公司的客户服务人员，专人负责，专线恭候。</p><p><strong>电子邮件服务</strong></p><p>客户的电子邮件信箱可按时收到公司的研究报告以及运作报告等资料。</p><p><strong>客户网站服务</strong></p><p>客户登陆会员内部网站，可以查询信托产品情况、浏览组合行业配比以及新近策略报告等等。</p><p><strong>季度报告会</strong></p><p>公司每季度召开报告会，报告信托计划的运作情况，回答客户关心的问题。</p><p><br/></p>', '客户服务', '电话服务 电子邮件服务客户网站服务季度报告会', 1, 1, '2015-06-09 11:21:25', NULL, 0, NULL, '', 0, '{"thumb":""}', 29, 0, 0, 0),
(20, 1, '联系方式', '', '2015-06-09 16:14:39', '<p>全国服务热线：4000-3366-93<br/>宁波银亿营业部地址：宁波市海曙区药行街42号银亿环球中心24楼 &nbsp; &nbsp;0574-27998383<br/>宁波泰富营业部地址：宁波市江东区惊驾路555号泰富广场A座1802-1804 &nbsp; &nbsp;0574-87867399</p><p>宁波恒泰营业部地址：宁波市海曙区车轿街69号恒泰大厦16楼 &nbsp; &nbsp; &nbsp;0574-87869231</p><p><br/></p>', '联系方式', '联系方式', 1, 1, '2015-06-09 16:13:05', NULL, 0, NULL, '', 0, '{"thumb":""}', 57, 0, 0, 0),
(21, 1, '销售文章', '', '2015-07-02 16:44:15', '<p><strong><span style="font-family: 宋体;">我叫陈凤，是湖州营业部的业务员！来自江苏省太仓市。刚刚离开我心爱的宝贝来到湖州这个美丽又陌生的城市工作。一次偶然的机会在街头看到的华融财富的招聘信息，得以有机会进入这个温馨激情的大家庭。因为从未有过金融行业的从业经验，甚至没有基础的理论知识。说实话心里有些忐忑，但是我还是很激动，没想到有机会进入这个高大上的行业，开始了常常听人说起的金领征程。6.23号开始学习基础知识，行业和公司介绍，产品跟风控介绍。每一样对我来说都是那么新颖，从未听说过。我每个字都仔仔细细地看过，生怕漏一个字而无法理解全面。我暗暗告诉自己，不会没关系，那就好好学，总会看到希望的。</span></strong></p><p><span style="color: rgb(0, 0, 0); font-size: 14px;"><br/></span></p><p><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;">&nbsp; &nbsp; 25号培训完成，开始展业实战了。我开始在公司门口发单页，来来往往的人不是很多，但是每一个我都会去递单页给他看，虽然有些人拒绝接受，也有些人不会去看。但是只要我每个都去发，不错过任何一次机会就好。发了一天单页，也小有收获，积累了六，七个客户名单，可以开始邀约拜访了。正好赶上第二天周五的客户茶话会，我邀约来了两个客户参加，结束之后还有客户跟我聊了一会儿。虽然并没有签单，但是我觉得能邀约来客户，有客户愿意跟我聊，愿意听我讲，已经是很大的进步了。有些小小的安慰，也让我看到了更大的希望。</span></p><p><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;"><br/></span></p><p style="text-indent: 37px;"><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;">没想到，好运来得这么快。周六是我第一次在公司值班，那天天气非常阴沉，街上只有三三两两的几个人，我守在门口，几乎是数着经过的人和我发出去的单页。下午的时候过来一个大叔，在门口看我们的宣传海报，我见状便过去跟他攀谈起来。他看我们的海报上的内容，却笑眯眯地回绝我的讲解，因为他听说过很多财富公司卷款潜逃的事情，以至于对我们这样的金融企业非常不信任。在我再三邀请下，他才愿意进来坐下了解了解，这一坐便开始了我们的话题，在讲解了三遍我们的风控之后他才缓缓地说了句“确实跟他们那些不一样”。总算是峰回路转，于是我们又接下去聊了很多，告诉他如何去分辨是否是正规的金融类企业，怎么样才是正规的流程，资金怎样运转才是安全的等等，也聊了很多家长里短的事，子女工作生活等琐事。大叔慢慢地开始相信我了，愿意跟我说，愿意听我说了。聊了大半个多小时之后，大叔说回去考虑，也答应下次再来了解后离开了。这次的谈话给了我信心，让我开始找到了一点方法。</span></p><p style="text-indent: 37px;"><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;"><br/></span></p><p style="text-indent: 37px;"><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;">隔了一天后的周一（6.29）中午，我又遇到了这个大叔。这次一见面，他说我们还真是有缘，我们像认识了多年的老朋友一样聊起天来，我告诉大叔我是个新人，上次跟他的谈话时我第一次谈客户，谢谢他给了我信心。没想到大叔居然说：“我就先在你们那里存一点吧。”听到这话，我瞬间愣住了，心里满是感激大叔对我的信任，完全没想到这么顺利就完成了我人生的第一单。</span></p><p style="text-indent: 37px;"><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;"><br/></span></p><p><span style="color: rgb(0, 0, 0); font-family: 宋体; font-size: 14px; font-weight: bold;">&nbsp; &nbsp;经过这次，让我感觉充满了信心。付出总是有回报的，惊喜也许就在不经意间来临。我相信：坚持努力，一切自有天意！</span></p><p></p>', '华融之星 | 坚持努力，一切自有天意—记湖州营业部 陈凤 ', '我叫陈凤，是湖州营业部的业务员', 1, 1, '2015-07-02 16:41:49', NULL, 0, NULL, '', 0, '{"thumb":""}', 7, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role`
--

CREATE TABLE IF NOT EXISTS `sp_role` (
`id` smallint(6) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_role`
--

INSERT INTO `sp_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(1, '超级管理员', 0, 1, '拥有网站最高管理员权限！', 1329633709, 1329633709, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_role_user`
--

CREATE TABLE IF NOT EXISTS `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `sp_route`
--

CREATE TABLE IF NOT EXISTS `sp_route` (
`id` int(11) NOT NULL COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide`
--

CREATE TABLE IF NOT EXISTS `sp_slide` (
`slide_id` bigint(20) unsigned NOT NULL,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `sp_slide`
--

INSERT INTO `sp_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, '广告1', '/data/upload/5577c13accac6.jpg', '', '', '', 1, 0),
(2, 1, '广告2', '/data/upload/5577c1613bc6a.jpg', '', '', '', 1, 0),
(3, 1, '广告3', '/data/upload/5577c16eeeab6.jpg', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `sp_slide_cat`
--

CREATE TABLE IF NOT EXISTS `sp_slide_cat` (
`cid` bigint(20) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_slide_cat`
--

INSERT INTO `sp_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页轮播广告', 'portal_index', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_terms`
--

CREATE TABLE IF NOT EXISTS `sp_terms` (
`term_id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `sp_terms`
--

INSERT INTO `sp_terms` (`term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status`) VALUES
(1, '新闻动态', '', 'article', '', 0, 0, '0-1', '', '', '', 'list', 'article', 0, 1),
(2, '瀑布流', '', 'article', '', 0, 0, '0-2', '', '', '', 'list_masonry', 'article', 10, 1),
(3, '行业资讯', '', 'article', '', 1, 0, '0-1-3', '', '', '', 'list', 'article', 0, 1),
(4, '华融动态', '', 'article', '', 1, 0, '0-1-4', '', '', '', 'list', 'article', 0, 1),
(5, '关于华融', '', 'article', '', 0, 0, '0-5', '', '', '', 'list', 'article', 0, 1),
(6, '企业简介', '', 'article', '', 5, 0, '0-5-6', '', '', '', 'list', 'article', 0, 1),
(7, '企业文化', '', 'article', '', 5, 0, '0-5-7', '', '', '', 'list', 'article', 0, 1),
(8, '荣誉资质', '', 'article', '', 5, 0, '0-5-8', '', '', '', 'list', 'article', 0, 1),
(9, '招贤纳士', '', 'article', '', 5, 0, '0-5-9', '', '', '', 'list', 'article', 0, 1),
(10, '我要理财', '', 'article', '', 0, 0, '0-10', '', '', '', 'wylc', 'article', 0, 1),
(20, '我要借贷', '', 'article', '', 0, 0, '0-20', '', '', '', 'wydk', 'article', 0, 1),
(15, '联系我们', '', 'article', '', 0, 0, '0-15', '', '', '', 'list', 'article', 0, 1),
(16, '联系方式', '', 'article', '', 15, 0, '0-15-16', '', '', '', 'about_list', 'about', 0, 1),
(17, '客户服务', '', 'article', '', 15, 0, '0-15-17', '', '', '', 'list', 'about', 0, 1),
(18, '在线留言', '', 'article', '', 15, 0, '0-15-18', '', '', '', 'list', 'article', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `sp_term_relationships` (
`tid` bigint(20) NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `sp_term_relationships`
--

INSERT INTO `sp_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 4, 0, 1),
(2, 2, 4, 0, 1),
(3, 3, 4, 0, 1),
(4, 4, 4, 0, 1),
(5, 5, 4, 0, 1),
(6, 6, 4, 0, 1),
(7, 7, 4, 0, 1),
(8, 8, 4, 0, 1),
(9, 9, 4, 0, 1),
(10, 10, 4, 0, 1),
(11, 11, 4, 0, 1),
(12, 12, 4, 0, 1),
(15, 13, 4, 0, 1),
(14, 14, 4, 0, 1),
(16, 15, 6, 0, 1),
(17, 16, 7, 0, 1),
(18, 17, 8, 0, 1),
(19, 18, 3, 0, 1),
(20, 19, 17, 0, 1),
(21, 20, 16, 0, 1),
(22, 21, 4, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_users`
--

CREATE TABLE IF NOT EXISTS `sp_users` (
`id` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `sp_users`
--

INSERT INTO `sp_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`) VALUES
(1, 'admin', 'c535018ee946d352079b056a133a60c1f3091437fe2389af', 'admin', 'cdm14cn@163.com', '', NULL, 0, NULL, NULL, '183.136.133.29', '2015-07-03 10:52:40', '2015-06-08 01:30:58', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `sp_user_favorites`
--

CREATE TABLE IF NOT EXISTS `sp_user_favorites` (
`id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sp_ad`
--
ALTER TABLE `sp_ad`
 ADD PRIMARY KEY (`ad_id`), ADD KEY `ad_name` (`ad_name`);

--
-- Indexes for table `sp_asset`
--
ALTER TABLE `sp_asset`
 ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `sp_auth_access`
--
ALTER TABLE `sp_auth_access`
 ADD KEY `role_id` (`role_id`), ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `sp_auth_rule`
--
ALTER TABLE `sp_auth_rule`
 ADD PRIMARY KEY (`id`), ADD KEY `module` (`module`,`status`,`type`);

--
-- Indexes for table `sp_comments`
--
ALTER TABLE `sp_comments`
 ADD PRIMARY KEY (`id`), ADD KEY `comment_post_ID` (`post_id`), ADD KEY `comment_approved_date_gmt` (`status`), ADD KEY `comment_parent` (`parentid`), ADD KEY `table_id_status` (`post_table`,`post_id`,`status`), ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `sp_common_action_log`
--
ALTER TABLE `sp_common_action_log`
 ADD PRIMARY KEY (`id`), ADD KEY `user_object_action` (`user`,`object`,`action`), ADD KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`);

--
-- Indexes for table `sp_guestbook`
--
ALTER TABLE `sp_guestbook`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_links`
--
ALTER TABLE `sp_links`
 ADD PRIMARY KEY (`link_id`), ADD KEY `link_visible` (`link_status`);

--
-- Indexes for table `sp_menu`
--
ALTER TABLE `sp_menu`
 ADD PRIMARY KEY (`id`), ADD KEY `status` (`status`), ADD KEY `parentid` (`parentid`), ADD KEY `model` (`model`);

--
-- Indexes for table `sp_nav`
--
ALTER TABLE `sp_nav`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_nav_cat`
--
ALTER TABLE `sp_nav_cat`
 ADD PRIMARY KEY (`navcid`);

--
-- Indexes for table `sp_oauth_user`
--
ALTER TABLE `sp_oauth_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_options`
--
ALTER TABLE `sp_options`
 ADD PRIMARY KEY (`option_id`), ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `sp_plugins`
--
ALTER TABLE `sp_plugins`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_posts`
--
ALTER TABLE `sp_posts`
 ADD PRIMARY KEY (`id`), ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`), ADD KEY `post_parent` (`post_parent`), ADD KEY `post_author` (`post_author`), ADD KEY `post_date` (`post_date`) USING BTREE;

--
-- Indexes for table `sp_role`
--
ALTER TABLE `sp_role`
 ADD PRIMARY KEY (`id`), ADD KEY `parentId` (`pid`), ADD KEY `status` (`status`);

--
-- Indexes for table `sp_role_user`
--
ALTER TABLE `sp_role_user`
 ADD KEY `group_id` (`role_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_route`
--
ALTER TABLE `sp_route`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_slide`
--
ALTER TABLE `sp_slide`
 ADD PRIMARY KEY (`slide_id`), ADD KEY `slide_cid` (`slide_cid`);

--
-- Indexes for table `sp_slide_cat`
--
ALTER TABLE `sp_slide_cat`
 ADD PRIMARY KEY (`cid`), ADD KEY `cat_idname` (`cat_idname`);

--
-- Indexes for table `sp_terms`
--
ALTER TABLE `sp_terms`
 ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `sp_term_relationships`
--
ALTER TABLE `sp_term_relationships`
 ADD PRIMARY KEY (`tid`), ADD KEY `term_taxonomy_id` (`term_id`);

--
-- Indexes for table `sp_users`
--
ALTER TABLE `sp_users`
 ADD PRIMARY KEY (`id`), ADD KEY `user_login_key` (`user_login`), ADD KEY `user_nicename` (`user_nicename`);

--
-- Indexes for table `sp_user_favorites`
--
ALTER TABLE `sp_user_favorites`
 ADD PRIMARY KEY (`id`), ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sp_ad`
--
ALTER TABLE `sp_ad`
MODIFY `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id';
--
-- AUTO_INCREMENT for table `sp_asset`
--
ALTER TABLE `sp_asset`
MODIFY `aid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_auth_rule`
--
ALTER TABLE `sp_auth_rule`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `sp_comments`
--
ALTER TABLE `sp_comments`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_common_action_log`
--
ALTER TABLE `sp_common_action_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=439;
--
-- AUTO_INCREMENT for table `sp_guestbook`
--
ALTER TABLE `sp_guestbook`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_links`
--
ALTER TABLE `sp_links`
MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sp_menu`
--
ALTER TABLE `sp_menu`
MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=162;
--
-- AUTO_INCREMENT for table `sp_nav`
--
ALTER TABLE `sp_nav`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sp_nav_cat`
--
ALTER TABLE `sp_nav_cat`
MODIFY `navcid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sp_oauth_user`
--
ALTER TABLE `sp_oauth_user`
MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sp_options`
--
ALTER TABLE `sp_options`
MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sp_plugins`
--
ALTER TABLE `sp_plugins`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- AUTO_INCREMENT for table `sp_posts`
--
ALTER TABLE `sp_posts`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `sp_role`
--
ALTER TABLE `sp_role`
MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sp_route`
--
ALTER TABLE `sp_route`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id';
--
-- AUTO_INCREMENT for table `sp_slide`
--
ALTER TABLE `sp_slide`
MODIFY `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sp_slide_cat`
--
ALTER TABLE `sp_slide_cat`
MODIFY `cid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sp_terms`
--
ALTER TABLE `sp_terms`
MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `sp_term_relationships`
--
ALTER TABLE `sp_term_relationships`
MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `sp_users`
--
ALTER TABLE `sp_users`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sp_user_favorites`
--
ALTER TABLE `sp_user_favorites`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
