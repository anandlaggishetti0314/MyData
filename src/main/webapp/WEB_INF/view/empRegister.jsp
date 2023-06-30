<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
</head>
<body>
${msg}
<div class="container">
<h1><center>Employee Registration Form</center></h1>
		<form:form action="save" modelAttribute="employee">
			<div class="mb-3">
				<label for="employeeName" class="form-label" >Employee Name</label>
				<form:input path="employeeName" class="form-control" placeholder="Enter the Employee name"/>
			</div>
			<div class="mb-3">
				<label for="department" class="form-label" >Department</label>
				<form:input path="department" class="form-control" placeholder="Enter the department name"/>
			</div>
			<div class="mb-3">
				<label for="salary" class="form-label">Salary</label>
				<form:input path="salary" class="form-control" placeholder="Enter the salary "/>
			</div>
			<div class="mb-3">
				<input type="submit" value="submit" /> <input type="reset" value="clear" />
			</div>
		</form:form>
	</div>
</body>
</html>