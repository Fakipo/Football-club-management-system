

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
 * Servlet implementation class MakeTeam
 */
@WebServlet("/MakeTeam")
public class MakeTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{		
		HttpSession session = request.getSession();
		String a[] = new String[11];
		String aa[] = new String[11];
		String b[] = new String[3];
		String bb[] = new String[3];
		PrintWriter out = response.getWriter();      
		out.println("hello1");
		for(int i = 0 ; i < 11 ; i++)
		{
			String s = String.valueOf(i+1);
			a[i] = request.getParameter("pl"+s);
			aa[i] = request.getParameter("sp"+s);
		}
		for(int j = 0;j<3;j++)
		{
			String k = String.valueOf(j+1);
			b[j] = request.getParameter("s"+k);
			bb[j] = request.getParameter("ss"+k);
		}
		out.println("hello1");
		try
		{
			
			Connection con = DatabaseConnection.initializeDatabase();
			String sqld = "delete from team";
			PreparedStatement pred = con.prepareStatement(sqld);
			pred.execute();
			//String sqld1 = "delete from team where squadpl = 'substitute'";
			//PreparedStatement pred1 = con.prepareStatement(sqld);
			//pred1.execute();
			for(int i = 0 ; i <11 ; i ++)
			{
			String sql = "insert into team(playername,role,squadpl)"+" values(?,?,?)";
			PreparedStatement preparedStmt = con.prepareStatement(sql);
			preparedStmt.setString(1,a[i]);
			preparedStmt.setString(2,aa[i]);
			preparedStmt.setString(3,"playing11");
			preparedStmt.execute();
			}
			
			for (int j = 0 ; j < 3 ; j ++)
			{
				String sql2 = "insert into team(playername,role,squadpl)"+" values(?,?,?)";
				PreparedStatement preparedStm = con.prepareStatement(sql2);
				preparedStm.setString(1,b[j]);
				preparedStm.setString(2,bb[j]);
				preparedStm.setString(3,"substitute");
				preparedStm.execute();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("clubmain.jsp");
		rd.forward(request, response);
	}
}