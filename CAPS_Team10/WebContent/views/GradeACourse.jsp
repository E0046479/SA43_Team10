<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title>GradeACourse</title>
</head>
<body>
	<c:set var="courseName" scope="session" value="${C_Name}" />
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.GradeACourseJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<label for="courseName"><fmt:message
						key="label.course.table.title.coursename" /> (${C_Name})</label>
				&nbsp;&nbsp;&nbsp;<b>|</b>&nbsp;&nbsp;&nbsp; <label
					for="courseCredit"><fmt:message
						key="label.course.tabel.title.coursecredit" /> (${C_Credit})</label>
			</div>
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th>No.</th>
					<th><fmt:message key="label.student.table.title.studentId" /></th>
					<th><fmt:message key="label.student.table.title.studentName" /></th>
					<th>Action</th>
				</tr>
				<c:forEach var="gradeStudent" items="${gradeStudentList}"
					varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'}">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${gradeStudent.getStudentDTO().studentId}</td>
						<td class="nowrap">${gradeStudent.getStudentDTO().studentName}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="/giveGrade">
								<c:param name="studentId"
									value="${gradeStudent.studentDTO.studentId}" />
								<c:param name="studentName"
									value="${gradeStudent.studentDTO.studentName}" />
								<c:param name="courseName"
									value="${gradeStudent.courseDTO.courseName}" />
							</c:url> <a href="${updurl}">Grade</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>