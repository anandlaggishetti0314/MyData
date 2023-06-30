<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script> -->
<script type="text/javascript"
	src="https://unpkg.com/jquery.fancytable@1.0.26/dist/fancyTable.min.js"></script>
<script>
	$(document).ready(function() {
		$(".table").fancyTable({
			pagination : true,
			paginationClass : "btn btn-light",
			paginationClassActive : "active",
			pagClosest : 2,
			perPage : 3,
		});
	});
</script>
</head>
<body>
	<center><h3>Employee Data</h3></center>
	<br>
	<br>
	<hr>
	<div class="container">
		<table class="table" id="myTable">
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Employee name</th>
					<th scope="col">department</th>
					<th scope="col">Salary</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<c:forEach items="${empList}" var="emp">
				<tbody>
					<tr>
						<td>${emp.id}</td>
						<td>${emp.employeeName}</td>
						<td>${emp.department}</td>
						<td>${emp.salary}</td>
						<td><button type="button" class="btn btn-success">
								<a href="./edit?id=${emp.id}">Edit</a>
							</button></td>
						<td><button type="button" class="btn btn-danger">
								<a href="./delete?id=${emp.id}">Delete</a>
							</button></td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>