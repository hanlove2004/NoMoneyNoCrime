package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.MatchingDTO;

public interface MatchingDAO {
	int insertMatching(MatchingDTO dto); // 매칭 추가
	
	List<MatchingDTO> getMatchingList(String owner); // 매칭 현황 리스트 
	
	int updateMatchingState(int num , String state); // 매칭상태 수정하기
	
}
