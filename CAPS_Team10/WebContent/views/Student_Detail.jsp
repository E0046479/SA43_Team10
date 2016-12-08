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
<title><fmt:message key="label.studentDetailJsp.title" /></title>
</head>
<body>
		<form action="/studentDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.studentDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<center>
					<table cellpadding=4 cellspacing=2 border=0>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentId" /></td>
							<td><input type="text" name="studentId" size=15
								value="${param['studentId']}" maxlength=20
								readonly="readonly"> 
								</td>
						</tr>
						<tr>
							<td><fmt:message key="label.student.table.title.studentName" /></td>
							<td><input type="text" name="studentName" size=15 value="${param['studentName']}"
								maxlength=20 readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentEmail" /></td>
							<td><input type="text" name="studentEmail" size=15 value="${param['studentEmail']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentPhoneNumber" /></td>
							<td><input type="text" name="studentPhoneNumber" size=15 value="${param['studentPhoneNumber']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.student.table.title.studentAddress" /></td>
							<td><input type="text" name="studentAddress" size=15 value="${param['studentAddress']}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message key="label.student.table.title.enrollmentDate" /></td>
							<td><input type="text" name="enrollmentDate" size=15 value="${param['enrollmentDate']}"
								maxlength=20 readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
				</table>
				</center>
			</div>
		</div>
	</form>
</body>
</html>