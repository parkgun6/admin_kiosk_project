package org.geon.adminboard.mapper;

import java.util.List;

import org.geon.adminboard.domain.AdminBoardVO;
import org.geon.common.dto.AttachFileDTO;

public interface AdminBoardAttachMapper {

	void insert(AttachFileDTO dto);
	
	void delete(String uuid);
	
	List<AdminBoardVO> findByBano(Long bano);
}
