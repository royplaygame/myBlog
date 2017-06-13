package com.qzhangsq.ly.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.qzhangsq.ly.entity.Article;
import com.qzhangsq.ly.service.ArticleService;


@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	ArticleService articleService;

	@RequestMapping("/toArticleList")
	public String toArticleList() {
		return "article";
	}

	@RequestMapping("/doArticleAdd")
	public void doArticleAdd(@ModelAttribute("article") Article article, HttpServletResponse response)
			throws IOException {
		System.out.println("=================================");
		System.out.println(article);

		article.setPublishTime(new Date());
		boolean flag = this.articleService.addArticle(article);
		if (flag) {
			response.getWriter().println("{\"flag\":\"success\"}");
		}else{
			response.getWriter().println("{\"flag\":\"fail\"}");
		}
	}

	@RequestMapping("/doArticleUpdate")
	public void doArticleUpdate(@ModelAttribute("article") Article article, HttpServletResponse response)
			throws IOException {
		article.setPublishTime(new Date());
		boolean flag = this.articleService.updateArticle(article);
		if (flag) {
			response.getWriter().println("success");
		}
	}
	
	@RequestMapping("/doArticleDelete")
	public void doArticleDelete(String articleId, HttpServletResponse response)
			throws IOException {
		if(articleId!=null&&!"".equals(articleId)){
			boolean flag = this.articleService.deleteArticle(Integer.valueOf(articleId));
			if (flag) {
				response.getWriter().println("success");
			}
		}
		
	}
	
	

	@RequestMapping("/getArticleListByType")
	public void getArticleListByType(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Article> list = this.articleService.findArticleByType(1);
		response.getWriter().println(JSON.toJSONString(list));
	}

	@RequestMapping("/getAllArticleList")
	public void getAllArticleList(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Article> list = this.articleService.findAllArticleList();
		response.getWriter().println(JSON.toJSONString(list));
	}

}
