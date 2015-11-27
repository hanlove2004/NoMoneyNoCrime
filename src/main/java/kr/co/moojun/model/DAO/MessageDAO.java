package kr.co.moojun.model.DAO;

import java.util.List;

import kr.co.moojun.model.DTO.MessageDTO;

public interface MessageDAO {
	int insertMessage(MessageDTO messagedto); // 쪽지 작성
	
	int deleteMessage(MessageDTO messagedto); // 쪽지 삭제
	
	List<MessageDTO> getMessageList(MessageDTO messagedto); // 쪽지 리스트
	
	MessageDTO getMessageDetail(MessageDTO messagedto); // 쪽지 디테일
	
	
}
