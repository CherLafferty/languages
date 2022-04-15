<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Languages Assignment</title>
</head>
<body>
	<div class="container">
		<h2>Expense Details</h2>
		<a href="/languages">Dashboard</a>
		<div>
			<table>
				<tr>

					<td><c:out value="${language.languageName}" /></td>
				</tr>
				<tr>

					<td><c:out value="${language.creator}" /></td>
				</tr>
				<tr>

					<td><c:out value="${language.version}" /></td>
				</tr>
			</table>
			<div>
				<a href="/languages/edit/${language.id}">Edit</a>
			</div>
			<div>
				<a href="/languages/${id}">Delete</a>
			</div>
		</div>
	</div>

</body>
</html>