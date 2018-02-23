CREATE DATABASE `springboot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE  `user`(
    `id` int unsigned  not null AUTO_INCREMENT PRIMARY KEY COMMENT '用户id',
    `name` varchar(20) not null COMMENT '用户姓名',
    `sex` char(3) not null default 'm' COMMENT '用户性别'
)ENGINE=INnoDB DEFAULT CHARSET=utf8;