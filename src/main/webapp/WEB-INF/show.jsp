<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Expense Details</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div id="main">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th><a href="/languages">Dashboard</a></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Name</td> 
						<td><c:out value="${language.name}"/></td> 
					</tr>
					<tr>
						<td>Creator</td> 
						<td><c:out value="${language.creator}"/></td> 
					</tr>
					<tr>
						<td>Version</td> 
						<td><c:out value="${language.version}"/></td> 
					</tr>	
				<tbody> 
			
			</table>
			
			<div>
			<a href="/languages/<c:out value="${language.id}"/>/edit">edit</a>
				<form action="/languages/${language.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="delete" class="btn btn-danger">
				</form>
			</div>
		</div>
	</div>	
</body>
</html>