<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.studentEditJsp.title" /></title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/studentEdit" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.studentEditJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<center>
			 		<table cellpadding=4 cellspacing=2 border=0>

						<tr>
							<td><fmt:message key="label.student.table.title.studentName" /></td>
							<td><input type="text" id="studentName" name="studentName" size=15 value="${param['studentName']}"
								maxlength=20> <input type="hidden" name="studentId"
								value="${param['studentId']}" /></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentEmail" /></td>
							<td><input type="text" id="studentEmail" name="studentEmail" size=15 value="${param['studentEmail']}"
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentPhoneNumber" /></td>
							<td><input type="text" id=""studentPhoneNumber"" name="studentPhoneNumber" size=15 value="${param['studentPhoneNumber']}"
								maxlength=20></td>
						</tr> 
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentAddress" /></td>
							<td><input type="text" id="studentAddress" name="studentAddress" size=15 value="${param['studentAddress']}"
								maxlength=20></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.enrollmentDate" /></td>
							<td><input type="text" id="enrollmentDate" name="enrollmentDate" size=15 value="${param['enrollmentDate']}"
								 maxlength=20></td>
						</tr>
					</table>
					<input type="submit" value="Submit"> <input type="reset" value="Reset">
				</center>

			</div>
		</div>
	</form>
</body>
</html>