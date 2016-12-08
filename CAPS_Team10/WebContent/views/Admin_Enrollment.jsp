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


	<!--  	<form class="form-inline" method="POST">
		<div class="col-md-3">
			<div class="input-group">
				<input type="text" name="search" placeholder="Enter Student ID">
				<span class="input-group-btn">
					<button type="submit" class="btn btn-secondary">
						<fmt:message key="label.search" />
					</button>
				</span>
			</div>
		</div>
	</form>

	<br />
	<br /> -->


	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.enrollment.list" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<h4><span class="label label-default"><fmt:message key="label.enrollment.total" /></span>${fn:length(enrollmentList)}</h4></div>
			<br />
			<table class="table table-striped table-bordered">
					<tr class="info">
						<td class="text-center"><strong><fmt:message
								key="label.student.table.title.studentId" /></strong></td>
						<td class="text-center"><strong><fmt:message
								key="label.student.table.title.studentName" /></strong></td>
						<td class="text-center"><strong><fmt:message
								key="label.enrollment.courseId" /></strong></td>
						<td class="text-center"><strong><fmt:message
								key="label.enrollment.courseName" /></strong></td>
						<td class="text-center"><strong><fmt:message
								key="label.enrollment.courseEnrollmentDate" /></strong></td>
						<td class="text-center"><span class="glyphicon glyphicon-cog"></span></td>
					</tr>
				<tbody>
					<c:forEach var="enrollment" items="${enrollmentList}">
						<tr class="text-center">
							<td class="nowrap">${enrollment.studentDTO.studentId}</td>
							<td class="nowrap">${enrollment.studentDTO.studentName}</td>
							<td class="nowrap">${enrollment.courseDTO.courseId}</td>
							<td class="nowrap">${enrollment.courseDTO.courseName}</td>
							<td class="nowrap">${enrollment.courseEnrollmentDate}</td>
							<td class="nowrap"><c:url var="delurl" scope="page"
									value="/deleteEnrollment">
									<c:param name="studentID" value="${enrollment.studentDTO.studentId}" />
									<c:param name="courseID" value="${enrollment.courseDTO.courseId}" />
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