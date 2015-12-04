package kr.co.moojun.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DAO.WorkboardDAO;
import kr.co.moojun.model.DTO.MemberDTO;
import kr.co.moojun.model.DTO.ReferenceDTO;
import kr.co.moojun.model.DTO.WorkboardDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	private SqlSession sqlsession;

	// 마이페이지 회원정보 (memberinfo.htm)
	@RequestMapping(value = "memberinfo.htm", method = RequestMethod.GET)
	public String memberinfo(String id, Model model, HttpServletRequest request, Principal principal) {

		System.out.println("memberinfo 시작");
		
		//mapper 설정
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		
		//LOGIN 상태인 id 받아오기
		id = principal.getName();
		System.out.println(id);
		
		//회원정보 상세보기
		MemberDTO memberdto = memberdao.getMemberDetail(id);
		
		System.out.println(memberdto.toString());
		model.addAttribute("memberdto", memberdto);
		
		System.out.println("memberinfo 끝");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberinfo";
	}
	
	// 마이페이지 회원정보 수정 (memberupdate.htm)
	@RequestMapping(value = "memberupdate.htm", method = RequestMethod.GET)
	public String memberupdate(String id, Model model, Principal principal) {

		System.out.println("memberupdate 시작");
		
		//mapper 설정
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		
		//LOGIN 상태인 id 받아오기
		id = principal.getName();
		System.out.println(id);
		
		//회원정보 수정정보 상세보기 (readonly 부분)
		MemberDTO memberdto = memberdao.getMemberDetail(id);
		
		System.out.println(memberdto.toString());
		model.addAttribute("memberdto", memberdto);
		
		System.out.println("memberupdate 끝");
		
		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberupdate";
	}

	// 마이페이지 회원정보 수정 성공 (memberupdate.htm)
	@RequestMapping(value = "memberupdate.htm", method = RequestMethod.POST)
	public String memberupdatesuccess(MemberDTO dto, Model model) {

		System.out.println("memberupdatesuccess 시작");
		
		//result 1 : 수정성공, result 0 : 수정 실패
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.updateMember(dto);
		
		System.out.println("memberupdate result : " + result);
		
		model.addAttribute("result" + result);
		
		System.out.println("memberupdatesuccess 끝");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberinfo";
	}

	// 마이페이지 회원탈퇴 (memberdelete.htm)
	@RequestMapping(value = "memberdelete.htm", method = RequestMethod.POST)
	public String memberdelete(MemberDTO dto, Model model) {

		System.out.println("memberdelete 시작");
		System.out.println(dto.toString());
		
		// result 1 : 탈퇴 성공, result 0 : 탈퇴 실패
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.deleteMember(dto);
		
		model.addAttribute("result", result);
				
		System.out.println("memberdelete 끝");

		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}

	// 나의 일자리 등록 현황 (workaddlist.htm)
	@RequestMapping(value = "workaddlist.htm", method = RequestMethod.GET)
	public String workaddlist(String id, HttpServletRequest request, Model model) {

		System.out.println("workaddlist 시작");

		int pg = 1; // 처음 시작페이지

		String strPg = request.getParameter("pg"); // view에서 넘긴 시작페이지

		// request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 10; // 한번에 볼 수 있는 그리드 수
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		// 총 게시물수
		WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
		int total = workboarddao.getMyWorkAddListCount(id);

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
		map.put("id", id);

		List<WorkboardDTO> workaddlist = workboarddao.getMyWorkAddList(map);

		model.addAttribute("workaddlist", workaddlist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		System.out.println("------------------------------------------------");
		System.out.println("사용자 아이디    : " + id);
		System.out.println("시작             : " + start + " 끝:" + end);
		System.out.println("글의 총 개수          : " + total);
		System.out.println("처음 시작페이지       : " + pg);
		System.out.println("페이지수          : " + allPage);
		System.out.println("한페이지에 보여줄 범위     : " + block);
		System.out.println("보여줄 페이지의 시작    : " + fromPage);
		System.out.println("보여줄 페이지의 끝       : " + toPage);
		System.out.println("List<NoticeboardDTO> list");

		for (WorkboardDTO dto : workaddlist) {
			System.out.println(dto.toString());
		}
		System.out.println("-------------------------------------------------");

		System.out.println("workaddlist 끝");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workaddlist";
	}
	
	// 일자리 등록 상세보기 (workadddetail.htm)
	@RequestMapping(value = "workadddetail.htm", method = RequestMethod.GET)
	public String workadddetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workadddetail";
	}
	
	// 일자리 등록 취소 (workaddcancle.htm)
	@RequestMapping(value = "workaddcancle.htm", method = RequestMethod.GET)
	public String workaddcancle(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workaddlist";
	}
	
	// 일자리 등록에 대한 신청 양식 상세보기 ()
	
	
	// 일자리 신청 승인 ()
	

	// 일자리 신청 현황 (workrequestlist.htm)
	@RequestMapping(value = "workrequestlist.htm", method = RequestMethod.GET)
	public String workrequestlist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestlist";
	}
	
	// 일자리 신청 상세보기 (workrequestdetail.htm)
	@RequestMapping(value = "workrequestdetail.htm", method = RequestMethod.GET)
	public String workrequestdetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestdetail";
	}
	
	// 일자리 신청 취소 (workrequestcancle.htm)
	@RequestMapping(value = "workrequestcancle.htm", method = RequestMethod.GET)
	public String workrequestcancle(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestlist";
	}
	
	// 내 여행후기 목록 ()
	

	// 쪽지함 목록 (messagelist.htm)
	@RequestMapping(value = "messagelist.htm", method = RequestMethod.GET)
	public String messagelist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.messagelist";
	}

	// 쪽지 상세보기 (messagedetail.htm)
	@RequestMapping(value = "messagedetail.htm", method = RequestMethod.GET)
	public String messagedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.messagedetail";
	}
	
	
	// 레퍼런스 목록 (referencelist.htm)
		@RequestMapping(value = "referencelist.htm", method = RequestMethod.GET)
		public String referencelist() {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

		// 레퍼런스 쓰기 (referenceinsert.htm)
		@RequestMapping(value = "referenceinsert.htm", method = RequestMethod.GET)
		public String referenceinsert() {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.workinsert";
		}

		// 레퍼런스 쓰기 성공 (referenceinsert.htm)
		@RequestMapping(value = "referenceinsert.htm", method = RequestMethod.POST)
		public String referenceinsertsuccess(ReferenceDTO dto) {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

		// 레퍼런스 삭제 (referencedelete.htm)
		@RequestMapping(value = "referencedelete.htm", method = RequestMethod.GET)
		public String referencedelete(String num) {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

}
