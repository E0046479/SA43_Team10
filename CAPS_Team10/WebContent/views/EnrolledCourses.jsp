<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<fmt:setBundle basename="messages" />
</head>
<body>

	<div class="panel panel-default">
		<div class="panel-heading">
		<h3>
			<fmt:message key="label.enrolledCourses" />
			</h3>
		</div>
		<div class="panel-body">
			<div>
				<fmt:message key="label.enrolledCourses.total" />${fn:length(enrolledCoursesList)}</div>
			<br />
			<table class="table table-bordered">
					<tr class="info">
					<th class="text-center"><fmt:message key="label.enrolledCourses.Number" /></th>
						<th class=" text-center"><fmt:message
								key="label.enrollment.courseId" /></th>
						<th class="text-center"><fmt:message
								key="label.enrollment.courseName" /></th>
						<th class="text-center"><fmt:message
								key="label.course.table.title.courseStartDate" /></th>
						<th class="text-center"><fmt:message
								key="label.enrollment.courseEnrollmentDate" /></th>
						<th class="text-center"><fmt:message
								key="label.enrollment.delete" /></th>
					</tr>
				<tbody>
					<c:forEach var="enrolledCourses" items="${enrolledCoursesList}"
						varStatus="status">
						<tr class="${status.index%2==0? 'even':'odd' } text-center">
							<td class="nowrap">${status.index+1}</td>
							<td class="nowrap">${enrolledCourses.courseDTO.courseId}</td>
							<td class="nowrap">${enrolledCourses.courseDTO.courseName}</td>
							<td class="nowrap">${enrolledCourses.courseDTO.courseStartDate}</td>
							<td class="nowrap">${enrolledCourses.courseEnrollmentDate}</td>
							<td class="nowrap"><c:url var="delurl" scope="page"
									value="/studentDeleteEnroll">
									<c:param name="studentID"
										value="${enrolledCourses.studentDTO.studentId}" />
									<c:param name="courseID"
										value="${enrolledCourses.courseDTO.courseId}" />
								</c:url> <a href="${delurl}"><button type="button"
										${enrolledCourses.allowDelete== false? 'style="display:none;"':''}
										class="btn btn-danger">
										<span class="glyphicon glyphicon-floppy-remove"></span>
									</button> </a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>




</body>
</html>