package com.leftb.bootexer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.leftb.bootexer.dto.BoardDto;

@Mapper
public interface BootExerDao {

	public int join(String mid, String mpw, String mname, String memail);
	public int login(String mid, String mpw);
	public int checkId(String mid);
	public ArrayList<BoardDto> list();
	public BoardDto content(String qnum);
	public void write(String qid, String qtltle, String qcontent);
	public void modify(String qnum, String qtltle, String qcontent);
	public void delete(String qnum);
	public void uphit(String qnum);
}
