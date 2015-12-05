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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.FreeboardDAO;
import kr.co.moojun.model.DAO.Reply_FreeDAO;
import kr.co.moojun.model.DTO.FreeboardDTO;
import kr.co.moojun.model.DTO.Reply_FreeDTO;

@Controller
@RequestMapping("/freeboard/")
public class FreeboardController {
   
   @Autowired
   private SqlSession sqlsession;
   
   @Autowired
   @Qualifier("jsonview")
   private View jsonview;
   
   //자유게시판 목록 (freelist.htm)
   @RequestMapping(value="freelist.htm",method=RequestMethod.GET)
   public String freelist(HttpServletRequest request, Model model){
      System.out.println("freelist 시작");
      
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 9;   //한번에 볼 수 있는 그리드 수
      int start    = (pg * rowSize) - (rowSize - 1);
      int end    =  pg * rowSize;

      //총 게시물수
      FreeboardDAO freeboarddao = sqlsession.getMapper(FreeboardDAO.class);
      int total = freeboarddao.getFreeBoardCount();

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
      
      List<FreeboardDTO> freelist = freeboarddao.getFreeBoardList(map);
      
      model.addAttribute("freelist"   , freelist); 
      model.addAttribute("pg"         , pg); 
      model.addAttribute("allPage"   , allPage); 
      model.addAttribute("block"      , block); 
      model.addAttribute("fromPage"   , fromPage);
      model.addAttribute("toPage"      , toPage);
      
      System.out.println("------------------------------------------------");
      System.out.println("시작             : " + start + " 끝:" + end);
      System.out.println("글의 총 개수          : " + total);
      System.out.println("처음 시작페이지       : " + pg);
      System.out.println("페이지수          : " + allPage);
      System.out.println("한페이지에 보여줄 범위     : " + block);
      System.out.println("보여줄 페이지의 시작    : " + fromPage);
      System.out.println("보여줄 페이지의 끝       : " + toPage);
      System.out.println("List<NoticeboardDTO> list");
      
      for( FreeboardDTO dto :  freelist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-------------------------------------------------");
      
      
      System.out.println("freelist 끝");
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freelist";
   }
   
   // 자유게시판 상세보기 (freedetail.htm)
   @RequestMapping(value = "freedetail.htm", method = RequestMethod.POST)
   public View freedetail(int num, Model model, HttpServletRequest request, Principal principal) {
      System.out.println("freedetail 시작");
      
      String id = principal.getName();
      
      //자유게시판 상세조회
      FreeboardDAO freeboarddao= sqlsession.getMapper(FreeboardDAO.class); 
      FreeboardDTO freeboarddto =freeboarddao.getFreeBoard(num);
      
      System.out.println(freeboarddto.toString());
      model.addAttribute("freeboarddto", freeboarddto); // 모델앤 뷰중에서 모델
      model.addAttribute("id",id);
      
      //자유게시판 댓글 리스트조회 함수 호출
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 5;   //한번에 볼 수 있는 그리드 수
      int start    = (pg * rowSize) - (rowSize - 1);
      int end    =  pg * rowSize;

      //총 게시물수
      Reply_FreeDAO reply_freedao = sqlsession.getMapper(Reply_FreeDAO.class);
      int total = reply_freedao.getFreeBoardReplyCount(num);

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
      
      List<Reply_FreeDTO> reply_freedtolist = reply_freedao.getFreeBoardReplyList(map);
      
      model.addAttribute("reply_freedtolist"   , reply_freedtolist); 
      model.addAttribute("pg"         , pg); 
      model.addAttribute("allPage"   , allPage); 
      model.addAttribute("block"      , block); 
      model.addAttribute("fromPage"   , fromPage);
      model.addAttribute("toPage"      , toPage);
      
      System.out.println("----------------------자유게시판댓글리스트조회 디버깅 시작--------------------------");
      System.out.println("시작             : " + start + " 끝:" + end);
      System.out.println("글의 총 개수          : " + total);
      System.out.println("처음 시작페이지       : " + pg);
      System.out.println("페이지수          : " + allPage);
      System.out.println("한페이지에 보여줄 범위     : " + block);
      System.out.println("보여줄 페이지의 시작    : " + fromPage);
      System.out.println("보여줄 페이지의 끝       : " + toPage);
      System.out.println("List<NoticeboardDTO> list");
      
      for( Reply_FreeDTO dto :  reply_freedtolist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-----------------------------끝--------------------");
      
      System.out.println("freedetail 끝");

      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   
   
//   수정할지 몰라서....
   //자유게시판 댓글 리스트조회
//   public List<Reply_FreeDTO> getFreeBoardReplyList(int num, HttpServletRequest request, Model model){
//      System.out.println("getFreeBoardReplyList 시작");
//      
//      
//      int pg = 1; //처음 시작페이지
//      
//      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
//      
//      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
//      if (strPg != null) 
//      {
//         pg = Integer.parseInt(strPg);
//      }
//      
//      int rowSize = 5;   //한번에 볼 수 있는 그리드 수
//      int start    = (pg * rowSize) - (rowSize - 1);
//      int end    =  pg * rowSize;
//
//      //총 게시물수
//      Reply_FreeDAO reply_freedao = sqlsession.getMapper(Reply_FreeDAO.class);
//      int total = reply_freedao.getFreeBoardReplyCount(num);
//
//      int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
//      // int totalPage = total/rowSize + (total%rowSize==0?0:1);
//
//      int block = 10; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9]
//                  // [10] >>
//      int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
//      // ((1-1)/10*10)
//      int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
//      if (toPage > allPage) { // 예) 20>17
//         toPage = allPage;
//      }
//
//      HashMap map = new HashMap();
//
//      map.put("start", start);
//      map.put("end", end);
//      
//      List<Reply_FreeDTO> reply_freedtolist = reply_freedao.getFreeBoardReplyList(map);
//      
//      model.addAttribute("reply_freedtolist"   , reply_freedtolist); 
//      model.addAttribute("pg"         , pg); 
//      model.addAttribute("allPage"   , allPage); 
//      model.addAttribute("block"      , block); 
//      model.addAttribute("fromPage"   , fromPage);
//      model.addAttribute("toPage"      , toPage);
//      
//      System.out.println("------------------------------------------------");
//      System.out.println("시작             : " + start + " 끝:" + end);
//      System.out.println("글의 총 개수          : " + total);
//      System.out.println("처음 시작페이지       : " + pg);
//      System.out.println("페이지수          : " + allPage);
//      System.out.println("한페이지에 보여줄 범위     : " + block);
//      System.out.println("보여줄 페이지의 시작    : " + fromPage);
//      System.out.println("보여줄 페이지의 끝       : " + toPage);
//      System.out.println("List<NoticeboardDTO> list");
//      
//      for( Reply_FreeDTO dto :  reply_freedtolist)
//      {
//         System.out.println(dto.toString());
//      }
//      System.out.println("-------------------------------------------------");
//      
//      System.out.println("getFreeBoardReplyList 끝");
//      return null;
//   }
   
   // 자유게시판 쓰기 (freeinsert.htm)
   @RequestMapping(value = "freeinsert.htm", method = RequestMethod.GET)
   public String freeinsert() {
      System.out.println("freeinsert 시작");
      
      System.out.println("freeinsert 끝");
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freeinsert";
   }
   
   // 자유게시판 쓰기 성공 (freeinsert.htm)
   @RequestMapping(value = "freeinsert.htm", method = RequestMethod.POST)
   public String freeinsertsuccess(FreeboardDTO dto, Model model) {

      System.out.println("freeinsertsuccess 시작");
      System.out.println(dto.toString());
      
      FreeboardDAO freeboarddao = sqlsession.getMapper(FreeboardDAO.class);
      int result = freeboarddao.insertFreeBoard(dto);
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("freeinsertsuccess 끝");

      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freelist";
   }
   
   // 자유게시판 수정 (freeupdate.htm)
   @RequestMapping(value = "freeupdate.htm", method = RequestMethod.GET)
   public String freeupdate(int num, int pg, Model model) {
      System.out.println("freeupdate 시작");
      
      System.out.println("글번호(num) : " + num);
      System.out.println("페이지번호(pg) : " + pg);
      
      FreeboardDAO freeboarddao= sqlsession.getMapper(FreeboardDAO.class);  
      FreeboardDTO freeboarddto =freeboarddao.getFreeBoard(num);
      
      System.out.println("freeboarddto.toString()");
      System.out.println(freeboarddto.toString());
      model.addAttribute("freeboarddto", freeboarddto);
      model.addAttribute("pg", pg);
      
      System.out.println("freeupdate 끝");

      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freeupdate";
   }
   
   // 자유게시판 수정 성공 (freeupdate.htm)
   @RequestMapping(value = "freeupdate.htm", method = RequestMethod.POST)
   public String freeupdatesuccess(FreeboardDTO dto, int pg, Model model) {
      System.out.println("freeupdatesuccess 시작");
      System.out.println("페이지번호(pg)" + pg);
      System.out.println(dto.toString());
      
      //int result = 실패 : 0 , 성공 : 1
      FreeboardDAO freeboarddao= sqlsession.getMapper(FreeboardDAO.class);  
      int result = freeboarddao.updateFreeBoard(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("freeupdatesuccess 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freedetail";
   }
   
   // 자유게시판 삭제 (freedelete.htm)
   @RequestMapping(value = "freedelete.htm", method = RequestMethod.GET)
   public String freedelete(FreeboardDTO dto, int pg, Model model) {
      System.out.println("freedelete 시작");
      System.out.println(dto.toString());
      System.out.println("pg" + pg);
      
      FreeboardDAO freeboarddao= sqlsession.getMapper(FreeboardDAO.class);  
      int result = freeboarddao.deleteFreeBoard(dto);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      model.addAttribute("pg", pg);
      
      
      System.out.println("freedelete 끝");
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freelist";
   }
   
   ///////////////////////////////////////////////////////////////////////////////////자유게시판 댓글 controll//////////
   
   // 자유게시판 댓글 입력(freereply.htm)
   @RequestMapping(value = "freereply.htm", method = RequestMethod.POST)
   public String freereply(Reply_FreeDTO dto, Model model) {

      System.out.println("freereply 시작");
      System.out.println(dto.toString());
      
      Reply_FreeDAO reply_freedao= sqlsession.getMapper(Reply_FreeDAO.class);  
      int result = reply_freedao.insertFreeBoardReply(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("freereply 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freedetail";
   }
   
   // 자유게시판 댓글 삭제 (freereplydelete.htm)
   @RequestMapping(value = "freereplydelete.htm", method = RequestMethod.GET)
   public String freereplydelete(Reply_FreeDTO dto, Model model) {
      System.out.println("freereplydelete 시작");
      System.out.println(dto.toString());
      
      Reply_FreeDAO reply_freedao= sqlsession.getMapper(Reply_FreeDAO.class);  
      int result = reply_freedao.deleteFreeBoardReply(dto);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("freereplydelete 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freedetail";
   }
   
   // 자유게시판 수정 성공 (freereplyupdate.htm)
   @RequestMapping(value = "freereplyupdate.htm", method = RequestMethod.POST)
   public String freereplyupdate(Reply_FreeDTO dto, Model model) {
      System.out.println("freereplyupdate 시작");
      System.out.println(dto.toString());
      
      //int result = 실패 : 0 , 성공 : 1
      Reply_FreeDAO reply_freedao= sqlsession.getMapper(Reply_FreeDAO.class);  
      int result = reply_freedao.updateFreeBoardReply(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("freereplyupdate 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "freeboard.freedetail";
   }
}