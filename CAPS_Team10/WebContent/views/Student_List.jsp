<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false" %>
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
			<h3>
				<fmt:message key="label.studentListJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<a href="views/Student_New.jsp"><fmt:message key="label.student.add" /></a>
			<br /> <br />
			<table class="table table-bordered">
				<tr class="info">
					<th class="text-center">#</th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentId" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentName" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentEmail" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.enrollmentDate" /></th>
					<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
				</tr>
				<c:forEach var="student" items="${studentList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'} text-center">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${student.studentId}</td>
						<td class="nowrap">${student.studentName}</td>
						<td class="nowrap">${student.studentEmail}</td>
						<td class="nowrap">${student.enrollmentDate}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="views/Student_Edit.jsp">
								<c:param name="studentId" value="${student.studentId}" />
								<c:param name="studentName" value="${student.studentName}" />
								<c:param name="studentEmail" value="${student.studentEmail}" />
								<c:param name="studentPhoneNumber"
									value="${student.studentPhoneNumber}" />
								<c:param name="studentAddress" value="${student.studentAddress}" />
								<c:param name="enrollmentDate" value="${student.enrollmentDate}" />
							</c:url> <a href="${updurl}" class="btn btn-warning" role="button"><span
								class="glyphicon glyphicon-floppy-open"></span></a> <!--  --> <c:url
								var="delurl" scope="page" value="/studentDelete">
								<c:param name="studentId" value="${student.studentId}" />
							</c:url> <a href="${delurl}" class="btn btn-danger"><span
								class="glyphicon glyphicon-floppy-remove"></span></a>
						<!--  --></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>