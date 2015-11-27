package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.EpilogueboardDTO;

public interface EpilogueboardDAO {
	
	void insertEpilogue(EpilogueboardDTO dto); //쓰기
	List<EpilogueboardDTO> getEpilogueList(HashMap map); //리스트(목록)
	EpilogueboardDTO getEpilogue(int num); //디테일(상세보기)
	
	int updateEpilogue(EpilogueboardDTO dto); //여행후기 수정하기
	int deleteEpilogue(EpilogueboardDTO dto); //여행후기 삭제하기
	
	int getEpilogueCount(); //여행후기 게시글의 수
	
}
