

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChoiceClub
 */
@WebServlet("/ChoiceClub")
public class ChoiceClub extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String s = request.getParameter("maketeam");
		String t = request.getParameter("viewteam");
		String q = (String)session.getAttribute("mainemail");
		String role="";
		
		if(s!=null)
		{
			try
			{
				Connection con = DatabaseConnection.initializeDatabase();
				PreparedStatement st = con.prepareStatement("select role from clubmember where email = '" +q+"'" );
				ResultSet rs = st.executeQuery();
			
				if(rs.next())
				{
					role = rs.getString("role");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			session.setAttribute("roll", role);
			RequestDispatcher rd = request.getRequestDispatcher("player.jsp");
			rd.forward(request, response);
		}
		else if(t!=null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("/PreField");
		//	response.sendRedirect("http://localhost:8080/Arsenal/Prefield");
			rd.forward(request, response);
		}
	}


}
