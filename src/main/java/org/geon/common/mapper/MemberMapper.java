package org.geon.common.mapper;

import org.geon.common.domain.AuthVO;
import org.geon.common.domain.MemberVO;

public interface MemberMapper {

	
	MemberVO read(String userid);
	
	void insertMember(MemberVO member);
	
	void insertAuth(AuthVO auth);
	
}
