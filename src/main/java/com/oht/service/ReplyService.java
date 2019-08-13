package com.oht.service;

import java.util.List;

import com.oht.domain.Criteria;
import com.oht.domain.ReplyPageDTO;
import com.oht.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> list(Criteria cri, int bno);
	
	public int insert(ReplyVO replyVO);
	
	public int delete(int bno, int rno);
	
	public int modify(ReplyVO replyVO);
	
	public ReplyPageDTO getListPage(Criteria cri, int bno);
}
