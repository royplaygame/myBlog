package com.qzhangsq.ly.service;

import java.util.List;

import com.qzhangsq.ly.entity.Article;

public interface ArticleService {
	public List<Article> findArticleByType(int typeId);
}
