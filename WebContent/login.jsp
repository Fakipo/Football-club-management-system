<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import ="java.util.*" %>
<html>
<head>
   <title>login form</title>
   <link rel="stylesheet" href="loginstyle.css">
</head>
<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
<%	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0"); %>
 
 <div class="loginbox">
	
  
	<h2>Login</h2>
	<p>Login as</p>

	<form action="first">
		<% 
		List l = (List) request.getAttribute("errorlist");
		if(l!=null)
		{
			for(Iterator it = l.iterator();it.hasNext(); )
			{
				String error = (String) it.next();
				%>
				<font color = "red">
				<li><%=error%> </li>
				</font>
				<% 
			}
		}
	%>
	<select name="loginAs">
    <option value = "fan">Fan</option>
    <option value = "clubmember">Club Member</option>
    <option value = "admin">Admin</option>
    </select>
		<p>Email</p>
		<input type="email" name="email" placeholder="Enter Email" autocomplete="off"	required >
		<p>Password</p>
		<input type="password" name="pass" placeholder="" required>
		<input type="submit" name="" value="Sign In">
		<br><br>
		<p align="center";>Are you new?<a href="SignUp.jsp"> Sign Up</a></p>
	
			  <% 
                String s=request.getParameter("loginAs");
               /* if (s !=null)
                {
                    out.println("Selected Color is : "+s);

                }
                else
                {
                	out.println("null");
                }*/
                request.setAttribute("loginAs",s);
     		 %>
	</form>
</div>
</body>
</html>