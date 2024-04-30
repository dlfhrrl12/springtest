package com.ezen.test.repository;

import com.ezen.test.domain.BoardVO;
import com.ezen.test.domain.PagingVO;

import java.util.List;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO getDetail(int bno);

	int update(BoardVO bvo);

	void delete(int bno);

	void readCountUp(int bno);

	int getTotal(PagingVO pgvo);

	int selectBno();




	void cmtFileCountUpdate();

	void FileCountUpdate();



}