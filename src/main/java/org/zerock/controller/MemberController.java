package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

	// ##회원가입
	@GetMapping("/join")
	public void register() {
		// get형식으로는 모르겠당!
	}

	@PostMapping("/join")
	public String register(MemberVO member) {
		service.register(member);
		// 서비스에 일을 시키고
		return "redirect:/index.jsp";
	}

	// ##로그인 - GET
	@GetMapping("/login")
	public void login() {
	}

	// ##로그인 - POST
	@PostMapping("/login")
	public String login(MemberVO member, HttpSession session) {
		
		MemberVO user = service.getMember(member.getId());
		
			//사용자의 아이디를 가진 회원이 있다면
			if(user != null && member.getPassword() != null) {
				// member.getPassword(); 사용자가 적은 비밀번호
				// loginMember.getPassword(); 아이디로 검색해서 꺼낸 회원의 비밀번호
				// 이 부분 간단하게 하고싶은데!
			
				if(member.getPassword().equals(user.getPassword())) {
					
					
			//RedirectAttributes rttr;
			//		rttr.addAttribute("authUser", user);
			
			//		HttpServletRequest req
			//	req.getSession().setAttribute("authUser", user);
					
					session.setAttribute("authUser", user);
					//세션에 정보 담기
	
					
					return "redirect:/index.jsp";
				}
		
			}
			return "";
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
