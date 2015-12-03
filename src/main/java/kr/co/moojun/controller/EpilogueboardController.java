package kr.co.moojun.controller;

import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.co.moojun.model.DAO.EpilogueboardDAO;
import kr.co.moojun.model.DTO.EpilogueboardDTO;
import kr.co.moojun.model.DTO.Reply_EpilogueDTO;

@Controller
@RequestMapping(value="/epilogue/")
public class EpilogueboardController {

	@Autowired
	private SqlSession sqlsession;
	
	// 여행후기 목록 (epiloguelist.htm)
	@RequestMapping(value = "epiloguelist.htm", method = RequestMethod.GET)
	public String epiloguelist(HttpServletRequest request) {

		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 7;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
		int total = epilogueboarddao.getEpilogueBoardCount(); // 총 게시물수
		System.out.println("시작 : " + start + " 끝:" + end);
		System.out.println("글의 수 : " + total);

		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("페이지수 : " + allPage);

		int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8]
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

		List<EpilogueboardDTO> epiloguelist = epilogueboarddao.getEpilogueBoardList(map);
		request.setAttribute("epiloguelist", epiloguelist);
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
		System.out.println("List<NoticeboardDTO> list");

		for( EpilogueboardDTO dto :  epiloguelist)
		{
			System.out.println(dto.toString());
		}
		System.out.println("-------------------------------------------------");
		System.out.println("epiloguelist 끝");
		
		
		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguelist";
	}

	// 여행후기 상세보기 (epiloguedetail.htm)
	@RequestMapping(value = "epiloguedetail.htm", method = RequestMethod.GET)
	public String epiloguedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguedetail";
	}

	// 여행후기 쓰기 (epilogueinsert.htm)
	@RequestMapping(value = "epilogueinsert.htm", method = RequestMethod.GET)
	public String epilogueinsert() {

		System.out.println("epilogueinsert form");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epilogueinsert";
	}

	// 여행후기 쓰기 성공 (epilogueinsert.htm)
	@RequestMapping(value = "epilogueinsert.htm", method = RequestMethod.POST)
	public String epilogueinsertsuccess(EpilogueboardDTO epilogueboarddto, HttpServletRequest request, Principal principal) throws Exception {

		System.out.println("epilogueinsertsuccess start");
		
		
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
		return "redirect:epiloguelist.htm";
	}

	// 여행후기 수정 (epilogueupdate.htm)
	@RequestMapping(value = "epilogueupdate.htm", method = RequestMethod.GET)
	public String epilogueupdate(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epilogueupdate";
	}

	// 여행후기 수정 성공 (epilogueupdate.htm)
	@RequestMapping(value = "epilogueupdate.htm", method = RequestMethod.POST)
	public String epilogueupdatesuccess(EpilogueboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguedetail";
	}

	// 여행후기 삭제 (epiloguedelete.htm)
	@RequestMapping(value = "epiloguedelete.htm", method = RequestMethod.GET)
	public String epiloguedelete(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguelist";
	}

	// 여행후기 댓글 (epiloguereply.htm)
	@RequestMapping(value = "epiloguereply.htm", method = RequestMethod.POST)
	public String epiloguereply(Reply_EpilogueDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}

	// 여행후기 댓글 삭제 (epiloguereplydelete.htm)
	@RequestMapping(value = "epiloguereplydelete.htm", method = RequestMethod.GET)
	public String epiloguereplydelete(Reply_EpilogueDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}

}
