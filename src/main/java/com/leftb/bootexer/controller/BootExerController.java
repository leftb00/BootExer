package com.leftb.bootexer.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leftb.bootexer.dao.BootExerDao;
import com.leftb.bootexer.dto.BoardDto;
import com.leftb.bootexer.dto.MemberDto;

@Controller
public class BootExerController {

	@Autowired
	private SqlSession sqlSession;
	private final int page_size = 10;

	@RequestMapping(value = {"/", "/index"})
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/join_form")
	public String join_form() {
		return "join_form";
	}

	@RequestMapping(value = "/join")
	public String join(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		String mid = request.getParameter("mid");
		String mname = request.getParameter("mname");
		if (dao.checkId(mid) == 0 &&
			dao.join(mid, request.getParameter("mpw"),
				mname, request.getParameter("memail")) == 1)
		{
			model.addAttribute("mid", mid);
			model.addAttribute("mname", mname);
			
			return "joinOk";
		}

		return "joinFail";
	}

	@RequestMapping(value = "/login_form")
	public String login_form() {
		return "login_form";
	}

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpSession session, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		String mid = request.getParameter("mid");
		int loginCheck = dao.login(mid, request.getParameter("mpw"));
		model.addAttribute("loginCheck", String.valueOf(loginCheck));
		if(loginCheck == 1) {
			session.setAttribute("mid", mid);
		}

		return "loginOk";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpSession session, Model model) {

		session.setAttribute("mid", null);
		return "redirect:index";
	}

	@RequestMapping(value = "/modify_member_form")
	public String modify_member_form(HttpSession session, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		MemberDto dto = dao.getMember(session.getAttribute("mid").toString());
		model.addAttribute("dto", dto);

		return "modify_member_form";
	}

	@RequestMapping(value = "/modify_member")
	public String modify_member(HttpServletRequest request, HttpSession session, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		dao.modifyMember(
			session.getAttribute("mid").toString(), request.getParameter("mpw"),
			request.getParameter("mname"), request.getParameter("memail"));

		return "redirect:index";
	}

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, Model model) {
		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		String page = request.getParameter("page");
		if(page == null) page = "1";

		ArrayList<BoardDto> dtos = dao.list(page, page_size);
		int count = dao.count();
		int page_count = (count-1)/page_size+1;
		model.addAttribute("dtos", dtos);
		model.addAttribute("page", page);
		model.addAttribute("page_size", page_size);
		model.addAttribute("page_count", page_count);
		model.addAttribute("total", count);

		return "list";
	}

	@RequestMapping(value = "/write_form")
	public String write_form(HttpServletRequest request, Model model) {

		model.addAttribute("page", request.getParameter("page"));
		return "write_form";
	}

	@RequestMapping(value = "/write")
	public String write(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		dao.write(request.getParameter("qid"),
				request.getParameter("qtitle"),
				request.getParameter("qcontent"));

		return "redirect:list";
	}

	@RequestMapping(value = "/view")
	public String view(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		String qnum = request.getParameter("qnum");
		dao.uphit(qnum);

		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("dto", dao.content(qnum));

		return "view";
	}

	@RequestMapping(value = "/modify_form")
	public String modify_form(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		model.addAttribute("page", request.getParameter("page"));
		model.addAttribute("dto", dao.content(request.getParameter("qnum")));

		return "modify_form";
	}

	@RequestMapping(value = "/modify")
	public String modify(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		String page = request.getParameter("page");
		dao.modify(request.getParameter("qnum"),
				request.getParameter("qtitle"),
				request.getParameter("qcontent"));

		return "redirect:list?page=" + page;
	}

	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		dao.delete(request.getParameter("qnum"));

		return "redirect:list";
	}
}
