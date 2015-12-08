package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.WorkboardDTO;
import kr.co.moojun.model.DTO.WorkformDTO;

public interface WorkboardDAO {
   int insertWorkBoard(WorkboardDTO dto); // 일자리게시판 쓰기

   List<WorkboardDTO> getWorkBoardList(HashMap map); // 일자리게시판 리스트(여러개)

   WorkboardDTO getWorkBoard(int num); // 일자리게시판 디테일(상세보기)
   
   WorkformDTO getLoginidAgeName(String id); // 로그인한 아이디에 대한 만나이 (신청폼에서 사용)

   int updateWorkBoard(WorkboardDTO dto); // 일자리게시판 수정하기

   int deleteWorkBoard(int num); // 일자리게시판 삭제하기 (실제 삭제가 아니라 유효기간만료된 글을 리스트에서 안보이게 하는것)
   
   List<WorkboardDTO> checkboxSearch(HashMap map);   // checkboxsearch
   
   List<WorkboardDTO> buttonSearch(String searchvalue);   // buttonSearch

   int getWorkBoardCount(); // 일자리게시판 게시글의 수
   
   List<WorkboardDTO> getMyWorkAddList(HashMap map); // 내 일자리 등록 리스트
   
   int getMyWorkAddListCount(String id); // 내 일자리 등록 게시글의 수
   
   int deletemMyWorkboard(int num);   // 회원목록에서 등록 일자리 삭제
}