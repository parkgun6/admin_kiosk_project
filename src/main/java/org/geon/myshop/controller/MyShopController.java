package org.geon.myshop.controller;


import javax.validation.Valid;

import org.geon.myshop.dto.MenuDTO;
import org.geon.myshop.dto.MyShopDTO;
import org.geon.myshop.service.MyShopService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myshop")
@Log4j
@RequiredArgsConstructor
public class MyShopController {

	private final MyShopService service;
	
	@GetMapping({"/","/main"})
	public void main() {
		log.info("test......................");
	}
	
	@GetMapping({"/{userid}/intro"})
	public String intro(@PathVariable String userid, Model model) {
		log.info("test......................");
		log.info("userid : " + userid);
		model.addAttribute("intro", service.getShop(userid));
		
		return "/myshop/intro";
	}
	
	@GetMapping({"/{userid}/intro/modify"})
	public String introModifyGET(@PathVariable String userid, Model model) {
		log.info("test......................");
		log.info("userid : " + userid);
		model.addAttribute("intro", service.getShop(userid));
		
		return "/myshop/intro/modify";
	}
	
	@PostMapping(value="/intro/modify", produces = {"application/json"})
	@ResponseBody
	public ResponseEntity<String> modifyPOST(@RequestBody @Valid MyShopDTO dto, BindingResult result){
		
		log.info("dto :" + dto);
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.updateInfo(dto);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping({"/{userid}/event"})
	public String event(@PathVariable String userid, Model model) {
		log.info("test......................");
		log.info("userid : " + userid);
		model.addAttribute("event", service.getShop(userid));
		
		return "/myshop/event";
	}
	
	@GetMapping({"/{userid}/event/modify"})
	public String eventModifyGET(@PathVariable String userid, Model model) {
		log.info("test......................");
		log.info("userid : " + userid);
		model.addAttribute("event", service.getShop(userid));
		
		return "/myshop/event/modify";
	}
	
	@PostMapping(value="/event/modify", produces = {"application/json"})
	@ResponseBody
	public ResponseEntity<String> evnetModifyPOST(@RequestBody @Valid MyShopDTO dto, BindingResult result){
		
		log.info("dto :" + dto);
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.updateGuide(dto);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping({"/{userid}/info"})
	public String info(@PathVariable String userid, Model model) {
		log.info("test......................");
		log.info("userid : " + userid);
		log.info(service.getShop(userid));
		model.addAttribute("info", service.getShop(userid));
		
		return "/myshop/info";
	}
	
	@GetMapping({"/{userid}/info/modify"})
	public String infoModifyGET(@PathVariable String userid, Model model) {
		log.info("test......................");
		model.addAttribute("info", service.getShop(userid));
		
		return "/myshop/info/modify";
	}
	
	@PostMapping(value="/info/modify", produces = {"application/json"})
	@ResponseBody
	public ResponseEntity<String> infoModifyPOST(@RequestBody @Valid MyShopDTO dto, BindingResult result){
		
		log.info("dto :" + dto);
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.updateStore(dto);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
	@GetMapping({"/{sno}/menu"})
	public String menu(@PathVariable Long sno, Model model) {
		log.info("menu......................");
		
		model.addAttribute("menu",service.getList(sno));
		
		return "/myshop/menu";
	}
	
	@GetMapping("/menu/register")
	public void register() {
		
	}
	
	@PostMapping(value="/menu/register", produces = {"text/plain"})
	@ResponseBody
	public ResponseEntity<String> registerMenuPost(@RequestBody @Valid MenuDTO dto, BindingResult result){
		
		log.info("dto : " + dto);
		
		if(dto.getFileList() != null) {
			dto.getFileList().forEach(attach -> log.info(attach));
		}
		
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.insertMenu(dto);
		
		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}
	
	@GetMapping({"/menu/{mno}/modify"})
	public String menuModifyGET(@PathVariable Long mno, Model model) {
		log.info("modify......................");
		model.addAttribute("menu", service.getOne(mno));
		
		return "/myshop/menu/modify";
	}
	
	@PostMapping(value="/menu/modify", produces = {"text/plain"})
	@ResponseBody
	public ResponseEntity<String> modifyMenu(@RequestBody @Valid MenuDTO dto, BindingResult result){
		
		log.info("dto : " + dto);
		
		if(dto.getFileList() != null) {
			dto.getFileList().forEach(attach -> log.info(attach));
		}
		
		
		if(result.hasErrors()) {
			log.info(result.getAllErrors());
			return new ResponseEntity<String>("failed", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		service.updateMenu(dto);
		
		return new ResponseEntity<String>("succcess", HttpStatus.OK);
	}
	
	@PostMapping("/menu/remove")
	@ResponseBody
	public ResponseEntity<String> deletePost(Long mno){
		log.info("remove mno :" + mno);
		
		service.deleteMenu(mno);
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	
}
