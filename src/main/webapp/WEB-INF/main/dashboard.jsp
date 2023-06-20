<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<title>Dashboard</title>
</head>
<body>
	<div class="nav">
		<ul class="nav-links">
			<li><a href="/welcome" class="active">My Profile</a></li>
			<li><a href="/users/logout"><button class="btn">Sign
						Out</button></a></li>
		</ul>
	</div>
	<div class="dashboard">
		<h1>Welcome ${loggedInUser.name}!</h1>
	</div>
	<div class="dashboard">
		<h3>Books from everyone's shelves</h3>
		<p>
			<a href="/books/new">+ Add a book to my shelf!</a>
		</p>
	</div>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="eachBook" items="${books}">
				<tr>
					<td><c:out value="${eachBook.id}" /></td>
					<td><a href="/books/${eachBook.id}"><c:out
								value="${eachBook.title}" /></a></td>
					<td><c:out value="${eachBook.author}" /></td>
					<td><c:out value="${eachBook.user.name}" /></td>
					<td><c:if test="${user_id == eachBook.user.id}">
							<a href="/books/edit/${eachBook.id}">Edit</a>
							<form action="/books/${eachBook.id}" method="post">
								<input type="hidden" name="_method" value="delete" /> <input
									type="submit" value="delete">
							</form>
						</c:if></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>