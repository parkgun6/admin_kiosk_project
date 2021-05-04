package org.geon.time.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("select sysdate from dual")
	String getNow();
	
	String getNow2();
	
}
