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
		Query query =this.getSession().createQuery("from Article a where a.type=?");
		query.setParameter(0, typeId);
		return query.list();
	}

	@Override
	public boolean addArticle(Article article) {
		try{
			this.getSession().save(article);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean updateArticle(Article article) {
		try{
			this.getSession().saveOrUpdate(article);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean deleteArticle(Integer id) {
		try{
			Article article=(Article) this.getSession().get(Article.class, id);
			this.getSession().delete(article);
			return true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findAllArticleList() {
		Query query=this.getSession().createQuery("from Article");
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Article> findArticleListByPage(int curentPage, int size) {
		Query query=this.getSession().createQuery("from Article");
		query.setFirstResult((curentPage-1)*size);
		query.setMaxResults(size);
		return query.list();
	}

}
