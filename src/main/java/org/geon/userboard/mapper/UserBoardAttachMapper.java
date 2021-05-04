package org.geon.userboard.mapper;

import java.util.List;

import org.geon.userboard.domain.UserBoardVO;
import org.geon.common.dto.AttachFileDTO;

public interface UserBoardAttachMapper {

	void insert(AttachFileDTO dto);
	
	void delete(String uuid);
	
	List<UserBoardVO> findByBuno(Long buno);
}
