package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.ReferenceDTO;

public interface ReferenceDAO {
	int insertReference(ReferenceDTO dto); // 레퍼런스 쓰기

	List<ReferenceDTO> getReferenceList(HashMap map); // 레퍼런스 리스트(여러개)

	ReferenceDTO getReference(int num); // 레퍼런스 디테일(상세보기)

	int updateReference(ReferenceDTO dto); // 레퍼런스 수정하기

	int deleteReference(ReferenceDTO dto); // 레퍼런스 삭제하기

	int getReferenceCount(); // 레퍼런스 게시글의 수
}
