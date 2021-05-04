package org.geon.common.security.service;

import java.util.ArrayList;
import java.util.List;

import org.geon.common.domain.AuthVO;
import org.geon.common.domain.MemberVO;
import org.geon.common.mapper.MemberMapper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class SecurityServiceImpl implements SecurityService{
	
	private final MemberMapper mapper;
	
	@Transactional
	public void insertMember(MemberVO member) {

		PasswordEncoder pe = new BCryptPasswordEncoder();
		
		member.setUserpw(pe.encode(member.getUserpw()));
		log.info("pw : " + member.getUserpw());
		
		List<AuthVO> authList = new ArrayList<AuthVO>();
		
		authList.add(new AuthVO(member.getUserid(),"ROLE_USER"));
		
		member.setAuthList(authList);
		
		mapper.insertMember(member);
		
		member.getAuthList().forEach(auth -> {
			log.info(auth);
			auth.setUserid(member.getUserid());
			log.info(auth);
			mapper.insertAuth(auth);
		});
	}
}
