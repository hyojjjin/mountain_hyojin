package org.zerock.service;

import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service //서비스 bean 객체 생성
@AllArgsConstructor	//생성자 생성
@Log4j
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO member) {
		mapper.insertSelectKey(member);
	}
	
	@Override
	public MemberVO get(Long no) {
		return mapper.read(no);
	}
	
	@Override
	public boolean modify(MemberVO member) {
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(Long no) {
		return mapper.delete(no) == 1;
	}
}
