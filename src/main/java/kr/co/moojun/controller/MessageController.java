package kr.co.moojun.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.MessageDAO;
import kr.co.moojun.model.DTO.MessageDTO;

@Controller
public class MessageController {

	 @Autowired
	   private SqlSession sqlsession;
	   
	   @Autowired
	   @Qualifier("jsonview")
	   private View jsonview;
	      
	   // sendmessage.htm
	   @RequestMapping(value="sendmessage.htm" , method=RequestMethod.POST)
	   public View sendmessage(MessageDTO messagedto, Model model){

	      System.out.println("sendmessage start");
	      System.out.println(messagedto.getSender());
	      System.out.println(messagedto.getReceiver());
	      System.out.println(messagedto.getContent());
	      
	      MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
	      if(messagedao.isMemberById(messagedto.getReceiver()) > 0){
	    	  int result = messagedao.insertMessage(messagedto);
		      if(result > 0){
		    	  System.out.println("message insert 성공");
		    	  model.addAttribute("resultmessage", "쪽지를 성공적으로 보냈습니다");
		      }  
	      }else{
	    	  model.addAttribute("resultmessage", "존재하지 않는 아이디 입니다. 다시 쪽지를 보내세요.");
	      }
	      
	      return jsonview;
	   }
	   
	   // deletemessage.htm
	   @RequestMapping(value="deletemessage.htm" , method=RequestMethod.POST)
	   public View deletemessage(String num, String listname, Model model){

	      System.out.println("deletemessage start");
	      System.out.println(listname);
	      MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
	      int result = 0;
	      if(listname.equals("sendlist")){
	    	  result = messagedao.deleteMessageBySender(Integer.parseInt(num));
	      }else if(listname.equals("receivelist")){
	    	  result = messagedao.deleteMessageByReceiver(Integer.parseInt(num));
	      }
	      
	      if(result > 0){
	    	  model.addAttribute("resultmessage", "쪽지가 삭제되었습니다.");
	      }
	      
	      return jsonview;
	   }
}
