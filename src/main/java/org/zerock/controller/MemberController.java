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

	
	//##회원가입
	@GetMapping("/joinForm")
	public void register() {
	//get형식으로는 모르겠당!
	}
	
	@PostMapping("/joinForm")
	public String register(MemberVO member) {
		service.register(member);
		//서비스에 일을 시키고
		return "redirect:/index.jsp";
	}
	
	//##로그인
	@GetMapping("/login")
	public void login() {
	}
	
	@PostMapping("/login")
	public MemberVO login(MemberVO member) {
		
		try {
			MemberVO loginMember = service.getMember(member.getId());
		
			//사용자가 적은 아이디를 가진 회원이 있다면
			if(loginMember != null) {
				String getPw = member.getPassword(); //사용자가 적은 비밀번호
				String memPw = loginMember.getPassword(); //아이디로 검색해서 꺼낸 회원의 비밀번호
			
				if(getPw.equals(memPw)) {
					//비밀번호 확인 메소드를 만들어주고싶은데 어따가 어떠케 만들징?
					return "로그인 성공";
				}
				
		
			} catch {
				
			}
		
		}
		/*
		 * member.id() -> 로그인 폼에서 받은 아이디
		 * 
		 * MemberVO a = service.get(member.id()); ->
		 * 
		 * member.getPassword() == a.password -> 같으면 로그인 성공!
		 * 
		 * --------> a을
		 */
	
		
		return "";
	}
	
	
	
}
