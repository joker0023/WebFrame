package com.jokerstation.webframe.vo.console;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 后台用户角色vo
 * @author Joker
 *
 */
@Table(name="console_role")
public class ConsoleRole extends POJO{

	private static final long serialVersionUID = -6647120228925913250L;
	
	@Id
	private Long id;
	
	private String name;
	
	private String description;
	
	private String namespace;

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNamespace() {
		return namespace;
	}

	public void setNamespace(String namespace) {
		this.namespace = namespace;
	}
	
}
