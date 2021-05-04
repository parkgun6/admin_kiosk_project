package org.geon.userboard.controller;


import javax.validation.Valid;

import org.geon.common.dto.PageDTO;
import org.geon.common.dto.PageMaker;
import org.geon.userboard.dto.UserBoardDTO;
import org.geon.userboard.service.UserBoardService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/community")
@Log4j
@RequiredArgsConstructor
public class CommunityController {

	private final UserBoardService service;

	@GetMapping({ "/{category}" })
	public void list(@PathVariable String category, @ModelAttribute("pageDTO") PageDTO pageDTO, Model model) {

		log.info(category);

		log.info("list......................");

		model.addAttribute("list", service.getPageList(pageDTO, category));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO, category)));

	}

	@GetMapping({ "/{category}/read", "/{category}/modify" })
	public void read(@PathVariable String category, PageDTO pageDTO, Long buno, Model model) {
		log.info("buno : " + buno);
		log.info("PageDTO : " + pageDTO);
		log.info(category);
		
		model.addAttribute("board", service.readOne(buno));
		model.addAttribute("list", service.getPageList(pageDTO, category));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO, category)));
	}

	@GetMapping("/{category}/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping(value = "/{category}/register", produces = { "text/plain" })
	@ResponseBody
	public ResponseEntity<String> registerPost(@RequestBody @Valid UserBoardDTO dto,@PathVariable String category, BindingResult result) {

		log.info("dto : " + dto);
		

		if (result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		dto.setCategory(category);
		service.register(dto);

		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}

	@PostMapping(value = "/{category}/modify", produces = { "application/json" })
	@ResponseBody
	public ResponseEntity<String> updatePost(@RequestBody @Valid UserBoardDTO dto, BindingResult result) {

		log.info("dto :" + dto);

		if (result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		service.update(dto);

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@PostMapping("/{category}/remove")
	@ResponseBody
	public ResponseEntity<String> deletePost(Long buno) {
		log.info("buno :" + buno);

		service.delete(buno);

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}