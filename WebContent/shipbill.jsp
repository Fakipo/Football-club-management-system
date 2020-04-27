<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
   <title>Ticket_Bill</title>
   <link rel="stylesheet" href="billstyle.css">
</head>
<body>
<%
	int s = 1;
	String r = (String)session.getAttribute("billshopp");
	String mail = (String)session.getAttribute("bshipmail");
	if(mail == null)
	{
		//response.sendRedirect("SignUp.jsp");
	}
	
	int price = 0;
	if(r.equals("tshirt")||r.equals("cap")||r.equals("shoes"))
	{
		price = 39;
	}
	else 
	{
		price = 79;
	}
%>

  <a href="#"><img src="icons8-home-64.png" width="70px" border= "none";></a>
 <div class="billbox">
	
  
	<h2><u>Product Details</u></h2>
	<p></p>
	
	<form action = "finalshop">
	
	  <b>Product &nbsp;</b>   <label id="l1">&ensp;<%= r  %></label><br><br>
	  <b>Qty    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><label id="l2">&nbsp;&nbsp;&nbsp;&nbsp; <%= s %> </label><br><br>
	  <b>Price  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><label id="l3">&nbsp;&nbsp;&nbsp;&nbsp; $<%= price*s %></label><br>
		<input type="submit" name="" value="Make Payment">
		<%/*
		String c = request.getParameter("ok");
		if(c!=null)
		{
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
//		out.println("swal ( 'Successful' ,  '' ,  'success' );");
		out.println("swal ( 'Tickets Have Been Booked' ,  'Successful !' ,  'success' );");
		out.println("});");
		out.println("</script>"); 
		}
		*/
		session.setAttribute("shopmail",mail);
		session.setAttribute("shoptype",r);
		%>
		
	</form>
</div>
</body>
</html>