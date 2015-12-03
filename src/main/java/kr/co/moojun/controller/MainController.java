package kr.co.moojun.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DTO.MemberDTO;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	@Qualifier("jsonview")
	private View jsonview;
		
	// main.htm 요청 들어오면 View 페이지 제공
	@RequestMapping("main.htm")
	public String main() {

		System.out.println("StartPage Display");

		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}

	// main.htm 요청 들어오면 View 페이지 제공
	@RequestMapping("submain.htm")
	public String submain() {

		System.out.println("SUBMAIN Display");

		// Tiles 적용 (UrlBase 방식)
		return "submain.main";
	}

	// 아이디 중복체크 (idcheck.htm)
	@RequestMapping(value = "idcheck.htm", method = RequestMethod.POST)
	public View idcheck(String id, Model model) {
		
		System.out.println("idcheck start");
		System.out.println(id);
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.getMemberDetail(id);

		System.out.println(memberdto);

		if (memberdto != null) {
			model.addAttribute("data", false); // 아이디 중복
		} else {
			model.addAttribute("data", true);
		}

		System.out.println("idcheck end");
		
		// Tiles 적용 (UrlBase 방식)
		return jsonview;
	}

}
