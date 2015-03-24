package com.jokerstation.webframe.vo.comm;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 友情链接vo
 * @author Joker
 *
 */
@Table(name="web_link")
public class Link extends POJO{
	
	private static final long serialVersionUID = -8015371294684862057L;

	@Id
	private Long id;
	
	private String name;
	
	private String url;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
