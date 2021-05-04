package org.geon.adminboard.controller;

import javax.validation.Valid;

import org.geon.adminboard.dto.AdminBoardDTO;
import org.geon.adminboard.service.AdminBoardService;
import org.geon.common.dto.PageDTO;
import org.geon.common.dto.PageMaker;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@CrossOrigin
@Controller
@RequestMapping("/news")
@Log4j
@RequiredArgsConstructor
public class NewsController {

	private final AdminBoardService service;
	
	@GetMapping({"/","/notice"})
	public void list(@ModelAttribute("pageDTO")PageDTO pageDTO, Model model) {
		
		log.info("list......................");
		log.info(pageDTO);
		model.addAttribute("list", service.getPageList(pageDTO,1));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO,1)));
		
	}
	
	@GetMapping({"/read","/modify"})
	public void read(PageDTO pageDTO, Long bano, Model model) {
		log.info("bano : " + bano);
		log.info("PageDTO : " + pageDTO);
		
		model.addAttribute("board",service.readOne(bano));
		model.addAttribute("list",service.getPageList(pageDTO, 1));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO,1)));
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping(value="/register", produces = {"text/plain"})
	@ResponseBody
	@PreAuthorize("isAuthenticated()")
	public ResponseEntity<String> registerPost(@RequestBody @Valid AdminBoardDTO dto, BindingResult result){
		
		log.info("dto : " + dto);
		
		if(dto.getFileList() != null) {
			dto.getFileList().forEach(attach -> log.info(attach));
		}
		
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.register(dto);
		
		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}
	
	@PostMapping(value="/modify", produces = {"application/json"})
	@ResponseBody
	public ResponseEntity<String> updatePost(@RequestBody @Valid AdminBoardDTO dto, BindingResult result){
		
		log.info("dto :" + dto);
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.update(dto);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> deletePost(Long bano){
		log.info("remove bano :" + bano);
		
		service.delete(bano);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
