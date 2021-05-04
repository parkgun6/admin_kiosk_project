package org.geon.adminboard.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.geon.adminboard.domain.AdminBoardVO;
import org.geon.adminboard.dto.AdminBoardDTO;
import org.geon.adminboard.service.AdminBoardService;
import org.geon.common.dto.PageDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminBoardServiceTests {

	@Autowired
	AdminBoardService service;
	
	@Test
	public void testGetPageList() {

		List<AdminBoardDTO> list = service.getPageList(
				new PageDTO(1,10),1);
		
		list.forEach(vo -> {
			log.info(vo);
		});
	}
	
	@Test
	public void testGetTotalCount() {
		log.info(service.getTotalCount(null,1));
		
	}
	
	@Test
	public void testInsert() {
		AdminBoardDTO dto = AdminBoardDTO.builder()
				.title("testInsert....")
				.content("testContent.....")
				.writer("박건..")
				.category(1)
				.build();
		service.register(dto);
	}
	
	@Test
	public void testUpdate() {
		AdminBoardDTO dto = AdminBoardDTO.builder()
				.bano(18227L)
				.title("test update....")
				.content("testContent.....")
				.build();
		service.update(dto);
	}
	
	@Test
	public void testDelete() {
		service.delete(18227L);
	}
	
	@Test
	public void testRead() {
		log.info(service.readOne(18227L));
	}
	
}
