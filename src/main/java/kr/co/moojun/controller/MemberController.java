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
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
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
	
	@Autowired
	private MailSender mailSender;
	@Autowired
	private SimpleMailMessage templateMessage;
	
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
	
	/*//아이디, 비밀번호 찾기(searchinfo.htm)
	@RequestMapping(value="searchinfo.htm",method=RequestMethod.GET)
	public String searchform(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.searchform";
	}*/
	
	//아이디 찾기 성공 (serchid.htm)
	@RequestMapping(value="searchid.htm",method=RequestMethod.POST)
	public String searchidsuccess(String name , String email){
		
		System.out.println("searchidsuccess start");
		
		SimpleMailMessage msg = new SimpleMailMessage(templateMessage); // 메일생성
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchIdByNameAndEmail(name , email);
		System.out.println(memberdto);
		if(memberdto != null){
			// 메일 발송
			msg.setTo(email); // to
			msg.setText(name+" 님의 아이디는 "+memberdto.getId()+" 입니다."); //content
			mailSender.send(msg); // 메일발송
			System.out.println("메일이 발송 되었습니다.");
		}else{
			System.out.println("일치하는 정보 없음");
		}
		
		System.out.println("searchidsuccess end");
		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}
	
	//비밀번호 찾기 성공 (searchpwd.htm)
	@RequestMapping(value="searchpwd.htm",method=RequestMethod.POST)
	public String searchpwdsuccess(String searchid , String email){
		
		System.out.println("searchpwdsuccess start");
		System.out.println(searchid + "/" + email);
		SimpleMailMessage msg = new SimpleMailMessage(templateMessage); // 메일생성
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchPwdByIdAndEmail(searchid , email);
		System.out.println(memberdto);
		if(memberdto != null){
			// 메일 발송
			msg.setTo(email); // to
			msg.setText(searchid + " 님의 비밀번호는 "+memberdto.getPwd()+" 입니다."); //content
			mailSender.send(msg); // 메일발송
			System.out.println("메일이 발송 되었습니다.");
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
		return "redirect:/main.htm";
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
	
}
