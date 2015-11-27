package kr.co.moojun.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class IndexController {
	// index.htm 요청 들어오면 View 페이지 제공

		@RequestMapping("index.htm")
		public String index() {
			
			// 기존의 view 처리하는 코드
			// return "index.jsp";
		
			// Tiles 적용 (UrlBase 방식)
			return "WEB-INF/views/main/start.jsp";
}
}







