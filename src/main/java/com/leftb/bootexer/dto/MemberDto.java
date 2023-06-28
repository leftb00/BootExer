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
public class MemberDto {

	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private Timestamp mdate;
}
