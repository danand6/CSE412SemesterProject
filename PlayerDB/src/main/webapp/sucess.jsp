<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.playerDB.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert a new Player</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
<jsp:useBean id = "object" class = "com.playerDB.PlayerObject"/>
<% 

int status = playerDAO.insertPlayer(object);
if (status > 0)
	out.println("Inserted successfully");
else
	out.println("Insertion Fail");


%>
	
</body>
</html>