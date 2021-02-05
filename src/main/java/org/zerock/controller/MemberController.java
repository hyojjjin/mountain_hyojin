package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/member/*")
@Log4j
public class MemberController {

	private MemberService service;
	
	@GetMapping("/joinForm")
	public void register() {
	//get형식으로는 모르겠다
	}
	
	@PostMapping("/joinForm")
	public String register(MemberVO member) {
		service.register(member);
		//서비스에 일을 시키고
		return "redirect:/index.jsp";
	}
}
