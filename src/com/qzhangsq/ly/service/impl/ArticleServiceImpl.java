package com.qzhangsq.ly.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qzhangsq.ly.dao.ArticleDao;
import com.qzhangsq.ly.entity.Article;
import com.qzhangsq.ly.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Override
	public List<Article> findArticleByType(int typeId) {
		return articleDao.findArticleByType(typeId);
	}

	@Override
	public boolean addArticle(Article article) {
		return articleDao.addArticle(article);
	}

	@Override
	public boolean updateArticle(Article article) {
		return articleDao.updateArticle(article);
	}

	@Override
	public boolean deleteArticle(Integer id) {
		return articleDao.deleteArticle(id);
	}

	@Override
	public List<Article> findAllArticleList() {
		return articleDao.findAllArticleList();
	}

	@Override
	public List<Article> findArticleListByPage(int curentPage, int size) {
		return articleDao.findArticleListByPage(curentPage, size);
	}

}
