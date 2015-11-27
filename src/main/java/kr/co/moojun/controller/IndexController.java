package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	// index.htm 요청 들어오면 View 페이지 제공

		@RequestMapping("index.htm")
		public String index() {
			
			// 기존의 view 처리하는 코드
			// return "index.jsp";
			System.out.println("StartPage Display");
			// Tiles 적용 (UrlBase 방식)
			return "WEB-INF/views/main/start.jsp";
		}
		
}








