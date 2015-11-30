package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.ReferenceDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageController {

	String exam = "hello 한글"; // 한글테스트
	String exam2 = "안녕하세요"; // 한글테스트2

	// 마이페이지 회원정보 (memberinfo.htm)
	@RequestMapping(value = "memberinfo.htm", method = RequestMethod.GET)
	public String memberinfo() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberinfo";
	}

	// 마이페이지 회원정보 수정 (memberupdate.htm)
	@RequestMapping(value = "memberupdate.htm", method = RequestMethod.GET)
	public String memberupdate() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberupdate";
	}

	// 마이페이지 회원정보 수정 (memberupdate.htm)
	@RequestMapping(value = "memberupdate.htm", method = RequestMethod.POST)
	public String memberupdatesuccess() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.memberinfo";
	}

	// 마이페이지 회원탈퇴 (memberdelete.htm)
	@RequestMapping(value = "memberdelete.htm", method = RequestMethod.POST)
	public String memberdelete() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "main.start";
	}

	// 일자리 등록 현황 (workaddlist.htm)
	@RequestMapping(value = "workaddlist.htm", method = RequestMethod.GET)
	public String workaddlist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workaddlist";
	}
	
	// 일자리 등록 상세보기 (workadddetail.htm)
	@RequestMapping(value = "workadddetail.htm", method = RequestMethod.GET)
	public String workadddetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workadddetail";
	}
	
	// 일자리 등록 취소 (workaddcancle.htm)
	@RequestMapping(value = "workaddcancle.htm", method = RequestMethod.GET)
	public String workaddcancle(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workaddlist";
	}
	
	// 일자리 등록에 대한 신청 양식 상세보기 ()
	
	
	// 일자리 신청 승인 ()
	

	// 일자리 신청 현황 (workrequestlist.htm)
	@RequestMapping(value = "workrequestlist.htm", method = RequestMethod.GET)
	public String workrequestlist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestlist";
	}
	
	// 일자리 신청 상세보기 (workrequestdetail.htm)
	@RequestMapping(value = "workrequestdetail.htm", method = RequestMethod.GET)
	public String workrequestdetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestdetail";
	}
	
	// 일자리 신청 취소 (workrequestcancle.htm)
	@RequestMapping(value = "workrequestcancle.htm", method = RequestMethod.GET)
	public String workrequestcancle(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.workrequestlist";
	}
	
	// 내 여행후기 목록 ()
	

	// 쪽지함 목록 (messagelist.htm)
	@RequestMapping(value = "messagelist.htm", method = RequestMethod.GET)
	public String messagelist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.messagelist";
	}

	// 쪽지 상세보기 (messagedetail.htm)
	@RequestMapping(value = "messagedetail.htm", method = RequestMethod.GET)
	public String messagedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "mypage.messagedetail";
	}
	
	
	// 레퍼런스 목록 (referencelist.htm)
		@RequestMapping(value = "referencelist.htm", method = RequestMethod.GET)
		public String referencelist() {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

		// 레퍼런스 쓰기 (referenceinsert.htm)
		@RequestMapping(value = "referenceinsert.htm", method = RequestMethod.GET)
		public String referenceinsert() {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.workinsert";
		}

		// 레퍼런스 쓰기 성공 (referenceinsert.htm)
		@RequestMapping(value = "referenceinsert.htm", method = RequestMethod.POST)
		public String referenceinsertsuccess(ReferenceDTO dto) {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

		// 레퍼런스 삭제 (referencedelete.htm)
		@RequestMapping(value = "referencedelete.htm", method = RequestMethod.GET)
		public String referencedelete(String num) {

			System.out.println("");

			// Tiles 적용 (UrlBase 방식)
			return "reference.worklist";
		}

}
