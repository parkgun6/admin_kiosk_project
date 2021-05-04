package org.geon.myshop.mapper;


import org.geon.myshop.domain.MyShopVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyShopMapperTests {
	
	@Autowired
	MyShopMapper mapper;
	
	@Test
	public void testUpdateInfo() {
		MyShopVO myshop = MyShopVO.builder()
				.sno(1L)
				.userid("user00")
				.info("반갑습니다Test......")
				.build();
		
		log.info(myshop);
		mapper.updateInfo(myshop);
	}
	
	@Test
	public void testUpdateGuide() {
		MyShopVO myshop = MyShopVO.builder()
				.sno(1L)
				.userid("user00")
				.guide("반갑습니다Test......")
				.build();
		
		log.info(myshop);
		mapper.updateGuide(myshop);
	}
	
	@Test
	public void testUpdateStore() {
		MyShopVO myshop = MyShopVO.builder()
				.sno(1L)
				.userid("user00")
				.sname("김밥천국")
				.tel("010-9876-5432")
				.address("허리도 가늘군")
				.businessHour("1:30~3:30")
				.Holiday("주말, 공휴일")
				.lat(30.123456)
				.lng(127.123456)
				.build();
		
		log.info(myshop);
		mapper.updateStore(myshop);
	}
	
	@Test
	public void testGetShop() {
		MyShopVO myshop = mapper.getShop("user00");
		log.info(myshop);
	}
}
