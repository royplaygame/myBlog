package com.qzhangsq.ly.dao;

import java.util.List;

import com.qzhangsq.ly.entity.Article;

public interface ArticleDao {

	public List<Article> findArticleByType(int typeId);
	
}
