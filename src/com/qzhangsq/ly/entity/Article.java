package com.qzhangsq.ly.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name="article")
public class Article {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="art_id")
	private Integer id;
	@Column(name="title")
	private String title;
	@Column(name="pic_path")
	private String picPath;
	@Column(name="content")
	private String content;
	@Column(name="publish_time")
	private Date publishTime;
	@Column(name="author")
	private String author;
	@ManyToOne(targetEntity = ArticleType.class, fetch = FetchType.EAGER)
	@JoinColumn(name="article_type",referencedColumnName="id")
	//@Transient
	private ArticleType articleType;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPicPath() {
		return picPath;
	}
	public void setPicPath(String picPath) {
		this.picPath = picPath;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public ArticleType getArticleType() {
		return articleType;
	}
	public void setArticleType(ArticleType articleType) {
		this.articleType = articleType;
	}
	

}
