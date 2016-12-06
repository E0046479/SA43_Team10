<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages"/>
<title><fmt:message key="label.courselistJsp.title" /></title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3> <fmt:message key="label.courseListJsp.title" /> </h3>
		</div>
		<div class="panel-body">
			<a href="Course_New.jsp"><fmt:message key="label.course.add" /></a>
			<br />
			<br />
			<table class="borderAll">
				<tr>
					<th>#</th>					
				    <th><fmt:message key="label.course.table.title.courseId"/>
					</th> 
					<th> <fmt:message key="label.course.table.title.courseName"/> 
					</th>
					<th><fmt:message key="label.course.table.title.courseDuration"/> 
					</th>
					<th><fmt:message key="label.course.table.title.courseStartDate"/> 
					</th>
					<th><fmt:message key="label.course.edit" /> <fmt:message
							key="label.course.delete" /></th>
				</tr>
				<c:forEach var="course" items="${courseList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'}">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${course.courseId}</td>
						<td class="nowrap">${course.courseName}</td>
						<td class="nowrap">${course.courseDuration}</td>
						<td class="nowrap">${course.courseStartDate}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="views/Course_Edit.jsp">
								<c:param name="courseId" value="${course.courseId}" />
								<c:param name="courseName" value="${course.courseName}" />
								<c:param name="lecturerId" value="${course.lecturerId}" />
								<c:param name="courseDescription" value="${course.courseDescription}" />
								<c:param name="courseType" value="${course.courseType}" />
								<c:param name="courseDuration" value="${course.courseDuration}" />
								<c:param name="courseStartDate" value="${course.courseStartDate}" />
								<c:param name="courseSize" value="${course.courseSize}" />
								<c:param name="courseCredit" value="${course.courseCredit}" />
							</c:url> <a href="${updurl}"><fmt:message key="label.course.edit" /></a>							          
							&nbsp;&nbsp;&nbsp; <c:url var="delurl" scope="page"
								value="/deleteCourse">
								<c:param name="name" value="${course.courseId}" />
							</c:url> <a href="${delurl}"><fmt:message key="label.course.delete" /></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>