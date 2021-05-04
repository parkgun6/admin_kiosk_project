package org.geon.userboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.geon.userboard.domain.ReplyVO;

public interface ReplyMapper {

	List<ReplyVO> getList(@Param("buno") Long buno);
	
	int getTotalCount(Long buno);
	
	Long insert(ReplyVO reply);
	
	void update(ReplyVO reply);
	
	void delete(Long rno);
}
