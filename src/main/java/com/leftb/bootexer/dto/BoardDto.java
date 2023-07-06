package com.leftb.bootexer.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDto {

	private int	qnum;
	private String qid;
	private String qtitle;
	private String qcontent;
	private Timestamp qdate;
	private int qhit;
}
