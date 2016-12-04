<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.studentListJsp.title" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3> <fmt:message key="label.studentListJsp.title" /> </h3>
		</div>
		<div class="panel-body">
			<a href="StudentAdd.jsp"><fmt:message key="label.student.add" /></a>
			<br />
			<br />
			<table class="borderAll">
				<tr>
					<th>#</th>
					<th><fmt:message key="label.student.table.title.studentId" /></th>
					<th><fmt:message key="label.student.table.title.studentName" /></th>
					<th><fmt:message key="label.student.table.title.studentEmail" /></th>
					<th><fmt:message key="label.student.table.title.enrollmentDate" /></th>
					<th><fmt:message key="label.student.edit" /> <fmt:message
							key="label.student.delete" /></th>
				</tr>
				<c:forEach var="student" items="${studentList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'}">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${student.studentId}</td>
						<td class="nowrap">${student.studentName}</td>
						<td class="nowrap">${student.studentEmail}</td>
						<td class="nowrap">${student.enrolmentDate}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="views/Student_Edit.jsp">
								<c:param name="studentId" value="${student.studentId}" />
								<c:param name="studentName" value="${student.studentName}" />
								<c:param name="studentEmail" value="${student.studentEmail}" />
								<c:param name="studentPhoneNumber"
									value="${student.studentPhoneNumber}" />
								<c:param name="studentAddress" value="${student.studentAddress}" />
								<c:param name="enrollmentDate" value="${student.enrolmentDate}" />
							</c:url> <a href="${updurl}"><fmt:message key="label.student.edit" /></a>
							&nbsp;&nbsp;&nbsp; <c:url var="delurl" scope="page"
								value="/deleteStudent">
								<c:param name="name" value="${student.studentId}" />
							</c:url> <a href="${delurl}"><fmt:message key="label.student.delete" /></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>