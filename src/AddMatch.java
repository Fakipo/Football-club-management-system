
import java.text.DateFormat;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Calendar;  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddMatch
 */
@WebServlet("/AddMatch")
public class AddMatch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();     
		 HttpSession session = request.getSession();
		 String a = request.getParameter("opponent");
		 String b = request.getParameter("matchno");
		 String c = request.getParameter("matchdate");
		 int i = Integer.parseInt(b);
		 try
		 {
			 //Date date = new SimpleDateFormat("yyyy-MM-dd").parse(c);

			 Connection con = DatabaseConnection.initializeDatabase();
			 String sql = "insert into matches(matchno, teamsplaying, datee)"
						+ " values (?,?,?)";
			 PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1,i);
				ps.setString(2,a);
				ps.setString(3,c);
				ps.execute();
//				 out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>");
					 out.println("<script>");
				   out.println("alert('match added')");
					 out.println("</script>");
				RequestDispatcher rd = request.getRequestDispatcher("mainadmin.jsp");
				rd.include(request, response);
				
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
	}


}
