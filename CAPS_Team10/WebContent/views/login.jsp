<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<fmt:setBundle basename="messages" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="views/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="views/bootstrap/css/custome.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<br />
	<div class="container">
		<div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please sign in</h3>
						</br>
						<c:if test="${requestScope['logInError'] != null}">
						<%= request.getAttribute("logInError") %>
						</c:if>
					</div>
					<div class="panel-body">
						<form action="main" method="post" UTF-8" role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="ID" name="id"
										type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me"> Remember Me
									</label>
								</div>
								<input class="btn btn-lg btn-success btn-block" type="submit"
									value="Login">
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="views/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>