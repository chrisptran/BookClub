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
	<h1>Add a Book to your shelf!</h1>
	<a href="/users/logout">Logout</a>
	<a href="/welcome">Back to the shelves</a>
</div>
<form:form action="/books/process" method="post" modelAttribute="newBook">
	<form:input type="hidden" path="user" value="${user_id}" />
	<div class="form-group">
		<form:label path="title">Title</form:label>
		<form:input path="title" type="text" class="form-control" />
		<form:errors path="title" class="text-danger" />
	</div>
	<div class="form-group">
		<form:label path="author">Author</form:label>
		<form:input path="author" type="text" class="form-control" />
		<form:errors path="author" class="text-danger" />
	</div>
	<div class="form-group">
		<form:label path="myThoughts">My thoughts</form:label>
		<form:input path="myThoughts" type="text" class="form-control" />
		<form:errors path="myThoughts" class="text-danger" />
	</div>
	<input type="submit" value="Submit" class="btn btn-primary" />
</form:form>
</body>
</html>