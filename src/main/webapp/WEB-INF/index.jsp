<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<meta charset="ISO-8859-1">
<title>Languages Assignment</title>
</head>
<body>
<div class="container">
		<h3>Test Language Page</h3>
		<div>
			<p>${allLanguages}</p>
			<table>
				<thead>
					<tr>
						<th>Name</th>
						<th>Creator</th>
						<th>Version</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allLanguages}" var="language">
						<tr>
							<td>
							<a href="/languages/${language.id}"><c:out value="${language.languageName}" /></a>
							</td>
							<td><c:out value="${language.creator}" /></td>
							<td><c:out value="${language.version}" /></td>
							<td><a href="/languages/edit/${language.id}">edit</a>
								<form action="/languages/${language.id}" method="post">
									<input type="hidden" name="_method" value="delete">
									<input type="submit" value="Delete">
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<form:form action="/languages" method="post" modelAttribute="language">
				<p>
					<form:label path="languageName">Language Name:</form:label>
					<form:errors path="languageName" class="text-danger" />
					<form:input path="languageName" />
				</p>
				<p>
					<form:label path="creator">Creator:</form:label>
					<form:errors path="creator" class="text-danger" />
					<form:textarea path="creator" />
				</p>
				<p>
					<form:label path="version">Version:</form:label>
					<form:errors path="version" class="text-danger"/>
					<form:input path="version" />
				</p>
				<input type="submit" value="Submit" />
			</form:form>

		</div>
	</div>

</body>
</html>