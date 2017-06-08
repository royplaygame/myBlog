package com.qzhangsq.ly.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qzhangsq.ly.dao.ArticleDao;
import com.qzhangsq.ly.entity.Article;

@Repository
public class ArticleDaoImpl implements ArticleDao {
	
	@Autowired
	private SessionFactory sf;
	
	public Session getSession(){
		return sf.getCurrentSession();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleByType(int typeId) {
		Query query =this.getSession().createQuery("from Article a where a.articleType.id=?");
		query.setParameter(1, typeId);
		return query.list();
	}

}
