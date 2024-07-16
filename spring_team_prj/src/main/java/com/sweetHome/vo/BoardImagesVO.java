package com.sweetHome.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardImagesVO {
	private int boardImageSeq;
	private int boardSeq;
	private String oname;
	private String sname;
	private long fsize;
	private String fpath;
}
