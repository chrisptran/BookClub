package com.chris.bookclub;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Set;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.chris.bookclub.controllers.BookController;
import com.chris.bookclub.models.Book;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;

@SpringBootTest
class BookClubApplicationTests {
	
	@Autowired
	private BookController controller;
	
	private static Validator validator;
	
	@BeforeAll
	static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test
	void testBook() {
		Book book = new Book();
		book.setAuthor("Hannah Montana");
		book.setMyThoughts("very believable storyline");
		book.setTitle("You get the best of both worlds");
		Set<ConstraintViolation<Book>> violations = validator.validate(book);
		for (ConstraintViolation<Book> violation : violations) {
			System.out.println(violation.getMessage());
		}
		assertTrue(violations.isEmpty());
	}

	@Test
	void contextLoads() {
	}
	
	@Test
	void testController() {
		assertThat(controller).isNotNull();
	}

}
