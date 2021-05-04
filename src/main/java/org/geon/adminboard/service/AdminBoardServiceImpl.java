package org.geon.adminboard.service;

import java.util.List;
import java.util.stream.Collectors;

import org.geon.adminboard.domain.AdminBoardVO;
import org.geon.adminboard.dto.AdminBoardDTO;
import org.geon.adminboard.mapper.AdminBoardAttachMapper;
import org.geon.adminboard.mapper.AdminBoardMapper;
import org.geon.common.dto.PageDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class AdminBoardServiceImpl implements AdminBoardService {

	private final AdminBoardMapper mapper;
	
	private final AdminBoardAttachMapper attachMapper;
	
	@Override
	public List<AdminBoardDTO> getPageList(PageDTO pageDTO,Integer category) {
		
		return mapper.getList(
				pageDTO.getPage(), 
				pageDTO.getPerSheet(), 
				category,
				pageDTO.getArr(),
				pageDTO.getKeyword())
				.stream().map(board -> toDTO(board)).collect(Collectors.toList());
	}

	@Override
	public int getTotalCount(PageDTO pageDTO,Integer category) {
		return mapper.getTotalCount(
				category,
				pageDTO.getArr(),
				pageDTO.getKeyword());
	}

	@Transactional
	@Override
	public void register(AdminBoardDTO boardDTO) {
		AdminBoardVO board = toDomain(boardDTO);
		log.info("insertSelectKey : "+board);
		mapper.insertSelectKey(board);
		
		if(board.getFileList() == null || board.getFileList().size() <= 0) {
			return;
		}
		
		board.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setBano(board.getBano());
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public AdminBoardDTO readOne(Long bano) {
		return toDTO(mapper.read(bano));
	}

	@Override
	public void update(AdminBoardDTO boardDTO) {
		AdminBoardVO board = toDomain(boardDTO);
		log.info(board);
		
		mapper.update(board);
		
		if(board.getFileList() == null || board.getFileList().size() <= 0) {
			return;
		}
		
		board.getFileList().forEach(attach -> {
			log.info(attach);
			attach.setBano(board.getBano());
			log.info(attach);
			attachMapper.insert(attach);
		});
	}

	@Override
	public void delete(Long bano) {
		mapper.delete(bano);
	}

	
	
	
}
