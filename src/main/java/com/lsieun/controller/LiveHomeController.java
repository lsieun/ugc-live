package com.lsieun.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lsieun.entity.DemoEntity;
import com.lsieun.entity.Page;

@Controller
@RequestMapping("/livehome")
public class LiveHomeController {

    private Logger logger = LoggerFactory.getLogger(LiveHomeController.class);

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String index(Model model) {
        return "live/livehome";
    }

    @RequestMapping(value = "/getPageList",method = RequestMethod.GET, produces = { "application/json;charset=UTF-8" })
    public @ResponseBody Page getPageList(){
        List<String> list = new ArrayList<String>();
        list.add("小明");
        list.add("小红");

        Page page = new Page(50,list);
        page.setCurrentPageNum(1);
        page.setPerPageSize(10);

        logger.debug("这是debug信息");
        logger.info("这是info信息");
        logger.warn("这是warn信息");
        logger.error("这是error信息");
        return page;
    }

}
