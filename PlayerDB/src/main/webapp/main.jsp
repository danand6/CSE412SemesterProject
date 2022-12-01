<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Class.forName("org.postgresql.Driver");	 %>
<%@ page import="java.sql.*"%>
<%@ page import="com.playerDB.TransferObject"%>
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
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="/PlayerDB/insert.jsp">Register
							a new player</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="/PlayerDB/Filtering.jsp">Filtering</a></li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="/PlayerDB/Ordering.jsp">Ordering</a>
					</li>
				</ul>
				<ul class="nav navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="/PlayerDB/Summarizing.jsp">Summarizing</a></li>
				</ul>
			</div>

		</div>

	</nav>

	<br>
	<br>

	<div class="container">
		<div class="row">
			<h1>Transfer Data</h1>
		</div>
		<div class="row"></div>

		<%
           Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/CSE412",
					"root", "root");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from transfer ORDER BY playerid ASC") ;
          int counter = 0;
       %>

		<table class="table table-striped table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>Id</th>
					<th>Fee</th>
					<th>Loan</th>
					<th>PlayerId</th>
					<th>From Country </th>
					<th>To Country </th>
					<th>From Club</th>
					<th>To Club</th>
				</tr>
			</thead>
			<% while(resultset.next()){ 	
				TransferObject a = new TransferObject();
				a.setId(counter);
				a.setFee(resultset.getInt(1));
				a.setLoan(Boolean.parseBoolean(resultset.getString(2)));
				a.setPlayerid(resultset.getInt(3));
				a.setFromCountry(resultset.getString(4));
				a.setToCountry(resultset.getString(5));
				a.setFromClub(resultset.getString(6));
				a.setToClub(resultset.getString(7));
				counter++;
			%>

			<TR>
				<TD><%=a.getId()%></td>
				<TD><%=a.getFee() %></td>
				<TD><%=a.isLoan() %></TD>
				<TD><%=a.getPlayerid()%></TD>
				<TD><%=a.getFromCountry()%></TD>
				<TD><%=a.getToCountry()%></TD>
				<TD><%=a.getFromClub()%></TD>
				<TD><%=a.getToClub()%></TD>
			</TR>
			<%
			}
			%>



		</table>
	</div>
</body>
</html>