<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import ="java.util.*" %>
    <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
  
    <title>product</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <%
    	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
    	response.setHeader("Pragma","no-cache");
    	response.setHeader("Expires","0");
    	String a = "cap";
    	String b = "shoes";
    	String c = "shin";
    	String d = "hoodie";
    	String e = "shorts";
    	String f = "tshirt";
		String s;
		s = (String) session.getAttribute("email");
		String loginAs;
		loginAs = (String) session.getAttribute("loginAsHome");
		if(s==null)
		{
			response.sendRedirect("SignUp.jsp"); 
		}
		else if(loginAs==null)
		{
			response.sendRedirect("SignUp.jsp");
		}
		else if(!loginAs.equals("fan"))
		{
			session.setAttribute("notFan","no" );
			response.sendRedirect("HomePage.jsp");
		}
		
		session.setAttribute("semail",s);
%>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
    <div class="container">
      <div class="pricing-table table1">
        <div class="pricing-header">
          <div class="price"><span>$</span>39</div>
          <div class="title">T-shirt</div>
        </div>
      <img src="images\tshirt.jpg" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= f %>">Buy Now</a>
      </div>

      <div class="pricing-table table2">
        <div class="pricing-header">
          <div class="price"><span>$</span>39</div>
          <div class="title">Cap</div>
        </div>
      <img src="images\cap.png" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= a %>">Buy Now</a>
      </div>

      <div class="pricing-table table3">
        <div class="pricing-header">
          <div class="price"><span>$</span>39</div>
          <div class="title">Shoes</div>
        </div>
        <img src="images\shoes.jpg" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= b %>">Buy Now</a>
      </div>
	   <div class="pricing-table table4">
        <div class="pricing-header">
          <div class="price"><span>$</span>79</div>
          <div class="title">Hoodie</div>
        </div>
        <img src="images\hoodie.jpg" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= d %>" >Buy Now</a>
      </div>
	  <div class="pricing-table table5">
        <div class="pricing-header">
          <div class="price"><span>$</span>79</div>
          <div class="title">Shin Pads</div>
        </div>
        <img src="images\shin.png" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= c %>" >Buy Now</a>
      </div>
	  <div class="pricing-table table6">
        <div class="pricing-header">
          <div class="price"><span>$</span>79</div>
          <div class="title">Shorts</div>
        </div>
        <img src="images\shorts.jpg" alt="Smiley face" height="250" width="300">
        <a href="shshipping.jsp?types=<%= e %>" >Buy Now</a>
      </div>
	
    </div>
  </body>
</html>
