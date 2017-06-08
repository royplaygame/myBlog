package com.qzhangsq.ly.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/article")
public class ArticleController {
	
	
	@RequestMapping("/toArticleList")
	public String toArticleList(){
		System.out.println("toArticleList");
		return "article";
	}
	
	

}
