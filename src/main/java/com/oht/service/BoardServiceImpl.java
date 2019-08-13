package com.oht.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oht.domain.BoardVO;
import com.oht.domain.Criteria;
import com.oht.mapper.BoardMapper;
import com.oht.mapper.ReplyMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	
	private BoardMapper boardMapper;
	
	private ReplyMapper replyMapper;

	@Override
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		
		return boardMapper.getList(cri);
	}

	@Override
	public void insert(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		boardMapper.insert(boardVO);
		
	}

	@Override
	public BoardVO get(int bno) {
		// TODO Auto-generated method stub
		
		return boardMapper.read(bno);
	}

	@Override
	public void modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
		boardMapper.modify(boardVO);
		
	}

	@Override
	@Transactional
	public void remove(int bno) {
		// TODO Auto-generated method stub
		
		boardMapper.remove(bno);
		
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return boardMapper.getTotalCount(cri);
	}

}
