package com.jokerstation.webframe.dao.web;

import com.jokerstation.webframe.dao.BaseDao;
import com.jokerstation.webframe.vo.web.Carousel;

/**
 * 轮播图vo的dao
 * @author Joker
 *
 */
public class CarouselDao extends BaseDao<Carousel>{

	public CarouselDao(){
		super(Carousel.class);
	}
	
	public java.util.List<Carousel> listAllBySort() throws Exception {
		return this.filter(null, 0, 0, "sort asc, id desc");
	}
}
