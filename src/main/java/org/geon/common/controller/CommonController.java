package org.geon.common.controller;

import javax.validation.Valid;

import org.geon.common.domain.MemberVO;
import org.geon.common.security.service.SecurityService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class CommonController {
	
	private final SecurityService service;

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("accessDenied : " + auth);
		model.addAttribute("msg", "권한이 없는 사용자입니다.");
	}
	
	@GetMapping("/login")
	//에러와 로그아웃은 파라미터로 무조건 받아야한다.
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error : "+ error);
		log.info("logout : "+ logout);
		
		//로그아웃
		if(logout != null) {
			model.addAttribute("logout","LogOut !!!");
		}
	}
	
	@GetMapping("/logout")
	//로그아웃은 파라미터에 들어가는것이 없다.
	public void customLogout() {
		
	}
	
	@GetMapping("/signup")
	public void signup() {
		
	}
	
	@PostMapping(value="/signup", produces = {"text/plain"})
	@ResponseBody
	public ResponseEntity<String> registerMenuPost(@RequestBody @Valid MemberVO vo, BindingResult result){
		
		log.info("vo : " + vo);
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.insertMember(vo);
		
		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}
}
