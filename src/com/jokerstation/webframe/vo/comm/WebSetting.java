package com.jokerstation.webframe.vo.comm;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 站点设置vo
 * @author Joker
 *
 */
@Table(name="web_websetting")
public class WebSetting extends POJO{

	private static final long serialVersionUID = -6164683584481821L;

	@Id
	private Long id;
	
	private String webName;
	
	private String domain;
	
	private String keyWord;
	
	private String description;
	
	private String icp;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getWebName() {
		return webName;
	}

	public void setWebName(String webName) {
		this.webName = webName;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
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

	public String getIcp() {
		return icp;
	}

	public void setIcp(String icp) {
		this.icp = icp;
	}
	
}
