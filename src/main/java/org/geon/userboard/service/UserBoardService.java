package org.geon.userboard.service;

import java.util.List;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.domain.UserBoardVO;
import org.geon.userboard.dto.UserBoardDTO;

public interface UserBoardService {

	List<UserBoardDTO> getPageList(PageDTO pageDTO,String category);
	
	int getTotalCount(PageDTO pageDTO, String category);
	
	void register(UserBoardDTO boardDTO);
	
	UserBoardDTO readOne(Long buno);
	
	void update(UserBoardDTO boardDTO);
	
	void delete(Long buno);
	
	
	default UserBoardVO toDomain(UserBoardDTO dto) {
		return UserBoardVO.builder()
			.buno(dto.getBuno())
			.title(dto.getTitle())
			.content(dto.getContent())
			.writer(dto.getWriter())
			.category(dto.getCategory())
			.enabled(dto.getEnabled())
			.regdate(dto.getRegdate())
			.updateDate(dto.getUpdateDate())
			.fileList(dto.getFileList())
			.build();
			
	}
	
	default UserBoardDTO toDTO(UserBoardVO board) {

		UserBoardDTO dto = new UserBoardDTO();
		dto.setBuno(board.getBuno());
		dto.setTitle(board.getTitle());
		dto.setContent(board.getContent());
		dto.setWriter(board.getWriter());
		dto.setCategory(board.getCategory());
		dto.setEnabled(board.getEnabled());
		dto.setRegdate(board.getRegdate());
		dto.setUpdateDate(board.getUpdateDate());
		dto.setFileList(board.getFileList());
		return dto;
	}
}
