package org.geon.adminboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.geon.adminboard.domain.AdminBoardVO;

public interface AdminBoardMapper {

	AdminBoardVO read(Long bano);
	
	List<AdminBoardVO> getList(@Param("page") int page,
						  @Param("perSheet") int perSheet,
						  @Param("category") int category ,
						  @Param("arr") String[] arr ,
						  @Param("keyword") String keyword
						  );
	
	//리스트 페이지메이커용
	int getTotalCount(@Param("category") int category ,
					  @Param("arr") String[] arr ,
					  @Param("keyword") String keyword
					  );
	
	void insertSelectKey(AdminBoardVO board);
	
	void update(AdminBoardVO board);
	
	void delete(Long bano);
	
	List<AdminBoardVO> findByBano(Long bano);
}
