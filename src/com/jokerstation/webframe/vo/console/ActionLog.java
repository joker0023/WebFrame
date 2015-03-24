package com.jokerstation.webframe.vo.console;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 用户行为vo
 * @author Joker
 *
 */
@Table(name="console_actionlog")
public class ActionLog extends POJO {
	
	private static final long serialVersionUID = -8261055959253368668L;

	@Id
	private Long id;

	private String account;
	
	private Date time;
	
	private String action;
	
	private String detail;
	
	private String ip;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
}
