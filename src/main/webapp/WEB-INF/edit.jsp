<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>edit</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	
		<div id="header">
			<h1>Edit Expense</h1>
			<a href="/languages">Dashboard</a>
			<form action="/languages/${language.id}" method="post">
				<input type="hidden" name="_method" value="delete">
				<input type="submit" value="delete" class="btn btn-danger">
			</form>
		</div>		
	
		<form:form action="/languages/${language.id}" method="POST"  modelAttribute="language" >
				<input type="hidden" name="_method" value="put">
				<div class="form-group">
					<form:label path="name">Name</form:label>
					<form:errors path="name" class="text-danger" />
					<form:input type="text" path="name" class="form-control" />				
				</div>
				<div class="form-group">
					<form:label path="creator">Creator</form:label>
					<form:errors path="creator" class="text-danger" />
					<form:input type="text" path="creator" class="form-control" />				
				</div>	
				<div class="form-group">
					<form:label path="version">Version</form:label>
					<form:errors path="version" class="text-danger" />
					<form:input type="version" path="version" class="form-control" />				
				</div>				
			<input type="submit" value="Submit" class="btn btn-primary">					
		</form:form>
		
		<h3><c:out value="${message}"/></h3>
	
	</div>
</body>
</html>