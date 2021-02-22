package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.mountain.MountainVO;
import org.zerock.domain.wish.WishVO;
import org.zerock.service.mountain.MountainService;
import org.zerock.service.wish.WishService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/wish/*")
@Log4j
public class WishController {

	private WishService service;
	
	private MountainService mtService;
	
	// ##찜 등록
	@PostMapping("register.do")
	public void register(WishVO wish) {
		
	service.register(wish);
	log.info("찜성공");
	
	//찜등록은 되나 register.jsp를 찾음 왜 찾는거야 정말!
	
	
	//찜 등록은 어떻게 진행이 될까?
	//하트를 누르면 session에 있는 user의 memberNo와
	//해당 산에 가지고 있는 mountainNo이
	//wish에 넘어가고... 넘어가려면 input hidden name으로 값을 받아야하나?
	//아니면 ajax로 값이 넘어오려나?
	}
	
	@GetMapping("/list")
	public String list(Model model, WishVO wish, HttpSession session) {
		//long타입인데 string으로 들어가서 그런거야? 그럼 어떠케해야대는거야..
		List<WishVO> wishList = service.getMemberMem(wish.getMember_no());
		model.addAttribute("wishList", wishList);
		log.info(wishList);
		
		MountainVO mountain = new MountainVO();
		mountain = mtService.get(wish.getMountain_no());
		model.addAttribute("mountain", mountain);
		
		
		int wishCount = (int) service.wishSize(wish.getMember_no());
		session.setAttribute("wishCount", wishCount);
		// 리스트에서 찜 개수 파악해서 세션에 담기
		
		//알다가도 모르겠네 정말!
		return "/wish/list";
	}
}


