package com.jokerstation.webframe.dao;

import com.joker23.orm.persistence.POJO;
import com.jokerstation.webframe.data.Data;

public class BaseDao<T extends POJO> extends com.joker23.orm.dao.BaseDao<T> {
	
	public BaseDao(Class<T> beanClass) {
		super(beanClass, Data.alias);
	}
	
}
