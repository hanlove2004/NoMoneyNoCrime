package kr.co.moojun.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DAO.WorkboardDAO;
import kr.co.moojun.model.DTO.WorkboardDTO;

@Controller
@RequestMapping(value="/workboard/")
public class WorkController {

   @Autowired
   private SqlSession sqlsession;
   
   // 일자리게시판 목록 (workboardlist.htm)
   @RequestMapping(value = "workboardlist.htm", method = RequestMethod.GET)
   public String workboardlist(HttpServletRequest request, Model model) {

      System.out.println("workboardlist 시작");
      
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 10;   //한번에 볼 수 있는 그리드 수
      int start    = (pg * rowSize) - (rowSize - 1);
      int end    =  pg * rowSize;

      //총 게시물수
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int total = workboarddao.getWorkBoardCount();

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
      
      List<WorkboardDTO> worklist = workboarddao.getWorkBoardList(map);
      
      model.addAttribute("worklist"   , worklist); 
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
      
      for( WorkboardDTO dto :  worklist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-------------------------------------------------");
      
      
      System.out.println("workboardlist 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.worklist";
   }

   // 일자리게시판 상세보기 (workboarddetail.htm)
   @RequestMapping(value = "workboarddetail.htm", method = RequestMethod.GET)
   public String workboarddetail(int num, Model model) {
      System.out.println("workboarddetail 시작");
      
      //자유게시판 상세조회
      WorkboardDAO workboarddao= sqlsession.getMapper(WorkboardDAO.class); 
      WorkboardDTO workboarddto =workboarddao.getWorkBoard(num);
      
      System.out.println(workboarddto.toString());
      model.addAttribute("freeboarddto", workboarddto); // 모델앤 뷰중에서 모델

      System.out.println("workboarddetail 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "workboard.workdetail";
   }

   // 일자리게시판 쓰기 (workboardinsert.htm)
   @RequestMapping(value = "workboardinsert.htm", method = RequestMethod.GET)
   public String workboardinsert() {
      System.out.println("workboardinsert 시작");
      
      System.out.println("workboardinsert 끝");
      // Tiles 적용 (UrlBase 방식)
      return "workboard.workinsert";
   }

   // 일자리게시판 쓰기 성공 (workboardinsert.htm)
   @RequestMapping(value = "workboardinsert.htm", method = RequestMethod.POST)
   public String workboardinsertsuccess(WorkboardDTO dto, Model model) {

      System.out.println("workboardinsertsuccess 시작");
      System.out.println(dto.toString());
      
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int result = workboarddao.insertWorkBoard(dto);
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("workboardinsertsuccess 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.worklist";
   }

   // 일자리게시판 수정 (workboardupdate.htm)
   @RequestMapping(value = "workboardupdate.htm", method = RequestMethod.GET)
   public String workboardupdate(int num, int pg, Model model) {

      System.out.println("workboardupdate 시작");
      System.out.println("글번호(num) : " + num);
      System.out.println("페이지번호(pg) : " + pg);
      
      //자유게시판 상세조회
      WorkboardDAO workboarddao= sqlsession.getMapper(WorkboardDAO.class); 
      WorkboardDTO workboarddto =workboarddao.getWorkBoard(num);
      
      System.out.println("workboarddto.toString()");
      System.out.println(workboarddto.toString());
      model.addAttribute("freeboarddto", workboarddto);
      model.addAttribute("pg", pg);
      
      System.out.println("workboardupdate 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "workboard.workupdate";
   }

   // 일자리게시판 수정 성공 (workboardupdate.htm)
   @RequestMapping(value = "workboardupdate.htm", method = RequestMethod.POST)
   public String workboardupdatesuccess(WorkboardDTO dto, int pg, Model model) {
      System.out.println("workboardupdatesuccess 시작");
      System.out.println("페이지번호(pg)" + pg);
      System.out.println(dto.toString());
      
      //int result = 실패 : 0 , 성공 : 1
      WorkboardDAO workboarddao= sqlsession.getMapper(WorkboardDAO.class);  
      int result = workboarddao.updateWorkBoard(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("workboardupdatesuccess 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.workdetail";
   }

   // 일자리게시판 삭제 (workboarddelete.htm)
   @RequestMapping(value = "workboarddelete.htm", method = RequestMethod.GET)
   public String workboarddelete(int num, int pg, Model model) {
      System.out.println("workboarddelete 시작");
      System.out.println("num" + num);
      System.out.println("pg" + pg);
      
      WorkboardDAO workboarddao= sqlsession.getMapper(WorkboardDAO.class);  
      int result = workboarddao.deleteWorkBoard(num);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      model.addAttribute("pg", pg);
      
      System.out.println("workboarddelete 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "workboard.worklist";
   }
}