package kr.co.moojun.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.EpilogueboardDAO;
import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DAO.MessageDAO;
import kr.co.moojun.model.DAO.Reply_EpilogueDAO;
import kr.co.moojun.model.DAO.WorkboardDAO;
import kr.co.moojun.model.DTO.EpilogueboardDTO;
import kr.co.moojun.model.DTO.MemberDTO;
import kr.co.moojun.model.DTO.MessageDTO;
import kr.co.moojun.model.DTO.ReferenceDTO;
import kr.co.moojun.model.DTO.Reply_EpilogueDTO;
import kr.co.moojun.model.DTO.WorkboardDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageController {
	
	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
	@Qualifier("jsonview")
	private View jsonview;

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

		// mapper 설정
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);

		// LOGIN 상태인 id 받아오기
		id = principal.getName();
		System.out.println(id);

		// 회원정보 수정정보 상세보기 (readonly 부분)
		MemberDTO memberdto = memberdao.getMemberDetail(id);

		System.out.println(memberdto.toString());
		model.addAttribute("memberdto", memberdto);

		System.out.println("memberupdate 끝");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberupdate";
	}

	// 마이페이지 회원정보 수정 성공 (memberupdate.htm)
	@RequestMapping(value = "memberupdate.htm", method = RequestMethod.POST)
	public String memberupdatesuccess(String newpwd, String phone, String email, String pwd, String id, Model model) {

		System.out.println("memberupdatesuccess 시작");
		System.out.println(newpwd + "/" + phone + "/" + email);
		// result 1 : 수정성공, result 0 : 수정 실패
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.updateMember(newpwd, phone, email, pwd, id);

		System.out.println("memberupdate result : " + result);

		model.addAttribute("result" + result);

		System.out.println("memberupdatesuccess 끝");

		// Tiles 적용 (UrlBase 방식)
		return "redirect:memberinfo.htm";
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
	
	// 나의 일자리 등록현황(workaddlist.htm)
	@RequestMapping(value = "workaddlist.htm", method = RequestMethod.GET)
	   public String workaddlist(Principal principal, HttpServletRequest request, Model model) {
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
	      String id = principal.getName();
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
	
	// 일자리 등록 취소 / 삭제 (workadddelete.htm)
	@RequestMapping(value = "workadddelete.htm", method = RequestMethod.GET)
	public String workadddelete(String num) {
		
		System.out.println("workadddelete 시작");

		WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
		// 취소할 글의 번호 받아오기
		int workboardnum = Integer.parseInt(num);
		System.out.println("num : " + workboardnum);
		// 삭제 처리
		workboarddao.deletemMyWorkboard(workboardnum);

		System.out.println("workadddelete 끝");
		
		// Tiles 적용 (UrlBase 방식)
		return "redirect:/mypage/workaddlist.htm";
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
	
	// 내 여행후기 목록 (myepiloguelist.htm)
	@RequestMapping(value = "myepiloguelist.htm", method = RequestMethod.GET)
	public String epiloguelist(HttpServletRequest request, Principal principal) {
		
		System.out.println("myepiloguelist 시작");
		
		int pg = 1;
		
		String strPg = request.getParameter("pg");
		
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 6;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		
		//수정해야할 부분
		EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
		int total = epilogueboarddao.getEpilogueBoardCount(); // 총 게시물수
		System.out.println("시작 : " + start + " 끝:" + end);
		System.out.println("글의 수 : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + allPage);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8]
						// [9] [10] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		
		//접속자 아이디 받아오기
		String id = principal.getName();
		
		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<EpilogueboardDTO> myepiloguelist = epilogueboarddao.getMyEpilogueBoardList(map);
		request.setAttribute("myepiloguelist", myepiloguelist);
		request.setAttribute("pg", pg);
		request.setAttribute("allPage", allPage);
		request.setAttribute("block", block);
		request.setAttribute("fromPage", fromPage);
		request.setAttribute("toPage", toPage);

		System.out.println("------------------------------------------------");
		System.out.println("시작             : " + start + " 끝:" + end);
		System.out.println("글의 총 개수          : " + total);
		System.out.println("처음 시작페이지       : " + pg);
		System.out.println("페이지수          : " + allPage);
		System.out.println("한페이지에 보여줄 범위     : " + block);
		System.out.println("보여줄 페이지의 시작    : " + fromPage);
		System.out.println("보여줄 페이지의 끝       : " + toPage);
		System.out.println("List<EpilogueboardDTO> list");

		for( EpilogueboardDTO dto : myepiloguelist)
		{
			System.out.println(dto.toString());
		}
		System.out.println("-------------------------------------------------");
		System.out.println("myepiloguelist 끝");
		
		// Tiles 적용 (UrlBase 방식)
		return "mypage.myepiloguelist";
	}
	
	// 나의 여행후기 상세보기 (myepiloguedetail.htm)
	@RequestMapping(value = "myepiloguedetail.htm", method = RequestMethod.POST)
	public View myepiloguedetail(String num , ModelMap modelmap) {
		System.out.println("myepiloguedetail 시작");
		System.out.println(num);
		
		EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
		EpilogueboardDTO epilogueboarddto = epilogueboarddao.getMyEpilogueBoard(Integer.parseInt(num));
		
		System.out.println(epilogueboarddto.toString());
		modelmap.addAttribute("epilogueboarddto",epilogueboarddto);
			
		System.out.println("myepiloguedetail 끝");
		
		return jsonview;
	}
	
	// 나의 여행후기 댓글 리스트 (epiloguereplydetail.htm)
	@RequestMapping(value = "myepiloguereplydetail.htm", method = RequestMethod.POST)
	public View myepiloguereplydetail(String num , ModelMap modelmap, Principal principal) {
		System.out.println("myepiloguereplydetail start");
		System.out.println(num);


		HashMap map = new HashMap();
		map.put("num", num);

		Reply_EpilogueDAO reply_epiloguedao = sqlsession.getMapper(Reply_EpilogueDAO.class);
		List<Reply_EpilogueDTO> reply_epiloguelist = reply_epiloguedao.getEpilogueBoardReplyList(map);


		modelmap.addAttribute("reply_epiloguelist",reply_epiloguelist);
		modelmap.addAttribute("userid", principal.getName());

		return jsonview;
	}

	// 나의 여행 후기 댓글 쓰기
	@RequestMapping(value = "myreply_epiloguewrite.htm", method = RequestMethod.POST)
	public View reply_epiloguewrite(String num, String replycontent , Principal principal, Model model){	

		System.out.println("myreply_epiloguewrite start");
		System.out.println("num:" + num);
		System.out.println("replycontent:" + replycontent);
		System.out.println("principal id:" + principal.getName());

		Reply_EpilogueDTO reply_epiloguedto = new Reply_EpilogueDTO();
		reply_epiloguedto.setId(principal.getName());
		reply_epiloguedto.setIdx(num);
		reply_epiloguedto.setContent(replycontent);

		Reply_EpilogueDAO reply_epiloguedao = sqlsession.getMapper(Reply_EpilogueDAO.class);
		reply_epiloguedao.insertEpilogueBoardReply(reply_epiloguedto);
		reply_epiloguedto.setNum(reply_epiloguedao.getMaxNumByIdx(num));

		model.addAttribute("reply_epiloguedto", reply_epiloguedto);

		return jsonview;
	}
			
	// 나의 여행 후기 댓글 삭제
	@RequestMapping(value = "myreply_epiloguedelete.htm", method = RequestMethod.POST)
	public View reply_epiloguedelete(String num, Principal principal, Model model){	

		System.out.println("myreply_epiloguedelete start");
		System.out.println("num:" + num);

		Reply_EpilogueDTO reply_epiloguedto = new Reply_EpilogueDTO();
		reply_epiloguedto.setNum(Integer.parseInt(num));

		Reply_EpilogueDAO reply_epiloguedao = sqlsession.getMapper(Reply_EpilogueDAO.class);
		int result = reply_epiloguedao.deleteEpilogueBoardReply(reply_epiloguedto);
		model.addAttribute("result", result);

		return jsonview;
	}

	// 나의 여행 후기 댓글 수정
	@RequestMapping(value = "myreply_epilogueedit.htm", method = RequestMethod.POST)
	public View reply_epilogueedit(String num, String content, Principal principal, Model model){	

		System.out.println("myreply_epilogueedit start");
		System.out.println("num:" + num);
		System.out.println("content:" + content);

		Reply_EpilogueDTO reply_epiloguedto = new Reply_EpilogueDTO();
		reply_epiloguedto.setNum(Integer.parseInt(num));
		reply_epiloguedto.setContent(content);

		Reply_EpilogueDAO reply_epiloguedao = sqlsession.getMapper(Reply_EpilogueDAO.class);
		int result = reply_epiloguedao.updateEpilogueBoardReply(reply_epiloguedto);
		model.addAttribute("result", result);

		return jsonview;
	}

	// 쪽지함 리스트
	/*@RequestMapping(value = "messagelist.htm", method = RequestMethod.GET)
	public String messagelist(Principal principal, Model model) {
		System.out.println("messagelist.htm");
		MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
		String id = principal.getName();
		HashMap map = new HashMap();
		map.put("id", id);
		System.out.println("id : " + id);
		List<MessageDTO> messagelist = messagedao.messagelist(map);
		model.addAttribute("messagelist", messagelist);
		System.out.println("messagelist.htm 끝");
		return "mypage.messagelist";
	}*/

	// 받은 쪽지함 리스트
	@RequestMapping(value = "messagereceivelist.htm", method = RequestMethod.GET)
	public String messagereceivelist(String strPg, Principal principal, Model model) {
		System.out.println("messagereceivelist.htm");
		System.out.println("controller가 받은 페이지 번호 strPg : " + strPg);
		
		// mapper 생성
		MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
		
		// paging 처리를 위한 코드
		int pg = 1;
		
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		
		int rowSize = 6;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		
		int total = messagedao.getReceiveMessageCount(principal.getName()); // 총 게시물수

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8]
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		
		String id = principal.getName();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);

		
		List<MessageDTO> messagereceivelist = messagedao.messagereceivelist(map);

		model.addAttribute("messagereceivelist", messagereceivelist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		System.out.println("messagereceivelist.htm 끝");
		return "mypage.messagereceivelist";
	}
	
	// 보낸 쪽지함 리스트
	@RequestMapping(value = "messagesendlist.htm", method = RequestMethod.GET)
	public String messagesendlist(String strPg, Principal principal, Model model) {
		System.out.println("messagesendlist.htm 시작");
		MessageDAO messagedao = sqlsession.getMapper(MessageDAO.class);
		
		// paging 처리를 위한 코드
		int pg = 1;

		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 6;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		int total = messagedao.getReceiveMessageCount(principal.getName()); // 총 게시물수

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8]
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}
		
		String id = principal.getName();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("start", start);
		map.put("end", end);

		List<MessageDTO> messagesendlist = messagedao.messagesendlist(map);
		model.addAttribute("messagesendlist", messagesendlist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		
		System.out.println("messagesendlist.htm 끝");
		return "mypage.messagesendlist";
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
	
	// 회원 탈퇴
	@RequestMapping(value = "deletemember.htm", method = RequestMethod.POST)
	public String deletemember(MemberDTO dto, Model model) {
		System.out.println(dto.getId() + "/" + dto.getPwd());
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.deleteMember(dto);
		//System.out.println(dto.getId() + "/" + dto.getPwd());
		model.addAttribute("result", result);
		System.out.println("deletemember.htm3");
		/* 0 : fail, 1 : success*/
		System.out.println("deletemember 끝");
		return "redirect:/logout";
	}

}
