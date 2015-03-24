package com.jokerstation.webframe.vo.web;

import javax.persistence.Id;
import javax.persistence.Table;

import com.joker23.orm.persistence.POJO;

/**
 * 联系我们vo
 * @author Joker
 *
 */
@Table(name="web_contact")
public class Contact extends POJO {

	private static final long serialVersionUID = -1114576110185271054L;

	@Id
	private Integer id;
	
	private String compary;
	
	private String address;
	
	private String phone;
	
	private String addrLng;
	
	private String addrLat;
	
	private String other;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCompary() {
		return compary;
	}

	public void setCompary(String compary) {
		this.compary = compary;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddrLng() {
		return addrLng;
	}

	public void setAddrLng(String addrLng) {
		this.addrLng = addrLng;
	}

	public String getAddrLat() {
		return addrLat;
	}

	public void setAddrLat(String addrLat) {
		this.addrLat = addrLat;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}
	
}
