package org.geon.myshop.mapper;


import java.util.UUID;

import org.geon.common.dto.AttachFileDTO;
import org.geon.myshop.dto.MenuDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MenuMapperTests {
	
	@Autowired
	MenuMapper mapper;
	
	@Autowired
	MenuAttachMapper attachMapper;
	
	@Test
	public void testGetList() {
		log.info(mapper.getList(1L));
	}
	
	@Test
	public void testGetOne() {
		log.info(mapper.getOne(37L));
	}
	
	@Test
	public void testInsertMenu() {
		MenuDTO menu = MenuDTO.builder()
				.sno(1L)
				.name("전복")
				.explanation("Abalone Raviolo")
				.price(16000)
				.build();
		mapper.insertMenu(menu);
	}
	
	@Test
	public void testInsertMenuWithAttach() {
		
		UUID uuid = UUID.randomUUID();
		
		Long mno = 33L;
		
		String fileName ="Test.jpg";
		
		String uploadPath = "2021\04\21";
		
		AttachFileDTO attachDTO = new AttachFileDTO();
		attachDTO.setUuid(uuid.toString());
		attachDTO.setFileName(fileName);
		attachDTO.setUploadPath(uploadPath);
		attachDTO.setMno(mno);
		
		attachMapper.insert(attachDTO);
		
		
	}
	
	@Test
	public void testInsertCategory() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.cno(3L)
				.build();
		mapper.insertCategory(menu);
	}
	
	@Test
	public void testUpdateMenu() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.name("전복 라비올로")
				.explanation("Abalone Raviolo")
				.price(16000)
				.build();
		mapper.updateMenu(menu);
	}
	
	@Test
	public void testDeleteCategory() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.cno(6L)
				.build();
		mapper.deleteCategory(menu);
	}
	
	@Test
	public void testChangeStatus() {
		MenuDTO menu = MenuDTO.builder()
				.mno(9L)
				.status("판매중")
				.build();
		mapper.changeStatus(menu);
	}
	
	@Test
	public void testDeleteMenu() {
		mapper.deleteMenu(11L);
	}
	

}
