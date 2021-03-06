package kr.co.moojun.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

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
	
	@Autowired
	@Qualifier("jsonview")
	private View jsonview;
	
	//아이디 찾기 성공 (serchid.htm)
	@RequestMapping(value="searchid.htm",method=RequestMethod.POST)
	public String searchidsuccess(String searchname, String searchidemail){
		
		System.out.println("searchidsuccess start");
		
		SimpleMailMessage msg = new SimpleMailMessage(templateMessage); // 메일생성
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchIdByNameAndEmail(searchname , searchidemail);
		System.out.println(memberdto);
		if(memberdto != null){
			// 메일 발송
			msg.setTo(searchidemail); // to
			msg.setText(searchname+" 님의 아이디는 "+memberdto.getId()+" 입니다."); //content
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
	public String searchpwdsuccess(String searchpwdid , String searchpwdemail){
		
		System.out.println("searchpwdsuccess start");
		System.out.println(searchpwdid + "/" + searchpwdemail);
		SimpleMailMessage msg = new SimpleMailMessage(templateMessage); // 메일생성
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.searchPwdByIdAndEmail(searchpwdid , searchpwdemail);
		System.out.println(memberdto);
		if(memberdto != null){
			// 메일 발송
			msg.setTo(searchpwdemail); // to
			msg.setText(searchpwdid + " 님의 비밀번호는 "+memberdto.getPwd()+" 입니다."); //content
			mailSender.send(msg); // 메일발송
			System.out.println("메일이 발송 되었습니다.");
		}else{
			System.out.println("일치하는 정보 없음");
		}
		
		System.out.println("searchpwdsuccess end");
		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}
	
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
	
	/*//회원 탈퇴 성공 (delete.htm)
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
	}*/
	
	//???
	// 귀인만나기 게시판 회원 아이디에서 회원정보 보기(getmemberinfo.htm)
	@RequestMapping(value="getmemberinfo.htm" , method=RequestMethod.POST)
	public View sendmessage(String id, Model model){

		System.out.println("sendmessage start");

		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.getMemberDetail(id);

		model.addAttribute("memberdto", memberdto);

		return jsonview;
   }
	
}
