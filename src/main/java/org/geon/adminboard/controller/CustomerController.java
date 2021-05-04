package org.geon.adminboard.controller;

import javax.validation.Valid;

import org.geon.adminboard.dto.AdminBoardDTO;
import org.geon.adminboard.service.AdminBoardService;
import org.geon.common.dto.PageDTO;
import org.geon.common.dto.PageMaker;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@RequestMapping("/customer")
@Log4j
@RequiredArgsConstructor
public class CustomerController {

	private final AdminBoardService service;

	@GetMapping({ "/{board}" })
	public void list(@PathVariable String board, @ModelAttribute("pageDTO") PageDTO pageDTO, Model model) {

		Integer category = 0;

		log.info(board);

		if (board.equals("faq")) {
			category = 2;
		} else if (board.equals("qna")) {
			category = 3;
		}

		log.info(category);

		log.info("list......................");

		model.addAttribute("list", service.getPageList(pageDTO, category));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO, category)));

	}

	@GetMapping({ "/{board}/read", "/modify" })
	public void read(@PathVariable String board, PageDTO pageDTO, Long bano, Model model) {
		log.info("bano : " + bano);
		log.info("PageDTO : " + pageDTO);
		
		Integer category = 0;

		log.info(board);

		if (board.equals("faq")) {
			category = 2;
		} else if (board.equals("qna")) {
			category = 3;
		}
		
		model.addAttribute("board", service.readOne(bano));
		model.addAttribute("list", service.getPageList(pageDTO, category));
		model.addAttribute("pageMaker", new PageMaker(pageDTO, service.getTotalCount(pageDTO, category)));
	}

	@PostMapping(value = "/register", produces = { "text/plain" })
	@ResponseBody
	public ResponseEntity<String> registerPost(@RequestBody @Valid AdminBoardDTO dto, BindingResult result) {

		log.info("dto : " + dto);

		if (result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		service.register(dto);

		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}

	@PostMapping(value = "/modify", produces = { "application/json" })
	@ResponseBody
	public ResponseEntity<String> updatePost(@RequestBody @Valid AdminBoardDTO dto, BindingResult result) {

		log.info("dto :" + dto);

		if (result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}

		service.update(dto);

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	@PostMapping("/remove")
	@ResponseBody
	public ResponseEntity<String> deletePost(Long bano) {
		log.info("bano :" + bano);

		service.delete(bano);

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
