package kr.co.moojun.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DAO.WorkformDAO;
import kr.co.moojun.model.DTO.WorkformDTO;

@Controller
public class WorkformController {
   ///////////////////////////////////////////////////////////////////////
   // int insertWorkform(WorkformDTO Workformdto); // 일자리신청폼 작성
   // WorkformDTO getWorkformDetail(int num); // 일자리신청폼 디테일
   ////////////////////////////////////////////////////////////////////////////
   
   @Autowired
   private SqlSession sqlsession;
   
   // 일자리신청폼 작성 (/workboard/workrequest.htm)
   @RequestMapping(value = "/workboard/workrequest.htm", method = RequestMethod.POST)
   public String workforminsert(WorkformDTO dto, Model model) {

      System.out.println("workforminsert 시작");
      System.out.println(dto.toString());
      
      WorkformDAO workformdao = sqlsession.getMapper(WorkformDAO.class);
      int result = workformdao.insertWorkform(dto);
      
      System.out.println("updateNoticeBoard result=>" + result);
      
      model.addAttribute("result", result); //실패 : 0 , 성공 : 1
      
      System.out.println("workforminsert 끝");
      
      // Tiles 적용 (UrlBase 방식)
      return "workboard.workdetail";
   }
   
   // 일자리신청폼 디테일(/mypage/workformdetail.htm)
   @RequestMapping(value = "/mypage/workformdetail.htm", method = RequestMethod.POST)
   public String workrformdetail(int num, Model model) {
      System.out.println("workrformdetail 시작");

      //일자리신청폼 디테일
      WorkformDAO workformdao= sqlsession.getMapper(WorkformDAO.class); 
      WorkformDTO workformdto =workformdao.getWorkformDetail(num);
      
      System.out.println(workformdto.toString());
      model.addAttribute("workformdto", workformdto); // 모델앤 뷰중에서 모델
      
      System.out.println("workrformdetail 끝");
      
      // Tiles 적용 (UrlBase 방식)
      ////////////수정요망//////////////
      return "workboard.workdetail";   
   }
}