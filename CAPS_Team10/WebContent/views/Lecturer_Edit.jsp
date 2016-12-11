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
<title><fmt:message key="label.lecturerEditJsp.title" /></title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/lecturerEdit" method=post>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3>
					<fmt:message key="label.lecturerEditJsp.title" />
				</h3>
			</div>
			<div class="panel-body">
				<div class="text-center">
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lName"><fmt:message key="label.lecturer.table.title.lecturerName" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lName" name="lecturerName" type="text" 
						value="${param['lecturerName']}" required pattern="[a-zA-Z\s]+" title="Name cannot be numberic or regular expression!">
							    <input type="hidden" name="lecturerId" value="${param['lecturerId']}" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lEmail"><fmt:message key="label.lecturer.table.title.lecturerEmail" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lEmail" name="lecturerEmail" type="email" 
						value="${param['lecturerEmail']}" required  pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" title="Email formart: (xxx@xxx.xxx)">
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lPhonenumber"><fmt:message key="label.lecturer.table.title.lecturerPhoneNumber" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lPhonenumber" name="lecturerPhoneNumber" type="tel" 
						value="${param['lecturerPhoneNumber']}" type="tel" maxlength="8" 
						pattern="^\d{8}$" required="true" title="Phone number should be 8 digits" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-4 col-sm-4 col-xs-4 control-label text-right"
						for="lAddress"><fmt:message key="label.lecturer.table.title.lecturerAddress" /></label>
					<div class="col-md-5 col-sm-5 col-xs-5">
						<input class="form-control input-md" id="lAddress" name="lecturerAddress" type="text" value="${param['lecturerAddress']}"required="true">
					</div>
				</div>
				<div class="">
					  <div class="col-md-4 col-xs-6 col-sm-6 text-right">
					    <button type="submit" class="btn btn-success"><fmt:message key="label.button.submit" /></button>
					  </div>
					  <div class="col-md-4 col-xs-6 col-sm-6 text-left">
					    <button type="reset" class="btn btn-primary"><fmt:message key="label.button.reset" /></button>			
					  </div>
				</div>
				</div>
				</div>
			</div>
	</form>
</body>
</html>