package org.geon.userboard.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;
import java.util.stream.Collectors;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.domain.UserBoardVO;
import org.geon.userboard.dto.UserBoardDTO;
import org.geon.userboard.mapper.UserBoardAttachMapper;
import org.geon.userboard.mapper.UserBoardMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class UserBoardServiceImpl implements UserBoardService {

	private final UserBoardMapper mapper;
	
	private final UserBoardAttachMapper attachMapper;
	
	@Override
	public List<UserBoardDTO> getPageList(PageDTO pageDTO,String category) {
		
		return mapper.getList(
				pageDTO.getPage(), 
				pageDTO.getPerSheet(), 
				category,
				pageDTO.getArr(),
				pageDTO.getKeyword())
				.stream().map(board -> toDTO(board)).collect(Collectors.toList());
	}

	@Override
	public int getTotalCount(PageDTO pageDTO,String category) {
		return mapper.getTotalCount(
				category,
				pageDTO.getArr(),
				pageDTO.getKeyword());
	}

	@Transactional
	@Override
	public void register(UserBoardDTO boardDTO) {
		UserBoardVO board = toDomain(boardDTO);
		log.info("insertSelectKey : "+board);
		mapper.insertSelectKey(board);
		
		if(board.getFileList() == null || board.getFileList().size() <= 0) {
			return;
		}
		
		board.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setBuno(board.getBuno());
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public UserBoardDTO readOne(Long buno) {
		return toDTO(mapper.read(buno));
	}

	@Override
	public void update(UserBoardDTO boardDTO) {
		UserBoardVO board = toDomain(boardDTO);
		log.info(board);
		
		mapper.update(board);
		
		if(board.getFileList() == null || board.getFileList().size() <= 0) {
			return;
		}
		
		board.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setBuno(board.getBuno());
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public void delete(Long buno) {
		mapper.delete(buno);
	}

	
	
	
}
