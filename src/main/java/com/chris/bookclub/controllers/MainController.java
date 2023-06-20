package com.chris.bookclub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chris.bookclub.services.BookService;
import com.chris.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {

	public final BookService bookServ;
	public final UserService userServ;
	
	public MainController(BookService bookServ, UserService userServ) {
		this.bookServ = bookServ;
		this.userServ = userServ;
	}
	
	@RequestMapping("/welcome")
	public String main(HttpSession session, Model model) {
		if(session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		model.addAttribute("books", bookServ.getAll());
		model.addAttribute("loggedInUser", userServ.getOne((Long) session.getAttribute("user_id")));
		return "main/dashboard.jsp";
	}
}
