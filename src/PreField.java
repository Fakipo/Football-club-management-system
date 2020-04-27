

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class PreField
 */
@WebServlet("/PreField")
public class PreField extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		HttpSession session = request.getSession();
		String s[] = new String[11];
		 PrintWriter out = response.getWriter();  
		 
		try
		{out.println("Hello");
			Connection con = DatabaseConnection.initializeDatabase();

				PreparedStatement st = con.prepareStatement("select * from team");
				ResultSet rs = st.executeQuery();
			for(int i = 0; i < 11 ; i ++)
			{		
				
			if (rs.next())
			{
			s[i] = rs.getString("playername");
			}
			}
		}	
		catch(Exception e)
		{
			e.printStackTrace();
		}
		out.println("Hello");
		for(int i = 0 ; i < 11 ; i ++)
		{
			String k = String.valueOf(i+1);
			session.setAttribute("plf"+k,s[i]);
		}
		RequestDispatcher rd = request.getRequestDispatcher("field.jsp");
		rd.forward(request, response);
	}
}
