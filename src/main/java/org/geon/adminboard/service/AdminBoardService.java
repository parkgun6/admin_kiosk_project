package org.geon.adminboard.service;

import java.util.List;

import org.geon.adminboard.domain.AdminBoardVO;
import org.geon.adminboard.dto.AdminBoardDTO;
import org.geon.common.dto.PageDTO;

public interface AdminBoardService {

	List<AdminBoardDTO> getPageList(PageDTO pageDTO,Integer category);
	
	int getTotalCount(PageDTO pageDTO, Integer category);
	
	void register(AdminBoardDTO boardDTO);
	
	AdminBoardDTO readOne(Long bano);
	
	void update(AdminBoardDTO boardDTO);
	
	void delete(Long bano);
	
	
	default AdminBoardVO toDomain(AdminBoardDTO dto) {
		return AdminBoardVO.builder()
			.bano(dto.getBano())
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
	
	default AdminBoardDTO toDTO(AdminBoardVO board) {

		AdminBoardDTO dto = new AdminBoardDTO();
		dto.setBano(board.getBano());
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
