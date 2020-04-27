<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<%@ page import = "java.time.*" %>
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
	//DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	//LocalDateTime now = LocalDateTime.now();
	LocalDate date = LocalDate.now();
	date = date.plusDays(7);
	String a = (String)session.getAttribute("invoicemail");
	String b = (String)session.getAttribute("invoiceproduct");
	int x1 = 0;
	int x = 0;
	String q = "";String q1 = ""; String q2 = ""; String q4="";
	try
	{
		String url = "jdbc:mysql://localhost:3306/Arsenal";
		String username = "root";
		String password = "fakipo";
		
		String sql = "select fid from  fan where email = '"+a+"'";
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
			
		
		
		String sql1 = "select * from product where fid ="+x1+"";
		ResultSet rs1 = st.executeQuery(sql1);
		while(rs1.next())
		{
			q1 = rs1.getString("pname");
			q2 = rs1.getString("pid");
			x = Integer.parseInt(q2);
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
	
	int rd = 93000 + Integer.parseInt(q2);
	int d;
	if(q1.equals("cap")||q1.equals("tshirt")||q1.equals("shoes"))
	{
		d = 39;
	}
	else 
	{
		d = 79;
	}
%>
 <div class="Invoicebox">
	
  
	<h2><u>Invoice</u></h2>
	<p></p>
	
	<form onsubmit="myFunction()" action = "theend">
	
	
	  <b>Email &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;</b><label id="l1">&ensp; <%=a %></label><br><br>
	  <b>Id    &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&nbsp</b><label id="l2">&nbsp;&nbsp;&nbsp;&nbsp; <%= rd %></label><br><br>
	  <b>Product &ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;</b>   <label id="l1">&ensp; <%=q1 %></label><br><br>
	  <b>Address  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b><label id="l3">&nbsp;&nbsp;&nbsp;&nbsp; <%= q4 %></label><br><br><br><br>
	  <b>Delivery Date &nbsp;</b>   <label id="l1">&ensp; <%= date %></label><br><br>
	  <b>Order Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>   <label id="l1">&ensp; <%= date.now() %></label><br><br>
	  <b>Total amnt. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>   <label id="l1">&ensp; $<%= d %></label><br>
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