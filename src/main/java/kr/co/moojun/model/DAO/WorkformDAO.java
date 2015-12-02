package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.WorkformDTO;

public interface WorkformDAO {
	
   int insertWorkform(WorkformDTO Workformdto); // 일자리신청폼 작성

   WorkformDTO getWorkformDetail(int num); // 일자리신청폼 디테일
   
}