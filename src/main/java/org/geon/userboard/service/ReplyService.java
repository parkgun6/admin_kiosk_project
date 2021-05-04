package org.geon.userboard.service;

import java.util.List;

import org.geon.userboard.domain.ReplyVO;
import org.geon.userboard.dto.ReplyDTO;

public interface ReplyService {

	Long insert(ReplyDTO replyDTO);
	
	List<ReplyDTO> getList(Long buno);
	
	int getTotalCount(Long buno);
	
	void update(ReplyDTO replyDTO);
	
	void delete(Long rno);
	
	default ReplyVO toDomain(ReplyDTO replyDTO) {
		ReplyVO reply = ReplyVO.builder()
				.rno(replyDTO.getRno())
				.buno(replyDTO.getBuno())
				.content(replyDTO.getContent())
				.writer(replyDTO.getWriter())
				.build();
		return reply;
	}
	
	default ReplyDTO toDTO(ReplyVO reply) {
		ReplyDTO dto = ReplyDTO.builder()
				.rno(reply.getRno())
				.buno(reply.getBuno())
				.content(reply.getContent())
				.writer(reply.getWriter())
				.regdate(reply.getRegdate())
				.updateDate(reply.getUpdateDate())
				.build();
		return dto;
	}
	
}
