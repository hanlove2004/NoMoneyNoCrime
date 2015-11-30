package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
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

}
