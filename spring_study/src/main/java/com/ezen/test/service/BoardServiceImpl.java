package com.ezen.test.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezen.test.domain.BoardDTO;
import com.ezen.test.domain.BoardVO;
import com.ezen.test.domain.FileVO;
import com.ezen.test.domain.PagingVO;
import com.ezen.test.repository.BoardDAO;
import com.ezen.test.repository.FileDAO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequiredArgsConstructor
@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardDAO bdao;
	private final FileDAO fdao;
	
	@Override
	public int insert(BoardDTO bdto) {
		log.info(">>> Board register service check!!");
		int isOk = bdao.insert(bdto.getBvo());
		
		//file 처리 => bno는 아직 없음
		if(bdto.getFlist() == null) {
			return isOk;
		}else {
			// 파일 저장
			if(isOk > 0 && bdto.getFlist().size()>0) {
				//bno는 아직 없음. 
				//insert를 통해 자동생성 => DB에 가서 검색해오기.
				int bno = bdao.selectBno();
				for(FileVO fvo : bdto.getFlist()) {
					fvo.setBno(bno);
					//파일저장
					isOk *= fdao.insertFile(fvo);
				}
			}
		}
		return isOk; 
	}



	@Override
	public BoardDTO getDetail(int bno) {
		log.info(">>> Board detail service check!!");
		//read_count 증가
		bdao.readCountUp(bno);
		BoardDTO bdto = new BoardDTO();
		BoardVO bvo = bdao.getDetail(bno); //기존에 처리된 bvo 객체
		bdto.setBvo(bvo);
		bdto.setFlist(fdao.getFileList(bno)); //bno에 해당하는 모든 파일 리스트 검색
		return bdto;
	}

	@Override
	public void update(BoardDTO bdto) {
		log.info(">>> Board update service check!!");
		//파일 추가작업
		//bvo => boardMapper / flist => fileMapper
		
		int isOk = bdao.update(bdto.getBvo());
		//파일 값이 없다면..
		if(bdto.getFlist() == null) {
			return;
		}
		
		//bvo 업데이트 완료 후 파일도 있다면... 파일 추가
		if(isOk > 0 && bdto.getFlist().size()>0) {
			//bno setting
			for(FileVO fvo : bdto.getFlist()) {
				fvo.setBno(bdto.getBvo().getBno());
				isOk *= fdao.insertFile(fvo);
			}
		}
	}

	@Override
	public void delete(int bno) {
		log.info(">>> Board delete service check!!");
		bdao.delete(bno);
	}

	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		log.info(">>> Board list service check!!");
		return bdao.getList(pgvo);
	}


	@Override
	public int getTotal(PagingVO pgvo) {
		log.info(">>> Board getTotal service check!!");
		return bdao.getTotal(pgvo);
	}



	@Override
	public int removeFile(String uuid) {
		// TODO Auto-generated method stub
		return fdao.removeFile(uuid);
	}










	@Override
	public void cmtFileUpdate() {
		// TODO Auto-generated method stub
		bdao.cmtFileCountUpdate();
		bdao.FileCountUpdate();
	}


		
	







	
}
