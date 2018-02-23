package com.lsieun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lsieun.entity.DemoEntity;
import com.lsieun.entity.Person;
import com.lsieun.entity.User;
import com.lsieun.mapper.UserMapper;

@Controller
@RequestMapping("/hello")
public class HelloController {

    private Logger logger = LoggerFactory.getLogger(HelloController.class);

    @Autowired
    private Person person;

    @Resource
    private UserMapper userMapper;

    /**
     * 测试hello
     * @return
     */
    @RequestMapping(value = "/getJson",method = RequestMethod.GET)
    public @ResponseBody DemoEntity getJson(){
        DemoEntity entity = new DemoEntity();
        entity.setId("1");
        entity.setUsername("Tom");
        entity.setPassword("123456");
        logger.debug("这是debug信息");
        logger.info("这是info信息");
        logger.warn("这是warn信息");
        logger.error("这是error信息");
        return entity;
    }

    /**
     * 测试index
     * @return
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String hello(Model model) {
        model.addAttribute("name", "SpringBoot");
        Map<String,String> user = new HashMap<String,String>();
        user.put("name","Jerry");
        user.put("age","3");
        model.addAttribute("user", user);
        return "hello/index";
    }

    @RequestMapping("thymeleaf")
    public String thymeleafTest(Model model){
        List<Person> persons = new ArrayList<Person>();

        Person person1 = new Person();
        person1.setName("路飞");
        person1.setSex("男");
        person1.setAge("15");

        Person person2 = new Person();
        person2.setName("妮可罗宾");
        person2.setSex("女");
        person2.setAge("16");

        persons.add(person);
        persons.add(person1);
        persons.add(person2);

        model.addAttribute("person", person);
        model.addAttribute("persons", persons);
        return "hello/thymeleaftest";
    }

    @RequestMapping(value = "/users",method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
    public @ResponseBody User testUserDao(){
        User user = userMapper.findById(1);
        return user;
    }
}
