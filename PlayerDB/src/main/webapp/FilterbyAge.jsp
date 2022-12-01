<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Class.forName("org.postgresql.Driver");	 %>
<%@ page import="java.sql.*"%>
<%@ page import="com.playerDB.TransferObject"%>
<%@ page import="com.playerDB.PlayerObject"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>2022 Summer Transfer Market</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
</head>
<body>
	<!-- create navigation bar ( header) -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"
					href="/PlayerDB/main.jsp">Dashboard</a>
			</div>
		</div>

	</nav>
	<br>
	<br>
	
	<h2 align = "center"> Filter Transfer by Age </h2>
	
	
	<div class="container">
		<div class="row">
			<h1>Summer 2022 Transfer Market</h1>
		</div>
		<div class="row"></div>

		<%!
		public class DBMS {
			
			PreparedStatement preparedStatement = null;
			Connection connection = null;
			//ResultSet resultset = null;
			
			
			public DBMS() {
				
				try{
            	connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/CSE412",
					"root", "root");
		 				preparedStatement = connection
								.prepareStatement("select * from player WHERE age=?");
					} catch (SQLException e){
						e.printStackTrace();
					}
		    //resultset = preparedStatement.executeQuery("select * from transfer where age ="+request.getParameter("age1")) ;
		}
		public ResultSet getInfo(String age){
			try{
				preparedStatement.setString(1, age);
			 ResultSet resultset = preparedStatement.executeQuery();
			 return resultset;
			} catch (SQLException e){
				e.printStackTrace();
			}
			
			return null;
		}
		}
       %>
       <% 
       		String age = new String();
       		if (request.getParameter("age") != null){
       			age = request.getParameter("age");
       		}
       %>

		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Position</th>
					<th>Age</th>
					<th>Name</th>
				</tr>
			</thead>
			<% 
			 	DBMS dbms = new DBMS();
			 Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/CSE412",
						"root", "root");
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from player WHERE age=?");
				preparedStatement.setInt(1, Integer.parseInt(age));
				ResultSet checker = preparedStatement.executeQuery();
				
				while(checker.next()){ 
				PlayerObject a = new PlayerObject();
				a.setId(checker.getInt(1));
				a.setPosition(checker.getString(2));
				a.setAge(Integer.parseInt(age));
				a.setName(checker.getString(4));
			%>

			<TR>
				<TD><%=a.getId()%></td>
				<TD><%=a.getPosition()%></td>
				<TD><%= age %></TD>
				<TD><%=a.getName()%></TD>
			</TR>
			<%
			} 
			%>



		</table>
	</div>
</body>
</html>