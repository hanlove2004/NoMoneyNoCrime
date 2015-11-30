package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.EpilogueboardDTO;
import kr.co.moojun.model.DTO.Reply_EpilogueDTO;

@Controller
public class EpilogueboardController {

	// 여행후가 목록 (epiloguelist.htm)
	@RequestMapping(value = "epiloguelist.htm", method = RequestMethod.GET)
	public String epiloguelist() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguelist";
	}

	// 여행후가 상세보기 (epiloguedetail.htm)
	@RequestMapping(value = "epiloguedetail.htm", method = RequestMethod.GET)
	public String epiloguedetail(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguedetail";
	}

	// 여행후가 쓰기 (epilogueinsert.htm)
	@RequestMapping(value = "epilogueinsert.htm", method = RequestMethod.GET)
	public String epilogueinsert() {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epilogueinsert";
	}

	// 여행후가 쓰기 성공 (epilogueinsert.htm)
	@RequestMapping(value = "epilogueinsert.htm", method = RequestMethod.POST)
	public String epilogueinsertsuccess(EpilogueboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguelist";
	}

	// 여행후가 수정 (epilogueupdate.htm)
	@RequestMapping(value = "epilogueupdate.htm", method = RequestMethod.GET)
	public String epilogueupdate(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epilogueupdate";
	}

	// 여행후가 수정 성공 (epilogueupdate.htm)
	@RequestMapping(value = "epilogueupdate.htm", method = RequestMethod.POST)
	public String epilogueupdatesuccess(EpilogueboardDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguedetail";
	}

	// 여행후가 삭제 (epiloguedelete.htm)
	@RequestMapping(value = "epiloguedelete.htm", method = RequestMethod.GET)
	public String epiloguedelete(String num) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "epilogue.epiloguelist";
	}

	// 여행후가 댓글 (epiloguereply.htm)
	@RequestMapping(value = "epiloguereply.htm", method = RequestMethod.POST)
	public String epiloguereply(Reply_EpilogueDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}

	// 여행후가 댓글 삭제 (epiloguereplydelete.htm)
	@RequestMapping(value = "epiloguereplydelete.htm", method = RequestMethod.GET)
	public String epiloguereplydelete(Reply_EpilogueDTO dto) {

		System.out.println("");

		// Tiles 적용 (UrlBase 방식)
		return "";
	}

}
