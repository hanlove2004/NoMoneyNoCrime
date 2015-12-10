package kr.co.moojun.controller;

import java.security.Principal;
import java.util.ArrayList;
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

import kr.co.moojun.model.DAO.WorkboardDAO;
import kr.co.moojun.model.DTO.WorkboardDTO;
import kr.co.moojun.model.DTO.WorkformDTO;

@Controller
@RequestMapping(value = "/workboard/")
public class WorkController {

   @Autowired
   private SqlSession sqlsession;

   @Autowired
   @Qualifier("jsonview")
   private View jsonview;

   // 일자리게시판 목록 (worklist.htm)
   @RequestMapping(value = "worklist.htm", method = RequestMethod.GET)
   public String worklist(HttpServletRequest request, Model model) {

      System.out.println("worklist 시작");

      int pg = 1; // 처음 시작페이지

      String strPg = request.getParameter("pg"); // view에서 넘긴 시작페이지

      // request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) {
         pg = Integer.parseInt(strPg);
      }

      int rowSize = 6; // 한번에 볼 수 있는 글의 수
      int start = (pg * rowSize) - (rowSize - 1);
      int end = pg * rowSize;

      // 총 게시물수
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
      
      // 주소 split으로 잘라서 도/시(군) 까지만 표시하기
      for(int i = 0; i < worklist.size(); i++){
    	  String addr = worklist.get(i).getAddr();
    	  String[] addrlist = addr.split(" ");
    	  
    	  worklist.get(i).setAddr(addrlist[0] + " " + addrlist[1]);
      }
      
      System.out.println(worklist.toString());

      model.addAttribute("worklist", worklist);
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
      
      /*List<String> writersexlist = new ArrayList<String>();*/
      
      for (WorkboardDTO dto : worklist) {
         System.out.println(dto.toString());
         /*String writersex = workboarddao.getWriterSex(dto.getId());*/
         /*System.out.println(dto.getId() + "의 성별 : " + writersex);
         writersexlist.add(writersex);*/
      }
      
      /*model.addAttribute("writersexlist", writersexlist);*/
      System.out.println("-------------------------------------------------");

      System.out.println("worklist 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.worklist";
   }
   
   // 비동기 일자리게시판 목록 (ajaxworklist.htm)
   @RequestMapping(value="ajaxworklist.htm",method=RequestMethod.GET)
   public View ajaxworklist(HttpServletRequest request, Model model, Principal principal){
      System.out.println("ajaxworklist 시작");
      
      String id = principal.getName();
      
      int pg = 1; //처음 시작페이지
      
      String strPg = request.getParameter("pg");   //view에서 넘긴 시작페이지
      
      //request 받아온 페이지가 없을경우 1로 시작 -> 처음요청인 상태
      if (strPg != null) 
      {
         pg = Integer.parseInt(strPg);
      }
      
      int rowSize = 6;   //한번에 볼 수 있는 그리드 수
      int start = (pg * rowSize) - (rowSize - 1);
      int end = pg * rowSize;
      System.out.println(strPg + "/" + rowSize + "/" + start + "/" + end);

      //총 게시물수
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int total = workboarddao.getWorkBoardCount();

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
      
      List<WorkboardDTO> worklist = workboarddao.getWorkBoardList(map);
      
      model.addAttribute("worklist", worklist); 
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
      System.out.println("List<WorkboardDTO> list");
      
      for( WorkboardDTO dto :  worklist)
      {
         System.out.println(dto.toString());
      }
      System.out.println("-------------------------------------------------");
      System.out.println("ajaxworklist 끝");
      
      model.addAttribute("id",id);
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }

   // 일자리게시판 상세보기 (workdetail.htm)
   @RequestMapping(value = "workdetail.htm", method = RequestMethod.GET)
   public String workdetail(HttpServletRequest request, Model model, Principal principal) {
      System.out.println("workdetail 시작");

      int num = Integer.parseInt(request.getParameter("num"));

      String id = principal.getName(); // 로그인한 아이디

      System.out.println("로그인한 아이디 : " + id);
      System.out.println("num : " + num);

      // 자유게시판 상세조회
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      WorkboardDTO workboarddto = workboarddao.getWorkBoard(num);
      
      // 로그인한 아이디 만나이 / 이름
      WorkformDTO logininfo = workboarddao.getLoginidAgeName(id);
      
      // 신청여부 확인(중복 신청 확인을 위한)
      int result = workboarddao.checkRequest(num, id);
      
      System.out.println(logininfo);
      System.out.println(workboarddto.toString());
      System.out.println(result);
      
      model.addAttribute("workboarddto", workboarddto); // 모델앤 뷰중에서 모델
      model.addAttribute("id", id);
      model.addAttribute("logininfo", logininfo);
      model.addAttribute("result", result);

      System.out.println("workdetail 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.workdetail";
   }

   // 일자리게시판 쓰기 (workinsert.htm)
   @RequestMapping(value = "workinsert.htm", method = RequestMethod.GET)
   public String workinsert() {
      System.out.println("workboardinsert 시작");
      System.out.println("workboardinsert 끝");
      // Tiles 적용 (UrlBase 방식)
      return "workboard.workinsert";
   }

   // 일자리게시판 쓰기 성공 (workinsert.htm)
   @RequestMapping(value = "workinsert.htm", method = RequestMethod.POST)
   public String workinsertsuccess(WorkboardDTO dto, Model model, Principal principal) {
      System.out.println("workinsertsuccess 시작");
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);

      // 아이디 security 이용해서 가져와서 dto 세팅
      System.out.println(principal.getName());
      dto.setId(principal.getName());

      System.out.println(dto.toString());

      int result = workboarddao.insertWorkBoard(dto);
      System.out.println("workinsertsuccess result=>" + result);

      model.addAttribute("result", result); // 실패 : 0 , 성공 : 1

      System.out.println("workinsertsuccess 끝");

      // Tiles 적용 (UrlBase 방식)
      return "redirect:worklist.htm";
   }

   // 일자리게시판 수정 (workupdate.htm)
   @RequestMapping(value = "workupdate.htm", method = RequestMethod.GET)
   public String workupdate(Model model, HttpServletRequest request) {
      System.out.println("workupdate 시작");
      int num = Integer.parseInt(request.getParameter("num"));
      System.out.println("글번호(num) : " + num);

      // 자유게시판 상세조회
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      WorkboardDTO workboarddto = workboarddao.getWorkBoard(num);

      System.out.println("workboarddto.toString()");
      System.out.println(workboarddto.toString());
      model.addAttribute("workboarddto", workboarddto);
      model.addAttribute("num", num);

      System.out.println("workupdate 끝");

      // Tiles 적용 (UrlBase 방식)
      return "workboard.workupdate";
   }

   // 일자리게시판 수정 성공 (workboardupdate.htm)
   @RequestMapping(value = "workupdate.htm", method = RequestMethod.POST)
   public String workboardupdatesuccess(WorkboardDTO dto, Model model) {
      System.out.println("workboardupdatesuccess 시작");
      System.out.println(dto.toString());

      // int result = 실패 : 0 , 성공 : 1
      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int result = workboarddao.updateWorkBoard(dto);

      System.out.println("updateNoticeBoard result=>" + result);

      model.addAttribute("result", result); // 실패 : 0 , 성공 : 1

      System.out.println("workboardupdatesuccess 끝");

      // Tiles 적용 (UrlBase 방식)
      return "redirect:workdetail.htm?num=" + dto.getNum();
   }

   // 일자리게시판 삭제 (workboarddelete.htm)
   @RequestMapping(value = "workdelete.htm", method = RequestMethod.GET)
   public String workdelete(Model model, HttpServletRequest request) {
      System.out.println("workdelete 시작");

      int num = Integer.parseInt(request.getParameter("num"));
      System.out.println("num" + num);

      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int result = workboarddao.deleteWorkBoard(num);

      model.addAttribute("result", result); // 실패 : 0 , 성공 : 1

      System.out.println("workdelete 끝");

      // Tiles 적용 (UrlBase 방식)
      return "redirect:worklist.htm";
   }

   // 일자리게시판 체크박스 검색 (비동기식) (worklistchecksearch.htm)
   @RequestMapping(value = "worklistchecksearch.htm", method = RequestMethod.POST)
   public View worklistchecksearch(Model model, HttpServletRequest request) {
      System.out.println("worklistchecksearch 시작");

      // View 에서 넘긴 값 받아오기
      String sukso          = request.getParameter("sukso");
      String siksa          = request.getParameter("siksa");
      String don            = request.getParameter("don");
      String searchvalue    = request.getParameter("searchvalue");
      
      // searchvalue null -> '%' 세팅
      if (searchvalue.length() == 0) {
         System.out.println("searchvalue : null 이므로  % 세팅 ");
         searchvalue = "%";
      }
      
      // 결과값 유무
      String result = "0";

      System.out.println("sukso : "      + sukso + " / " 
                       + "siksa : "      + siksa + " / " 
                       + "don   : "      + don   + " / "
                       + "searchvalue : " + searchvalue);
      
      HashMap map = new HashMap(); // collection

      // 체크박스 체크된것만 Map에 추가
      if(sukso.equals("false") && siksa.equals("false") && don.equals("false"))
      {
         System.out.println("체크박스 체크안했을때");
         map.put("sukso", "sukso");
         map.put("siksa", "siksa");
         map.put("don", "don");
      }
      
      if (sukso.equals("true")) {
         System.out.println("숙소체크");
         map.put("sukso", "sukso");
      }
      
      if (siksa.equals("true")) {
         System.out.println("식사체크");
         map.put("siksa", "siksa");
      }
      
      if (don.equals("true")) {
         System.out.println("급여체크");
         map.put("don", "don");
      }
      
      //searchvalue 
      map.put("searchvalue", searchvalue);

      WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      List<WorkboardDTO> worklist = workboarddao.checkboxSearch(map);

      
     // 결과값 출력
     for (WorkboardDTO dto : worklist) {
        System.out.println(dto.toString());
     }
      
     // 결과값이 없을경우..
     if (worklist.size() == 0) {
           System.out.println("result = 0");
        result = "0";
     } else {
        System.out.println("result = 1");
        result = "1";
     }

      System.out.println("최종 넘어가는 값 (result): " + result);

      model.addAttribute("result", result);
      model.addAttribute("worklist", worklist);

      System.out.println("worklistchecksearch 끝");

      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
   
   //일자리 신청시 등록인원 증가(workenroll.htm)
   @RequestMapping(value = "workenroll.htm", method = RequestMethod.GET)
   public String workenroll(String num){
	   
	  System.out.println("신청 후 신청인원 증가 시작");
      
	  //mapper 설정
	  WorkboardDAO workboarddao = sqlsession.getMapper(WorkboardDAO.class);
      int enrollnum = Integer.parseInt(num);
      System.out.println("enrollnum : " + enrollnum);
      
      //신청인원 증가
      workboarddao.workenroll(enrollnum);
      
      System.out.println("신청 후 신청인원 증가 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "redirect:worklist.htm";

   }
}