package com.qzhangsq.ly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/console")
public class ConsoleControler {

	@RequestMapping("/toConsoleList")
	public String toConsoleList(){
		System.out.println("toConsoleList");
		return "main";
	}
}
