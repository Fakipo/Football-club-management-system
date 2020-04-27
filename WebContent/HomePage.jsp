<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>


<head>
<title>Home Page</title>
<link rel="stylesheet" href="homestyle.css">

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-validate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");

		int x = 0;
		String manager = (String) session.getAttribute("notmanager");
		String q = (String) session.getAttribute("yemail");
		String loggedAs = (String) session.getAttribute("loginAs");
		String noFan = (String) session.getAttribute("notFan");
		//String noFan1 = (String) session.getAttribute("notFan1");
		if (q != null) {
			x = 1;
	%>
	<font color="red">
		<li>logged in as:<%=q%> logged as: <%=loggedAs%></li>
	</font>
	<%
		}
		if (manager == "no") {
	%>
	<font color="red">
		<li>You need to login as clubmember to manage team</li>
	</font>
	<%
		manager = null;
		}
		//manager = "yes";

		if (noFan == "no") {
	%>
	<font color="red">
		<li>You need to login as a fan to book tickets or enter shop</li>
	</font>
	<%
		noFan = null;
		}
	%>

	<form>

		<ul>
			<li><a href="HomePage.jsp">Home</a></li>
			<li><a href="book.jsp">Ticket</a></li>
			<li><a href="shop_page.jsp">Shop</a></li>
			<li><a href="clubmain.jsp">Club</a></li>
			<li><a href="#">Login/out</a>
				<ul>
					<li><a href="SignUp.jsp">New?</a></li>
					<li><a href="LogOut">Log out</a></li>
				</ul></li>
			<li><a href="about.html">About Us</a></li>
		</ul>
		<%
			session.setAttribute("email", q);
			session.setAttribute("loginAsHome", loggedAs);
		%>

	</form>

</body>
</html>

