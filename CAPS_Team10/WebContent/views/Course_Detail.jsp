<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<fmt:setBundle basename="messages"/> 
<title><fmt:message key="label.courseDetailJsp.title" /></title>
<title>AddCourse</title>
</head>
<body>
		<form action="${pageContext.request.contextPath}/courseDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.courseDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<center>
					<table cellpadding=4 cellspacing=2 border=0>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseId" /></td>
							<td><input type="text" name="courseId" size=15 value="${param['courseId']}" 
							    maxlength=20 readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message key="label.course.table.title.courseName" /></td>
							<td><input type="text" name="courseName" size=15 value="${param['courseName']}"
								maxlength=20 readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.lecturerId" /></td>
							<td><input type="text" name="lecturerId" size=15 value="${param['lecturerId']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseDescription" /></td>
							<td><input type="text" name="courseDescription" size=15 value="${param['courseDescription']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseType" /></td>
							<td><input type="text" name="courseType" size=15 value="${param['courseType']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseDuration" /></td>
							<td><input type="text" name="courseDuration" size=15 value="${param['courseDuration']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseStartDate" /></td>
							<td><input type="text" name="courseStartDate" size=15 value="${param['courseStartDate']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseSize" /></td>
							<td><input type="text" name="courseSize" size=15 value="${param['courseSize']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseCredit" /></td>
							<td><input type="text" name="courseCredit" size=15 value="${param['courseCredit']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
				</table>
				</center>
			</div>
		</div>
	</form>
</body>
</html>