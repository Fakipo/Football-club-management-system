

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
/**
 * Servlet implementation class TickShip
 */
@WebServlet("/ShopShip")
public class ShopShip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String qq; //fid
		String q;
		int x = 0;
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		qq = (String)session.getAttribute("billemail");
		//qq = (String)session.getAttribute("Ticketfid");
		//int tfid = Integer.parseInt(qq);
		String shop = (String)session.getAttribute("shoptype");
		//int totseats = (int)session.getAttribute("shiptotalseats");
		String address;
		String fullname;
		String fname = request.getParameter("fname");
		String sname = request.getParameter("lname");
		String street = request.getParameter("street");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String zipcode = request.getParameter("zip");
		String cardno = request.getParameter("cardnum");
		String cvv = request.getParameter("cvv");
		String exp = request.getParameter("expire");
		//int ccv =Integer.parseInt(cvv);
		//out.println(qq);
		//out.println(pos);
		//x = Integer.parseInt(qq);
		fullname = fname + " " + sname;
		address = street +" "+ city+ " " + state ;

		try {
		Connection con = DatabaseConnection.initializeDatabase();
		PreparedStatement st = con.prepareStatement("select fid from fan where email = '" +qq+"'" );
		ResultSet rs = st.executeQuery();

				if (rs.next())
		{
		q = rs.getString("fid");
		x = Integer.parseInt(q);
		}
		/*out.println(x);
		out.println(fullname);
		out.println(address);
		out.println(zipcode);
		out.println(cardno);
		out.println(exp);
		out.println(ccv);*/
		String sql = "insert into shipping(type,fid,fullname,address,zipcode)"
				+ " values (?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1,"product");
		ps.setInt(2,x);
		ps.setString(3,fullname);
		ps.setString(4,address);
		ps.setString(5,zipcode);
		ps.execute();
	
		String sql2 = "insert into product(fid, pname, quantity)" + "values(?,?,?)";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.setInt(1,x);
		ps2.setString(2, shop);
		ps2.setInt(3, 1);
		ps2.execute();

	/*	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Successful' ,  '' ,  'success' );");
		out.println("swal ( 'Tickets Have Been Booked' ,  'Successful !' ,  'success' );");
		out.println("});");
		out.println("</script>"); 
	*/
		session.setAttribute("billshopp", shop);
		//session.setAttribute("billtotalseats", totseats);
		session.setAttribute("bshipmail", qq);
		  out.println("<script type=\"text/javascript\">");
		   out.println("alert('User or password incorrect');");
		   out.println("location='index.jsp';");
		   out.println("</script>");	
		   RequestDispatcher rd = request.getRequestDispatcher("shipbill.jsp");
			rd.forward(request,response);		


		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

	}
}