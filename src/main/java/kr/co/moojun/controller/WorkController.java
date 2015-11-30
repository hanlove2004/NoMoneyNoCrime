package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.WorkboardDTO;

@Controller
public class WorkController {

	// 일자리게시판 목록 (workboardlist.htm)
	@RequestMapping(value = "workboardlist.htm", method = RequestMethod.GET)
	public String workboardlist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.worklist";
	}

	// 일자리게시판 상세보기 (workboarddetail.htm)
	@RequestMapping(value = "workboarddetail.htm", method = RequestMethod.GET)
	public String workboarddetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.workdetail";
	}

	// 일자리게시판 쓰기 (workboardinsert.htm)
	@RequestMapping(value = "workboardinsert.htm", method = RequestMethod.GET)
	public String workboardinsert() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.workinsert";
	}

	// 일자리게시판 쓰기 성공 (workboardinsert.htm)
	@RequestMapping(value = "workboardinsert.htm", method = RequestMethod.POST)
	public String workboardinsertsuccess(WorkboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.worklist";
	}

	// 일자리게시판 수정 (workboardupdate.htm)
	@RequestMapping(value = "workboardupdate.htm", method = RequestMethod.GET)
	public String workboardupdate(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.workupdate";
	}

	// 일자리게시판 수정 성공 (workboardupdate.htm)
	@RequestMapping(value = "workboardupdate.htm", method = RequestMethod.POST)
	public String workboardupdatesuccess(WorkboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.workdetail";
	}

	// 일자리게시판 삭제 (workboarddelete.htm)
	@RequestMapping(value = "workboarddelete.htm", method = RequestMethod.GET)
	public String workboarddelete(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.worklist";
	}
	
	// 일자리 신청 (workrequest.htm)
	@RequestMapping(value = "workrequest.htm", method = RequestMethod.POST)
	public String workrequest(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "workboard.workdetail";
	}

}
