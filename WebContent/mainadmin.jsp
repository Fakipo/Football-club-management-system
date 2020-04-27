<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
   <title>Admin form</title>
   <link rel="stylesheet" href="mainAdminstyle.css">
</head>
<body>
<%
	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
	String q = (String) session.getAttribute("email");
	String loggedAs = (String) session.getAttribute("loginAs");
	if(q!=null)
	{
		%>
		<font color = "red">
		<li>logged in as:<%=q%> logged as: <%= loggedAs %></li>
		</font>
		<% 
	}
	session.setAttribute("mainemail",q);
%>
  <a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
  <h2>Admin</h2>
  <h1>Welcome To Arsenal</h1>
   <br>
   <br>
   <br>
   <div class="Admin">
   
        <form action = "adminmain">
            <input type="submit" name = "addmember" value="Add Member" >
 			<br>
 			<br>
            <input type="submit" name = "addmatch" value="Add Match" >
  			<br>
  			<br>
            
        </form>
        </div>
   
	</div>
   </div>	