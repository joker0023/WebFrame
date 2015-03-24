package com.jokerstation.webframe.vo.web;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 招聘条目vo
 * @author Joker
 *
 */
@Table(name="web_recruitment")
public class Recruitment extends POJO {

	private static final long serialVersionUID = 3047514260228498999L;

	@Id
	private Long id;
	
	private String title;
	
	private String html;
	
	private Date modified;
	
	private Boolean showIn;
	
	private Integer catId;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCatId() {
		return catId;
	}

	public void setCatId(Integer catId) {
		this.catId = catId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public Date getModified() {
		return modified;
	}

	public void setModified(Date modified) {
		this.modified = modified;
	}

	public Boolean getShowIn() {
		return showIn;
	}

	public void setShowIn(Boolean showIn) {
		this.showIn = showIn;
	}
}
