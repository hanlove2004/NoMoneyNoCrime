package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.FreeboardDTO;

public interface FreeboardDAO {
	int insertFreeBoard(FreeboardDTO dto); // 자유게시판 쓰기
	
	List<FreeboardDTO> getFreeBoardList(HashMap map); // 자유게시판 목록(여러개)
	
	FreeboardDTO getFreeBoard(int num); //자유게시판 디테일(상세보기)
	
	int updateFreeBoard(FreeboardDTO dto); //자유게시판 수정하기
	
	int deleteFreeBoard(FreeboardDTO dto); //자유게시판 삭제하기
	
	int getFreeBoardCount(); // 자유게시판 게시글의 수
}
