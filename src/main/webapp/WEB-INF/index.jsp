<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Read Share</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
	<div class="container">
	
		<table class="table">
	    	<thead>
	        	<tr>
	          	  <th>Name</th>
	          	  <th>Creator</th>
	          	  <th>Version</th>
	          	  <th>action</th> 
	          	  <th> </th>
	        </tr>

	   	 	</thead>
	    	<tbody>
	       		<c:forEach var="language" items="${languages}">	       			
					<tr>						
						<td><a href="/languages/<c:out value="${language.id}"/>"><c:out value="${language.name}"/></a></td>						   
						<td><c:out value="${language.creator}"/></td>	
						<td><c:out value="${language.version}"/></td>
						<td>
							<form action="/languages/${language.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<input type="submit" value="delete" class="btn btn-danger">
							</form>
							
						</td>
					  	<td>
					  		<a href="/languages/<c:out value="${language.id}"/>/edit">edit</a>
					  	</td>  
					</tr>
				</c:forEach>
	    	</tbody>
		</table>		
		
		<form:form action="/languages" method="POST"  modelAttribute="language" >				 		
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
					<form:input type="text" path="version" class="form-control" />				
				</div>											
			<input type="submit" value="Submit" class="btn btn-primary">					
		</form:form>
		
		<h3><c:out value="${message}"/></h3>
	
	</div>
</body>
</html>