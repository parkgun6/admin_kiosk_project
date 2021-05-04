package org.geon.common.security;

import org.geon.common.domain.MemberVO;
import org.geon.common.mapper.MemberMapper;
import org.geon.common.security.domain.CustomUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//로그찍히는지만확인
		log.warn("Load User By UserName : " + username);
		
		MemberVO vo = memberMapper.read(username);
		
		log.warn("vo : " + vo);
		
		return vo == null? null: new CustomUser(vo);
	}


}
