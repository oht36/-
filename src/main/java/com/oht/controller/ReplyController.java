package com.oht.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.oht.domain.Criteria;
import com.oht.domain.ReplyPageDTO;
import com.oht.domain.ReplyVO;
import com.oht.service.ReplyService;

import lombok.AllArgsConstructor;

@RestController
@RequestMapping("/replies/")
@AllArgsConstructor
public class ReplyController {

	private ReplyService replyService;
	
	@PostMapping(value = "/new", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> insert(@RequestBody ReplyVO replyVO){
		
		int insertCount = replyService.insert(replyVO);
		
		return insertCount ==1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{bno}/{page}", produces = {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("page")int page, @PathVariable("bno")int bno){
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(replyService.list(cri, bno), HttpStatus.OK);
	}
	
	@DeleteMapping(value = "/{bno}/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> delete(@PathVariable("bno")int bno, @PathVariable("rno")int rno){
		
		int deleteCount = replyService.delete(bno, rno);
		
		return deleteCount==1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = "/{rno}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO replyVO, @PathVariable("rno")int rno){
		
		replyVO.setRno(rno);
		
		int modifyCount = replyService.modify(replyVO);
		
		return modifyCount==1? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
}
