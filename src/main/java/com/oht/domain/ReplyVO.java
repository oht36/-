package com.oht.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReplyVO {

	private int rno;
	private int bno;
	private String reply;
	private String replyer;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date regdate;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date updatedate;
}
