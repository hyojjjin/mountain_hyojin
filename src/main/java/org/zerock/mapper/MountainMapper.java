package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.mountain.MCriteria;
import org.zerock.domain.mountain.MountainVO;

public interface MountainMapper {

	public List<MountainVO> getList();
	
	public void insert(MountainVO mountain);
	
	public void insertSelectKey(MountainVO mountain);
	
	public int delete(Long no);
	
	public int update(MountainVO mountain);

	public List<MountainVO> getListWithPaging(MCriteria cri);

	public MountainVO read(Long no);
	
}
