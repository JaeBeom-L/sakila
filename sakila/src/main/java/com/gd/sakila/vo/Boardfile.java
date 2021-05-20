package com.gd.sakila.vo;

import lombok.Data;

@Data
public class Boardfile {
	private int boardfiledId;
	private int boardId;
	private String boardfileName;
	private String boardfileType;
	private long boardfileSize;
}
