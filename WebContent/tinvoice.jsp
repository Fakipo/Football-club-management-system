<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.time.LocalDateTime" %>
<%@ page import = "java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
   <title>Invoice</title>
   <link rel="stylesheet" href="invoicestyle.css">
</head>
<body>
<a href="HomePage.jsp"><img src="icons8-home-64.png" width="70px" border= "none";></a>
<%
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	LocalDateTime now = LocalDateTime.now();
	
	String pos = (String)session.getAttribute("invoicepos");
	String quant = (String)session.getAttribute("invoicequant");
	String price = (String)session.getAttribute("invoiceprice");
	String mail = (String)session.getAttribute("invoicemail");
	String q="";
	String q1 = "";
	String q2 ="";
	String q3 = "";
	String q4 = "";
	int x = 0; int x1=0; int qq = 0;
	int x5 = Integer.parseInt(quant);
	try
	{
		String url = "jdbc:mysql://localhost:3306/Arsenal";
		String username = "root";
		String password = "fakipo";
		
		String sql = "select fid from  fan where email = '"+mail+"'";
		//String sql = "insert into admin values('"+pemail+"','"+ ppass+"') ";
		Connection con = DriverManager.getConnection(url,username,password);
		Class.forName("com.mysql.jdbc.Driver");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		if(rs.next())
		{
			q = rs.getString("fid");
			x1 = Integer.parseInt(q);
		}
			
		
		
		String sql1 = "select * from ticket where fid ="+x1+"";
		ResultSet rs1 = st.executeQuery(sql1);
		while(rs1.next())
		{
			q1 = rs1.getString("tid");
			q2 = rs1.getString("phone");
			x = Integer.parseInt(q1);
		}
		String sql2 = "SELECT COUNT(*) AS total FROM ticket where seatingarea = '"+pos+"'";
		ResultSet rs2 = st.executeQuery(sql2);
		while(rs2.next())
		{
			qq = rs2.getInt("total");
		}
		
		String sql4 = "select address from shipping where fid ="+x1+"";
		ResultSet rs3 = st.executeQuery(sql4);
		while(rs3.next())
		{
			q4 = rs3.getString("address");
		}
		
	}
	catch (Exception e)
	{
		e.printStackTrace();
	}
	if(pos.equals("upper"))
	{
		q3 = "U";
	}
	else if(pos.equals("lower"))
	{
		q3 = "L";
	}
	else if(pos.equals("vip"))
	{
		q3="V";
	}
x = 143600 +x;
%>

 <div class="Invoicebox">
	
  
	<h2><u>Invoice</u></h2>
	<p></p>
	
	<form onsubmit="myFunction()" action ="theend">
	
	  <b>Email &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</b><label id="l1">&ensp; <%= mail %></label><br><br>
	  <b>Id    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp</b><label id="l2">&nbsp;&nbsp;&nbsp;&nbsp; <%=x %></label><br><br>
	  <b>Seat no. &ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;</b>   <label id="l1">&ensp; 
	  <%
			for(int i = 0 ; i <x5 ; i ++)
			{
				out.print(q3+(qq+i+1)+", ");
			}
	  
	  %>

	  </label><br><br>
	  <b>Address  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><label id="l3">&nbsp;&nbsp;&nbsp;&nbsp; <%=q4 %></label><br><br><br><br>
	  <b>Contact no. &nbsp;&nbsp;&nbsp;&nbsp;</b>  <label id="l1">&ensp; <%=q2 %></label><br><br>
	  <b>Booking Date &nbsp;&nbsp;&nbsp;</b>   <label id="l1"> <%= dtf.format(now) %></label><br><br>
	  <b>Total amnt. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>   <label id="l1">&ensp; $<%= price %></label><br>
		<input type="submit" name="" value="Print">
		
	</form>
</div>
<script>
function myFunction() {
  window.print();
}
</script>
</body>
</html>