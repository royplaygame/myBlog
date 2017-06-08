package com.qzhangsq.ly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

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
}
