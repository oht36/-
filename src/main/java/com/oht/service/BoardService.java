package com.oht.service;

import java.util.List;

import com.oht.domain.BoardVO;
import com.oht.domain.Criteria;


public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	
	public void insert(BoardVO boardVO);
	
	public BoardVO get(int bno);
	
	public void modify(BoardVO boardVO);
	
	public void remove(int bno);
	
	public int getTotal(Criteria cri);

}
