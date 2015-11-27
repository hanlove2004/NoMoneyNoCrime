package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.Reply_NoticeDTO;

public interface Reply_NoticeDAO {
	int insertNoticeBoardReply(Reply_NoticeDTO dto); // 공지게시판 댓글 쓰기

	List<Reply_NoticeDTO> getNoticeBoardReplyList(int num); // 공지게시판 댓글 리스트(여러개)

	int updateNoticeBoardReply(Reply_NoticeDTO dto); // 공지게시판 댓글 수정하기

	int deleteNoticeBoardReply(Reply_NoticeDTO dto); // 공지게시판 댓글 삭제하기

	int getNoticeBoardReplyCount(); // 공지게시판 댓글  수
}
