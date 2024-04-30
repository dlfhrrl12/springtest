package com.ezen.test.service;


import com.ezen.test.domain.BoardDTO;
import com.ezen.test.domain.BoardVO;
import com.ezen.test.domain.PagingVO;

import java.util.List;

public interface BoardService {

	int insert(BoardDTO bdto);

	List<BoardVO> getList(PagingVO pgvo);

	BoardDTO getDetail(int bno);


	void delete(int bno);

	int getTotal(PagingVO pgvo);

	int removeFile(String uuid);

	void update(BoardDTO bdto);




	void cmtFileUpdate();




}
