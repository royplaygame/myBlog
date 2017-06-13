package com.qzhangsq.ly.service;

import java.util.List;

import com.qzhangsq.ly.entity.Article;

public interface ArticleService {
	public List<Article> findArticleByType(int typeId);

	public boolean addArticle(Article article);

	public boolean updateArticle(Article article);

	public boolean deleteArticle(Integer id);

	public List<Article> findAllArticleList();

	public List<Article> findArticleListByPage(int curentPage, int size);
}
