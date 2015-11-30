package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.NoticeboardDTO;
import kr.co.moojun.model.DTO.Reply_NoticeDTO;

@Controller
public class NoticeboardController {
	
	//공지사항 목록 (noticelist.htm)
	@RequestMapping(value="noticelist.htm",method=RequestMethod.GET)
	public String noticelist(){
		
		System.out.println("");
		
		// Tiles 적용 (UrlBase 방식)
		return "notice.noticelist";
	}
	
	// 공지사항 상세보기 (noticedetail.htm)
	@RequestMapping(value = "noticedetail.htm", method = RequestMethod.GET)
	public String noticedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticedetail";
	}
	
	// 공지사항 쓰기 (noticeinsert.htm)
	@RequestMapping(value = "noticeinsert.htm", method = RequestMethod.GET)
	public String noticeinsert() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticeinsert";
	}
	
	// 공지사항 쓰기 성공 (noticeinsert.htm)
	@RequestMapping(value = "noticeinsert.htm", method = RequestMethod.POST)
	public String noticeinsertsuccess(NoticeboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticelist";
	}
	
	// 공지사항 수정 (noticeupdate.htm)
	@RequestMapping(value = "noticeupdate.htm", method = RequestMethod.GET)
	public String noticeupdate(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticeupdate";
	}
	
	// 공지사항 수정 성공 (noticeupdate.htm)
	@RequestMapping(value = "noticeupdate.htm", method = RequestMethod.POST)
	public String noticeupdatesuccess(NoticeboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticedetail";
	}
	
	// 공지사항 삭제 (noticedelete.htm)
	@RequestMapping(value = "noticedelete.htm", method = RequestMethod.GET)
	public String noticedelete(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "notice.noticelist";
	}
	
	// 공지사항 댓글 (noticereply.htm)
	@RequestMapping(value = "noticereply.htm", method = RequestMethod.POST)
	public String noticereply(Reply_NoticeDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}
	
	// 공지사항 댓글 삭제 (noticereplydelete.htm)
	@RequestMapping(value = "noticereplydelete.htm", method = RequestMethod.GET)
	public String noticereplydelete(Reply_NoticeDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}
	
}
