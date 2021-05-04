package org.geon.userboard.service;

import java.util.List;
import java.util.stream.Collectors;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.domain.ReplyVO;
import org.geon.userboard.dto.ReplyDTO;
import org.geon.userboard.mapper.ReplyMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	private final ReplyMapper mapper;
	
	@Override
	public Long insert(ReplyDTO replyDTO) {
		ReplyVO reply = toDomain(replyDTO);
		return mapper.insert(reply);
	}

	@Override
	public List<ReplyDTO> getList(Long buno) {
		List<ReplyVO> result = mapper.getList(buno);
		return result.stream().map(reply -> toDTO(reply)).collect(Collectors.toList());
	}

	@Override
	public void update(ReplyDTO replyDTO) {
		ReplyVO reply = toDomain(replyDTO);
		mapper.update(reply);
	}

	@Override
	public void delete(Long rno) {
		mapper.delete(rno);
	}

	@Override
	public int getTotalCount(Long buno) {
		return mapper.getTotalCount(buno);
	}
	
	

}
