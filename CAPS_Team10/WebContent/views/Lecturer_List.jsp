<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages"/>
<title><fmt:message key="label.lecturerlistJsp.title" /></title>
</head>
<body>
<form action="/lecturerList" method=post>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3> <fmt:message key="label.lecturerListJsp.title" /> </h3>
		</div>
		<div class="panel-body">
			<a href="views/Lecturer_New.jsp"><fmt:message key="label.lecturer.add" /></a>
			<br />
			<br />
			<table class="borderAll">
				<tr>
					<th>No.</th>					
				    <th><fmt:message key="label.lecturer.table.title.lecturerId"/>
					</th> 
					<th> <fmt:message key="label.lecturer.table.title.lecturerName"/> 
					</th>
					<th><fmt:message key="label.lecturer.table.title.lecturerEmail"/> 
					</th>
					<th><fmt:message key="label.lecturer.edit" /> <fmt:message
							key="label.lecturer.delete" /></th>
				</tr>
				<c:forEach var="lecturer" items="${lecturerList}" varStatus="status">
					<tr class="${status.index%2==0?'even':'odd'}">
						<td class="nowrap">${status.index + 1}</td>
						<td class="nowrap">${lecturer.lecturerId}</td>
						<td class="nowrap">${lecturer.lecturerName}</td>
						<td class="nowrap">${lecturer.lecturerEmail}</td>
						<td class="nowrap"><c:url var="updurl" scope="page"
								value="views/Lecturer_Edit.jsp">
								<c:param name="lecturerId" value="${lecturer.lecturerId}" />
								<c:param name="lecturerName" value="${lecturer.lecturerName}" />
								<c:param name="lecturerEmail" value="${lecturer.lecturerEmail}" />
								<c:param name="lecturerPhoneNumber"
									value="${lecturer.lecturerPhoneNumber}" />
								<c:param name="lecturerAddress" value="${lecturer.lecturerAddress}" />
							</c:url> <a href="${updurl}"><fmt:message key="label.lecturer.edit" /></a>							          
							&nbsp;&nbsp;&nbsp; <c:url var="delurl" scope="page"
								value="/lecturerDelete">
								<c:param name="lecturerId" value="${lecturer.lecturerId}" />
							</c:url> <a href="${delurl}"><fmt:message key="label.lecturer.delete" /></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	</form>
</body>
</html>