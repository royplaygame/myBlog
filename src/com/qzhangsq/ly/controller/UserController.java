package com.qzhangsq.ly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.qzhangsq.ly.entity.Admin;
import com.qzhangsq.ly.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("/toUserList")
	public String toUserList(){
		System.out.println("toUserList");
		return "users";
	}
	
	@RequestMapping("/toLogin")
	public String toLogin(){
		System.out.println("toLogin");
		return "login";
	}
	
	@RequestMapping("/findUserList")
	public void findUserList(HttpServletRequest request,HttpServletResponse response) throws IOException{
		List<Admin> list=this.userService.findUserList();
		response.getWriter().println(JSON.toJSONString(list));
	}
}
