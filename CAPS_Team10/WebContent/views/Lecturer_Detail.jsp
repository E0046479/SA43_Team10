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
<title><fmt:message key="label.lecturerDetailJsp.title" /></title>
</head>
<body>
		<form action="/lecturerDetail" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.lecturerDetailJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<center>
					<table cellpadding=4 cellspacing=2 border=0>
						<tr>
							<td><fmt:message
									key="label.lecturer.table.title.lecturerId" /></td>
							<td><input type="text" name="lecturerId" size=15
								value="${param['lecturerId']}" maxlength=20
								readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message key="label.lecturer.table.title.lecturerName" /></td>
							<td><input type="text" name="lecturerName" size=15 value="$lecturerName}"
								maxlength=20 readonly="readonly"> <input type="hidden" name="ins"
								value="true" /></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.lecturer.table.title.lecturerEmail" /></td>
							<td><input type="text" name="lecturerEmail" size=15 value="${lecturerEmail}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.lecturer.table.title.lecturerPhoneNumber" /></td>
							<td><input type="text" name="lecturerPhoneNumber" size=15 value="${lecturerPhoneNumber}"
								maxlength=20 readonly="readonly"></td>
						</tr>
						<tr>
							<td><fmt:message
									key="label.lecturer.table.title.lecturerAddress" /></td>
							<td><input type="text" name="lecturerAddress" size=15 value="${lecturerAddress}"
								maxlength=20 readonly="readonly"></td>
						</tr>
				</table>
				</center>
			</div>
		</div>
	</form>
</body>
</html>