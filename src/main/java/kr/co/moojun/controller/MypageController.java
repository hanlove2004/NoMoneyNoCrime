package kr.co.moojun.controller;

import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
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

		// 회원정보 상세보기
		MemberDTO memberdto = memberdao.getMemberDetail(id);

		System.out.println(memberdto.toString());
		model.addAttribute("memberdto", memberdto);

		System.out.println("memberinfo 끝");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberinfo";
	}

	// 비밀번호 일치 확인 (pwdcheck.htm)
	@RequestMapping(value = "pwdcheck.htm", method = RequestMethod.POST)
	public View idcheck(String id, String pwd, Model model) {

		System.out.println("pwdcheck start");
		System.out.println("수정할 id : " + id + " / 입력한 pwd : " + pwd);
		
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		int result = memberdao.checkMember(id, pwd);

		System.out.println(result);

		if (result == 0) {
			model.addAttribute("data", false); // 비밀번호 불일치
		} else {
			model.addAttribute("data", true); // 비밀번호 일치
		}

		System.out.println("pwdcheck end");

		// Tiles 적용 (UrlBase 방식)
		return jsonview;
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
	public String memberdelete(MemberDTO dto) {
		System.out.println("memberdelete 시작");
		System.out.println(dto.toString());
		// result 1 : 탈퇴 성공, result 0 : 탈퇴 실패
		MemberDAO memberdao = sqlsession.getMapper(MemberDAO.class);
		String id = dto.getId();
		String pwd = dto.getPwd();
		// modal에서 입력한 pwd값
		System.out.println("id : " + id + "/ pwd " + pwd);
		String pwd2 = memberdao.getPassword(id);
		System.out.println("asdfasdfasdf" + pwd2);
		// 실제 비밀번호
		if (pwd.equals(pwd2)) {
			memberdao.deleteMember(id);
		}
		System.out.println("memberdelete 끝");

		// Tiles 적용 (UrlBase 방식)
		return "redirect:/logout";
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
		
		//로그인 아이디 가져오기
		String id = principal.getName();
		
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
		int total = epilogueboarddao.getMyEpilogueBoardCount(id); // 총 게시물수
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
		
		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		
		List<EpilogueboardDTO> myepiloguelist = epilogueboarddao.getMyEpilogueBoardList(map);
		
		// 여행후기 TITLE 가공(8글자 이상일때 .. 추가)
		for(int i = 0; i < myepiloguelist.size(); i++){
			if(myepiloguelist.get(i).getTitle().length() > 8){
				myepiloguelist.get(i).setTitle(myepiloguelist.get(i).getTitle().substring(0, 8)+"..");
			}
		}

		// photoname1이 null일 경우에 로고를 default로 설정
		for (int i = 0; i < myepiloguelist.size(); i++) {
			System.out.println(">" + myepiloguelist.get(i).getPhotoname1() + "<");
			if (myepiloguelist.get(i).getPhotoname1() == null) {
				System.out.println("타니?");
				myepiloguelist.get(i).setPhotoname1("images/무전무죄_logo_fin_01.png");
			} else if (myepiloguelist.get(i).getPhotoname1() != null) {
				myepiloguelist.get(i).setPhotoname1("upload/" + myepiloguelist.get(i).getPhotoname1());
			}
			System.out.println("셋팅 완료 : " + myepiloguelist.get(i).getPhotoname1());
		}
		
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
		
	// 비동기 여행후기 목록 (ajaxmyepiloguelist.htm)
	@RequestMapping(value = "ajaxmyepiloguelist.htm", method = RequestMethod.GET)
	public View ajaxepiloguelist(HttpServletRequest request, Model model, Principal principal) {

		String id = principal.getName();

		System.out.println("로그인한 아이디:" + id);

		System.out.println("ajaxmyepiloguelist 시작");

		int pg = 1; // 처음 시작페이지

		String strPg = request.getParameter("pg"); // view에서 넘긴 시작페이지

		// request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}

		int rowSize = 6; // 한번에 볼 수 있는 글의 수
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;
		System.out.println(strPg + "/" + rowSize + "/" + start + "/" + end);

		// 총 게시물수
		EpilogueboardDAO epilogueboarddao = sqlsession.getMapper(EpilogueboardDAO.class);
		int total = epilogueboarddao.getMyEpilogueBoardCount(id);

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
						// [10] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) { // 예) 20>17
			toPage = allPage;
		}

		System.out.println(total + "/" + toPage);

		HashMap map = new HashMap();

		map.put("start", start);
		map.put("end", end);
		map.put("id", id);

		List<EpilogueboardDTO> myepiloguelist = epilogueboarddao.getMyEpilogueBoardList(map);
		
		// 여행후기 TITLE 가공(8글자 이상일때 .. 추가)
		for(int i = 0; i < myepiloguelist.size(); i++){
			if(myepiloguelist.get(i).getTitle().length() > 8){
				myepiloguelist.get(i).setTitle(myepiloguelist.get(i).getTitle().substring(0, 8)+"..");
			}
		}
		
		//photoname1이 null일 경우에 로고를 default로 설정
		for(int i = 0; i < myepiloguelist.size(); i++){
			System.out.println(">" + myepiloguelist.get(i).getPhotoname1() + "<");
			if(myepiloguelist.get(i).getPhotoname1() == null){
				System.out.println("타니?");
				myepiloguelist.get(i).setPhotoname1("images/무전무죄_logo_fin_01.png");
			} else if(myepiloguelist.get(i).getPhotoname1() != null){
				myepiloguelist.get(i).setPhotoname1("upload/"+myepiloguelist.get(i).getPhotoname1());
			}
			System.out.println("셋팅 완료 : " + myepiloguelist.get(i).getPhotoname1());
		}

		model.addAttribute("myepiloguelist", myepiloguelist);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);

		System.out.println("------------------------------------------------");
		System.out.println("시작             : " + start + " 끝:" + end);
		System.out.println("글의 총 개수          : " + total);
		System.out.println("처음 시작페이지       : " + pg);
		System.out.println("페이지수          : " + allPage);
		System.out.println("한페이지에 보여줄 범위     : " + block);
		System.out.println("보여줄 페이지의 시작    : " + fromPage);
		System.out.println("보여줄 페이지의 끝       : " + toPage);
		System.out.println("List<EpilogueboardDTO> list");

		for (EpilogueboardDTO dto : myepiloguelist) {
			System.out.println(dto.toString());
		}
		System.out.println("-------------------------------------------------");
		System.out.println("ajaxepiloguelist 끝");

		model.addAttribute("id", id);

		// Tiles 적용 (UrlBase 방식)
		return jsonview;
	}
	
	// 내 여행후기 쓰기 성공 (myepilogueinsert.htm)
	@RequestMapping(value = "myepilogueinsert.htm", method = RequestMethod.POST)
	public String epilogueinsertsuccess(EpilogueboardDTO epilogueboarddto, HttpServletRequest request, Principal principal) throws Exception {

		System.out.println("myepilogueinsertsuccess start");
		
		
		System.out.println(epilogueboarddto.getTitle());
		System.out.println(epilogueboarddto.getContent());
		System.out.println(epilogueboarddto.getFiles());


		List<CommonsMultipartFile> files = epilogueboarddto.getFiles();
		List<String> filenames = new ArrayList<String>(); //파일명만 추출

		if(files != null && files.size() > 0 ){ //업로드한 파일이 하나라도 있다면

			for(CommonsMultipartFile multipartfile : files ){
				
				String fname = multipartfile.getOriginalFilename(); //파일명 얻기
				System.out.println("fname : " + fname);
				if(fname.equals("")){
					break;
				}
				String[] splitname = fname.split("\\.");
				String path  = request.getSession().getServletContext().getRealPath("/upload");
				
				String uploadname = System.currentTimeMillis() + splitname[0] + "_"
											+ principal.getName() + "." + splitname[1];
				
				String fullpath = path + "\\" + uploadname;
				
				System.out.println("fname : " + fname);
				System.out.println("path : " + path);
				System.out.println("uploadname : " + uploadname);
				System.out.println("fullpath " + fullpath);

				if(!fname.equals("")){
					//서버에 파일 쓰기 작업 
					FileOutputStream fs = new FileOutputStream(fullpath);
					fs.write(multipartfile.getBytes());
					fs.close();
				}
				filenames.add(uploadname); //실 DB Insert 작업시 .. 파일명 
			}

		}
		System.out.println(filenames.size());
		// DB저장작업
		// DB 저장할 파일 명
		switch (filenames.size()) {
		case 1:
			System.out.println("case1");
			epilogueboarddto.setPhotoname1(filenames.get(0));
			break;
		case 2:
			System.out.println("case2");
			epilogueboarddto.setPhotoname1(filenames.get(0));
			epilogueboarddto.setPhotoname2(filenames.get(1));
			break;
		case 3:
			System.out.println("case3");
			epilogueboarddto.setPhotoname1(filenames.get(0));
			epilogueboarddto.setPhotoname2(filenames.get(1));
			epilogueboarddto.setPhotoname3(filenames.get(2));
			break;
		default:
			break;
		}
		

		//security 에서
		//Login ID 값
		//n.setWriter("kglim");

		// 1단계 ( 좀 더 상세한 정보 : ID , PWD , role)
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(user.getUsername() + user.getAuthorities());

		// 2단계
		System.out.println(principal.getName());
		epilogueboarddto.setId(principal.getName());

		// 실DB저장
		EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
		epilogueboarddao.insertEpilogueBoard(epilogueboarddto);

		// Tiles 적용 (UrlBase 방식)
		return "redirect:myepiloguelist.htm";
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
		
		// 내용 자르기
		for(MessageDTO messagedto: messagereceivelist){
			String content = messagedto.getContent();
			int contentlength = messagedto.getContent().length();
			if(contentlength > 15){
				content = content.substring(0, 14) + "....";
				messagedto.setContent(content);
			}
		}

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
		
		// 내용 자르기
		for(MessageDTO messagedto: messagesendlist){
			String content = messagedto.getContent();
			int contentlength = messagedto.getContent().length();
			if(contentlength > 15){
				content = content.substring(0, 14) + "....";
				messagedto.setContent(content);
			}
		}
		
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
	
}
