<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <title>ground form</title>
   <link rel="stylesheet" href="groundstyle.css">
</head>
<body>
 
  <%
  response.setHeader("Cache-Control","no-cache,no-store,must-validate");
  	String q[] = new String[11];
  	for (int i = 0 ; i < 11 ; i ++)
  	{
		String k = String.valueOf(i+1);
  		q[i] = (String)session.getAttribute("plf"+k);
  	}
  
  
  %>
  
    <strong><label for="position" id="l1"><%=q[0] %></label></strong>
	 <strong><label for="position" id="l2"><%=q[1] %></label></strong>
	  <strong><label for="position" id="l3"><%=q[2] %></label></strong>
	   <strong><label for="position" id="l4"><%=q[3] %></label></strong>
	    <strong><label for="position" id="l5"><%=q[4] %></label></strong>
		 <strong><label for="position" id="l6"><%=q[5] %></label></strong>
		  <strong><label for="position" id="l7"><%=q[6] %></label></strong>
		   <strong><label for="position" id="l8"><%=q[7] %></label></strong>
		    <strong><label for="position" id="l9"><%=q[8] %></label></strong>
			 <strong><label for="position" id="l10"><%=q[9] %></label></strong>
			  <strong><label for="position" id="l11"><%=q[10] %></label></strong>
			
</body>
</html>	
	