package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// ##회원가입 - GET
	@GetMapping("/join")
	public void register() {
		// get형식으로는 모르겠당!
	}

	// ##회원가입 - POST
	@PostMapping("/join")
	public String register(MemberVO member, HttpServletRequest req) {
		
		Map<String, Boolean> errors = new HashMap<String, Boolean>();
		req.setAttribute("errors", errors);
		validate(errors, member);
		
		if (errors.isEmpty()) {
			service.register(member);
			// 서비스에 일을 시키고
			return "redirect:joinSuccess";
			

		} else {
			return "/member/join";
		}
		
	}
	// ##회원가입 - 아이디 중복 체크
	@GetMapping("/join/idDupCheck")
	@ResponseBody
	public String idDupCheck(String inputId) {
		
		//아이디 값이 있으면
		
		if(inputId.equals("")) {
			return "-2";
		} else {
			MemberVO member = service.getMember(inputId);
			
			if(member == null) {
				return "0"; //회원이 없으면 0 리턴
			} else {
				return "-1"; //회원있으면 -1 리턴
			}
		}
	}
	
	// ##로그인 성공 메시지
	@GetMapping("/joinSuccess")
	public void joinSuccess() {
	}

	// ##로그인 - GET
	@GetMapping("/login")
	public void login() {
	}

	// ##로그인 test - POST
	@PostMapping("/login")
	@ResponseBody
	public ResponseEntity<String> login(String inputId, String inputPw, HttpSession session) {
		
		log.info(inputId);
		log.info(inputPw);
		
		MemberVO user = service.getMember(inputId);
		
		//사용자의 아이디를 가진 회원이 있다면
		if(user != null && inputPw != null) {
			// member.getPassword(); 사용자가 적은 비밀번호
			// loginMember.getPassword(); 아이디로 검색해서 꺼낸 회원의 비밀번호
			
			boolean checkMemberPw = service.checkMember(inputPw, user.getPassword());
			//비밀번호 확인
			
			if(checkMemberPw) {
				session.setAttribute("authUser", user);
				//세션에 정보 담기
				
				//RedirectAttributes rttr;
				//		rttr.addAttribute("authUser", user);
				
				//		HttpServletRequest req
				//	req.getSession().setAttribute("authUser", user);
				
				
				
			}
				return new ResponseEntity<> ("success", HttpStatus.OK);
			} else {
				return new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);		
			}
		}

	
	/*
	 * // ##로그인 - POST
	 * 
	 * @PostMapping("/login") public String login(String inputId, String inputPw,
	 * HttpSession session) {
	 * 
	 * log.info(inputId); log.info(inputPw);
	 * 
	 * MemberVO user = service.getMember(inputId);
	 * 
	 * //사용자의 아이디를 가진 회원이 있다면 if(user != null && inputPw != null) { //
	 * member.getPassword(); 사용자가 적은 비밀번호 // loginMember.getPassword(); 아이디로 검색해서 꺼낸
	 * 회원의 비밀번호
	 * 
	 * boolean checkMemberPw = service.checkMember(inputPw, user.getPassword());
	 * //비밀번호 확인
	 * 
	 * if(checkMemberPw) { session.setAttribute("authUser", user); //세션에 정보 담기
	 * 
	 * //RedirectAttributes rttr; // rttr.addAttribute("authUser", user);
	 * 
	 * // HttpServletRequest req // req.getSession().setAttribute("authUser", user);
	 * 
	 * return "redirect:/index.jsp"; } } return ""; }
	 */
	
	
	// ##로그아웃 
	@GetMapping("/logout")
	public String logout(MemberVO member, HttpSession session) {
		
		if(session != null) {
			session.invalidate();
		}
		
		return "redirect:/index.jsp";
	}
	//로그아웃 post 방식은?? 왜 겟방식이지
	
	// ##joinErrors 
	public void validate(Map<String, Boolean> errors, MemberVO member) {
		checkEmpty(errors, member.getId(), "memberId");
		checkEmpty(errors, member.getPassword(), "memberPw");
		checkEmpty(errors, member.getPwConfirm(), "memberPwConfirm");
		checkEmpty(errors, member.getEmail(), "memberEmail");
		checkEmpty(errors, member.getName(), "memberName");
		checkEmpty(errors, member.getNickname(), "memberNickname");
		checkEmpty(errors, member.getLoc(), "memberLoc");
		//checkEmpty 메소드로 데이터가 비어있는 지 확인. 단, manager 데이터는 제외
		
		boolean checkMemberPw = service.checkMember(member.getPassword(), member.getPwConfirm());
		//비밀번호가 동일한 지 확인
		
		if(member.getPwConfirm() != null && !checkMemberPw) {
			errors.put("pwNotMatch", true);
		}
	}
	
	public void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		
		if(value == null || value.isEmpty()) {
			errors.put(fieldName, true);
		}
	}
	
	
	// ##내 정보 보기
	@GetMapping("/myHome")
	public String myHome() {
		return "/member/myHome";
		
	//	return "redirect:member/myHome";
		//	return "redirect:myHome";
		//redirect는 왜 안되지?
		//왜 무한로프가 도는 거지?
		
		//=> redirect 는 string으로 리턴, string으로 리턴되면 앞엔 폴더, 뒤엔 jsp가 붙아서 리턴됨.(servlet context에서 확인 가능)
	}
	
	// ##내 정보 수정 - GET, void(경로로 바로 이동)
	@GetMapping("/myModify")
	public void myModifyPage() {
	
	}
	
	// ##내 정보 수정 - POST
	@PostMapping("/myModify")
	public String myModify(MemberVO member, HttpSession session) {
		
		MemberVO user = (MemberVO) session.getAttribute("authUser");
		log.info(user);
		log.info(service);
		log.info(member);
		MemberVO userMember = service.getMember(user.getId());
		
		boolean checkMember = service.checkMember(userMember.getId(), member.getId());
		//같은 아이디인지 확인
		
		if(checkMember) {
			service.modify(member); 
			
			log.info(member);
			
			session.setAttribute("authUser", member);
			//수정된 멤버 정보를 세션에 저장
			
			return "/member/myHome";
			
		
		}
	
		return "/member/myHome";
		//오류 표시 해야함. 또는 홈으로 이동?? 어떻게 할까 모달창이 떠야하나?
		
	}
	
	/*
	 * // ##내 정보 수정
	 * 
	 * @GetMapping("/myModify") public String myModify(MemberVO member) {
	 * service.modify(member); return "/member/myHome"; }
	 */
	
	// ##내 정보 수정 - GET, void(경로로 바로 이동)
	
	
	
	@DeleteMapping("/delete")
	@ResponseBody
	public ResponseEntity<String> delete(String userId, String pwConfirm, HttpSession session) {
		//회원 삭제..
		log.info(userId);
		log.info(pwConfirm);
		log.info("회원탈퇴 모달");
		
		//userId를 이용해서 디비에서 데이터를 겟해준다.
		//가져온 데이터의 pw 값과 pwConfirm으로 받은 값을 비교 (스트링이니까 equals로 비교)
		//pw가 같으면?
		//회원 삭제 실행
		
		//pw가 다르면
		//ajax로 모달창에 비밀번호가 다르다는 메시지 노출
		//=>이거슨 어떠케해???
		
		MemberVO userMember = service.getMember(userId);
		
		if(userMember.getPassword().equals(pwConfirm)) {
			service.remove(userId);
			log.info("회원탈퇴 성공!");
			
			if(session != null) {
				session.invalidate();
			}
			
			return new ResponseEntity<> ("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> (HttpStatus.INTERNAL_SERVER_ERROR);		
		}
	}
	
	

	
}