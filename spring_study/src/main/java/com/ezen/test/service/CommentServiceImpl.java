package com.ezen.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.test.domain.CommentVO;
import com.ezen.test.repository.CommentDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class CommentServiceImpl implements CommentService {
	private final CommentDAO cdao;

	
	@Override
	public int post(CommentVO cvo) {
		log.info("post Service in");
		return cdao.post(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		log.info("comment Service in");
		return cdao.getList(bno);
	}

	@Override
	public int modify(CommentVO cvo) {
		log.info("modify Service in");
		return cdao.update(cvo);
	}

	@Override
	public int delete(int cno) {
		log.info("delete Service in");
		return cdao.delete(cno);
	}
	
	
}
