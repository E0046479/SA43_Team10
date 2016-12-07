<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.course.add" /></title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/courseInsert" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.course.add" />
				</h3>
			</div>
			<div class="panel-body">
				<center>
					<table cellpadding=4 cellspacing=2 border=0>

						<tr>
							<td><fmt:message key="label.course.table.title.courseName" /></td>
							<td><input type="text" name="courseName" size=15
								maxlength=20> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message key="label.course.table.title.lecturerId" /></td>
							<td><input type="text" name="lecturerId" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseDescription" /></td>
							<td><input type="text" name="courseDescription" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message key="label.course.table.title.courseType" /></td>
							<td><input type="text" name="courseType" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseDuration" /></td>
							<td><input type="text" name="courseDuration" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.course.table.title.courseStartDate" /></td>
							<td><input type="text" id="enrollmentDate" name="courseStartDate" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message key="label.course.table.title.courseSize" /></td>
							<td><input type="text" name="courseSize" size=15
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message key="label.course.table.title.courseCredit" /></td>
							<td><input type="text" name="courseCredit" size=15
								maxlength=20></td>
						</tr>
					</table>
					<input type="submit" value="Submit"> <input type="reset"
						value="Reset">
				</center>
			</div>
		</div>
	</form>
</body>
</html>