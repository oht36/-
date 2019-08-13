package com.oht.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oht.domain.Criteria;
import com.oht.domain.ReplyPageDTO;
import com.oht.domain.ReplyVO;
import com.oht.mapper.BoardMapper;
import com.oht.mapper.ReplyMapper;

@Service

public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<ReplyVO> list(Criteria cri, int bno) {
		// TODO Auto-generated method stub
		
		return replyMapper.list(cri, bno);
	}

	@Override
	@Transactional
	public int insert(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		
		boardMapper.updateReplies(replyVO.getBno(), 1);
		
		return replyMapper.insert(replyVO);
	}

	@Override
	@Transactional
	public int delete(int bno, int rno) {
		// TODO Auto-generated method stub
				
		boardMapper.updateReplies(bno, -1);
		
		return replyMapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		
		return replyMapper.modify(replyVO);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, int bno) {
		// TODO Auto-generated method stub
		return new ReplyPageDTO(replyMapper.getRnoCount(bno), replyMapper.list(cri, bno));
	}

}
