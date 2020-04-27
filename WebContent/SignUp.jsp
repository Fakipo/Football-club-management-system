<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<%	response.setHeader("Cache-Control","no-cache,no-store,must-validate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0"); %>
   <title>Signup form</title>
   <link rel="stylesheet" href="Signupstyle.css">
</head>
<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
 <div class="signupBox">
	<!--<img src=" class="user" >-->
	<h2>Sign up for free</h2>
	<form onsubmit="return Validate()">
	    <p>First Name</p>
		<input type="text" id="m1" name="fname" placeholder="Enter First Name" required><br>
		<p>Last Name</p>
		<input type="text" id="m2" name="sname" placeholder="Enter Last Name" required>
		<p>Email</p>
		<input type="email" name="email" placeholder="Enter Email" required>
		<p>Password</p>
		<input type="password" id="p1" name="pass1" required>
		<p>Confirm Password</p>
		<input type="password" id = "p2" name="pass2" required><br>
		<input type="submit" name="" value="Sign Up"><br><br>
		<p>Already have an account?<a href="login.jsp"> LOG IN</a>
		<%
			int confirm=0;
			String fn = request.getParameter("fname");
			String sn = request.getParameter("sname");
			String nm  = fn+" "+sn;
			String em = request.getParameter("email");
			String ps1 = request.getParameter("pass1");
			String ps2 = request.getParameter("pass2");
		
			
			 try { 
					String url = "jdbc:mysql://localhost:3306/Arsenal";
					String username = "root";
					String password = "fakipo";
					String sql =("insert into fan(name,email,pass) values('"+nm+"','"+em+"','"+ps1+"')");
		            // Create a SQL query to insert data into demo table 
		            // demo table consists of two columns, so two '?' is used 
		           	Class.forName("com.mysql.jdbc.Driver");
		        	Connection con = DriverManager.getConnection(url,username,password);
		        	Statement st = con.createStatement();
		            			 
			        st.executeUpdate(sql);


		    	            st.close(); 
		    	            con.close(); 
		     				confirm = 1;
			 } 
		        catch (Exception e) { 
		            e.printStackTrace(); 
		        } 
			 if(confirm == 1)
			 {
				 response.sendRedirect("login.jsp");
			 }
		            
		%>
	</form>
</div>
	
</body>


<script>
  
    function Validate() {
	     var c = /^[a-zA-Z]+$/; 
	   var a = document.getElementById("m1").value;
	   var b = document.getElementById("m2").value;
	   if(a.match(c))
	      true ;
		  else
		    {
			  alert("Enter a valid first name");
			  return false ;
			}
			 if(b.match(c))
	      true ;
		  else
		    {
			  alert("Enter a valid last name");
			  return false ;
			}
        var password = document.getElementById("p1").value;
        var confirm_Password = document.getElementById("p2").value;
        if (password != confirm_Password) {
            alert("Passwords do not match.");
            return false;
        }
		alert("Successfully Signed Up");
        return true;
		
    }
   </script>
   
</html>