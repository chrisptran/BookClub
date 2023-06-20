package com.chris.bookclub.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chris.bookclub.models.Book;
import com.chris.bookclub.services.BookService;

import jakarta.validation.Valid;

@Controller
public class BookController {
	
	private final BookService bookServ;
	
	public BookController(BookService bookServ) {
		this.bookServ = bookServ;
	}
	
	@RequestMapping("/books/new")
	public String createBook(@ModelAttribute("newBook") Book book) {
		return "main/createBook.jsp";
	}
	
	@PostMapping("/books/process")
	public String processBook(@Valid @ModelAttribute("newBook") Book newBook, BindingResult result) {
		if(result.hasErrors()) {
			return "main/createBook.jsp";
		}
		bookServ.create(newBook);
		return "redirect:/welcome";
	}
	
	@RequestMapping("/books/{id}")
	public String displayBook(@PathVariable("id") Long id, Model model) {
		Book oneBook = bookServ.getOne(id);
		model.addAttribute("oneBook", oneBook);
		model.addAttribute("books", bookServ.getAll());
		return "main/displayOne.jsp";
	}
	
	@RequestMapping("/books/edit/{id}")
	public String editBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("book", bookServ.getOne(id));
		return "main/edit.jsp";
	}
	
	@PutMapping("/books/process/edit/{id}")
	public String processEditBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "main/edit.jsp";
		}
		bookServ.update(book);
		return "redirect:/welcome";
	}
	
	@DeleteMapping("/books/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/welcome";
	}

}
