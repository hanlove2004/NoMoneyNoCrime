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

import kr.co.moojun.model.DAO.NoticeboardDAO;
import kr.co.moojun.model.DTO.NoticeboardDTO;
import kr.co.moojun.model.DTO.Reply_NoticeDTO;

@Controller
@RequestMapping(value="/notice/")
public class NoticeboardController {
   
   @Autowired
   private SqlSession sqlsession;
   
   @Autowired
   @Qualifier("jsonview")
   private View jsonview;
   
   //공지사항 목록 (noticelist.htm)
   @RequestMapping(value="noticelist.htm",method=RequestMethod.GET)
   public String noticelist(HttpServletRequest request, Model model){
      System.out.println("noticelist 시작");
      
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 5;   //한번에 볼 수 있는 글의 수
      int start = (pg * rowSize) - (rowSize - 1);
      int end = pg * rowSize;
      System.out.println(strPg + "/" + rowSize + "/" + start + "/" + end);

      //총 게시물수
      NoticeboardDAO noticeboarddao = sqlsession.getMapper(NoticeboardDAO.class);
      int total = noticeboarddao.getNoticeBoardCount();

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
      
      List<NoticeboardDTO> noticelist = noticeboarddao.getNoticeBoardList(map);
      
      model.addAttribute("noticelist", noticelist); 
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
      System.out.println("List<NoticeboardDTO> list");
      
      for( NoticeboardDTO dto :  noticelist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-------------------------------------------------");
      System.out.println("noticelist 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "notice.noticelist";
   }
   
   // 비동기 공지사항 목록 (ajaxnoticelist.htm)
   @RequestMapping(value="ajaxnoticelist.htm",method=RequestMethod.GET)
   public View ajaxnoticelist(HttpServletRequest request, Model model){
      System.out.println("ajaxnoticelist 시작");
      
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 5;   //한번에 볼 수 있는 그리드 수
      int start = (pg * rowSize) - (rowSize - 1);
      int end = pg * rowSize;
      System.out.println(strPg + "/" + rowSize + "/" + start + "/" + end);

      //총 게시물수
      NoticeboardDAO noticeboarddao = sqlsession.getMapper(NoticeboardDAO.class);
      int total = noticeboarddao.getNoticeBoardCount();

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
      
      List<NoticeboardDTO> noticelist = noticeboarddao.getNoticeBoardList(map);
      
      model.addAttribute("noticelist", noticelist); 
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
      System.out.println("List<NoticeboardDTO> list");
      
      for( NoticeboardDTO dto :  noticelist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-------------------------------------------------");
      System.out.println("ajaxnoticelist 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   // 공지사항 상세보기 (noticedetail.htm)
   @RequestMapping(value = "noticedetail.htm", method = RequestMethod.POST)
   public View noticedetail(int num, Model model, Principal principal) {

      System.out.println("noticedetail 시작");
      
      String id = principal.getName();
      
      System.out.println("로그인한 아이디 : " +id);

      NoticeboardDAO noticeboarddao= sqlsession.getMapper(NoticeboardDAO.class); 
      NoticeboardDTO noticeboarddto =noticeboarddao.getNoticeBoard(num);
      
      System.out.println(noticeboarddto.toString());
      model.addAttribute("noticeboarddto", noticeboarddto);
      model.addAttribute("id",id);
      
      System.out.println("noticedetail 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   // 공지사항 쓰기 (noticeinsert.htm)
   @RequestMapping(value = "noticeinsert.htm", method = RequestMethod.GET)
   public String noticeinsert() {
      System.out.println("noticeinsert 시작");
      
      System.out.println("noticeinsert 끝");
      // Tiles 적용 (UrlBase 방식)
      return "notice.noticeinsert";
   }
   
   // 공지사항 쓰기 성공 (noticeinsert.htm)
   @RequestMapping(value = "noticeinsert.htm", method = RequestMethod.POST)
   public String noticeinsertsuccess(NoticeboardDTO dto) {

      System.out.println("noticeinsertsuccess 시작");
      System.out.println(dto.toString());
      
      NoticeboardDAO noticeboarddao = sqlsession.getMapper(NoticeboardDAO.class);
      noticeboarddao.insertNoticeBoard(dto);
      
      System.out.println("noticeinsertsuccess 끝");
      // Tiles 적용 (UrlBase 방식)
      return "redirect:noticelist.htm";
   }
   
   // 공지사항 수정 (noticeupdate.htm)
   @RequestMapping(value = "noticeupdate.htm", method = RequestMethod.GET)
   public String noticeupdate(int num, HttpServletRequest request, Model model) {
      
	  System.out.println("noticeupdate 시작");
      System.out.println("글번호(num) : " + num);
      
      int pg = 1;
      
      String strPg = request.getParameter("pg");
      
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      System.out.println("페이지번호(pg) : " + pg);
      
      NoticeboardDAO noticeboarddao= sqlsession.getMapper(NoticeboardDAO.class);  
      NoticeboardDTO noticeboarddto = noticeboarddao.getNoticeBoard(num);
      
      System.out.println("noticeboarddto.toString()");
      System.out.println(noticeboarddto.toString());
      model.addAttribute("noticeboarddto", noticeboarddto);
      model.addAttribute("pg" + pg);
      
      System.out.println("noticeupdate 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "notice.noticeupdate";
   }
   
   // 공지사항 수정 성공 (noticeupdate.htm)
   @RequestMapping(value = "noticeupdate.htm", method = RequestMethod.POST)
   public String noticeupdatesuccess(NoticeboardDTO dto, HttpServletRequest request, Model model) {

      System.out.println("noticeupdatesuccess 시작");
      System.out.println("dto.toString() : " + dto.toString());
      
      int pg = 1;
      
      String strPg = request.getParameter("pg");
      
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      System.out.println("페이지번호(pg) : " + pg);

      //int result = 실패 : 0 , 성공 : 1
      NoticeboardDAO noticeboarddao = sqlsession.getMapper(NoticeboardDAO.class);
      
      int result = noticeboarddao.updateNoticeBoard(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("noticeupdatesuccess 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "redirect:noticelist.htm";
   }
   
   // 공지사항 삭제 (noticedelete.htm)
   @RequestMapping(value = "noticedelete.htm", method = RequestMethod.GET)
   public String noticedelete(int num, HttpServletRequest request, Model model) {

      System.out.println("noticedelete 시작");
      System.out.println("글번호(num) : " + num);
      
      int pg = 1;
      
      String strPg = request.getParameter("pg");
      
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      NoticeboardDAO noticeboarddao= sqlsession.getMapper(NoticeboardDAO.class);  
      int result = noticeboarddao.deleteNoticeBoard(num);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("noticedelete 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "redirect:noticelist.htm";
   }
   
}