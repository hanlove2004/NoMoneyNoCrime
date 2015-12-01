package kr.co.moojun.controller;

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
	
	//로그인(login.htm)
	@RequestMapping(value="login.htm",method=RequestMethod.GET)
	public String login(){
		
		System.out.println("LOGIN DISPLAY");
		// Tiles 적용 (UrlBase 방식)
		return "main.login";
	}
	
	//로그인 성공 (login.htm)
	@RequestMapping(value="login.htm",method=RequestMethod.POST)
	public String loginsuccess(String id, String pwd){
		
		System.out.println("");
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.loginMember(id, pwd);
		System.out.println(result);
		if(result > 0){
			System.out.println("회원입니다.");
		}
		// Tiles 적용 (UrlBase 방식)
		return "submain.main";
	}
	
	//아이디, 비밀번호 찾기(searchinfo.htm)
	@RequestMapping(value="searchinfo.htm",method=RequestMethod.GET)
	public String searchform(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.searchform";
	}
	
	//아이디 찾기 성공 (serchid.htm)
	@RequestMapping(value="searchid.htm",method=RequestMethod.POST)
	public String searchidsuccess(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.login";
	}
	
	//비밀번호 찾기 성공 (searchpwd.htm)
	@RequestMapping(value="searchpwd.htm",method=RequestMethod.POST)
	public String searchpwdsuccess(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.login";
	}
	
	//회원가입 (join.htm)
	@RequestMapping(value="join.htm",method=RequestMethod.GET)
	public String joinform(){
		
		System.out.println("joinform start");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.joinform";
	}
	
	//회원가입 성공 (join.htm)
	@RequestMapping(value="join.htm",method=RequestMethod.POST)
	public String joinsuccess(MemberDTO memberdto){
		
		System.out.println("joinsuccess start");
		System.out.println(memberdto.toString());
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		memberdao.insetMember(memberdto);
		
		// Tiles 적용 (UrlBase 방식)
		System.out.println("joinsuccess end");
		return "main.start";
	}
	
	//사용방법 (howtouse.htm)
	@RequestMapping(value="howtouse.htm",method=RequestMethod.GET)
	public String howtouse(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "main.howtouse";
	}
	
}
