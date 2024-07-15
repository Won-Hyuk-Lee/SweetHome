package com.sweetHome.vo;

import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class CommunityImageVO {
    private int communityImageSeq;
    private String oname;
    private String sname;
    private long fsize;
    private String fpath;
    private int communitySeq;
}