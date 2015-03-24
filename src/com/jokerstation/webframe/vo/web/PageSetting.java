package com.jokerstation.webframe.vo.web;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 页面设置vo
 * @author Joker
 *
 */
@Table(name="web_pagesetting")
public class PageSetting extends POJO {
	
	private static final long serialVersionUID = 889576059019169992L;

	@Id
	private Integer id;
	
	private String pageId;
	
	private String title;
	
	private String keyWord;
	
	private String description;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPageId() {
		return pageId;
	}

	public void setPageId(String pageId) {
		this.pageId = pageId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}
