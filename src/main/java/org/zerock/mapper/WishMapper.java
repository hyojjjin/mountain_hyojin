package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.wish.WishVO;

public interface WishMapper {
	public void insertSelectKey(WishVO wish); //찜 등록
	public List<WishVO> getList(); //전체 찜 리스트
	public WishVO readWishMem(Long member_no); //찜 리스트 - 회원
	public WishVO readWishMt(Long mountain_no); //찜 리스트 - 산
	public int delete(Long member_no, Long mountain_no); //찜 삭제

}
