package org.geon.userboard.mapper;

import java.util.stream.IntStream;

import org.geon.userboard.domain.UserBoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserBoardMapperTests {
	
	@Autowired
	UserBoardMapper mapper;
	
	@Test
	public void read() {
		Long bno = 13L;
		
		log.info(mapper.read(bno));
	}
	
	@Test
	public void testGetList() {
		String[] arr = new String[1];
		arr[0] = "w";
		
		mapper.getList(1,10,"free",arr,"").forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetTotalCount() {
		String[] arr = new String[1];
		arr[0] = "t";
		
		log.info(mapper.getTotalCount("free",arr,""));
	}
	
	@Test
	public void testInsert() {
		IntStream.rangeClosed(1, 100).forEach(i -> {
			UserBoardVO vo = UserBoardVO.builder()
					.title("testInsert...." + i)
					.content("testContent....." + i)
					.writer("parkgun")
					.category("free")
					.build();
			mapper.insertSelectKey(vo);
		});
	}

	@Test
	public void testUpdate() {
		UserBoardVO board = UserBoardVO.builder().buno(15L).title("testinsert.....").content("test.....").writer("박건").category("free").build();
		
		mapper.update(board);
	}
	
	@Test
	public void testDelete() {
		Long bno = 15L;
		
		mapper.delete(bno);
	}
}
