package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.EpilogueboardDTO;

public interface EpilogueboardDAO {
   
   int insertEpilogueBoard(EpilogueboardDTO dto); //여행후기 쓰기
   
   List<EpilogueboardDTO> getEpilogueBoardList(HashMap map); // 여행후기 리스트(목록)
   
   EpilogueboardDTO getEpilogueBoard(int num); // 여행후기 디테일(상세보기)
   
   int updateEpilogueBoard(EpilogueboardDTO dto); // 여행후기 수정하기
   
   int deleteEpilogueBoard(EpilogueboardDTO dto); //여행후기 삭제하기
   
   int getEpilogueBoardCount(); //여행후기 게시글의 수
   
   ////////////////////////////////////나의 여행 후기 관련 //////////////////////////////////////
   List<EpilogueboardDTO> getMyEpilogueBoardList(HashMap map); // 나의 여행후기 리스트(목록)
   
   int getMyEpilogueBoardCount(String id); // 나의 여행후기 게시글 수
   
   EpilogueboardDTO getMyEpilogueBoard(int num); // 여행후기 디테일(상세보기)
   ///////////////////////////////////////////////////////////////////////////////////////
   
   List<String> searchKeyword(String keyword); // keyword 비동기 리스트(목록)
   
   /////////////////////////////////////main 여행 후기 검색////////////////////////////////////
   List<EpilogueboardDTO> maingetEpilogueBoardList(HashMap map); // main여행후기 리스트(목록)
   
   int maingetEpilogueBoardCount(String keyword); //여행후기 게시글의 수
   //////////////////////////////////////////////////////////////////////////////////////
}