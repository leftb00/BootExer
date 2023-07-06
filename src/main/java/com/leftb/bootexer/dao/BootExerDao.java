package com.leftb.bootexer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.leftb.bootexer.dto.BoardDto;
import com.leftb.bootexer.dto.MemberDto;

@Mapper
public interface BootExerDao {

	public int join(String mid, String mpw, String mname, String memail);
	public int login(String mid, String mpw);
	public int checkId(String mid);
	public MemberDto getMember(String mid);
	public void modifyMember(String mid, String mpw, String mname, String memail);
	public ArrayList<BoardDto> list(String page, int page_size);
	public int count();
	public BoardDto content(String qnum);
	public void write(String qid, String qtltle, String qcontent);
	public void modify(String qnum, String qtltle, String qcontent);
	public void delete(String qnum);
	public void uphit(String qnum);
}
