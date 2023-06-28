package com.leftb.bootexer.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {

	private int	qnum;
	private String qid;
	private String qtitle;
	private String qcontent;
	private Timestamp qdate;
	private int qhit;
}
