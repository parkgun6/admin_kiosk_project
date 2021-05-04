package org.geon.myshop.service;



import org.geon.myshop.dto.MenuDTO;
import org.geon.myshop.dto.MyShopDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyShopServiceTests {

	@Autowired
	MyShopService service;
	
	@Test
	public void testUpdateInfo() {
		MyShopDTO dto = MyShopDTO.builder()
				.sno(1L)
				.userid("user00")
				.info("Update Test.....")
				.build();
		service.updateInfo(dto);
	}
	
	@Test
	public void testUpdateGuide() {
		MyShopDTO dto = MyShopDTO.builder()
				.sno(1L)
				.userid("user00")
				.guide("Update Test.....")
				.build();
		service.updateGuide(dto);
	}
	
	@Test
	public void testGetShop() {
		MyShopDTO myshop = service.getShop("user00");
		log.info(myshop);
	}
	
	@Test
	public void testGetList() {
		log.info(service.getList(1L));
	}
	
	@Test
	public void testGetOne() {
		log.info(service.getOne(9L));
	}
	
	@Test
	public void testInsertMenu() {
		MenuDTO menu = MenuDTO.builder()
				.sno(1L)
				.name("전복")
				.explanation("Abalone Raviolo")
				.price(16000)
				.build();
		service.insertMenu(menu);
	}
	
	@Test
	public void testInsertCategory() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.cno(3L)
				.build();
		service.insertCategory(menu);
	}
	
	@Test
	public void testUpdateMenu() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.name("전복 라비올로")
				.explanation("Abalone Raviolo")
				.price(16000)
				.build();
		service.updateMenu(menu);
	}
	
	@Test
	public void testDeleteCategory() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.cno(6L)
				.build();
		service.deleteCategory(menu);
	}
	
	@Test
	public void testChangeStatus() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.status("판매중")
				.build();
		service.changeStatus(menu);
	}
	
	@Test
	public void testDeleteMenu() {
		service.deleteMenu(11L);
	}
}
