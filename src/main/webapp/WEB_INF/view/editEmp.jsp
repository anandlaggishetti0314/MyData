<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<form:form action="update"  modelAttribute="editList">
		<table>
		<tr><form:hidden path="id" />
			</tr>
			<tr>Employee Name:<form:input path="employeeName" />
			</tr>
			<tr>
				Department:
				<form:input path="department"/>
			</tr>
			<tr>
				Salary
				<form:input path="salary"  />
			</tr>
			</br>
			<tr>
				<input type="submit" value="update">
			</tr>
		</table>
	</form:form>
	</div>
</body>
</html>