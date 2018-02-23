package com.lsieun.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.lsieun.entity.User;

/**
 * UserMapper.xml代理
 */
@Mapper
public interface UserMapper {
    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User findById(int id);
}
