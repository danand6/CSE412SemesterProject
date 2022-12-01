<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<br> <br>
				<h1>Set Position Parameter To Filter Data</h1>
				<h4>Avaliable Positions: Attacking Midfield, Left Back, attack, Left Midfield, Defensive Midfield,
					Goalkeeper,
					Center Forward,
					Right Midfield,
					Right Back,
					Central Midfield,
					Left Winger,
					Right Winger,
					Center Back,
					Second Striker</h4>
				<form action="PositionDisplay.jsp" method="post">
					<div class="form-group">
						<label for="position"> Position </label> : <input type="text"
							class="form-control" id="position" name="position"
							placeholder="Enter Position" autofocus="autofocus">
					</div>
					 <input type="submit" value="Submit" />
				</form>
							
			</div>
		</div>
	</div>
</body>
</html>