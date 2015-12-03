package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.moojun.model.DTO.ReferenceDTO;


@Controller
public class ReferenceController {
	
	//view단 검토할 필요있음.
	
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
