package kr.co.moojun.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
		
		// main.htm 요청 들어오면 View 페이지 제공
		@RequestMapping("main.htm")
		public String main() {
			
			System.out.println("StartPage Display");
			
			// Tiles 적용 (UrlBase 방식)
			return "main.start";
		}
		
		// main.htm 요청 들어오면 View 페이지 제공
		@RequestMapping("submain.htm")
		public String submain() {
			
			System.out.println("SUBMAIN Display");
			
			// Tiles 적용 (UrlBase 방식)
			return "submain.main";
		}
		
}








