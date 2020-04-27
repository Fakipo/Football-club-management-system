

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
 * Servlet implementation class AddPlayer
 */
@WebServlet("/AddPlayer")
public class AddPlayer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();     
		 HttpSession session = request.getSession();
		 String s = (String)session.getAttribute("emailmain");
		 String a = request.getParameter("name");
		 String b = request.getParameter("memtype");
		 try
		 {
			 Connection con = DatabaseConnection.initializeDatabase();
			 String sql = "insert into clubmember(name,role)"
						+ " values (?,?)";
			 PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,a);
				ps.setString(2,b);
				ps.execute();
//				 out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>");
					 out.println("<script>");
				     out.println("alert('successfully added')");
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
