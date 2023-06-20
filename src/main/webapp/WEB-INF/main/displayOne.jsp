<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Book</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/5.2.3/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<h1>
			<c:out value="${oneBook.title}" />
		</h1>
		<a href="/welcome">Back to the shelves</a>
	</div>
	<h3>
		<c:out value="${oneBook.user.name}" />
		read
		<c:out value="${oneBook.title}" />
		by
		<c:out value="${oneBook.author}"/>.
	</h3>
	<p>
		<c:if test="${user_id == oneBook.user.id}">
		Here are your thoughts:
		</c:if>
		<c:if test="${user_id != oneBook.user.id}">
			Here are
			<c:out value="${oneBook.user.name}"/>'s
			thoughts:
			</c:if>
	</p>
	<p>
		<c:out value="${oneBook.myThoughts}" />
	</p>
	<c:if test="${user_id == oneBook.user.id}">
		<a href="/books/edit/${oneBook.id}">Edit</a>
		<form action="/books/${oneBook.id}" method="post">
			<input type="hidden" name="_method" value="delete" />
			<input type="submit" value="delete" />
		</form>
	</c:if>
</body>
</html>