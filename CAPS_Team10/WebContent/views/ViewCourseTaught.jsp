<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<fmt:setBundle basename="messages" />
<style type="text/css">
table th {
	align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="panel panel-default">
		<div class="panel-heading">Course Teaching</div>
		<div class="panel-body">
			<table class="table table-striped table-bordered">
				<tr class="info text-center">
					<th>No.</th>
					<th><fmt:message key="label.course.table.title.courseId" /></th>
					<th><fmt:message key="label.course.table.title.courseName" /></th>
					<th><fmt:message key="label.course.table.title.courseSize" /></th>
					<th>Action</th>
				</tr>
				<c:forEach var="course" items="${lecturerCourseList}" varStatus="status">
                <tr class="${status.index%2==0?'even':'odd'}">
                     <td class="nowrap">${status.index + 1}</td>
                    <td class="nowrap">${course.courseId}</td>
                    <td class="nowrap">${course.courseName}</td>
                    <td class="nowrap">${course.courseSize}</td>
                     
                    <td class="nowrap">
                        <c:url var="updurl" scope="page" value="/gradeStudent">
                            <c:param name="courseId" value="${course.courseId}"/>                            
                        </c:url>
                        <a href="${updurl}"><fmt:message key="label.enrollment.table.title.grade" /></a>
                        &nbsp;&nbsp;&nbsp;
                        
                       <c:url var="updurl" scope="page" value="/studentPerformance">
                            <c:param name="courseId" value="${course.courseId}"/>   
                            <c:param name="courseName" value="${course.courseName}"/>                         
                        </c:url>
                        <a href="${updurl}"><fmt:message key="label.enrollment.table.title.Performance"></fmt:message></a>
                        &nbsp;&nbsp;&nbsp;
                        
                        <c:url var="updurl" scope="page" value="/viewEnrolledStudents">
                            <c:param name="courseId" value="${course.courseId}"/>                                              
                        </c:url>
                        <a href="${updurl}"><fmt:message key="label.enrollment.table.title.ViewEnrolledStudent"></fmt:message></a>
                    </td>
                </tr>
            </c:forEach>
			</table>
		</div>
	</div>
</body>
</html>