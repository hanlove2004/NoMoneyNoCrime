package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.Reply_EpilogueDTO;

public interface Reply_EpilogueDAO {
	int insertEpilogueBoardReply(Reply_EpilogueDTO dto); // 여행후기게시판 댓글 쓰기

	List<Reply_EpilogueDTO> getEpilogueBoardReplyList(int num); // 여행후기게시판 댓글 리스트(여러개)

	int updateEpilogueBoardReply(Reply_EpilogueDTO dto); // 여행후기게시판 댓글 수정하기

	int deleteEpilogueBoardReply(Reply_EpilogueDTO dto); // 여행후기게시판 댓글 삭제하기

	int getEpilogueBoardReplyCount(); // 자유겟판 댓글  수
}
