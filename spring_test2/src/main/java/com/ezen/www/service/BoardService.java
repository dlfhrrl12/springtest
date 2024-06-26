package com.ezen.www.service;

import java.util.List;

import com.ezen.www.domain.BoardDTO;
import com.ezen.www.domain.BoardVO;
import com.ezen.www.domain.PagingVO;

public interface BoardService {


	List<BoardVO> getList(PagingVO pgvo);

	BoardDTO getDetail(int bno);

//	int update(BoardVO bvo);

	int delete(int bno);

	int getTotal(PagingVO pgvo);

	int insert(BoardDTO bdto);

	int removeFile(String uuid);

	int updateFile(BoardDTO boardDTO);


}
