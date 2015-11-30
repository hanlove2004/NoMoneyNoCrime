package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.FreeboardDTO;
import kr.co.moojun.model.DTO.Reply_FreeDTO;

@Controller
@RequestMapping("/freeboard/")
public class FreeboardController {
	
	//자유게시판 목록 (freelist.htm)
	@RequestMapping(value="freelist.htm",method=RequestMethod.GET)
	public String freelist(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "free.freelist";
	}
	
	// 자유게시판 상세보기 (freedetail.htm)
	@RequestMapping(value = "freedetail.htm", method = RequestMethod.GET)
	public String freedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freedetail";
	}
	
	// 자유게시판 쓰기 (freeinsert.htm)
	@RequestMapping(value = "freeinsert.htm", method = RequestMethod.GET)
	public String freeinsert() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freeinsert";
	}
	
	// 자유게시판 쓰기 성공 (freeinsert.htm)
	@RequestMapping(value = "freeinsert.htm", method = RequestMethod.POST)
	public String freeinsertsuccess(FreeboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freelist";
	}
	
	// 자유게시판 수정 (freeupdate.htm)
	@RequestMapping(value = "freeupdate.htm", method = RequestMethod.GET)
	public String freeupdate(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freeupdate";
	}
	
	// 자유게시판 수정 성공 (freeupdate.htm)
	@RequestMapping(value = "freeupdate.htm", method = RequestMethod.POST)
	public String freeupdatesuccess(FreeboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freedetail";
	}
	
	// 자유게시판 삭제 (freedelete.htm)
	@RequestMapping(value = "freedelete.htm", method = RequestMethod.GET)
	public String freedelete(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "free.freelist";
	}
	
	// 자유게시판 댓글 (freereply.htm)
	@RequestMapping(value = "freereply.htm", method = RequestMethod.POST)
	public String freereply(Reply_FreeDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}
	
	// 자유게시판 댓글 삭제 (freereplydelete.htm)
	@RequestMapping(value = "freereplydelete.htm", method = RequestMethod.GET)
	public String freereplydelete(Reply_FreeDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}

}
