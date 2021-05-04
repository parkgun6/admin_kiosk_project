package org.geon.userboard.controller;

import java.util.List;

import org.geon.common.dto.PageDTO;
import org.geon.userboard.dto.ReplyDTO;
import org.geon.userboard.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/replies/")
@Log4j
@RequiredArgsConstructor
public class ReplyController {

	private final ReplyService service;
	

    @GetMapping(value = "/board/{buno}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<ReplyDTO>> getListByBoard(@PathVariable("buno") Long buno){
    	
        log.info("buno: " + buno);

        return new ResponseEntity<>( service.getList(buno), HttpStatus.OK);

    }


    @PostMapping(value="/register",produces="application/json")
    public ResponseEntity<Long> register(@RequestBody ReplyDTO replyDTO){

        log.info(replyDTO);

        Long rno = service.insert(replyDTO);

        return new ResponseEntity<>(rno, HttpStatus.OK);
    }

    @DeleteMapping("/{rno}")
    public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {

        log.info("Delete RNO:" + rno );

        service.delete(rno);

        return new ResponseEntity<>("success", HttpStatus.OK);

    }

    @PutMapping("/{rno}")
    public ResponseEntity<String> modify(@RequestBody ReplyDTO replyDTO) {

        log.info(replyDTO);

        service.update(replyDTO);

        return new ResponseEntity<>("success", HttpStatus.OK);

    }


}
