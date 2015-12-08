package kr.co.moojun.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.co.moojun.model.DAO.EpilogueboardDAO;
import kr.co.moojun.model.DAO.MemberDAO;
import kr.co.moojun.model.DTO.EpilogueboardDTO;
import kr.co.moojun.model.DTO.MemberDTO;
import kr.co.moojun.model.DTO.WorkboardDTO;

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
         temp = "%";
      }
      
      EpilogueboardDAO epilogueboarddao = sqlsession.getMapper(EpilogueboardDAO.class);
      List<String> keywordlist = epilogueboarddao.searchKeyword(keyword);
      
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
   
   //searchbuttonclick 비동기(모달로  제목이나 내용으로 여행후기목록 가져오기)
   @RequestMapping(value = "searchbuttonclick.htm", method = RequestMethod.POST)
   public View searchButtonClick(String keyword, Model model) {
      System.out.println("searchButtonClick start");
      System.out.println("keyword : " + keyword);
      
      String temp = keyword;
      String result = "0";   //search한 값이 null 인경우 : "0" 아닌경우 : "1"
      
      //title -> null값이 들어온경우 
      if(temp.length() == 0){
         System.out.println("temp.length() == 0");
         temp = "%";
      }
      
      EpilogueboardDAO epilogueboarddao = sqlsession.getMapper(EpilogueboardDAO.class);
      List<EpilogueboardDTO> searchbuttonlist = epilogueboarddao.searchButtonClick(keyword);
      
      //결과값이 없는 경우
      if(searchbuttonlist.size() == 0){
         System.out.println("결과값이 없는 경우 : result = 0");
         result = "0";
      }
      else//결과있는경우
      {
         System.out.println("결과값이 없는 경우 : result = 1");
         result = "1";
         
         // 최종 list결과값 출력
         for (EpilogueboardDTO list : searchbuttonlist) {
            System.out.println(list.toString());
         }
         
      }

      System.out.println("result(최종값) : " + result);
      
      model.addAttribute("searchbuttonlist", searchbuttonlist); 
      model.addAttribute("result"          , result); 

      System.out.println("searchButtonClick end");
      
      // Tiles 적용 (UrlBase 방식)
      return jsonview;
   }
}