<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<fmt:setBundle basename="messages" />
<style type="text/css">
table th {
	align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ViewStudentPerformance</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.viewStudentPerformanceJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th>No.</th>
					<th>Student ID</th>
					<th>Student Name</th>
					<th>Course Name</th>
					<th>Grade</th>
					<th></th>
				</tr>
				<c:forEach var="list" items="${studentPerformanceList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'}">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${list.studentDTO.studentId}</td>
						<td class="nowrap">${list.studentDTO.studentName}</td>
						<td class="nowrap">${list.courseDTO.courseName}</td>
						<td class="nowrap">${list.grade}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="/individualStudentPerformance">
								<c:param name="userId" value="${list.studentDTO.studentId}" />
							</c:url> <a href="${updurl}">View</a> &nbsp;&nbsp;&nbsp;</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>