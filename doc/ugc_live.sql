CREATE DATABASE `springboot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE  `user`(
    `id` INT UNSIGNED  NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '用户id',
    `name` VARCHAR(20) NOT NULL COMMENT '用户姓名',
    `sex` CHAR(3) NOT NULL DEFAULT 'm' COMMENT '用户性别'
)ENGINE=INNODB DEFAULT CHARSET=utf8;

# SHOW VARIABLES LIKE '%colla%';

# SHOW VARIABLES LIKE '%char%';

# SET collation_server='utf8_general_ci';

# SET character_set_server='utf8';

DROP TABLE IF EXISTS `live_room`;

CREATE TABLE `live_room` (
   -- ID区域
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `room_id` BIGINT(20) DEFAULT '0' COMMENT '公司内直播间id',
  `customer_id` BIGINT(20) DEFAULT '0' COMMENT '公司内会员id',
  `ref_room_id` VARCHAR(100) DEFAULT '0' COMMENT '第三方直播间id',
  `ref_user_id` VARCHAR(100) DEFAULT '0' COMMENT '第三方用户id',

   -- 直播间基本信息
  `room_title` VARCHAR(500) DEFAULT NULL COMMENT '直播间标题',
  `room_notice` VARCHAR(1000) DEFAULT NULL COMMENT '直播间公告',
  `room_type` INT(2) DEFAULT '1' COMMENT '直播类型(1-视频直播，2-视频直播+聊天互动+直播问答，3-视频直播+聊天互动，4-视频直播+聊天互动+直播文档，5-视频直播+聊天互动+直播文档+直播问答，6-视频直播+直播问答)',
  `live_status` INT(2) DEFAULT '0' COMMENT '直播间状态(0-未直播，1-直播中)',

   -- 直播间认证/权限信息
  `auth_type` INT(2) DEFAULT '1' COMMENT '验证方式(0-接口验证，需要填写下面的checkurl；1-密码验证，需要填写下面的playpass；2-免密码验证)',
  
  `publisher_pass` VARCHAR(100) DEFAULT NULL COMMENT '推流端密码，即讲师密码',
  `assistant_pass` VARCHAR(100) DEFAULT NULL COMMENT '助教端密码',
  `play_pass` VARCHAR(100) DEFAULT NULL COMMENT '播放端密码',
  
  `publisher_join_url` VARCHAR(500) DEFAULT NULL COMMENT '讲师加入URL',
  `assistant_join_url` VARCHAR(500) DEFAULT NULL COMMENT '助教加入URL',
  `play_join_url` VARCHAR(500) DEFAULT NULL COMMENT '普通参加者加入URL',
  `check_url` VARCHAR(500) DEFAULT NULL COMMENT '验证地址',

   -- 后台审核状态信息
  `room_audit_status` INT(2) DEFAULT '0' COMMENT '审核状态（0-提交审核/未审核，1-审核通过，2-审核拒绝）',

   -- 基础字段信息
  `sort_id` INT(10) DEFAULT '0' COMMENT '顺序号',
  `site_id` INT(6) DEFAULT '1' COMMENT '站点',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_valid` INT(1) DEFAULT '1' COMMENT '是否有效(0-无效,1-有效)',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='直播间';

CREATE TABLE `live_plan` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `plan_id` BIGINT(20) DEFAULT '0' COMMENT '计划id',
  `room_id` BIGINT(20) DEFAULT '0' COMMENT '直播间id',
   -- 主播信息  
  `live_host_name` VARCHAR(50) DEFAULT NULL COMMENT '主播名字',
  `live_host_id` BIGINT(20) DEFAULT '0' COMMENT '主播会员id',

   -- 引用资源信息
  `ref_id` BIGINT(20) DEFAULT '0' COMMENT '资源id',
  `ref_type` INT(2) DEFAULT '0' COMMENT '资源类型(0-无，1-视频，2-文库，4-会议，7-病例)',

   -- 直播计划信息
  `plan_title` VARCHAR(500) DEFAULT NULL COMMENT '直播间标题',
  `plan_notice` VARCHAR(1000) DEFAULT NULL COMMENT '直播间公告',
  `plan_type` INT(2) DEFAULT '1' COMMENT '直播类型(1-手术直播，2-学术会议，3-产品推荐，4-器械操作，5-手术解说，6-病例讨论)',
  `plan_start_time` DATETIME DEFAULT NULL COMMENT '直播计划开始时间',
  `plan_end_time` DATETIME DEFAULT NULL COMMENT '直播计划结束时间',

   -- 后台审核状态
  `plan_audit_status` INT(2) DEFAULT '0' COMMENT '审核状态（0-提交审核/未审核，1-审核通过，2-审核拒绝）',

   -- 基础字段信息
  `sort_id` INT(10) DEFAULT '0' COMMENT '顺序号',
  `site_id` INT(6) DEFAULT '1' COMMENT '站点',
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_valid` INT(1) DEFAULT '1' COMMENT '是否有效(0-无效,1-有效)',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='直播计划';


