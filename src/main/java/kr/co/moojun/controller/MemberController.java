package kr.co.moojun.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DTO.MemberDTO;

@Controller
@RequestMapping("/main/")
public class MemberController {
	
	@Autowired
	private SqlSession sqlsession;
	/*
	//로그인(login.htm)
	@RequestMapping(value="login.htm",method=RequestMethod.GET)
	public String login(){
		
		System.out.println("LOGIN DISPLAY");
		// Tiles 적용 (UrlBase 방식)
		return "main.login";
	}
	*/
	//로그인 성공 (login.htm)
	/*@RequestMapping(value="login.htm",method=RequestMethod.POST)
	public String loginsuccess(@RequestParam(value="loginid", required=false) String id, 
							@RequestParam(value="loginpwd", required=false) String pwd) {
		
		System.out.println("로그인 성공");
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = new MemberDTO();
		
		memberdto.setId(id);
		memberdto.setPwd(pwd);
		
		int result = memberdao.loginMember(memberdto);
		System.out.println(result);
		if(result > 0){
			System.out.println("회원입니다.");
		}
		
		System.out.println("로그인 성공 끝");
		// Tiles 적용 (UrlBase 방식)
		return "submain.main";
	}*/
	
	//아이디, 비밀번호 찾기(searchinfo.htm)
	@RequestMapping(value="searchinfo.htm",method=RequestMethod.GET)
	public String searchform(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.searchform";
	}
	
	//아이디 찾기 성공 (serchid.htm)
	@RequestMapping(value="searchid.htm",method=RequestMethod.POST)
	public String searchidsuccess(String name , String email){
		
		System.out.println("searchidsuccess start");
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchIdByNameAndEmail(name , email);
		System.out.println(memberdto);
		if(memberdto != null){
			this.sendEmail(email, memberdto, true);
		}else{
			System.out.println("일치하는 정보 없음");
		}
		
		System.out.println("searchidsuccess end");
		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}
	
	//비밀번호 찾기 성공 (searchpwd.htm)
	@RequestMapping(value="searchpwd.htm",method=RequestMethod.POST)
	public String searchpwdsuccess(String id , String email){
		
		System.out.println("searchpwdsuccess start");
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchPwdByIdAndEmail(id , email);
		System.out.println(memberdto);
		if(memberdto != null){
			this.sendEmail(email, memberdto, false);
		}else{
			System.out.println("일치하는 정보 없음");
		}
		
		System.out.println("searchpwdsuccess end");
		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}
	/*
	//회원가입 (join.htm)
	@RequestMapping(value="join.htm",method=RequestMethod.GET)
	public String joinform(){
		
		System.out.println("joinform start");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.joinform";
	}
	*/
	//회원가입 성공 (join.htm)
	@RequestMapping(value="join.htm",method=RequestMethod.POST)
	public String joinsuccess(MemberDTO memberdto){
		
		System.out.println("joinsuccess start");
		System.out.println(memberdto.toString());
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.insertMember(memberdto);
		System.out.println("result : " + result);
		if(result > 0){
			memberdao.insertRoleAndMember(memberdto.getId(), "ROLE_USER");
		}else{
			System.out.println("insert 실패");
		}
		
		// Tiles 적용 (UrlBase 방식)
		System.out.println("joinsuccess end");
		return "main.start";
	}
	
	//회원 탈퇴 성공 (delete.htm)
	@RequestMapping(value="delete.htm",method=RequestMethod.POST)
	public String deletesuccess(MemberDTO memberdto){
		
		System.out.println("deletesuccess start");
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.deleteMember(memberdto);
		if(result > 0){
			System.out.println("회원탈퇴 성공");
		}else{
			System.out.println("회원탈퇴 실패");
		}
		
		System.out.println("deletesuccess end");
		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}
	
	// send email 함수
	public void sendEmail(String email, MemberDTO memberdto, boolean bool){
    	String host = "smtp.gmail.com"; //smtp 서버
    	String subject = "무전무죄 입니다.";
    	String fromName = "무전무죄 관리자";
    	String from = "gisubsub@gmail.com";
    	String to = email;
    	String content = "";
    	
    	if(bool)
    		content = "당신의 ID는" + memberdto.getId() + "입니다";
    	else
    		content = "당신의 PWD는" + memberdto.getPwd() + "입니다";
    	
    	try{
	    	Properties props = new Properties();
	    	
	    	props.put("mail.smtp.starttls.enable", "true");
	    	props.put("mail.transport.protocol", "smtp");
	    	props.put("mail.smtp.host", host);
	    	props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    	props.put("mail.smtp.port", "465");
	    	props.put("mail.smtp.user", from);
	    	props.put("mail.smtp.auth", "true");
	    	
	    	Session mailSession = Session.getInstance(props, 
	    			new javax.mail.Authenticator(){
	    					protected PasswordAuthentication getPasswordAuthentication(){
	    							return new PasswordAuthentication("gisubsub", "rltjqtjq7887");
	    					}
	    			});
	    	Message msg = new MimeMessage(mailSession);
	    	msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
    	
	    	InternetAddress[] address = { new InternetAddress(to)};
	    	msg.setRecipients(Message.RecipientType.TO, address); //받는 사람설정1
	    	msg.setSubject(subject);// 제목 설정
	    	msg.setSentDate(new java.util.Date());; //보내는 날짜 설정
	    	msg.setContent(content, "text/html;charset=UTF-8"); //내용 설정 (HTML 형식)
	    	
	    	Transport.send(msg); //메일 보내기
	    	
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
	
}
