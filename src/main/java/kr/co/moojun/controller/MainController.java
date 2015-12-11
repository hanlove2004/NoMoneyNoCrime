package kr.co.moojun.controller;

import java.security.Principal;
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

import kr.co.moojun.model.DAO.EpilogueboardDAO;
import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DAO.Reply_EpilogueDAO;
import kr.co.moojun.model.DTO.EpilogueboardDTO;
import kr.co.moojun.model.DTO.MemberDTO;
import kr.co.moojun.model.DTO.Reply_EpilogueDTO;

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
   
   //main search 비동기(title으로 여행후기 목록 가져오기)
   @RequestMapping(value = "mainsearch.htm", method = RequestMethod.POST)
   public View searchEpilogue(String mainsearch, Model model) {
      System.out.println("searchEpilogue start");
      System.out.println("mainsearch : " + mainsearch);
      
      String temp = mainsearch;
      String result = "0";   //search한 값이 null 인경우 : "0" 아닌경우 : "1"
      
      //title -> null값이 들어온경우 
      if(temp.length() == 0){
         System.out.println("temp.length() == 0");
         temp = "%";
      }
      
      EpilogueboardDAO epilogueboarddao = sqlsession.getMapper(EpilogueboardDAO.class);
      List<EpilogueboardDTO> epiloguedtolist = epilogueboarddao.searchEpilogueList(temp);
      
      //결과값이 없는 경우
      if(epiloguedtolist.size() == 0){
         System.out.println("결과값이 없는 경우 : result = 0");
         result = "0";
      }
      else//결과있는경우
      {
         System.out.println("결과값이 없는 경우 : result = 1");
         result = "1";
         
         // 최종 list결과값 출력
         for (EpilogueboardDTO dto : epiloguedtolist) {
            System.out.println(dto.toString());
         }
         
      }

      System.out.println("result(최종값) : " + result);
      
      model.addAttribute("epiloguedtolist", epiloguedtolist); 
      model.addAttribute("result"         , result); 

      System.out.println("searchEpilogue end");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   //searchkeyword 비동기(keyword 목록 가져오기)
   @RequestMapping(value = "searchkeyword.htm", method = RequestMethod.POST)
   public View searchKeyword(String keyword, Model model) {
      System.out.println("searchKeyword start");
      System.out.println("keyword : " + keyword);
      
      String temp = keyword;
      String result = "0";   //search한 값이 null 인경우 : "0" 아닌경우 : "1"
      
      //title -> null값이 들어온경우 
      if(temp.length() == 0){
         System.out.println("temp.length() == 0");
         //검색결과가 없게 하기 위한 값
         temp = "*********************";
      }
      
      EpilogueboardDAO epilogueboarddao = sqlsession.getMapper(EpilogueboardDAO.class);
      List<String> keywordlist = epilogueboarddao.searchKeyword(temp);
      
      //결과값이 없는 경우
      if(keywordlist.size() == 0){
         System.out.println("결과값이 없는 경우 : result = 0");
         result = "0";
      }
      else//결과있는경우
      {
         System.out.println("결과값이 없는 경우 : result = 1");
         result = "1";
         
         // 최종 list결과값 출력
         for (String word : keywordlist) {
            System.out.println(word.toString());
         }
         
      }

      System.out.println("result(최종값) : " + result);
      
      model.addAttribute("keywordlist", keywordlist); 
      model.addAttribute("result"         , result); 

      System.out.println("searchKeyword end");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   // 여행후기 목록 (searchbuttonclick.htm)
   @RequestMapping(value = "searchbuttonclick.htm", method = RequestMethod.POST)
   public View mainepiloguelist(HttpServletRequest request, Model model) {
      System.out.println("mainepiloguelist 시작");
      
      String keyword = request.getParameter("keyword");
      System.out.println("keyword : " + keyword);
      
      int pg = 1;
      String strPg = request.getParameter("pg");
      
      if (strPg != null) {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 9;
      int start    = (pg * rowSize) - (rowSize - 1);
      int end    = pg * rowSize;

      EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
      int total = epilogueboarddao.maingetEpilogueBoardCount(keyword); // 총 게시물수
      
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

      map.put("start"    , start);
      map.put("end"    , end);
      map.put("keyword", keyword);
      
      List<EpilogueboardDTO> mainepiloguelist = epilogueboarddao.maingetEpilogueBoardList(map);
      
      //photoname1이 null일 경우에 로고를 default로 설정
	  for(int i = 0; i < mainepiloguelist.size(); i++){
	    System.out.println(">" + mainepiloguelist.get(i).getPhotoname1() + "<");
		if(mainepiloguelist.get(i).getPhotoname1() == null){
			System.out.println("타니?");
			mainepiloguelist.get(i).setPhotoname1("images/무전무죄_logo_fin_01.png");
		} else if(mainepiloguelist.get(i).getPhotoname1() != null){
			mainepiloguelist.get(i).setPhotoname1("upload/"+mainepiloguelist.get(i).getPhotoname1());
		}
		System.out.println("셋팅 완료 : " + mainepiloguelist.get(i).getPhotoname1());
	  }
      
      model.addAttribute("mainepiloguelist", mainepiloguelist);
      model.addAttribute("pg"          , pg);
      model.addAttribute("allPage"    , allPage);
      model.addAttribute("block"       , block);
      model.addAttribute("fromPage"    , fromPage);
      model.addAttribute("toPage"       , toPage);
      model.addAttribute("total"       , total);

      System.out.println("------------------------------------------------");
      System.out.println("시작             : " + start + " 끝:" + end);
      System.out.println("글의 총 개수          : " + total);
      System.out.println("처음 시작페이지       : " + pg);
      System.out.println("페이지수          : " + allPage);
      System.out.println("한페이지에 보여줄 범위     : " + block);
      System.out.println("보여줄 페이지의 시작    : " + fromPage);
      System.out.println("보여줄 페이지의 끝       : " + toPage);
      System.out.println("List<NoticeboardDTO> list");

      for( EpilogueboardDTO dto :  mainepiloguelist)
      {
         System.out.println(dto.toString());
      }
      
      System.out.println("-------------------------------------------------");
      System.out.println("mainepiloguelist 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   // 여행후기 상세보기 (mainepiloguedetail.htm)
   @RequestMapping(value = "mainepiloguedetail.htm", method = RequestMethod.POST)
   public View mainepiloguedetail(String num , ModelMap modelmap) {
      System.out.println("mainepiloguedetail start");
      System.out.println(num);
      
      EpilogueboardDAO epilogueboarddao =  sqlsession.getMapper(EpilogueboardDAO.class);
      EpilogueboardDTO epilogueboarddto = epilogueboarddao.getEpilogueBoard(Integer.parseInt(num));
       
      System.out.println(epilogueboarddto.toString());
       
      modelmap.addAttribute("epilogueboarddto",epilogueboarddto);
       
		System.out.println("mainepiloguedetail start");
		// Tiles 적용 (UrlBase 방식)
		return jsonview;
	}

	// 여행후기 댓글 리스트 (mainepiloguereplydetail.htm)
	@RequestMapping(value = "mainepiloguereplydetail.htm", method = RequestMethod.POST)
	public View epiloguereplydetail(String num, ModelMap modelmap) {
		
		System.out.println("mainepiloguereplydetail start");
		System.out.println(num);

		HashMap map = new HashMap();
		map.put("num", num);

		Reply_EpilogueDAO reply_epiloguedao = sqlsession.getMapper(Reply_EpilogueDAO.class);
		List<Reply_EpilogueDTO> reply_epiloguelist = reply_epiloguedao.getEpilogueBoardReplyList(map);

		modelmap.addAttribute("reply_epiloguelist", reply_epiloguelist);

		System.out.println("mainepiloguereplydetail end");

		return jsonview;
	}
}