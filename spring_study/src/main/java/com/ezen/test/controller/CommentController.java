package com.ezen.test.controller;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
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

import com.ezen.test.domain.CommentVO;
import com.ezen.test.service.CommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping("/comment/*")
@RestController
public class CommentController {
		private final CommentService csv;
		
		//ResponseEntity 객체 사용 : body내용 + httpStatus 상태
		//@RequestBody : body 값 추출
		//consumes : @RequestBody에서 가져오는 데이터의 형태
		//produces : 보내는 데이터 형식 / 나가는 타입 : MediaType
		//json : apllication/json / text : text_plain
		
		@PostMapping(value="/post", consumes="application/json", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> post(@RequestBody CommentVO cvo){
			log.info(">> cvo >> {}", cvo);
			int isOk = csv.post(cvo);
			return isOk > 0 ? new ResponseEntity<String>("1",HttpStatus.OK) : 
				new ResponseEntity<String>("0",HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@GetMapping(value = "/{bno}", produces = MediaType.APPLICATION_JSON_VALUE)
		public ResponseEntity<List<CommentVO>> list(@PathVariable("bno")int bno){
			log.info(">> bno >> {}", bno);
			List<CommentVO> list = csv.getList(bno);
			return new ResponseEntity<List<CommentVO>>(list, HttpStatus.OK);
		}
		
		@PutMapping(value="/modify", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> modify(@RequestBody CommentVO cvo){
			log.info(">> cvo >> {}", cvo);
			int isOk = csv.modify(cvo);
			return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK) :
				new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		@DeleteMapping(value = "/{cno}", produces = MediaType.TEXT_PLAIN_VALUE)
		public ResponseEntity<String> remove(@PathVariable("cno")int cno){
			int isOk = csv.delete(cno);
			
			return isOk > 0? new ResponseEntity<String>("1", HttpStatus.OK) :
				new ResponseEntity<String>("0", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		
		
		
		
		
}
