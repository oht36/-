package com.oht.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oht.domain.BoardVO;
import com.oht.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList(Criteria cri);
	
	public void insert(BoardVO boardVO);
	
	public BoardVO read(int bno);
	
	public void modify(BoardVO boardVO);
	
	public void remove(int bno);

	public int getTotalCount(Criteria cri);
	
	public void updateReplies(@Param("bno")int bno, @Param("amount")int amount);
}
