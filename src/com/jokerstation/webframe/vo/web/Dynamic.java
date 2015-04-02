package com.jokerstation.webframe.vo.web;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 动态,公告
 * @author Joker
 *
 */
@Table(name="web_dynamic")
public class Dynamic extends POJO {

	private static final long serialVersionUID = -2023980289794853555L;
	
	public static final int NOTE = 1;
	public static final int ARTICLE = 2;
	
	@Id
	private Long id;
	
	private String title;
	
	private String content;
	
	private Date modified;
	
	private Integer type;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
