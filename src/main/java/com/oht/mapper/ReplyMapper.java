package com.oht.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oht.domain.Criteria;
import com.oht.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> list(@Param("cri") Criteria cri, @Param("bno") int bno);

	public int insert(ReplyVO replyVO);
	
	public int delete(int rno);
	
	public int modify(ReplyVO replyVO);
	
	public int getRnoCount(int bno);

}
