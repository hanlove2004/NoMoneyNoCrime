package kr.co.moojun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DTO.MemberDTO;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	@Qualifier("jsonview")
	private View jsonview;

	// 회원 목록 (memberlist.htm)
	@RequestMapping(value = "memberlist.htm", method = RequestMethod.GET)
	public String memberlist(HttpServletRequest request, Model model) {
		System.out.println("memberlist 시작");

		int pg = 1; // 처음 시작페이지

		String strPg = request.getParameter("pg"); // view에서 넘긴 시작페이지

		// request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 9; // 한번에 볼 수 있는 글의 수
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		// mapper 설정
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		// 총 게시물수
		int total = memberdao.getMemberCount();

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
		// [10] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);

		List<MemberDTO> memberlist = memberdao.getMemberList(map);

		model.addAttribute("memberlist", memberlist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		System.out.println("------------------------------------------------");
		System.out.println("시작             : " + start + " 끝:" + end);
		System.out.println("전체회원의 수         : " + total);
		System.out.println("처음 시작페이지       : " + pg);
		System.out.println("페이지수          : " + allPage);
		System.out.println("한페이지에 보여줄 범위     : " + block);
		System.out.println("보여줄 페이지의 시작    : " + fromPage);
		System.out.println("보여줄 페이지의 끝       : " + toPage);
		System.out.println("List<MemberDTO> memberlist");

		for (MemberDTO dto : memberlist) {
			System.out.println(dto.toString());
		}
		System.out.println("-------------------------------------------------");

		System.out.println("memberlist 끝");
		
		// Tiles 적용 (UrlBase 방식)
		return "admin.memberlist";
	}
	
	// 상세보기 (memberdetail.htm)
	@RequestMapping(value = "memberdetail.htm", method = RequestMethod.POST)
	public View memberdetail(int num, ModelMap modelmap) {
		System.out.println("memberdetail start");
		System.out.println(num);
		
		MemberDAO memberdao =  sqlsession.getMapper(MemberDAO.class);
		MemberDTO memberdto = memberdao.admingetMemberDetail(num);
		System.out.println(memberdto.toString());
		
		modelmap.addAttribute("memberdto",memberdto);
       
		System.out.println("memberdetail end");
       
		return jsonview;
	}

	//회원 강퇴(memberdelete.htm)
	@RequestMapping(value="memberdelete.htm",method=RequestMethod.GET)
	public String memberdelete(int num){
		
		System.out.println("회원 강퇴 start");
		
		//mapper 설정
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		
		//회원 탈퇴 처리
		int result = memberdao.admindeleteMember(num);
		if(result > 0){
			System.out.println("회원 강퇴 성공");
		}else{
			System.out.println("회원 강퇴 실패");
		}
		
		System.out.println("회원 강퇴 end");
		
		// Tiles 적용 (UrlBase 방식)
		return "redirect:memberlist.htm";
	}
	
	
}
