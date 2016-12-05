<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/custome.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<%@ include file="/includes/header.jsp"%> 
		<div class="col-md-2">
			<%@ include file="/includes/sidebar.jsp"%>
		</div>
		<div class="col-md-10">
			<decorator:body />
		</div>
		<div class="text-center">
		<h4>CA &copy; by Team 10</h4>
		</div>	
	</nav>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>