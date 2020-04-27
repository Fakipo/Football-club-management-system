<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Titole</title>
</head>
<body>
<table border = 1>
<%
	try{
	String pemail = request.getAttribute("mail").toString();
	String ppass = request.getAttribute("password").toString();
	
	String url = "jdbc:mysql://localhost:3306/Arsenal";
	String username = "root";
	String password = "fakipo";
	
	String sql = "select * from  admin where email = '"+pemail+"' and pass = '"+ppass+"'";
	//String sql = "insert into admin values('"+pemail+"','"+ ppass+"') ";
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(url,username,password);
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(sql);
	//st.executeUpdate(sql);
	//	out.println("Your data has been succesfully updated"+rs.getString(1)+rs.getString(2));
	if(rs.next())
	{
		out.println("logged in ");
	}
	else
	{
		out.println("enter correct pass and id");
	}
rs.close();
st.close();
con.close();
}
catch(Exception e){%>wrong id and pass, please login again <% System.out.println(e.getMessage());}
%>

</table>
</body>
</html>