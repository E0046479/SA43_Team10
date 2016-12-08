<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><fmt:message key="label.Admin.Manage.Enrollment" /></title>
<fmt:setBundle basename="messages" />
</head>
<body>


<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.enrollment.list" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<br />
				<form action="/CAPS_Team10/searchEnroll" method="POST">
					<table>
						<tr>
							<td><input type="text" name="studentId"
								value="${param['studentId']}" placeholder="Enter Student ID"></td>
							<td><input type="submit" value="Search" /></td>
						</tr>
					</table>
				</form>
				<br />
				<fmt:message key="label.enrollment.total" />${fn:length(enrollmentList)}</div>
			<br />
			<table class="table table-bordered">

				<tr class="info">
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentId" /></th>
					<th class="text-center"><fmt:message
							key="label.student.table.title.studentName" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.courseId" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.courseName" /></th>
					<th class="text-center"><fmt:message
							key="label.course.table.title.courseStartDate" /></th>
					<th class="text-center"><fmt:message
							key="label.enrollment.delete" /></th>
				</tr>

				<tbody>
					<c:forEach var="enrollment" items="${enrollmentList}">
						<tr class="text-center">
							<td class="nowrap">${enrollment.studentDTO.studentId}</td>
							<td class="nowrap">${enrollment.studentDTO.studentName}</td>
							<td class="nowrap">${enrollment.courseDTO.courseId}</td>
							<td class="nowrap">${enrollment.courseDTO.courseName}</td>
							<td class="nowrap">${enrollment.courseDTO.courseStartDate}</td>
							<td class="nowrap"><c:url var="delurl" scope="page"
									value="/deleteEnrollment">
									<c:param name="studentID"
										value="${enrollment.studentDTO.studentId}" />
									<c:param name="courseID"
										value="${enrollment.courseDTO.courseId}" />
								</c:url> <a href="${delurl}"><button type="button"
										${enrollment.allowDelete== false? 'style="display:none;"':''}
										class="btn btn-danger">
										<span class="glyphicon glyphicon-floppy-remove"></span>
									</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



</body>
</html>