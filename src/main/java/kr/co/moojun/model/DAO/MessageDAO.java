package kr.co.moojun.model.DAO;

import java.util.HashMap;
import java.util.List;

import kr.co.moojun.model.DTO.MessageDTO;

public interface MessageDAO {
   int insertMessage(MessageDTO messagedto); // 쪽지 작성
   
   int deleteMessageBySender(int num); // 보낸사람이 쪽지 삭제
   
   int deleteMessageByReceiver(int num); // 받은사람이 쪽지 삭제
   
   List<MessageDTO> messagelist(HashMap map);   // 모든 메세지 리스트
   
   List<MessageDTO> messagereceivelist(HashMap map);   // 받은 메세지 리스트
   
   int getReceiveMessageCount(String id); // 총 받은 메세지 수
   
   List<MessageDTO> messagesendlist(HashMap map);   // 보낸 메세지 리스트
   
   int getSendMessageCount(String id); // 총 보낸 메세지 수
   
   int isMemberById(String id); // 아이디 존재 확인
   
   int getNewMessageCount(String id); // 새로운 메세지 수
   
}