package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.WorkformDTO;

public interface WorkformDAO {
	int insertWorkform(WorkformDTO Workformdto); // 일자리신청폼 작성

	int deleteWorkform(WorkformDTO Workformdto); // 일자리신청폼 삭제

	List<WorkformDTO> getWorkformList(WorkformDTO Workformdto); // 일자리신청폼 리스트

	WorkformDTO getWorkformDetail(WorkformDTO Workformdto); // 일자리신청폼 디테일
}
