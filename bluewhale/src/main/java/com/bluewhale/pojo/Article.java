package com.bluewhale.pojo;

public class Article {
	private int id;
	private String title;
	private String content;
	private String htmlcontent;
	private String type;
	private Integer ownerid;
	private String submitdata;
	private String comment;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHtmlcontent() {
		return htmlcontent;
	}
	public void setHtmlcontent(String htmlcontent) {
		this.htmlcontent = htmlcontent;
	}
	public Integer getOwnerid() {
		return ownerid;
	}
	public void setOwnerid(Integer ownerid) {
		this.ownerid = ownerid;
	}
	public String getSubmitdata() {
		return submitdata;
	}
	public void setSubmitdata(String submitdata) {
		this.submitdata = submitdata;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content=" + content + ", htmlcontent=" + htmlcontent
				+ ", type=" + type + ", ownerid=" + ownerid + ", submitdata=" + submitdata + ", comment=" + comment
				+ "]";
	}
}
