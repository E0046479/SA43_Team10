<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.lecturerlistJsp.title" /></title>
</head>
<body>

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3>
				<fmt:message key="label.lecturerListJsp.title" />
			</h3>
		</div>
		<div class="panel-body">
			<a href="views/Lecturer_New.jsp" class="btn btn-success"><fmt:message
					key="label.lecturer.add" /></a> <br /> <br />
			<form action="${pageContext.request.contextPath}/lecturerSearch"
				method="post">
				<div align="right">
					<fmt:message key="label.table.search" />
					<input type="text" name="lecturerId"></input> <input type="submit"
						value="Search"></input>
				</div>
			</form>
			<form action="/lecturerList" method=post>
				<table class="table table-striped table-bordered">
					<tr class="info">
						<th class="text-center"><fmt:message key="label.table.No" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerId" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerName" /></th>
						<th class="text-center"><fmt:message
								key="label.lecturer.table.title.lecturerEmail" /></th>
						<th class="text-center"><span class="glyphicon glyphicon-cog"></span></th>
					</tr>
					<c:forEach var="lecturer" items="${lecturerList}"
						varStatus="status">
						<tr class="${status.index%2==0?'even':'odd'} text-center">
							<td class="nowrap">${status.index + 1}</td>
							<td class="nowrap">${lecturer.lecturerId}</td>
							<td class="nowrap">${lecturer.lecturerName}</td>
							<td class="nowrap">${lecturer.lecturerEmail}</td>
							<td class="nowrap"><c:url var="detailurl" scope="page"
									value="/lecturerSearch">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
									<c:param name="lecturerName" value="${lecturer.lecturerName}" />
									<c:param name="lecturerEmail" value="${lecturer.lecturerEmail}" />
									<c:param name="lecturerPhoneNumber"
										value="${lecturer.lecturerPhoneNumber}" />
									<c:param name="lecturerAddress"
										value="${lecturer.lecturerAddress}" />
								</c:url> <a href="${detailurl}" class="btn btn-info" role="button"><span
									class="glyphicon glyphicon-info-sign"></span></a> <c:url
									var="updurl" scope="page" value="views/Lecturer_Edit.jsp">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
									<c:param name="lecturerName" value="${lecturer.lecturerName}" />
									<c:param name="lecturerEmail" value="${lecturer.lecturerEmail}" />
									<c:param name="lecturerPhoneNumber"
										value="${lecturer.lecturerPhoneNumber}" />
									<c:param name="lecturerAddress"
										value="${lecturer.lecturerAddress}" />
								</c:url> <a href="${updurl}" class="btn btn-warning" role="button"><span
									class="glyphicon glyphicon-floppy-open"></a> <c:url
									var="delurl" scope="page" value="/lecturerDelete">
									<c:param name="lecturerId" value="${lecturer.lecturerId}" />
								</c:url> <a href="${delurl}" class="btn btn-danger"><span
									class="glyphicon glyphicon-floppy-remove"></a></td>
						</tr>
					</c:forEach>
				</table>
		</div>
	</div>
	</form>
</body>
</html>