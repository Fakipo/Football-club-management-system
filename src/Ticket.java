
import java.util.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ticket
 */
@WebServlet("/ticket")
public class Ticket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Ticket() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int x = 5;
		int qq=0;//counting available seats
		String seatArea = req.getParameter("seat");
		int noOfSeats = Integer.parseInt(req.getParameter("quantity"));
		String pemail = req.getParameter("xemail");//email typed in book ticket
		String phoneNo = req.getParameter("telephone");

		 PrintWriter out = res.getWriter();        
			

			
		HttpSession session = req.getSession();
		String s = session.getAttribute("remail").toString();//email the user is logged in As:
		

		String q=null;
		
		String loginAs;
		String r;// representing the column name
		String id;
		
		String convertseats = Integer.toString(noOfSeats);
		
		loginAs = (String) session.getAttribute("booklogin");

		
		try
		{
			
			Connection con = DatabaseConnection.initializeDatabase();
			PreparedStatement st = con.prepareStatement("select fid from fan where email = '" +s+"'" );
			ResultSet rs = st.executeQuery();
			
			if (rs.next())
			{
			q = rs.getString("fid");
			x = Integer.parseInt(q);
			//out.print(q+"  "+noOfSeats+"  "+loginAs+"  "+phoneNo + " "+seatArea);
			}
			PreparedStatement ust = con.prepareStatement("SELECT COUNT(*) AS total FROM ticket where seatingarea = '"+seatArea+"'");
			ResultSet rs1 = ust.executeQuery();

			while(rs1.next())
			{
				qq = rs1.getInt("total");
				//out.print(qq);
				//out.print(50-qq);

			}

			if(qq+noOfSeats<=50)
			{
			for(int i=1;i<=noOfSeats;i++)
			{
			String sql = ("insert into ticket(matchno,seatno,quantity,fid,seatingarea,phone)"+ "values (?,?,?,?,?,?)");
			PreparedStatement preparedStmt = con.prepareStatement(sql);
			//	Statement sti = con.createStatement();
				preparedStmt.setInt(1,noOfSeats);
				preparedStmt.setInt(2,(qq+i));
				preparedStmt.setInt(3,i);
				preparedStmt.setInt(4,x);
				preparedStmt.setString(5,seatArea);
				preparedStmt.setString(6,phoneNo);
				preparedStmt.execute();
			}
					session.setAttribute("Temail", s);
					session.setAttribute("totalseats",noOfSeats);
					session.setAttribute("position",seatArea);
					RequestDispatcher rp = req.getRequestDispatcher("shipping.jsp");
					rp.include(req, res);
			}
			else
			{
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'all tickets in this section have been sold!' ,  'failed !' ,  'error' );");
				out.println("});");
				out.println("</script>"); 
				RequestDispatcher rp = req.getRequestDispatcher("book.jsp");
				rp.include(req, res);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
