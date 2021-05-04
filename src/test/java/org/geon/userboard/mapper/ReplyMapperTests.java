package org.geon.userboard.mapper;

import java.util.stream.IntStream;

import org.geon.userboard.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Autowired
	ReplyMapper mapper;
	
	@Test
	public void testGetList() {
		Long buno = 107L;
		
		log.info(mapper.getList(buno));
	}
	
	@Test
	public void insertReplies() {
		
		IntStream.range(1, 300).forEach(i -> {
			
			long idx = (long)(Math.random() * 100) + 8;
			
			ReplyVO reply = ReplyVO.builder()
					.buno(idx)
					.content("댓글 테스트..." + idx)
					.writer("user" + (i % 10))
					.build();
			
			mapper.insert(reply);
		});
	}
	
	@Test
	public void testGetCount() {
		Long buno = 107L;
		
		log.info(mapper.getTotalCount(buno));
	}
	
	@Test
	public void testUpdate() {
		ReplyVO reply = ReplyVO.builder()
				.rno(67L)
				.content("업데이트 테스트...")
				.build();
		mapper.update(reply);
	}
	
	@Test
	public void testDelete() {
		Long rno = 67L;
		mapper.delete(rno);
	}
	
}
