package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.MessageDTO;

public interface MessageDAO {
   int insertMessage(MessageDTO messagedto); // 쪽지 작성
   
   int deleteMessage(MessageDTO messagedto); // 쪽지 삭제
   
   List<MessageDTO> getMessageList(MessageDTO messagedto); // 쪽지 리스트
   
   MessageDTO getMessageDetail(MessageDTO messagedto); // 쪽지 디테일
   
   List<MessageDTO> messagelist(HashMap map);   // 모든 메세지 리스트
   
   List<MessageDTO> messagereceivelist(HashMap map);   // 받은 메세지 리스트
   
   int getReceiveMessageCount(String id); // 총 받은 메세지 수
   
   List<MessageDTO> messagesendlist(HashMap map);   // 보낸 메세지 리스트
   
   int getSendMessageCount(String id); // 총 보낸 메세지 수
}