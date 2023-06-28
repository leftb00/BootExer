package com.leftb.bootexer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.leftb.bootexer.dao.BootExerDao;

@Controller
public class BootExerController {

	@Autowired
	private SqlSession sqlSession;

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

	@RequestMapping(value = "/list")
	public String list(Model model) {
		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		model.addAttribute("list", dao.list());
		model.addAttribute("total", dao.list().size());

		return "list";
	}

	@RequestMapping(value = "/write_form")
	public String write_form() {
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
		String bid = request.getParameter("bid");
		dao.uphit(bid);
		model.addAttribute("dto", dao.content(bid));

		return "view";
	}

	@RequestMapping(value = "/modify_form")
	public String modify_form(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		model.addAttribute("dto", dao.content(request.getParameter("bid")));

		return "modify_form";
	}

	@RequestMapping(value = "/modify")
	public String modify(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		dao.modify(request.getParameter("bid"),
				request.getParameter("btitle"),
				request.getParameter("bcontent"));

		return "redirect:list";
	}

	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model) {

		BootExerDao dao = sqlSession.getMapper(BootExerDao.class);
		dao.delete(request.getParameter("bid"));

		return "redirect:list";
	}
}
