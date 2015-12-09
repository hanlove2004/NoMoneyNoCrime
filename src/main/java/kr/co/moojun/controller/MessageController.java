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
	      
	   // main.htm 요청 들어오면 View 페이지 제공
	   @RequestMapping(value="sendmessage.htm" , method=RequestMethod.POST)
	   public View sendmessage(MessageDTO messagedto, Model model){

	      System.out.println("sendmessage start");
	      
	      System.out.println(messagedto.getContent());
	      System.out.println(messagedto.getSender());
	      System.out.println(messagedto.getReceiver());
	      
	      MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
	      int result = messagedao.insertMessage(messagedto);
	      if(result > 0){
	    	  System.out.println("message insert 성공");
	      }
	      return jsonview;
	   }
}
