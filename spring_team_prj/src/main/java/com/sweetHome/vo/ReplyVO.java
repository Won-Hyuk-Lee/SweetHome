package com.sweetHome.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyVO {
	private int replySeq;
	private int boardSeq;
	private int userSeq;
	private String reply;
	private Date createdDate;
	private UserVO user;
}
