<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <title>Club form</title>
   <link rel="stylesheet" href="clubstyle.css">
</head>
<body>
<%
		response.setHeader("Cache-Control","no-cache,no-store,must-validate");
		String loginAs;
		loginAs = (String) session.getAttribute("loginAsHome");
		String s;
		s = (String) session.getAttribute("email");
		String z = "";
		z = (String) session.getAttribute("notemanager");
		if(s==null)
		{
			response.sendRedirect("SignUp.jsp");
		}

		//out.print(loginAs);
		else if(loginAs == null)
		{
			response.sendRedirect("SignUp.jsp");
		}
				else if(!loginAs.equals("clubmember"))
		{
			String r = "no";
			session.setAttribute("notmanager",r);	
			response.sendRedirect("HomePage.jsp");
			out.print(loginAs);
		}
		
		
		if(z=="no")
		{
			%>
		<font color = "red">
		<li>You need to be a manager to change squad </li>
		</font>
		<% 
		}
		
%>
<font color = "red">
		<li>logged in as:<%=s%> logged as: <%= loginAs %></li>
		</font>
 <a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
 
 
   <div class="Admin">
   
        <form action="choiceclub">
            <input type="submit" name = "maketeam" value="Make Team" >
            <input type="submit" name = "viewteam" value="View Team" >
        <% session.setAttribute("mainemail",s); %>
 
        </form>
   </div>	