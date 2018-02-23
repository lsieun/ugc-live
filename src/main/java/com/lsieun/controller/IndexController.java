package com.lsieun.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
    private Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String home(Model model) {
//        model.addAttribute("name", "SpringBoot");
//        Map<String,String> user = new HashMap<String,String>();
//        user.put("name","Jerry");
//        user.put("age","3");
//        model.addAttribute("user", user);
        return "index";
    }
}
