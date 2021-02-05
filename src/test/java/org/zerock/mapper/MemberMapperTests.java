package org.zerock.mapper;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Autowired
	private MemberMapper mapper;
	
	@Test
	public void testGetList() {
		List<MemberVO> list = mapper.getList();
		assertEquals(list.size(), 0);
	}
	
	@Test
	public void testInsertSelectKey() {
		MemberVO member = new MemberVO();
		member.setId("hi");
		member.setEmail("hyo@jin.com");
		member.setPassword(123);
		member.setName("hyojin");
		member.setNickname("hyojiny");
		member.setLoc("home");
		
		int before = mapper.getList().size();
		
		mapper.insertSelectKey(member);
		
		int after = mapper.getList().size();
		
		assertEquals(before+1, after);
	}
	
	@Test
	public void testRead() {
		MemberVO member = mapper.read(6L);
		log.info(member);
	}
	//이거 알아보려면 가상의 데이터를 넣어봐야함
	//내일 데이터 베이스에 회원 가입 한개 넣어서 테스트 확인.
	
	@Test
	public void testUpdate() {
		MemberVO member = new MemberVO();
		member.setId("hi5");
		member.setEmail("kimhyo5@jin.com");
		member.setPassword(123);
		member.setName("kimhyojin");
		member.setNickname("kimhyojiny5");
		member.setLoc("myhome");
		
		mapper.insertSelectKey(member);
		
		member.setEmail("modifyhyo5@jin.com");
		member.setPassword(111);
		member.setNickname("modifykimhyojiny5");
		member.setLoc("modifymyhome");
		
		int cnt = mapper.update(member);
		//mapper.update()메소드에 영향을 받은 행의 갯수
		
		assertEquals(1, cnt);
		
		MemberVO updateMember = mapper.read(member.getNo());
		assertEquals("modifyhyo5@jin.com", updateMember.getEmail());
		assertEquals(111, updateMember.getPassword());
		assertEquals("modifykimhyojiny5", updateMember.getNickname());
		assertEquals("modifymyhome", updateMember.getLoc());
		
	}
	
	@Test
	public void testDelete() {
		int before = mapper.getList().size();
		
		int cnt = mapper.delete(29L); //29번 삭제 테스트 완료 -> 29번 없음
		assertEquals(1, cnt);
		
		int after = mapper.getList().size();
		
		assertEquals(before-1, after);
				
	}
	

}
