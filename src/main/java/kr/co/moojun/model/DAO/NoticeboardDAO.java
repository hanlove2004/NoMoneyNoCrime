package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.NoticeboardDTO;

public interface NoticeboardDAO {
	int insertNoticeBoard(NoticeboardDTO dto); // 공지사항 쓰기

	List<NoticeboardDTO> getNoticeBoardList(HashMap map); // 공지게시판 리스트(여러개)

	NoticeboardDTO getNoticeBoard(int num); // 공지게시판 디테일(상세보기)

	int updateNoticeBoard(NoticeboardDTO dto); // 공지게시판 수정하기

	int deleteNoticeBoard(NoticeboardDTO dto); // 공지게시판 삭제하기

	int getNoticeBoardCount(); // 공지게시판 게시글의 수
}
