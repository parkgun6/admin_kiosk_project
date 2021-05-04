package org.geon.userboard.service;

import java.util.stream.IntStream;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.dto.ReplyDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {

	@Autowired
	ReplyService service;

	@Test
	public void testGetList() {
		Long buno = 107L;

		log.info(service.getList(buno));
	}

	@Test
	public void insertReplies() {

		IntStream.range(1, 300).forEach(i -> {

			long idx = (long) (Math.random() * 100) + 8;

			ReplyDTO reply = ReplyDTO.builder()
					.buno(idx)
					.content("댓글 테스트..." + idx)
					.writer("user" + (i % 10))
					.build();

			service.insert(reply);
		});
	}

	@Test
	public void testGetCount() {
		Long buno = 107L;

		log.info(service.getTotalCount(buno));
	}

	@Test
	public void testUpdate() {
		ReplyDTO reply = ReplyDTO.builder().rno(107L).content("업데이트 테스트...").build();
		service.update(reply);
	}

	@Test
	public void testDelete() {
		Long rno = 107L;
		service.delete(rno);
	}

}
