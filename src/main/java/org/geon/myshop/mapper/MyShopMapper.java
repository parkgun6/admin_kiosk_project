package org.geon.myshop.mapper;

import org.geon.myshop.domain.MyShopVO;

public interface MyShopMapper {

	void updateInfo(MyShopVO myshop);
	
	void updateGuide(MyShopVO myshop);
	
	void updateStore(MyShopVO myshop);
	
	MyShopVO getShop(String userid);
}
