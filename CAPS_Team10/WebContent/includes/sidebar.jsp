<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%-- <%@ page import="edu.iss.team10.caps.model.LoginDTO"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<fmt:setBundle basename="messages" />
<title><fmt:message key="label.studentListJsp.title" /></title>
</head>
<body>
	<!-- <div class="row"> -->
	<!-- <div class="absolute-wrapper"></div> -->
	<!-- <div class="side-menu"> -->
	<div class="collapse navbar-default navbar-collapse" role="navigation"
		id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav side-nav">
			<!-- Admin Navigation -->
			<c:if test="${sessionScope['user'].role== 'admin'}">
				<%-- <%
					LoginDTO user = (LoginDTO) session.getAttribute("user");
				%>
				<%=user.getUserId()%> --%>
				<li class="active"><a
					href="${pageContext.request.contextPath}/adminHome"><span
						class="glyphicon glyphicon-dashboard"></span> <fmt:message
							key="label.Admin.Manage.Student" /></a></li>
				<li><a
					href="<%=request.getContextPath()%>/lecturerList"><span
						class="glyphicon glyphicon-plane"></span> <fmt:message
							key="label.Admin.Manage.Lecturers" /></a></li>
				<li><a
					href="<%=request.getContextPath()%>/courseList"><span
						class="glyphicon glyphicon-cloud"></span> <fmt:message
							key="label.Admin.Manage.Courses" /></a></li>
				<li><a
					href="<%=request.getContextPath()%>/adminEnrollment"><span
						class="glyphicon glyphicon-cloud"></span> <fmt:message
							key="label.Admin.Manage.Enrollment" /></a></li>
			</c:if>

			<!-- Student Navigation -->
			<c:if test="${sessionScope['user'].role == 'student'}">
				<li class="active"><a
					href="<%=request.getContextPath()%>/studentHome"><span
						class="glyphicon glyphicon-dashboard"></span> <fmt:message
							key="label.Student.Manage.GradeAndGPA" /></a></li>
				<li><a href="<%=request.getContextPath()%>/views/"><span
						class="glyphicon glyphicon-plane"></span> <fmt:message
							key="label.Student.Manage.ViewCourses" /></a></li>
							<li><a href="<%=request.getContextPath()%>/EnrolledCourses"><span
						class="glyphicon glyphicon-plane"></span> <fmt:message
							key="label.enrolledCourses" /></a></li>
			</c:if>

			<!-- Lecturer Navigation -->
			<c:if test="${sessionScope['user'].role== 'lecturer'}">
				<li class="active"><a
					href="<%=request.getContextPath()%>/views/Lecturer_ViewCourseTaught.jsp"><span
						class="glyphicon glyphicon-dashboard"></span> <fmt:message
							key="label.home" /></a></li>
			</c:if>
		</ul>
	</div>
	<!-- </div> -->
	<!-- 	</div> -->
</body>
</html>