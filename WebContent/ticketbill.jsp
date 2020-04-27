<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
   <title>Ticket_Bill</title>
   <link rel="stylesheet" href="billstyle.css">
</head>
<body>
<%
	int s = Integer.parseInt(session.getAttribute("billtotalseats").toString());
	String r = (String)session.getAttribute("billpos");
	String mail = (String)session.getAttribute("tshipmail");
	if(mail == null)
	{
		response.sendRedirect("SignUp.jsp");
	}
	
	int price = 0;
	if(r.equals("vip"))
	{
		price = 25;
	}
	else if(r.equals("upper"))
	{
		price = 15;
	}
	else if(r.equals("lower"))
	{
		price = 10;
	}
%>

<div class="billbox">
	
  
	<h2><u>Ticket Details</u></h2>
	<p></p>
	
	<form action = "finalticket">
	
	  <b>Position &nbsp;</b>   <label id="l1">&ensp;<%= r  %></label><br><br>
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
		price = price * s;
		String k = String.valueOf(s);
		String l = String.valueOf(price);
		session.setAttribute("finaltmail",mail);
		session.setAttribute("position",r);
		session.setAttribute("quantity",k);
		session.setAttribute("price",l);
		%>
		
	</form>
</div>
</body>
</html>