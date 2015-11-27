package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.Reply_FreeDTO;

public interface Reply_FreeDAO {
	int insertFreeBoardReply(Reply_FreeDTO dto); // 자유게시판 댓글 쓰기

	List<Reply_FreeDTO> getFreeBoardReplyList(int num); // 자유게시판 댓글 리스트(여러개)

	int updateFreeBoardReply(Reply_FreeDTO dto); // 자유게시판 댓글 수정하기

	int deleteFreeBoardReply(Reply_FreeDTO dto); // 자유게시판 댓글 삭제하기

	int getFreeBoardReplyCount(); // 자유겟판 댓글  수
}
