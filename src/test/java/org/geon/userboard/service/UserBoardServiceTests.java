package org.geon.userboard.service;

import java.util.List;
import java.util.stream.IntStream;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.dto.UserBoardDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserBoardServiceTests {

	@Autowired
	UserBoardService service;

	@Test
	public void testGetPageList() {

		List<UserBoardDTO> list = service.getPageList(new PageDTO(1, 10), "free");

		list.forEach(vo -> {
			log.info(vo);
		});
	}

	@Test
	public void testGetTotalCount() {
		log.info(service.getTotalCount(null, "free"));

	}

	@Test
	public void testInsert() {
		IntStream.rangeClosed(1, 100).forEach(i -> {
			UserBoardDTO dto = UserBoardDTO.builder()
					.title("testInsert...." + i)
					.content("testContent....." + i)
					.writer("parkgun")
					.category("free")
					.build();
			service.register(dto);
		});
	}

	@Test
	public void testUpdate() {
		UserBoardDTO dto = UserBoardDTO.builder().buno(18227L).title("test update....").content("testContent.....")
				.build();
		service.update(dto);
	}

	@Test
	public void testDelete() {
		service.delete(18227L);
	}

	@Test
	public void testRead() {
		log.info(service.readOne(16L));
	}

}
