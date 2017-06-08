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

}
