

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminMain
 */
@WebServlet("/AdminMain")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();     
		 HttpSession session = request.getSession();
		 String s = (String)session.getAttribute("mainemail");
	//	 out.println("<html><head></head><body onload=\"alert('hello')\"></body></html>");
	//	 out.println("<script type='text/javascipt'>");
	//   out.println("alert('hello')");
	//	 out.println("</script>");
		session.setAttribute("emailmain",s); 
		 if(request.getParameter("addmember") != null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("addplayer.jsp");
			rd.forward(request,response);
		}
		else if(request.getParameter("addmatch") != null)
		{
			RequestDispatcher rd = request.getRequestDispatcher("adminmatch.jsp");
			rd.forward(request,response);
		}
		
	}

}
