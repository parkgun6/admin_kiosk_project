package org.geon.userboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.geon.userboard.domain.UserBoardVO;

public interface UserBoardMapper {

	UserBoardVO read(Long bano);
	
	List<UserBoardVO> getList(@Param("page") int page,
						  @Param("perSheet") int perSheet,
						  @Param("category") String category ,
						  @Param("arr") String[] arr ,
						  @Param("keyword") String keyword
						  );
	
	//리스트 페이지메이커용
	int getTotalCount(@Param("category") String category ,
					  @Param("arr") String[] arr ,
					  @Param("keyword") String keyword
					  );
	
	
	void insertSelectKey(UserBoardVO board);
	
	void update(UserBoardVO board);
	
	void delete(Long bano);
	
	List<UserBoardVO> findByBano(Long bano);
}
